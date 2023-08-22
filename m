Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1666F784904
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 20:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3466710E3CE;
	Tue, 22 Aug 2023 18:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFAA10E3C9;
 Tue, 22 Aug 2023 18:02:34 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1bbc87ded50so31438855ad.1; 
 Tue, 22 Aug 2023 11:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692727353; x=1693332153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WHzqSThmy913fuGKpn4uXf/XGbug/XgU3SVaHteOTFw=;
 b=WPZoI+C/3/TAgQYvvcQN3m8uDX7PrfAY02kIgdL0Oz9khOGf+e8dzjXhTDYiVuc9Bk
 DUaUbyZ1NO3qataURGw8oCNtmXl5E9xzTCYEa8GS6krPVvd9IgMBN1dUteEHAWOV74pd
 Me89kMXmtLHqKx7okwKC3CWYKkUIA/gRf/diLBrvf7Q7AHME/4vDRy99D2eKMuA/r+bS
 9HYEbFHW7hu/1+TiAvjKZOp+TUQPGZnMAgbSRGaT4HI59DfoGKIvmWuYUqZpMxJBoaii
 6EY4fesEl1gdxAe7MZvh6USiVcO9QnZVbyZxsTMDg+DqOLSAeWfOTbp0atTPWyptegbg
 5XVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692727353; x=1693332153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WHzqSThmy913fuGKpn4uXf/XGbug/XgU3SVaHteOTFw=;
 b=Z/HN6UxH98R35JlmJ3ZS1bsjEN/8BIKDp2lZ3vMdtL6VRvXpEQ4CwIuGP1RpFWDCKt
 lbv33vHom0NzA21fov871YLkZN8JUHWNAIKjyLLHEJmXbYRIiMwQd+qqJENDRS3bVMd2
 M4ZuL+x/66eXcuY7wq+zU3q5AWlM9+8SsSs9yS6frwAllr6uq6J4t93bWcSmwMy+LwJZ
 v7tXd5cB+JNGWH5WiY39V1T6rjX/HJ2kYJdQO+h16t0DTuV0Wgv5rlZ1Y3RZ/Oih9oHZ
 dpqFXttDM16HHWeMdUf4AXV0xC1yVGuYtThvZasWEabpvNaz3SajygeElwCn1Oq2BXSR
 KwIQ==
X-Gm-Message-State: AOJu0YwKWEsoe551RHs/iNDLQLMXomB+/YAFHROCBNKbq6IOxHvp7C/w
 gzyR2hjm77SKs4m1/Fsl5q4l10kKCuQ=
X-Google-Smtp-Source: AGHT+IHJD1eQ/G8YKK/mS9Iz26wqBwKUfs1uHyXTORe1dqpKt/R9XL71xbqqG0PZqx/D0SSK0BXcMg==
X-Received: by 2002:a17:902:a414:b0:1bd:b8c8:98f8 with SMTP id
 p20-20020a170902a41400b001bdb8c898f8mr6778141plq.4.1692727353437; 
 Tue, 22 Aug 2023 11:02:33 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a170902e84700b001b898595be7sm9347196plg.291.2023.08.22.11.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 11:02:32 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 02/11] PM / devfreq: Teach lockdep about locking order
Date: Tue, 22 Aug 2023 11:01:49 -0700
Message-ID: <20230822180208.95556-3-robdclark@gmail.com>
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
index e5558ec68ce8..81add6064406 100644
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
2.41.0

