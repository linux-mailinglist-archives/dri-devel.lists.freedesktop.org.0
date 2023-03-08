Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B57B6B0D7D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 16:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019BC10E62D;
	Wed,  8 Mar 2023 15:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82E710E628;
 Wed,  8 Mar 2023 15:53:33 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id kb15so16928169pjb.1;
 Wed, 08 Mar 2023 07:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678290813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iRbyMbeEc1g04CNRPycSMV1Llvla2kLsSk+TytIEmsk=;
 b=E8F1gMxoQi0pjd5J8Y6jydRjSAIw7Rqa8bmWluE0DJDyJZamKjSmyYHmicDKUAwwOC
 DQnKhprOqhc0JTNy+sNnE+urwNiknzVmXk5HUXLv/5fJW1DelsQr9V6lzlC2C/fBuROh
 dQlC9fHbBdG8RGLCVsgfvMowoZ2Tl2CmLHqlPv8EjfQxnvTBDu/RpJJx7iFwMlFw2PyV
 xPv4elub5ZEWEK3KKrtxxxySXJKaza7NBM6oYqynNIPvldcOtpF8ekHdqQYc+CKou2ta
 q0eWopDJcM86skChVL/X3tfUtoAE/NnPmjB29i3AHiXjxIjt05hzj6/+bqxy3PBQ2wAb
 0PaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678290813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iRbyMbeEc1g04CNRPycSMV1Llvla2kLsSk+TytIEmsk=;
 b=JKE1MPqUhhOku8UHv4hLuW+duqeQZQP75VPKQt02dqToGuPQQ92HxxyFZa0HI2QdLs
 CqQfxsQYu86TidDPxL9yHhpxBLE2wbTLW8XDO1hBZGANlnyBXXvOj2hNDj56sua2Wci0
 YL9Puh1BWMOPf858t62rY/btGued47XppVNVlwUDfgsH1XgDguBNPTE6OMSvhOSyHux2
 TTiDmGf9FXxu6psxyYTo93N7TZlNCVCFxRqkhM4slYtyUcQ5cBi0yjKd/nqqUrsOVg/Z
 IwKQtK5YUIHTCg3B6UNLc9qtnsnjyGBk572IWyGAiFyXJIWDh4cC4tFzEhVlRf7WM2AH
 Xidw==
X-Gm-Message-State: AO0yUKWeB6FsJ9VN0D5exdS3VOlVu1X3v5f2xbEI9iYQkJ4nRdPFdhQz
 cQ7HZ/6quj1ykL4NffThPekc4nOPXyM=
X-Google-Smtp-Source: AK7set99fLa+QCsE+WaWRDGxHZu+A8+0MlNPxutv5RXA+vhBhaw33wHVVnezivT/H0yLgb50ZxOFTQ==
X-Received: by 2002:a17:903:41c3:b0:19e:699e:9b64 with SMTP id
 u3-20020a17090341c300b0019e699e9b64mr23933457ple.65.1678290813286; 
 Wed, 08 Mar 2023 07:53:33 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 jx15-20020a170903138f00b0019468fe44d3sm9996583plb.25.2023.03.08.07.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 07:53:32 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v10 02/15] dma-buf/fence-array: Add fence deadline support
Date: Wed,  8 Mar 2023 07:52:53 -0800
Message-Id: <20230308155322.344664-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308155322.344664-1-robdclark@gmail.com>
References: <20230308155322.344664-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>, Matt Turner <mattst88@gmail.com>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Propagate the deadline to all the fences in the array.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 5c8a7084577b..9b3ce8948351 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -123,12 +123,23 @@ static void dma_fence_array_release(struct dma_fence *fence)
 	dma_fence_free(fence);
 }
 
+static void dma_fence_array_set_deadline(struct dma_fence *fence,
+					 ktime_t deadline)
+{
+	struct dma_fence_array *array = to_dma_fence_array(fence);
+	unsigned i;
+
+	for (i = 0; i < array->num_fences; ++i)
+		dma_fence_set_deadline(array->fences[i], deadline);
+}
+
 const struct dma_fence_ops dma_fence_array_ops = {
 	.get_driver_name = dma_fence_array_get_driver_name,
 	.get_timeline_name = dma_fence_array_get_timeline_name,
 	.enable_signaling = dma_fence_array_enable_signaling,
 	.signaled = dma_fence_array_signaled,
 	.release = dma_fence_array_release,
+	.set_deadline = dma_fence_array_set_deadline,
 };
 EXPORT_SYMBOL(dma_fence_array_ops);
 
-- 
2.39.2

