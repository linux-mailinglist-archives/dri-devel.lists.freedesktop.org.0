Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDB860A659
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 14:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58CA10E4B7;
	Mon, 24 Oct 2022 12:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D15D10E490;
 Mon, 24 Oct 2022 12:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666614850; x=1698150850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CDQN/zYX5wiP6gpZ/F6iZF75mf0QzLV8Td5iTzLODSM=;
 b=CmNFE8Yw0Bj6WURlU9RGUJeVH0uvnnL1fbCGoUwDg0N9pGmmcI1xpHig
 hfJh6yIDF6LRWXQnqK5JSAViE07sxCt85RKiivtpQ4JF7uaUvQk8nIrsZ
 CKo1OQoh61lugfCF5kTTyCMTR5r1nmAI2K2/l6ESxMAMSN1F4FEJZUDhW
 W4w7cEc5JEcZq2XDGPpimOxS/zk680JJNMsSSRCrR2oOOc5CLVod95MA8
 TgUEj4GsGlr7QdgZW7dc3Khpz9ELTvDN3EsJ+OQgR1NTNMwRXg3uLa5hz
 5vZNIqQ4q5UvMj7XlPoZDJi9P4VoN95C+iryycEEdPoszHquS6UAZPWfy Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="369472676"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="369472676"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:34:09 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="626055645"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="626055645"
Received: from emontau-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.221])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:34:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 04/16] drm/edid: debug log EDID override set/reset
Date: Mon, 24 Oct 2022 15:33:32 +0300
Message-Id: <ae352f542b4d69398c0965e33fb2e6e34156cbfb.1666614699.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666614699.git.jani.nikula@intel.com>
References: <cover.1666614699.git.jani.nikula@intel.com>
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

It's useful debugging information to know if and when an override EDID
was set or reset.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 47465b9765f1..a863cffa2dc5 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2194,6 +2194,9 @@ int drm_edid_override_set(struct drm_connector *connector, const void *edid,
 
 	connector->override_edid = false;
 
+	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] EDID override set\n",
+		    connector->base.id, connector->name);
+
 	ret = drm_connector_update_edid_property(connector, edid);
 	if (!ret)
 		connector->override_edid = true;
@@ -2206,6 +2209,9 @@ int drm_edid_override_reset(struct drm_connector *connector)
 {
 	connector->override_edid = false;
 
+	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] EDID override reset\n",
+		    connector->base.id, connector->name);
+
 	return drm_connector_update_edid_property(connector, NULL);
 }
 
-- 
2.34.1

