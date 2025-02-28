Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938AEA4A4CE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 22:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD47910ED58;
	Fri, 28 Feb 2025 21:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjD7wLA5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D085C10ED58;
 Fri, 28 Feb 2025 21:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740777325; x=1772313325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eFJSUo0VQyqq9qD4qi5Qi148Jlk8Ij47jPkoiPk2IzU=;
 b=GjD7wLA50AgqSoxbydzAnriBTUjLddIB5pj9SpVivVBoYAFT3eXB3nUH
 Af1pclhKuYE/fahbMLbqdq8Nism9LlimJ0oycaam+jMx7ck9BNg4mL5AA
 VBMXs027EG0BkJtxsUYwnLG/c7bKLZ8GwxGbWxLZ12zlHqgWRpuxseKuC
 QlSzTVbLY1ytf+9KmihQ89cSBqOAhKdQNvD3/wF3WldzJOXPETDe4KkaJ
 oZ7aeOhCxTfnB9fLk4hibkVh4/uKKJa2nszqOpg5BYFGYQKbMRMHok/4E
 AqDgmsUoXxLUpSu8p0/W+F5c4sd9gOyA5x8paf/SzPEN62laUI5rr20tc A==;
X-CSE-ConnectionGUID: o7CEPzoDTsSDlDMq4vCkuA==
X-CSE-MsgGUID: no+CKPpzTES6tavYSZ/Iug==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="52352361"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="52352361"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 13:15:24 -0800
X-CSE-ConnectionGUID: Bu8f7V/fStOpImOQVeewMA==
X-CSE-MsgGUID: qsN4KANtSFyBu99SJW1Dgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122684938"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 28 Feb 2025 13:15:22 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 28 Feb 2025 23:15:21 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 8/8] drm/client: s/unsigned int i/int i/
Date: Fri, 28 Feb 2025 23:14:54 +0200
Message-ID: <20250228211454.8138-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250228211454.8138-1-ville.syrjala@linux.intel.com>
References: <20250228211454.8138-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Replace the 'unsigned int i' footguns with plain old signed
int. Avoids accidents if/when someone decides they need
to iterate backwards.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 54cbcaa476e2..0f9d5ba36c81 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -39,7 +39,7 @@ int drm_client_modeset_create(struct drm_client_dev *client)
 	unsigned int max_connector_count = 1;
 	struct drm_mode_set *modeset;
 	struct drm_crtc *crtc;
-	unsigned int i = 0;
+	int i = 0;
 
 	/* Add terminating zero entry to enable index less iteration */
 	client->modesets = kcalloc(num_crtc + 1, sizeof(*client->modesets), GFP_KERNEL);
@@ -75,7 +75,7 @@ static void drm_client_modeset_release(struct drm_client_dev *client)
 	struct drm_mode_set *modeset;
 
 	drm_client_for_each_modeset(modeset, client) {
-		unsigned int i;
+		int i;
 
 		drm_mode_destroy(client->dev, modeset->mode);
 		modeset->mode = NULL;
@@ -960,7 +960,7 @@ bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation)
 	struct drm_plane *plane = modeset->crtc->primary;
 	struct drm_cmdline_mode *cmdline;
 	u64 valid_mask = 0;
-	unsigned int i;
+	int i;
 
 	if (!modeset->num_connectors)
 		return false;
-- 
2.45.3

