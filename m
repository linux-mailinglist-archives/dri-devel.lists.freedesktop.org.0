Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FF26ADC57
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 11:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C64710E496;
	Tue,  7 Mar 2023 10:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F6C10E49A;
 Tue,  7 Mar 2023 10:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678186129; x=1709722129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=URb0lCKRfLIha7WsBjPGOr3MHbHvX2Y/Iq0wYdVSRz8=;
 b=WEKXNG319mzvt558MDl9D+elv1OgQCI28L6aA75MkrtCfAhj4UGKfeZy
 phxUWZNc5GE3JuOa4Mf1VEkHxqK/nIGzVQ8K1CbAVVB449t2F6G8k4SLm
 ol2W7ufnPAJs0o4sr0z5H2pAIeTYc2nINWF8GziyiY0yiq9r1GRFPC0GV
 MeHgwtaSAkvaxDvKx1jCJ5ubvQX7WQwbupHfsPUH+GQY6v10E/im4+9x0
 wjNu9x5aHJZBNHEmgJkjFgZODTMIyAomyctrPAyADVBPzRA/nW4+3HxOe
 fCr8tw1MhKlAhRpVcZ/LHsTYd5EcW2CE6Tm+KYHKNz6/HU9QQU+1Gt5pv Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400643462"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="400643462"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 02:48:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="819712933"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="819712933"
Received: from tanzeelu-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.205.53])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 02:48:46 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 09/12] drm/syncobj: Mark syncobj waits as external waiters
Date: Tue,  7 Mar 2023 10:48:21 +0000
Message-Id: <20230307104824.231094-10-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230307104824.231094-1-tvrtko.ursulin@linux.intel.com>
References: <20230307104824.231094-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Matt Turner <mattst88@gmail.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
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
2.37.2

