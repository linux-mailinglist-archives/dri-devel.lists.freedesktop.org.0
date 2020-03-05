Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCB317B7E8
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B436EC74;
	Fri,  6 Mar 2020 08:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A6588F78;
 Thu,  5 Mar 2020 13:25:58 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a132so6303453wme.1;
 Thu, 05 Mar 2020 05:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Md/UmsVvn1WT1yvHxTnS83Gygc+yjMc1P93FIT0Spns=;
 b=gA2yMMhGaTtd6V/ppEuPmkiGe1yMNWZPoNDeOfGF41PIahEGMeoLg9L0KqmQO4HaEx
 noH8cBJkggIAdsrjvDKSRwSS798AVjmubfW5LFdNI12YcW9HUyPFVzfJLQ9nms7E3wb3
 DXu5dVfw6W2Ej8JGSw0+p0too5IpaJyXpTppfUO+pLwQBIf1m/WgejozVa20rqz2sV+V
 RWFEcW01UaqNu4YHm2aKrexhX1DllzS6UCKCAr618WbNTgfyxrfsZNzQJRsqu+4DnDR/
 C30j5Ktj+MpFws9B2/JRbFJjDY/AfU/62OXEB0A5yKP9/WCrBfWS+YtckzBrGQACkbp2
 JXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Md/UmsVvn1WT1yvHxTnS83Gygc+yjMc1P93FIT0Spns=;
 b=UvNyIEMcu4vai3+7douEaM4xAkVFO0551ZDVBAGZP5zqWkHkRFw5zq1anUU68DCZ1Z
 NH81nrVwCI0SfAuebHsHcXgIzSYNT2WglvC/AIjqcXFFSIRNvRz27ksZGO4sb27L2Tug
 Vz76Nlcm/5E0PReTvq1IJ8hkniCNcj0UVr/fGbf0tkqVjBlScQz+uZM8sOzvD9glNZYu
 hfwxPx8XakIqqlZYpWNt+cgnHUyi+nij9DjbCyD90sskSt9Bx5ftWtCWaCpW0pEZdWCI
 lw7hPjk16IG2oh1Zwps6IYAXa/Zy1moMCv40J8hKeWA92wjJ9PYaZOcKY7i6KpK9YVlF
 O1SQ==
X-Gm-Message-State: ANhLgQ0+c2ZnJvYWBUXKX5N9AhWsJB9jBG4tBaeOS4/W7SGHtZe/AmT4
 6FF9EjInqI5nPZZFgjSqBVioKMuE6h60tw==
X-Google-Smtp-Source: ADFU+vuI09P60NxfdpwB6n96dG8n+WpyE+Q5+n59TP1oZrP2lcLRheYx2OJozP/sR99qaEjCqKEDvg==
X-Received: by 2002:a1c:6583:: with SMTP id z125mr6614213wmb.51.1583414756451; 
 Thu, 05 Mar 2020 05:25:56 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F2EA5001F22CF19908511A1.dip0.t-ipconnect.de.
 [2003:c5:8f2e:a500:1f22:cf19:9085:11a1])
 by smtp.gmail.com with ESMTPSA id g14sm45424819wrv.58.2020.03.05.05.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 05:25:55 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/8] drm/vram-helper: don't use ttm bo->offset v3
Date: Thu,  5 Mar 2020 14:29:08 +0100
Message-Id: <20200305132910.17515-7-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200305132910.17515-1-nirmoy.das@amd.com>
References: <20200305132910.17515-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
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
 drivers/gpu/drm/drm_gem_vram_helper.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 92a11bb42365..2749c2d25ac4 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -198,6 +198,13 @@ u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo)
 }
 EXPORT_SYMBOL(drm_gem_vram_mmap_offset);

+static s64 drm_gem_vram_pg_offset(struct drm_gem_vram_object *gbo)
+{
+	if (WARN_ON_ONCE(!gbo->bo.mem.mm_node))
+		return 0;
+	return gbo->bo.mem.start;
+}
+
 /**
  * drm_gem_vram_offset() - \
 	Returns a GEM VRAM object's offset in video memory
@@ -214,7 +221,7 @@ s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo)
 {
 	if (WARN_ON_ONCE(!gbo->pin_count))
 		return (s64)-ENODEV;
-	return gbo->bo.offset;
+	return drm_gem_vram_pg_offset(gbo) << PAGE_SHIFT;
 }
 EXPORT_SYMBOL(drm_gem_vram_offset);

--
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
