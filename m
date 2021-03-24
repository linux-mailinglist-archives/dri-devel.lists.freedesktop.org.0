Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 969B9347B69
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:01:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E126E6EA25;
	Wed, 24 Mar 2021 15:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF786EC66
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:00:57 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id w37so32408260lfu.13
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ODzvX9EZrwbemZb4oINSit5l7SLzwthVC0SVRjb2PyE=;
 b=m9uc9ihGqmBI9y09Qa4HBAFLHe71opBwoq6uKXVoJO8djeXqJZ87ZpRQ2jzKcjS5zh
 GigzhIc5Vh8nx93jj5xzdE8qW5u5Wst5eT/JfrtgdtczpRVK9S9ufTOXwSqefOrPwq2w
 hjt2k9QhTfB1PEjhrp1CPYqtbkKGkZbR276udv1eZPJlwKAHnAjxDsN7ozwZNKNEu68+
 QQWHS1qY11w8/ncKX2fmi36Nw6jBzBkJqFS2mndVFhcvDI/iYnAb7Ilt4lXHok4Mnh5H
 6B/xIYfHbk/2IAFrhLH6aOr6A4oKZDrJ4B0ieDQxJhZ2die1rONPebOpeM3EmJ6/tRz+
 nNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ODzvX9EZrwbemZb4oINSit5l7SLzwthVC0SVRjb2PyE=;
 b=pe638griPl/ocfljD2hmrSqTO+zk83HDL09F84q/Xcg3fZHL/bPYUWKc9gexvPToir
 Ly91RwAoLM1hV0bJ2sZMh5BnAUVKsirlXnbpYp9OnSUSAbZ48xzlDu/Raeaq0R7Ihsq3
 pEytB+B2Fe1exhJaUcCFyZ+BU7MtHDMt6TTjS6IbVoQzbZY2PU9dLc+DDMuYGZczZi1q
 9PdMS3+fgzFW4seBT4vp/xhre1XmTjdN3aYSmZYbodH58Kh7YAjaDAJmcq3xnXB7ErdC
 tklxyCsas3uGQ+WwJb/GawbEaBoTz1pg8MeGrZ8tnjXtR6m1tmUGbs9nER1O9MXML9wP
 8rbQ==
X-Gm-Message-State: AOAM5322EXjBIdvc1nB2rDVqkbRi55E2WlBB+rwOcTfXFdraTjc061aQ
 1Uh6jMOmUiz8QtoG/DPS4FstNg==
X-Google-Smtp-Source: ABdhPJzN0syGzL97CnhhUH0gfaBSfDkqmT4VfqiYb0232mZnJuPy4vT+S26CJFdeZKw37ZClRmzCjw==
X-Received: by 2002:ac2:5ca7:: with SMTP id e7mr2201134lfq.646.1616598052554; 
 Wed, 24 Mar 2021 08:00:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:00:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 18/21] drm/msm/dpu: hw_vbif: make set_qos_remap mandatory
Date: Wed, 24 Mar 2021 18:00:21 +0300
Message-Id: <20210324150024.2768215-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All supported hardware instances feature DPU_VBIF_QOS_REMAP option, so
just mark setup_dither as mandatory rather than optional callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
index b757054e1c23..377d5e8ae615 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
@@ -204,8 +204,7 @@ static void _setup_vbif_ops(struct dpu_hw_vbif_ops *ops,
 	ops->get_limit_conf = dpu_hw_get_limit_conf;
 	ops->set_halt_ctrl = dpu_hw_set_halt_ctrl;
 	ops->get_halt_ctrl = dpu_hw_get_halt_ctrl;
-	if (test_bit(DPU_VBIF_QOS_REMAP, &cap))
-		ops->set_qos_remap = dpu_hw_set_qos_remap;
+	ops->set_qos_remap = dpu_hw_set_qos_remap;
 	ops->set_mem_type = dpu_hw_set_mem_type;
 	ops->clear_errors = dpu_hw_clear_errors;
 	ops->set_write_gather_en = dpu_hw_set_write_gather_en;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
