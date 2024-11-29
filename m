Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2099DBEFF
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 05:26:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7C110E15C;
	Fri, 29 Nov 2024 04:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gNLqFmZp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BA210E15C;
 Fri, 29 Nov 2024 04:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732854393; x=1764390393;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HLdW4U2SdYyoQCXrEzfasMMcmh4pmbrrjlJvK/rfrw8=;
 b=gNLqFmZpGZBYkEHMelsWSd2WmiqKc+Wa37SosYa+V1rr8iuUTg0gio8S
 yusrHzySP2ain5hL/OyK1AXJSGCXBlsBn1iHRM8XdToez75h0GJIfIuTY
 RCFQPVhR7BaLTH94Cb+ZJzdbodK8unupJ1mFiTcxQnb6ILqlKaDid5RA7
 ibJNNrvT6gOH24CPkdzMZKd/NK3fvCCqZ7jlCCnR1VuK5maOVaY9phdHa
 yco66u++fYiYzBf7pV9r/qpaROtItSbsSeNlVTJIKEDXpHzKMg36zQkSS
 jE0o4K26J9XX8NtvMVs8pDAJXEhZnRLld+155ah70BQkg7VB89MX9LgPy g==;
X-CSE-ConnectionGUID: oB720Nh5SQW4tW77YehNSg==
X-CSE-MsgGUID: onhRtcRYQwWZ0Mz3/sYlKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33028014"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="33028014"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 20:26:33 -0800
X-CSE-ConnectionGUID: LjMo3wXPQi28mouWfn80BA==
X-CSE-MsgGUID: lQ4ZW8HRRFaq61kXt8VEsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="92567169"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 28 Nov 2024 20:26:30 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 29 Nov 2024 06:26:29 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] drm/modes: Fix div-by-zero in drm_mode_vrefresh()
Date: Fri, 29 Nov 2024 06:26:27 +0200
Message-ID: <20241129042629.18280-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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

Fix a potential div-by-zero in drm_mode_vrefresh()

TODO: should probably make drm_mode_setcrtc() not even print the
      (potentially partially) converted mode, and instead print
      the original umode..

Test-with: 20241128190927.26033-1-ville.syrjala@linux.intel.com

Ville Syrjälä (2):
  drm/modes: Avoid divide by zero harder in drm_mode_vrefresh()
  drm/modes: Fix drm_mode_vrefres() docs

 drivers/gpu/drm/drm_modes.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

-- 
2.45.2

