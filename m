Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEADE60C435
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9847710E120;
	Tue, 25 Oct 2022 06:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215B910E3D5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:37:14 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id ez6so7946596pjb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 04:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WXmq/hBcZYGs3Gnnq23+P2GdOlxPxnPnQ9tZiYxhvfM=;
 b=ePYd4xhaCLyNOikvZx9ObnR59VTQkSAk7bE/21UiNNJwiT7p8qaz2wxEDyrMa76ZiO
 iTv35XAqYOSWqXDvZUoUvgGmvOlC3hchnWKDqdc2UecEVAX9G/+zMZvtWhcPix3rL/Ze
 /AxIzkOWAuW0TYSGen1kls5ox9wM7QN637haLeOU+iriv1s6P76gXjgwpd8lXRWr5njq
 0kb37LvYd9ImC/Je4pwta7WQUaUhAgxFwdWYk856M8Pz+6Ha/ONDf/yTiB0LbDLwz27I
 DYeq4gLGQYRTSFepUEIMtI9Duv1N/OsA8khwLOQvpXVWzE1RgBOE2QuDDdGxjTnuq5ox
 ChVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WXmq/hBcZYGs3Gnnq23+P2GdOlxPxnPnQ9tZiYxhvfM=;
 b=bsGH8XR8z7BqbeuXvaY8XyA5o1g5LSUVK7d+IHPxnwcaodnz2fOPC3OrOCE95v3nyQ
 qCH3JKwliaUaHSHmaT8c7U+Rv55iC0/XldHhYOdVYrqEUAI1RIeossMAGouesm6b9fIE
 w6uuH5MHwkUqMi4LEzQIMb0n0Tijlnrm2JcObE6efc1ZjwzaPQ9N932gkRnPiU3Xrhx4
 ytMLswIYHLrk3UaDwuzAnu8aj84EjajEeKFvt35NQz4TQdkJvvM9Xc5PSz9spYGYidrZ
 EnCfU1dwOe5KKU2iRxgdg1o9FBgSTqVhfLA7ZTv6X78anZ9NaywPUQ9ooYdp4zcCr0UW
 tRkw==
X-Gm-Message-State: ACrzQf0GuJg1QrP/xmBepb5PcDxij8H4V+nva8f3R4hABD6CuOH6rVOi
 OMtkyqpV/KkgoEOlOeuRtEd8ug==
X-Google-Smtp-Source: AMsMyM7vtFWcLRmhWO6df2stQtl+qol38s2TTZF/JGQZTKP8WsWjqXQ3dgWj46xKcZZohQd3w2Vh2A==
X-Received: by 2002:a17:90b:1e0a:b0:212:c44b:fffb with SMTP id
 pg10-20020a17090b1e0a00b00212c44bfffbmr22703440pjb.113.1666611433791; 
 Mon, 24 Oct 2022 04:37:13 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 04:37:13 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Subject: [PATCH 11/22] platform/x86: msi-laptop: Use
 acpi_video_get_backlight_types()
Date: Mon, 24 Oct 2022 20:35:02 +0900
Message-Id: <20221024113513.5205-12-akihiko.odaki@daynix.com>
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
 drivers/platform/x86/msi-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 6b18ec543ac3..19e2f164181f 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -1048,7 +1048,7 @@ static int __init msi_init(void)
 
 	/* Register backlight stuff */
 	if (quirks->old_ec_model &&
-	    acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	    (acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR)) {
 		struct backlight_properties props;
 		memset(&props, 0, sizeof(struct backlight_properties));
 		props.type = BACKLIGHT_PLATFORM;
-- 
2.37.3

