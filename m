Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0523C51BE0C
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 13:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E1C10F72E;
	Thu,  5 May 2022 11:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.133.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE90110F6EE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 11:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651750305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kHj6RqHilBMUbncDK/2tHoS4NrC5xcTylW4aCqmdFU0=;
 b=iSsqGr79sKhdA07S06z4jE/swb6sVEB2eswNwbgPurZC8rBt80MPjWt+MdtGD0Vrq+cSi9
 Rfb+yPMCO8viRDrbllqHJTCIVipNrDgOOy9DI+F7FnzThZ6K3ikH8g2X+dk7Q0nY6WGNV+
 2BwODhMHelTfAL8vMGM6/76ZsV2+H8I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-Fr6WQdcINl2_sq3SKDNSRQ-1; Thu, 05 May 2022 07:31:43 -0400
X-MC-Unique: Fr6WQdcINl2_sq3SKDNSRQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 v191-20020a1cacc8000000b0038ce818d2efso1598860wme.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 04:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kHj6RqHilBMUbncDK/2tHoS4NrC5xcTylW4aCqmdFU0=;
 b=3T8s6aG0PHRtglDpRE8sIYeNPMNAu809Y7CXC5vXYwHsfbdqloXMsYVQDKLh0LeJtj
 wNDH9hoSzByxWRO1nSZrkk7Ri06GauDkhswkdcTrGHEiqAuoVVe+DM+svavogi31+HLG
 UZVff835UP9zoU9++lw54Mnd/cC/E+py66ZPWCPyYjEtIPBalcDllFgl+Y8bHF7n2E93
 K1cFLNr7Q8KjE+25dIk1Qb1QiXumUvSq8tEhdxOquVxJ9h8KDYbs/h1Ns198WSqODIXk
 /fTBM0oMUyMUrg1BFCDCM1jjdn8jjoXLVVH/ER78vwFmDAUu9NvD03Pu15OKUCj3Lj0h
 0JBQ==
X-Gm-Message-State: AOAM533oq2lPBM0imJoXaVnqRY2mDnAg7E2+uWUF3qV2ICuqA430GfgO
 oaL1bGDfysXT4TG493PhTweU6ZiIfNExY+UxAXEZyny65mEm1pzsdaiKBkVwASxCh6fLX/5QJug
 tiGjOZxnjrNrsqZavC8th1eGlVYRD
X-Received: by 2002:a05:600c:48a6:b0:394:39c3:52 with SMTP id
 j38-20020a05600c48a600b0039439c30052mr4238780wmp.66.1651750302491; 
 Thu, 05 May 2022 04:31:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0kdiNiZLFcv712Ydt7i9wnRcz/9iaODWbWGG3Ol0GG6/v5Xr4uslaghhGTnrCqtdWkt6x7A==
X-Received: by 2002:a05:600c:48a6:b0:394:39c3:52 with SMTP id
 j38-20020a05600c48a600b0039439c30052mr4238760wmp.66.1651750302269; 
 Thu, 05 May 2022 04:31:42 -0700 (PDT)
Received: from minerva.. ([90.167.94.135]) by smtp.gmail.com with ESMTPSA id
 k1-20020a5d5181000000b0020c5253d8f5sm995809wrv.65.2022.05.05.04.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 04:31:41 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] fbdev: efifb: Cleanup fb_info in .fb_destroy rather
 than .remove
Date: Thu,  5 May 2022 13:31:26 +0200
Message-Id: <20220505113128.264963-4-javierm@redhat.com>
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
 dri-devel@lists.freedesktop.org, Peter Jones <pjones@redhat.com>,
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

