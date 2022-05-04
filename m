Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5639851B175
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 23:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8586110ED7E;
	Wed,  4 May 2022 21:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE45810ED7E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 21:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651701454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d5E68EYuJS0cLv3NadyCR6Subawx0t/0D3XRnBIF5EA=;
 b=HVo3iQlQaEVBTUWXiSdItTn9OMURgoYPGrIcMB8dcOEUF8ERxKoo24qBUFEjAjtd7szaGu
 4VVjfeV14hITJ1kOEbjfaDU17FCrFXbgPmT6MUuxYRndZY5iMaL6X9dUlrtsDGYW68oFiX
 e4H9Rmpl9jvHJJkTlQ4BNPHmmaQwe60=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-jaar5A-IO42UlDXsQ1DueA-1; Wed, 04 May 2022 17:57:31 -0400
X-MC-Unique: jaar5A-IO42UlDXsQ1DueA-1
Received: by mail-wm1-f71.google.com with SMTP id
 h65-20020a1c2144000000b0038e9ce3b29cso3584479wmh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 14:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d5E68EYuJS0cLv3NadyCR6Subawx0t/0D3XRnBIF5EA=;
 b=ZPKugqlHJeIiSuMye4QSDwxA2Pzs6q1AibJOqdpVMeWpi+PISRgh8M0RdSkEiTVa9/
 k5QWc2OEv+a8A/v0S3bsPXY3ILcbNykiKEuRsTWCeUsWalnvr2PIaRs7Bg4HO7OtrpPV
 CuV7Ko6FQSMZx+N5wolQrVhlaxHgoaR7csDbWhvumuRJ1r+dg4AVswVMW7ZBSE3ZwGfo
 0lGoNCN63Z4rPe/f9GdfoT8W3ehX27rGhEJas1W/xYSCSi/EHQYSLBP1QIitHddPo72D
 HKC09gqge1cGyUDrEq+ZUww7MiFrn9Xo1dqbp71pK9STSOvIhZ/Z7hu+uaTdNz4A6utR
 vMBw==
X-Gm-Message-State: AOAM531uo+wZqgbPIlNaQ2QuqevFVw1J5kWusEaP9OBtCKryS6YIoUNX
 WVA2/D3brhVY+g5ESJ1rOgZbFBm1cQ/uV6ix3P46/oElWfsmz31w4hIWRY3YFW5YaiHB+xmV520
 PfWev3xKlV04hBSe8UbyFJvT10Jp3
X-Received: by 2002:a7b:c199:0:b0:394:26d0:a6a9 with SMTP id
 y25-20020a7bc199000000b0039426d0a6a9mr1363675wmi.116.1651701450033; 
 Wed, 04 May 2022 14:57:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1qMT5MICoWPkF4Ji0uGyxOCxsrRQ04CuhwRhiVVfyNZ8vIEl2jgygGi1ttKO9pWOlUIHlhA==
X-Received: by 2002:a7b:c199:0:b0:394:26d0:a6a9 with SMTP id
 y25-20020a7bc199000000b0039426d0a6a9mr1363665wmi.116.1651701449798; 
 Wed, 04 May 2022 14:57:29 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 11-20020a05600c264b00b0039444973258sm5213068wmy.0.2022.05.04.14.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 14:57:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] fbdev/simplefb: Cleanup fb_info in .fb_destroy rather
 than .remove
Date: Wed,  4 May 2022 23:57:22 +0200
Message-Id: <20220504215722.56970-1-javierm@redhat.com>
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
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>
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

