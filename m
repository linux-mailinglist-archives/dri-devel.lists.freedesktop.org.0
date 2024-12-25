Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0029FC576
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 14:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CFF10E263;
	Wed, 25 Dec 2024 13:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kD1POdDe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5423410E087;
 Wed, 25 Dec 2024 13:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2g/sEa5I0ZzWmLPNsEhBpmG1KTu4g+IUPNbDCdnvnuA=; b=kD1POdDekk/oQh8kVHF2dASQpb
 OcVqzH2daG8DTVEc1yKENWFjS1XadnXAnBbptfqmqb1wizp7YpRQx98djot/2xLwHn51mHACgv5he
 pbGFfLpYBXBx0zOjtDpALOdgsftnrNpXVxPgp3dIUjH3IHXaOAMtXpvBjQjVgsh/MvK7cAmwkiXBP
 yUColyt9eP2+4wlQMixlUActNe+lNQ0dAFescBg7Cat5hQZghy4UApFx1XNn1gBp9tsJWX7Fsid5v
 ctOPpa1EC8bAXFf0aN/jKUbQNUqMIISefTxixrMTQhCObc3dCVSQT/XaSn4T/hVgy13m84vxnrvjk
 1USNxCHw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tQRZR-007WMF-5b; Wed, 25 Dec 2024 14:37:05 +0100
Date: Wed, 25 Dec 2024 13:37:03 +0000
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
Message-ID: <Z2wKf7tmElKFdnoP@linux>
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

Two fixes for the next -rc window.

One is display programming sequence fix for Meteorlake and second fixes
video decode hangs on DG1 due incorrect power gate programming.

Regards,

Tvrtko

drm-intel-fixes-2024-12-25:
- Fix C10 pll programming sequence [cx0_phy] (Suraj Kandpal)
- Fix power gate sequence. [dg1] (Rodrigo Vivi)
The following changes since commit 4bbf9020becbfd8fc2c3da790855b7042fad455b:

  Linux 6.13-rc4 (2024-12-22 13:22:21 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2024-12-25

for you to fetch changes up to 20e7c5313ffbf11c34a46395345677adbe890bee:

  drm/i915/dg1: Fix power gate sequence. (2024-12-24 09:41:03 +0000)

----------------------------------------------------------------
- Fix C10 pll programming sequence [cx0_phy] (Suraj Kandpal)
- Fix power gate sequence. [dg1] (Rodrigo Vivi)

----------------------------------------------------------------
Rodrigo Vivi (1):
      drm/i915/dg1: Fix power gate sequence.

Suraj Kandpal (1):
      drm/i915/cx0_phy: Fix C10 pll programming sequence

 drivers/gpu/drm/i915/display/intel_cx0_phy.c | 12 ++++--------
 drivers/gpu/drm/i915/gt/intel_rc6.c          |  2 +-
 2 files changed, 5 insertions(+), 9 deletions(-)
