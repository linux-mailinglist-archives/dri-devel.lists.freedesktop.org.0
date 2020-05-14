Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 610991D2D91
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 12:54:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E5C6E317;
	Thu, 14 May 2020 10:54:40 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0124D6E317
 for <dri-devel@freedesktop.org>; Thu, 14 May 2020 10:54:36 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1589453680; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=oTpGsbWxjfhqhfXuRLS+yKsDMjs9vA6BSUaT4f/U54Y=;
 b=eou7dveec17LDNFJPEv8SRQ++PuJqlH65ESFwRPVKps9+f9TlF7kDCM972nk6YHCLTquruEj
 jPYnIjGVZ+4dGqVB72DW+8R4goTKgIaCFlDrK+nhNE0VNvOgniBmw4BXcsJga6Sh5dN22qcW
 WjJapVEEzIynz/eZmzPqrddjsI4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebd2366.7f72dda091b8-smtp-out-n03;
 Thu, 14 May 2020 10:54:30 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4A192C43637; Thu, 14 May 2020 10:54:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AD68EC433D2;
 Thu, 14 May 2020 10:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AD68EC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/6] Add support for GPU DDR BW scaling
Date: Thu, 14 May 2020 16:24:13 +0530
Message-Id: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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
Cc: linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 linux-kernel@vger.kernel.org, mka@chromium.org, dri-devel@freedesktop.org,
 georgi.djakov@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a rework of my previous series [1], but this time based on the bindings
from Georgi [2] + a few fixes which look to be fixed in v8 of Georgi's series
[3]. The work is based on the chromeOS tip.

[1]: https://patchwork.freedesktop.org/series/75291/
[2]: https://lore.kernel.org/patchwork/cover/1230626/
[3]: https://lore.kernel.org/patchwork/cover/1240687/

Sharat Masetty (5):
  arm64: dts: qcom: sc7180: Add interconnect bindings for GPU
  arm64: dts: qcom: sc7180: Add opp-peak-kBps to GPU opp
  drm: msm: a6xx: send opp instead of a frequency
  drm: msm: a6xx: use dev_pm_opp_set_bw to set DDR bandwidth
  dt-bindings: drm/msm/gpu: Document gpu opp table

Sibi Sankar (1):
  OPP: Add and export helper to set bandwidth

 .../devicetree/bindings/display/msm/gpu.txt        | 28 +++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  9 +++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 68 +++++++++++-----------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |  2 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |  3 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |  3 +-
 drivers/opp/core.c                                 | 43 ++++++++++++++
 include/linux/pm_opp.h                             |  6 ++
 8 files changed, 125 insertions(+), 37 deletions(-)

--
2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
