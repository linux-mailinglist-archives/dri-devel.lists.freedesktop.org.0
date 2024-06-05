Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E1A8FCB8F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 14:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73B510E63E;
	Wed,  5 Jun 2024 12:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lqmUp035";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EC610E4D7;
 Wed,  5 Jun 2024 12:03:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 87098CE1773;
 Wed,  5 Jun 2024 12:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296CDC3277B;
 Wed,  5 Jun 2024 12:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717588976;
 bh=cpLQBDYTpOjTj5+0cqgMMLMfiWdRzQ2aqkxE/qjxEpE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lqmUp035nxaOYeI3ndmNaqokZJeYb9dlNMEga2KXNlm1ox5mqQpd4Toie3YngqjO4
 6dKQrHRM4C70UzIJPZu/VOi2wgFCAjyYTmkdTK26ydwHD5kg3ouYu5ILw7f3nFaIQa
 cEAD9ER7Vee+iNKJfFRBZ1QWrCAQltJX73Z3+ZpQqs/F2JjjWtckwtOMUh6r7n+vbJ
 ne7xdxWDBY3x550xE5IrZ08gbF0jwlMxf0sYBdxRb09j2aIf5JMduxXqclyzh9zIPy
 0M1JhnxpjAMsfH6bnJ/D6Hm4tZqEoZpiD1D1INADYz9nY6B+kYTo9tgzNT/30Hmnwo
 gneHFCaeDkwCQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sasha Levin <sashal@kernel.org>, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Hawking.Zhang@amd.com, candice.li@amd.com,
 aurabindo.pillai@amd.com, Le.Ma@amd.com, li.ma@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 19/23] drm/amdgpu: silence UBSAN warning
Date: Wed,  5 Jun 2024 08:02:02 -0400
Message-ID: <20240605120220.2966127-19-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605120220.2966127-1-sashal@kernel.org>
References: <20240605120220.2966127-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.3
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

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 05d9e24ddb15160164ba6e917a88c00907dc2434 ]

Convert a variable sized array from [1] to [].

Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/include/atomfirmware.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/gpu/drm/amd/include/atomfirmware.h
index af3eebb4c9bcb..f732182218330 100644
--- a/drivers/gpu/drm/amd/include/atomfirmware.h
+++ b/drivers/gpu/drm/amd/include/atomfirmware.h
@@ -3540,7 +3540,7 @@ struct atom_gpio_voltage_object_v4
    uint8_t  phase_delay_us;                      // phase delay in unit of micro second
    uint8_t  reserved;   
    uint32_t gpio_mask_val;                         // GPIO Mask value
-   struct atom_voltage_gpio_map_lut voltage_gpio_lut[1];
+   struct atom_voltage_gpio_map_lut voltage_gpio_lut[] __counted_by(gpio_entry_num);
 };
 
 struct  atom_svid2_voltage_object_v4
-- 
2.43.0

