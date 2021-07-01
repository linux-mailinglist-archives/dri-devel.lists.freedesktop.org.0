Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 527583B8F42
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 10:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF396E9CD;
	Thu,  1 Jul 2021 08:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147BF6E9B8;
 Thu,  1 Jul 2021 08:58:42 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B18032280B;
 Thu,  1 Jul 2021 08:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625129920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=urLiXdGIFB0VbfPPeiXzovAJssRFSbimqsTbtdqy6bY=;
 b=kqIa0bQJ2w7mZLYfF/gw2tI4UdTZ0MJsy909Jc6pHhPgpL9/cWNofemhVW/lAHTd9pZtdU
 HoHVQvlhXIpknlwbKs/Fn39eu+2Bi5lxF0xFG7IFaOyN1sr2vP1vsPadVnfnzdulp9NuUr
 FCo+2qc4Cmy/xZcdM1ltGASn0Rxolqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625129920;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=urLiXdGIFB0VbfPPeiXzovAJssRFSbimqsTbtdqy6bY=;
 b=faIVJ/R0D78KSmQrk2pjzuChLwwXeFRWqWohheD7hT5ixzjs/hWDZ7CnQu9698lbm+0STs
 +xGRwSH5a3rNkuAw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 626D511CC0;
 Thu,  1 Jul 2021 08:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625129920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=urLiXdGIFB0VbfPPeiXzovAJssRFSbimqsTbtdqy6bY=;
 b=kqIa0bQJ2w7mZLYfF/gw2tI4UdTZ0MJsy909Jc6pHhPgpL9/cWNofemhVW/lAHTd9pZtdU
 HoHVQvlhXIpknlwbKs/Fn39eu+2Bi5lxF0xFG7IFaOyN1sr2vP1vsPadVnfnzdulp9NuUr
 FCo+2qc4Cmy/xZcdM1ltGASn0Rxolqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625129920;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=urLiXdGIFB0VbfPPeiXzovAJssRFSbimqsTbtdqy6bY=;
 b=faIVJ/R0D78KSmQrk2pjzuChLwwXeFRWqWohheD7hT5ixzjs/hWDZ7CnQu9698lbm+0STs
 +xGRwSH5a3rNkuAw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id yIg4F8CD3WA0IgAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 01 Jul 2021 08:58:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 chris@chris-wilson.co.uk, mika.kuoppala@linux.intel.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 lucas.demarchi@intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH v4 1/2] drm/i915: Use the correct IRQ during resume
Date: Thu,  1 Jul 2021 10:58:32 +0200
Message-Id: <20210701085833.26566-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701085833.26566-1-tzimmermann@suse.de>
References: <20210701085833.26566-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code in xcs_resume() probably didn't work as intended. It uses
struct drm_device.irq, which is allocated to 0, but never initialized
by i915 to the device's interrupt number.

Change all calls to synchronize_hardirq() to intel_synchronize_irq(),
which uses the correct interrupt. _hardirq() functions are not needed
in this context.

v4:
	* switch everything to intel_synchronize_irq() (Daniel)
v3:
	* also use intel_synchronize_hardirq() at another callsite
v2:
	* wrap irq code in intel_synchronize_hardirq() (Ville)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 536f77b1caa0 ("drm/i915/gt: Call stop_ring() from ring resume, again")
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c       | 2 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 88694822716a..8a2a54d2d739 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1229,7 +1229,7 @@ bool intel_engine_is_idle(struct intel_engine_cs *engine)
 		return true;
 
 	/* Waiting to drain ELSP? */
-	synchronize_hardirq(to_pci_dev(engine->i915->drm.dev)->irq);
+	intel_synchronize_irq(engine->i915);
 	intel_engine_flush_submission(engine);
 
 	/* ELSP is empty, but there are ready requests? E.g. after reset */
diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index 5d42a12ef3d6..d50b515b0c55 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -185,7 +185,7 @@ static int xcs_resume(struct intel_engine_cs *engine)
 		     ring->head, ring->tail);
 
 	/* Double check the ring is empty & disabled before we resume */
-	synchronize_hardirq(engine->i915->drm.irq);
+	intel_synchronize_irq(engine->i915);
 	if (!stop_ring(engine))
 		goto err;
 
-- 
2.32.0

