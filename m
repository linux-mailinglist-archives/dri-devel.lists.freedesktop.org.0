Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1588442651C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 09:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 462B16E0AA;
	Fri,  8 Oct 2021 07:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6746D6E0AA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 07:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633677449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VBOxsLxxf+FVkHYJGJvqWe8yOt5UqmLKigzcG0fQrbU=;
 b=H0jm93i1zqb1NjqYGMPh1rIxSEjhaWUQRoJs1/XeiGX1f3aWE3ZxK+HsfTRP5ee0vc3aUm
 RHZ1U6me2SKlDc8QujGPB/S+uCFDK2vPXGj96d8Gxx/UJy+T6Gdw4G5lIszo6ggwg2dCNS
 zg8mTyxa2J+t1LBoZAK39eLeCf/drY4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-Xg5TZXVEP4K1MIf8AYK9SA-1; Fri, 08 Oct 2021 03:17:23 -0400
X-MC-Unique: Xg5TZXVEP4K1MIf8AYK9SA-1
Received: by mail-wr1-f70.google.com with SMTP id
 r25-20020adfab59000000b001609ddd5579so6552515wrc.21
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Oct 2021 00:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VBOxsLxxf+FVkHYJGJvqWe8yOt5UqmLKigzcG0fQrbU=;
 b=GQD+fq4ZEh1WYLya/9LJiVBsMTbedExkZLvsvptyh5tQbcbzcKkZlpcX4IZZwGYHYn
 d2AfLIRtfP1V3Zfb9lAoG6+84R8xnDueYWg9OS90BHIBFGvuy779z6Y1YWecPA6F0on/
 G0tJ07eP/08SF2KL9zjg6UE/8z1OHw9UiRPOK4iHHjTuppMj4YLEA2M0QpIxbN4I2is/
 79O3L/KfFrVOwC21d7RAVrlvOiwtZ71Fl1c3GY0LebtYQT/US26zmEA8u3GkAxAqvShf
 G1lt0VMa37tFz5cmFVA1WrWwdLsW/kC1hw6a9xiHigQ6opizPfhqP0cXFCyaiwdZmgWj
 NxNA==
X-Gm-Message-State: AOAM531eYMuxHF7n7Bz4M5bm7Xzp8cQ5+AH+VrQIhrtfHQ3xXHikhvZI
 Z/z6M8TxnOxFos2DowzICxofmyB/grtVWZqU0hF83cGr7N5vLuGCpbC9CuTxfSqG3es14zU/AfQ
 GUrRcyj2taMcXllFQBAVFJ+agBmp3
X-Received: by 2002:adf:fb50:: with SMTP id c16mr2025827wrs.120.1633677442329; 
 Fri, 08 Oct 2021 00:17:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJtAbe3TBB4Yd2wrlfMF2cS7QqC6SU2LfwWwP1pVuG2EFJZrMXS/ZlRQi0XgjK21R/xyX5xg==
X-Received: by 2002:adf:fb50:: with SMTP id c16mr2025801wrs.120.1633677442066; 
 Fri, 08 Oct 2021 00:17:22 -0700 (PDT)
Received: from minerva.redhat.com ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id n14sm1573459wrm.78.2021.10.08.00.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 00:17:21 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Johannes Stezenbach <js@sig21.net>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH] Revert "drm/fb-helper: improve DRM fbdev emulation device
 names"
Date: Fri,  8 Oct 2021 09:17:08 +0200
Message-Id: <20211008071708.1954041-1-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit b3484d2b03e4c940a9598aa841a52d69729c582a.

That change attempted to improve the DRM drivers fbdev emulation device
names to avoid having confusing names like "simpledrmdrmfb" in /proc/fb.

But unfortunately there are user-space programs, such as pm-utils that
query that information and so broke after the mentioned commit. Since
the names in /proc/fb are used programs that consider it an ABI, let's
restore the old names even when this lead to silly naming like the one
mentioned above as an example.

Reported-by: Johannes Stezenbach <js@sig21.net>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/drm_fb_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 3ab07832104..8993b02e783 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1737,7 +1737,7 @@ void drm_fb_helper_fill_info(struct fb_info *info,
 			       sizes->fb_width, sizes->fb_height);
 
 	info->par = fb_helper;
-	snprintf(info->fix.id, sizeof(info->fix.id), "%s",
+	snprintf(info->fix.id, sizeof(info->fix.id), "%sdrmfb",
 		 fb_helper->dev->driver->name);
 
 }
-- 
2.31.1

