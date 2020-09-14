Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D01526990E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 00:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F315E6E7F1;
	Mon, 14 Sep 2020 22:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E12D6E7E5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 22:40:45 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1600123250; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=3trGlBAsrqKw/gr2Zpkc3eqT35HTCBYAGTjHtSXQM0Q=;
 b=N9KCgl+L9qzKEk1Jmni1ZOqY/FWlbgIteKLQ8jrbrjd1f958RryKdVhMtuV6JEYKBeDAXF4j
 4DZzUglWwJzPmtt51QkBEECFbfwf07fmBP1Un5jIbWZMIB0Uho8uqHFCoO+Y6NyAQzSIjK/b
 UWqjJkhE9ozToyetuScf15vPt4U=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f5ff1604f13e63f04d4b780 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Sep 2020 22:40:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 31D4AC433FE; Mon, 14 Sep 2020 22:40:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1351FC433CA;
 Mon, 14 Sep 2020 22:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1351FC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/3] drm/msm: Add support for the WHERE_AM_I opcode
Date: Mon, 14 Sep 2020 16:40:20 -0600
Message-Id: <20200914224023.1495082-1-jcrouse@codeaurora.org>
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
Cc: Wambui Karuga <wambui.karugax@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sharat Masetty <smasetty@codeaurora.org>, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The microcode in linux-firmware has been updated to 1.87.01 for a5xx
1.77.01 for a6xx [1]. These microcode versions support a new opcode called
WHERE_AM_I that takes the place of the hardware RPTR shadow and enables the
microcode to update the RPTR shadow in privileged memory so it is protected
against the user.

This patch series re-enables the RPTR shadow and preemption for a5xx and older
versions of a6xx if the WHERE_AM_I opcode is available. Newer a6xx targets
(starting with a650) have automatic privileged protection so the hardware RPTR
shadow can be renabled for those targets too. If any of the needed dependencies
aren't met then the RPTR shadow will remain disabled (along with preemption on
5xx).

This stack is bsed on https://gitlab.freedesktop.org/drm/msm.git msm-next-pgtables
as there are some minor dependencies on the reorganized code in the pgtable
stack.

Jordan

[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=f48fec44127f88ce83ea1bcaf5824de4146ca2f9

Jordan Crouse (3):
  drm/msm: Allow a5xx to mark the RPTR shadow as privileged
  drm/msm: a6xx: Use WHERE_AM_I for eligible targets
  drm/msm: Get rid of the REG_ADRENO offsets

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c       |  65 +++++++++---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c       |  77 +++++++++++---
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c       |  82 +++++++++++----
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       | 108 ++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h       |  12 +++
 drivers/gpu/drm/msm/adreno/a5xx_power.c     |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |   5 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 100 +++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |   9 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  81 +--------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  81 +--------------
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h |   1 +
 drivers/gpu/drm/msm/msm_gpu.h               |   1 +
 13 files changed, 377 insertions(+), 247 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
