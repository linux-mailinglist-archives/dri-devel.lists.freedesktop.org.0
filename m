Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB554895CC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 10:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B80912B5FA;
	Mon, 10 Jan 2022 09:56:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3A812B5D0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 09:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641808594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DGDm1oaaWKUbsURSYDtt3eA6CLvZDH+FDjQaP+AuY/8=;
 b=MhNKCkehmvi/gql0Yym8SvkrI5ZRq4WFlIUD5VdrTc4wVeh3Ga2TTXmT+ylYEDg22FO9yh
 6/mHmXAu77v8JeWLtMeRaiT/UYEj0MjKkhTdrsFiCk5Di2s8wO9zlNeaIXiF1GeAe8K4uP
 /P4JyMBNr1ShayPfP1yMKSMoDigTjTg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-G7vqq6QMMpGEHodRC5IODg-1; Mon, 10 Jan 2022 04:56:30 -0500
X-MC-Unique: G7vqq6QMMpGEHodRC5IODg-1
Received: by mail-wm1-f72.google.com with SMTP id
 d4-20020a05600c34c400b00345d5d47d54so4702549wmq.6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 01:56:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DGDm1oaaWKUbsURSYDtt3eA6CLvZDH+FDjQaP+AuY/8=;
 b=j+wRUQkypZ9PZcOfZmQSOKQVEEsQiOgLVPWADnA5gY85pIp171rL7zC0F5a8jjIKnl
 ZTLKwc79AOFnxzKxiylTTSvb9DfzwP/bha87Xu898Z2dxFnvSpjtbjgJsMNaa4X5MlXX
 7MGFK+8w+7X7ANvdTjrSHhvuRjk7QRFO2OUw7qPuRVTnp7zwPz1Bf+6t0EZNFwE+ADUv
 b78qvqIsc97B0Fih3wE90YU4Jnq8czMenQHa1dx9BeLFkiRuSBePivds04R8f3LSn4rx
 W7pT1JqiVROkUEjBKBeLCraDSavtMn2NYOxBlrI/S31Cc1p+ZEwgTtxtTynrgwU5BAI0
 H6yA==
X-Gm-Message-State: AOAM531WCNweK5tX8K12BwQzxsp9JQGTBnx5R9hBTA2lgRUg7Ij7seMI
 Ks6dTSNMHh0KyGCWC7pWDn+ZR8kaoq3m+P5FbtFaAAiSZMGor8gnxFEEcPA7fBJEO+P3XH9cf03
 90JgN0GA5YN5Jh7IVroEUcmK23hl2
X-Received: by 2002:a5d:6302:: with SMTP id i2mr5349402wru.25.1641808589065;
 Mon, 10 Jan 2022 01:56:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6ths/AcE+USA4b9jT9nuUL+2SfOzOGrd7hBLtsih5mHKb9hQ17/vSxnWdP1FKhpwI1kRuhA==
X-Received: by 2002:a5d:6302:: with SMTP id i2mr5349395wru.25.1641808588900;
 Mon, 10 Jan 2022 01:56:28 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id b13sm6315167wrf.64.2022.01.10.01.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 01:56:28 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] video: vga16fb: Fix logic that checks for the display
 standard
Date: Mon, 10 Jan 2022 10:56:24 +0100
Message-Id: <20220110095625.278836-2-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110095625.278836-1-javierm@redhat.com>
References: <20220110095625.278836-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Kris Karas <bugs-a21@moonlit-rail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vga16fb framebuffer driver supports both Enhanced Graphics Adapter
(EGA) and Video Graphics Array (VGA) 16 color graphic cards.

But the logic to check whether the EGA or VGA standard are used is not
correct. It just checks if screen_info.orig_video_isVGA is set, but it
should check if is set to VIDEO_TYPE_VGAC instead.

This means that it assumes to be VGA even if is set to VIDEO_TYPE_EGAC.

All non-x86 architectures though treat orig_video_isVGA as a boolean so
only do the change for x86 and keep the old logic for the other arches.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v2:
- Make the change only for x86 (Geert Uytterhoeven)

 drivers/video/fbdev/vga16fb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index e2757ff1c23d..8c464409eb99 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -1332,7 +1332,12 @@ static int vga16fb_probe(struct platform_device *dev)
 	printk(KERN_INFO "vga16fb: mapped to 0x%p\n", info->screen_base);
 	par = info->par;
 
+#if defined(CONFIG_X86)
+	par->isVGA = screen_info.orig_video_isVGA == VIDEO_TYPE_VGAC;
+#else
+	/* non-x86 architectures treat orig_video_isVGA as a boolean flag */
 	par->isVGA = screen_info.orig_video_isVGA;
+#endif
 	par->palette_blanked = 0;
 	par->vesa_blanked = 0;
 
-- 
2.33.1

