Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29326389588
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 20:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FDF6EE51;
	Wed, 19 May 2021 18:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54CA89A86;
 Wed, 19 May 2021 18:35:08 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 o17-20020a17090a9f91b029015cef5b3c50so3997150pjp.4; 
 Wed, 19 May 2021 11:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OXGExEV9DKzHJXkbbNu+OVKImQdQyVv51ZhcABCoj+c=;
 b=VZnQB3TxN9YgO/dIaFVc2+8H4/rfLP27UtLLUyHSQnGpnObGKzI49EYOFNj55HB1Ib
 KDN3mpnAfRCZWzYXRhCZfmOHesq7zvueE9s9hkhFZvaRmd7Dan9VeXNl9u+jLqheXsbV
 XqOPaKcxraAO9TpALhWIaLd0hW/+IR3k3yhcH6ScPBCHyejoghtRjIM2TkjFPHt8qOCZ
 cPIFpSi8EtmD5buBu4Uc47iP7kXsMzEu8/wuwHyhxePBEdKVQ/v9URBCJSlPZdAr4pHa
 RI3v65vcbzc2BQ1Z6MVuOCjZOaCS7NQq/ygVahpH8PbmiyFbGcH+pfW9xTrk1y7v3GR3
 2olQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OXGExEV9DKzHJXkbbNu+OVKImQdQyVv51ZhcABCoj+c=;
 b=bbgafnjDTDdXnTNNxXvHDtZxD8rtoZtKUxkCkqn92GEudPzIH4eFy9EnYZ8TEjFYap
 6ip/yyA8KPTGTGwjT/mzP5nAhabOUEQp8fVvRSXc6eWcDkHLR+tLe77uIlvqDMLjd3i8
 oMG1Jt7XILOPqYfx/VDy+rulwD8zCpR2UE0ErM65QEZCZ5PHyzP4Z4H4HpCfwKa7EnKf
 6WG9eYZ/5C6w06tdJjGUDV+vY9NxEIs/aFH5qjZu0H82SXSwY48Mka06iqe5MsDXCC8R
 tblSCAY/4g64py2ikcnDKFZoZJjuHfICzRgKQPD1XoYKqZpb6GlAx+C/v9htULW121Ru
 zVXg==
X-Gm-Message-State: AOAM533cQk69j1tVpjWhk9pvK/cG/q6dBmFbWItcZH+y3FGjiMjO4B1b
 tOcgCF2lYKuEjCMBCNFJiRPIpHtz4m1v0w==
X-Google-Smtp-Source: ABdhPJzT41yLbhtZB7tJviu8pahUyGJsXxTpFBsuKRqM6hf3433QzAmTmbncbwVd3iCvrem4aPOSdA==
X-Received: by 2002:a17:90b:1041:: with SMTP id
 gq1mr697596pjb.224.1621449307682; 
 Wed, 19 May 2021 11:35:07 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 k7sm4759153pjj.46.2021.05.19.11.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:35:06 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 0/3] dma-fence: Add a "boost" mechanism
Date: Wed, 19 May 2021 11:38:51 -0700
Message-Id: <20210519183855.1523927-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno@lists.freedesktop.org,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In some cases, like double-buffered rendering, missing vblanks can
trick the GPU into running at a lower frequence, when really we
want to be running at a higher frequency to not miss the vblanks
in the first place.

This is partially inspired by a trick i915 does, but implemented
via dma-fence for a couple of reasons:

1) To continue to be able to use the atomic helpers
2) To support cases where display and gpu are different drivers

The last patch is just proof of concept, in reality I think it
may want to be a bit more clever.  But sending this out as it
is as an RFC to get feedback.

Rob Clark (3):
  dma-fence: Add boost fence op
  drm/atomic: Call dma_fence_boost() when we've missed a vblank
  drm/msm: Wire up gpu boost

 drivers/gpu/drm/drm_atomic_helper.c | 11 +++++++++++
 drivers/gpu/drm/msm/msm_fence.c     | 10 ++++++++++
 drivers/gpu/drm/msm/msm_gpu.c       | 13 +++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h       |  2 ++
 include/linux/dma-fence.h           | 26 ++++++++++++++++++++++++++
 5 files changed, 62 insertions(+)

-- 
2.30.2

