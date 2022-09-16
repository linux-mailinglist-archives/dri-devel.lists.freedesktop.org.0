Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFB25BB11F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 18:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E0E10E4D4;
	Fri, 16 Sep 2022 16:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818B410E4C7;
 Fri, 16 Sep 2022 16:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663346033; x=1694882033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iXmQ3je1QQz+KMzb7zBVEb50RsHdewUaM8xgwvQ8P8s=;
 b=aaLGUePhYDjsrAe+iJZsF+1NcdaB+qczxoCFvj0l1xeABycm3uH1YwTJ
 SdPLtlZH46eizcXM29TNLUeIZEs/LYttHgPNST4B4l9c4s35ogawY+cwV
 FCsJYZcoCJQyjFgQASR7JtdBilj+l8TN6iixAA3XhobHe8/TSxPG0dCiC
 fDI/rSpixN6I7sCDqXBqOHYUvHklsMfVEXzl2kes+Q/rq0AHO/dFCKtqg
 msitSVMpz5wkaioYyKbErF4ASWm3TzGnBmU5yb4Snfag9NpwAvltyueXU
 06LMfwsDFzXj1C7hiI6UCIWF+qD4v8KfvGRWQ+l1d1JIJqGlWZZy8vUri A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="286068363"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="286068363"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 09:33:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="648318623"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga008.jf.intel.com with SMTP; 16 Sep 2022 09:33:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 16 Sep 2022 19:33:48 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915: Make blocking commits lockless
Date: Fri, 16 Sep 2022 19:33:31 +0300
Message-Id: <20220916163331.6849-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220916163331.6849-1-ville.syrjala@linux.intel.com>
References: <20220916163331.6849-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Make blocking commits execute locklessly (just as nonblocking
commits do) by scheduling them onto the workqueues as well.
There will be a later flush_work() done by whoever called
the commit hook to make sure the blocking behaviour of the
ioctl/etc. is preserved.

I also wondered about just dropping the locks straight from the
driver, but I guess whoever called us might still depend on
having the locks so that seems like a terrible idea. Also calling
commit_tail() directly when not holding the locks would then
allow eg. two ioctls to execute full modesets in parallel,
which we don't want as we haven't fully evaluated all modeset
codepaths for concurrency issues. Currently we achieve serial
excution with a combination of an ordered workqueue (for
nonblocking commits) and reliance on the singular connection_mutex
(for blocking commits), and a flush_workqueue() to sync between
the two.

So by always scheduling everything onto the workqueues we
don't have to worry about racing between the lockless direct
commit_tail() calls, and we don't need some kind of new atomic
hook that would do said call for us after dropping the locks.
Also less codepaths in general seems like a beneficial thing.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Jonas Ådahl <jadahl@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index cd617046e0ee..18a5f14e7f41 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7771,15 +7771,10 @@ static int intel_atomic_commit(struct drm_device *dev,
 	INIT_WORK(&state->base.commit_work, intel_atomic_commit_work);
 
 	i915_sw_fence_commit(&state->commit_ready);
-	if (nonblock && state->modeset) {
+	if (state->modeset)
 		queue_work(dev_priv->display.wq.modeset, &state->base.commit_work);
-	} else if (nonblock) {
+	else
 		queue_work(dev_priv->display.wq.flip, &state->base.commit_work);
-	} else {
-		if (state->modeset)
-			flush_workqueue(dev_priv->display.wq.modeset);
-		intel_atomic_commit_tail(state);
-	}
 
 	return 0;
 }
-- 
2.35.1

