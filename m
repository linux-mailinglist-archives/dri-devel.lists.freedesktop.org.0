Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4582B698055
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E92010EAE0;
	Wed, 15 Feb 2023 16:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87C110EAE0;
 Wed, 15 Feb 2023 16:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676477697; x=1708013697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pe00gkUs+MCnr90AkFGX3dvjDjmFzOer/NWfRABWSrI=;
 b=JvfZCL+iGATfk0iYFCgcFfWFVLgEkmHz3ybguLTM2oxcZsudLdvqgf6+
 NKeOvBeCTLVq91VqC/eERddwRHc6QTotbKYn7KIdKaP3hm9LbhWsZ2imF
 DNIDzZXWD3NJ65upmU3bxOeYiFF5AbMVEETA1BLOS+zR4Se78HoIXidk3
 25qSoYhOscvNIaPltOLNZMggmwlJRlXA+k1z6XghLlpW3lVbpwlRA+fBu
 /V/P7bB447rqYXHacsKI/AqGdHGAmUzKnvN4B0Fl8fq6fjcfovB+f46w1
 F/g4OpRJEqjxNvGh9vPvrIYAyl5YaPhUEk5qU+mxN4DOwA5FPgubQQyb9 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="393870822"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="393870822"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:14:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="758472248"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="758472248"
Received: from auliel-mobl1.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.14])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:14:50 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 05/16] drm/ttm: Unexport ttm_global_swapout()
Date: Wed, 15 Feb 2023 17:13:54 +0100
Message-Id: <20230215161405.187368-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
References: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, NeilBrown <neilb@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-mm@kvack.org,
 Dave Hansen <dave.hansen@intel.com>, linux-graphics-maintainer@vmware.com,
 Peter Xu <peterx@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Dave Airlie <airlied@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unexport ttm_global_swapout() since it is not used outside of TTM.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 7eadea07027f..a3cac42bb456 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -146,7 +146,6 @@ long ttm_global_swapout(struct ttm_operation_ctx *ctx,
 	mutex_unlock(&ttm_global_mutex);
 	return ret;
 }
-EXPORT_SYMBOL(ttm_global_swapout);
 
 /**
  * ttm_device_swapout() - Select and swap out a system-memory-backed bo.
-- 
2.34.1

