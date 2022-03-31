Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8764EE100
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 20:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6640210F48F;
	Thu, 31 Mar 2022 18:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE7B10F48F;
 Thu, 31 Mar 2022 18:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648752398; x=1680288398;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MtOBo42g9PKC6W0n+zCx2wtvOY1VNB8ooqCDwbPWoVk=;
 b=hnuGGcfyDfVwnrPeuXuxJqoyRpx8L02qo2lZzKUbWMDXPh5ogj7MM3sn
 Kn3XPw0HcpBLVd9ev0bxeWvLSeZus6OWlH39ePKj67w6vV++TxmZLPBx5
 Z5E7vTh0akFoUeSIDJehqa0urrpMGSwQZfBlUO9RbAJUh3jhdUKPmOT8p
 zxT6dJjdZQJd/6jKWZ0VL1jMaDiFh9N4IHr0BkOeo4dqu7Zw6ka0WGnw8
 Wr0UzcrztRSzIn5Yygjlyrioi+p90GlIC0yXPwmS9RE30Y8jz5X9DBhrS
 Hw4orIfNbp2Fq9AzV7BO7Jegn1GPMaxqFZ0FrKKfWZoC3hleAO6jCNHzl g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="239847996"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="239847996"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 11:46:09 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="520757783"
Received: from gluca-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.194])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 11:46:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 12/12] drm/edid: reduce magic when updating the EDID block
 checksum
Date: Thu, 31 Mar 2022 21:45:09 +0300
Message-Id: <5a11435419d804a58ef356c0b9acf445cffc1354.1648752228.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648752228.git.jani.nikula@intel.com>
References: <cover.1648752228.git.jani.nikula@intel.com>
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

The code modifying the EDID block should not need to do tricks to fix
the checksum. We have a function for computing the checksum, use it.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 8bf0ae72fd2c..04e818ecd662 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1842,8 +1842,8 @@ static struct edid *edid_filter_invalid_blocks(const struct edid *edid,
 			memcpy(dest_block++, block, EDID_LENGTH);
 	}
 
-	new->checksum += new->extensions - valid_extensions;
 	new->extensions = valid_extensions;
+	new->checksum = edid_block_compute_checksum(new);
 
 out:
 	kfree(edid);
-- 
2.30.2

