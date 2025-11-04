Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DE0C328D7
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1EB610E65D;
	Tue,  4 Nov 2025 18:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W9UKxbtO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B8B10E65D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:10:36 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-47756a07b34so5042825e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279835; x=1762884635; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ejkL8TsFG1o5XiPy9Gcy/NzA7/ogTbLjmhfX6D7QHow=;
 b=W9UKxbtObIDpXIlyX3mSzcMGVoDHRCzz2lW6tPBU/DMMOcOi+C7ffEwjMzo2IlsuPb
 QVXwFLEEvUoY2Hi69f75CSN64F/qxLsvvUOSFrPrk8dDpeHUJIZ2UIonhXDSwh6MvQg0
 6DecWEuHS5EAUJt43UOhprMqlgtiiXFn3A6AJRuHWq6RRYXgz/yUgTGJHSAsF+/3MFoi
 MnEMF+y5SY559auYtWx36gIPISm1v/F140xmW8RsYL1LbJCatwg+XBpO9DuQkyK3209A
 UPv5HjHTpzpfI+QXWW5ok5A147I3xgAOvxMVLnl/3isqfOJoHtCmkhES4CPEXN+UOCoa
 uk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279835; x=1762884635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ejkL8TsFG1o5XiPy9Gcy/NzA7/ogTbLjmhfX6D7QHow=;
 b=hK52hkslMnt8ax24EFdREDl6zdfqQy56IkkRV8tVORiBRHJtLnSBpmhvzlSxxAsQZM
 6RHCZzDv+6x6qPrS+VK5Nsb9HjWzEIxey79FmPqOO6p4iGqGAlcMdPDaMOPxMLFojAKQ
 fnFhX4ciYvWsXLbPjRRIBljkr0h1z1bS5AJX13uw9WmSYoAD+rAfzU828hqIhNMiO4Gn
 8HwJnFA0URLLJe0rmTqftnJoyI2gXINw9LS6fX/omaKUCi8rYtX07vEGmH/uMxh9vFPs
 0N0uq6mMIMYrtLTHUW5fZenqgRvVar9EG7jxzYZZRdo1iyHVWttbmeL5himY2vusyKGO
 pwsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwyYftXQ2YsqMkbJtw2Y74oBNABjx80TjpUjfgfbCgZEDGQyq1N46h+RVYWjuGIWvWibCEPHM57r4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQpIIhwdw3l+nQXbDq1gjb96Njj0GznVNylTO9fgZAWBa2rNQS
 HRjresX1EQ3ue86qw3PGQ7o2ZQMkKZkfpbtUPq7HUO7JEb36XHZh7XE/
X-Gm-Gg: ASbGnctSFu1SUv2lQrNzQCxPMiwV/wpWJ/oX3hK25O0/HYhbFoUkRU3XCeWuuhMMToP
 XGmGcHTKnG6en8oL8A3ovkS0uKSD34mqWp5pvvPAsxb+BxSklTwb6GqJlPfQhS3h6UmLHDwKobO
 zfY2ljKoRR9ofwILmF1cIMuJvIQ7FGrnbmMWFrrr3b2ckWvmo1+irJdJO0ysHbgpR+6sbpZv6Yp
 /1Vriz5AS++UVnLL0Iatg4G7W3SvKBZSrkesg6ctYMsQqu/d7NsTbh0FJw87+dghrzhT6r4nsNF
 DNOPDyIU6uv8oxOxgPePKu1tCYs687SPGv8Q7SulLf2RdMaDJvsYnIBikDk4iXGqkp1BsBQKf8W
 VFm6cBPdnISAc5vnGSqTgIePbYxLfsh3YSV0LLcR/5OBHCKFPNY4K0EvJKUHw9V1+r/DGRpUtpQ
 vWnFPCFs+zEtY7uvHFgQ==
X-Google-Smtp-Source: AGHT+IGULxezyFxQaS+IhExoUiRMdNFxErCJ8jQuxzUcsuWhQgiYwKFm3qElEomNCT+mnTz7K/5UIQ==
X-Received: by 2002:a05:600c:5488:b0:45b:9a46:69e9 with SMTP id
 5b1f17b1804b1-4775ce14dd0mr2937075e9.31.1762279834562; 
 Tue, 04 Nov 2025 10:10:34 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:10:34 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 26/30] drm/sun4i: mixer: Add quirk for number of VI scalers
