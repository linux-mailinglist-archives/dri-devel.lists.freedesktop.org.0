Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C781A51BE0B
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 13:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE36610F665;
	Thu,  5 May 2022 11:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.133.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A3810F665
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 11:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651750302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UlMJQ+wz02RD+81KzAT+P3KjFBfmXeVQ3/vybVcCubw=;
 b=TlzMNEusw/jrXw8KFW0575PH8j3zy3cx9atnB40M+dsv6alGDakZYmHDWwbO78GBLUx18+
 zJcIKVKiVALmFKZsQNvHj1qS0cJDgonmRpQug0MK9nKJfGRS8F6n+ql5/LW6ZT14nx++L1
 Xp9dx6SjwOuz3tn9mdGwVOxe4WosFhc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-ERAe6GeUOXeTYWStBGP5kg-1; Thu, 05 May 2022 07:31:41 -0400
X-MC-Unique: ERAe6GeUOXeTYWStBGP5kg-1
Received: by mail-wr1-f70.google.com with SMTP id
 l7-20020adfbd87000000b0020ac0a4d23dso1362973wrh.17
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 04:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UlMJQ+wz02RD+81KzAT+P3KjFBfmXeVQ3/vybVcCubw=;
 b=CDrelwkygkazZ+T3BW+uRCnbZsQ8f/oD3iB3eJGi66MaPFoJ2/HiG+cgwqtMMBz2JE
 HeJMy8hJ8FHaUtCBOyu4EmBZiDfLdsCy2Ev1k31BOa1BbYiygBtmy0dvYV8Xsd0CO+DU
 rO/g5dUkSIqucXNvxwvV/aI5hwPnmzZx+E0MMwxAZJi1bs07vIwsClsVOEPJ9GdgRUfP
 dYiINaP6mM5a8wEuw9hG4JmO4opjsSjjJNHNvn/purvAL3TrGV80y2nn3wj4aYt4SDvI
 mmoj86EONFcLXkW97Gs/M2a/SLF43DEtoZYDh2F4lSfE+wXKHPH/AIzYO4wodqRQbCHC
 9Irw==
X-Gm-Message-State: AOAM530QNRuGTgczDqTSQpSnc9jW39Z4gJlfl8I45E0thiu1QCZDGNek
 0FowQd5Qri9BtRi8R4W9t3BDzM5VaKOfohG4+dGW3reWgQseuvIq09oYFPb09uYA8uCDdlIXlqi
 LS4clFCaAboqeRE7A8eB2MSh4f998
X-Received: by 2002:a05:6000:1548:b0:20c:5ca8:7722 with SMTP id
 8-20020a056000154800b0020c5ca87722mr16350992wry.712.1651750300439; 
 Thu, 05 May 2022 04:31:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxug4drE+2lM0Y2bQGAKqHc9/jzcqI1egXtMk1eOS4NmBEoxmupUXagiI2LBGTtqENwnb2VKg==
X-Received: by 2002:a05:6000:1548:b0:20c:5ca8:7722 with SMTP id
 8-20020a056000154800b0020c5ca87722mr16350970wry.712.1651750300187; 
 Thu, 05 May 2022 04:31:40 -0700 (PDT)
Received: from minerva.. ([90.167.94.135]) by smtp.gmail.com with ESMTPSA id
 k1-20020a5d5181000000b0020c5253d8f5sm995809wrv.65.2022.05.05.04.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 04:31:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] fbdev: simplefb: Cleanup fb_info in .fb_destroy rather
 than .remove
Date: Thu,  5 May 2022 13:31:25 +0200
Message-Id: <20220505113128.264963-3-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505113128.264963-1-javierm@redhat.com>
References: <20220505113128.264963-1-javierm@redhat.com>
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
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
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
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---

(no changes since v1)

 drivers/video/fbdev/simplefb.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index 94fc9c6d0411..2c198561c338 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -84,6 +84,10 @@ struct simplefb_par {
 static void simplefb_clocks_destroy(struct simplefb_par *par);
 static void simplefb_regulators_destroy(struct simplefb_par *par);
 
+/*
+ * fb_ops.fb_destroy is called by the last put_fb_info() call at the end
+ * of unregister_framebuffer() or fb_release(). Do any cleanup here.
+ */
 static void simplefb_destroy(struct fb_info *info)
 {
 	struct simplefb_par *par = info->par;
@@ -94,6 +98,8 @@ static void simplefb_destroy(struct fb_info *info)
 	if (info->screen_base)
 		iounmap(info->screen_base);
 
+	framebuffer_release(info);
+
 	if (mem)
 		release_mem_region(mem->start, resource_size(mem));
 }
@@ -545,8 +551,8 @@ static int simplefb_remove(struct platform_device *pdev)
 {
 	struct fb_info *info = platform_get_drvdata(pdev);
 
+	/* simplefb_destroy takes care of info cleanup */
 	unregister_framebuffer(info);
-	framebuffer_release(info);
 
 	return 0;
 }
-- 
2.35.1

