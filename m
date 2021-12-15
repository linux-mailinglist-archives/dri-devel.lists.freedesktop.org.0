Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C83474FF1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4F510E1E9;
	Wed, 15 Dec 2021 01:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515A310E15E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gP2m6jmqgIQcw7zXtRCVCnQPh4wC0dksG5Pq+7K01/U=;
 b=DBkkVtH0egMLxeWSO4hd2cDI59HkDYRDgTBAtyoU+R66pV68tXrpSxoqdO8tB9H2RWihmO
 4tIP5fVRuO3N6A44K3tZXOfTyqP7CSBlAVOzWXUXEZo0AsyAIFGux38JjPSIZwswZ0oVeR
 aqLW43ZPu6xo+zj0wmyUsJhdeFMPT50=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-aHnlL5BNNGSrfX430He4ag-1; Tue, 14 Dec 2021 20:01:15 -0500
X-MC-Unique: aHnlL5BNNGSrfX430He4ag-1
Received: by mail-wr1-f71.google.com with SMTP id
 x20-20020adfbb54000000b001a0d044e20fso1099125wrg.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gP2m6jmqgIQcw7zXtRCVCnQPh4wC0dksG5Pq+7K01/U=;
 b=XN7ZHc4tF+aanYYNaoGJrSoD9+LRvdRPgRQvwsTJkQuOIWk6Jm9ENkyktvoMkKN8sj
 xlWuV4oN+32vRDOO31WhZ8n88cipO2P5/MqIq3QB4FNQSOnHHSO2QyhywkbF0dpr5mFt
 En9o86abwJO+rsDhi7FWsYMMAi1zlJTCS2zDGrxgkAs9JKrvNjweVuUsLTw29H3wL83O
 cq+twUDYZXQELJrN9b6zatdjS0WIXhrAF6iiiptJCxdbOOGYNqU/PicLxDJ9TxChADe/
 IXesbUJr1Q32FTRKtquT/urWPsepS/aV8eRcuwgka07EqRpCHuo0LDNZggtt8C7kT6lB
 wWeA==
X-Gm-Message-State: AOAM532ypK+bJ79FdPo5303rXLKQi3rTGMdWwZQqzkaj5k3RwxqsPETH
 Gx3H64JzNivTxg8VB+PPmBIWzPN17dnCsjCm3NlL38JvDWGdjw6nx2okTF/CIIMyhTV1IHVD3Ju
 +/hm0zmsYHsUvL6btxLT86ZAtMCEE
X-Received: by 2002:a5d:64c8:: with SMTP id f8mr2134431wri.435.1639530074334; 
 Tue, 14 Dec 2021 17:01:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/kD5oC1p1xgGsSZP32xaQGOGfLOxfEpCuwFsE2jsSpZ2HpZu822Wo3A/No2TIXrrU/tkX+w==
X-Received: by 2002:a5d:64c8:: with SMTP id f8mr2134418wri.435.1639530074153; 
 Tue, 14 Dec 2021 17:01:14 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:13 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 28/60] drm/panel: ilitek-ili9341: Add support for the
 nomodeset kernel parameter
Date: Wed, 15 Dec 2021 01:59:36 +0100
Message-Id: <20211215010008.2545520-29-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215010008.2545520-1-javierm@redhat.com>
References: <20211215010008.2545520-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to disable Documentation/admin-guide/kernel-parameters.txt, this
parameter can be used to disable kernel modesetting.

DRM drivers will not perform display-mode changes or accelerated rendering
and only the systewm system framebuffer will be available if it was set-up.

But only a few DRM drivers currently check for nomodeset, make this driver
to also support the command line parameter.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
index 2c3378a259b1..707c5a7bf256 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
@@ -611,6 +611,9 @@ static int ili9341_dbi_probe(struct spi_device *spi, struct gpio_desc *dc,
 	u32 rotation = 0;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	vcc = devm_regulator_get_optional(dev, "vcc");
 	if (IS_ERR(vcc))
 		dev_err(dev, "get optional vcc failed\n");
-- 
2.33.1

