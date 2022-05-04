Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EA4519D57
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 12:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0EE10F299;
	Wed,  4 May 2022 10:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D3F310F299
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 10:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651661510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NJbghp3+LJBmX5DLTTjlRaPAzEhF/Td/rezzenPMwDw=;
 b=aoutk85PvEq93C2rcXCEzMDdSaJTs8HsbemXQ1M6qnwwV41pxld6zweZ2EQtApY96LN/q+
 SXvrhxSSaVZM4YdhKQ8u1ErSzMq03bzrNCA9lq32SISLAACF8OB5D27Fkyw4YjzEqj1pJZ
 VO1t7BHmcPMVnCcnzRwNT7sNWHywc6k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-ysx99NR1PJC4CawB5HYIsg-1; Wed, 04 May 2022 06:51:49 -0400
X-MC-Unique: ysx99NR1PJC4CawB5HYIsg-1
Received: by mail-wm1-f69.google.com with SMTP id
 g14-20020a1c4e0e000000b0039425ef54d6so484857wmh.9
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 03:51:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NJbghp3+LJBmX5DLTTjlRaPAzEhF/Td/rezzenPMwDw=;
 b=54P9DiA0YSFR9sTbl/Fnm3m3R+KOdDmtLeRR4gx1oJGmIZGWsZkf6/OYGB3cUhuEwk
 rGaiCI6s7H4jKyOJTCPJvmIW3ABa5wN7bdf/Js1OD5a+xAqRtrMa6YwyXgyoOlFGLnNB
 8I0Rq37kvPblWl6RcvYqzAd1q7/iMFcKa1BxVWypXU+8tK9zBNsDXLujw0cD4WTS5kXe
 Do9TWT9GBzrUTs0iwJTxodeNKPyT45sz/G/2cnH8SdABiZWAU0leh5xD7tFiz6xB/Qtp
 TVkt+snXxFN+3hPMxnayjVwSUllMC+wWN0oZSYMGwlMMm4/roJdfE7e6z0Vy7h9F4v6l
 +aJg==
X-Gm-Message-State: AOAM533C3tOgzqYRX2f7GDdIr5IZCZU7AwoPtpzs7QMaW2dd9MYz3Chp
 IcOhmF2v1hui8xmRIh6Zf2HzBcQBUMHxlX8cP0iwEzWQr2D1bWWAFc8cW5usa1YUzoFf3QhKXvf
 Q4CZVzfy4fNm5vSlw5irVGr985Nt+
X-Received: by 2002:a05:600c:3b93:b0:394:57c8:5901 with SMTP id
 n19-20020a05600c3b9300b0039457c85901mr2728271wms.77.1651661508153; 
 Wed, 04 May 2022 03:51:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHwZYfl8uqgIw+kp7JWSBmK2205DO05PCu90DnmuLlXgv2vl2YCs3ySMEP+CKrlNnqkYViRw==
X-Received: by 2002:a05:600c:3b93:b0:394:57c8:5901 with SMTP id
 n19-20020a05600c3b9300b0039457c85901mr2728247wms.77.1651661507884; 
 Wed, 04 May 2022 03:51:47 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n14-20020adfc60e000000b0020c6a524fd5sm6700603wrg.99.2022.05.04.03.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 03:51:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "fbdev: Make fb_release() return -ENODEV if fbdev was
 unregistered"
Date: Wed,  4 May 2022 12:51:40 +0200
Message-Id: <20220504105140.746344-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit aafa025c76dcc7d1a8c8f0bdefcbe4eb480b2f6a. That commit
attempted to fix a NULL pointer dereference, caused by the struct fb_info
associated with a framebuffer device to not longer be valid when the file
descriptor was closed.

But the solution was wrong since it was just papering over the issue, and
also would leak any resources that might be reference counted in fb_open.

Instead, the fbdev drivers that are releasing the fb_info too soon should
be fixed to prevent this situation to happen.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/video/fbdev/core/fbmem.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 97eb0dee411c..a6bb0e438216 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1434,10 +1434,7 @@ fb_release(struct inode *inode, struct file *file)
 __acquires(&info->lock)
 __releases(&info->lock)
 {
-	struct fb_info * const info = file_fb_info(file);
-
-	if (!info)
-		return -ENODEV;
+	struct fb_info * const info = file->private_data;
 
 	lock_fb_info(info);
 	if (info->fbops->fb_release)
-- 
2.35.1

