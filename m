Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410269ED45B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 19:04:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9947D10EBE6;
	Wed, 11 Dec 2024 18:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="AF9i8gno";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB8910EBE3;
 Wed, 11 Dec 2024 18:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mSkjN2oOpv7jPaY0oL6AlL4KmU2vGmok0JKQm2GM5UA=; b=AF9i8gnoezdKo0lEfcFt7zIqKB
 7J2n2bzle/Wqqv5Tfy7zfg8RARSP3w5RWK95a1sniCsSruRyXNJYNJ7fx31auIBcqoBG2fVCrPCam
 fgSQsksVYp42QQ1NNmKqq/wqEcf+DthodMZE5OC4A3Rbg+ArNzgixRfnl0NpubFTMJST17Y5iRa4n
 6G1elo6W4O1HmUW6N0WYzvbYN4rkGQzu0mhhOTh7cxMLWFcXv36Wk0c9p1mjccJMj10xzzX5bm/0p
 j/renxhAlHZQygZFbCRwIrRijcfjoS5ugh1+doPwmINW9D+CnjcwT1IMNvu2ijVthtc6Ukn/w7Uoi
 M7BTxKIA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tLR4X-0022VR-FL; Wed, 11 Dec 2024 19:04:29 +0100
Date: Wed, 11 Dec 2024 18:04:28 +0000
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
Message-ID: <Z1nULMrutE4HERvB@linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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


Hi Dave, Sima,

A handful of fixes for the weekly release candidate cycle:

One fix for a performance regression in DSB register programming and also
in the same area a partial fix for the legacy LUT and DSB interaction.
Then there is a fix for a null pointer dereference in the GuC error state
capture code. Finally a fix for a memory leak in cases when driver fails
to load.

Tvrtko

drm-intel-fixes-2024-12-11:
- Don't use indexed register writes needlessly [dsb] (Ville Syrjälä)
- Stop using non-posted DSB writes for legacy LUT [color] (Ville Syrjälä)
- Fix NULL pointer dereference in capture_engine (Eugene Kobyak)
- Fix memory leak by correcting cache object name in error handler (Jiasheng Jiang)
The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2024-12-11

for you to fetch changes up to 2828e5808bcd5aae7fdcd169cac1efa2701fa2dd:

  drm/i915: Fix memory leak by correcting cache object name in error handler (2024-12-09 10:29:06 +0000)

----------------------------------------------------------------
- Don't use indexed register writes needlessly [dsb] (Ville Syrjälä)
- Stop using non-posted DSB writes for legacy LUT [color] (Ville Syrjälä)
- Fix NULL pointer dereference in capture_engine (Eugene Kobyak)
- Fix memory leak by correcting cache object name in error handler (Jiasheng Jiang)

----------------------------------------------------------------
Eugene Kobyak (1):
      drm/i915: Fix NULL pointer dereference in capture_engine

Jiasheng Jiang (1):
      drm/i915: Fix memory leak by correcting cache object name in error handler

Ville Syrjälä (2):
      drm/i915/dsb: Don't use indexed register writes needlessly
      drm/i915/color: Stop using non-posted DSB writes for legacy LUT

 drivers/gpu/drm/i915/display/intel_color.c | 81 +++++++++++++++++++-----------
 drivers/gpu/drm/i915/display/intel_dsb.c   | 19 +++++--
 drivers/gpu/drm/i915/display/intel_dsb.h   |  2 +
 drivers/gpu/drm/i915/i915_gpu_error.c      | 18 +++++--
 drivers/gpu/drm/i915/i915_scheduler.c      |  2 +-
 5 files changed, 85 insertions(+), 37 deletions(-)
