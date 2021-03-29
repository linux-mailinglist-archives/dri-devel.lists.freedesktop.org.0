Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8931034D16B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 15:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4746E428;
	Mon, 29 Mar 2021 13:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E0F6E41D;
 Mon, 29 Mar 2021 13:38:09 +0000 (UTC)
IronPort-SDR: Eusxct+IsLRqXbWqwHZH+rBz4HKu+jbasnrjCCZscnp+DE3GzQFKzHDzg2M+7ttCWLgLWSR4bW
 8JOiIb2QZpJg==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="276713446"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; d="scan'208";a="276713446"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 06:38:08 -0700
IronPort-SDR: f0AXu7mP1Q90eswyM7FEME3raPoojqwPGmVFhLqatNxa7KrbPGOxha1pBcpHkmtaGWzbPB86wq
 YruYZoDL0ycQ==
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; d="scan'208";a="526960120"
Received: from auchter-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.56.199])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 06:38:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 7/8] drm/displayid: allow data blocks with 0 payload length
Date: Mon, 29 Mar 2021 16:37:21 +0300
Message-Id: <d562dff99ba7c92accb654a99b433bed471e8507.1617024940.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617024940.git.jani.nikula@intel.com>
References: <cover.1617024940.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DisplayID specifications explicitly call out 0 as a valid payload
length for data blocks. The mere presence of a data block, or the
information coded in the block specific data (bits 7:3 in offset 1), may
be enough to convey the necessary information.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_displayid.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
index 902ff6114b68..e0b9e58a9dc8 100644
--- a/drivers/gpu/drm/drm_displayid.c
+++ b/drivers/gpu/drm/drm_displayid.c
@@ -77,8 +77,7 @@ displayid_iter_block(const struct displayid_iter *iter)
 	block = (const struct displayid_block *)&iter->section[iter->idx];
 
 	if (iter->idx + sizeof(*block) <= iter->length &&
-	    iter->idx + sizeof(*block) + block->num_bytes <= iter->length &&
-	    block->num_bytes > 0)
+	    iter->idx + sizeof(*block) + block->num_bytes <= iter->length)
 		return block;
 
 	return NULL;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
