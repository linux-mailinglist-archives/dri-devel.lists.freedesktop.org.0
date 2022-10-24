Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB11460C42E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F92610E113;
	Tue, 25 Oct 2022 06:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7E310E3A9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:37:05 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id io19so3248674plb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 04:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YFFtfp5Yc7gM2NHS+gJ21jjQnawzT1tRkxQzo/jBQzs=;
 b=PgRxRL0VweaBpB4MPzFwmQEoLPmtBSUyoflWHPBA/i2qwPwwuqmuLCa/wFO3m2WOgm
 CG5asatEvhtKxzWCslE5iuXyE9qykeCF0sAXWDQWCpNnz1SKFD09I/9ECN3oqaq/n/qH
 8rI5q6sFwwrbf+qrqO6sphSgXh8gDNDUjMeXekyPZD3F/TNfhF9NLgFtp4S/EV7wFVYr
 HIvJzo/gYypH0KtX5FbvkZtyhStclUobYg5s5+qLL1fUloXqGfaHi5da3VFSy44yWKIj
 FIzxJZjW4aIDCrHCB+/3DHZ36YkLWnsHC5PSQR+boNXax+UF0elBwxF4lI1dewR5AYRU
 r3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YFFtfp5Yc7gM2NHS+gJ21jjQnawzT1tRkxQzo/jBQzs=;
 b=U9sDd87ELZ3EPTG/lo05VFffRL712ParP6NUm0znq9yABX/iML86Xfh01p4fZGHo42
 0mY2GzLEVvaSe3L9Iy3DZ1L3fQDhm5siTmGEHigZLzrw2Tf4AVERBRzt8Yk5VTPPGZuP
 ntxB0v9TFUB6zo3ZqKHOPC9Ki1RDpph9PZ17nIJgCZ6vJBSo+PdWqqceBcq30x+m9/mp
 ZH/m0ewGu1+WZ3wCe5nnzM5r9bwqo3dxz4zN/Hkv4frFdKSnBBmp8qGIBa7QpWGnfwND
 PFtl7M3OGlwPkHdSCjta1xdgAfPPzoDqB/EVykVZeZ9hk6jleo7PvgzfBd4/FnuobppO
 vN/g==
X-Gm-Message-State: ACrzQf2+Vz+YtxwwnsjFiK5soV5YX3+lP6zSZuJgUvDQbEOCICwanuHz
 v0ZaQqGgCard0CFSr0leWZI8RQ==
X-Google-Smtp-Source: AMsMyM4JFQloaFqr1HCGBSMPdlEtI9GhtTJPxV54Rk0x44r+FJsDYcm4mRiVB5esproJCpQDWLufkw==
X-Received: by 2002:a17:903:11c3:b0:178:aec1:189c with SMTP id
 q3-20020a17090311c300b00178aec1189cmr32705192plh.136.1666611425291; 
 Mon, 24 Oct 2022 04:37:05 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 04:37:04 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Subject: [PATCH 10/22] platform/x86: ideapad-laptop: Use
 acpi_video_get_backlight_types()
Date: Mon, 24 Oct 2022 20:35:01 +0900
Message-Id: <20221024113513.5205-11-akihiko.odaki@daynix.com>
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
 drivers/platform/x86/ideapad-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index abd0c81d62c4..befd5dc24ed6 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1633,7 +1633,7 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 			dev_info(&pdev->dev, "DYTC interface is not available\n");
 	}
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	if ((acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR)) {
 		err = ideapad_backlight_init(priv);
 		if (err && err != -ENODEV)
 			goto backlight_failed;
-- 
2.37.3

