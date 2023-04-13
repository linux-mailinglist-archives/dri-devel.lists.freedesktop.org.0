Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5136E12CC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 18:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7067E10EBA4;
	Thu, 13 Apr 2023 16:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E5110EB99;
 Thu, 13 Apr 2023 16:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681404588; x=1712940588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=utq7zjFIZnTbI517Po7IKHQ7PiuadAtLPEgHNn3pZ1c=;
 b=NfXIs00nxKOHQjMt4fNRBi74ptbqa5F+4AeA9UizVz6QXpsL3909Qoyg
 wJGHczeBRpLCnSgpHuppSQsQ/5W5kkyyx+8rJ5YV0oFpPDMwHmg+4C3Lv
 UxZlACpVKiPckHvFEKAFgpAVXyHXSjhSE+YBXf27Zn4agp2jE6tj00fbj
 mViNC6dRlPBfR9YZIrWJc9lbJ9dfL8nZypyNelZSf0GuDRDLTV6dEWg9+
 xSJY92xs2GMmQBpLTU5iHL8fVlhx6R6BMeyMH5NKa/Y69YzjP7T51RARF
 LixMfcUrR7SlLKXDwgFnllv/20ejLjJ29sP7qIWannYXftXg1y7YID7iY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="342991162"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="342991162"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 09:49:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="692038030"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="692038030"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 13 Apr 2023 09:49:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 13 Apr 2023 19:49:37 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 7/7] drm/i915: Do state check for color management changes
Date: Thu, 13 Apr 2023 19:49:16 +0300
Message-Id: <20230413164916.4221-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413164916.4221-1-ville.syrjala@linux.intel.com>
References: <20230413164916.4221-1-ville.syrjala@linux.intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

In order to validate LUT programming more thoroughly let's
do a state check for all color management updates as well.

Not sure we really want this outside CI. It is rather heavy
and color management updates could become rather common
with all the HDR/etc. stuff happening. Maybe we should have
an extra knob for this that we could enable in CI?

v2: Skip for initial_commit to avoid FDI dotclock
    sanity checks/etc. tripping up

Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_modeset_verify.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_modeset_verify.c b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
index 842d70f0dfd2..9e4767e1b900 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_verify.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
@@ -228,6 +228,8 @@ void intel_modeset_verify_crtc(struct intel_crtc *crtc,
 			       struct intel_crtc_state *new_crtc_state)
 {
 	if (!intel_crtc_needs_modeset(new_crtc_state) &&
+	    (!intel_crtc_needs_color_update(new_crtc_state) ||
+	     new_crtc_state->inherited) &&
 	    !intel_crtc_needs_fastset(new_crtc_state))
 		return;
 
-- 
2.39.2

