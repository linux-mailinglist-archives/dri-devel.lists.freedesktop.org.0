Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF76669D4C7
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 21:20:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84CC10E7AD;
	Mon, 20 Feb 2023 20:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2326510E797;
 Mon, 20 Feb 2023 20:19:28 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 oe18-20020a17090b395200b00236a0d55d3aso2981650pjb.3; 
 Mon, 20 Feb 2023 12:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qPSgblFxcMDwoNtdY8qW+0LuYLpgnFy45QQcEr2JcOw=;
 b=b6XsnDqK1olt5qz2T9u3YiOy1VT5RRxz/VMoCYps3Pgrs+exn0Ya8JX+enLUoYcNBj
 buWfCT4iJPWfewaDPWp/5MvY+8QNicRVOvpZHbzyieCeadRJB6D+ELIdtWQA4vrudB0C
 Ic8gs+sFUfMRmdGe8U8V9mlHakR00nNgiPRSLRz2wdN0NwK0cO/ZTEM+Dk85lDjnxFGH
 4H69GyzuGQ4Yzbn85CZMH0ujDoR4wVYNjPMbCZHKi7GaRLaFXdb2OrikJlOFpEQdeOqM
 rY/t4VFouvqsEETK+GCENjhhtY9tFNbH5CV48cJKLSsRL+uhx50XjKjLgz+GY+R0oaqk
 Wy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qPSgblFxcMDwoNtdY8qW+0LuYLpgnFy45QQcEr2JcOw=;
 b=lXZZJJBYkWKYBAx7LgtvdW3z+HGqy62Wz4hyVu0b7CJOHTC7K3YycRQN+7/+dzyC5t
 xS0l3f/2XOXuqdO1xHIUQrKAFbqJbzq/h5zVnbrMuQyf4x50nZ0uRnOoodoIHxagN/NQ
 m2Oc9dV7jDq8t+uhezGx3NKkszuIo+D8Mi+Ra9/WG1gp0LddqLgLifz1p2qzzlNIigCb
 ATEK7UaFzqwShFFkTiYO0PEpJSvWj4KC2w66hvikAgivQ3zvB2oGHh1Sht4yogzw/2tx
 MCalL4mBBMRDdJqgqaNezkD0n+6/A6JvGd1zvGO43RTz2+4G40ADWgHndt9SFaH6rljW
 yhtQ==
X-Gm-Message-State: AO0yUKXN/5wAbE6eNQSVKQKBbKrdQAIw8XzH5IgiSdncQ1eadM6WdrOh
 gjq2PPzVPVNSI2iOOF/DpuPCyBPotVo=
X-Google-Smtp-Source: AK7set/kLRp8IZ3rKb3WEqYptlfgjeKBGtJDw+/6Vpa1D7As5QAyc9t819GAtY4AWeHTvgf1dPYb+A==
X-Received: by 2002:a17:902:ea07:b0:19a:f9b5:2f2f with SMTP id
 s7-20020a170902ea0700b0019af9b52f2fmr2362963plg.55.1676924367448; 
 Mon, 20 Feb 2023 12:19:27 -0800 (PST)
Received: from localhost (c-73-67-135-195.hsd1.or.comcast.net. [73.67.135.195])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a1709028f9200b00198f2407ea1sm2033972plo.241.2023.02.20.12.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 12:19:27 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 06/14] dma-buf/sync_file: Support (E)POLLPRI
Date: Mon, 20 Feb 2023 12:18:53 -0800
Message-Id: <20230220201916.1822214-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230220201916.1822214-1-robdclark@gmail.com>
References: <20230220201916.1822214-1-robdclark@gmail.com>
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
 Pekka Paalanen <ppaalanen@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
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

