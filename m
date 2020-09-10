Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 050A2264E65
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 21:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83446E177;
	Thu, 10 Sep 2020 19:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 356 seconds by postgrey-1.36 at gabe;
 Thu, 10 Sep 2020 19:13:25 UTC
Received: from a27-186.smtp-out.us-west-2.amazonses.com
 (a27-186.smtp-out.us-west-2.amazonses.com [54.240.27.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D1E6E177
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 19:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599764848;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
 bh=5FgjAFBpydifCxVAQzMk72ZA5elnWDUI08cY29Zi11c=;
 b=cN4Mo5ZIwaL6X/u78vZpPplzuZAvFhv2nlSFcqmd3PpKuu6qz8Bx2jUPEQLyGyfw
 dqGgHPMUJcMdM4SOlVW4zKDitNgcHSA42k/GTzsmdZV80A1hsT6ga8olPfHe6a2WhlO
 /LWcIe+OCA6cR+YEY+6XbLZez69QNA0FKL8/w6hg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599764848;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
 bh=5FgjAFBpydifCxVAQzMk72ZA5elnWDUI08cY29Zi11c=;
 b=n8NJpe83eN86cI4mPEYCR1sYF4hsZm0qbaoTuGYUUFlZCzpnaVl3KaMWj8XI18U/
 bAaRlylWS4bnMi+fhi5sBN1fO3D4uIMJVgbiCSJkvOFMX8bm5d0+fdECjCAMH+IpCvQ
 5F6hGO0+1QgVtqMEEUY01ds0ksqqg5zA/C1sfTHY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0592DC433F0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/5] Add audio support for MSM DisplayPort driver
Date: Thu, 10 Sep 2020 19:07:28 +0000
Message-ID: <01010174796a5f63-6380c49f-3756-4d04-80fd-fed8aa95b754-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-SES-Outgoing: 2020.09.10-54.240.27.186
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
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
Cc: vsujithk@codeaurora.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, swboyd@chromium.org,
 khsieh@codeaurora.org, seanpaul@chromium.org, tanmay@codeaurora.org,
 rohitkr@codeaurora.org, aravindh@codeaurora.org, cychiang@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds audio support for DP on MSM chipsets. It leverages
the hdmi-codec interface [1] to communicate between the Display Port
driver and the audio subsystem. These changes depend on the series [2]
which adds Display Port support to MSM chipsets.

[1] https://patchwork.kernel.org/project/dri-devel/list/?series=339847
[2] https://patchwork.kernel.org/project/dri-devel/list/?series=346391


changes in v2:
    - fix up a compilation issue on drm-next branch

changes in v3:
    - add support to synchronize DP driver and audio during shutdown

changes in v4:
    - rebase on top of latest patchset of dependency

changes in v5:
    - rebase on top of latest patchset of dependency
	- fix crash when trying to play audio in DP suspend state

Abhinav Kumar (5):
  drm/msm/dp: store dp_display in the driver data
  drm/msm/dp: add audio support for Display Port on MSM
  drm/msm/dp: add hook_plugged_cb hdmi-codec op for MSM DP driver
  drm/msm/dp: signal the hotplug disconnect in the event handler
  drm/msm/dp: wait for audio notification before disabling clocks

 drivers/gpu/drm/msm/Makefile                |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |   7 +
 drivers/gpu/drm/msm/dp/dp_audio.c           | 638 ++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_audio.h           |  72 +++
 drivers/gpu/drm/msm/dp/dp_catalog.c         | 192 ++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h         |  29 +
 drivers/gpu/drm/msm/dp/dp_display.c         | 138 ++++-
 drivers/gpu/drm/msm/dp/dp_display.h         |  12 +
 8 files changed, 1075 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_audio.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_audio.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
