Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C35660C449
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7569F10E153;
	Tue, 25 Oct 2022 06:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA2010E388
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:36:15 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id p6so8195181plr.7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 04:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mHmQPHH9zZ+33MZuRep7mHnwYbLIC54t+fSNOg5Y268=;
 b=RqE7F5MvPhA2qPYcGDMg2WC36c/ya8S0CaGTkCLFCoNSy0LYw2pEJBOB/IKoaCEWaV
 b6+79fB4tTanoZBjY7Fo2X/0NYabUzhBlMuelQGTz957EVppUy7uLHG6QaZSla3B9yXQ
 6OXhn032XHxg5QRkvk/FCqxh1nFf72KOtez39VVtVU2ZobrTkzAarpAdLc1MHIUicZ7x
 9IrA8KyX2n1Wc8SGkUaFWVryKzby7j8MCVQOn4hgQjEY8G1/JwHmHTRLpbfS7RTYinzr
 NNc6x9W1fERMFC/C80tkaVI7MUT/2fXwRFpEdbUrqzdctaRtNeCvR6lKd2fKNhihIYhG
 3RWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mHmQPHH9zZ+33MZuRep7mHnwYbLIC54t+fSNOg5Y268=;
 b=EeUvnoapd3h7fsG9CqAcP/ZdYI9jdA0xIiVJbb1HlaSxaIxi7PqO5SxoMt58DvE/mo
 njmj8Mv9yU4oonT0+2rB7lAeybI56myQxWjpQmScX/wop6g0bfUs1qnYYXdjf+6Fe72S
 lM2fJXwMwgfDqDTgidgwQnbS4BV40sqK0sCsRRxgzG4Hw28cYR4wgyaT/psX5Ay78EmI
 etomlvEd6Ijwv+lTKhPeGhZBoxJgSsV3D8OzJrOCQInNkhMVsYWPZcbf6CRQSrBTUSF7
 Je1vbk2ek91O0TmvinUtfKTbiOzRY9HcOzV/4s1HmzXEQpRHZjmQmOQmSg3Mhwd4xamZ
 SXSg==
X-Gm-Message-State: ACrzQf2IaKiQyJEsalPHe8b2jZgQw+VAisOkuK9lgTKWFSAtCjmL0cEK
 rURTf8vAQPqvXfdHpe6x8fvqGw==
X-Google-Smtp-Source: AMsMyM6IswFjqEAoVVX0inb+Y9m4C23pNohtdcPX0MoJFcRCefFyK5dlJjEhoQdRFZzuZeVMFsM+Yw==
X-Received: by 2002:a17:902:7c8c:b0:17f:7565:4a2d with SMTP id
 y12-20020a1709027c8c00b0017f75654a2dmr33857671pll.65.1666611374702; 
 Mon, 24 Oct 2022 04:36:14 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 04:36:14 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Subject: [PATCH 04/22] platform/x86: acer-wmi: Use
 acpi_video_get_backlight_types()
Date: Mon, 24 Oct 2022 20:34:55 +0900
Message-Id: <20221024113513.5205-5-akihiko.odaki@daynix.com>
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
 drivers/platform/x86/acer-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 18224f9a5bc0..10d0819e48ff 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -2421,7 +2421,7 @@ static int __init acer_wmi_init(void)
 
 	set_quirks();
 
-	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
+	if (!(acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR))
 		interface->capability &= ~ACER_CAP_BRIGHTNESS;
 
 	if (wmi_has_guid(WMID_GUID3))
-- 
2.37.3

