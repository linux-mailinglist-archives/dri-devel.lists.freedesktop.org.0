Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE0F7F2259
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 01:40:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBB210E210;
	Tue, 21 Nov 2023 00:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369D610E203;
 Tue, 21 Nov 2023 00:40:11 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6d2fedd836fso3130932a34.1; 
 Mon, 20 Nov 2023 16:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700527209; x=1701132009; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uYOj379SOV2UbK9laVZ0cIdfJ+7kdLAIQwa994Jd5yg=;
 b=Bk1hz9lw21geuMRnq1PhpVIXh3gMggVSi+973oUy2GEOKVLqTh4wEvgn8roSkPiI8R
 /S8izpafQb/X8eef8v89+ISqDk5fvOGRAMiNW/gjRvQVncWU44NzczhCcUpqDhHOif2B
 gW/WiB494FR3l2vPjuDG4+vmrubgGGq7VZSzRc5LF5nxOnRG4Xnl36reaE9fzvn3Ofag
 zkMXTXGGyc0ZKrWlg75oYPoglqc28yxxDLWctsVO77ZWiJYorJs1IDUqmI5SrMlNGjzG
 QMchQOq4/Zc70vugk2TciDX/bE5VfJ/42Oejci4rsx+I2N45uLRX7pMMLKadTawa6w6E
 sUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700527209; x=1701132009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uYOj379SOV2UbK9laVZ0cIdfJ+7kdLAIQwa994Jd5yg=;
 b=ha0YXogygTPf77Lu3EG6DU1xcRdGfgvMyXTsC2aXCOOE8vwC9WviOzhlzo4Shusa9M
 ntNtrriagesji6vnXLkJfeEqCerg59pQIoXs5VIfBi49jw6fxSdvKEnrwhW58AKWF51k
 CUBHuEnM/qJT8noN8CRPOiyO8FfssFtIOTmCBD/9CIPsJon8B9AvE2r4i/aIdqx8VeQc
 GzPWT2REOLlJ/zBPsfvsh2QjmqUlxngr+qHk/KWLufJqSnzadlilx1FJOWcqBfoQ0qgZ
 maBnkXRgULIx2EHgOLmxyMH/HPGm8w4Koq7FjIj2q5eZa3MbEO1XfKL9mZLpzS/hEpZI
 gTAg==
X-Gm-Message-State: AOJu0YzAc2FvZhB1FIwWWxM/tdMW3jhEVIFxPIkTkcYNBxn6GphOQ4xQ
 fGxIlXWTpPO5dbxvRQMpYbQZ2Cuf3AQ=
X-Google-Smtp-Source: AGHT+IEvgLhoaeclWGQbluYzwOZp4JoyP7RhFpckX77W1BHHUivUh5KC3AVkJ82uQaL1insC8VVbPg==
X-Received: by 2002:a05:6870:d3cc:b0:1f0:c29:d75c with SMTP id
 l12-20020a056870d3cc00b001f00c29d75cmr11052773oag.47.1700527209326; 
 Mon, 20 Nov 2023 16:40:09 -0800 (PST)
Received: from localhost ([47.215.232.245]) by smtp.gmail.com with ESMTPSA id
 it14-20020a056a00458e00b006c8721330fesm6666553pfb.74.2023.11.20.16.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 16:40:08 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/7] drm/msm/gem: Don't queue job to sched in error cases
Date: Mon, 20 Nov 2023 16:38:47 -0800
Message-ID: <20231121003935.5868-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121003935.5868-1-robdclark@gmail.com>
References: <20231121003935.5868-1-robdclark@gmail.com>
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

We shouldn't be running the job in error cases.  This also avoids having
to think too hard about where the objs get unpinned (and if necessary,
the resv takes over tracking that the obj is busy).. ie. error cases it
always happens synchronously, and normal cases it happens from scheduler
job_run() callback.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 2d5527dc3e1a..786b48a55309 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -946,6 +946,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		}
 	}
 
+	if (ret)
+		goto out;
+
 	submit_attach_object_fences(submit);
 
 	/* The scheduler owns a ref now: */
-- 
2.42.0

