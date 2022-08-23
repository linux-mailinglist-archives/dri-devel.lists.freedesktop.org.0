Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0762B5A02C9
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 22:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018FE8BF25;
	Wed, 24 Aug 2022 20:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D717511A6B5;
 Tue, 23 Aug 2022 11:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661254265; x=1692790265;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q+RysrBb1ykLU47KP6NsqGGk4VJcDn3GVM5qaCdIaVA=;
 b=DyA7ZkMNo5iUyy8zLjTAzwhCCDvQFyL9F3IAsjFqW4HnmfjnT3kGabIQ
 jrmnJzEroNNawoNqONTmuRCumzb9eRmV+aO7Y5snTKb86yEEmKeILzhER
 VYdFK6Uysh/eIj2TtZWeSSMbO3BRWe30cGlEb8VqXX0H9FP7nOnJF/UoQ
 Hx52Q2IxwMacYe1d8GMVrQi8RsVryOSYTmRqVN23DwCOJQ58tEwIE3lQj
 JDWWOu5ybrvzdC2dyNMIFXzSM32J28pqaQQDjWW1XwzIK3uwW7ZK5ewkF
 PRbF73495zorD2joiqC6CKbpNUoCVGFo8j/UC+qyhgkBee1vRWt9aSHHz A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="273415877"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="273415877"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 04:31:05 -0700
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="669990932"
Received: from fjohn-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.249.42.156])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 04:31:03 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/tests: Set also mock plane src_x, src_y,
 src_w and src_h
Date: Tue, 23 Aug 2022 14:29:20 +0300
Message-Id: <20220823112920.352563-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823112920.352563-1-jouni.hogander@intel.com>
References: <20220823112920.352563-1-jouni.hogander@intel.com>
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We need to set also src_x, src_y, src_w and src_h for the mock plane.
After fix for drm_atomic_helper_damage_iter_init we are using these
when iterating damage_clips.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/tests/drm_damage_helper_test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_damage_helper_test.c b/drivers/gpu/drm/tests/drm_damage_helper_test.c
index bf250bd08d7e..c608ae06f0e3 100644
--- a/drivers/gpu/drm/tests/drm_damage_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_damage_helper_test.c
@@ -59,6 +59,11 @@ static int drm_damage_helper_init(struct kunit *test)
 static void set_plane_src(struct drm_plane_state *state, int x1, int y1, int x2,
 			  int y2)
 {
+	state->src_x = x1;
+	state->src_y = y1;
+	state->src_w = x2 - x1;
+	state->src_h = y2 - y1;
+
 	state->src.x1 = x1;
 	state->src.y1 = y1;
 	state->src.x2 = x2;
-- 
2.34.1

