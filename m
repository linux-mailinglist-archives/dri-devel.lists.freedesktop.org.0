Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8805F72A0EC
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 19:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A672F10E6D0;
	Fri,  9 Jun 2023 17:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3676F10E6D1
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 17:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686330594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bc1LYu0VxicAbeViPWlWxEzFMdxQOVZhpaNTOwtL/hg=;
 b=PsUIIKGTxQeutSK/y6cWoYz1t7NSROSBpRw5TGIAW+SM4kn+KxY2Qkva4qjQ/zGgPEjGXb
 Qg861BnDLpYOezZ3uVBrVmjYIoe6cBFI9NKt1QNZBafwcAMCxqI2JD2IiuQUW/Eg376rH+
 iVF7rVxN/1dIDgZSHYl7Y8MvlX/ZlFg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-zK89bfSpOv6vzpo41zUQdQ-1; Fri, 09 Jun 2023 13:09:53 -0400
X-MC-Unique: zK89bfSpOv6vzpo41zUQdQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f7e64e1157so11221325e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 10:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686330592; x=1688922592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bc1LYu0VxicAbeViPWlWxEzFMdxQOVZhpaNTOwtL/hg=;
 b=ivRiL9Yco05d11ESfR7Lm4J5vQ51C77//pG+bUllEF0Da/XG+ai3APPK9QioYvpW6u
 FkQ8ijP6EHIB+12mBjUGfjHPFpAsAOb1mY/al992ikN0aus8PlX9M8SP1q/SvzF5Sc4F
 PBTKMpWJWJ+HM/TeVtdHlXWVNDJjsQFMoCAXtcnpuuulgVmdEQJAI9Ic/DCuEhutD8kw
 LOUrL3WrkYTJkiOatb4pTEDyzKeJydRPJHuv983RZ6kK1Daw5GQCJPlsptcN8yWhfM/U
 Gx1zz5xlAs8+JMCx5z4rKVfsSX6/xk5ru/8TMNj1BOrBUxe/27hKFn7AXadYpqZH7kAe
 TIqg==
X-Gm-Message-State: AC+VfDzZ60hQOrFahFC4pBRVGhRoGb/bLo2eGR33SE+M4xLD4vLpp/oJ
 /ffrpVm7MCWSwi+9s1ZaLqDxY27GI7u/4BlQtf+qzCag5Tf9R01lj4N1yP50zEag/QB9tbuS406
 6q6D+oJhI10DMyWOEJuPtrUDgVe0g
X-Received: by 2002:a05:600c:21c7:b0:3f5:ce4:6c3f with SMTP id
 x7-20020a05600c21c700b003f50ce46c3fmr1652655wmj.7.1686330592161; 
 Fri, 09 Jun 2023 10:09:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5wjFaw/BVu+9Gvq+xAzeThM+FlH6UNA9UpjkJJiDQkMhPrOSGy6f7edHqXEEEv7fxbnnCJng==
X-Received: by 2002:a05:600c:21c7:b0:3f5:ce4:6c3f with SMTP id
 x7-20020a05600c21c700b003f50ce46c3fmr1652644wmj.7.1686330591943; 
 Fri, 09 Jun 2023 10:09:51 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0ad500b003f7310a3ffasm3265526wmr.2.2023.06.09.10.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 10:09:51 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] drm/ssd130x: Remove hardcoded bits-per-pixel in
 ssd130x_buf_alloc()
Date: Fri,  9 Jun 2023 19:09:40 +0200
Message-Id: <20230609170941.1150941-6-javierm@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609170941.1150941-1-javierm@redhat.com>
References: <20230609170941.1150941-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver only supports OLED controllers that have a native DRM_FORMAT_C1
pixel format and that is why it has harcoded a division of the width by 8.

But the driver might be extended to support devices that have a different
pixel format. So it's better to use the struct drm_format_info helpers to
compute the size of the buffer, used to store the pixels in native format.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---

(no changes since v1)

 drivers/gpu/drm/solomon/ssd130x.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 0be3b476dc60..b3dc1ca9dc10 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -150,9 +150,16 @@ static int ssd130x_buf_alloc(struct ssd130x_device *ssd130x)
 {
 	unsigned int page_height = ssd130x->device_info->page_height;
 	unsigned int pages = DIV_ROUND_UP(ssd130x->height, page_height);
+	const struct drm_format_info *fi;
+	unsigned int pitch;
 
-	ssd130x->buffer = kcalloc(DIV_ROUND_UP(ssd130x->width, 8),
-				  ssd130x->height, GFP_KERNEL);
+	fi = drm_format_info(DRM_FORMAT_C1);
+	if (!fi)
+		return -EINVAL;
+
+	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
+
+	ssd130x->buffer = kcalloc(pitch, ssd130x->height, GFP_KERNEL);
 	if (!ssd130x->buffer)
 		return -ENOMEM;
 
-- 
2.40.1

