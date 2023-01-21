Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0CE676842
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 20:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B00D10E2CE;
	Sat, 21 Jan 2023 19:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F359610E2CE
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 19:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674328178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NPIxC6UFVdw/MjrtfcvzuLHufLGHSjfY7C1EvrBunNo=;
 b=NFLfUEol2FkmpFGCfCrqfF95w+zOkKpx5eptBKUQtKBNICVJU1b83Q6yUCJjf1jyz3cLZM
 F67DEvrQeKBbW6wFE8AqQi2y63GZso001Z/YdP/3NbCsE/1oFabFIEPLOoCB4dsJct1fGN
 /syFXBtdfP1kk2A+TYeVICLaKk7x+Fw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-147-QLuYk3DFNb2lMYy8uo19Xg-1; Sat, 21 Jan 2023 14:09:37 -0500
X-MC-Unique: QLuYk3DFNb2lMYy8uo19Xg-1
Received: by mail-wm1-f72.google.com with SMTP id
 9-20020a05600c228900b003daf72fc827so4991932wmf.9
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 11:09:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NPIxC6UFVdw/MjrtfcvzuLHufLGHSjfY7C1EvrBunNo=;
 b=exrpJ9PvhWNrV8xCw2fvrUI0FcAawpvBilkZ+opC/5ypI82bqSJ8BDM65wC037lJsx
 ulMBiVepuQnjD+giWehW1TRx/hT8nr8QKs31RcTotHTAi3Pu0LAYSWQ2IAvE5mHCMZP/
 oesUY4i2hbVfxlvCC8k5+vLomz2PEvb9xKMGCQH2sJ8OjuKR8hXZ4dVyjK462D/jLzFD
 AkXqUM7PbJrPGxEjU06Hl/JNvGIzB557k2AkR9/8QKv2nPqbOB+pcpKap1cHd9TAFwcZ
 u6sQUu/cqxgVTrdHxrSjckcYJypM1nq6FZ/o93LMLmTDDopE8SbyibqdxxTcRwY9Iqln
 MruQ==
X-Gm-Message-State: AFqh2krylMYPo/8kaSFmmK0fUPGBoPdXOu4td2kmEVNQeSj1a45a7JMr
 QC9/fovyAWAVf9OdGoou7LjnGJRallQZxU+zrbiM3nGWhWexWhMOY1oMzbdXvWl2i8dcHeATXTi
 zKTAMogD4aO3PwD//MJ3HjQZTNit6
X-Received: by 2002:a05:6000:79d:b0:2bf:95cc:7447 with SMTP id
 bu29-20020a056000079d00b002bf95cc7447mr4039177wrb.32.1674328175875; 
 Sat, 21 Jan 2023 11:09:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs01wKQXxokiKiCqH3FkcFM0EKVJSqBjYCIdWWOsWkHS1xKlwhPbFZ792GvPLrzWlGVivQDBQ==
X-Received: by 2002:a05:6000:79d:b0:2bf:95cc:7447 with SMTP id
 bu29-20020a056000079d00b002bf95cc7447mr4039169wrb.32.1674328175669; 
 Sat, 21 Jan 2023 11:09:35 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k5-20020adfd845000000b002bdd96d88b4sm23716899wrl.75.2023.01.21.11.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 11:09:35 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/ssd130x: Silence a `dubious: x & !y` warning
Date: Sat, 21 Jan 2023 20:09:30 +0100
Message-Id: <20230121190930.2804224-1-javierm@redhat.com>
X-Mailer: git-send-email 2.39.0
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
Cc: dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sparse tool complains with the following warning:

$ make M=drivers/gpu/drm/solomon/ C=2
  CC [M]  drivers/gpu/drm/solomon/ssd130x.o
  CHECK   drivers/gpu/drm/solomon/ssd130x.c
drivers/gpu/drm/solomon/ssd130x.c:363:21: warning: dubious: x & !y

This seems to be a false positive in my opinion but still we can silence
the tool while making the code easier to read. Let's also add a comment,
to explain why the "com_seq" logical not is used rather than its value.

Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---

 drivers/gpu/drm/solomon/ssd130x.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index c3bf3a18302e..b16330a8b624 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -81,7 +81,7 @@
 #define SSD130X_SET_PRECHARGE_PERIOD2_MASK	GENMASK(7, 4)
 #define SSD130X_SET_PRECHARGE_PERIOD2_SET(val)	FIELD_PREP(SSD130X_SET_PRECHARGE_PERIOD2_MASK, (val))
 #define SSD130X_SET_COM_PINS_CONFIG1_MASK	GENMASK(4, 4)
-#define SSD130X_SET_COM_PINS_CONFIG1_SET(val)	FIELD_PREP(SSD130X_SET_COM_PINS_CONFIG1_MASK, !(val))
+#define SSD130X_SET_COM_PINS_CONFIG1_SET(val)	FIELD_PREP(SSD130X_SET_COM_PINS_CONFIG1_MASK, (val))
 #define SSD130X_SET_COM_PINS_CONFIG2_MASK	GENMASK(5, 5)
 #define SSD130X_SET_COM_PINS_CONFIG2_SET(val)	FIELD_PREP(SSD130X_SET_COM_PINS_CONFIG2_MASK, (val))
 
@@ -298,6 +298,7 @@ static void ssd130x_power_off(struct ssd130x_device *ssd130x)
 static int ssd130x_init(struct ssd130x_device *ssd130x)
 {
 	u32 precharge, dclk, com_invdir, compins, chargepump, seg_remap;
+	bool scan_mode;
 	int ret;
 
 	/* Set initial contrast */
@@ -360,7 +361,13 @@ static int ssd130x_init(struct ssd130x_device *ssd130x)
 
 	/* Set COM pins configuration */
 	compins = BIT(1);
-	compins |= (SSD130X_SET_COM_PINS_CONFIG1_SET(ssd130x->com_seq) |
+	/*
+	 * The COM scan mode field values are the inverse of the boolean DT
+	 * property "solomon,com-seq". The value 0b means scan from COM0 to
+	 * COM[N - 1] while 1b means scan from COM[N - 1] to COM0.
+	 */
+	scan_mode = !ssd130x->com_seq;
+	compins |= (SSD130X_SET_COM_PINS_CONFIG1_SET(scan_mode) |
 		    SSD130X_SET_COM_PINS_CONFIG2_SET(ssd130x->com_lrremap));
 	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_COM_PINS_CONFIG, compins);
 	if (ret < 0)
-- 
2.39.0

