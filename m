Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8A948763B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 12:07:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B0D10F512;
	Fri,  7 Jan 2022 11:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8691510F512
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 11:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mErlQ9bFbWCh8pEI+M0nh3UElgFrVyLNdlmQovZz1FE=;
 b=WzzMctE8jzkXqC4ddWzpNACGPzaXDuhglDrbYKMGdl9G2ugLN6A9gohjwJSUydwlnuig/n
 Q+93zDG1V9xOfUFIge+trCEI48FUz6b6gCjlwdeygoK1K0t2kAPO1lOi8NAJVLHdjoEcy4
 wWMsIQ2ZwO4r6XDz41EjmM8Lf1BJWbE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-peQ27zRzNh2MjMNKNhidhg-1; Fri, 07 Jan 2022 06:07:35 -0500
X-MC-Unique: peQ27zRzNh2MjMNKNhidhg-1
Received: by mail-wm1-f72.google.com with SMTP id
 m15-20020a05600c3b0f00b003465ede5e04so1354275wms.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 03:07:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mErlQ9bFbWCh8pEI+M0nh3UElgFrVyLNdlmQovZz1FE=;
 b=r+cXyK3PaC9BjtbyiOnaXtJp/vjYxsKFiHlASka3VXSOpTJEqC+q0OGEWQ1OlSS8ks
 l0eYVQvUhKnkOMS34HhBp3r5PZOEoCM2VVxUuS+16KIGyMyu+c7+OtEq8hg3pbGyrlCu
 YuCW17ZKLuX0pHAL8gs4HQQm3ify8op626etedQMZPS3+Xl1i8WRB3afQjGIKUoADWJT
 3fxFi6UPvsEXn5J4civBsHqCfE+pF+GOr+CyJ9OhCwSAcyuC4XV8mje9KE6NYLJg2d2l
 E0fO7pDhZRFJn3OrOJhya/em3AwjaXs2pI4TXFhpZxkwYKu/ZHrjjAl88oIohV6FJsBZ
 ccPg==
X-Gm-Message-State: AOAM530smQ9B7ZG8X+otILCoJw4iK/Jcq1QeNoI+ZpuD6Lp3wI+up+47
 tsplmxOUUzKqoHYWjoQdKl85e0k+EIvzv1JRb85+eVFLJApN9YD9LnbJSXeMKIDeCoXEALVenkx
 54UcMhp6CyTKwRqnxsxj2DFdLLH0U
X-Received: by 2002:adf:d1ef:: with SMTP id g15mr56009297wrd.198.1641553654026; 
 Fri, 07 Jan 2022 03:07:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpfs8sNGNszizzpb8wIqMXaS0IM36pG7DV7riTr9kWpDEc6r6DU/cu0qurtWMt/rqjTZw+Ug==
X-Received: by 2002:adf:d1ef:: with SMTP id g15mr56009285wrd.198.1641553653870; 
 Fri, 07 Jan 2022 03:07:33 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id r9sm9337273wmq.18.2022.01.07.03.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:07:33 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] video: vga16fb: Only probe for EGA and VGA 16 color
 graphic cards
Date: Fri,  7 Jan 2022 12:07:23 +0100
Message-Id: <20220107110723.323276-3-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107110723.323276-1-javierm@redhat.com>
References: <20220107110723.323276-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, stable@vger.kernel.org,
 Kris Karas <bugs-a21@moonlit-rail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vga16fb framebuffer driver only supports Enhanced Graphics Adapter
(EGA) and Video Graphics Array (VGA) 16 color graphic cards.

But it doesn't check if the adapter is one of those or if a VGA16 mode
is used. This means that the driver will be probed even if a VESA BIOS
Extensions (VBE) or Graphics Output Protocol (GOP) interface is used.

This issue has been present for a long time but it was only exposed by
commit d391c5827107 ("drivers/firmware: move x86 Generic System
Framebuffers support") since the platform device registration to match
the {vesa,efi}fb drivers is done later as a consequence of that change.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=215001
Fixes: d391c5827107 ("drivers/firmware: move x86 Generic System Framebuffers support")
Reported-by: Kris Karas <bugs-a21@moonlit-rail.com>
Cc: <stable@vger.kernel.org> # 5.15.x
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Tested-by: Kris Karas <bugs-a21@moonlit-rail.com>
---

 drivers/video/fbdev/vga16fb.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index 3347c9b6a332..72b6aeceeff8 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -1422,6 +1422,18 @@ static int __init vga16fb_init(void)
 
 	vga16fb_setup(option);
 #endif
+
+	/* only EGA and VGA in 16 color graphic mode are supported */
+	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EGAC &&
+	    screen_info.orig_video_isVGA != VIDEO_TYPE_VGAC)
+		return -ENODEV;
+
+	if (screen_info.orig_video_mode != 0x0D &&	/* 320x200/4 (EGA) */
+	    screen_info.orig_video_mode != 0x0E &&	/* 640x200/4 (EGA) */
+	    screen_info.orig_video_mode != 0x10 &&	/* 640x350/4 (EGA) */
+	    screen_info.orig_video_mode != 0x12)	/* 640x480/4 (VGA) */
+		return -ENODEV;
+
 	ret = platform_driver_register(&vga16fb_driver);
 
 	if (!ret) {
-- 
2.33.1

