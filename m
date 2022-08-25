Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2FC5A09BA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 09:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A64AFF96;
	Thu, 25 Aug 2022 07:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 318 seconds by postgrey-1.36 at gabe;
 Thu, 25 Aug 2022 01:43:27 UTC
Received: from mail.nfschina.com (unknown
 [IPv6:2400:dd01:100f:2:72e2:84ff:fe10:5f45])
 by gabe.freedesktop.org (Postfix) with ESMTP id B78BB113907;
 Thu, 25 Aug 2022 01:43:27 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mail.nfschina.com (Postfix) with ESMTP id 611481E80CC4;
 Thu, 25 Aug 2022 09:34:04 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
 by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8hsjB63QpFXJ; Thu, 25 Aug 2022 09:34:01 +0800 (CST)
Received: from localhost.localdomain.localdomain (unknown [219.141.250.2])
 (Authenticated sender: lvqian@nfschina.com)
 by mail.nfschina.com (Postfix) with ESMTPA id 75BBF1E80C99;
 Thu, 25 Aug 2022 09:34:01 +0800 (CST)
From: Lv qian <lvqian@nfschina.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/i915:Move the code position to reduce the number of
 judgments
Date: Thu, 25 Aug 2022 09:37:52 +0800
Message-Id: <20220825013752.120988-1-lvqian@nfschina.com>
X-Mailer: git-send-email 2.18.2
X-Mailman-Approved-At: Thu, 25 Aug 2022 07:15:57 +0000
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lv qian <lvqian@nfschina.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

	If the kmalloc allocation is successful, the if is judged twice, 
	so I move the second judgment in to the first judgment.

Signed-off-by: Lv qian <lvqian@nfschina.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 32e92651ef7c..c8230a8beadb 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -112,10 +112,10 @@ static bool __i915_error_grow(struct drm_i915_error_state_buf *e, size_t len)
 	if (!e->buf) {
 		e->size = PAGE_ALIGN(len + 1);
 		e->buf = kmalloc(e->size, GFP_KERNEL);
-	}
-	if (!e->buf) {
-		e->err = -ENOMEM;
-		return false;
+		if (!e->buf) {
+			e->err = -ENOMEM;
+			return false;
+		}
 	}
 
 	return true;
-- 
2.18.2

