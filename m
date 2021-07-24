Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 596E63D43D1
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 02:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB86A6FD4C;
	Sat, 24 Jul 2021 00:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC986FD1D;
 Sat, 24 Jul 2021 00:11:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="191563455"
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="191563455"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:11:31 -0700
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="434270007"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:11:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 13/30] drm/i915/display: remove explicit CNL handling from
 intel_vdsc.c
Date: Fri, 23 Jul 2021 17:10:57 -0700
Message-Id: <20210724001114.249295-14-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210724001114.249295-1-lucas.demarchi@intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Jose Souza <jose.souza@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Only one reference to CNL that is not needed, but code is the same for
DISPLAY_VER >= 11, so leave the code around and just remove the special
case for CNL.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vdsc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 85749370508c..df3286aa6999 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -348,7 +348,10 @@ bool intel_dsc_source_support(const struct intel_crtc_state *crtc_state)
 	if (DISPLAY_VER(i915) >= 12)
 		return true;
 
-	if ((DISPLAY_VER(i915) >= 11 || IS_CANNONLAKE(i915)) && (pipe != PIPE_A || (cpu_transcoder == TRANSCODER_EDP || cpu_transcoder == TRANSCODER_DSI_0 || cpu_transcoder == TRANSCODER_DSI_1)))
+	if (DISPLAY_VER(i915) >= 11 &&
+	    (pipe != PIPE_A || cpu_transcoder == TRANSCODER_EDP ||
+	     cpu_transcoder == TRANSCODER_DSI_0 ||
+	     cpu_transcoder == TRANSCODER_DSI_1))
 		return true;
 
 	return false;
-- 
2.31.1

