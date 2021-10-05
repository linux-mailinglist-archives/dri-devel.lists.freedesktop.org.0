Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AB2422BFB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 17:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210956E422;
	Tue,  5 Oct 2021 15:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D592D6E40D;
 Tue,  5 Oct 2021 15:11:54 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id v11so7464184pgb.8;
 Tue, 05 Oct 2021 08:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QSrcQ531lYvMDyqtMmSNSg1D9eOHYmXdh6Sn4g0VZLQ=;
 b=LE+nGxihu74oC3P/yXCbRUT8joVuLjedGgQjvKmK8f3RDbhsFz2Vi3/sS9u9wXnGcX
 K2GgrTHQM2kjOTjbHfEDKSOGaIQ95GlbZ/QF327Ospm5XEbm5TPf6490GoZyuWQ1E/y+
 IeJKKHDWKXVrwoDC9bWA7CsdXkqo8n4aTYFKKesOpEGc2WcdjcTgXydrApYSun1UVsgw
 iY76WfnFfYcz9KR5eDOdItpIDV0s68u3xP+x9H5iDGJotHLBIZgkU1UDs/KH+Jtv0Uja
 Hd84BWPjshr5CEK7HmMKnP/2imJsZdYLGNfIk8+cWZQTHfe+FZ/z7BP+9G5U4gsshMEp
 MPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QSrcQ531lYvMDyqtMmSNSg1D9eOHYmXdh6Sn4g0VZLQ=;
 b=msLJbhRf/pMqWHEFI1DTpCda/mQdbMNuuc2+rNtq2fC0ZM3kmgUn8gHZPYN4LS9Es1
 mfwHNKTtX3lwTY0JTYlUpR15MJJAkR9Q/1SKD1a92MJCU0AEK+aKF+yGafYkSMM45pw1
 ZmlGSwvkkoV6wGYove7n66nJM8tjmdRD5gFxTpVZPH2R/CzlItjpVvE7OZgm8GN5c67K
 hAGHaz90Zq9jBYZFUDq+T9rfw93r/9pVAFJ3VAAWGah9jSpHSf8mcIVvRvU5d5uXcMTH
 3r65Knz0JETzcmdwaP/0MV56M/b3n3XRvIT1ZVQrpF0+3p+e4thIBYjDc0FTrapKMg+l
 T+XQ==
X-Gm-Message-State: AOAM530ovnameaqpKDH4IZCBaigFKxgUE7yMIrZqOwmBvvEqGdLX76jl
 nOaF3VmXuZdczdL/tG1JCdVop25OpSk=
X-Google-Smtp-Source: ABdhPJxO3G+HWzM6JzFUJostwno3QxJkFsVc0ojvp/XHIKEdzTvHkYlD/6vx1y3wEb8mXk5HXIWGFA==
X-Received: by 2002:aa7:828c:0:b0:44c:28d1:46b9 with SMTP id
 s12-20020aa7828c000000b0044c28d146b9mr19508978pfm.43.1633446713563; 
 Tue, 05 Oct 2021 08:11:53 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 k22sm18388032pfi.149.2021.10.05.08.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 08:11:51 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Douglas Anderson <dianders@chromium.org>,
 Georgi Djakov <quic_c_gdjako@quicinc.com>,
 iommu@lists.linux-foundation.org (open list:IOMMU DRIVERS),
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Joerg Roedel <jroedel@suse.de>, Jonathan Marek <jonathan@marek.ca>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
 linux-kernel@vger.kernel.org (open list),
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Sven Peter <sven@svenpeter.dev>, Yangtao Li <tiny.windzz@gmail.com>,
 Yong Wu <yong.wu@mediatek.com>
Subject: [PATCH v2 0/3] io-pgtable-arm + drm/msm: Extend iova fault debugging
Date: Tue,  5 Oct 2021 08:16:24 -0700
Message-Id: <20211005151633.1738878-1-robdclark@gmail.com>
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

This series extends io-pgtable-arm with a method to retrieve the page
table entries traversed in the process of address translation, and then
beefs up drm/msm gpu devcore dump to include this (and additional info)
in the devcore dump.

The motivation is tracking down an obscure iova fault triggered crash on
the address of the IB1 cmdstream.  This is one of the few places where
the GPU address written into the cmdstream is soley under control of the
kernel mode driver, so I don't think it can be a userspace bug.  The
logged cmdstream from the devcore's I've looked at look correct, and the
TTBR0 read back from arm-smmu agrees with the kernel emitted cmdstream.
Unfortunately it happens infrequently enough (something like once per
1000hrs of usage, from what I can tell from our telemetry) that actually
reproducing it with an instrumented debug kernel is not an option.  So
further spiffying out the devcore dumps and hoping we can spot a clue is
the plan I'm shooting for.

See https://gitlab.freedesktop.org/drm/msm/-/issues/8 for more info on
the issue I'm trying to debug.

v2: Fix an armv7/32b build error in the last patch

Rob Clark (3):
  iommu/io-pgtable-arm: Add way to debug pgtable walk
  drm/msm: Show all smmu info for iova fault devcore dumps
  drm/msm: Extend gpu devcore dumps with pgtbl info

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 35 +++++++++++++++++-----
 drivers/gpu/drm/msm/msm_gpu.c           | 10 +++++++
 drivers/gpu/drm/msm/msm_gpu.h           | 10 ++++++-
 drivers/gpu/drm/msm/msm_iommu.c         | 17 +++++++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  2 ++
 drivers/iommu/io-pgtable-arm.c          | 40 ++++++++++++++++++++-----
 include/linux/io-pgtable.h              |  9 ++++++
 8 files changed, 107 insertions(+), 18 deletions(-)

-- 
2.31.1

