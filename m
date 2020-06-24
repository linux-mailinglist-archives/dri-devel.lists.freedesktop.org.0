Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE95209A93
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 09:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5746E88D;
	Thu, 25 Jun 2020 07:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23436E3E5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 18:25:38 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q15so3209533wmj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 11:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QWzJXEBGqrVh3VqWx7l/8wge0LzxmvZ0zWBVzifvhas=;
 b=OjzN3B7bSeiJx3XdSVseunNGCJLNaeDHydtf6Z1FvpAu8UGD3G0D4n771sc32P6lvU
 DURMcxaxaWSvYf7KknAQJ7ZkkdGr4egB0md9agQ8ZOiwZZwzIzYB+Wpa93xYghDRslcu
 RPNZsdfGi8d9CgJAMYM7YCGg7Dd0WEeah+jx216+m2awgu5T7Q68UTUVb8+QLFz9cL/a
 P/jMc65ozZHykmI3Xf8UB9wCgT898jw0g+j76JZWITqBnp3Zq6n4H9Fkk5e9qpmfRG/e
 2OiTxv+cfF8oUXboWYoQOcUFaueJWddEpM4Kk1OsY9jzMWYHKM2dIOTvHWmp8IGB2+X/
 5TQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QWzJXEBGqrVh3VqWx7l/8wge0LzxmvZ0zWBVzifvhas=;
 b=PUu471Fd+ExwRWZWEH/Py8sUsdQq8PrB5T1i3tXnCaf5larPqRt+7EuRLCOL0e37Tk
 gquwbkCxyBWC4RBMgTgrMwskdJYUG87u9vpMC4yWrjvwyWd7W1q3XiePsMPFSfOIKbqC
 X4gRXjceLGFeJ2t6jdRBer4cURp0lUiaTVwRSW1ViBV7cwjPk7rPbY65fHuA7ho/YUez
 /PBKgQdUT77uD6TBn6MAfimuoHO2WopZ7Z0bm38W0JmNeaIk6ihXNy5SeVqTFxd1TWPx
 DfTQPN3GAnrjiMeHRUONheU3qZR2guiotruMW1QIKSyh09RJ3MKdQWmpEFAvY3TR7ZBd
 f8Qg==
X-Gm-Message-State: AOAM533PW71CcLtnj9GqstNr2rDpQqRDFBK8C9WFLt7xRZQTKq/iCpCt
 G+1Ee0fefs3V8Ohx4dajDfyZBzXMabHIRHWU
X-Google-Smtp-Source: ABdhPJzXtgiI8SDxP3yq+OYInpeC3WCSp1rSFSsnnS6kUUdKSwkUuDid5fPtVZgzgfPVM3d2m0d2qQ==
X-Received: by 2002:a7b:c7c2:: with SMTP id z2mr30607645wmk.39.1593023137286; 
 Wed, 24 Jun 2020 11:25:37 -0700 (PDT)
Received: from brihaspati.fritz.box (pd9567914.dip0.t-ipconnect.de.
 [217.86.121.20])
 by smtp.gmail.com with ESMTPSA id a22sm8734086wmb.4.2020.06.24.11.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 11:25:36 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/8] drm/vram-helper: don't use ttm bo->offset v4
Date: Wed, 24 Jun 2020 20:26:46 +0200
Message-Id: <20200624182648.6976-7-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200624182648.6976-1-nirmoy.das@amd.com>
References: <20200624182648.6976-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 25 Jun 2020 07:31:01 +0000
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
Cc: sashal@kernel.org, thellstrom@vmware.com, airlied@linux.ie,
 kenny.ho@amd.com, brian.welty@intel.com, nirmoy.das@amd.com,
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
index 0023ce1d2cf7..ad096600d89f 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -281,6 +281,15 @@ u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo)
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
@@ -297,7 +306,7 @@ s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo)
 {
 	if (WARN_ON_ONCE(!gbo->pin_count))
 		return (s64)-ENODEV;
-	return gbo->bo.offset;
+	return drm_gem_vram_pg_offset(gbo) << PAGE_SHIFT;
 }
 EXPORT_SYMBOL(drm_gem_vram_offset);
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
