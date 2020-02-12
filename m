Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D50F15A4E7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 10:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F216E58E;
	Wed, 12 Feb 2020 09:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A626E563;
 Wed, 12 Feb 2020 09:35:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2020 01:35:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="406240237"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by orsmga005.jf.intel.com with ESMTP; 12 Feb 2020 01:35:03 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/5] drm/hdcp: fix DRM_HDCP_2_KSV_COUNT_2_LSBITS
Date: Wed, 12 Feb 2020 15:05:12 +0530
Message-Id: <20200212093515.11700-3-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200212093515.11700-1-ramalingam.c@intel.com>
References: <20200212093515.11700-1-ramalingam.c@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Need to extract the 2 most significant bits from a byte for constructing
the revoked KSV count of the SRM.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 include/drm/drm_hdcp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
index d512089b873f..c6bab4986a65 100644
--- a/include/drm/drm_hdcp.h
+++ b/include/drm/drm_hdcp.h
@@ -276,7 +276,7 @@ void drm_hdcp_cpu_to_be24(u8 seq_num[HDCP_2_2_SEQ_NUM_LEN], u32 val)
 #define DRM_HDCP_2_VRL_LENGTH_SIZE		3
 #define DRM_HDCP_2_DCP_SIG_SIZE			384
 #define DRM_HDCP_2_NO_OF_DEV_PLUS_RESERVED_SZ	4
-#define DRM_HDCP_2_KSV_COUNT_2_LSBITS(byte)	(((byte) & 0xC) >> 6)
+#define DRM_HDCP_2_KSV_COUNT_2_LSBITS(byte)	(((byte) & 0xC0) >> 6)
 
 struct hdcp_srm_header {
 	u8 srm_id;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