Date: Tue,  4 Nov 2025 19:09:38 +0100
Message-ID: <20251104180942.61538-27-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
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

On DE2 and DE3, UI scalers are located right after VI scalers. So in
order to calculate proper UI scaler base address, number of VI scalers
must be known. In practice, it is same as number of VI channels, but it
doesn't need to be.

Let's make a quirk for this number. Code for configuring channels and
associated functions won't have access to vi_num quirk anymore after
rework for independent planes.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v2:
- switched position of vi_scaler_num quirk

 drivers/gpu/drm/sun4i/sun8i_mixer.c     | 11 +++++++++++
 drivers/gpu/drm/sun4i/sun8i_mixer.h     |  2 ++
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c | 10 +++++-----
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 78bbfbe62833..da3148f42646 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -705,6 +705,7 @@ static void sun8i_mixer_remove(struct platform_device *pdev)
 static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
@@ -715,6 +716,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
 static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
@@ -726,6 +728,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 432000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
@@ -737,6 +740,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
@@ -748,6 +752,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
@@ -759,6 +764,7 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
 	.de_type = SUN8I_MIXER_DE2,
 	.vi_num = 2,
 	.ui_num = 1,
+	.vi_scaler_num	= 2,
 	.scaler_mask = 0x3,
 	.scanline_yuv = 2048,
 	.ccsc = CCSC_MIXER0_LAYOUT,
@@ -769,6 +775,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
 	.ccsc		= CCSC_D1_MIXER0_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
@@ -780,6 +787,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0x1,
 	.scanline_yuv	= 1024,
 	.de2_fcc_alpha	= 1,
@@ -791,6 +799,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
 	.de2_fcc_alpha	= 1,
@@ -802,6 +811,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
@@ -812,6 +822,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.de_type	= SUN8I_MIXER_DE3,
 	.mod_rate	= 600000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
 	.ui_num		= 3,
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index def07afd37e1..8c2e8005fc5b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -167,6 +167,7 @@ enum sun8i_mixer_type {
  * struct sun8i_mixer_cfg - mixer HW configuration
  * @vi_num: number of VI channels
  * @ui_num: number of UI channels
+ * @vi_scaler_num: Number of VI scalers. Used on DE2 and DE3.
  * @scaler_mask: bitmask which tells which channel supports scaling
  *	First, scaler supports for VI channels is defined and after that, scaler
  *	support for UI channels. For example, if mixer has 2 VI channels without
@@ -183,6 +184,7 @@ enum sun8i_mixer_type {
 struct sun8i_mixer_cfg {
 	int		vi_num;
 	int		ui_num;
+	unsigned int	vi_scaler_num;
 	int		scaler_mask;
 	int		ccsc;
 	unsigned long	mod_rate;
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
index c0947ccf675b..0ba1482688d7 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
@@ -91,16 +91,16 @@ static const u32 lan2coefftab16[240] = {
 
 static u32 sun8i_ui_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
-	int vi_num = mixer->cfg->vi_num;
+	int offset = mixer->cfg->vi_scaler_num;
 
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_VI_SCALER_UNIT_BASE +
-		       DE3_VI_SCALER_UNIT_SIZE * vi_num +
-		       DE3_UI_SCALER_UNIT_SIZE * (channel - vi_num);
+		       DE3_VI_SCALER_UNIT_SIZE * offset +
+		       DE3_UI_SCALER_UNIT_SIZE * (channel - offset);
 	else
 		return DE2_VI_SCALER_UNIT_BASE +
-		       DE2_VI_SCALER_UNIT_SIZE * vi_num +
-		       DE2_UI_SCALER_UNIT_SIZE * (channel - vi_num);
+		       DE2_VI_SCALER_UNIT_SIZE * offset +
+		       DE2_UI_SCALER_UNIT_SIZE * (channel - offset);
 }
 
 static int sun8i_ui_scaler_coef_index(unsigned int step)
-- 
2.51.2

