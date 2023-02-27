Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 714646A4B10
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 20:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E304110E48C;
	Mon, 27 Feb 2023 19:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA5410E49F;
 Mon, 27 Feb 2023 19:36:03 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id x34so7384191pjj.0;
 Mon, 27 Feb 2023 11:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qPSgblFxcMDwoNtdY8qW+0LuYLpgnFy45QQcEr2JcOw=;
 b=QZZ1q6r0sTzHPL7VdFvT0DoM/oGJCvYAXWVG2Sq60pT1O4tLHJp+sjl/Ykf9EjPMDE
 rnP7Qjro7d87sOtDeaAwf/tVHLI/8H4R/xSS85I61TGHpSt1lk9Ci+/tTi+snY+1eLxA
 jNwotBYTEY9umpsoTbC8ooXUZBOorHN/PGCHCfx6uT+revidH/IRH7LWIxzDxyUtK79z
 5z89DVB3rViku7Li6muVd4Aa38la2/eYoBeQVzW5fkObbJTSrCx6gVFG/yhpqIpqSCN6
 oFQcFh4rW5VbwINPaEj/shHDVZFmciEuf9nBscjy/upst6ovmm+6vWSyZXoFO7+FgI5V
 CUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qPSgblFxcMDwoNtdY8qW+0LuYLpgnFy45QQcEr2JcOw=;
 b=SpELR3Ayrnvw0x4fxcWi8YfGx3902gDdraK/OPptUpqnZtqUMIilXdhha9u7wlDm5U
 xmsDhXYbKo5RILDoRbzMcX4Who7sAsOIa3DAd8rymoCgeH0+QiWbdjNhwSU3iZM+R6bq
 75ixN8GVByeMKdSbtysSoqno5+dr6WWn6Cm+T3gHao+hGUMCfJmpsQxxpQIg6bEyzxPY
 fNN5wAg9mMhfmnibynBLfCL+pV6U1P+3mxs4lzXyWG3DHWMB57sjpsSEJa4qlVg+78K0
 NZHZAfUEpTj/SHUUuAciFIPYBDfG9JsELhap3I+e/vTOOSxxtCehWR1iF7u3/qPbNuJG
 uFFA==
X-Gm-Message-State: AO0yUKUx05dCncWgX1olJqvaTfezBDS08OueJefDUvlIW58JI3c57MSt
 cbgKpbdBru5XzFuKzdULuh0I4n7vOvI=
X-Google-Smtp-Source: AK7set9qlYKiBuxZSBv407fTxhQUDFX37IZbk5poFBbtPNGwefM6+yp8XFL+jFG1XsSowJqpxO6wXA==
X-Received: by 2002:a17:90b:1d0e:b0:232:edb6:9710 with SMTP id
 on14-20020a17090b1d0e00b00232edb69710mr439552pjb.17.1677526562243; 
 Mon, 27 Feb 2023 11:36:02 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 fw8-20020a17090b128800b00219752c8ea5sm4729897pjb.37.2023.02.27.11.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 11:36:01 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 06/15] dma-buf/sync_file: Support (E)POLLPRI
Date: Mon, 27 Feb 2023 11:35:12 -0800
Message-Id: <20230227193535.2822389-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230227193535.2822389-1-robdclark@gmail.com>
References: <20230227193535.2822389-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Allow userspace to use the EPOLLPRI/POLLPRI flag to indicate an urgent
wait (as opposed to a "housekeeping" wait to know when to cleanup after
some work has completed).  Usermode components of GPU driver stacks
often poll() on fence fd's to know when it is safe to do things like
free or reuse a buffer, but they can also poll() on a fence fd when
waiting to read back results from the GPU.  The EPOLLPRI/POLLPRI flag
lets the kernel differentiate these two cases.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/dma-buf/sync_file.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index 418021cfb87c..cbe96295373b 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -192,6 +192,14 @@ static __poll_t sync_file_poll(struct file *file, poll_table *wait)
 {
 	struct sync_file *sync_file = file->private_data;
 
+	/*
+	 * The POLLPRI/EPOLLPRI flag can be used to signal that
+	 * userspace wants the fence to signal ASAP, express this
+	 * as an immediate deadline.
+	 */
+	if (poll_requested_events(wait) & EPOLLPRI)
+		dma_fence_set_deadline(sync_file->fence, ktime_get());
+
 	poll_wait(file, &sync_file->wq, wait);
 
 	if (list_empty(&sync_file->cb.node) &&
-- 
2.39.1

