Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F92E5231BF
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 13:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1094610EC50;
	Wed, 11 May 2022 11:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5028110EC50
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 11:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652268743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UDplaZMb5YseJ+Hq/qs3ip7VsbbgryHldJFcbzukwP8=;
 b=bDssD1fzjw/uIzbsxTtaleWq+NtY2Inc5m7ovri62cKq5svoMybbry6Bre1xWR9SK6DExM
 EjrYYnKAuxrinfrK0u0yyMF28VovWRRjyVBilU+glz0eA/4n9Uf/iqiXrUnvhsmm0uH1AP
 Z5ZqM7Nf0wBnvWfe+HnJj87nmAXTr6M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-nZQC2_THN3Kj2l-sdhsFbA-1; Wed, 11 May 2022 07:32:22 -0400
X-MC-Unique: nZQC2_THN3Kj2l-sdhsFbA-1
Received: by mail-wr1-f72.google.com with SMTP id
 s14-20020adfa28e000000b0020ac7532f08so726462wra.15
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 04:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UDplaZMb5YseJ+Hq/qs3ip7VsbbgryHldJFcbzukwP8=;
 b=q2CxeWVS90GKyxdN07lkrIkEhrZEL7rCAfw9f2HSHMGTHhlJsRwPvCpv1zNUQFHizt
 QxCF9MWM6oyCIfdGVJ3vkzNDfFQl/Rg6wA1+tpW8nsGXvpffhDfwnwv0G6sIP7G8hI6u
 PVnwInvWkJB9dmdrihdV2PUun9s5QYXnFWSu9ERZ+Y9bH8nyPLyFOk69TQjXYG86lR9J
 fQGcebaWoV5Fs7lIitHZG/XXtere/wBKbE2AYnypptm/EeT9U0RdjNyLIZBcbzZBETra
 IPFtbVpSoTx2L23smuunoieaUGRui7IFY1kWhnkemV8RtPrrdcqbpAOlTxz/JbC7h4JH
 NI9g==
X-Gm-Message-State: AOAM532MQgulmDVFHGC1c6S7Kt664BHtqqWikc89fwu5UErbRTNnJY0r
 YGSAy0yndC8Qhs+HRwqBL/D0Izw8mZ7grOnZcumTk2Q89YyWIIYzQpIZGCOalGzP8hopzfD/S7p
 B6ZeOo8OWNYukU+NMHrkbLDWKc77Z
X-Received: by 2002:a05:6000:1d8b:b0:20c:54e6:1659 with SMTP id
 bk11-20020a0560001d8b00b0020c54e61659mr22002285wrb.169.1652268741178; 
 Wed, 11 May 2022 04:32:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8DOa4eVy/j4OxWjmKfDXFScY2hy71AEkR7bJehfJjo+JROKXYZWV1lJqXARoz2/Z0HXw3aQ==
X-Received: by 2002:a05:6000:1d8b:b0:20c:54e6:1659 with SMTP id
 bk11-20020a0560001d8b00b0020c54e61659mr22002251wrb.169.1652268740906; 
 Wed, 11 May 2022 04:32:20 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w12-20020adfde8c000000b0020c5253d8dfsm1476857wrl.43.2022.05.11.04.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 04:32:20 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/7] Revert "fbdev: Prevent probing generic drivers if a FB
 is already registered"
Date: Wed, 11 May 2022 13:32:04 +0200
Message-Id: <20220511113204.1252828-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220511112438.1251024-1-javierm@redhat.com>
References: <20220511112438.1251024-1-javierm@redhat.com>
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
 Helge Deller <deller@gmx.de>, Ilya Trukhanov <lahvuun@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Peter Jones <pjones@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Vetter <daniel.vetter@ffwll.ch>

This reverts commit fb561bf9abde49f7e00fdbf9ed2ccf2d86cac8ee.

With

commit 27599aacbaefcbf2af7b06b0029459bbf682000d
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Tue Jan 25 10:12:18 2022 +0100

    fbdev: Hot-unplug firmware fb devices on forced removal

this should be fixed properly and we can remove this somewhat hackish
check here (e.g. this won't catch drm drivers if fbdev emulation isn't
enabled).

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Zack Rusin <zackr@vmware.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Ilya Trukhanov <lahvuun@gmail.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Cc: Peter Jones <pjones@redhat.com>
Cc: linux-fbdev@vger.kernel.org

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/video/fbdev/efifb.c    | 11 -----------
 drivers/video/fbdev/simplefb.c | 11 -----------
 2 files changed, 22 deletions(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index ea42ba6445b2..edca3703b964 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -351,17 +351,6 @@ static int efifb_probe(struct platform_device *dev)
 	char *option = NULL;
 	efi_memory_desc_t md;
 
-	/*
-	 * Generic drivers must not be registered if a framebuffer exists.
-	 * If a native driver was probed, the display hardware was already
-	 * taken and attempting to use the system framebuffer is dangerous.
-	 */
-	if (num_registered_fb > 0) {
-		dev_err(&dev->dev,
-			"efifb: a framebuffer is already registered\n");
-		return -EINVAL;
-	}
-
 	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI || pci_dev_disabled)
 		return -ENODEV;
 
diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index 94fc9c6d0411..0ef41173325a 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -413,17 +413,6 @@ static int simplefb_probe(struct platform_device *pdev)
 	struct simplefb_par *par;
 	struct resource *res, *mem;
 
-	/*
-	 * Generic drivers must not be registered if a framebuffer exists.
-	 * If a native driver was probed, the display hardware was already
-	 * taken and attempting to use the system framebuffer is dangerous.
-	 */
-	if (num_registered_fb > 0) {
-		dev_err(&pdev->dev,
-			"simplefb: a framebuffer is already registered\n");
-		return -EINVAL;
-	}
-
 	if (fb_get_options("simplefb", NULL))
 		return -ENODEV;
 
-- 
2.35.1

