Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FDC25CF36
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 04:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2EBB6EA53;
	Fri,  4 Sep 2020 02:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7DD36E21A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 02:03:24 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1599185004; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=HLRG701VY73XybmwQ/I+cBnN7Du1gCo7YJN50TYK7Es=;
 b=xRnFsLvqec9U6Jt5wfPVUWPSEs5SOhpHHh7zBxzqCWS9/0qzNlsMPwPrgJovpE2+0tunhgpr
 vKHFdMDo6elXmwLnuEDPDQB+ivTrIyTcRSQvkzE4+pHWCTKqWAyiIMGYJPC0zhK1W6355cTU
 xWL5bAYnE8iIcEC8DOmvN2DJsPM=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f51a06b380a624e4dc14816 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 04 Sep 2020 02:03:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6E6F9C43449; Fri,  4 Sep 2020 02:03:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BBFFCC433C9;
 Fri,  4 Sep 2020 02:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BBFFCC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/4] drm/msm: Protect the RPTR shadow
Date: Thu,  3 Sep 2020 20:03:09 -0600
Message-Id: <20200904020313.1810988-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Sean Paul <sean@poorly.run>, Wambui Karuga <wambui.karugax@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sharat Masetty <smasetty@codeaurora.org>, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Adreno GPUs there is an option to shadow the RPTR register in GPU accessible
memory. The shadow memory allows the kernel driver to query the value of the
RPTR for each ringbuffer even if it is preempted out or if the GPU is turned off
during aggressive power management.

There are risks to using the RPTR shadow. If it is in GPU accessible memory it
could be read or written by any GPU operation. All versions of the GPU hardware
except A650 requires the shadow to be in unprivileged memory which opens it
to risk.

This series does two things. First, it marks as many buffers as possible as
privileged. For a5xx these are some preemption buffers and on a650 this includes
all global buffers (such as the ringbuffer and memstore). I've sent these
patches before but they tie in well with this series so I've included them.

Then we disable the RPTR shadow across all targets. For all targets except for
a5xx the RPTR shadow isn't needed so there isn't a loss of functionality. a5xx
does need it for preemption so that has to be temporarily disabled.

Later changes will re-enable the shadow for those targets that can safely
mitigate the risks.

Jordan Crouse (4):
  drm/msm: Split the a5xx preemption record
  drm/msm: Enable expanded apriv support for a650
  drm/msm: Disable premption on all 5xx targets
  drm/msm: Disable the RPTR shadow

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c     |  5 +++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c     | 10 +++++++++
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c     | 10 +++++++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 14 +++++++++---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h     |  1 +
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 25 ++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 13 ++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 27 ++---------------------
 drivers/gpu/drm/msm/msm_gpu.c             |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h             | 11 +++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c      |  4 ++--
 11 files changed, 85 insertions(+), 37 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
