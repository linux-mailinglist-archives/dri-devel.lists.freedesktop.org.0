Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF17560C439
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B234510E126;
	Tue, 25 Oct 2022 06:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD9D10E3A9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:36:57 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 u8-20020a17090a5e4800b002106dcdd4a0so12708870pji.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 04:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c3/qt1OzaBc9a5GsaEcxXWSHAm3X31gczykCRrhGnKw=;
 b=lOEcU4RGCEfGg+wnfVs0l7n30cTg9FbZcgkthaptWevuzG9Ssi+9oWFgfDpyitG3Tk
 OuLI1JcLxzeALUawRzgQ4OCHUQAGKneDBweTsEC2z2rv/dy7b2CVz85QxzVHNDeK3Mlb
 xsxvq1aCJ5rCSCJDSgTd1x0eL49i7F01FPf3bevhsJTjMKGOtn1fRwPcWjyhr7lR2spk
 XeIQqVeTz/3QdhnRwjU1wp6PSyaOIKZ5MzRhwmkzlX7C/eeOdJtAKw9fT8Pc1B5311gv
 y6ZojtRQW/tr/7t2nMkDZNTzuYYeLPsaTucm9GFd6bYXgmrWG6KMd06zb2097bHNbdj6
 vLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c3/qt1OzaBc9a5GsaEcxXWSHAm3X31gczykCRrhGnKw=;
 b=hfIZ9yO4Bu/MOle0i5DYi8sNLj5qSc+A5wNDKbr2GZimu6kLN1FZq9dCf3F8BW0L5V
 7ZHkbMSInbQS2OGS3oVyA4Ja3OovWMVQ5xx30RcK5jEE8RqzyYVlDNCrx1KNEXONxnFb
 7eVPWbY652XXrjs3Yr+DgazasGGuHGAv6MXz95PcRgkCwM1voMSVGurCkrvzbvIolBUB
 2q8E1sWBT1upsv6vLR/NJWSsp3OMW9AIa36zjSi6bYqfy4MW+uBcVeynnAktkor10oFI
 DrQNWNdduPKCcz2kwGBi1pFCH1y5a6+HDjY6qG2nVKOvzMn1pkbkdUw4im+z7cvtfXZ+
 8RLw==
X-Gm-Message-State: ACrzQf3xLZDvw+wIGwA8S3fZOHeUd40detKQyGbFEsIpKVrURcncVgbC
 zv2whOB6K+OXXigebMEOHlbHDA==
X-Google-Smtp-Source: AMsMyM4VgcDLQ4Mdfbv6hIeokV3STzkHDHm8r2Jacxl6wRFbQoIXcyKQ22yPaEG8fZMahC4Fy+BnrA==
X-Received: by 2002:a17:902:7281:b0:178:388d:6f50 with SMTP id
 d1-20020a170902728100b00178388d6f50mr33837351pll.127.1666611416833; 
 Mon, 24 Oct 2022 04:36:56 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 04:36:56 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Subject: [PATCH 09/22] platform/x86: fujitsu-laptop: Use
 acpi_video_get_backlight_types()
Date: Mon, 24 Oct 2022 20:35:00 +0900
Message-Id: <20221024113513.5205-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221024113513.5205-1-akihiko.odaki@daynix.com>
References: <20221024113513.5205-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 Oct 2022 06:54:02 +0000
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
Cc: linux-fbdev@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Azael Avalos <coproscefalo@gmail.com>, Mattia Dongili <malattia@linux.it>,
 Daniel Dadap <ddadap@nvidia.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jonathan Woithe <jwoithe@just42.net>, Jonathan Corbet <corbet@lwn.net>, "Lee,
 Chun-Yi" <jlee@suse.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Robert Moore <robert.moore@intel.com>,
 linux-acpi@vger.kernel.org, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
 Len Brown <lenb@kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>,
 Kenneth Chan <kenneth.t.chan@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, intel-gfx@lists.freedesktop.org,
 acpi4asus-user@lists.sourceforge.net, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 platform-driver-x86@vger.kernel.org, devel@acpica.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net, Jingoo Han <jingoohan1@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

acpi_video_get_backlight_type() is now deprecated.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/platform/x86/fujitsu-laptop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index b543d117b12c..e820de39cb68 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -387,7 +387,7 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 	struct fujitsu_bl *priv;
 	int ret;
 
-	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
+	if (!(acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR))
 		return -ENODEV;
 
 	priv = devm_kzalloc(&device->dev, sizeof(*priv), GFP_KERNEL);
@@ -819,7 +819,7 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 
 	/* Sync backlight power status */
 	if (fujitsu_bl && fujitsu_bl->bl_device &&
-	    acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	    (acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR)) {
 		if (call_fext_func(fext, FUNC_BACKLIGHT, 0x2,
 				   BACKLIGHT_PARAM_POWER, 0x0) == BACKLIGHT_OFF)
 			fujitsu_bl->bl_device->props.power = FB_BLANK_POWERDOWN;
-- 
2.37.3

