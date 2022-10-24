Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6707360C444
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E424E10E162;
	Tue, 25 Oct 2022 06:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6396A10E3D5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:38:21 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so8835037pjl.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 04:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UAzZQL5seIJutOYUjJgcTz5SIcJNiVaULVY/vxMxJ7M=;
 b=bWAkfym/IuAYQQDsk1OCfdE9w9yWPE3crZCufatlU3uyFhSD2FLPPyi4EZX0XKPNNN
 TsT1Mn93d8yM/JN1r6KstPaSr0v2lhHNLAttfYUvsrYDknwH7khxwfUrEhoUBDF6QNvT
 2AoTMSr1l1S7qOR5wF4oY1dCDKpWYBJ8RPjoWCYtuPhEghyQHHePilHd/NADV54vZIGq
 6rdvlz9HJM3z9wu+pJUiXEGORc6v7pwvQYHXmPP9HS48eXejuQAX3z/RDPWeO6o44bSX
 c9msf1NsRp6QE7dLwlbW0UvYtPhluL4+JoPCees4u24dLHSpN6Uh4AbxJOiXkAJfcDlq
 GsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UAzZQL5seIJutOYUjJgcTz5SIcJNiVaULVY/vxMxJ7M=;
 b=ob1qMXf+NEo9QyjHP0RYvLVSRY1mgvJcbtY2Jx/vQu3X7FnLSFCuTbWdx9dLBeqSXt
 iyfh4fSqJoesGnAkemQdi5iqs9z7N8yGbuGC/W29Rl10nr/+6QbYrK2Msvz8J8+/VttF
 e/IbsQS1Wz0P+Vm7e3yg4YQj33p5kzaaKWZo7kcfYIA22NXSqA+InDxDMdW6ZgriZ/as
 C5oI2ioV0uw+pQ5ZmRgZbkL4rEaX5gp73V9tt9gQRJ1gtMbYqieZuRSVFn5K3GgNdHzo
 Cur4zmqT4wojXVrqFL/v09dhZSVZDhM6LIr7nevHjk51MjY6t4FrW/Fk/tjRMxz0denk
 uNFg==
X-Gm-Message-State: ACrzQf0dqy2zAG9l6I/pfaCm4xy84fm7FnOXF8jzu3HGzAtAabco7mhZ
 YCN+yjaD0DMAAFL/mjkKHWPaog==
X-Google-Smtp-Source: AMsMyM518/+LX9D2Z710rX+ZGWrNfx22tav+R9okHqn5RhyI0izm5Jqv1jyaCGbAfBxBtougO+lAKQ==
X-Received: by 2002:a17:90b:4b8f:b0:213:95f:9515 with SMTP id
 lr15-20020a17090b4b8f00b00213095f9515mr6350162pjb.82.1666611500759; 
 Mon, 24 Oct 2022 04:38:20 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 04:38:20 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Subject: [PATCH 19/22] platform/x86: dell-laptop: Use
 acpi_video_get_backlight_types()
Date: Mon, 24 Oct 2022 20:35:10 +0900
Message-Id: <20221024113513.5205-20-akihiko.odaki@daynix.com>
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
 drivers/platform/x86/dell/dell-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index e92c3ad06d69..9cfffbe2bd95 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -2230,7 +2230,7 @@ static int __init dell_init(void)
 		micmute_led_registered = true;
 	}
 
-	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
+	if (!(acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR))
 		return 0;
 
 	token = dell_smbios_find_token(BRIGHTNESS_TOKEN);
-- 
2.37.3

