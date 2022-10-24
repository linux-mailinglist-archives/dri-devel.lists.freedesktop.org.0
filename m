Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4AD60C442
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B925910E142;
	Tue, 25 Oct 2022 06:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F1F10E3DD
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:38:15 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-13ba86b5ac0so2880290fac.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 04:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aZbgIVSQ8XgPbVH9Q8Dsp65eLaVcafrOLYAAqQNA3Ms=;
 b=svkp4e3b3SUT9ftxU+ZLPImVGkrLdjZmAyL4NTDy8zBkyhJo1e5stHvrAz9NnYp+CP
 AJCGi7A9ny35dbEocVhIsAphKsiD9jZ63/JsrAZueG69IuE95V0TJ6aCnZ+DlNNn13Lm
 831reFgJM1LtLUpK9rtNkyvUYZDd26w6QRWfhKIvwmBIQcQJmYTS+V4i6U7+Z4Lpc4d3
 s0vv4ZqyrCx4Ys2lKyq0BeBUhRZCS490rmEtluTEKpS152uos0ylqsE7d3kzUq0kQqND
 becInYrHn+JiAKLdk4p+qnOcD5r2SuDSv8VLrjEkovHL0yMYiNLipQex+iGsarVfust+
 Uvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aZbgIVSQ8XgPbVH9Q8Dsp65eLaVcafrOLYAAqQNA3Ms=;
 b=21EPFnozjhTQFZJQOgMZ4Eq8aPLolRluDwabdcJKLtCVQblcHF9OHg2HPyGdGkv+qv
 1IJmEX3SdxQIlsDV5ndjCdHgIfu2WD9Qlv3rQkUllyNbBn7P7ssa2uDOjaqoi5POV4+1
 piVnB9hMfreCl4FHWjbAArPG+Kfa67pKah49AX1jWSeE9epGpGrxh3vKNj7LwSxaA3um
 /WCxsU8XOiboonlSPbJ195vkCDbzDjKIDTb7lAOGc0gIXWFLOOMS72DgEO8mTybrL63I
 CKXyq4AelaPDlzfnHkzgtPHTYElVT1YDAAwHBb+0MS/UUUIXVpQA4Xsq2lG3Ugq2Fno+
 Fk1Q==
X-Gm-Message-State: ACrzQf1SjBjHj9Yt4SSAinP1Cn0/fBKx6wMlPhaVMyu3AKzpdQgaQd0e
 Pv6oVKcQ7ZOOywTdEFvPJdF9G2BD1EFJtliV
X-Google-Smtp-Source: AMsMyM4RUBGzO3rLlIoesY9MV9xSVNvjZ7XRsAYwgRf2MzR+vsTZOlvX93IbLwXDaavbHv/ooxaUtA==
X-Received: by 2002:a17:90a:6405:b0:203:6eaa:4999 with SMTP id
 g5-20020a17090a640500b002036eaa4999mr73460182pjj.8.1666611484014; 
 Mon, 24 Oct 2022 04:38:04 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 04:38:03 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Subject: [PATCH 17/22] platform/x86: thinkpad_acpi: Use
 acpi_video_get_backlight_types()
Date: Mon, 24 Oct 2022 20:35:08 +0900
Message-Id: <20221024113513.5205-18-akihiko.odaki@daynix.com>
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
 drivers/platform/x86/thinkpad_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 6a823b850a77..d756d2ce54d1 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3547,7 +3547,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	/* Do not issue duplicate brightness change events to
 	 * userspace. tpacpi_detect_brightness_capabilities() must have
 	 * been called before this point  */
-	if (acpi_video_get_backlight_type() != acpi_backlight_vendor) {
+	if (!(acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR)) {
 		pr_info("This ThinkPad has standard ACPI backlight brightness control, supported by the ACPI video driver\n");
 		pr_notice("Disabling thinkpad-acpi brightness events by default...\n");
 
@@ -6983,7 +6983,7 @@ static int __init brightness_init(struct ibm_init_struct *iibm)
 		return -ENODEV;
 	}
 
-	if (acpi_video_get_backlight_type() != acpi_backlight_vendor) {
+	if (!(acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR)) {
 		if (brightness_enable > 1) {
 			pr_info("Standard ACPI backlight interface available, not loading native one\n");
 			return -ENODEV;
-- 
2.37.3

