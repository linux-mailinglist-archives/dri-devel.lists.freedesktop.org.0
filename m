Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EEA4EB387
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 20:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB59F10E6D5;
	Tue, 29 Mar 2022 18:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F7A10E6D5;
 Tue, 29 Mar 2022 18:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648579365; x=1680115365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KgThcknXaTTQ1EGu621Q0QOsXxvGZn/fdQgmHfakQMU=;
 b=V+UBNZUfMcJqYkAzj0m01OmQdPIf6mc0XBUDB8CMtskyrVyrZ8gGZmcY
 eCa9a0WMQJELcxZI355fbaeeNBRqTQLJ7jkV2AHqhQXH6k8sgY2DX9itd
 KqAo7dnhgsoF4od4jcslOJqzbp5v96rgdy6AF41Hj9b0pciDVl4Pjer1B
 VtflwtfArVt415IxlsBZJbYXlRuYGyIhRo5NJicZjk3LUJfkrmQikGPhZ
 Eex2GDHzxjQ/u+qj4AXM+WfgAozS27w1c2TGNYl9P5sBqX4cuzzEYDy1E
 5A4jk3lGmBpyLpv8vPi4G0kiRu2P4W18buia4PjdvN5b7y2Raltcbr3et A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259307863"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="259307863"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 11:42:44 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="521557943"
Received: from dmendyk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.63.121])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 11:42:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/12] drm/edid: make drm_edid_header_is_valid() accept void
 pointer
Date: Tue, 29 Mar 2022 21:42:11 +0300
Message-Id: <f90ff17d762e491875172ab91f265f2e9ee8fdea.1648578814.git.jani.nikula@intel.com>
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

It will be useful to accept a struct edid *, but for compatibility with
existing usage accept void *.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 8 +++++---
 include/drm/drm_edid.h     | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 95f0303bc63e..b5b21b50e476 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1580,13 +1580,15 @@ static const u8 edid_header[] = {
  *
  * Return: 8 if the header is perfect, down to 0 if it's totally wrong.
  */
-int drm_edid_header_is_valid(const u8 *raw_edid)
+int drm_edid_header_is_valid(const void *_edid)
 {
+	const struct edid *edid = _edid;
 	int i, score = 0;
 
-	for (i = 0; i < sizeof(edid_header); i++)
-		if (raw_edid[i] == edid_header[i])
+	for (i = 0; i < sizeof(edid_header); i++) {
+		if (edid->header[i] == edid_header[i])
 			score++;
+	}
 
 	return score;
 }
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 48b1bf9c315a..b7e170584000 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -578,7 +578,7 @@ int drm_add_modes_noedid(struct drm_connector *connector,
 void drm_set_preferred_mode(struct drm_connector *connector,
 			    int hpref, int vpref);
 
-int drm_edid_header_is_valid(const u8 *raw_edid);
+int drm_edid_header_is_valid(const void *edid);
 bool drm_edid_block_valid(u8 *raw_edid, int block, bool print_bad_edid,
 			  bool *edid_corrupt);
 bool drm_edid_is_valid(struct edid *edid);
-- 
2.30.2

