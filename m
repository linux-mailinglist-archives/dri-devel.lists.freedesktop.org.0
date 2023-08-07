Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D8D772C58
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA3C10E339;
	Mon,  7 Aug 2023 17:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649AE10E326;
 Mon,  7 Aug 2023 17:12:17 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6877eb31261so3425086b3a.1; 
 Mon, 07 Aug 2023 10:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428336; x=1692033136;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nXZWjfN9jRVe+H33im5sYKdcYpl83+nexah9W681kvs=;
 b=JxtZ0TOHGdOvBVososgY9Zy15pOWAkF7x8gemX+XNHlZcmEwUGJH6gS7S5u0636e08
 DiOV4aG8XKBk3aaL1ZVD2tiUaTPI4gMubJmq7Mf+JpRTj/mhbtWlFt1qLc2v7ofqYi9t
 RgK5Ym7wckZkEwX/gvnpwuxMT77wMtDJbPIIqtaOpUGM0EWb8lnlk67dEBK4XSbfidgo
 p/Lj6BMenBt7K/mvIRlCIIaM5NFCKtT8GCuCba+blaWeK8LMDukx8oHEyivtwKyHFaOC
 8YnI1Rh7Y+KYIKJdx/rIQylrQUic0EKQNctdRw4RtQh+uRsx/lrMKyfUtbbVPy6r/06n
 +3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428336; x=1692033136;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nXZWjfN9jRVe+H33im5sYKdcYpl83+nexah9W681kvs=;
 b=gCsFqqsA8X8+Pn8aoyFrjtuaJVOBv0/L4x9j1Ebm2T3NMWeb91dyuIfUvqVMRvwOor
 F6f+gEAQ+GFex5RabczYKni8SqIjsHS2pX+he/DpJhDE2vuWNy7DlckpxIjiKasYtZO1
 fxQXlRkiaYrQgT36K3pDgl9UhBsBwzFowQlMhWu39Fz6ycIO7GO9HxAqiLBBf3gp2I1W
 gMs5/iiOS96xwPq2CWMa7VjrIEE0usLzBRr6cezLXzrxe6AnlxxacY8cqYH1PNAFweFF
 T/ks9H2f0jvvh39e4VjdnpW4JxZIAt8HtS74ZE/j5UaoStrZM6mkZKx/D6qJgtXiUBht
 CONg==
X-Gm-Message-State: AOJu0Ywd3SVEXhlIaOPpAIowXjrgU3S/sFJDmAq930a6so3GvTBl08Rk
 t38AhcPNvyJAKBibFZG7E+2bcwUCMK8=
X-Google-Smtp-Source: AGHT+IFHBNbwLQimjGOtzcaKvIByqk/TQzJWCN/W+g5iL3kJg/6pWmYPHRMzc0ZNijBedo2YSdDiqw==
X-Received: by 2002:a05:6a20:1604:b0:13f:4e70:ad48 with SMTP id
 l4-20020a056a20160400b0013f4e70ad48mr12770238pzj.52.1691428336288; 
 Mon, 07 Aug 2023 10:12:16 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa783c8000000b00682c864f35bsm6624048pfn.140.2023.08.07.10.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 10:12:15 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 9/9] drm/msm: Enable fence signalling annotations
Date: Mon,  7 Aug 2023 10:11:43 -0700
Message-ID: <20230807171148.210181-10-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807171148.210181-1-robdclark@gmail.com>
References: <20230807171148.210181-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Now that the runpm/qos/interconnect lockdep vs reclaim issues are
solved, we can enable the fence signalling annotations without lockdep
making it's immediate displeasure known.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_ringbuffer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 7f5e0a961bba..cb9cf41bcb9b 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -97,6 +97,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	 /* currently managing hangcheck ourselves: */
 	sched_timeout = MAX_SCHEDULE_TIMEOUT;
 
+	ring->sched.fence_signalling = true;
 	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
 			num_hw_submissions, 0, sched_timeout,
 			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
-- 
2.41.0

