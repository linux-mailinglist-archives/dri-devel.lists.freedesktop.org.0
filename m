Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A96A3901E3
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 15:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E1E6EA17;
	Tue, 25 May 2021 13:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D8889A60
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 13:13:20 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id w15so38047153ljo.10
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 06:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j5KrzNiLkEZ7U9hbHrWEVr0lVINK2iN1124OgJJTqJA=;
 b=q9rxBoOKQtZeh7mPEbFoNf7mSDDUN77dp1k+9wiOKLfYn/mpwMtYrNRFMtbVUv0rxk
 O73NTGeM4qzA0qKeZGi++ZIrwWdOxqtsWT9FokqRqDFYyZG/bBnEBrgD6/Gw6MepZ+hz
 1NTd4jHlBsGaRydFIcvH7vV3M4zmKbrqs2OJl9kVBqS5YxlX/h3EuG49cvC3Sq/iPOOI
 tSWZuy0xRCPzpSghvM/TsDPLQyAoVUMjxMtVcAULEukAtsQhNYhYnLYQdum8umkeWDgL
 7A88iVaPBGwFiG0loCmxONvWt5A1rIlAz8sAS/85n8SVSxtJZFvChm5fpvaxFFs5FDg2
 gZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j5KrzNiLkEZ7U9hbHrWEVr0lVINK2iN1124OgJJTqJA=;
 b=E2YcdBopTTGw3q7uMFMSnxOSnEdSY75684ezbGmSxS6nEHzbZnUYVYFfyqgihrNayG
 4jn0r387+kkXlX+Omwrf8/Z0FmP5vEeX2sy27Eh7lGOPxLOkNJEKiwL2mnnNrtatfYpt
 tl65jHYNpA4WoeH4kqt4FTKNkM36FJ4/rtxy+v/Hj3tV8cVHrlPfJiEVHQujMz/dcmfn
 E7YRTXucgfJA6l35Ack9167WXX5VfzGljg+Am7Qt1o9BR9xUVzCSd87nMwK2JbT4cAoV
 VTP4LHN0pCqC6UQQWeVFWQzqe4zJKY+V4FwToaquNjHsExzrQiMvpGzR/51OXrOKklC7
 Z0VQ==
X-Gm-Message-State: AOAM530fjUyanmQXov2QD6rie/iyJw6WJ2wl9FFnSihlpiMQf0XDtrJz
 7xB9ES+LBy4peBrvLZ/VgoEa0A==
X-Google-Smtp-Source: ABdhPJzCiFO10NhUwXxzr+XwOQfj1bjdW6iWRs5pJDqSUZ5iAcpPEuflaOWSfphJJYfC8bkbZxE6ZA==
X-Received: by 2002:a05:651c:3cf:: with SMTP id
 f15mr19851585ljp.404.1621948398936; 
 Tue, 25 May 2021 06:13:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id t20sm2101108lji.53.2021.05.25.06.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:13:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 1/7] drm/msm/mdp5: use drm atomic helpers to handle base drm
 plane state
Date: Tue, 25 May 2021 16:13:10 +0300
Message-Id: <20210525131316.3117809-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
References: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use generic helpers code to manage drm_plane_state part of mdp5_plane
state instead of manually coding all the details.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 8c9f2f492178..8c29026d770d 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -176,8 +176,8 @@ static void mdp5_plane_reset(struct drm_plane *plane)
 {
 	struct mdp5_plane_state *mdp5_state;
 
-	if (plane->state && plane->state->fb)
-		drm_framebuffer_put(plane->state->fb);
+	if (plane->state)
+		__drm_atomic_helper_plane_destroy_state(plane->state);
 
 	kfree(to_mdp5_plane_state(plane->state));
 	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
@@ -191,9 +191,7 @@ static void mdp5_plane_reset(struct drm_plane *plane)
 	else
 		mdp5_state->zpos = STAGE0 + drm_plane_index(plane);
 
-	mdp5_state->base.plane = plane;
-
-	plane->state = &mdp5_state->base;
+	__drm_atomic_helper_plane_reset(plane, &mdp5_state->base);
 }
 
 static struct drm_plane_state *
-- 
2.30.2

