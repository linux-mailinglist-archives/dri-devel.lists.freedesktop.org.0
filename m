Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4589B6C1538
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 15:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B6010E5BE;
	Mon, 20 Mar 2023 14:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC70810E5BF;
 Mon, 20 Mar 2023 14:45:06 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 f6-20020a17090ac28600b0023b9bf9eb63so12623236pjt.5; 
 Mon, 20 Mar 2023 07:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679323506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ETBxoAbrNslCbg8f3yN7x2XxTKk/U7inb50D/YGBCKI=;
 b=AhmyuHGG/8/igp1P9vAPy7ZPfETRY0TeHFg6mYwFSEp4TLgeIwiFdiaf87Ez+cq6wm
 C0AW68YtTAXKI9AjPeHGpqoOKDOJViRoc8P16XiAr8I0ETNoavUX0aN2VHu+L3I9EpAx
 94JZm4mKBNIp2ZQQhCmhmIZ27ex95EPXwwPo+NBFflXpuSJp8pFQ/0voEc1oCOpHxoni
 8ULQEqZIlQ/lAaBa+oSmDtiumvwxw3FoD1C5KzD46aL5yq6V/jfmsoA6q9c/g0UnjK9Q
 +ppWuOEEO16lI8FMgRLUeqiUz80fjx84GrCxTDpQrCeJtaFq7ZgM+N/oZ2y/H2BMqU2+
 UzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679323506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ETBxoAbrNslCbg8f3yN7x2XxTKk/U7inb50D/YGBCKI=;
 b=kslKOTvOKd8IrI4o3RyxWfESR3bXPf3OsS9/iNnjJX5xH1eJ8W9yaOzj7MYdIF8Knt
 tHmtydHPuqBHNpmB/QHm3iHTSqCAwTpw4tgoeR8jYi/3h2aIqW3/KLH7zsVjwvrQyatI
 czUAlGmqoyhBBQ25SiIeWFffqiFLckf3+e34NOoec0Icp1TpEOeMTKw4E7qedNdxMtB/
 b+/nyqXBBjXgpo/jJYyfXLW+QHroBRtmdpp8N5nEUVmE+9nndDGKD+tt23YR0QR/bneW
 M+LLU+4eL/5Ahb4o6h3RUsavgk4TOneZyoKVj/2TRe4zKMbrFgjJdSSBevV/s4DHStvy
 28ug==
X-Gm-Message-State: AO0yUKWvjCQbplIItBxW28T0PK2QyV+3ZuP/6urCJJ/Qsh9Cv4KEoL33
 RRrFn4uQjx0p10pkKhAQtlGaSxlAH5s=
X-Google-Smtp-Source: AK7set9nBsw0YboqA8HGtkhw/1efSi+yfRsWBIzz4ldlha0ygO0WznYR00bgmoDEmsF5J6m1TLVXgQ==
X-Received: by 2002:a17:903:280c:b0:1a1:adb0:ed72 with SMTP id
 kp12-20020a170903280c00b001a1adb0ed72mr9170835plb.4.1679323506157; 
 Mon, 20 Mar 2023 07:45:06 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170902ee5100b0019339f3368asm6853516plo.3.2023.03.20.07.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 07:45:05 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 16/23] PM / devfreq: Teach lockdep about locking order
Date: Mon, 20 Mar 2023 07:43:38 -0700
Message-Id: <20230320144356.803762-17-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DEVICE FREQUENCY DEVFREQ" <linux-pm@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This will make it easier to catch places doing allocations that can
trigger reclaim under devfreq->lock.

Because devfreq->lock is held over various devfreq_dev_profile
callbacks, there might be some fallout if those callbacks do allocations
that can trigger reclaim, but I've looked through the various callback
implementations and don't see anything obvious.  If it does trigger any
lockdep splats, those should be fixed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/devfreq/devfreq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 11b774048bd2..5ce3bf9b59e7 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -817,6 +817,12 @@ struct devfreq *devfreq_add_device(struct device *dev,
 	}
 
 	mutex_init(&devfreq->lock);
+
+	/* Teach lockdep about lock ordering wrt. shrinker: */
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&devfreq->lock);
+	fs_reclaim_release(GFP_KERNEL);
+
 	devfreq->dev.parent = dev;
 	devfreq->dev.class = devfreq_class;
 	devfreq->dev.release = devfreq_dev_release;
-- 
2.39.2

