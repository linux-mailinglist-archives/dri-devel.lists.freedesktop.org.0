Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E8715A65B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 11:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D13D6F4AA;
	Wed, 12 Feb 2020 10:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41EE06F4A4;
 Wed, 12 Feb 2020 10:29:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2020 02:29:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="434000933"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by fmsmga006.fm.intel.com with ESMTP; 12 Feb 2020 02:29:29 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 2/5] drm/hdcp: fix DRM_HDCP_2_KSV_COUNT_2_LSBITS
Date: Wed, 12 Feb 2020 15:59:39 +0530
Message-Id: <20200212102942.26568-3-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200212102942.26568-1-ramalingam.c@intel.com>
References: <20200212102942.26568-1-ramalingam.c@intel.com>
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
