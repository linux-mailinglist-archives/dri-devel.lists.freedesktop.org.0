Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2776690D5F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 16:43:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6502410EB37;
	Thu,  9 Feb 2023 15:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF19310EB34;
 Thu,  9 Feb 2023 15:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675957411; x=1707493411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zD70VZdjgnOic3K1qhG8DBPtshCjC6Dxxa8vF3F1mg4=;
 b=cvMhQQdzGzNghwV9Cd7QShYVs1ozihNpG8bPuTOF88czroE1IdKbjE/c
 /fuyYeQ19dyE8jSkmj7aZuaDXaFOIpWSQ0b8NtcZz29+e3ZSsw8lS5+Rd
 1E8P0pjJzJ5pjmBXX0MSfInyQjN3ZPl0v+VhusC7oz0ez51pcXqRCv9l6
 j4pztP4y4sfnN1oKxk25YPCCe/zEtROkVpDU+EmfSEmO+3XpS5/EzkGK8
 5r9hHeg956x/2Bjm6IOa5ULAB6zJXJz2w0BW9php4MdTU1PF/XmtUUVDz
 7whGTe3rZuKoFY0Gmezzl+sGQ64yhPhY7dg61m9jja9uQ/rW90i3aQsg8 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="331440713"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; d="scan'208";a="331440713"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 07:43:31 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="645308796"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; d="scan'208";a="645308796"
Received: from jptoner-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.192.123])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 07:43:30 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 2/3] drm/syncobj: Mark syncobj waits as external waiters
Date: Thu,  9 Feb 2023 15:43:14 +0000
Message-Id: <20230209154315.468682-3-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209154315.468682-1-tvrtko.ursulin@linux.intel.com>
References: <20230209154315.468682-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Use the previously added dma-fence tracking of explicit waiters.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/drm_syncobj.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 0c2be8360525..776b90774a64 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1065,9 +1065,9 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 			if ((flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE) ||
 			    dma_fence_is_signaled(fence) ||
 			    (!entries[i].fence_cb.func &&
-			     dma_fence_add_callback(fence,
-						    &entries[i].fence_cb,
-						    syncobj_wait_fence_func))) {
+			     dma_fence_add_wait_callback(fence,
+							 &entries[i].fence_cb,
+							 syncobj_wait_fence_func))) {
 				/* The fence has been signaled */
 				if (flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL) {
 					signaled_count++;
-- 
2.34.1

