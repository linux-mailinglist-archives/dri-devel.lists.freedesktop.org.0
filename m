Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC47A675424
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 13:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D559710EA33;
	Fri, 20 Jan 2023 12:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E7110EA33
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 12:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674216514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XWxZ9+fZGD3CeqIp7txi3l7X00Lca9PNbV7a61jLAME=;
 b=WEzOpnz46jrABKLEr2OavUkLofOz03Ddt5KaMBw54yh3H82JuVfBbJccAOHxC0/YK0ADU5
 pM3QdTeYnmcH3dhdpbeCMPC3ngariULxKNk4fqHnpUC/2ZBIn3Ix8PpGgw7Ob0E6LALHkh
 v73EPCYGjupuTHP+KMJ2U8oId/4cQQI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-mo4WHQWDOmGnbE0U5qAGWA-1; Fri, 20 Jan 2023 07:08:32 -0500
X-MC-Unique: mo4WHQWDOmGnbE0U5qAGWA-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay38-20020a05600c1e2600b003da7c41fafcso4687128wmb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 04:08:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XWxZ9+fZGD3CeqIp7txi3l7X00Lca9PNbV7a61jLAME=;
 b=3tam/8w5kxD7kKusNg7ajbyNrF21T/FuyrquXN112GQi9ECY0E7/wt3OmFKZM+TXJf
 eW6QyJ5++2vQ1RhOLEzJJTzpUbxhBjIGTtYMjmr+DowehbxVA1d+iQ0tGkLbsI/Bs3KO
 lwM+ajaP27dQMlkRQkcPO7QMTbq5hgmFPVao+3lVhsnOKAqK5MCuZILCRw2LbsLZLXPg
 TKgG5V6CMXIFhgdx5ZR4WHsEyFao8VLpfeTFcSkWjUC113I5Djf7YImYrtr5I+cDlhYO
 ZHVgJO5+v900nuV5Bq1Yl0BWsmSTEdwKnT52oW9WaM+ECTljKMf65pCFp7sk6tWiU7Rp
 No9g==
X-Gm-Message-State: AFqh2kovFS2hm4yZqB+aRJuvdBQ/naMrXpCvdmf7RjrGO427i9GcpXZo
 UDuDX4E8epi09GcPij15TJJLuOOEHUADkAhK8XA/p3fvtDAI1T3kiI0U9kwBsX5CWRZ6xLmz8TM
 xG1jlYqOafopQdtQReJ7Bru7lwgZw
X-Received: by 2002:a05:6000:1708:b0:2bd:daf1:9e4c with SMTP id
 n8-20020a056000170800b002bddaf19e4cmr14292635wrc.43.1674216511827; 
 Fri, 20 Jan 2023 04:08:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsvGsPS+HlZRn7YsaFlYBOOufj3MRrLCyQgFoq48lMENq5yHr4MBJy40beCmvSbJT9GNsyOxg==
X-Received: by 2002:a05:6000:1708:b0:2bd:daf1:9e4c with SMTP id
 n8-20020a056000170800b002bddaf19e4cmr14292621wrc.43.1674216511626; 
 Fri, 20 Jan 2023 04:08:31 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l4-20020a05600012c400b002bbb2d43f65sm32766336wrx.14.2023.01.20.04.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 04:08:30 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/fb-helper: Check fb_deferred_io_init() return value
Date: Fri, 20 Jan 2023 13:08:21 +0100
Message-Id: <20230120120822.2536032-3-javierm@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120120822.2536032-1-javierm@redhat.com>
References: <20230120120822.2536032-1-javierm@redhat.com>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fb_deferred_io_init() can fail and return an errno code but currently
there is no check for its return value.

Fix that and propagate to errno to the caller in the case of a failure.

Fixes: d536540f304c ("drm/fb-helper: Add generic fbdev emulation .fb_probe function")
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/drm_fbdev_generic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 0a4c160e0e58..b2df8c03594c 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -223,7 +223,9 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 		fbi->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
 
 		fbi->fbdefio = &drm_fbdev_defio;
-		fb_deferred_io_init(fbi);
+		ret = fb_deferred_io_init(fbi);
+		if (ret)
+			return ret;
 	} else {
 		/* buffer is mapped for HW framebuffer */
 		ret = drm_client_buffer_vmap(fb_helper->buffer, &map);
-- 
2.39.0

