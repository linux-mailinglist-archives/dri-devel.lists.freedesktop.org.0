Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0607E654873
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 23:30:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F0610E5B7;
	Thu, 22 Dec 2022 22:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F8710E599;
 Thu, 22 Dec 2022 22:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671748120; x=1703284120;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Q+EHjbTFyHuhabZ3zmDqbL4oLvla2QU19CoVw6zNsjw=;
 b=R8heswRchX4gTbhoCH0KRQa4YFmQiZ8/VoNk1t+dWTVECkGUoitkkcK4
 Jspz9agp+3onYf/7AkaM31Fr/I1JEeY6sCq38G59hNxQxeAAHGSu23UkP
 1rVmaVrVePez8NseFXjdQed5cxEgVxsFDXywXeWTXvnUawtMVfh9alxfZ
 0t6H79d4azml4HGYnahhPpx5GLXFxOWaDveCPC9TtHo5/EKDf5GRsdBrp
 uVN/JJ0p+eZgQE3XyGxKLlu2W9amC7OG5fHFXZ6yjBO4+MWRWP+b9f8tU
 yseUoji0+MgPDztjRNIZPa8lgSbRhOBSVc/wHXtb/IGmayBKylpk0B4Rd Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="406472856"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="406472856"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="645412318"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="645412318"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 10/20] drm/ttm: Don't print error message if eviction was
 interrupted
Date: Thu, 22 Dec 2022 14:21:17 -0800
Message-Id: <20221222222127.34560-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221222222127.34560-1-matthew.brost@intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Avoid printing an error message if eviction was interrupted by,
for example, the user pressing CTRL-C. That may happen if eviction
is waiting for something, like for example a free batch-buffer.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index cd266a067773..e60aaa3299e7 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -465,7 +465,8 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 	if (ret == -EMULTIHOP) {
 		ret = ttm_bo_bounce_temp_buffer(bo, &evict_mem, ctx, &hop);
 		if (ret) {
-			pr_err("Buffer eviction failed\n");
+			if (ret != -ERESTARTSYS && ret != -EINTR)
+				pr_err("Buffer eviction failed\n");
 			ttm_resource_free(bo, &evict_mem);
 			goto out;
 		}
-- 
2.37.3

