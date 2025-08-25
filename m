Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B41B33F13
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 14:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A73010E255;
	Mon, 25 Aug 2025 12:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="un5ESlkH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52FB10E255
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 12:15:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6E61F443B8;
 Mon, 25 Aug 2025 12:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F4BC4CEED;
 Mon, 25 Aug 2025 12:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756124123;
 bh=FYacGFcvtziYaQU23dkF5qhnNiOq+YUOP4jCmJ/AMb8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=un5ESlkHE/jiWQ4E7w+MIAM9BFrs7ubsGv3bHkx9mxVJvkwmG0FHmZOydp0W/iSt1
 ZyDJ/xT+9FwjUymkV61Vt8c2kUlYCso7GjA59LPhV8503jRYJuJqHe8t6J411TZMod
 slufIfhAYejxpbmfnTPe1aGvMMHd1ZFkT+5gbsMSVi1n9bSWAa0qhHPbJq+hGQ8Iph
 ZiUE7lVH1fpuOn0Vjk094HIuDQ/tkqyJcBkOsbsfxXUYuLpj80dboesibKEjCEt6ia
 QeoS5R5UqXl+AGXnjA/u/aNpS5kpp0tFJ3A44ppfZxZAUag3xJ/9zypter6lYfBsIz
 94/9r4/4Liofw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Piotr Zalewski <pZ010001011111@proton.me>,
 Diederik de Haas <didi.debian@cknow.org>,
 Andy Yan <andy.yan@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Sasha Levin <sashal@kernel.org>, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH AUTOSEL 6.16-6.12] drm/rockchip: vop2: make vp registers
 nonvolatile
Date: Mon, 25 Aug 2025 08:15:00 -0400
Message-ID: <20250825121505.2983941-11-sashal@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825121505.2983941-1-sashal@kernel.org>
References: <20250825121505.2983941-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16.3
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Piotr Zalewski <pZ010001011111@proton.me>

[ Upstream commit a52dffaa46c2c5ff0b311c4dc1288581f7b9109e ]

Make video port registers nonvolatile. As DSP_CTRL register is written
to twice due to gamma LUT enable bit which is set outside of the main
DSP_CTRL initialization within atomic_enable (for rk356x case it is also
necessary to always disable gamma LUT before writing a new LUT) there is
a chance that DSP_CTRL value read-out in gamma LUT init/update code is
not the one which was written by the preceding DSP_CTRL initialization
code within atomic_enable. This might result in misconfigured DSP_CTRL
which leads to no visual output[1]. Since DSP_CTRL write takes effect
after VSYNC[1] the issue is not always present. When tested on Pinetab2
with kernel 6.14 it happenes only when DRM is compiled as a module[1].
In order to confirm that it is a timing issue I inserted 18ms udelay
before vop2_crtc_atomic_try_set_gamma in atomic enable and compiled DRM
as module - this has also fixed the issue.

[1] https://lore.kernel.org/linux-rockchip/562b38e5.a496.1975f09f983.Coremail.andyshrk@163.com/

Reported-by: Diederik de Haas <didi.debian@cknow.org>
Closes: https://lore.kernel.org/linux-rockchip/DAEVDSTMWI1E.J454VZN0R9MA@cknow.org/
Suggested-by: Andy Yan <andy.yan@rock-chips.com>
Signed-off-by: Piotr Zalewski <pZ010001011111@proton.me>
Tested-by: Diederik de Haas <didi.debian@cknow.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Link: https://lore.kernel.org/r/20250706083629.140332-2-pZ010001011111@proton.me
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my analysis of the commit, let me provide my determination:

**Backport Status: YES**

## Extensive Analysis:

This commit is a strong candidate for backporting to stable kernel trees
for the following reasons:

### 1. **Bug Fix Nature**
The commit fixes a real bug that causes **no visual output** on
displays. This is a critical user-visible issue where the display driver
fails to produce any image output. The commit message clearly describes
this as fixing a situation where "misconfigured DSP_CTRL which leads to
no visual output."

### 2. **Race Condition Fix**
The code changes address a race condition in register access patterns.
The issue occurs because:
- DSP_CTRL register is written twice during atomic_enable
- The second write happens for gamma LUT configuration
- Due to the register being volatile, read-modify-write operations can
  read stale values
- DSP_CTRL writes only take effect after VSYNC, creating a timing window
  for the race

### 3. **Small and Contained Change**
The actual code change is minimal - just one line adding the VP register
range to the nonvolatile list:
```c
+       regmap_reg_range(RK3568_VP0_CTRL_BASE, RK3588_VP3_CTRL_BASE +
255),
```

This makes the video port registers (0xc00-0xeff based on the offsets)
use the regmap cache instead of reading back from hardware, preventing
the race condition.

### 4. **Hardware-Specific Fix**
The fix is specific to Rockchip VOP2 hardware (RK3568/RK3588 SoCs) and
doesn't affect other subsystems. It's confined to the DRM/Rockchip
display driver.

### 5. **Tested and Confirmed**
The commit includes:
- A "Reported-by" tag indicating a real user issue
- A "Tested-by" tag confirming the fix works
- Clear reproduction details (happens on Pinetab2 with kernel 6.14 when
  DRM is compiled as module)

### 6. **Low Risk of Regression**
The change only affects how registers are cached in the regmap
framework. It doesn't change any functional logic, algorithms, or
introduce new features. The comment update accurately reflects that both
window AND video port registers are now marked as non-volatile for cache
coherency.

### 7. **Follows Stable Rules**
This fix aligns with stable kernel rules:
- Fixes a real bug that users are hitting
- Small change (essentially 1 line of functional code)
- Already tested by reporter
- Fix is obvious once the problem is understood
- No new features or architectural changes

### 8. **Critical Display Functionality**
Display output is fundamental functionality. A bug that causes "no
visual output" severely impacts usability of devices using these SoCs,
making this a high-priority fix for stable trees.

The commit properly documents the issue with external references and
follows good practices for a bug fix that should be backported to stable
kernels.

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 186f6452a7d3..b50927a824b4 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2579,12 +2579,13 @@ static int vop2_win_init(struct vop2 *vop2)
 }
 
 /*
- * The window registers are only updated when config done is written.
- * Until that they read back the old value. As we read-modify-write
- * these registers mark them as non-volatile. This makes sure we read
- * the new values from the regmap register cache.
+ * The window and video port registers are only updated when config
+ * done is written. Until that they read back the old value. As we
+ * read-modify-write these registers mark them as non-volatile. This
+ * makes sure we read the new values from the regmap register cache.
  */
 static const struct regmap_range vop2_nonvolatile_range[] = {
+	regmap_reg_range(RK3568_VP0_CTRL_BASE, RK3588_VP3_CTRL_BASE + 255),
 	regmap_reg_range(0x1000, 0x23ff),
 };
 
-- 
2.50.1

