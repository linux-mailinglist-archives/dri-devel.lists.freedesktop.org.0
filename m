Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 796AE822B18
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD6F10E306;
	Wed,  3 Jan 2024 10:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C5210E306
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276770; x=1735812770;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rZwH19IQ0PPWCzjpK0Dvo48+X/KhH8+T63DKcwUOniY=;
 b=X5CgMMLBTH65UFFSTtgWXPuaZHf1ErsxtsN9xVoukABtKiv5vwdKEmHe
 leMEU5MPb9HVj/lR8U2ph1XV+bBrNq+tvazcr5lJuZnVrln+hEutJ1n6K
 h+IUwyqFFZk/IgGtEU3xzFlLNagdPokWM8cP1lQtJrffGwT4yfHbeafy5
 PFB5MY4/EuZmbvQNRVLkKr/ueI7Yu4euIxC7j9UTcPOenWC7ZZ9HOnkTr
 ubRSTvxLmTyzKcz6FcJ9Fk/WSaX1wCbERB3lltDuig0A+8B3uTFu54aoL
 YiWDzBt4bD+r3r9mTdITwvo8j6uwVbwMfCPDShbZ9AV8ZeusuhY2SMusR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="483173985"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="483173985"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:12:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="729746283"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="729746283"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:12:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 36/39] drm/bridge: tc358767: update the EDID property
Date: Wed,  3 Jan 2024 12:08:50 +0200
Message-Id: <aba68195f3ea280b2e6d50083a5394aab93310ec.1704276309.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704276309.git.jani.nikula@intel.com>
References: <cover.1704276309.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The EDID property should be updated between reading the EDID and adding
the modes.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index eb0d82a91cb9..da2aec5110c2 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1674,6 +1674,7 @@ static int tc_connector_get_modes(struct drm_connector *connector)
 	}
 
 	edid = tc_get_edid(&tc->bridge, connector);
+	drm_connector_update_edid_property(connector, edid);
 	num_modes = drm_add_edid_modes(connector, edid);
 	kfree(edid);
 
-- 
2.39.2

