Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DA860C448
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39C510E179;
	Tue, 25 Oct 2022 06:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A07310E3A9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:38:29 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id c2so2078plz.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 04:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3flgEAolZn9kn5oClvgduggco3LU3Kao58cYVj8GoE4=;
 b=LFNGam9y4Mzo/GmaRHBG21OM1uk0hOommk74KXR9Ca3TMfQryGTVdhVU5ltrLDq2eZ
 02Sufh/O0mf9igu5dzzr9xfFTvUVJnusR47enfl8COOjleX5fwL6eAZaOwUFpStJHUJi
 hCLqEFuFEiStB87OEfhilZId7gmp5XPzc8feF2PYyJiV+KGbmtv9V+IgrRH+2aqz3DHV
 M+0XmnIQ2XPB2CwxIkAbGWu2tAx/w1WMTphoADzrca9LYFwO0Tc5zvTS7ycemczGbZdY
 uWICIlA0YHCEjqWRpSdtI+n8c9TyFLANwWLT4ZFSjfGAycLhmE5YxuD4ntG1ulSCg1AF
 sMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3flgEAolZn9kn5oClvgduggco3LU3Kao58cYVj8GoE4=;
 b=dSaa0t9v9tB+O/OmgQcHBZKSyoYxc+/7DD5cBzAWLQzR94X84s6q4kup4j5x4JhCKI
 ryPETxNW7RAUqoYxHf1hj7t9wSiIKunH9wCZEzfS8eYmSorFx/s7KCT8v7bJJ3dwc9ZO
 KROgGNF57HZHtsb2G7arxFyE3vAGqLwq2SwlT56SKgO3riBbgg2qSkpDw0SSLd07r9Q/
 gsIHQq/QIshbCKMzncYR/JZeGpR2TzBHElYUOgRv5uPEkTrvq76ksxFF3LAWYjXMHdIf
 Qcjocrf8vdFgR66mciPVvk336AFIAnX5Zvqt/dq8duwrgDEaGYGKFcyY8CknYLj9/p6Y
 KOXw==
X-Gm-Message-State: ACrzQf3/Ehxjh25KYv0Vb3lA7t1bSg60KjtkWySyvvZ/3lXmdjcFkCEO
 sUzSDbunPrOKdueFwfmw2lemhA==
X-Google-Smtp-Source: AMsMyM5su6ApWtiy+J/kwO/a0HneChUBGcY0XEPNt6nciHQoDPKXFdF+gj0Vs4qmtnJ6gx8k4rNCKg==
X-Received: by 2002:a17:902:ec8a:b0:185:5462:261a with SMTP id
 x10-20020a170902ec8a00b001855462261amr32981480plg.160.1666611509068; 
 Mon, 24 Oct 2022 04:38:29 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 04:38:28 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Subject: [PATCH 20/22] platform/x86: intel_oaktrail: Use
 acpi_video_get_backlight_types()
Date: Mon, 24 Oct 2022 20:35:11 +0900
Message-Id: <20221024113513.5205-21-akihiko.odaki@daynix.com>
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
 drivers/platform/x86/intel/oaktrail.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/oaktrail.c b/drivers/platform/x86/intel/oaktrail.c
index 7c5c623630c1..f44a51dad16a 100644
--- a/drivers/platform/x86/intel/oaktrail.c
+++ b/drivers/platform/x86/intel/oaktrail.c
@@ -330,7 +330,7 @@ static int __init oaktrail_init(void)
 		goto err_device_add;
 	}
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	if ((acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR)) {
 		ret = oaktrail_backlight_init();
 		if (ret)
 			goto err_backlight;
-- 
2.37.3

