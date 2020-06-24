Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C69D209A83
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 09:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4726E48E;
	Thu, 25 Jun 2020 07:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374F96E3F0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 18:25:40 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t194so3452720wmt.4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 11:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sYP1GfIWT9mnOqD2KmD7nELq2s4qVdFagSVzTw6qepw=;
 b=q5wFcuh2y8QPKSAAmzKOjbCEHoJQXHGjEBXa9hAVSeqOwicEZVggW6flUWfDny253n
 hy5RTRQ9ZCtLQ4fB/CWRrai5ftl+ofaQu3GlymNwDLtccR5iz8KvUhqae8AIquOdrxTW
 +Gd6S6u06Hd0vsoQJpzM6eYNhowsYwGnpr0B9xVTymZ9uJyQ1lt+nxKurR4nZ/oEwn1G
 l94vx/E5hSNO/JwxoRTuXAnQbfxgkSEyIZJ1K4/o7wnl4ao63LYQzWhgvghic7IIqj8u
 86VpXy8ZEvVlNIDPYUVVuQa6fge5tB5MN89TP58lv+0svrIeFyYXcJDyQN01y5aFhWRz
 4g3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sYP1GfIWT9mnOqD2KmD7nELq2s4qVdFagSVzTw6qepw=;
 b=M+RPSQwI5Wby2ZmaJE9P3lQVSfatL1XnPjJd3XcFHcxatf8wDbN7+3dBPy8szmLsdh
 H0NTxPTMKyIry9QS29JmQMk34Sw+vF63BFJGjnWjraMIqRCQZfo9JCcIWwADsVUyVr2e
 gQxjz4GMxjiGFfS5mLgF2VuA7abkszGshJMUZtvkpOglZvEuqpW4vSq9GTpFYiVxFrVk
 fRUbAmHn/oD+vqQcKaaLlDspH72JXyaiZKED+20h+TYPV9PVP1oCkuj1OiuUZ7HZTqVd
 aUqm96lim//e35N4pIffjrHb/+u+vp1Vjy6H3JEicqjw/aYe8Vh/54Tcd9RnG6EL1r1h
 qBpA==
X-Gm-Message-State: AOAM530MRYGOKNrgHub8GT9GrhcTifQ2p6YCs6+8yKddbzfO+83Hqvep
 jEYcqzYfcyRJz7ZPPA+WbS9JB954WfIFqTsH
X-Google-Smtp-Source: ABdhPJzWb7KrhlvzjZMHv/gM2ojMIUEHl8XxgQVpJ462WkBka4k2mxsBfxgRSevuv9rpPAOCaxRE/A==
X-Received: by 2002:a1c:2e58:: with SMTP id u85mr30677768wmu.123.1593023138530; 
 Wed, 24 Jun 2020 11:25:38 -0700 (PDT)
Received: from brihaspati.fritz.box (pd9567914.dip0.t-ipconnect.de.
 [217.86.121.20])
 by smtp.gmail.com with ESMTPSA id a22sm8734086wmb.4.2020.06.24.11.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 11:25:37 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/8] drm/bochs: use drm_gem_vram_offset to get bo offset v2
Date: Wed, 24 Jun 2020 20:26:47 +0200
Message-Id: <20200624182648.6976-8-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200624182648.6976-1-nirmoy.das@amd.com>
References: <20200624182648.6976-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 25 Jun 2020 07:31:01 +0000
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
Cc: sashal@kernel.org, thellstrom@vmware.com, airlied@linux.ie,
 kenny.ho@amd.com, brian.welty@intel.com, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>, alexander.deucher@amd.com,
 sean@poorly.run, christian.koenig@amd.com, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch over to GEM VRAM's implementation to retrieve bo->offset.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/bochs/bochs_kms.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
index 05d8373888e8..853081d186d5 100644
--- a/drivers/gpu/drm/bochs/bochs_kms.c
+++ b/drivers/gpu/drm/bochs/bochs_kms.c
@@ -29,16 +29,21 @@ static void bochs_plane_update(struct bochs_device *bochs,
 			       struct drm_plane_state *state)
 {
 	struct drm_gem_vram_object *gbo;
+	s64 gpu_addr;
 
 	if (!state->fb || !bochs->stride)
 		return;
 
 	gbo = drm_gem_vram_of_gem(state->fb->obj[0]);
+	gpu_addr = drm_gem_vram_offset(gbo);
+	if (WARN_ON_ONCE(gpu_addr < 0))
+		return; /* Bug: we didn't pin the BO to VRAM in prepare_fb. */
+
 	bochs_hw_setbase(bochs,
 			 state->crtc_x,
 			 state->crtc_y,
 			 state->fb->pitches[0],
-			 state->fb->offsets[0] + gbo->bo.offset);
+			 state->fb->offsets[0] + gpu_addr);
 	bochs_hw_setformat(bochs, state->fb->format);
 }
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
