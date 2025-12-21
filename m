Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281FECD4594
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 21:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6855310E3F0;
	Sun, 21 Dec 2025 20:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dionne-riel-com.20230601.gappssmtp.com header.i=@dionne-riel-com.20230601.gappssmtp.com header.b="waWLsq+X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A8010E137
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 18:57:25 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-8ba3ffd54dbso472485685a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 10:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dionne-riel-com.20230601.gappssmtp.com; s=20230601; t=1766343444;
 x=1766948244; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WzflaSsiYM5RcS3Ea860s0StnmCiJorGbw0UXQAd7l4=;
 b=waWLsq+XXWLU0tACp/BGz15eMy8CY2ukquPEw2btPOsE3KGNiBp1z6OFXEmWjxNw9t
 48XXB1ew5v4MOH69JjQ8KK7mFpybYXmmx3vIXN5qmQpp8OWxi3qgPW9IPDRSdx7hUPIZ
 +MWkIfTMv7cYkYB+ZkEKgV+BjmjzCiOVqnv2m4WyR+lE7tCHW1aG3cpKqZjMxU/2p21E
 q8p4fe4mL4CPsf1GEBmiurWkeAHN+EVmiPyCQwE/YlZyUG9hCZEaIqqtbvf8avE5AA76
 UGiPx4GI5VAwDGrD/AUmvqB1amqGgkGYo6D9g/Gbza2Q5siUyj+KPP3B4Y4dfp55iace
 Zd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766343444; x=1766948244;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WzflaSsiYM5RcS3Ea860s0StnmCiJorGbw0UXQAd7l4=;
 b=GNCsol1T3XtB0wio7TsBfF9oTB6px1jTKc/5+1sTOd4y4dHpwZZ4pJD7TEOyk4RKTZ
 2tRw4s8vLRPEw/CSucnfnluIsyoiDHp+GlMqt1KFYkPdanr2O5ToeGRcxZPgwwweOqOx
 BWrgfqlbSOiDYLEKBSsfZUELM1SStQboZ6Y/u6ZFUGw4H0ON/nqDiZehTFALPQIfh/ZE
 9tamWdiXdhcFVqHjTbzLipD8AD3qzqwZpQ91fDBSnDbaqDZ6TKdfoY/mm3NsdAIb2WHQ
 1p9/kV3Aq8hsMKazOEmbLnPu2DGFd9Icl51Bh3x4B5gid4JPGMiWQyNFWMrO6TryL1A3
 biwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5FAgmLruidzoRJi894dxZU9xiO3eMrcshCNtHE8CEpDq3pzWOi5ccsvdhaLOH4Z5yEIQM39tlfK0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpMqbp0IVa4jTovUmkt2320Ltp2DHY3xb2aQpt7Blr6dJQoexd
 aygEbKd0N7fPDeW+0KBPTbv5iQaPzNtnGg8tMNMsCRk77d8LJflMgXwqWPlGTFCEsQ==
X-Gm-Gg: AY/fxX6YROrebatY2aoyVB/DQZGgraT4riu+j0rYODjJRkfb+zAMGTz29ApSCP5iAfM
 hJ5L0nrMX3FYhM04+UKCnL8r/Sg+iHc58bcswcUB2T2GMla72Ni8hfgfPbIR7Km3mamk1nXg/Rp
 Aj5ZRAci3QaoRCyc9R4DQPUIXChk2IlJq30HWDbJcTZ9EPpHTSHnxp811CauJTqQD1cOf8cZLrs
 aTtE2JutWj+7Xn9vle0aO3wrlWhMI9oNXDd03v+VaW/wNCbo+XDUK1JCMPbLz4L/LFTsldLyr66
 qgAKVCwR5LQPWay69okbrmA4gDVlTUY3ZnkpqYckA7JbDdibg57uGJH6lgRcWJAeN5S6f05MG06
 FOq7yXW432HMtb5C3AJlPSwkddhk7MmA+nRAvTvmK2YTCQA2/eUsU+xd0AU9KLvQR2j8ARsrnZn
 Gj8oEPSxxNQuAM83uDjKmR5/b4g4s6WaipNBnFuZ/CQIrdcOTBZY1CJlxkItfWEV26jIKgCc0x8
 iXQzs6V9tUPsM4=
X-Google-Smtp-Source: AGHT+IGOSPjin9sloBqYFl2DX/9Rxpf9bX5+EM0QsbyPqPIyYzApvsYMTH4jzHfkRZTridy24j6lVg==
X-Received: by 2002:a05:620a:2914:b0:861:119b:3052 with SMTP id
 af79cd13be357-8c08fa9c447mr1266533585a.51.1766343444359; 
 Sun, 21 Dec 2025 10:57:24 -0800 (PST)
Received: from frankgrimes.elk-nominal.ts.net (135-23-195-66.cpe.pppoe.ca.
 [135.23.195.66]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c09678393bsm671296985a.6.2025.12.21.10.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Dec 2025 10:57:23 -0800 (PST)
From: Samuel Dionne-Riel <samuel@dionne-riel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Samuel Dionne-Riel <samuel@dionne-riel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: panel-backlight-quirks: Add Minisforum V3 SE
Date: Sun, 21 Dec 2025 13:56:09 -0500
Message-ID: <20251221185608.2718273-3-samuel@dionne-riel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 21 Dec 2025 20:27:00 +0000
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

Exactly the same situation as with the Framework 13. Value from
ATIF is 12, which is quite bright as a minimum.

Additionally, disabling the custom curve produces a much more granular
control, especially at lower brightness values. For now this can be done
by the end-user by using `amdgpu.dcdebugmask=0x40000`.

Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>
---
 drivers/gpu/drm/drm_panel_backlight_quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
index 537dc6dd05343..64a1c1f7abe76 100644
--- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
+++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
@@ -60,6 +60,14 @@ static const struct drm_get_panel_backlight_quirk drm_panel_min_backlight_quirks
 		.dmi_match_other.value = "Galileo",
 		.quirk = { .min_brightness = 1, },
 	},
+	/* Minisforum V3 SE */
+	{
+		.dmi_match.field = DMI_BOARD_VENDOR,
+		.dmi_match.value = "Shenzhen Meigao Electronic Equipment Co.,Ltd",
+		.dmi_match_other.field = DMI_PRODUCT_NAME,
+		.dmi_match_other.value = "V3 SE",
+		.quirk = { .min_brightness = 1, },
+	},
 	/* Have OLED Panels with brightness issue when last byte is 0/1 */
 	{
 		.dmi_match.field = DMI_SYS_VENDOR,
-- 
2.51.0

