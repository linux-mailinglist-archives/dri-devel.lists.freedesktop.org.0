Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F6C93BD46
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 09:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2D410E23F;
	Thu, 25 Jul 2024 07:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="l6K5Anap";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A46A10E13E;
 Thu, 25 Jul 2024 07:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3amSF8I19BHTxTB8T37Iz1NyyDj9scSeBCJHngA2vGs=; b=l6K5AnapJfPGf2h71KGS+mm6K/
 cXQHa/m3eVmUcTF+Lpb8gwKUPDztmIk5jzmGVhIbco8IkoaRN5TF7463bSkSuSJgmqAVh/yT8o/uW
 /H/s+GzrN+ztdAYPLMd7OC+DX5OpNgyxZIt1kTMQIyMCv65e+OPvQW+9C8EfZ5b4IqGSxBaBbzZcx
 PriLh4gVl/WYBj6/KPMJoreQZz18YmLeCg34EiDUxOoz/+hR7dO2lN9FjJaFIPHZFN8y9dtFXo60c
 NtDubj4UimetNE+7v3Bhl9kYXr7fBOxa6M1ib27ETwSGPuAvlqEG17yuO5cyJWXQlwDqoThdzbVmm
 D1oWtEyQ==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sWt9E-001or2-6R; Thu, 25 Jul 2024 09:44:24 +0200
Date: Thu, 25 Jul 2024 08:44:23 +0100
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
Subject: [PULL] drm-intel-next-fixes
Message-ID: <ZqICQzyzm/6hDWy4@linux>
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

Two fixes for the merge window - turning off preemption on Gen8 since it
apparently just doesn't work reliably enough and a fix for potential NULL
pointer dereference when stolen memory probing failed.

Regards,

Tvrtko

drm-intel-next-fixes-2024-07-25:
- Do not consider preemption during execlists_dequeue for gen8 [gt] (Nitin Gote)
- Allow NULL memory region (Jonathan Cavitt)
The following changes since commit 509580fad7323b6a5da27e8365cd488f3b57210e:

  drm/i915/dp: Don't switch the LTTPR mode on an active link (2024-07-16 08:14:29 +0000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-fixes-2024-07-25

for you to fetch changes up to 26720dd2b5a1d088bff8f7e6355fca021c83718f:

  drm/i915: Allow NULL memory region (2024-07-23 09:34:13 +0000)

----------------------------------------------------------------
- Do not consider preemption during execlists_dequeue for gen8 [gt] (Nitin Gote)
- Allow NULL memory region (Jonathan Cavitt)

----------------------------------------------------------------
Jonathan Cavitt (1):
      drm/i915: Allow NULL memory region

Nitin Gote (1):
      drm/i915/gt: Do not consider preemption during execlists_dequeue for gen8

 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 6 +-----
 drivers/gpu/drm/i915/intel_memory_region.c           | 6 ++++--
 2 files changed, 5 insertions(+), 7 deletions(-)
