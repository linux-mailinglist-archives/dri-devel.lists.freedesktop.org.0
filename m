Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE56B78492A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 20:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515C610E3D1;
	Tue, 22 Aug 2023 18:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF0110E3CF;
 Tue, 22 Aug 2023 18:02:55 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1bc5acc627dso31282965ad.1; 
 Tue, 22 Aug 2023 11:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692727375; x=1693332175;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nXZWjfN9jRVe+H33im5sYKdcYpl83+nexah9W681kvs=;
 b=iRhw1Gog6JsojSSHyFFVyXAMLHYDTYhX+sAAqKioKTACGpypHKa/Oenkr89YVegc0Z
 q4trCT8yVEIttQAHR25p7YaDWoHPJ+xIHbeKmYQORBeX9Ve+0uHn1yFEWjH68vlsPUWL
 6ChUtp/1sBn9Jxnj+Sr21xNtiJLlGkApDekAid4/9BXR56psEfnPVLA/YVqsMZW6tFhc
 j6bv8W9wfZIgW3JJ6AVCo7kKXo8Sd3WWO4ZPyzCDlxrfUDx5lm21hKrAEidnhtYbZ0vR
 BcS/PaAFUYJmuew/SDIc+89u+bwRYSxQgDcpea3mSQpPbF0VpMf2zWeJwNgscSSsx0Wi
 GURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692727375; x=1693332175;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nXZWjfN9jRVe+H33im5sYKdcYpl83+nexah9W681kvs=;
 b=UW/MqVfc/dkzXMwQj0nXiS0etUkzV1W15mePOJ0h/55TnJUqLkuCx3zGS7NZhEUHO/
 Gop4ViIuu7wSH5+rP7zMGbtdOYcyVt0QOAppIOA3ENwy1ER4XgCfkMpU7ZVrEhxhANfF
 IPlfDXwMccl2mnA+a0DK/PRspVgE3slCtiy2ZkyMb9nPF7xH4fbJK3i1hTWeDayEjG/V
 ud8XITNdYuaD8A297gnNhORY/4dJZbRrFyKuWPKzRoWRF1gvgoh4M5wKI37AQ29fqUlQ
 xThmcXfhXBcRWAezo0oyodpVEl/B0PTnAI27UgwP34tTiesvNPcHtEM/+1USG8FxlPt9
 EUFQ==
X-Gm-Message-State: AOJu0Yz6TyJJeaxAcXxyp5Bm+IJ3cauyEISfbR8lPpZqXAdaGWYOe9k1
 Jskuu6o8ACAC3Bho25/G57EfpPIRgco=
X-Google-Smtp-Source: AGHT+IGaL6Rsdsko07MG0eHSn51o3kJqFWl1JNQj/3jMWXPTkNXbj6c8kBm6TpsIhDJNhUoYW4zLeg==
X-Received: by 2002:a17:903:32ca:b0:1bb:5b88:73da with SMTP id
 i10-20020a17090332ca00b001bb5b8873damr9278187plr.61.1692727374873; 
 Tue, 22 Aug 2023 11:02:54 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a170902e98400b001b53953f306sm9351280plb.178.2023.08.22.11.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 11:02:54 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 11/11] drm/msm: Enable fence signalling annotations
Date: Tue, 22 Aug 2023 11:01:58 -0700
Message-ID: <20230822180208.95556-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822180208.95556-1-robdclark@gmail.com>
References: <20230822180208.95556-1-robdclark@gmail.com>
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

