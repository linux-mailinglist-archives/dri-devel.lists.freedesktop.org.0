Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA86A676865
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 20:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B52C10E3BC;
	Sat, 21 Jan 2023 19:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BC410E031
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 19:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674329089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7oGQt8CSMw4GzppBRa4wPVT549mMixHHzNT+6I/9DSU=;
 b=ewRkp11S/ks1j34yYhB0VkW12ujNCW62ycpfS6GK0AjQInu/jhBg3g+BIGutce0tNPEL2k
 PpQ3DSppb/Rwt4BgJs01KkfgOthrZGCxD+lqyxVVHhHYUHF88FKfMnLYWd82/L+GJjoFta
 vvu3vLWEbwigTd9YznZmTYg8STxTbbk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-369-7DbNCKU1NsWMs-_Vx08m-w-1; Sat, 21 Jan 2023 14:24:48 -0500
X-MC-Unique: 7DbNCKU1NsWMs-_Vx08m-w-1
Received: by mail-wr1-f70.google.com with SMTP id
 k11-20020adfe3cb000000b002be503e7f28so1133382wrm.2
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 11:24:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7oGQt8CSMw4GzppBRa4wPVT549mMixHHzNT+6I/9DSU=;
 b=VxOMOISftVCw1i6NquVj0jsrNtkIdWY286QbG1pHlay5dg7Wpb+aEvLjcqKyWJ63I5
 ATFcTB5S5CIjPUtjSwI9dfe4vUBXOoKCJrUsRpqnrUs4Yv16/V7QpxcY5NcMivw52Ed9
 O1qGgvnltXuH7hoK47b7BrFv7APscIUnL3QmoZMKU8x5ICaBZlQw+fl1qfvlqW4b7f4Z
 md6upD+pE5EXk4+9AFWPovIRndYhyIWpgPTj2X+KN6WTLwzUMgVZmkARDXBcAP2Y6UbV
 T0DQDzEBGjRyV5sDvPFJx8VGXYsZE9elORFlhmm8vBeYoIto2Y5uvsI2fVKaCGZ5M0rG
 e4NQ==
X-Gm-Message-State: AFqh2krz3MwLzrRzix75MR535IpL1SsZSiBinxAMn9xZMrk11kR4lQKs
 bdRfTvyr6AhRKUaZo+fThbwjetTtp3nF/3twhTig5KMfDY5LtZYruT8mOe68x3s9yLOfZ0wEvcU
 YkreHf7TJuimWMAVrOWFi+iQBKdMx
X-Received: by 2002:a05:600c:1c23:b0:3db:b9f:f2e with SMTP id
 j35-20020a05600c1c2300b003db0b9f0f2emr16681539wms.14.1674329087149; 
 Sat, 21 Jan 2023 11:24:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvo4YuYvz9GiFn0zs6xKas3bTc88JqL7+8XVAEOB/6LyNKyp/RA7k5MmpDB75tEJqJVBJytCg==
X-Received: by 2002:a05:600c:1c23:b0:3db:b9f:f2e with SMTP id
 j35-20020a05600c1c2300b003db0b9f0f2emr16681525wms.14.1674329086970; 
 Sat, 21 Jan 2023 11:24:46 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003daff80f16esm8544321wmg.27.2023.01.21.11.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 11:24:46 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] drm/fb-helper: Check fb_deferred_io_init() return value
Date: Sat, 21 Jan 2023 20:24:17 +0100
Message-Id: <20230121192418.2814955-3-javierm@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230121192418.2814955-1-javierm@redhat.com>
References: <20230121192418.2814955-1-javierm@redhat.com>
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
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---

(no changes since v1)

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

