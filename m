Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EAE9F69FE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 16:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D012410EBF8;
	Wed, 18 Dec 2024 15:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="NYNkKLJG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C5510E1F1;
 Wed, 18 Dec 2024 15:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LQHHZOyQkFg+4Td5pA9rjjJfsQwYhLeVbm+T71a74zs=; b=NYNkKLJGJcv7fetEMBvIwavPzz
 cNwXj5RJe31Afd3wGCARxyRChFgC0P4LeGhMa+QTqiVl17tL8vbKcWWUtXjCKSIUWEdOoWEVO9jfl
 b9ydLLxVLho5SVTkigNWk6nTSwRBaOtSR6uJSTeKeCnwYEtz3vyiJA5PpuyjMhFf2FWg3eC7EzKuJ
 eovUGeopm2QGdkOut47olHN5+nr/uxNRB4SRXo/Z097Shc3RIBaR9dOWPgjL2M5e+T3WymXzjlbQ+
 wQlWdih5jCGkN745NI1l+wJKJtxBDRNTVMYvY7UTkn1q/0oWnlY8u0Dbv8/onMgbtjwfZuwqW5Pfh
 rA/f5AVA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tNvwU-004qMt-Pj; Wed, 18 Dec 2024 16:26:30 +0100
Date: Wed, 18 Dec 2024 15:26:29 +0000
From: Tvrtko Ursulin <tursulin@igalia.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-fixes
Message-ID: <Z2LppUZudGKXwWjW@linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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


Hi Dave, Sima,

This week a few fixes around GuC engine busyness reporting. Fixing some
races relating to engine and GT reset, and in general.

Regards,

Tvrtko

drm-intel-fixes-2024-12-18:
- Reset engine utilization buffer before registration (Umesh Nerlige Ramappa)
- Ensure busyness counter increases motonically (Umesh Nerlige Ramappa)
- Accumulate active runtime on gt reset (Umesh Nerlige Ramappa)
The following changes since commit 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8:

  Linux 6.13-rc3 (2024-12-15 15:58:23 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2024-12-18

for you to fetch changes up to 1622ed27d26ab4c234476be746aa55bcd39159dd:

  i915/guc: Accumulate active runtime on gt reset (2024-12-17 10:15:15 +0000)

----------------------------------------------------------------
- Reset engine utilization buffer before registration (Umesh Nerlige Ramappa)
- Ensure busyness counter increases motonically (Umesh Nerlige Ramappa)
- Accumulate active runtime on gt reset (Umesh Nerlige Ramappa)

----------------------------------------------------------------
Umesh Nerlige Ramappa (3):
      i915/guc: Reset engine utilization buffer before registration
      i915/guc: Ensure busyness counter increases motonically
      i915/guc: Accumulate active runtime on gt reset

 drivers/gpu/drm/i915/gt/intel_engine_types.h      |  5 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 41 +++++++++++++++++++++--
 2 files changed, 44 insertions(+), 2 deletions(-)
