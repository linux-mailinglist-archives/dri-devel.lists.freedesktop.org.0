Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4019EAC4A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 10:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75A910E85B;
	Tue, 10 Dec 2024 09:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Qz91GMhp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3372510E864
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 09:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733823389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8GEvw5QpbRp0f45cMt+HrV/NNA4rCDC5F+CWhNaj1U4=;
 b=Qz91GMhphIHGDw3tAVQmZFwWj7+DseJviEfoykAJTuY/NZEFaC0za7zKNexfymhILBsLWp
 jReTF/6YEgsvtZgStnodo85DQWvesuNCaCer06CPwPfGpjqyPfqL5TU+4U/49yYU3B+sy6
 WzWxSNEzyHYk7VVnVOelPszmhMzonHc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-553-TP-uYSDmMgmG4UJdPcH1ZQ-1; Tue,
 10 Dec 2024 04:36:26 -0500
X-MC-Unique: TP-uYSDmMgmG4UJdPcH1ZQ-1
X-Mimecast-MFC-AGG-ID: TP-uYSDmMgmG4UJdPcH1ZQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 38131195C258; Tue, 10 Dec 2024 09:36:24 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.39])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AAF411956089; Tue, 10 Dec 2024 09:36:20 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [RFC PATCH v3 0/6] drm/i915: Add drm_panic support
Date: Tue, 10 Dec 2024 10:28:40 +0100
Message-ID: <20241210093505.589893-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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

This is a draft of drm_panic support for i915.

I've tested it on the 3 intel laptops I have at my disposal.
one Haswell with 128MB of eDRAM, one Cometlake and one Alderlake.

I tested panic in both fbdev console and gnome desktop.

Best regards,

v2:
 * Add the proper abstractions to build also for Xe.
 * Fix dim checkpatch issues.

v3:
 * Add support for Y-tiled framebuffer when DPT is enabled.

Jocelyn Falempe (6):
  drm/i915/fbdev: Add intel_fbdev_get_vaddr()
  drm/i915/display/i9xx: Add a disable_tiling() for i9xx planes
  drm/i915/display: Add a disable_tiling() for skl planes
  drm/i915/gem: Add i915_gem_object_panic_map()
  drm/i915: Add drm_panic support
  drm/i915: Add drm_panic support for Y-tiling with DPT

 drivers/gpu/drm/i915/display/i9xx_plane.c     |  23 +++
 .../gpu/drm/i915/display/intel_atomic_plane.c | 147 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_bo.c       |  10 ++
 drivers/gpu/drm/i915/display/intel_bo.h       |   2 +
 .../drm/i915/display/intel_display_types.h    |   2 +
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |   5 +
 drivers/gpu/drm/i915/display/intel_fb_pin.h   |   1 +
 drivers/gpu/drm/i915/display/intel_fbdev.c    |   5 +
 drivers/gpu/drm/i915/display/intel_fbdev.h    |   6 +
 .../drm/i915/display/skl_universal_plane.c    |  27 ++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  25 +++
 drivers/gpu/drm/i915/i915_vma.h               |   5 +
 drivers/gpu/drm/xe/display/intel_bo.c         |  11 ++
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   5 +
 15 files changed, 275 insertions(+), 1 deletion(-)


base-commit: 919b1458ccfd33ead891fa4ad1e1d06016f5a20c
-- 
2.47.1

