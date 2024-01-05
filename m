Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 375BE8258FD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 18:23:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6840010E651;
	Fri,  5 Jan 2024 17:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E0710E651
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 17:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704475405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L2qUZvjVZIZkY/BqEpnbV7C2OUzTR+OzcQfnt1cm3UY=;
 b=ILZOSqKhbjsYP2rjSe+cQpvSk6yvNFPqNcpgEH1mSBK0A8n/i1sMDCpmOeAM1hKxOIg11Z
 Kj+r7g4okRPIlCu8nPhvunEjzdsOeRwUuDJV5awsvXYezSPf7IXxOcoFpaAQeQh4mu8ZCh
 po7xDdgWfDF4LhpBRIYsHqOz7PBoDO0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-tXJqQm4eP8yc69K3oZplrA-1; Fri, 05 Jan 2024 12:23:18 -0500
X-MC-Unique: tXJqQm4eP8yc69K3oZplrA-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4297e4c0331so390191cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 09:23:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704475398; x=1705080198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L2qUZvjVZIZkY/BqEpnbV7C2OUzTR+OzcQfnt1cm3UY=;
 b=dBLI6n7nMnHEglboxBDsUxBG3OVRTSHQ1LK+s45iG7j8Yh/TLLph+HZ3xcSYPK5dXk
 jaG6Eqv5pSdnPC8oQHHdlcnL67WThT1CY9do1NkTRTmpPC7FWMOdf72dBOXennutP5Xp
 66NKV0Q48AkVKMdjHksm/aj8fl54+ZfHx+xdCxVPE03j9bqjohnnb1M+HZwjTwNMaCf8
 4RfXxTXUrQq1QnkPFaaD7D8bh7Sh2KnmjQDIzJkCrfYDueNfUYixoCheN71Eln/nff8u
 NP0LkSoM8HJ7RTIPWU3Vhl/1AmUOEcIBC74FLApKgcsRSS3NqFextU+RXZr44oJPDvjF
 Eagg==
X-Gm-Message-State: AOJu0Ywhf4oi2VwvlyRKDjgmJzn6XkzTpb9Uodfo8FWJ2HoremJnMHXK
 iRrih/jEZocWHY2fBWCdGb4F5Zl8Yn/H10TqygkItXBkw8T+KFs8bRIsN+cpHPq2Ct/6HPoGzWQ
 5BGTPj6EBorlAalUAtUjCZIi3uIBAxU+izMhn
X-Received: by 2002:a05:622a:50:b0:428:2650:f3e2 with SMTP id
 y16-20020a05622a005000b004282650f3e2mr5249588qtw.5.1704475397793; 
 Fri, 05 Jan 2024 09:23:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF532epDikfCQdMZTGaUEridQlW9l8yNvNyDw9n1OMG2UUu/mdbSu/2QfYbrZ833QqmwaxhCw==
X-Received: by 2002:a05:622a:50:b0:428:2650:f3e2 with SMTP id
 y16-20020a05622a005000b004282650f3e2mr5249572qtw.5.1704475397552; 
 Fri, 05 Jan 2024 09:23:17 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 ([2001:9e8:32d1:a900:227b:d2ff:fe26:2a7a])
 by smtp.gmail.com with ESMTPSA id
 t22-20020ac865d6000000b004282c862fccsm884750qto.57.2024.01.05.09.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 09:23:17 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 David Gow <davidgow@google.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH 2/2] drm/dcss: request memory region
Date: Fri,  5 Jan 2024 18:22:19 +0100
Message-ID: <20240105172218.42457-4-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105172218.42457-2-pstanner@redhat.com>
References: <20240105172218.42457-2-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Philipp Stanner <pstanner@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver's memory regions are currently just ioremap()ed, but not
reserved through a request. That's not a bug, but having the request is
a little more robust.

Implement the region-request through the corresponding managed
devres-function.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/imx/dcss/dcss-dev.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index 4f3af0dfb344..efd3a998652d 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -177,10 +177,10 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
 		return ERR_PTR(-ENODEV);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "cannot get memory resource\n");
-		return ERR_PTR(-EINVAL);
+	res = devm_platform_get_resource(pdev, IORESOURCE_MEM, 0, "dcss");
+	if (IS_ERR(res)) {
+		dev_err(dev, "cannot get / request memory resource\n");
+		return res;
 	}
 
 	dcss = kzalloc(sizeof(*dcss), GFP_KERNEL);
-- 
2.43.0

