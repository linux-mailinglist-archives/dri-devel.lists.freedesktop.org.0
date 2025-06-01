Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D99ACA132
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B55610E25E;
	Sun,  1 Jun 2025 23:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TcbVy5OL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A3510E25E
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jun 2025 23:25:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D56174A61D;
 Sun,  1 Jun 2025 23:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 769EFC4CEF1;
 Sun,  1 Jun 2025 23:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748820324;
 bh=P4Zd3p3LKhfy5AS+Eq3Yw96Ok2iEUmG+zgb5jzPB74w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TcbVy5OLrqPDznql5qVH9iKSAbTsEV2v+LiZ/M6Xh+Nid2odKgSmyDmONA4xVDp6r
 EhZ9GyY7kzNdbzYf2jwk8gY2fSivyAD2vn1wG9AX/cuwahMDsP5e2jcLQMRIvEwBne
 zZzTE+/LPjO17PA8I0Iuutkc3mS7UBfLR1go3SrJJP6YnYOKElgMJeZxANasTaXMWu
 vDvDKZCNM1juWMtjP5ZnUjDsjEQM6YUPR1o9CMuV3sGKw6l+g5gl8HoPWmu8niDgtf
 lL5egzPLqWVALRAZLnPPshTPeV+sNS39ZQWAqZjYqtAQX96yCLbA89jSI8rF8B5Nbu
 dNLbkIjkKis5g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Sasha Levin <sashal@kernel.org>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org,
 dianders@chromium.org, wenst@chromium.org, treapking@chromium.org,
 xji@analogixsemi.com, robh@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 018/110] drm/bridge: anx7625: change the
 gpiod_set_value API
Date: Sun,  1 Jun 2025 19:23:00 -0400
Message-Id: <20250601232435.3507697-18-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232435.3507697-1-sashal@kernel.org>
References: <20250601232435.3507697-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Content-Type: text/plain; charset=UTF-8
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

From: Ayushi Makhija <quic_amakhija@quicinc.com>

[ Upstream commit 50935044e58e563cdcfd556d62f27bc8744dd64e ]

Use gpiod_set_value_cansleep() instead of gpiod_set_value()
to fix the below call trace in the boot log:

[    5.690534] Call trace:
[    5.690536]  gpiod_set_value+0x40/0xa4
[    5.690540]  anx7625_runtime_pm_resume+0xa0/0x324 [anx7625]
[    5.690545]  __rpm_callback+0x48/0x1d8
[    5.690549]  rpm_callback+0x6c/0x78

Certain GPIO controllers require access via message-based buses
such as I2C or SPI, which may cause the GPIOs to enter a sleep
state. Therefore, use the gpiod_set_value_cansleep().

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://lore.kernel.org/r/20250505094245.2660750-7-quic_amakhija@quicinc.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees.
**Detailed Analysis:** **1. Bug Fix Nature:** The commit fixes a real
runtime issue that produces call traces in the boot log. The commit
message clearly shows a call trace stack: ``` [ 5.690534] Call trace: [
5.690536] gpiod_set_value+0x40/0xa4 [ 5.690540]
anx7625_runtime_pm_resume+0xa0/0x324 [anx7625] ``` This indicates users
are experiencing actual crashes or warnings when using this driver with
certain GPIO controllers. **2. Small, Contained Fix:** The code changes
are minimal and surgical - only 4 lines changed, replacing
`gpiod_set_value()` with `gpiod_set_value_cansleep()` in the
`anx7625_power_on()` and `anx7625_power_standby()` functions: - Line
1260: `gpiod_set_value(ctx->pdata.gpio_p_on, 1)` →
`gpiod_set_value_cansleep(ctx->pdata.gpio_p_on, 1)` - Line 1263:
`gpiod_set_value(ctx->pdata.gpio_reset, 1)` →
`gpiod_set_value_cansleep(ctx->pdata.gpio_reset, 1)` - Line 1283:
`gpiod_set_value(ctx->pdata.gpio_reset, 0)` →
`gpiod_set_value_cansleep(ctx->pdata.gpio_reset, 0)` - Line 1285:
`gpiod_set_value(ctx->pdata.gpio_p_on, 0)` →
`gpiod_set_value_cansleep(ctx->pdata.gpio_p_on, 0)` **3. Well-
Established Pattern:** Looking at the similar commits provided as
reference, this exact type of GPIO API fix is common and consistently
handles the same underlying issue. All 5 similar commits (marked as "NO"
for backport) show the same pattern of switching from
`gpiod_set_value()` to `gpiod_set_value_cansleep()` to handle GPIO
controllers on message-based buses (I2C/SPI). **4. Technical
Correctness:** The fix is technically sound. These functions are called
during power management operations (`anx7625_power_on()` and
`anx7625_power_standby()`) where sleeping is acceptable and expected.
The `_cansleep` variant is the correct API when GPIO controllers might
be accessed via slow buses like I2C or SPI. **5. Low Risk:** The change
has minimal risk of regression. The `gpiod_set_value_cansleep()`
function provides the same functionality as `gpiod_set_value()` but
allows sleeping, making it safe to use in contexts where the original
was used incorrectly. **6. Critical Subsystem Impact:** This affects the
DRM bridge subsystem and display functionality. Users with anx7625
bridge chips connected to I2C GPIO expanders would experience boot-time
call traces, which is a user-visible issue that should be fixed in
stable kernels. **7. Real Hardware Impact:** The commit specifically
mentions "Certain GPIO controllers require access via message-based
buses such as I2C or SPI" - this is a real hardware configuration that
users deploy, not an edge case. This commit meets all the criteria for
stable backporting: it fixes a user-visible bug, has minimal risk, is
contained to a single driver, and follows an established pattern for
this type of GPIO API fix.

 drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 99ef3f27ae429..95d5a4e265788 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1257,10 +1257,10 @@ static void anx7625_power_on(struct anx7625_data *ctx)
 	usleep_range(11000, 12000);
 
 	/* Power on pin enable */
-	gpiod_set_value(ctx->pdata.gpio_p_on, 1);
+	gpiod_set_value_cansleep(ctx->pdata.gpio_p_on, 1);
 	usleep_range(10000, 11000);
 	/* Power reset pin enable */
-	gpiod_set_value(ctx->pdata.gpio_reset, 1);
+	gpiod_set_value_cansleep(ctx->pdata.gpio_reset, 1);
 	usleep_range(10000, 11000);
 
 	DRM_DEV_DEBUG_DRIVER(dev, "power on !\n");
@@ -1280,9 +1280,9 @@ static void anx7625_power_standby(struct anx7625_data *ctx)
 		return;
 	}
 
-	gpiod_set_value(ctx->pdata.gpio_reset, 0);
+	gpiod_set_value_cansleep(ctx->pdata.gpio_reset, 0);
 	usleep_range(1000, 1100);
-	gpiod_set_value(ctx->pdata.gpio_p_on, 0);
+	gpiod_set_value_cansleep(ctx->pdata.gpio_p_on, 0);
 	usleep_range(1000, 1100);
 
 	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->pdata.supplies),
-- 
2.39.5

