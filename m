Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 977FB54285E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8205810EE75;
	Wed,  8 Jun 2022 07:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4418E10EE17;
 Wed,  8 Jun 2022 07:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654674655; x=1686210655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1F+9R11+rJklqKC15plDbpWNvD6R2NndH62cf8tKsCw=;
 b=QbpsNXAvUxR4kDS5mbkcKeVI80S/9NxyIwO6CLwR1GiQR4dnX8eqgZc1
 EqAkBf2tj7hcnM8Pi95nzGAXfzFodNE7MdVyWOeGMkgMAW66DVy7E+N0t
 WPy+PwZW2YV/xO38/yQxktpAUDTnm4jTay4K3nF6CSKny3y/NmVVjWtvE
 NRvZ3RQzoAUujH2BULIEYfmd4A9t0663FosWDr1qIKiexPZYJDft1gqgj
 bVRwPtBgyOjUwEbBAgir9HUTV/sNmhAdNcYrsTqj1f3l+lty6/CvaqhKI
 TtoAWVCB3g7cen79O7hr6L6XkwJtLoKNFbde9jm4kG8ZhPu20eIQ9WVP7 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="274336234"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="274336234"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:50:54 -0700
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="584719785"
Received: from jkosticx-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.58.130])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:50:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/15] drm/edid: fix CTA data block collection size for CTA
 version 3
Date: Wed,  8 Jun 2022 10:50:31 +0300
Message-Id: <2a4c94417f024cbafc5d4ca0a74e4617fc4325d1.1654674560.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1654674560.git.jani.nikula@intel.com>
References: <cover.1654674560.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The CTA Data Block Collection is valid only for CTA extension version
3. In versions 1 and 2, it is a reserved block, which we ignore.

The DTD start offset (byte 2, or d in CTA-861 spec), which determines
the CTA Data Block Collection size, is specified slightly differently
for different versions:

Version 1:
    d = offset for the byte following the reserved data block. If no
    data is provided in the reserved data block, then d=4. If no DTDs
    are provided, then d=0

Version 2:
    d = offset for the byte following the reserved data block. If no
    data is provided in the reserved data block, then d=4. If d=0, then
    no detailed timing descriptors are provided, and no data is provided
    in the reserved data block.

Version 3:
    d = offset for the byte following the data block collection. If no
    data is provided in the data block collection, then d=4. If d=0,
    then no detailed timing descriptors are provided, and no data is
    provided in the data block collection.

Ever since commit 9e50b9d55e9c ("drm: edid: Add some bounds checking"),
we've interpreted 0 to mean there are no DTDs but it's all Data
Blocks. Per the spec, Data Blocks are only valid for version 3, where we
should interpret 0 to mean there are no data blocks.

Follow the spec (and hope the EDIDs follow it too).

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 929fc0e46751..c57f6333ea7d 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4498,8 +4498,6 @@ static const void *__cea_db_iter_edid_next(struct cea_db_iter *iter)
 
 		iter->index = 4;
 		iter->end = ext[2];
-		if (iter->end == 0)
-			iter->end = 127;
 		if (iter->end < 4 || iter->end > 127)
 			continue;
 
-- 
2.30.2

