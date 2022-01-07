Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E14487636
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 12:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D7710F5DA;
	Fri,  7 Jan 2022 11:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8422E10F5DA
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 11:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=58zbRN1g/CU6F0V6Z7/ygK3GmWeTFgdq63VOW5AeL6U=;
 b=g5UFHJcBoMnanRxD4GOzT+ncNsnMuX/+Vh7GRM5XIqU18ms3FoLgufs91aQGly5uPsxLOU
 auKI1dk0si0u4nJmuqkt8dvh2Hqcq8TdRujTRKnw0SdVMSLbXLOsxf4RezbLFOXc7FrMkd
 NdU9vIpH/EaWEoDWIsLIxzhPs+tSUY0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-410x0IfDPg-whULjvNPcCQ-1; Fri, 07 Jan 2022 06:07:34 -0500
X-MC-Unique: 410x0IfDPg-whULjvNPcCQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l34-20020a05600c08a200b003478e251a32so804073wmp.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 03:07:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=58zbRN1g/CU6F0V6Z7/ygK3GmWeTFgdq63VOW5AeL6U=;
 b=jMPoCPe0LB0fhuGswJIWPvnbc9ysXxtuuDb7GNGPq25GA9qDaL71VG29k/be6xcUet
 XNOhRUtH57mLfzbOg4Ttl93/dR6QVuvJ6delc62Hesm9mdzTS/c+yIKn4Hi1dggArg4j
 iCSdE6/ZthyQd7uoXfkrBiolZlI/RiNYmIQaZiuvsZH17lMRWvo0+5e5Y/IhoUk9p0ru
 16U5fDWqZ+vSf8BlU+9mhW27dEyD18BQBUSF/X9JRcBndvPxxtf46YHaaGAL8qm9yY/a
 Pgl5FiNiYlH+71Asyo+J+/7aojwB7JO+duYyt/DZyzh9EFFiOzqwHFLrILW8yDHebFIB
 +4eg==
X-Gm-Message-State: AOAM531xNcI9xPxk9bqY/EFNUl5ASKOl3vAfPjcAFfJ2cJNgtLBt0QTp
 t/l9SSeyXeZfy72KtOxVcZR7g6Ul09LFLDMz2Q1cos41z8ShMxhxh6D48dS+lS5FjWrnwVqENLC
 9wVEk9quxeUNBTuDd3F2eWPiWxwtS
X-Received: by 2002:a05:6000:184f:: with SMTP id
 c15mr55611165wri.632.1641553653069; 
 Fri, 07 Jan 2022 03:07:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8FiBkwupY26l2VOQFCBjlQX2PiwGOdMzcc0tazi6OhYPBwayO3s/sLvIG8bnzF/tTNPF5NQ==
X-Received: by 2002:a05:6000:184f:: with SMTP id
 c15mr55611147wri.632.1641553652846; 
 Fri, 07 Jan 2022 03:07:32 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id r9sm9337273wmq.18.2022.01.07.03.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:07:32 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] video: vga16fb: Fix logic that checks for the display
 standard
Date: Fri,  7 Jan 2022 12:07:22 +0100
Message-Id: <20220107110723.323276-2-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Kris Karas <bugs-a21@moonlit-rail.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vga16fb framebuffer driver supports both Enhanced Graphics Adapter
(EGA) and Video Graphics Array (VGA) 16 color graphic cards.

But the logic to check whether the EGA or VGA standard are used is not
correct. It just checks if screen_info.orig_video_isVGA is set, but it
should check if is set to VIDEO_TYPE_VGAC instead.

This means that it assumes to be VGA even if is set to VIDEO_TYPE_EGAC.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/video/fbdev/vga16fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index e2757ff1c23d..3347c9b6a332 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -1332,7 +1332,7 @@ static int vga16fb_probe(struct platform_device *dev)
 	printk(KERN_INFO "vga16fb: mapped to 0x%p\n", info->screen_base);
 	par = info->par;
 
-	par->isVGA = screen_info.orig_video_isVGA;
+	par->isVGA = screen_info.orig_video_isVGA == VIDEO_TYPE_VGAC;
 	par->palette_blanked = 0;
 	par->vesa_blanked = 0;
 
-- 
2.33.1

