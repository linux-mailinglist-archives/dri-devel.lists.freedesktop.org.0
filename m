Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7426C38C7B2
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 15:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806206F630;
	Fri, 21 May 2021 13:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A37B6F630
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 13:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621603165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=svG8Sugh9t0pcYUu5BPc0joM8XrQP4InyHchcRw1OeQ=;
 b=AlgA7AkTyXDaaO2y9WhzwNEH5PzUr9rTYEmc1BhqaVVRAgKOc6ZQjDOiLcspQ/RuBjPsE9
 0PSTFwRYkSB8sOLCayFUnmJETfUB26hjBqNnbXqpsE8Mj6L6ueaNQwjbJs0kPGOiyWKpK0
 1JYtzQOTL8xdzsU4HPDhPe0xcaeKRdY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-TS4cc-vxOVqfsuP_jgz8sQ-1; Fri, 21 May 2021 09:19:22 -0400
X-MC-Unique: TS4cc-vxOVqfsuP_jgz8sQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 129-20020a1c02870000b0290176ef5297e3so4104639wmc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 06:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=svG8Sugh9t0pcYUu5BPc0joM8XrQP4InyHchcRw1OeQ=;
 b=Fc/yguE1AxmJDX7bX0L6/u7oAifdB0pwLHhNS65iGAnTIo+yNXlebsjpl7/BuHgenW
 otBAX3Dusyc4rV6jy92PM/oa6aM5yZ77Bub5gVmEq0t4unkB+b4g6DEzx0wlKYdfu0dH
 kbzI86GZTEYZRUwX4qkmzP0ZMkEHZlTxxHeDxpnpwhoLmzgddhfmaF/Z4fK6a9HBMaSd
 R7gLjpyKv7Ledykm4A5wFZOnAY5VasHp16+FNaIh6UhFK5vqAV9+9VjYpxnnuDM18gGh
 C4qKdByyBI3P56Vz4XkTepz/2YFRjBo8esmoCcdVUPCn+OspEml03d0COPTRJYWSyvM1
 ODeA==
X-Gm-Message-State: AOAM5307x2RkICMTw/n7jtI5VER9IjzVahN0LbsKvXsabr5kOmupSjIl
 HAcGYi9GImpXccYYp03mxYm46GJLa1N/xz50lY1qts3k2J9NurmeS5bOh/2khPPSxfZocsDa3Mo
 x2Jt3LHvPB53FuLNKfRrWNr1QdAH3
X-Received: by 2002:adf:e3c8:: with SMTP id k8mr9574417wrm.212.1621603160937; 
 Fri, 21 May 2021 06:19:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc305xT6zlfb+PcPn86ttBaAzcRsi0z+v9X45OCoUZSf6XL8B6HYzxPfoRb3ZCCBvtptJDMQ==
X-Received: by 2002:adf:e3c8:: with SMTP id k8mr9574388wrm.212.1621603160720; 
 Fri, 21 May 2021 06:19:20 -0700 (PDT)
Received: from minerva.redhat.com ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id z12sm7489525wmc.5.2021.05.21.06.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 06:19:20 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/fb-helper: improve DRM fbdev emulation device names
Date: Fri, 21 May 2021 15:19:10 +0200
Message-Id: <20210521131910.3000689-1-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Framebuffer devices that are registered by DRM drivers for fbdev emulation
have a "drmfb" suffix in their name. But makes them to be quite confusing
if a driver already has "drm" in its name:

$ cat /proc/fb
0 rockchipdrmdrmfb

$ cat /proc/fb
0 simpledrmdrmfb

Instead, let's just add a "-fb" suffix to denote that are DRM drivers FB:

$ cat /proc/fb
0 rockchipdrm-fb

$ cat /proc/fb
0 simpledrm-fb

Suggested-by: Peter Robinson <pbrobinson@gmail.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/drm_fb_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index f6baa204612..bbaff92c509 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1737,7 +1737,7 @@ void drm_fb_helper_fill_info(struct fb_info *info,
 			       sizes->fb_width, sizes->fb_height);
 
 	info->par = fb_helper;
-	snprintf(info->fix.id, sizeof(info->fix.id), "%sdrmfb",
+	snprintf(info->fix.id, sizeof(info->fix.id), "%s-fb",
 		 fb_helper->dev->driver->name);
 
 }
-- 
2.31.1

