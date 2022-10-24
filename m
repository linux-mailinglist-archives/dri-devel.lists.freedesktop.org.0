Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C06C60C42C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE09910E112;
	Tue, 25 Oct 2022 06:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBD510E399
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:36:40 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id b29so4294460pfp.13
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 04:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=28wDlqMofB1pExK+J7NJqLJ5sSPJ8IDYDWuGoZcg4WU=;
 b=zPrE3Z79yDGzLtfx2QawETgF1lUMugvN0C6qQ0CWIaiD5/kUtQIJww0VDJMrkYc3N9
 elYuVucHc32XKow2YGLm3Vr08Z5vsbFCWlv4vq7Nx1QXhYg0jtjzlw0H9CXWI7Ta2vol
 6FUMEN9tnwiBaSCwpYfKwo7U/Mq0MJA9eOTbkI8+uvO7eXR9gmEds/Sy3ur7LFminYR1
 NVY1BZW0FhIWVkiQMHh5J542GVxkeRWv1QNvckPM+a6g8eqefXzkOAt0+7UqdUmERKZa
 J+mLK9mmXa4DfceGk2cEkxou1QrTtBSQu+UKjsPm36wMjvQrtPcLMKbyQMEJWea/JWpP
 WvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=28wDlqMofB1pExK+J7NJqLJ5sSPJ8IDYDWuGoZcg4WU=;
 b=T9h1t23E7cC4R+0cidzFkVCMUxI+RPhkhaq6s5fxDDmrmm9Ao0Dy62QMVzK6SXPRT5
 21+aEJwiGm+n98NIpVv/mKhYvK9V5v+mqfX6dCK70ssjRsfbkoQrcY7d1QxWCys/AHkS
 0L2LoIr2ZPzbWXT3Op3riA1DEoUGDC3U2n/4ECWEZA+j0JlHVrtVzhODChktkZ0Y83iD
 iRGwRG6d2ejXNX2/QOj2XJfosqzUPzbnNsmFb0+Rl0wiXLeUHCevp5UMlDFdWbPmkXLl
 pZVKwc3bwmBOwTaq5yip5oXjKFxhANanHP6fByQ3v3zuUbbpzYe7L8fC21npP3UhaQLX
 QTSw==
X-Gm-Message-State: ACrzQf33LW5qJ6mIeFmccO3S6WY9NVcMIDHtbVylxodI5uKOLKwBaM09
 rv3hkGC7n7USmNypl9vnS5rbPw==
X-Google-Smtp-Source: AMsMyM6SfjrakTfflVuQ8PwvI36ClP4mxWtm2JBvE32zMW6Lo2xtR9eBT667zzx11rUWR7R7KloyFA==
X-Received: by 2002:a63:5702:0:b0:44b:290:f24f with SMTP id
 l2-20020a635702000000b0044b0290f24fmr27871108pgb.558.1666611399944; 
 Mon, 24 Oct 2022 04:36:39 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 04:36:39 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Subject: [PATCH 07/22] platform/x86: compal-laptop: Use
 acpi_video_get_backlight_types()
Date: Mon, 24 Oct 2022 20:34:58 +0900
Message-Id: <20221024113513.5205-8-akihiko.odaki@daynix.com>
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
 drivers/platform/x86/compal-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index e10d2f64dfad..16ced03fa1b7 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -1043,7 +1043,7 @@ static int __init compal_init(void)
 		return -ENODEV;
 	}
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	if ((acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR)) {
 		struct backlight_properties props;
 		memset(&props, 0, sizeof(struct backlight_properties));
 		props.type = BACKLIGHT_PLATFORM;
-- 
2.37.3

