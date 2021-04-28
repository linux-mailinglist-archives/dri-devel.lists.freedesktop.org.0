Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1828936DF8F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 21:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873626E134;
	Wed, 28 Apr 2021 19:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E506E6E134;
 Wed, 28 Apr 2021 19:33:27 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id s22so24372104pgk.6;
 Wed, 28 Apr 2021 12:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nIhpTOwyw9uU2y8Ldiu9V72cANVrbUwFZO9n58uo5jI=;
 b=NJWSLemsb2j+BLaZx79NQ5gyXULgyE1EBGlozSvCBf+ynkelb3Nh4SkKqEbpl3GPlH
 EWeHW0Pp5x/7S2fQI8azP+krCg4/YN46z4QmbCJOEapuJ5y27eDv5qa9ISh9fvAeX77+
 4pK1dpcv3FRL1X1eK23yXhRkaS60i7/B68JfHXY77uB0Dsiy6qeqtZpVB3YjooKPke2z
 J2t8sR2o0YzcO1xmLMXsbQCWB/qTwvnInd5hFDxJkC+StiM5Hpim8SIwd8q2vc/fMeJM
 nujJmgo3CwO+ApXPZIZZ+mvcFgcwO9rVJV45PhgnLv1pd+dcZSq17swbLJmBirJN9Bqf
 OLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nIhpTOwyw9uU2y8Ldiu9V72cANVrbUwFZO9n58uo5jI=;
 b=d3swRhpjPM6ad9out0FKZjLH1LjKOiECSeE05qUjzvr1niXGLQueMPRDdyA7v1hySV
 Hq7c2xoPPkP/3hI5pHN4a60DUABbdjH67hTHd011VNkZw+TYei01Ud3QSo0/Hxth3BSY
 Zy9tttExC0TpbiMcjrUSjvPOVLL3l6OujRnDux/LkmZAaTEurgR3KMR/mZp4VZzWSMgf
 US+0Y6ay7cFqIVbqTYdnOb+avgO/x7glg5EHjI4Vfo61tW4TvJdJ/Z+YsK50uCZoMvpz
 u9LV2bL1AyeYYj7SG4Iogpjkid/gmfAYabhNc3Zxr1nCMU2ilPqtieCU5webCl7BBIIt
 0TYg==
X-Gm-Message-State: AOAM533tBscH3TTmNfVsZ44rYFhcepbBdgXrirh4FT9IERIX2Qvo5wcA
 biXS5ODVBcV1YnhUv4tE9qpsyNTF6j4=
X-Google-Smtp-Source: ABdhPJxTW6ITsgYJ7en/J7NHadpEgbEHdg9X22l8P7f1/wFTXDuAztqmD67uEppIvXmCbJl03aeoag==
X-Received: by 2002:a05:6a00:8a:b029:260:e095:8581 with SMTP id
 c10-20020a056a00008ab0290260e0958581mr30404666pfj.43.1619638406750; 
 Wed, 28 Apr 2021 12:33:26 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 q25sm390552pfs.152.2021.04.28.12.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 12:33:25 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm: Smooth out ringbuffer-full handling
Date: Wed, 28 Apr 2021 12:36:47 -0700
Message-Id: <20210428193654.1498482-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jonathan Marek <jonathan@marek.ca>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dave Airlie <airlied@redhat.com>, Jordan Crouse <jordan@cosmicpenguin.net>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

With some recent userspace work to allow more rendering to be merged
into a single SUBMIT ioctl, I realized we have some sharp edges around
running out of free ringbuffer space.

1) Currently we only flush once all the cmds (or rather IBs to the cmd
   buffer) are written into the ringbuffer.  Which places a restriction
   that the submit must fit in the rb.  Which means slightly less than
   2k cmds per submit, after accounting for some of the other packets
   needed.
2) Currently, for devices that use RPTR shadow, we only write the
   CP_WHERE_AM_I packet at the end of the submit, so we aren't seeing
   partial progress that the GPU is making chewing through previous
   large submits
3) We spin for up to 1sec waiting for rb space, and then give up and
   proceed to overwrite the packets that that CP is currently chewing
   on.. which goes badly.  If userspace is submitting >1sec of work
   per submit ioctl, this means we spin for a long time, and then
   corrupt the rb anyways.

This patchset doesn't completely address #1.  And in general we don't
want to be uninteruptably blocking for so much time.. but this will
require some more extensive changes.

What it does do is address #2 by periodically emitting a CP_WHERE_AM_I,
and #3 by adding detection and error handling for rb overflow, returning
-ENOSPC when that happens.

Rob Clark (2):
  drm/msm: Handle ringbuffer overflow
  drm/msm: Periodically update RPTR shadow

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 32 ++++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 30 +++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 24 +++++++++++++++++-
 drivers/gpu/drm/msm/msm_gem_submit.c    |  7 +++++-
 drivers/gpu/drm/msm/msm_gpu.c           | 33 +++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.h           |  2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h    |  5 ++++
 7 files changed, 117 insertions(+), 16 deletions(-)

-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
