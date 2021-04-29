Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1325A36E32B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 04:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7E26EC79;
	Thu, 29 Apr 2021 02:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m176218.qiye.163.com (mail-m176218.qiye.163.com
 [59.111.176.218])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10F06EC79
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 02:13:34 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [36.152.145.181])
 by mail-m176218.qiye.163.com (Hmail) with ESMTPA id 71C04320154;
 Thu, 29 Apr 2021 10:13:30 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915: Use might_alloc()
Date: Wed, 28 Apr 2021 19:13:27 -0700
Message-Id: <20210429021327.57944-1-bernard@vivo.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGUweT1YdTk8eTEMeGU0dGEhVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORw6PQw4Sz8PDkkSOh8eECEf
 GTQaCh5VSlVKTUpCTU1JT0pLQkxDVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlITVVK
 TklVSk9OVUpDSllXWQgBWUFKQ0lINwY+
X-HM-Tid: 0a791b671397d978kuws71c04320154
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
Cc: Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This maybe uses lockdep through the fs_reclaim annotations.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/i915/i915_request.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 9165971c3c47..7e1aa540aa0d 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -928,7 +928,7 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
 	u32 seqno;
 	int ret;
 
-	might_sleep_if(gfpflags_allow_blocking(gfp));
+	might_alloc(gfp);
 
 	/* Check that the caller provided an already pinned context */
 	__intel_context_pin(ce);
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
