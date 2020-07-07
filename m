Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A042178EE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 22:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7426E7D9;
	Tue,  7 Jul 2020 20:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70976E581
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 20:12:57 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o11so46635429wrv.9
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 13:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wWJo4Xms9xJyKH8uRObCjerwfD0/w2Bq7w9d1Tdqg68=;
 b=UOX4Dtrl9QRt0mnhEULXYaIhXEcwlQEl9dJZ6AKauST0v8/sueYjVcBr1H9gpshANp
 D7Leh7Gl+2NKEN7rDuk7xlozsQQmDcFZg1uLXs+bi5cvrSo2PcRAIgbCNAj4hEOLHs4E
 nH2oRdO8AAwxZVQ6SAlDyIBsQf7zFeXKTjhnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wWJo4Xms9xJyKH8uRObCjerwfD0/w2Bq7w9d1Tdqg68=;
 b=ieSiSIekbhZ8LcZuX4iA3SfFOpSZn3Mye1fm52GtwQ6syNh50qnGfDin5WHd9E0j0b
 QInSPGlt9pw9Q60YTqj2SoQo3QJB5Bjit+ZJsRjPIzwtu0bCcfKe/PT5SQCu+ZtwWm9v
 2p67DXb6pmyS57xJXPccyQ7Zz/EsrITDKFhJvPmd/MFdONdnvdms3ZLHecgNY7l5oXsE
 U/TtvspIMuvVPMa14Th0gOpaIJs9EMhLIh3LeFxhnWubTsd4eb9ophI6FPJLnyG6RYPk
 SHBOE9qZM9NmCTb+WzxTEvQL5yCrMWOHHn89smRlHCAdbAvQ7RzjoFImK6Jc/I80FEKR
 msuA==
X-Gm-Message-State: AOAM530C4Ennlzqko+SDE+74Vs/455xX5k7P0ARPHF907k7oE7uiXHtb
 WfQo3hceAopTXtHvyJ68+xi2XoLaJTw=
X-Google-Smtp-Source: ABdhPJxDsyfr4zDexGLiiFYSg/7wzAGNH9tBkAAtd+Zc++yr8EV6rRAt45326uR5zE2Phg7PZ7uGVw==
X-Received: by 2002:a5d:4751:: with SMTP id o17mr32057251wrs.345.1594152776092; 
 Tue, 07 Jul 2020 13:12:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q7sm2515262wra.56.2020.07.07.13.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 13:12:55 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 12/25] drm/rcar-du: Annotate dma-fence critical section in
 commit path
Date: Tue,  7 Jul 2020 22:12:16 +0200
Message-Id: <20200707201229.472834-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-renesas-soc@vger.kernel.org,
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
index 482329102f19..42c5dc588435 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -391,6 +391,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 	struct drm_crtc_state *crtc_state;
 	struct drm_crtc *crtc;
 	unsigned int i;
+	bool fence_cookie = dma_fence_begin_signalling();
 
 	/*
 	 * Store RGB routing to DPAD0 and DPAD1, the hardware will be configured
@@ -417,6 +418,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 	drm_atomic_helper_commit_modeset_enables(dev, old_state);
 
 	drm_atomic_helper_commit_hw_done(old_state);
+	dma_fence_end_signalling(fence_cookie);
 	drm_atomic_helper_wait_for_flip_done(dev, old_state);
 
 	drm_atomic_helper_cleanup_planes(dev, old_state);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
