Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE915B9DDFB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 09:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD04210E851;
	Thu, 25 Sep 2025 07:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YOs5Vrh4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B446910E851;
 Thu, 25 Sep 2025 07:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bqZvZ/5pdNu/3or+3MgLDWBFcNdLU/hmOe8Vi1ZESlY=; b=YOs5Vrh4e3fzWhff5WtfQvwM8/
 A7rGk7Y2pb81uxpjh5SLHOtbVWYR2f8um8hk+3a4YaPmUNCV4aOlUjYfWFnymUwLV3qRX/JrPUn+0
 b1HueBlf2RLW/OMo7dmg4c3fWCv21/THbjJRgSk/32Iy46YKkUzjq88IL8mrUpieygIOCz+MiN6nB
 ncc4HTV9ZCY75O92XfsGXlFKWhUYjQ2KL3On9zQGFGbdcl/pRdLWQ1DdXP5nxGFksieOV9ePhT3YN
 U5GGR4f12mob9f5+EW0eiLZb86ADs5MjBXBQVTRjl/vn8/SzIcPAQK6iJimYaGYwdessZ+AwhTwfX
 NR2CKrnQ==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v1gYD-00HEyM-Uw; Thu, 25 Sep 2025 09:38:02 +0200
Date: Thu, 25 Sep 2025 08:38:01 +0100
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
Message-ID: <aNTxWfhsMkFZ3Q-a@linux>
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

Two fixes this week: one to handle pwrite on huge buffers correctly and
one to fix DDI transcoder programming.

Tvrtko

drm-intel-fixes-2025-09-25:
- Set O_LARGEFILE in __create_shmem() (Taotao Chen)
- Guard reg_val against a INVALID_TRANSCODER [ddi] (Suraj Kandpal)
The following changes since commit 07e27ad16399afcd693be20211b0dfae63e0615f:

  Linux 6.17-rc7 (2025-09-21 15:08:52 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-09-25

for you to fetch changes up to 7f97a0a871d9532f2e1a5ee7d16d0e364215bcac:

  drm/i915/ddi: Guard reg_val against a INVALID_TRANSCODER (2025-09-23 08:52:18 +0100)

----------------------------------------------------------------
- Set O_LARGEFILE in __create_shmem() (Taotao Chen)
- Guard reg_val against a INVALID_TRANSCODER [ddi] (Suraj Kandpal)

----------------------------------------------------------------
Suraj Kandpal (1):
      drm/i915/ddi: Guard reg_val against a INVALID_TRANSCODER

Taotao Chen (1):
      drm/i915: set O_LARGEFILE in __create_shmem()

 drivers/gpu/drm/i915/display/intel_ddi.c  | 5 +++--
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 7 +++++++
 2 files changed, 10 insertions(+), 2 deletions(-)
