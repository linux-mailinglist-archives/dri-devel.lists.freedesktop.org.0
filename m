Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122BA9270AA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 09:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775C910EA03;
	Thu,  4 Jul 2024 07:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="h6TE/13x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5BE10E9FA;
 Thu,  4 Jul 2024 07:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tXOITrb8w/ZiO/TlNQLwdmyzolg0O/2dDCq+hXUIP5k=; b=h6TE/13xvaloTR5oRUuBs3RauS
 hYjh5drWDPsh4lukTCSwwF89HFOCjpymTga2D7SmPcXKdjip1EDXB7JQ7wDAAQPqZs3xvoCpXuUf0
 CGkIAFKwLixu/oOYdFnnfNHSxGsxbd8QU8ti9Gvj4UavVmiDDFm7ESlyEf1Cx34V7q2l5QRZ7cTEU
 dhEYY0cEeGyyA5zrPGEddhT5VnjIl/OU9p9xAxzA2EphCbQ6C5f2TYiZ4umR6WHkBERokpMtfM9He
 kkVPWFrqKY6ixjIUv4Q+p6QkfACdjP4k/rf6kHWZjkhmv7Io/BL+v7p5+JRnMI14fto4RXoO2HdFx
 OaRiN6+A==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sPGwd-00B0jx-IJ; Thu, 04 Jul 2024 09:31:55 +0200
Date: Thu, 4 Jul 2024 07:31:54 +0000
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
Subject: [PULL] drm-intel-gt-next
Message-ID: <ZoZP6mUSergfzFMh@linux>
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

The final pull for 6.11 is quite small and only contains a handful of
fixes in areas such as stolen memory probing on ATS-M, GuC priority
handling, out of memory reporting noise downgrade and fence register
hanlding race condition reported by CI.

Regards,

Tvrtko

drm-intel-gt-next-2024-07-04:
Driver Changes:

Fixes/improvements/new stuff:

- Downgrade stolen lmem setup warning [gem] (Jonathan Cavitt)
- Evaluate GuC priority within locks [gt/uc] (Andi Shyti)
- Fix potential UAF by revoke of fence registers [gt] (Janusz Krzysztofik)
- Return NULL instead of '0' [gem] (Andi Shyti)
- Use the correct format specifier for resource_size_t [gem] (Andi Shyti)
- Suppress oom warning in favour of ENOMEM to userspace [gem] (Nirmoy Das)

Miscellaneous:

- Evaluate forcewake usage within locks [gt] (Andi Shyti)
- Fix typo in comment [gt/uc] (Andi Shyti)
The following changes since commit 79655e867ad6dfde2734c67c7704c0dd5bf1e777:

  drm/i915/mtl: Update workaround 14018575942 (2024-06-11 16:06:20 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-gt-next-2024-07-04

for you to fetch changes up to 3b85152cb167bd24fe84ceb91b719b5904ca354f:

  drm/i915/gem: Suppress oom warning in favour of ENOMEM to userspace (2024-06-28 00:11:01 +0200)

----------------------------------------------------------------
Driver Changes:

Fixes/improvements/new stuff:

- Downgrade stolen lmem setup warning [gem] (Jonathan Cavitt)
- Evaluate GuC priority within locks [gt/uc] (Andi Shyti)
- Fix potential UAF by revoke of fence registers [gt] (Janusz Krzysztofik)
- Return NULL instead of '0' [gem] (Andi Shyti)
- Use the correct format specifier for resource_size_t [gem] (Andi Shyti)
- Suppress oom warning in favour of ENOMEM to userspace [gem] (Nirmoy Das)

Miscellaneous:

- Evaluate forcewake usage within locks [gt] (Andi Shyti)
- Fix typo in comment [gt/uc] (Andi Shyti)

----------------------------------------------------------------
Andi Shyti (5):
      drm/i915/gt: debugfs: Evaluate forcewake usage within locks
      drm/i915/gt/uc: Fix typo in comment
      drm/i915/gt/uc: Evaluate GuC priority within locks
      drm/i915/gem: Return NULL instead of '0'
      drm/i915/gem: Use the correct format specifier for resource_size_t

Janusz Krzysztofik (1):
      drm/i915/gt: Fix potential UAF by revoke of fence registers

Jonathan Cavitt (1):
      drm/i915/gem: Downgrade stolen lmem setup warning

Nirmoy Das (1):
      drm/i915/gem: Suppress oom warning in favour of ENOMEM to userspace

 drivers/gpu/drm/i915/gem/i915_gem_stolen.c        |  8 +++++--
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c      |  1 +
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c     |  4 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h       |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 27 ++++++++++++++---------
 drivers/gpu/drm/i915/i915_scatterlist.c           |  8 +++----
 6 files changed, 32 insertions(+), 18 deletions(-)
