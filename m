Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A75260C429
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621A910E11B;
	Tue, 25 Oct 2022 06:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F5610E399
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:36:23 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id f193so8496205pgc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 04:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FzYckbVTu84cFuvQYLHBAleZORC/YQBRLh0kCNSwM7o=;
 b=iBmB5k8OKAjf/Xfxgs/hagECXPJWV1vTEOyWaHgXEXGGuvWdPS3TIcFuqN2vljOt/3
 nNxtvkj18I0SllZUWw1t8qqvPmaaAP/Ih4C/z6eW1oEg/YHBwNE/UBrQc6mXtkTAyvYj
 FRBgnjpPaQlPvG+Y3I8gbe9DDVTlZH0hAaXfoiGfSlX3bhk3XTqmJy1s3Zn6Jxm7ASHo
 5qpBijR2lRjm+mURr8kmnNH7SvMPVVmMWVtI9kd+jgDbk3k+yebqsm9WcqXOGkuW8EHo
 ONz+AiYuv6fxJZh8VBFUV+IvV75FH4hihqZWU8KhCWTYY3SL2W8//2gxAwO5cZ7vPvF7
 RcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FzYckbVTu84cFuvQYLHBAleZORC/YQBRLh0kCNSwM7o=;
 b=vkTMPFk1eYxvSDtF5hkiI7XA9u0mtoEpT6axXF6n/mzJsOU45YBh+04gW5X8PAMo0R
 QAFz0cbolGShHKdZPGpwEi3e9oe9WVxDDlXbNpvvoPW9Ta4RFtRVAuJiTqwgBOQn2X3K
 SaglDdhg+GLi2SXm+XQeHl0Fn/mBD/hN4EGJax7/9N1/uJKY9u7cISa6hzjLEfwHnMkk
 B2Qla4JLCH/HJinDhe6Sm1GoUQGC+q7+JGHMl9K/CdBw7X5mVP05ITqSeiCwAZvzR5zY
 15o0C/t8uhJDHrRiTRJv5Zo4xjFGkGmj2FKuvDF3v01mtfcbyskGa+mS/RPrdRVkx8gD
 m29g==
X-Gm-Message-State: ACrzQf1ODW9xh54fmK0CGEhfOAtbZ6zQXr5inX7gzHclxClAegX8KP4f
 kWMDsXDK1I3BhgFnrGpkDZL/gQ==
X-Google-Smtp-Source: AMsMyM7eq4O5TcwFPN0I0cjYrONCrFe9kecGGggyXcsgPXfbT+UNin9IKo2yeDqy+SAw/EfdKKa+7Q==
X-Received: by 2002:a63:2a86:0:b0:46a:eaba:f1f3 with SMTP id
 q128-20020a632a86000000b0046aeabaf1f3mr27591150pgq.79.1666611383075; 
 Mon, 24 Oct 2022 04:36:23 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 04:36:22 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Subject: [PATCH 05/22] platform/x86: asus-laptop: Use
 acpi_video_get_backlight_types()
Date: Mon, 24 Oct 2022 20:34:56 +0900
Message-Id: <20221024113513.5205-6-akihiko.odaki@daynix.com>
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
 drivers/platform/x86/asus-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 47b2f8bb6fb5..fb7f9e8ca6c4 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -1854,7 +1854,7 @@ static int asus_acpi_add(struct acpi_device *device)
 	if (result)
 		goto fail_platform;
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	if ((acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR)) {
 		result = asus_backlight_init(asus);
 		if (result)
 			goto fail_backlight;
-- 
2.37.3

