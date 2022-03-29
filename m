Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 911DF4EB392
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 20:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C11410E5A1;
	Tue, 29 Mar 2022 18:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB5D10EE4B;
 Tue, 29 Mar 2022 18:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648579401; x=1680115401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AFETZEz5P2/j5Fp8KX76zGzvbKtMTCY7DmnZDIqTVGk=;
 b=U45YuGg0m+WcLMlLNYMoMvC9I0sWFOKnbWRPiE7yYVes6w4T7ZtZ901/
 +6XUJJTple5BYH7vxoqxpanEW4SaUvissHFpl2rxuoHQR0JPjVdLYXNcV
 4Ilbs4RmiJU9daVsgXfJ4jf4FIeT+MC3aPoBUOESt6vbG3S74Nk9+pugB
 AIEv3XpntEIjZKeoVjRSjL5LrjDHXKrZy8vSkAgLeGuzCO79LSbo6bNXH
 lSkRGU7m11TyBr0vf0ipISVl7ex8mjnXuiZjGiWlNI7HJ3whKdLQ0gKed
 LQpjxOnJ211d4GtJ1SSyEuiBLKfy9W4FzxC5LmSTyNMYkT2d1C0eHtMHk g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="256912797"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="256912797"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 11:43:21 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="653180941"
Received: from dmendyk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.63.121])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 11:43:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/12] drm/edid: reduce magic when updating the EDID block
 checksum
Date: Tue, 29 Mar 2022 21:42:19 +0300
Message-Id: <0ec68aa82b4be2d46e442e74e341419d10c4c41b.1648578814.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648578814.git.jani.nikula@intel.com>
References: <cover.1648578814.git.jani.nikula@intel.com>
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
---
 drivers/gpu/drm/drm_edid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index d0a76781ed19..d2dfab28b5b7 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1840,8 +1840,8 @@ static struct edid *edid_filter_invalid_blocks(const struct edid *edid,
 			memcpy(base++, block, EDID_LENGTH);
 	}
 
-	new->checksum += new->extensions - valid_extensions;
 	new->extensions = valid_extensions;
+	new->checksum = edid_block_compute_checksum(new);
 
 out:
 	kfree(edid);
-- 
2.30.2

