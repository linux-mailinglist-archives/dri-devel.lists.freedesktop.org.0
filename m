Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 009123C1878
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 19:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423B66E974;
	Thu,  8 Jul 2021 17:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C226E973
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 17:38:24 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d12so7915899wre.13
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 10:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=InVnPLy1h+Gn4xVBn/fC7AZt6grH88jqC7oOozTIXb8=;
 b=b9NfiRDV4PWMagsuaIW/0pNvT/uy7ZDQf5JndjvR8JML4iEvYQWZQL7cwk7QnkWdah
 oBfpqwwuzxFNgBz0aEff+3SB9zAzKpnDR1DMFi43W07iORhzR0ARnRNGrCQ3kjPtlJLd
 IJh73WUh20UIq5aO+hBu1ga1TfA/5tOncbrXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=InVnPLy1h+Gn4xVBn/fC7AZt6grH88jqC7oOozTIXb8=;
 b=dk/0j6qlv3jErLnBs0kyi8kXoZRBwP4pmI/kfIDQjtAKyDtlI2gLKuYTdg9iOWHSrv
 A4PqY567C3V6Xk3kBjnStzkNqcI8Lsu+WO03EBU2wNAQbvsTDCUEp7KzDtZLworM2A6t
 yrk6MbYRY5SN6WQ9NY0kf8TytaWxKbVikq5VN1IhN7JU7W37lFIoLXFZ905+/aXDZPHw
 KDjEiwZNkwC8clWaqDkAJbchfA3PTBzKK6Qrd7lBbGdGsb8msWgWBL9VT0eTWk1r/aiJ
 wQ7Nc+kySNECPv0b5UM6HEa0cn2O40DngSf+KvjhRk0oAooVTaEY9f/29ix8O5LyDhse
 pHtg==
X-Gm-Message-State: AOAM533n4YYwG5n0sZp6IkDYhW0YIoucoYWCplTTMz0ZycEqPfbGtfWA
 7oR/OIuzLXc4FrCwCKYCv6qbgXUBHXqy7w==
X-Google-Smtp-Source: ABdhPJxD6PJ66owVmAWX8E6gbp7rigz0P4Z2yONzVbgd61fH6Zjzia6NQcSAsJ1vQHjng6a+fpD+Dw==
X-Received: by 2002:a5d:4912:: with SMTP id x18mr4269311wrq.310.1625765903128; 
 Thu, 08 Jul 2021 10:38:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l4sm2521853wme.26.2021.07.08.10.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 10:38:22 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 15/20] drm/msm: Don't break exclusive fence ordering
Date: Thu,  8 Jul 2021 19:37:49 +0200
Message-Id: <20210708173754.3877540-16-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's only one exclusive slot, and we must not break the ordering.

Adding a new exclusive fence drops all previous fences from the
dma_resv. To avoid violating the signalling order we err on the side of
over-synchronizing by waiting for the existing fences, even if
userspace asked us to ignore them.

A better fix would be to us a dma_fence_chain or _array like e.g.
amdgpu now uses, but
- msm has a synchronous dma_fence_wait for anything from another
  context, so doesn't seem to care much,
- and it probably makes sense to lift this into dma-resv.c code as a
  proper concept, so that drivers don't have to hack up their own
  solution each on their own.

v2: Improve commit message per Lucas' suggestion.

Cc: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index b71da71a3dd8..edd0051d849f 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -306,7 +306,8 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 				return ret;
 		}
 
-		if (no_implicit)
+		/* exclusive fences must be ordered */
+		if (no_implicit && !write)
 			continue;
 
 		ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
-- 
2.32.0

