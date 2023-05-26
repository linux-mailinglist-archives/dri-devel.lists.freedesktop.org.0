Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E48D7130B8
	for <lists+dri-devel@lfdr.de>; Sat, 27 May 2023 01:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E2710E0EE;
	Fri, 26 May 2023 23:54:58 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FFE10E175;
 Fri, 26 May 2023 23:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685145296; x=1716681296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DH3stmbj5wCKV2JwgW87hkQDtfHGiquDeDGr6A8Y2Ig=;
 b=cZ6WJyPSqnAW0uvB3KVXBoOcbHsa7wZfhGYzWEkzoTPH87rcN/2n2+vM
 ih2onyPHmZawzLia6OByNjzDKeZdt/i9z7TEqHHTD+9zJGAWD+KQgBXjT
 uKTAcjZPzD2AiOWCa6VnY+wxl9QiNrkiBcS2cwFx/zFPGTfISgSB6V99B
 FotXqUggibdo8e/n63Fz0X0XZ7wR5ilTYHFnrW43+3lEj3xw0r0B8hcjc
 AYly0WRrtEpdekfhkfjb8tDJliRhHETu08EZftUZ9G8BFS/h+JY/1jdAs
 45eZkWVZDbwA8Ad8QmhBBrqOMeSTPkF09EifRNcrZLIyVPzPBgHanOPLe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="356716169"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="356716169"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 16:54:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="829667550"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="829667550"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga004.jf.intel.com with ESMTP; 26 May 2023 16:54:55 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/3] drm/i915/guc: Use FAST_REQUEST for non-blocking H2G calls
Date: Fri, 26 May 2023 16:55:36 -0700
Message-Id: <20230526235538.2230780-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230526235538.2230780-1-John.C.Harrison@Intel.com>
References: <20230526235538.2230780-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

In addition to the already defined REQUEST HXG message format,
which is used when sender expects some confirmation or data,
HXG protocol includes definition of the FAST REQUEST message,
that may be used when sender does not expect any useful data
to be returned.

Using this instead of GUC_HXG_TYPE_EVENT for non-blocking CTB requests
will allow GuC to send back GUC_HXG_TYPE_RESPONSE_FAILURE in case of
errors.

Note that it is not possible to return such errors to the caller,
since this is for non-blocking calls and the related fence is not
stored. Instead such messages are treated as unexpected, which will
give an indication of potential GuC misprogramming that warrants extra
debugging effort.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/abi/guc_messages_abi.h | 30 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  6 ++--
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
index 7d5ba4d97d708..98eb4f46572b9 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
@@ -24,6 +24,7 @@
  *  |   | 30:28 | **TYPE** - message type                                      |
  *  |   |       |   - _`GUC_HXG_TYPE_REQUEST` = 0                              |
  *  |   |       |   - _`GUC_HXG_TYPE_EVENT` = 1                                |
+ *  |   |       |   - _`GUC_HXG_TYPE_FAST_REQUEST` = 2                         |
  *  |   |       |   - _`GUC_HXG_TYPE_NO_RESPONSE_BUSY` = 3                     |
  *  |   |       |   - _`GUC_HXG_TYPE_NO_RESPONSE_RETRY` = 5                    |
  *  |   |       |   - _`GUC_HXG_TYPE_RESPONSE_FAILURE` = 6                     |
@@ -46,6 +47,7 @@
 #define GUC_HXG_MSG_0_TYPE			(0x7 << 28)
 #define   GUC_HXG_TYPE_REQUEST			0u
 #define   GUC_HXG_TYPE_EVENT			1u
+#define   GUC_HXG_TYPE_FAST_REQUEST		2u
 #define   GUC_HXG_TYPE_NO_RESPONSE_BUSY		3u
 #define   GUC_HXG_TYPE_NO_RESPONSE_RETRY	5u
 #define   GUC_HXG_TYPE_RESPONSE_FAILURE		6u
@@ -89,6 +91,34 @@
 #define GUC_HXG_REQUEST_MSG_0_ACTION		(0xffff << 0)
 #define GUC_HXG_REQUEST_MSG_n_DATAn		GUC_HXG_MSG_n_PAYLOAD
 
+/**
+ * DOC: HXG Fast Request
+ *
+ * The `HXG Request`_ message should be used to initiate asynchronous activity
+ * for which confirmation or return data is not expected.
+ *
+ * If confirmation is required then `HXG Request`_ shall be used instead.
+ *
+ * The recipient of this message may only use `HXG Failure`_ message if it was
+ * unable to accept this request (like invalid data).
+ *
+ * Format of `HXG Fast Request`_ message is same as `HXG Request`_ except @TYPE.
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN - see `HXG Message`_                                  |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = `GUC_HXG_TYPE_FAST_REQUEST`_                          |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 27:16 | DATA0 - see `HXG Request`_                                   |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | ACTION - see `HXG Request`_                                  |
+ *  +---+-------+--------------------------------------------------------------+
+ *  |...|       | DATAn - see `HXG Request`_                                   |
+ *  +---+-------+--------------------------------------------------------------+
+ */
+
 /**
  * DOC: HXG Event
  *
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index a22e33f37cae6..af52ed4ffc7fb 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -426,11 +426,11 @@ static int ct_write(struct intel_guc_ct *ct,
 		 FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
 		 FIELD_PREP(GUC_CTB_MSG_0_FENCE, fence);
 
-	type = (flags & INTEL_GUC_CT_SEND_NB) ? GUC_HXG_TYPE_EVENT :
+	type = (flags & INTEL_GUC_CT_SEND_NB) ? GUC_HXG_TYPE_FAST_REQUEST :
 		GUC_HXG_TYPE_REQUEST;
 	hxg = FIELD_PREP(GUC_HXG_MSG_0_TYPE, type) |
-		FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
-			   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
+		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION |
+			   GUC_HXG_REQUEST_MSG_0_DATA0, action[0]);
 
 	CT_DEBUG(ct, "writing (tail %u) %*ph %*ph %*ph\n",
 		 tail, 4, &header, 4, &hxg, 4 * (len - 1), &action[1]);
-- 
2.39.1

