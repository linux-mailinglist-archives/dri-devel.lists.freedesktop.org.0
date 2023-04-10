Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C89F6DCC96
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 23:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B6F10E22E;
	Mon, 10 Apr 2023 21:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AC110E09B;
 Mon, 10 Apr 2023 21:06:20 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id q2so10647728pll.7;
 Mon, 10 Apr 2023 14:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681160780;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mw7PIDF324rj5JmiBp3Gcc4Fg2iuz1Tt4YTUd4kugdk=;
 b=a68QFzn1xixO15odT51vAd9u8PE/r3KgLLy3lgULiikNLxbWZc1f7JczaJVfAKkZQI
 pyUH/X3rpI0J+idTdkgL0jPeK847Y/6kFnjXjCA0hm/Uq7AL1NZYR4tfmge2JNjCq7oX
 rGVGYVunI3aFL+9V1gkWlzCAYY9qSrUoG543VJZfTf7GXytYKAGiCUHVb6CAo5J3Fgeq
 0GNZS4cgqC/53a+Q6ZjdEG7JHGkntMEBZruSqBH7tOCcycBWoWoMLzrwtSBTaJN0EIuL
 IW1cmGWfMw5Yhhl8uU/8rify1v7DkpSS1526TkroQrtSK1L4s0g6/CPS3nqbOA/5aT4B
 fOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681160780;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mw7PIDF324rj5JmiBp3Gcc4Fg2iuz1Tt4YTUd4kugdk=;
 b=sO6bTI35FWV6sigaUTtLnu2oTLkgW34nPbr4wExMlP6GsFq9ygQ3oZiHjpxMqOHbtg
 vVmN314Xn3ItwKCQOA2Emj11t+MLvM4TNYoc57PYepU7oUptHy/A4WG6PNIl9xKyucDw
 52Y2n+19fz7HjDDKRO6ChD9WMpH50tQdzlyfvBve7UjfsvGyJgz9tKW4/wYWyQ2cDqfL
 8cQ82FfTRdNYsM8C5MCdOCJ0ah4z1Ou9enjDToCKxXeSBCEzTUsACsayj1FTyF3X2kUz
 mC23J3EibmkL7FEQPpE7Eat3Q2OUIjf+b1ea2tCyEjSno1n21hauqF9G6/ej5aQvjAmT
 6gLQ==
X-Gm-Message-State: AAQBX9d/94vCRaXack0YwVKflgloriSWAyaWlEM6I+q3OhCxWDjlNUPb
 b/qzChz4DgcTso5LrhutTRrqms6MMCI=
X-Google-Smtp-Source: AKy350ZeqUgG7R7usICFzaYvDiaV5ajgBpKig+9DQsFboh4/q+hNdEvXbo7HjMPoHIBYsXHdB4ZACg==
X-Received: by 2002:a17:903:124f:b0:1a5:5e7:a1c9 with SMTP id
 u15-20020a170903124f00b001a505e7a1c9mr347008plh.61.1681160779826; 
 Mon, 10 Apr 2023 14:06:19 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 3-20020a170902c20300b001a647709864sm1812180pll.155.2023.04.10.14.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 14:06:19 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm: fdinfo memory stats
Date: Mon, 10 Apr 2023 14:06:05 -0700
Message-Id: <20230410210608.1873968-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Similar motivation to other similar recent attempt[1].  But with an
attempt to have some shared code for this.  As well as documentation.

It is probably a bit UMA-centric, I guess devices with VRAM might want
some placement stats as well.  But this seems like a reasonable start.

Basic gputop support: https://patchwork.freedesktop.org/series/116236/
And already nvtop support: https://github.com/Syllo/nvtop/pull/204

[1] https://patchwork.freedesktop.org/series/112397/

Rob Clark (2):
  drm: Add fdinfo memory stats
  drm/msm: Add memory stats to fdinfo

 Documentation/gpu/drm-usage-stats.rst | 21 +++++++
 drivers/gpu/drm/drm_file.c            | 79 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.c         | 25 ++++++++-
 drivers/gpu/drm/msm/msm_gpu.c         |  2 -
 include/drm/drm_file.h                | 10 ++++
 5 files changed, 134 insertions(+), 3 deletions(-)

-- 
2.39.2

