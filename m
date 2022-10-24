Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D4D60C42F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4932710E11F;
	Tue, 25 Oct 2022 06:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B457F10E399
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:36:48 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id f193so8496985pgc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 04:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aTWnIAAWrGsxFWyDKsfKu5xKbLpsLEHl3kQR801HKCo=;
 b=MRe/lYU3QcRg+eNbrdoMjeONSL07r0OuDkWzCVk6tpzA20LxxB9dtVNP6GAZVtqzIg
 /Ydi6DIu3Wy5fZXEZmacOcz+NqXiSg1SXC5+xE40BzARxzxxK4lzIbVbKWJmk00nhUWL
 J95wLECXE4yV76gl9zFLYhn0sUtCfGQd7MZ3fPt+5gVvmN0pleQRDgrqZg3vefZrijSa
 Yr0OxSWw7RuG0IesV0KfRF12UlNsEctSBC+ObKy3MmlA9Ekq0p3IRfhEG3FwtLPaqAOb
 tgPmTvcjcO2SHlUmacRidezoVVwplJ41JEut0A62tZuMt+eaVkdbww0tkfz+m4Yo8zhg
 FlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aTWnIAAWrGsxFWyDKsfKu5xKbLpsLEHl3kQR801HKCo=;
 b=gNcQdtlzT0+IFnKGv5okPvkYwSUjkdQfjinH9A9i1Yp5n05Zca69T2duwJ3455H34P
 TybwdRdWOaZUUWMoPJCw00ffVWA9SRhCVKwdBgaxnXM2IMB0FbnqNnZRk9GboKthrfsw
 +W5IHpkmu22hNhOD8vMMEvVZf7RIbYR2vw1rRAFdvPgIMowPCEWZwekg86AcWreBBO4S
 d3wyz9l7gxNPHx/kMwGReCZhHwW+/9dI0C+h53JHYqFctAovdgkrJpVU7zPwRsW/2imp
 6rWHtaqfsD2EGQAsWsnU/qiiiuIGt2NHPBIajveVuMpheR4M3gVB0iLAXZX9CQ07ciMG
 3wwA==
X-Gm-Message-State: ACrzQf2rZ2DqL2bRjbbJJ4xcenWgzujTEOvM7fYOmnv7ub6RZ1ldks8J
 OHcKS+t7Z2Oeues+qJphvUvzvg==
X-Google-Smtp-Source: AMsMyM4YJ5urGf6JLjky27R9T5sFwrnmf9RBCYrtUNpAE3TI6fc6EtzOOV4rZk9R6ICHsHu1MQHt3A==
X-Received: by 2002:a63:64d:0:b0:46b:158f:102e with SMTP id
 74-20020a63064d000000b0046b158f102emr28740541pgg.150.1666611408492; 
 Mon, 24 Oct 2022 04:36:48 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 04:36:47 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Subject: [PATCH 08/22] platform/x86: eeepc-laptop: Use
 acpi_video_get_backlight_types()
Date: Mon, 24 Oct 2022 20:34:59 +0900
Message-Id: <20221024113513.5205-9-akihiko.odaki@daynix.com>
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
 drivers/platform/x86/eeepc-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
index a388a28b6f2a..91dea49f7c3d 100644
--- a/drivers/platform/x86/eeepc-laptop.c
+++ b/drivers/platform/x86/eeepc-laptop.c
@@ -1400,7 +1400,7 @@ static int eeepc_acpi_add(struct acpi_device *device)
 	if (result)
 		goto fail_platform;
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	if ((acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR)) {
 		result = eeepc_backlight_init(eeepc);
 		if (result)
 			goto fail_backlight;
-- 
2.37.3

