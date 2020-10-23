Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E66296EBB
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4F26E51B;
	Fri, 23 Oct 2020 12:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028656E517
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 12:22:41 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d3so1293264wma.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 05:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bzJDwk0UaarTjwek7p43Z5eixveGA653vMI0wrr+vtQ=;
 b=O7XtUKdUBPSf9TjLYloRodYjrCetvjKcziZsGwqdmp+Blvk1kTPVSzDdF53/vbY41S
 rGw2KSNwfdBQw6B+naDwbPdKVdsKnqJsdN3WRk468+ZCIfcysezqIDmR/VSH+MjvDNPk
 Da7owdM++heskVUNzJscqLKTBxQj80xXMID7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bzJDwk0UaarTjwek7p43Z5eixveGA653vMI0wrr+vtQ=;
 b=Prm/6BI7GKK7GtnLM7Q6DE/KOeOvtAJjAY0lvEkK5OWyShWZpjfOGVVJax8g3ri7Xw
 pTua/B9PU/NpurPfEDJWGug9v5TlIut8Yj9fj1f7CxLTIuuefiZnstwWfvTwIVBiiX4E
 o/R+8+/hCctLXb+FhxjxW+fs4MsjS+LlEQw4VA6Km3T6qydp8HulwDOsKWS5mRKl/yDG
 NdKbEhpgcvjmEgKGqdIPF8wmmeB1BN8DGffDHXl0FPMhZ/17wPLQYMHxP+qfQA3TQcq1
 gFk7f23i9XwWYRGddvO+GAgkuGltw9a/Cm4MU1uQ3NyqCRe/D58o6xX2TPzRHWElJnwk
 l4mQ==
X-Gm-Message-State: AOAM530mWupFo+KlhJhYrv0ymHd+1vGvNMvIuAN8nolWGlJ9waWJg3gK
 03RZI7Ag3Dohzy2uhRJnkZyJfjq7wiXuhKkd
X-Google-Smtp-Source: ABdhPJyDkgbwbjJTuMMSi0+tdHz3l1gq3xGatm+DQh9W5oe3VMttDmbcRcQlKZBYRGpdXsMMICyaRw==
X-Received: by 2002:a7b:cb8c:: with SMTP id m12mr2175657wmi.12.1603455759419; 
 Fri, 23 Oct 2020 05:22:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:22:38 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 15/65] drm/tegra: Annotate dma-fence critical section in
 commit path
Date: Fri, 23 Oct 2020 14:21:26 +0200
Message-Id: <20201023122216.2373294-15-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Again ends just after drm_atomic_helper_commit_hw_done(), but with the
twist that we need to make sure we're only annotate the custom
version. And not the other clause which just calls
drm_atomic_helper_commit_tail_rpm(), which is already annotated.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/drm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index f0f581cd345e..24f353c1cee8 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -65,11 +65,14 @@ static void tegra_atomic_commit_tail(struct drm_atomic_state *old_state)
 	struct tegra_drm *tegra = drm->dev_private;
 
 	if (tegra->hub) {
+		bool fence_cookie = dma_fence_begin_signalling();
+
 		drm_atomic_helper_commit_modeset_disables(drm, old_state);
 		tegra_display_hub_atomic_commit(drm, old_state);
 		drm_atomic_helper_commit_planes(drm, old_state, 0);
 		drm_atomic_helper_commit_modeset_enables(drm, old_state);
 		drm_atomic_helper_commit_hw_done(old_state);
+		dma_fence_end_signalling(fence_cookie);
 		drm_atomic_helper_wait_for_vblanks(drm, old_state);
 		drm_atomic_helper_cleanup_planes(drm, old_state);
 	} else {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
