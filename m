Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FF218FFDB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 21:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A49D6E378;
	Mon, 23 Mar 2020 20:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4284F6E378
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 20:51:58 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j17so15473963wru.13
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 13:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4m+QCDipUwgT7eT03M7lgNnz8yVElo2MxbD9cazk2Vg=;
 b=PP315hqXpqGOcNe+ZhKezm6MgfUiX3druYgMvfjGVbVXC8ehXJ/hGCXsXgCcDcHOZJ
 Xg/iSsBzZMQMuZ2CbZ2ixIe6xt+anxJ89La3mZWV0saZYunsjbfo/NvIZaXQPrdCVFks
 UPeYxUHU2dONK052nfH7YGjqA8ie106TDUL/jno9pn5OCxDXqz9wZW85dp1y+x10wX7v
 X7z/3ytK8U6M9Itt8fdfXIIUWOv8WxO1w5g+iH0I+82PkactCVHP/hIhQdbRpdJnj+3W
 x1hDX97D39mcYoqWsgyRmSMLNymf14RhSOBLY0QZC3il086ZxbAiImepklRJd2nOrV2U
 IiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4m+QCDipUwgT7eT03M7lgNnz8yVElo2MxbD9cazk2Vg=;
 b=U02tIc2JOO5kz9VbJvLHy+2Yz1fSBnoDVIcpMuYORdQ4W/32EvJ0WYw0uAHRR9iVIM
 juW4XZ0q7hBWax927czk2JRXW39v24Ik4pFuG+HsLocJkqYjqI2vi4VgSLhvYZiiwtEf
 vL7eJB6mTbReGthyncLbUPiq7YqFU+lV90biKQVmg1wvg1twK13305M/1OvZk3TzVgnj
 rBM+Yln/UqFwBb+lX0ctokwRsT8U+CqBO6qPsa+mcGMbMiADU63Bq+1mGSiSdqP/dke9
 gKtah58S+HaiyrRnCXdmxBCz25MbhMuvgHkgab6WbhBgZVqC1I/l2NSSo2pHkwupuGa7
 xTeQ==
X-Gm-Message-State: ANhLgQ0ZmKoil/CLxp1jPxGrM57MqT1D/9ssIyLD0+m9GI3DQgr1RLCB
 YqyaKWORLJcBCu3Ozzt4AqNcTlYaF+A=
X-Google-Smtp-Source: ADFU+vvdhWRZ8fC4W0WB+dUKfnA4CfLAVo0uEnJ5oHl6aue6wj0aA4MMzeQZexZmriwVYAImy4esQg==
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr34253129wrs.39.1584996716597; 
 Mon, 23 Mar 2020 13:51:56 -0700 (PDT)
Received: from wasp.lan (250.128.208.46.dyn.plus.net. [46.208.128.250])
 by smtp.googlemail.com with ESMTPSA id f23sm1133315wmf.1.2020.03.23.13.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 13:51:55 -0700 (PDT)
From: Shane Francis <bigbeeshane@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] AMDGPU / DRM Fix mapping of user pages
Date: Mon, 23 Mar 2020 20:51:35 +0000
Message-Id: <20200323205137.136530-1-bigbeeshane@gmail.com>
X-Mailer: git-send-email 2.26.0
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
Cc: bigbeeshane@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch set is to fix a bug in amdgpu that results in
a crash when dma_map_sg combines segments. There are 2
shortfalls in the current kernel.

1) AMDGPU assumes that the requested and created segments
   from dma_map_sg are equal

2) drm_prime does not allow for setting the segment length
   via the correct dma macro

Shane Francis (2):
  drm/prime: correct logic for mapping sg to arrays
  drm/amdgpu: fix scatter-gather mapping with user pages

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  7 +--
 drivers/gpu/drm/drm_prime.c             | 71 +++++++++++++++++++++----
 include/drm/drm_prime.h                 |  5 ++
 3 files changed, 71 insertions(+), 12 deletions(-)

-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
