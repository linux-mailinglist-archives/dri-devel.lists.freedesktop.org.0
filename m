Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2FE76F552
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 00:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB61B10E682;
	Thu,  3 Aug 2023 22:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D2810E67E;
 Thu,  3 Aug 2023 22:02:23 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-564af1b3a9fso427158a12.1; 
 Thu, 03 Aug 2023 15:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691100142; x=1691704942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WHzqSThmy913fuGKpn4uXf/XGbug/XgU3SVaHteOTFw=;
 b=Ktbivmf1unMCf5Lfw6cU+ehdRCR9VHwUJJpt/z0XBJXfOLvfvaJbI1UkOCHdzcg/Gs
 9/o1P/B3x3FCEVNmkLWkumhFqN11In5fCIvCUUkeyMwMBvDxiX5iEJMaGbSz1LLSOprD
 rwsYXMy5+YRP8HJdfC7UMU1MBAlhEAW1kEThrsMj3NzYBbJj/TiUe2esFfezQ06YvAyt
 qiawcF5mHD1SRVUtc7hc+DK0y4NZc/CzCoUxcybbmTcUbdzKIxvj0TqAj1A1zGs3cwQB
 uAZqlu3/rvbZj8izwT2S/qH6DolxpUS2APHPEl6GYkXh8Kaw6vXwlly6BCRj9Y/g61ZR
 5ZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691100142; x=1691704942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WHzqSThmy913fuGKpn4uXf/XGbug/XgU3SVaHteOTFw=;
 b=Do8bsqbcIlmW9zQiiC22+xNqrsM92OvS9uMpnKbh9XSIz6i5jQbmxUnnyf5OYuN6/8
 XCCTy9vdXMgQUPMre4K/X35WQx/cvjnDO0l8NYfW/+4bWLIlp2nHSphxbwj1RBL1QBpz
 2/1hobeVoKpEK5aKXD4XHyJbqAdkv3pANnFujYSdnhE+7m4HXQD7V+n0lFtIuFbec1tT
 rR2aERN805btCY8EzYTdM2ifx3df6xpPpqwnfxlFXqxOWHW/H7O1CNMe+zxJXlzVWGpr
 gOQo3I3l+bMbC7mVLWhyhlF6m+6xa8WfJk09WHxlLsVsWaOPNRE9kXkWv3FAFTKLn2+D
 D6Ew==
X-Gm-Message-State: AOJu0YykxPyfLHKT+54IWS40zOGC1+tHFKGjw7r6Uk2qCDmLRZQNRm6i
 IZB1Nsd++611ieOrFlLL+DJDb66kf6k=
X-Google-Smtp-Source: AGHT+IG0EMAk3QzLGHjyK1kBBG+MKsuNGPfVOyaz6A+S75XyvoJ077wEJA+SRLoCx2VFa2/q3zovCg==
X-Received: by 2002:a17:90a:6f23:b0:268:f2e:b480 with SMTP id
 d32-20020a17090a6f2300b002680f2eb480mr27152pjk.11.1691100141639; 
 Thu, 03 Aug 2023 15:02:21 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a17090a654300b002641a9faa01sm2946499pjs.52.2023.08.03.15.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 15:02:21 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/9] PM / devfreq: Teach lockdep about locking order
Date: Thu,  3 Aug 2023 15:01:50 -0700
Message-ID: <20230803220202.78036-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803220202.78036-1-robdclark@gmail.com>
References: <20230803220202.78036-1-robdclark@gmail.com>
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

