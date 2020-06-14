Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2031F8F9E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6FD6E204;
	Mon, 15 Jun 2020 07:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4C96E0E4
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 06:27:37 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id m81so14516081ioa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 23:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Pr9n4V8YJiXG+OQICtAk6o8sqO5Fm3+cCzZ+CtFDMKY=;
 b=aCxS2eGX+Ijgd2aSOJAZ0j+Xd/2Ni3mUe2bPVSeVpcqaLN05++JHFaQ+tcPnM5spHV
 OiPsQF11IErXnCbYOl86IYeo0Df7FeaPxui4jd3H/Ahu8PdzEKfEAiKuTBaeZLOw8qLj
 AN462QCPiiAwnF+Er0dVXpB6SpbF1+bO5TziaIRdM/7S63sdKzT2OfB8Dal+6fh/Sv+U
 ud+4NA4Qly4/EVM4VR9ilH9nDqzp/z36k/GzOdARN9H+oAtOSM/+XYbUjoG0oLLhm5AU
 P33hHC67x8C0P8yzI/W4sgFY8KX6GoHsxNcZ5Xq9/nYcuCNneW3S0l/TbH2ns7Zdaa62
 dd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Pr9n4V8YJiXG+OQICtAk6o8sqO5Fm3+cCzZ+CtFDMKY=;
 b=nTreUsOYs0juw7JCLCTN7XujUCrXOsP1BCrpTM3HPca4Gm0glRGBx6zJ1n/KRiTFu7
 rs2VEsfkjSF7IiH3nghYj0cIgo/LlxMaqCdB7x7Lq9YwDp/6W8AejqB1VGQvtSuBEAHG
 E2yxVqPm+SGg6712LHQOT7EcJ8sgSR1UDb+TRmeYzarZuSR0n/uaJ2p9W+0oG4fstddz
 oQNjbsrc6XHlCV0/bNPRks2TwNiRBZ5x8pbYbtmjsY/hviHvEem3pR6a4M4HHhYzblPX
 o4kJmRI07LVHOAiatkTLAzyWS/V22oKhM0qAZ+/y/4u3Qg50b8IvoIhqXmwVyW9mDMxF
 TVvw==
X-Gm-Message-State: AOAM532fAsHcxrTs/KWmPHuCPGAkkDYewIhEM9itFd2LN6tEDGdYbQ/b
 IMcdTyRESkiW3OS0mUETdFg=
X-Google-Smtp-Source: ABdhPJyF7zdFiHw1R+FvBcK1YMq5q5n/oke5Vs1Nd1IDb8neWJZtcKxPDxewjLW0gZuOITzL9Lupcg==
X-Received: by 2002:a05:6602:809:: with SMTP id
 z9mr21441256iow.79.1592116056556; 
 Sat, 13 Jun 2020 23:27:36 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
 by smtp.googlemail.com with ESMTPSA id b22sm5769329ios.21.2020.06.13.23.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 23:27:36 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panfrost: fix ref count leak in panfrost_job_hw_submit
Date: Sun, 14 Jun 2020 01:27:30 -0500
Message-Id: <20200614062730.46489-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: Navid Emamdoost <navid.emamdoost@gmail.com>, emamd001@umn.edu, kjlu@umn.edu,
 wu000273@umn.edu, smccaman@umn.edu
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

in panfrost_job_hw_submit, pm_runtime_get_sync is called which
increments the counter even in case of failure, leading to incorrect
ref count. In case of failure, decrement the ref count before returning.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 7914b1570841..89ac84667eb1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -147,11 +147,10 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 
 	ret = pm_runtime_get_sync(pfdev->dev);
 	if (ret < 0)
-		return;
+		goto out;
 
 	if (WARN_ON(job_read(pfdev, JS_COMMAND_NEXT(js)))) {
-		pm_runtime_put_sync_autosuspend(pfdev->dev);
-		return;
+		goto out;
 	}
 
 	cfg = panfrost_mmu_as_get(pfdev, &job->file_priv->mmu);
@@ -184,6 +183,9 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 				job, js, jc_head);
 
 	job_write(pfdev, JS_COMMAND_NEXT(js), JS_COMMAND_START);
+out:
+	pm_runtime_put_sync_autosuspend(pfdev->dev);
+	return;
 }
 
 static void panfrost_acquire_object_fences(struct drm_gem_object **bos,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
