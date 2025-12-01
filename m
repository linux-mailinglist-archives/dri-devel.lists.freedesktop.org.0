Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCD4C96164
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 09:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B93710E2E1;
	Mon,  1 Dec 2025 08:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EL3ZXNZA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D2810E296
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 01:15:58 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-47755de027eso23543495e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 17:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764551757; x=1765156557; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+Y5hX1CqH3Pzk70YwUH5BikC9q1gOEENG1USkXY4XU=;
 b=EL3ZXNZApIsuR9vlkoGuo++Uo4hV9gZgVT9/fOwathUAkbQTWGD6rG/7C3BsCCJzUU
 y1iKG9H5pFBuGuoZjNGpK5gv5X+9Tpi7/LjNgvkFNwFicbkrRMbgOrFoOWzYsWAMTouh
 eYUgSJgh6sbcHOi9RUtNSjsW4yL+MSZebaDumUnopbzrMjFr6v8SqNxIzr0cvn3cg55Q
 ycOwma3SoSik87Z/FBMyq/WbtcJ/5wuPclQ3Dh7vMzHShneCQ81fXGEs+WN66XcrQ7OE
 13WeIpYuGY5S0O6AH3phrCLppSbIBqR+uo208I+jojSIydY+QrnXvGNxK3W8WMWQMSlx
 06Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764551757; x=1765156557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p+Y5hX1CqH3Pzk70YwUH5BikC9q1gOEENG1USkXY4XU=;
 b=aRgsFG/LZ0jPprAyI72bbIvlYlbIAu61e5B6D2py7fTGOMEanFxFzL4xRnIfMm9Zm4
 ReIg8AhHp/g+ycMVN1G9aVkeYGYYt/R6vciDD58O7rsbPqz7l00TY7ujEvHtknqBpNMC
 VPyHy15hTD4Qk5HGI47O6U9o6kuTDgeF6XGFpyzFC5MveuSitrB3GQDagrUbJuCdM0z6
 OEK7AYIuZ23TMpngDb8BbsNxdgDiOnKRc8QxlbvyYAMlO3s444www0Ce5hUCeNhJ1oiA
 zR+BKRuX0bZLMytpDVgtCSmbe9xp97wNhwQ6+yhWKyg+1nY4IiFOyU0z0zKmCcHRXf6v
 3jmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ9Q+wfhzUv5eAsaYs7wd9Hw/fOdjFzhqAtZcgXKH7p5/02KgWcamk/bRko20ElaE3E8HAUxOZPtE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhItMhU4UeBEM37gxoHIlEBtzpORVwtVqoW+Ioer08MRPF/hiZ
 EOCaGwjj8+zW7HsBBTcKtpKe8clGnzRlUaatVWwQu/N7kBbsKvCKYPVmw7mENw+Q
X-Gm-Gg: ASbGnct9+pYWAB0e6LA5t8nyrGvUaExxgSP+Vyrar+8M3SBOvph+gIFsicMBoTWNSE/
 vBNjyHTxPWaedytzhqjfMiwAEsDOd0kdnji5RRbSCbgqgTRbsIzsc8P67g9IFCJNRHvyD1/IwC/
 s3MZWUK7+rIZgo9x7IP/DO6A7UWzXHEDXnbtXI9Q5BNnpMgQy6dzlPswnzCEdg+TBgDqQlbdsiK
 duhzfH8X/BZYlOR0qA6QLy30ckVgx5JUVhnODmZYYGko/F3LMZyFB4o7ks6V166zND/3h4eVAl2
 Xf17vEwjCwAwHALxeDxFkL0vPE2IMLwtVxiQWj+H743MU0w7mo9qblxqqf7BCryrSiouKAy3bW0
 8VSp7GON5CKC/EbgLY0luq/f1MgOpBr8yR/ieEB2Fo/hv0rilezX6xSA7LKg7N3BLWsD/TVz9Mu
 YYrT3IODy9bPgn/nVPKmaJurW1FNABICK3dfTiubrhNmiB+UiiDRgq4A==
