Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD0D94B931
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 10:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5FD410E68F;
	Thu,  8 Aug 2024 08:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JD4wd/M/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D8B10E09E;
 Thu,  8 Aug 2024 08:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gQZ79UOaZo5p3yi8IWJc6cOtefuysd/5AQ24KXkoXFI=; b=JD4wd/M/OPKDU1RVJVy+gy1ZY3
 +sc7rhvrKoBUJGpK3Dm2Z/j9xwl0Pm3Q6rfTDrZPysHusVpKx323OT1UymZ+/R3OpXo8SvN0WaiuT
 Wezp+mi/fQ/CykJxzj/pFQuyw0rgTx48KGZ9QozQk5eWKjJ7lgTnCV+kCHo5a64nRasMWP1VbxoZD
 fNBtgczYQ1EN1CKwBgl00y1EiHveP8dwLrl+YWwg1X9/GNhhoPxhesoKXj1TRs9p8Dtj8UMmPlbtf
 ePU3b7sfU5QNmfENYD8pUT6Jpdg5ejg7MXaJvqmEoR57pfsKnvzPKfLCOnOndtJrQw4QGWB3eDk9M
 MLh61+CA==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sbym0-009J0R-37; Thu, 08 Aug 2024 10:45:28 +0200
Date: Thu, 8 Aug 2024 09:45:26 +0100
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
Message-ID: <ZrSFpj20b1LbBhCJ@linux>
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

A small bunch of fixes for the weekly cycle:

Fix for Meteorlake dual PPS, vma offset calculation and tidy when partial
mapping and unbreaking of eviction handling on DG2 small bar systems. 

Regards,

Tvrtko

drm-intel-fixes-2024-08-08:
- correct dual pps handling for MTL_PCH+ [display] (Dnyaneshwar Bhadane)
- Adjust vma offset for framebuffer mmap offset [gem] (Andi Shyti)
- Fix Virtual Memory mapping boundaries calculation [gem] (Andi Shyti)
- Allow evicting to use the requested placement (David Gow)
- Attempt to get pages without eviction first (David Gow)
The following changes since commit de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed:

  Linux 6.11-rc2 (2024-08-04 13:50:53 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2024-08-08

for you to fetch changes up to 787db3bb6ed5cee56fc97fecdd61517d89763f0a:

  drm/i915: Attempt to get pages without eviction first (2024-08-07 11:02:38 +0300)

----------------------------------------------------------------
- correct dual pps handling for MTL_PCH+ [display] (Dnyaneshwar Bhadane)
- Adjust vma offset for framebuffer mmap offset [gem] (Andi Shyti)
- Fix Virtual Memory mapping boundaries calculation [gem] (Andi Shyti)
- Allow evicting to use the requested placement (David Gow)
- Attempt to get pages without eviction first (David Gow)

----------------------------------------------------------------
Andi Shyti (2):
      drm/i915/gem: Adjust vma offset for framebuffer mmap offset
      drm/i915/gem: Fix Virtual Memory mapping boundaries calculation

David Gow (2):
      drm/i915: Allow evicting to use the requested placement
      drm/i915: Attempt to get pages without eviction first

Dnyaneshwar Bhadane (1):
      drm/i915/display: correct dual pps handling for MTL_PCH+

 drivers/gpu/drm/i915/display/intel_backlight.c |  3 ++
 drivers/gpu/drm/i915/display/intel_pps.c       |  3 ++
 drivers/gpu/drm/i915/gem/i915_gem_mman.c       | 55 +++++++++++++++++++++++---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c        | 13 +++---
 4 files changed, 62 insertions(+), 12 deletions(-)
