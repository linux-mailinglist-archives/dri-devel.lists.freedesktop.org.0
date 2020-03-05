Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBC517B7E9
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D559D6EC71;
	Fri,  6 Mar 2020 08:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3CA6EBC2;
 Thu,  5 Mar 2020 13:26:00 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y17so7008023wrn.6;
 Thu, 05 Mar 2020 05:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PP44lrAkaX0DIfBXGQEfA+tUts+r+kqu9dRapbCoaRU=;
 b=ddqd5Q11lr0pmolBFQYpCgiIHMk+7uXBndCBaTmVlTbV4OtM/hKchsl/fUsTV5FT7v
 c6JpgqEUnVBVN1iRhxDSp3GiNOREuXsCPvolVWFckjeOWtAPIfSm3+Nh/xnC0anHiraQ
 c9RX9EczpAPqnd7k1nEr+sN3wkbC6ucmHkSFXyYR6n1cuQ44e8sqW8GzMIxiOUspWWR9
 6F50NdbqW3NRkHwP+9Tvd6MqelZGh4pMn1AnWI0a/dPX8PZxnJsrdetFB8EdZqw+7Vkq
 nSgPgYFfyBBCWnfw1Pa9fixOxrnwGTlIVcMPseMVaTumyHVRkeGxKbBBuNQrzY8ov4I6
 OpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PP44lrAkaX0DIfBXGQEfA+tUts+r+kqu9dRapbCoaRU=;
 b=BWSgV/vA+4jq7c2NF3ND44csEsTEn+iWcreW3UuVNjmsNwrx5V7J7vIhE2Cm1C+O+8
 XRAAnY+Dj32+Dx9H5wotpqT0CPe1viQGnAL3lTk+IA5OvZunZo8E6+3rhQIVD1bA7Hcz
 ayoW74SmJK+xd8YKdL11ZDEQPULwu2cdgG8/fPigHodT+4NKlx+QZ/ZnF/uAgntp7ooG
 dfOa1W5HRy8PUFwI619UCz0m9tiZuLJVjotaKbO328Zj+nGn0Xlp5OuCH4WfYg7V9/WB
 12el9k3EgCw9TNTY0k7xpjPv7iQENoFOoxFtAAOWzRKqJgr86p0MMgT4MP2+eAlXzEkL
 zLLQ==
X-Gm-Message-State: ANhLgQ3My6umN60AwOgdaSBZXNbSCGWiuY6IuaCFXbh4ik5wzRuMg5l7
 APol+lMy3w9F88j6qO08AxQfuDa48lrCzQ==
X-Google-Smtp-Source: ADFU+vvdIkv3TMmlnCGA3z/I8EZwlU9eiDfrQO/8uVXJ88LredMLgAAzbWEPhEDUIPP+EQAw8wDwFA==
X-Received: by 2002:adf:e742:: with SMTP id c2mr10206295wrn.262.1583414759090; 
 Thu, 05 Mar 2020 05:25:59 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F2EA5001F22CF19908511A1.dip0.t-ipconnect.de.
 [2003:c5:8f2e:a500:1f22:cf19:9085:11a1])
 by smtp.gmail.com with ESMTPSA id g14sm45424819wrv.58.2020.03.05.05.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 05:25:58 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] drm/ttm: do not keep GPU dependent addresses
Date: Thu,  5 Mar 2020 14:29:10 +0100
Message-Id: <20200305132910.17515-9-nirmoy.das@amd.com>
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
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GPU address handling is device specific and should be handle by its device
driver.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c    | 7 -------
 include/drm/ttm/ttm_bo_api.h    | 2 --
 include/drm/ttm/ttm_bo_driver.h | 1 -
 3 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 6d1e91be9c78..9f24fb287d71 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -85,7 +85,6 @@ static void ttm_mem_type_debug(struct ttm_bo_device *bdev, struct drm_printer *p
 	drm_printf(p, "    has_type: %d\n", man->has_type);
 	drm_printf(p, "    use_type: %d\n", man->use_type);
 	drm_printf(p, "    flags: 0x%08X\n", man->flags);
-	drm_printf(p, "    gpu_offset: 0x%08llX\n", man->gpu_offset);
 	drm_printf(p, "    size: %llu\n", man->size);
 	drm_printf(p, "    available_caching: 0x%08X\n", man->available_caching);
 	drm_printf(p, "    default_caching: 0x%08X\n", man->default_caching);
@@ -345,12 +344,6 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 moved:
 	bo->evicted = false;
 
-	if (bo->mem.mm_node)
-		bo->offset = (bo->mem.start << PAGE_SHIFT) +
-		    bdev->man[bo->mem.mem_type].gpu_offset;
-	else
-		bo->offset = 0;
-
 	ctx->bytes_moved += bo->num_pages << PAGE_SHIFT;
 	return 0;
 
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index b9bc1b00142e..d6f39ee5bf5d 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -213,8 +213,6 @@ struct ttm_buffer_object {
 	 * either of these locks held.
 	 */
 
-	uint64_t offset; /* GPU address space is independent of CPU word size */
-
 	struct sg_table *sg;
 };
 
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index c9e0fd09f4b2..c8ce6c181abe 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -177,7 +177,6 @@ struct ttm_mem_type_manager {
 	bool has_type;
 	bool use_type;
 	uint32_t flags;
-	uint64_t gpu_offset; /* GPU address space is independent of CPU word size */
 	uint64_t size;
 	uint32_t available_caching;
 	uint32_t default_caching;
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
