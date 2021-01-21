Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 354872FEEBA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 16:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7976E90B;
	Thu, 21 Jan 2021 15:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9516E908
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 15:30:16 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d16so1477005wro.11
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 07:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x+uDI94Qw4eCyYW0v0o9rlbjS7vCzG2/PuZcRGrnOYM=;
 b=JMy1rlperfiiscGLWeNqMi0dYx5oz6fG5yEKEXH+EWYyjX4VIcWByZo1P6mlxYetyN
 bk3fWUbXiaH38xoRtQuyJdCKLwX5Z937hxtNAkJ3SN3wm51/Q+E9yj7J9nXL+kib/87z
 vmCq/z2AOQKEi7FKmbQLTPrfjN1DvwhyHITrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+uDI94Qw4eCyYW0v0o9rlbjS7vCzG2/PuZcRGrnOYM=;
 b=Ms53bbJmq1vklAoX5goDj5pCrAJX4HknKCgDS+RXT2O4/LZLiE8rHxAGvtuU3DFarX
 mdOvUnZ9QPAYCu+8p9GGL0XP/jLv3V6aJm/HGkL2ipb9TmSKgMrjHxOb9wZvHMJyMF2T
 44sUCCexOo0FzNpwZFZC1f0JGF78qoUw0R5VL5ZChRqC7yMI7Mn3K8RMcaoDk+8pcz10
 zKaRiV3gv8S1+pqJbvc/witOsyarEkgBjgwNbBrgbQ2WUVScR22VO/ySfYiJVvAc1zR2
 WSQVJfWsD/PnjhI1wD6z0CRgEg+s3oYrnhYPcfNeheid5P+ZtWndN6AuU9qX2SEOaPdS
 Qn7A==
X-Gm-Message-State: AOAM533KB1L1B7FvWqWYQ5FkQR4OMvZ6ROsaNsvheHuIIXIe+siTzUBM
 nZKUz8dUT7VId/KLgvCrXPdH4GN+JQY5Ia0S
X-Google-Smtp-Source: ABdhPJwbrDgcMH/A2JeA///UqHgkhJo/iRlMZPM0Ih6GMosNi0SIkfMyiUc+Tj+iCg8P0W0XpbPNHQ==
X-Received: by 2002:a5d:660c:: with SMTP id n12mr14973709wru.291.1611243014995; 
 Thu, 21 Jan 2021 07:30:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f14sm8269866wre.69.2021.01.21.07.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 07:30:14 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/11] drm/rcar-du: Annotate dma-fence critical section in
 commit path
Date: Thu, 21 Jan 2021 16:29:57 +0100
Message-Id: <20210121152959.1725404-10-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
References: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
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
Cc: linux-renesas-soc@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ends right after drm_atomic_helper_commit_hw_done(), absolutely
nothing fancy going on here.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index fdb8a0d127ad..734e2e614fd2 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -442,6 +442,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 	struct drm_crtc_state *crtc_state;
 	struct drm_crtc *crtc;
 	unsigned int i;
+	bool fence_cookie = dma_fence_begin_signalling();
 
 	/*
 	 * Store RGB routing to DPAD0 and DPAD1, the hardware will be configured
@@ -468,6 +469,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 	drm_atomic_helper_commit_modeset_enables(dev, old_state);
 
 	drm_atomic_helper_commit_hw_done(old_state);
+	dma_fence_end_signalling(fence_cookie);
 	drm_atomic_helper_wait_for_flip_done(dev, old_state);
 
 	drm_atomic_helper_cleanup_planes(dev, old_state);
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
