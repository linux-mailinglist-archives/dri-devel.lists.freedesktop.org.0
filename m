Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9156E12C2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 18:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C9710EB90;
	Thu, 13 Apr 2023 16:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576ED10E086;
 Thu, 13 Apr 2023 16:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681404580; x=1712940580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VO+hzf+JZT0LDwb9AwFVSgz/6tqEyB7SG90J+rO9ms0=;
 b=Uy60H/tBh3P2y4ldI/zsxQEcFyjexd7vu6PoDQF14KoIg4i7IqimGdrH
 U7WQt3wjJxiYGEXGkTu4bwP4e7ZmTqA2Rxvt0KqgrT0bqXl8gqXiUCEob
 kCH7mppGM8bfNDfAVAufieTAgFrQK+RQ9QkzpM6yj/BXPag7BdLgH0QLV
 MXVDTJt50zUATdK18MTiPGIb0rbAgJuVhUydUHv36YNTo2Yn169icCOdS
 NTkosRQrUqIBFZAslENU18+wbiW+oH6N6JIJVexIEd02JwIqA4J6NkxsK
 JhSRhkSrJmStVq7Zbe43YXPHypE+cC1m2/JuejE2r7N2QcByRtX6wZtMh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="342991073"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="342991073"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 09:49:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="692037919"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="692037919"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 13 Apr 2023 09:49:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 13 Apr 2023 19:49:22 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/7] drm/i915: Expose crtc CTM property on ilk/snb
Date: Thu, 13 Apr 2023 19:49:11 +0300
Message-Id: <20230413164916.4221-3-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The ilk/snb code is internally fully capable of handling the
CTM property, so expose it.

Note that we still choose not to expose DEGAMMA_LUT though.
The hardware is capable if degamma or gamma, but not both
similtanously due to lack of the split gamma mode. Exposing
both LUTs might encourage userspace to try enabling both
at the same time.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 07f1afe1d406..4fc16cac052d 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3473,7 +3473,7 @@ void intel_color_crtc_init(struct intel_crtc *crtc)
 
 	gamma_lut_size = INTEL_INFO(i915)->display.color.gamma_lut_size;
 	degamma_lut_size = INTEL_INFO(i915)->display.color.degamma_lut_size;
-	has_ctm = degamma_lut_size != 0;
+	has_ctm = DISPLAY_VER(i915) >= 5 && !IS_VALLEYVIEW(i915);
 
 	/*
 	 * "DPALETTE_A: NOTE: The 8-bit (non-10-bit) mode is the
-- 
2.39.2