X-Google-Smtp-Source: AGHT+IHVL/BEiWldm0y8g1R198i5I9jbvyca4K2bOXMaJ5CPndp+saFe0w/sAbEG0HAV5P3htWvg4A==
X-Received: by 2002:a05:600c:3b0a:b0:477:9574:d641 with SMTP id
 5b1f17b1804b1-47904b1b2ecmr214675995e9.22.1764551756984; 
 Sun, 30 Nov 2025 17:15:56 -0800 (PST)
Received: from alarm (92.40.200.0.threembb.co.uk. [92.40.200.0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479110b6da9sm216152305e9.0.2025.11.30.17.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Nov 2025 17:15:56 -0800 (PST)
From: Dale Whinham <daleyo@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>, 
 Dale Whinham <daleyo@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v2 5/8] drm/msm/dp: Add dpcd link_rate quirk for Surface Pro
 11 OLED
Date: Mon,  1 Dec 2025 01:14:46 +0000
Message-ID: <20251201011457.17422-6-daleyo@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201011457.17422-1-daleyo@gmail.com>
References: <20251201011457.17422-1-daleyo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 01 Dec 2025 08:19:25 +0000
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

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

The Samsung ATNA30DW01-1 OLED panel in Microsoft Surface Pro 11 (Denali)
reports a max link rate value of 0 in the DPCD register, causing the
panel to fail to probe.

Add a quirk for this panel during DPCD read to set the max link rate
to 8.1Gbps (HBR3), which is the expected value as reported by the
"EDPOverrideDPCDCaps" block found in the DSDT (0x1E).

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Tested-by: Dale Whinham <daleyo@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c |  2 ++
 drivers/gpu/drm/msm/dp/dp_panel.c       | 14 ++++++++++++++
 include/drm/display/drm_dp_helper.h     |  7 +++++++
 3 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 4aaeae4fa03c..a533fbb2988d 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2543,6 +2543,8 @@ static const struct dpcd_quirk dpcd_quirk_list[] = {
 	{ OUI(0x00, 0x0C, 0xE7), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
 	/* Apple MacBookPro 2017 15 inch eDP Retina panel reports too low DP_MAX_LINK_RATE */
 	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
+	/* Samsung ATNA30DW01-1 OLED panel in Microsoft Surface Pro 11 reports a DP_MAX_LINK_RATE of 0 */
+	{ OUI(0xBA, 0x41, 0x59), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_8_1_GBPS) },
 };
 
 #undef OUI
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 15b7f6c7146e..6bcfefd457c4 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -91,6 +91,7 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 	int rc, max_lttpr_lanes, max_lttpr_rate;
 	struct msm_dp_panel_private *panel;
 	struct msm_dp_link_info *link_info;
+	struct drm_dp_desc desc;
 	u8 *dpcd, major, minor;
 
 	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
@@ -99,6 +100,19 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 	if (rc)
 		return rc;
 
+	rc = drm_dp_read_desc(panel->aux, &desc, drm_dp_is_branch(dpcd));
+	if (rc)
+		return rc;
+
+	/*
+	 * for some reason the ATNA30DW01-1 OLED panel in Microsoft Surface Pro 11
+	 * reports a max link rate of 0 in the DPCD register. Fix this to match the
+	 * EDPOverrideDPCDCaps value (0x1E) found in the ACPI DSDT
+	 */
+	if (drm_dp_has_quirk(&desc, DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_8_1_GBPS)) {
+		dpcd[1] = DP_LINK_BW_8_1;
+	}
+
 	msm_dp_panel->vsc_sdp_supported = drm_dp_vsc_sdp_supported(panel->aux, dpcd);
 	link_info = &msm_dp_panel->link_info;
 	link_info->revision = dpcd[DP_DPCD_REV];
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 87caa4f1fdb8..737ec5317666 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -820,6 +820,13 @@ enum drm_dp_quirk {
 	 * requires enabling DSC.
 	 */
 	DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC,
+	/**
+	 * @DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_8_1_GBPS:
+	 *
+	 * The device supports a link rate of 8.1 Gbps / HBR3 (0x1e) despite
+	 * the DP_MAX_LINK_RATE register reporting a lower max multiplier.
+	 */
+	DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_8_1_GBPS,
 };
 
 /**
-- 
2.52.0

