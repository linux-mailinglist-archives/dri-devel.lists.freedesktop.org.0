Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95324B2DB9E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 13:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9C010E70D;
	Wed, 20 Aug 2025 11:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="KNgVhKj2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12F910E706;
 Wed, 20 Aug 2025 11:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EGFsNLHAsnVFOAb8wxUB9Ah1uS/MIIzpoJNPDy82FGw=; b=KNgVhKj2sJBEjUNiZi3AbjVjs4
 j2M3etmjtylxJsMNhVhekxj2coRL2FZGtg9LVLNJ5VJAZf5JUrqVTf6l+MYZe67As1BfVuHG5m7Kf
 30tDlex2XpKhm4AAdPTcoU7nfsQxllZ8bpH/2S3sAX5SBkl7UXpnFdWtfPIIdvNREomzyjAMEqevj
 lZcewZ1FIREfXleLPjL+Q5o69tJOYtelHi745P7nB1612Ox/mooDtA83ke4oPIO/b2/ARzMcG8E2L
 7c8aVcExj2OJLw4ezwxeAZy+LJmjsvbDBisKNBPx2GiQjE0CbLl1zhNPudmGmU9KUYeuJaVcUp5ql
 OlUCBGTQ==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uohJ1-00GkrG-0U; Wed, 20 Aug 2025 13:48:39 +0200
Date: Wed, 20 Aug 2025 12:48:38 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
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
Message-ID: <aKW2CAy37usxTrzn@linux>
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

A few fixes for the release candidate cycle: Assorted TypeC DP fixes for
Lunarlake, one wakeref splat regression fix and one JSL/EHL workaround
relocated to the proper application stage. 

Regards,

Tvrtko

drm-intel-fixes-2025-08-20:
- TypeC DP display Fixes [lnl] (Imre Deak)
- Silence rpm wakeref asserts on GEN11_GU_MISC_IIR access (Jani Nikula)
- Relocate compression repacking WA for JSL/EHL [gt] (Sebastian Brzezinka)
The following changes since commit c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9:

  Linux 6.17-rc2 (2025-08-17 15:22:10 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-08-20

for you to fetch changes up to 8236820fd767f400d1baefb71bc7e36e37730a1e:

  drm/i915/gt: Relocate compression repacking WA for JSL/EHL (2025-08-19 07:42:22 +0100)

----------------------------------------------------------------
- TypeC DP display Fixes [lnl] (Imre Deak)
- Silence rpm wakeref asserts on GEN11_GU_MISC_IIR access (Jani Nikula)
- Relocate compression repacking WA for JSL/EHL [gt] (Sebastian Brzezinka)

----------------------------------------------------------------
Imre Deak (5):
      drm/i915/lnl+/tc: Fix handling of an enabled/disconnected dp-alt sink
      drm/i915/icl+/tc: Cache the max lane count value
      drm/i915/lnl+/tc: Fix max lane count HW readout
      drm/i915/lnl+/tc: Use the cached max lane count value
      drm/i915/icl+/tc: Convert AUX powered WARN to a debug message

Jani Nikula (1):
      drm/i915: silence rpm wakeref asserts on GEN11_GU_MISC_IIR access

Sebastian Brzezinka (1):
      drm/i915/gt: Relocate compression repacking WA for JSL/EHL

 drivers/gpu/drm/i915/display/intel_display_irq.c |  4 +
 drivers/gpu/drm/i915/display/intel_tc.c          | 93 +++++++++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_workarounds.c      | 20 ++---
 3 files changed, 90 insertions(+), 27 deletions(-)
