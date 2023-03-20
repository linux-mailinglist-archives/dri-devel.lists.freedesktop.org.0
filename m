Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D38616C151D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 15:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C7610E581;
	Mon, 20 Mar 2023 14:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189BB10E588;
 Mon, 20 Mar 2023 14:44:35 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id j13so12352008pjd.1;
 Mon, 20 Mar 2023 07:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679323474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qOKgIqKype2FtcfBEs8DzVnGdB8jDwzY52kLns1gHeQ=;
 b=VnF+6G2rX3V3uiMnbJNUCShKHEg3qSXYFZW2BadyVGNW0EATEl8lpaMebXjsuGk82j
 6uNC/eXNRKXC6LHgJEGqwFVgVpKr8Ft2sQSWlWoJNn2mcPP6CjiXAakf5VgjfGk741GP
 sIHFQgcHBE6gPMKsa9eAIRJpEMN/RO4X6UIOevibBEhmVCdoZdol18YJKBu4jexGjC/y
 xW2lLDNDlqC2S0GLUL1feKz6u5E6vwZDYvzQtXJzzQd8X1JJtWfI4To24/vDTwEUXx1m
 F3Vs7SviqMHjK5T10Q782LncWJWcxm7mshYIhZNh48C6PEae62pRbnFZfPIvZvxobGNO
 Zrbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679323474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qOKgIqKype2FtcfBEs8DzVnGdB8jDwzY52kLns1gHeQ=;
 b=xfa52+HNC98AJxNUfr8cqtsUFpmW50TKY3It/K3NIVTG1HWlV71FG0euohxUJkcSnB
 GgODybivK3ocP8cmp/38dauP4fbdGUbmRxr2nWh79V7c2pNRj6WzRxayKdZhPAQUiCaz
 mq9MqulQK8RrGKeLfCw6baZmvwr8Gma5pH1LPGhhxMBRotF+uF37ODl44GGjWSYa0bi5
 cfhBYE8cZbslfx08c9xeb3XO2g2NsS198wCenlMQRGNygmFD0LGOl2Wdwv7Jo+PG6Ndt
 pD7XnznUyuNKjsRbWzS/qhTChUhmjeyHqTQrLAXy1XiaXLnDQOHN3fqufITwzLE+b0Wi
 uBvg==
X-Gm-Message-State: AO0yUKV2YWA/40U8lmNm/+gWfVLEXTBAoW0WUDFz3cEfiTX5ZPZu0/3U
 K6UyuL4IDIi1Oxj62mZ/ssjwOnoGvzI=
X-Google-Smtp-Source: AK7set87GLedaxfP6MTlGWAVIi2V/FMub1LUUnVtxXaItSj0lTXwOwSmnXTsGsDYl2P+bImVpBwAtQ==
X-Received: by 2002:a05:6a20:bb12:b0:da:24f5:ff25 with SMTP id
 fc18-20020a056a20bb1200b000da24f5ff25mr1307876pzb.48.1679323474431; 
 Mon, 20 Mar 2023 07:44:34 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 c26-20020a631c5a000000b00507249cde91sm6186039pgm.91.2023.03.20.07.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 07:44:34 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 02/23] drm/msm: Move submit bo flags update from obj lock
Date: Mon, 20 Mar 2023 07:43:24 -0700
Message-Id: <20230320144356.803762-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320144356.803762-1-robdclark@gmail.com>
References: <20230320144356.803762-1-robdclark@gmail.com>
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The flags are only accessed (1) when submit is constructed, before
enqueuing to gpu sched (ie. when still visible to only the task calling
the submit ioctl), (2) here, where we own a reference to the submit and
are serialized on the gpu sched thread, and (3) after the submit is
retired and last reference is dropped, which is serialized on the
submit's reference count.  Hence locking is unneeded here.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_ringbuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index a62b45e5a8c3..a80447c8764e 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -26,8 +26,8 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 		msm_gem_lock(obj);
 		msm_gem_unpin_vma_fenced(submit->bos[i].vma, fctx);
 		msm_gem_unpin_locked(obj);
-		submit->bos[i].flags &= ~(BO_VMA_PINNED | BO_OBJ_PINNED);
 		msm_gem_unlock(obj);
+		submit->bos[i].flags &= ~(BO_VMA_PINNED | BO_OBJ_PINNED);
 	}
 
 	/* TODO move submit path over to using a per-ring lock.. */
-- 
2.39.2

