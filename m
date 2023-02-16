Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8478869928E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 12:00:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6808010ED45;
	Thu, 16 Feb 2023 10:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FFA10ED38;
 Thu, 16 Feb 2023 10:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676545175; x=1708081175;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zD70VZdjgnOic3K1qhG8DBPtshCjC6Dxxa8vF3F1mg4=;
 b=bh/1/GyxwTdvLRjXJoniti/8I7lqszqO2aexYcLW3bYF4VQDmdsag2Ul
 D8ROa8B5MjEBQPy9+hlXmKARan7SAyRdR7IuNgcyFBh57wk7GXdzbxU8y
 MUcTiFsoIob/0LcOGAhtwLQkV1RHYicGSsZtVchZm/STMitJQZd6pzhEp
 AK+mR8h1YwCxPpP/b4mDo3k4n/UipvtfcJoUM1k+XWPTZ8wdgBy/Qs1MZ
 F3o2IYWAApiqskG3F7eSgmsNVqiPOupEbwcOF7GtP7KMJMTuj6d5rcOll
 Iw6sehUIXxzhnaP+djyAHbAfuecYZA6ohsDi/6JW6HTCH3lGST+GTGhci w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="311317610"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="311317610"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 02:59:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="812917919"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="812917919"
Received: from murrayal-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.229.164])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 02:59:34 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 6/9] drm/syncobj: Mark syncobj waits as external waiters
Date: Thu, 16 Feb 2023 10:59:18 +0000
Message-Id: <20230216105921.624960-7-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216105921.624960-1-tvrtko.ursulin@linux.intel.com>
References: <20230216105921.624960-1-tvrtko.ursulin@linux.intel.com>
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

