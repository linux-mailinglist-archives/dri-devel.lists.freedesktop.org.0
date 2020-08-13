Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0318124319D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 02:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23CE46E963;
	Thu, 13 Aug 2020 00:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA416E963;
 Thu, 13 Aug 2020 00:02:20 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id j21so1879934pgi.9;
 Wed, 12 Aug 2020 17:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NL6rjLUzSXMKDMOOhTr8S6EoaPbeYW69JWbRVQ0AlOQ=;
 b=U2gNhKgvUtMwI0xzUVhx//Bq/+qwtjFeuaYS1iveIR3A4bsACyis1XddGwiY6dK2Sn
 6jbT7RsiRVg4o5I9ePAPB9paTugf7W0AFcLzK5wXEbTZo+P35e/+ALwm2rCJrrKtDu3k
 QF8c2z47qQ9ToSjndnfod7w9oaqdqX0rpY9OcEHNQNshW0I1MNOYt8B2wVa6hUuRfxLP
 JX84Att2w1CT9xa5NObA6SMP5S2SXrU9yu9N1jAjKiD8MtKfyIvLn5dP8l7iZy+cIMPr
 eafUH6Ta2blVR9Y7ToWsVuBk8fVhSdKCO5nOlGZBcndN73qqU5NcvBYHd5k9LbAGOJ7U
 1ZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NL6rjLUzSXMKDMOOhTr8S6EoaPbeYW69JWbRVQ0AlOQ=;
 b=jeSkjlVGzRNufFy+2RkoFQxIirXTpwUUzBV64I6LAZLyIbEyuDF2V0z4VOQEwOAj19
 f1JZu5OfEBIqGkHRn6yDLAm5F717isM5M0Rg9ETnU0BTbkRz3qxEUZLx1K4kcq9mSuNm
 ZQrU1BF+n7IrjKtfcGXq6J2XPPCyq/ol+2pHf3yrGAh9PIWKtGMd2qnROX4LAeWUpbQW
 QObcQDEtf+LL3IxahCgVADb9NTT3TUYK91ay3QMmyB9CtzpZtH6SEBgf/HWsmT3rlEJQ
 /XdwqntuvkHJYEgf3J3wytH2atk4SS7fNEeXr1N34PNC+CUFQreAou1FJsBsHbw40IQC
 nyQQ==
X-Gm-Message-State: AOAM53366y9wBfjIwJaqnoV1LNv2qI3l+KFxO3VRL0Nfr6AYaczHazys
 vtcBQqSMlBFRd/kUBjPHJGz23bBjaP0=
X-Google-Smtp-Source: ABdhPJyrSzvVBwV+Sltkyb+UhvogaKP8htnyL7cUHmv9324U3QvGSXf9RSUI9G2wmyoYoKvDJUop1g==
X-Received: by 2002:a62:d149:: with SMTP id t9mr1853163pfl.59.1597276939794;
 Wed, 12 Aug 2020 17:02:19 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 y20sm3563448pfn.183.2020.08.12.17.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 17:02:18 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/adreno: fix updating ring fence
Date: Wed, 12 Aug 2020 17:03:09 -0700
Message-Id: <20200813000311.708728-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

We need to set it to the most recent completed fence, not the most
recent submitted.  Otherwise we have races where we think we can retire
submits that the GPU is not finished with, if the GPU doesn't manage to
overwrite the seqno before we look at it.

This can show up with hang recovery if one of the submits after the
crashing submit also hangs after it is replayed.

Fixes: f97decac5f4c ("drm/msm: Support multiple ringbuffers")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index f9e3badf2fca..34e6242c1767 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -405,7 +405,7 @@ int adreno_hw_init(struct msm_gpu *gpu)
 		ring->next = ring->start;
 
 		/* reset completed fence seqno: */
-		ring->memptrs->fence = ring->seqno;
+		ring->memptrs->fence = ring->fctx->completed_fence;
 		ring->memptrs->rptr = 0;
 	}
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
