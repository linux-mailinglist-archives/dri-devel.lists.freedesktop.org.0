Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6874650C07A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 21:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F4E10E542;
	Fri, 22 Apr 2022 19:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DA110E2B9;
 Fri, 22 Apr 2022 19:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650656740; x=1682192740;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=RypWT1/MsqHjIYV/OOjxVaWMMishkMFYSFWTZmDxdHY=;
 b=VIskucCAt9/kTTIGig2+QOEiUJfS5ImNw6ENmTRu32i6gAGjsoxvgvTQ
 HEog/nH6LAOvBnAX1Afn4CbASGpLtc0LX3/G4KQiTtRiBpXc+dcGC3gOQ
 5ovx8+I+DYhfAgCwuqyGXxz8ODmnDMlumx0M4aHnIa+/uWijj7KMVKURj o=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Apr 2022 12:45:40 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 12:45:40 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 22 Apr 2022 12:45:39 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 22 Apr 2022 12:45:39 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v2 0/3] Separate wb_idx and intf_idx in dpu_encoder
Date: Fri, 22 Apr 2022 12:45:26 -0700
Message-ID: <1650656729-8170-1-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: markyacoub@chromium.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As promised here [1], this is a follow up change to separate out
wb_idx and intf_idx for better clarity in dpu_encoder.

This also helps to easily handle boards which do not have a physical
display but can still be validated using writeback interface.

In addition, this also takes care of adding wb_idx to existing DRM prints
and traces.

Re-posting this without RFC tag to plan to absorb this in the
DPU writeback series [2]

[1] https://patchwork.freedesktop.org/patch/482637/?series=99724&rev=2#comment_868460
[2] https://patchwork.freedesktop.org/series/99724/#rev3

changes in v2:
	- drop the RFC tag
	- add the check for phys->intf && phys->wb
	- squash changes 1&2 of the previous series

Abhinav Kumar (3):
  drm/msm/dpu: introduce a wb_idx to be used for writeback interfaces
  drm/msm/dpu: add wb_idx to existing DRM prints in dpu_encoder
  drm/msm/dpu: add wb_idx to DRM traces in dpu_encoder

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 133 +++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   4 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |  26 ++--
 5 files changed, 101 insertions(+), 74 deletions(-)

-- 
2.7.4

