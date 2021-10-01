Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EED6041F3F2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA71D6EE93;
	Fri,  1 Oct 2021 17:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11216EE91;
 Fri,  1 Oct 2021 17:54:19 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id j15so6799254plh.7;
 Fri, 01 Oct 2021 10:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uQDbBJS+Pg0d4LIaXfAoFYyb0c7LTGnDvYbDlrtg5qQ=;
 b=ip3wXWNQS0Beu5UYJVUfLISQqUHBt9SoJ1Lw108jWrfwlRHK0QpgGfi0XaAV/ENwoL
 RtDjAuYPId2c8bbs7XnMwdXMabgSCga9rIi9aVCKf4akB7n3QIaxpb48572/CV2rbVEG
 1rp40J3QXGa0CwaTgzPnoU04TWa1Vtwp7qPDDWQX+gWACtpM3e3xGw4lDAuVn41mfZ+S
 wR+fB2JUEXCFH+uH1dvnQl13S2GxGBcWE48eI/zKGdn5L/iIb8YZJG4Fu49Yg3ZJTWjs
 2maFNF+acIO6A2b/oSJ/1htS0wYnbHNn6pJOibAD6YE6RRoGmAhpC0wNQpeivOc1mMuz
 YGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uQDbBJS+Pg0d4LIaXfAoFYyb0c7LTGnDvYbDlrtg5qQ=;
 b=B371/D56YLr1zoTDnn+d+qJfqjwdwjTtElpEB86R+UUBDfDURy6d9xK676V3cvtPkS
 lsXqwlq3eJ6szJxe2nUN/ROMkJpCXkxZESFQtNOTo+a5fq5CuE17egI23ot7KmANjNOu
 Ptd0/jjbOxjSssTjYoMOF/NBRBW2AIpT4ail0+x3d3ISHSJ3pGci5r4Y7/8fF2/VVKCi
 7TCyi7wjNVHG/S3a3C526zt0Ouk1k+rxkzztHQgznUCQWgSGFGi/chmYQ6n1Jky7f+hu
 11RSkerrn1gJyYu4u57TBSqXML92gREBSVa3SmLy6q357oEAXl6t53lq2y+WCNRL3dzO
 H5jQ==
X-Gm-Message-State: AOAM533T+ziEcTO1dhcZH2rfcRmzWG92J4dzIS3uSA1x12tYUl7/KsP3
 nN5f4FNCaSWvZ8aN8POKBOr4JEo8DMo=
X-Google-Smtp-Source: ABdhPJzgQWrQm0kP46xsgXTsNbipifbZEqXJ0hDQmhTkph+E6DAYD3ldqDDklx6m+tOiQ7y+GaslBw==
X-Received: by 2002:a17:902:9895:b0:13c:94f8:d74b with SMTP id
 s21-20020a170902989500b0013c94f8d74bmr11916097plp.20.1633110858434; 
 Fri, 01 Oct 2021 10:54:18 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id x7sm80480pfr.58.2021.10.01.10.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:54:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Rob Clark <robdclark@chromium.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/2] drm/msm: Un-break multi-context gl
Date: Fri,  1 Oct 2021 10:58:54 -0700
Message-Id: <20211001175857.1324712-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Userspace is expecting that a single thread doing rendering against
multiple contexts does not need additional synchronization between those
contexts beyond ensuring work is flushed to the kernel in the correct
order.  But if we have a sched-entity per-context, and are not using
implicit sync, GPU jobs from different contexts can execute in a
different order than they were flushed to the kernel.

To solve that, share sched-entities for a given priority level between
submitqueues (which map to gl contexts).

Rob Clark (2):
  drm/msm: A bit more docs + cleanup
  drm/msm: One sched entity per process per priority

 drivers/gpu/drm/msm/msm_drv.h         | 44 -----------------
 drivers/gpu/drm/msm/msm_gem_submit.c  |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h         | 66 +++++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_submitqueue.c | 68 +++++++++++++++++++++++----
 4 files changed, 123 insertions(+), 57 deletions(-)

-- 
2.31.1

