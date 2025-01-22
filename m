Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF894A18D95
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 09:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A8010E1DE;
	Wed, 22 Jan 2025 08:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="ax5o/bxT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C6610E1DE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 08:24:48 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2f78a4ca5deso6357709a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 00:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1737534228; x=1738139028; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1eoGo501A1lPIrAblVFLn0zExfwniV9VkQNrE/D29l4=;
 b=ax5o/bxT1ghG1qXhzXk9CVq+mA7A/l9gsDBkGP/j1QfIzHlo/b/MHAoAmu12ko7YBp
 zQHY19KTgrlITrfRhDEdjNxlRCiEDo2CV0NBbrijXpDjtox8M00iX10RUBKYpDffHjER
 ZpjDK5RCNuBfZwD/SiBrahozsICWMRoBrqbKvmTf+WvhBNuCqJnKyOmokxbnDxl4OroO
 krXx3cdrSgnEL7o+NEaWGC5xV77Al4HBgcgCxR9wwmqc727kaXBfPmrBYXzs8rL6a8Do
 DWY21z0//O+Ib7WHlfKGGWPlgLthcYzh7qYrIVjEpEYCO9uDkoFYBCCjJFXndzRqkMJF
 WqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737534228; x=1738139028;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1eoGo501A1lPIrAblVFLn0zExfwniV9VkQNrE/D29l4=;
 b=gfL6uMfH8HCUL4h2GON6tp+KpCOdyhokgcUYk2xh0UGk1b3usug5Vf170LFO0c9ncO
 ZAR+CGgAgZiUKwaZ7561+uWLX9XUEdrXDUYarabyfk+M0zEOkY/pkZb9W/gm3cXhazTl
 TVy3amo09hM3gtCyMHRRgYX7qii6e/D4Aa2GMGxfbiRrvsbv5bVv8k9O6ayDwQ9hWURG
 U18oZPRerrPrhl6SxGfY2wsSPeyVIUuThWQ1owi0sLLfutoX/+cHtJvMd4yv/i8fU/2+
 NMHSnlHM8oBA0jDxZcT2DYGiCPqoovzr7wAtJxB160CNu9mmrMdVrWSui6UmLWt5IKQJ
 zpGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmBYgeSnT6WxWc/STLSFxoxmU94CPNapqaA39nCQCp1zDKcirdNDf18IyPsFYP2N9pNZhOEXX6tpM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwknLoYr9CtUO9txlA97iNkV63QjfVa1lEPvon2hcxelLtw6w+2
 jP32ruWx99EGUzPOZECBXHllR4FlL7CrUD8aQDytLCguVhuBI1/VCqZB7laVe/o1s5aHHTowPPi
 5
X-Gm-Gg: ASbGncvZ6bZeYhe8UU+mviVkH41qk4HOrBlk47UTDiMseCSPW6ambTCTBwZK1Mq/W1d
 0DfbdMqGj4Prsf+1vMIMSntTrzVUfyoqqWTqVS6IzFpuMPbIGLjtAcBo5dkCswyo13mbpxb+Oks
 +/FYkdn2zlSjoAM6NhLaSM7ePqMXG/Q+2D+Ua9vpiLulAjvIxmabeBU5OP64CbTV3yzLH7iJ8FK
 4iWWpy0jcX6xBMv02zfResh9Km2mBhEfXl2rU8zah/wYZfXlRA0jTjwgiNEhm8UYd7aGzck00tP
 3bMj6y620KJWtAkVNW6GgnTOJgeew8MfKjX78T5Fuw==
X-Google-Smtp-Source: AGHT+IEVARNiMRvn4jrKGvIQB9HHW7bki6U2L2id2vgsonP+1GP7pk/8cb6P3EDZ7E4gojx6kxdI3Q==
X-Received: by 2002:a17:90b:2e4b:b0:2ee:5bc9:75b5 with SMTP id
 98e67ed59e1d1-2f782c51387mr29391430a91.4.1737534228527; 
 Wed, 22 Jan 2025 00:23:48 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7e6aa608csm957498a91.27.2025.01.22.00.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 00:23:48 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Add STA 116QHD024002
Date: Wed, 22 Jan 2025 16:23:40 +0800
Message-Id: <20250122082340.1603169-1-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
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

Add support for the STA 116QHD024002, pleace the EDID here for
subsequent reference.

00 ff ff ff ff ff ff 00 4e 81 09 00 00 00 00 00
26 21 01 04 a5 1a 0e 78 02 1e b5 9a 5f 57 94 26
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 8e 1c 56 a0 50 00 1e 30 28 20
55 00 00 90 10 00 00 18 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 fe 00 20
20 20 20 20 20 0a 20 20 20 20 20 20 00 00 00 fe
00 31 31 36 51 48 44 30 32 34 30 30 32 0a 00 3b

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 1721a3397dbf..73b8938f175b 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1808,6 +1808,13 @@ static const struct panel_delay delay_200_150_e50 = {
 	.enable = 50,
 };
 
+static const struct panel_delay delay_200_500_e250_po2e200 = {
+	.hpd_absent = 200,
+	.unprepare = 500,
+	.enable = 250,
+	.powered_on_to_enable = 200,
+};
+
 #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name) \
 { \
 	.ident = { \
@@ -1998,6 +2005,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1593, &delay_200_500_p2e100, "LQ134N1"),
 
 	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0004, &delay_200_500_e200, "116KHD024006"),
+	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0009, &delay_200_500_e250_po2e200, "116QHD024002"),
 	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0100, &delay_100_500_e200, "2081116HHD028001-51D"),
 
 	{ /* sentinal */ }
-- 
2.34.1

