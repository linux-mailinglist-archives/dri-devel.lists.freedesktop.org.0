Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF0B6A630E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 23:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8BB10E149;
	Tue, 28 Feb 2023 22:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99A810E12E;
 Tue, 28 Feb 2023 22:58:52 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id ay18so6825798pfb.2;
 Tue, 28 Feb 2023 14:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677625132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qPSgblFxcMDwoNtdY8qW+0LuYLpgnFy45QQcEr2JcOw=;
 b=V1urbG5RuLnnO3VpMHdX0KG/G6gU5WFBPcaLIO0j/3+ro3asLgBZxzPDlmGLQLGWfY
 e1npBQxhdEGRFU27gZsGamZvqXfjGxkBzgs9jBR4/GulwzblxgQ3Q6HMAgg5602sWSXe
 UvJ7TjSeSlS12TW3snncvEDnKiwrwdWyJzrDKOpd+ZV44GjPF2+IThw12qS6zyzKbezc
 wD3N9vq19W3m09Onq+8ioeK5HFFsOCrkYESNlPR/LI/uiCcj/oiQoPZ+0w0sg8XCqlkr
 6ehVtL1cFcF+Pwx6XuAwYT67z061XHz0XA9KQ8wRhNrbCXO7Sp3k2WWlSbcRXTxvF919
 dW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677625132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qPSgblFxcMDwoNtdY8qW+0LuYLpgnFy45QQcEr2JcOw=;
 b=uExSHneKLEDuddZxF1ePcMhJ4Pz0dEx1CEBxd3a/ChJJDW54hBIrHt9KG4F/frQCIt
 UpviHoOky/cVS45SMPs0T6xKUPrf8HsxtN0nnb5TQt3uGUZEVjqH9jSIo7xGPdg/89hJ
 ovC2mdrxmxsgrqa3rfXZ4ai7HIayf6NfOwsFl58lYPkyGiR9v/2yCQD2oR9KY7tip0g7
 jxR+jyhlnFfj/hDI/sUg3YBu0jSLE9iV/fmdrGw3Jb1p2WqOnL83AzIvzXxmPi0y42ka
 /1XrETIWDlndXAVxcQy/xigvScmfHhVN0kDiFCBlTq/idmiEdvX4PLC1YZey/pM2/1CA
 Q/xQ==
X-Gm-Message-State: AO0yUKXaWpb5c4lHB2H3nnXJV+595T9YqRl+NrxxXdJACBmXl0687JTT
 1JFZkQh3a6kG7K4M9uvv15LlKUrS8h0=
X-Google-Smtp-Source: AK7set9D6bzyHSECO63x+rY5hYGmDXYfp4j6STSXtKZg5kfnZ3Wzzd0d0FRKKk5uiWMW7b1PfnYMZA==
X-Received: by 2002:aa7:99c8:0:b0:5a8:d97d:c346 with SMTP id
 v8-20020aa799c8000000b005a8d97dc346mr4142929pfi.12.1677625132210; 
 Tue, 28 Feb 2023 14:58:52 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 k184-20020a633dc1000000b0049f5da82b12sm6121487pga.93.2023.02.28.14.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 14:58:51 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 07/16] dma-buf/sync_file: Support (E)POLLPRI
Date: Tue, 28 Feb 2023 14:58:11 -0800
Message-Id: <20230228225833.2920879-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230228225833.2920879-1-robdclark@gmail.com>
References: <20230228225833.2920879-1-robdclark@gmail.com>
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

