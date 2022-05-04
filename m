Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF0151B178
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 23:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF0110ED81;
	Wed,  4 May 2022 21:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA4810ED81
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 21:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651701496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J9HgWbd8sU4BMyUvUsTJN8e3BPoAu1T5H5ui+stohEE=;
 b=eHnPJ1IBbWm3DjTt3PtJ0TiGQ+XfXx4SwVHojhRzjS5k6QJGF4UKjU7N5cwQMJeW9raLHu
 ceIHOVdFZvzJvw6wYFZ487eT3A6uSO0r6Nmn3TX8CCB1wC6w/+h6La3RJ1tnlmVCD7bQAg
 d6bS62DcaGdMKYzpXFY6DKmFNLggxDc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-sMGEiwpUPF6WvKp3VDt69w-1; Wed, 04 May 2022 17:58:15 -0400
X-MC-Unique: sMGEiwpUPF6WvKp3VDt69w-1
Received: by mail-wr1-f70.google.com with SMTP id
 t15-20020adfdc0f000000b001ef93643476so813276wri.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 14:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J9HgWbd8sU4BMyUvUsTJN8e3BPoAu1T5H5ui+stohEE=;
 b=uQXeS04QdNiXjc0DO/h0/jgsQzB01HrxLNd8woSxvsTl+8iDPro7nAL5bX+gpoNkVv
 yzm6kBmHZTrSJfZJHwtN6bSY978IaS1miNJhpI3ovBUBdLxGjeqvp9/JVX3w7jeOk75q
 NPs5hUXie4P9JyDrT21zLsRgPtBx+HMZhl8NNTF6zeDmQLcSpeQJ4E8K72CnfzoUbZft
 flcNmuEgYJmQT+6CDHjCZZvGNQKLBPgPinW5+R1IIsOsBjRb3SP5vr1nISwReIQT21dy
 RycDxz6BTC16FW4Db8DnVLAXTbAcgi7DH40aq2Maz53McKQfJRoKDLQSLYnq+NzDysvu
 pUhg==
X-Gm-Message-State: AOAM532V5OWCYkzUQLkATojM1Hkt3akS579vpwK+rm+BKy5WGzDGIUz6
 sY2+DySDUMDeY+Wn2yjNaINw+WIQjCg/ZSBtW0SfXyJUuC/7vkkRxzqxmuh+8hHglmAsFZ5ydBl
 URTWvJ0rAFu77NlKsELB31QbmrHsK
X-Received: by 2002:a5d:584a:0:b0:20c:5a8b:cee7 with SMTP id
 i10-20020a5d584a000000b0020c5a8bcee7mr14891880wrf.111.1651701494275; 
 Wed, 04 May 2022 14:58:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyi1rI7Ysw/yS2KuEXDRIJhqrF+e633rbFMsZfhkqQBH5RX7aHp1FggslnaX3+T4EtZ2beo3g==
X-Received: by 2002:a5d:584a:0:b0:20c:5a8b:cee7 with SMTP id
 i10-20020a5d584a000000b0020c5a8bcee7mr14891871wrf.111.1651701494069; 
 Wed, 04 May 2022 14:58:14 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q10-20020a1cf30a000000b003942a244ee9sm4553648wmq.46.2022.05.04.14.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 14:58:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] fbdev/efifb: Cleanup fb_info in .fb_destroy rather than
 .remove
Date: Wed,  4 May 2022 23:58:06 +0200
Message-Id: <20220504215806.57147-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504215151.55082-1-javierm@redhat.com>
References: <20220504215151.55082-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Peter Jones <pjones@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver is calling framebuffer_release() in its .remove callback, but
this will cause the struct fb_info to be freed too early. Since it could
be that a reference is still hold to it if user-space opened the fbdev.

This would lead to a use-after-free error if the framebuffer device was
unregistered but later a user-space process tries to close the fbdev fd.

The correct thing to do is to only unregister the framebuffer in the
driver's .remove callback, but do any cleanup in the fb_ops.fb_destroy.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/video/fbdev/efifb.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index ea42ba6445b2..cfa3dc0b4eee 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -243,6 +243,10 @@ static void efifb_show_boot_graphics(struct fb_info *info)
 static inline void efifb_show_boot_graphics(struct fb_info *info) {}
 #endif
 
+/*
+ * fb_ops.fb_destroy is called by the last put_fb_info() call at the end
+ * of unregister_framebuffer() or fb_release(). Do any cleanup here.
+ */
 static void efifb_destroy(struct fb_info *info)
 {
 	if (efifb_pci_dev)
@@ -254,6 +258,9 @@ static void efifb_destroy(struct fb_info *info)
 		else
 			memunmap(info->screen_base);
 	}
+
+	framebuffer_release(info);
+
 	if (request_mem_succeeded)
 		release_mem_region(info->apertures->ranges[0].base,
 				   info->apertures->ranges[0].size);
@@ -620,9 +627,9 @@ static int efifb_remove(struct platform_device *pdev)
 {
 	struct fb_info *info = platform_get_drvdata(pdev);
 
+	/* efifb_destroy takes care of info cleanup */
 	unregister_framebuffer(info);
 	sysfs_remove_groups(&pdev->dev.kobj, efifb_groups);
-	framebuffer_release(info);
 
 	return 0;
 }
-- 
2.35.1

