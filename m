Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA5E70076B
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 14:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DBA10E695;
	Fri, 12 May 2023 12:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4C210E695
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 12:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683892972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RAs/4nxfcMFyg2HMPmspBZO1jWwkNauHuupqA+XX4a4=;
 b=SKj2a4SthO+Bv5ALxdbuTcpf592wFh3uPxjjXnzGda5HyXW45gVbfLLLrVbvoalOg4+qMY
 U3K5ZKXsFHDZzSwlU0QUMUNwd4CYhuQb/wCoW568H/WFUJee+9j+GFQhw2XHBTXnB2RHRD
 KH0VMkd0yV9oxrJLBXv8ntKtD48YhlQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-3uexAkd2PLqpcJRciKpPhg-1; Fri, 12 May 2023 08:02:48 -0400
X-MC-Unique: 3uexAkd2PLqpcJRciKpPhg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f422dc5ee5so35897125e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 05:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683892967; x=1686484967;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RAs/4nxfcMFyg2HMPmspBZO1jWwkNauHuupqA+XX4a4=;
 b=iWjjHIgqdVeq3aadGfNGAzN0LSTAvhETI0NgvI3OImcqgz0LwaTr/QpNqWujZFgcA1
 LQgGvIQ9bh4MNdFeIMIUc3A/g392Nq0Cc2RxsdIjE3B06WlvlDrGt2VPz8Dj8NwAltAz
 N/x6B1WaoPs9ZrAYl+dcDGg14bKfvPq7/HzklsLJuNVv99JfcGY5AxQ5djF1HnF/i2Ux
 7AUqXeb3543OHtRGZZaX674YhGfG435NXrf0AcMK3Jfjvx0aSBM/tQ9NK67hgL3/DcPi
 8k0klOf2Vfk9tlfFHFgEaGXglfYUufxf36R7bnaFUCU2HClujygk5zJhJMidxX4Kxkfq
 ikbg==
X-Gm-Message-State: AC+VfDxWp7C6UjXI2TKrEEORLro/Nr5Z1K0yKH0TJwqV/EvRGFPsC+qZ
 3Np9ljjcqj64EjgSVhi4P+uT9wjNNyE0aXTdhp4OQrNIXjNYswAYHt/kB/0i1M5RLJmp0FBDF5Q
 N6xZfLnrtMlJGyNGgurKvX7vM/bdG
X-Received: by 2002:a7b:c381:0:b0:3f1:819d:d046 with SMTP id
 s1-20020a7bc381000000b003f1819dd046mr19644167wmj.5.1683892967304; 
 Fri, 12 May 2023 05:02:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5fvpMIjT+Pk3DwjS3y+l8kVbtbSlkIGLjRil5kTUCGo+INLDkRdEH6D48w0NoTg9f7K//t2Q==
X-Received: by 2002:a7b:c381:0:b0:3f1:819d:d046 with SMTP id
 s1-20020a7bc381000000b003f1819dd046mr19644147wmj.5.1683892967030; 
 Fri, 12 May 2023 05:02:47 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n3-20020a5d4003000000b003063176ef0dsm23285317wrp.97.2023.05.12.05.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 05:02:46 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/ssd130x: Fix include guard name
Date: Fri, 12 May 2023 14:02:31 +0200
Message-Id: <20230512120232.304603-1-javierm@redhat.com>
X-Mailer: git-send-email 2.40.1
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
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a leftover from an early iteration of the driver when it was still
named ssd1307 instead of ssd130x. Change it for consistency with the rest.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/solomon/ssd130x.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
index 03038c1b6476..db03ee5db392 100644
--- a/drivers/gpu/drm/solomon/ssd130x.h
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -10,8 +10,8 @@
  * Copyright 2012 Free Electrons
  */
 
-#ifndef __SSD1307X_H__
-#define __SSD1307X_H__
+#ifndef __SSD130X_H__
+#define __SSD130X_H__
 
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
@@ -94,4 +94,4 @@ struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap);
 void ssd130x_remove(struct ssd130x_device *ssd130x);
 void ssd130x_shutdown(struct ssd130x_device *ssd130x);
 
-#endif /* __SSD1307X_H__ */
+#endif /* __SSD130X_H__ */
-- 
2.40.1

