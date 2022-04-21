Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD4850AA4A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 22:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653A310E0FF;
	Thu, 21 Apr 2022 20:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2760310E0FF;
 Thu, 21 Apr 2022 20:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650574123; x=1682110123;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=DHQXQMD0+ttB1gsHAOfHJqjJxFGWIUydn6S6qP2jqGM=;
 b=wQ49v8y+FKKGgyvuQ5a6esNPaNA2A0LhvST6ubr1l0uUFvikogeqFBwR
 C95bsQ4LM0PStxIAJGq1E/zu2ew7c2Lwp3mfRNgCMFSqnYSrnPANGwpMX
 PiI1sY+1dKq1Ro0HSN6YvUy3cns3Ycf6s7DBQE0EQYf+sVhOKkxuoAzGo E=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 21 Apr 2022 13:48:42 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:48:42 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 21 Apr 2022 13:48:41 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 21 Apr 2022 13:48:41 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [RFC 0/4] Separate wb_idx and intf_idx in dpu_encoder
Date: Thu, 21 Apr 2022 13:48:28 -0700
Message-ID: <1650574112-25294-1-git-send-email-quic_abhinavk@quicinc.com>
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

Currently posting this as a RFC to get feedback on this approach and if
the reviews are positive, I can easily absorb this in the DPU writeback
series [2]

[1] https://patchwork.freedesktop.org/patch/482637/?series=99724&rev=2#comment_868460
[2] https://patchwork.freedesktop.org/series/99724/#rev3

Abhinav Kumar (4):
  drm/msm/dpu: introduce a wb_idx to be used for writeback interfaces
  drm/msm/dpu: start using wb_idx in dpu_encoder_phys_wb
  drm/msm/dpu: add wb_idx to existing DRM prints in dpu_encoder
  drm/msm/dpu: add wb_idx to DRM traces in dpu_encoder

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 125 +++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   4 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |  26 +++--
 5 files changed, 93 insertions(+), 74 deletions(-)

-- 
2.7.4

