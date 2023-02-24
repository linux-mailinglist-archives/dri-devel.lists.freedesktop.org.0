Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9446A22C9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 21:02:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6945D10ED14;
	Fri, 24 Feb 2023 20:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934B310E5DB;
 Fri, 24 Feb 2023 20:02:11 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id u14so629636ple.7;
 Fri, 24 Feb 2023 12:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qPSgblFxcMDwoNtdY8qW+0LuYLpgnFy45QQcEr2JcOw=;
 b=YjrzSGmSAO24NAy7pV99H76mHnO/ob0DJd+KgHuXHgTONteT6eB8WKwKvzxTAV8OFc
 ozODGa8na8UY6YME2rJSC+RUVjI+c0l9Zr9nmjTVoIq+dYqU50lqNhMb6B01hqnG7mMj
 S94REDyVMh5NWQHFZF56abZ0uJNxUpO2pG4bdx0klAg7rZDI5Re4eaBmwMj8v//CcpE1
 RtofOghuwLRSl9tPiOQ1TWX4fP326emGj/xi1A2eZFVxerP3uJll6xEQhXhLzvLjzFc9
 ZGZq/hzvp/teFofSmQtORvyU2110tn2XdxVYxH1WPlaBH7/nMEsrJFl/TsVRy5vryYa7
 8d3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qPSgblFxcMDwoNtdY8qW+0LuYLpgnFy45QQcEr2JcOw=;
 b=26vF7UAkqa9DkvsqxrVe7JYnOhGvQWtQkf3B2NMyzNfU1iyewVqZxWKvkhzvhyzOR+
 4DObZZPwY8bE4tFJe+z4rHLOfMztpwzbHERynN3+JAhv7p4/uId8e0sgO1oiKURAmbuC
 I2780HG3UA3/CYYVl5gN3um+38jb3u1lLfo9POoOB6AJV0viQCQ8ydqsraLyeP/aSWUC
 6dP9UVo4WWFaK+LkzZ5CFb83QK7ZzmsJAeoBBa7wrnv6tprtVUDSqNwzzfz8QgWrWPwQ
 NRdeeIJ93BA/IarneWHffwZvv+hdjudCVR+KrBHpWpg6aBOHwoIxwGxPSwFnMzim2dgm
 SshA==
X-Gm-Message-State: AO0yUKVCWCsfJf7mSCWmf4h/oQVa5PvpFmjC9PNRK3ZCAIrWnyf2Z3Ag
 Vhnc6c96I4H8xchtJcd9LlQ4ugJhNpw=
X-Google-Smtp-Source: AK7set/0So7/yjbHxG+9IFq3Vyn2w/a/SkcQTRiHJyKEh5wCWaBbLoFxjxFUp2shIAdMi1mUsKQDAg==
X-Received: by 2002:a17:90a:351:b0:236:73d5:82cf with SMTP id
 17-20020a17090a035100b0023673d582cfmr17766333pjf.9.1677268930955; 
 Fri, 24 Feb 2023 12:02:10 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 g23-20020a1709029f9700b0019cbe436b87sm3610113plq.81.2023.02.24.12.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 12:02:10 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 06/15] dma-buf/sync_file: Support (E)POLLPRI
Date: Fri, 24 Feb 2023 12:01:34 -0800
Message-Id: <20230224200155.2510320-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224200155.2510320-1-robdclark@gmail.com>
References: <20230224200155.2510320-1-robdclark@gmail.com>
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

