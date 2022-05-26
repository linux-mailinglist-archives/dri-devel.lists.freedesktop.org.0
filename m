Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C82535416
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 21:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCD910E161;
	Thu, 26 May 2022 19:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6748710E161
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 19:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653594481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IqmegdZhOWmFPqYA7uqlJOlfLWdBgu4zMEYzTrKy8L4=;
 b=haSe/pLdT9LdD3UFM+LY0/Ily1TB0wfZfZkrsa3m1aY0kYWwT407XYzejYKJCaJpAt0W2e
 AztS8v4SBlOOxp2Xbzqdj++Kshl+9f1lUpUDC4sFk6R2fIU96sncHTQe1MDra8LCLo2sow
 o5877xXIgdjir2zbDR346fCZVK4FqyE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-r8cmrKOePuuLFGGCkiCXsw-1; Thu, 26 May 2022 15:47:57 -0400
X-MC-Unique: r8cmrKOePuuLFGGCkiCXsw-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so1291978wmr.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 12:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IqmegdZhOWmFPqYA7uqlJOlfLWdBgu4zMEYzTrKy8L4=;
 b=vQ0bkBHMTL4d+EHUC4ReHUb8k0bhX1pvkBBidUdbXvl2T3vi0kC5kiJMKStsGjdhEI
 8voXcY2rF8FUuVl7mEQy/uyK6kz4oKdhU/7qZXprgSEZVkU+gNLBsY5IO+eQjtRDpTE3
 t50aynkUJmnoaV5ESdHDA8Zao7A9m4WC/EOPPJSYxKpAZuqnIrzzYTBPDd5luhW7xnUn
 2cIBFkD6ugIjcCqLpdW+NmKHK1bFA/nFavAbozHziYQisU8eVipMPZA4rK7tHwXgr5t8
 2xmwV6kBc3mytJM9T4cLtbF6GDBI9EEtcH/4Gh/CDGzDRbpzg00Kl+XHBdaMB3x0+IAb
 P1Aw==
X-Gm-Message-State: AOAM532fmnA10NsYUCh30Kf5DeXmCmH3NtWVTDqhA+dzQv3T41Rb8gTc
 KlQOtX1o9if1jMbJ7+ItXlPvBZrah8FwiGJKNxbfkEJu1kNz6BVrUf0Vl+v9y4Wc9Aqz6P8w1Ns
 DaGH8wrINIRQJuzD12Il+7D+qHjKn
X-Received: by 2002:a05:6000:783:b0:210:179b:1ff4 with SMTP id
 bu3-20020a056000078300b00210179b1ff4mr147081wrb.168.1653594476085; 
 Thu, 26 May 2022 12:47:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyt0PbPjNk+g5Uz3e3z7a4zGdrz/A2I0RbjgSsZZj2AKebvL330j4C2+ucus1UQuH8ZJcnOrg==
X-Received: by 2002:a05:6000:783:b0:210:179b:1ff4 with SMTP id
 bu3-20020a056000078300b00210179b1ff4mr147071wrb.168.1653594475802; 
 Thu, 26 May 2022 12:47:55 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 az26-20020a05600c601a00b003942a244edfsm25101wmb.36.2022.05.26.12.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 12:47:55 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: vesafb: Fix a use-after-free due early fb_info cleanup
Date: Thu, 26 May 2022 21:47:52 +0200
Message-Id: <20220526194752.307192-1-javierm@redhat.com>
X-Mailer: git-send-email 2.36.1
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
 dri-devel@lists.freedesktop.org, Pascal Ernster <dri-devel@hardfalcon.net>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit b3c9a924aab6 ("fbdev: vesafb: Cleanup fb_info in .fb_destroy rather
than .remove") fixed a use-after-free error due the vesafb driver freeing
the fb_info in the .remove handler instead of doing it in .fb_destroy.

This can happen if the .fb_destroy callback is executed after the .remove
callback, since the former tries to access a pointer freed by the latter.

But that change didn't take into account that another possible scenario is
that .fb_destroy is called before the .remove callback. For example, if no
process has the fbdev chardev opened by the time the driver is removed.

If that's the case, fb_info will be freed when unregister_framebuffer() is
called, making the fb_info pointer accessed in vesafb_remove() after that
to no longer be valid.

To prevent that, move the expression containing the info->par to happen
before the unregister_framebuffer() function call.

Fixes: b3c9a924aab6 ("fbdev: vesafb: Cleanup fb_info in .fb_destroy rather than .remove")
Reported-by: Pascal Ernster <dri-devel@hardfalcon.net>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/video/fbdev/vesafb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
index e25e8de5ff67..929d4775cb4b 100644
--- a/drivers/video/fbdev/vesafb.c
+++ b/drivers/video/fbdev/vesafb.c
@@ -490,11 +490,12 @@ static int vesafb_remove(struct platform_device *pdev)
 {
 	struct fb_info *info = platform_get_drvdata(pdev);
 
-	/* vesafb_destroy takes care of info cleanup */
-	unregister_framebuffer(info);
 	if (((struct vesafb_par *)(info->par))->region)
 		release_region(0x3c0, 32);
 
+	/* vesafb_destroy takes care of info cleanup */
+	unregister_framebuffer(info);
+
 	return 0;
 }
 
-- 
2.36.1

