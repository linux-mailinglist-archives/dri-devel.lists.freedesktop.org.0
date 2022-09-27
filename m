Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F86F5EBF05
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 11:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F2A10E3D4;
	Tue, 27 Sep 2022 09:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF0E10E105
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 09:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664272375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mSdBTkmqZZlWAR7myYRSEj++3MrEkDDkR2XxSoPV9dE=;
 b=CfkUDPfFe5cCf5IuNJkGyF6/Dv9f520Gg5Rs3untgNoHZBbguQWzSqRSBlqFIgU9GtG/c5
 76/kcZrZJQ6x/DhkUlickRYeRm6CY2Pet7wPB/kcsfskzv20tEICSRnYJHhS40uS+G0gnH
 Xw3gYZwHp/dTaHU152g4/UaPFwJy2NI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-iCeCga04N_qq0V60Ptfuvw-1; Tue, 27 Sep 2022 05:52:53 -0400
X-MC-Unique: iCeCga04N_qq0V60Ptfuvw-1
Received: by mail-wr1-f69.google.com with SMTP id
 g19-20020adfa493000000b0022a2ee64216so1990274wrb.14
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 02:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=mSdBTkmqZZlWAR7myYRSEj++3MrEkDDkR2XxSoPV9dE=;
 b=rt1VeylSDPSt9lNxwWLwZ/XaBJ7oPAWqJP2dhsCEJXE743kdc8CBsyUzta/Vz4iwOM
 c9/3zrDdQj4Y+OXlPbTpBLWctLBhMY1O2E9br4tALsVPoIoKnR003y5iOkSrzEDGIWL+
 xD+Zz2VyhXSymAZqfyzkQ081SGc/kiD2jfjy16adsMy09EZBKwpyx06BeRrwLjsk1GSC
 k3UFpvv4a9dD4nA34YLDWOm4sSd9BWcaG8EsFGX8kmX68Usn+szWYquighhOJw8ZHdXa
 pTYhliEBc1JTQs4yHqu+EhoiyIYNwx5G37k+0o1okRV0oNZSp1aq7obZYXzQc2up0zyj
 t54Q==
X-Gm-Message-State: ACrzQf2GN2dBNd0v2WK0Gwsd16kfAPNCWXCjVXNQ6q9h4NgGGGxcdGlz
 kamFK7KNdBCiHPApGzOSN7iG11xY9UEGR5E5r9hBqJcJjjGnkmQlkp0nogIDEVXM+Y3Ys27If3i
 F4kQ6FPZkjgx2Gh8FGgLNV9NLhhgU
X-Received: by 2002:a05:600c:1c89:b0:3b4:a612:c3e0 with SMTP id
 k9-20020a05600c1c8900b003b4a612c3e0mr1970300wms.20.1664272372475; 
 Tue, 27 Sep 2022 02:52:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM595Bu/Ews3SXu+nOmdl/+BdfnQzam5EqMHzyQaFMWmgo+FxoMVIJ4gj0G61udQ5LcRDsB4Pw==
X-Received: by 2002:a05:600c:1c89:b0:3b4:a612:c3e0 with SMTP id
 k9-20020a05600c1c8900b003b4a612c3e0mr1970289wms.20.1664272372264; 
 Tue, 27 Sep 2022 02:52:52 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b003b4c979e6bcsm14258886wmn.10.2022.09.27.02.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 02:52:51 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/ssd130x: Synchronize access to dma-buf imported GEM BOs
Date: Tue, 27 Sep 2022 11:52:49 +0200
Message-Id: <20220927095249.1919385-1-javierm@redhat.com>
X-Mailer: git-send-email 2.37.3
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Synchronize CPU access to GEM BOs with other drivers when updating the
screen buffer. Imported DMA buffers might otherwise contain stale data.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/solomon/ssd130x.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index a537692100d1..bc41a5ae810a 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -555,11 +555,18 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
 	if (!buf)
 		return -ENOMEM;
 
+	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret)
+		goto out_free;
+
 	iosys_map_set_vaddr(&dst, buf);
 	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect);
 
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+
 	ssd130x_update_rect(ssd130x, buf, rect);
 
+out_free:
 	kfree(buf);
 
 	return ret;
-- 
2.37.3

