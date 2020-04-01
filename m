Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D8019BC65
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 09:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD0B89C6E;
	Thu,  2 Apr 2020 07:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607206E984
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 18:38:58 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c195so4161130wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Apr 2020 11:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AWFT6zgbBEk5db6J1CC5vq1XvVNlqeNOLFFq+zx/MU8=;
 b=JPlbpUzeq61Pf7iaKqwtgxzhGkV7dN6B2/MMZGCKGoayJTDJVj+v1ead3WCeX0pOjE
 1G0Qb9HHFCx6Co4ef4M3KNti13atfu8g7i2CikdxTQIQgYy/OAT+dip2iUMLq7S1ifMp
 Ekcnsvdmw6zjFhFIEh4og9++loQBPyYyh6opTqE3s/7ZSEYEs+txzES8sO7eqP0qsgqL
 hYs+6RDnojv2u7Ukmm3OcybfEHH9yPMhL10f3NjdWoC8e8MAIENVljX5tDC+9h7tfklM
 xx1vDgAHlWcwZZPLxJ6mL0fj5k1/1RLJlqV3vxiQ99QV0Lp03Y6pQlT9eE0CJUH8OXGL
 bEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AWFT6zgbBEk5db6J1CC5vq1XvVNlqeNOLFFq+zx/MU8=;
 b=fWwo8UoEF4jEh8zkLYJgJldmnKMXyDWVO1pBTuI2DSgw3zTHRexJjHDSiWWP4XEMOK
 JCE4UDtAbbl7NKjoMmQp1lcAE589A5yaWoUvPZYP/eWd4k+1BRfdTKURV01fgEU1NSRI
 iyOGdOL/yYobE+v92mBy6An6gcyUHEvUKrduy8/yY+9H0JumPuv5yqiCACZ7kvs7Kvf1
 qDBfOAe3uHvafv0FsO3e6zY1+8fxzIdS6Ic3ouBYpsyU6Zf1xwt0Pp1AfcChXUAF1gRi
 FunAdffgxN3wEenwTSeb+C8PrK6xjKOH3NQkzRYchIZZ+uh0nyU3J/ST40Esr47BGcmn
 6IuQ==
X-Gm-Message-State: AGi0Pua09ImKCvORkssoO/v4UHKvIwe4S0ptdHK198MFKGcfWToPjhzq
 TjRt3aT5LhNeLssRlXgFAtQIKNwXO6Y=
X-Google-Smtp-Source: APiQypKVHT1cRjKRI8IIhEPTvI/b3vN2bhTUBvvWPcqYfoE9nNNdQoy3fG+oZ7T5wzQpPUdyelhx6Q==
X-Received: by 2002:a05:600c:2910:: with SMTP id
 i16mr5515153wmd.43.1585766336433; 
 Wed, 01 Apr 2020 11:38:56 -0700 (PDT)
Received: from brihaspati.fritz.box (p5DE52E4E.dip0.t-ipconnect.de.
 [93.229.46.78])
 by smtp.gmail.com with ESMTPSA id b11sm3976973wrq.26.2020.04.01.11.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 11:38:55 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/8] drm/vram-helper: don't use ttm bo->offset v4
Date: Wed,  1 Apr 2020 20:42:45 +0200
Message-Id: <20200401184247.16643-7-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200401184247.16643-1-nirmoy.das@amd.com>
References: <20200401184247.16643-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Apr 2020 07:17:56 +0000
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>, alexander.deucher@amd.com,
 sean@poorly.run, christian.koenig@amd.com, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calculate GEM VRAM bo's offset within vram-helper without depending on
bo->offset.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index b3201a70cbfc..e768a1e69d0c 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -198,6 +198,15 @@ u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo)
 }
 EXPORT_SYMBOL(drm_gem_vram_mmap_offset);

+static u64 drm_gem_vram_pg_offset(struct drm_gem_vram_object *gbo)
+{
+	/* Keep TTM behavior for now, remove when drivers are audited */
+	if (WARN_ON_ONCE(!gbo->bo.mem.mm_node))
+		return 0;
+
+	return gbo->bo.mem.start;
+}
+
 /**
  * drm_gem_vram_offset() - \
 	Returns a GEM VRAM object's offset in video memory
@@ -214,7 +223,7 @@ s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo)
 {
 	if (WARN_ON_ONCE(!gbo->pin_count))
 		return (s64)-ENODEV;
-	return gbo->bo.offset;
+	return drm_gem_vram_pg_offset(gbo) << PAGE_SHIFT;
 }
 EXPORT_SYMBOL(drm_gem_vram_offset);

--
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
