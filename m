Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A675351BE0D
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 13:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C833910F79D;
	Thu,  5 May 2022 11:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.133.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A137910F77B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 11:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651750315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iaNxVGQEFp6Vh3rpWtfph/7pGGoZXolh5bDdGY4BamI=;
 b=AmbckSuMQPwYAZjMxJ6aK17moAnuuwlFt+XV7yBEUQutCZXhAEhdjIdrk5RkZymzFmYUTM
 b9/EM7gp4NsT0pfwqwaklj+gQlXNKoXcRUDQJ97tvn7GCs4IiekE0adI0x5ZaeKLjxqhxd
 ffDWARUmeycjRUK/I6FK2pYWRBElFCc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-MLIyLstaOcCuxlsP41K6bQ-1; Thu, 05 May 2022 07:31:45 -0400
X-MC-Unique: MLIyLstaOcCuxlsP41K6bQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 p18-20020adf9592000000b00207bc12decbso1352307wrp.21
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 04:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iaNxVGQEFp6Vh3rpWtfph/7pGGoZXolh5bDdGY4BamI=;
 b=cRDFq0CLmoudhtrfNlghcdKM9Ifz0fC6scTfOJe8oLu1B9GBIImEds0hDx5Bu4ub+J
 rvHs6csx0GMi7wcXhU+HASJKpNBfb7XS6w3yoethClm8opISu0e861jDiagYAX9Xxk32
 XtyuVXFfMxm1uqCt4yfwgo3OTO1Akvbi69zf+yWCO07Ru54PbJKwGar0wZ2aSE5TcXen
 pIdG5k8hynSo9Ejf3sDRjI6bGx3a/7A3evpMz2+aviZacrpZ6rJPz3CzFY+BUscPmmvG
 LkIont0OIyFCUTZZ46/twCKbsh9/wRW0hw9ldJOcxTHbZgUxXNCv8nD5NHwGaT5BBpr1
 nWxQ==
X-Gm-Message-State: AOAM530dButi/SV+SD6qfN4LZODxvFDA42VcGSo/Qc5Decm6wWG8DJA3
 APbx8hX9lE1263QblVhHAkTaBm3xs62paGbIW3rLcN/OcMoN/8NRM0+Zj7wnD9WDU9ukhDFEGlP
 LpXPupqVjYUw1XtF07kG3e3FGKNlz
X-Received: by 2002:adf:e3c1:0:b0:20a:aba9:9b38 with SMTP id
 k1-20020adfe3c1000000b0020aaba99b38mr20119955wrm.673.1651750304422; 
 Thu, 05 May 2022 04:31:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwogTeQYgdTtWNZ/wNca28ZWGYyN1l0Yo2mnXOCjf6sBJLP+nj0+3gp8L+KGNj+gcXV021TEA==
X-Received: by 2002:adf:e3c1:0:b0:20a:aba9:9b38 with SMTP id
 k1-20020adfe3c1000000b0020aaba99b38mr20119937wrm.673.1651750304208; 
 Thu, 05 May 2022 04:31:44 -0700 (PDT)
Received: from minerva.. ([90.167.94.135]) by smtp.gmail.com with ESMTPSA id
 k1-20020a5d5181000000b0020c5253d8f5sm995809wrv.65.2022.05.05.04.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 04:31:43 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] fbdev: vesafb: Cleanup fb_info in .fb_destroy rather
 than .remove
Date: Thu,  5 May 2022 13:31:27 +0200
Message-Id: <20220505113128.264963-5-javierm@redhat.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
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

Changes in v2:
- Also do the change for vesafb (Thomas Zimmermann).

 drivers/video/fbdev/vesafb.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
index df6de5a9dd4c..1f03a449e505 100644
--- a/drivers/video/fbdev/vesafb.c
+++ b/drivers/video/fbdev/vesafb.c
@@ -179,6 +179,10 @@ static int vesafb_setcolreg(unsigned regno, unsigned red, unsigned green,
 	return err;
 }
 
+/*
+ * fb_ops.fb_destroy is called by the last put_fb_info() call at the end
+ * of unregister_framebuffer() or fb_release(). Do any cleanup here.
+ */
 static void vesafb_destroy(struct fb_info *info)
 {
 	struct vesafb_par *par = info->par;
@@ -187,7 +191,13 @@ static void vesafb_destroy(struct fb_info *info)
 	arch_phys_wc_del(par->wc_cookie);
 	if (info->screen_base)
 		iounmap(info->screen_base);
+
+	if (((struct vesafb_par *)(info->par))->region)
+		release_region(0x3c0, 32);
+
 	release_mem_region(info->apertures->ranges[0].base, info->apertures->ranges[0].size);
+
+	framebuffer_release(info);
 }
 
 static struct fb_ops vesafb_ops = {
@@ -484,10 +494,8 @@ static int vesafb_remove(struct platform_device *pdev)
 {
 	struct fb_info *info = platform_get_drvdata(pdev);
 
+	/* vesafb_destroy takes care of info cleanup */
 	unregister_framebuffer(info);
-	if (((struct vesafb_par *)(info->par))->region)
-		release_region(0x3c0, 32);
-	framebuffer_release(info);
 
 	return 0;
 }
-- 
2.35.1

