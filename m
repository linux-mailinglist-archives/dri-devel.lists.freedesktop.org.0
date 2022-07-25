Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 143B3580475
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 21:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF93FC1B01;
	Mon, 25 Jul 2022 19:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BB2C1AFE
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 19:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1658777254; x=1690313254;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=YL+yNqiVY47rnQ8Mu2uZic+tTNhs+l4L8tVU3qMVLxI=;
 b=gtNemekI4bGf4jtRnRm+rraFuP7D3pI2+XpQr+0jw6SurbHUK7NnfWnv
 U4UcrkhjdjXzuNF0d/wGORCquNvsVD2edAlObL06OzwS58eIkSDwmPas/
 UWxpN0dKfLhR3f/AZDvUvE+GQ5KLfMBSp4lvqed3tMPXxR8iK6cECj1c0 8=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 25 Jul 2022 12:27:33 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:27:32 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 25 Jul 2022 12:26:52 -0700
Received: from hu-rohiiyer-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 25 Jul 2022 12:26:51 -0700
From: Rohith Iyer <quic_rohiiyer@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH libdrm v1 0/2] Add Writeback Support for Modetest
Date: Mon, 25 Jul 2022 12:26:37 -0700
Message-ID: <20220725192639.5437-1-quic_rohiiyer@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
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
Cc: Rohith Iyer <quic_rohiiyer@quicinc.com>, quic_abhinavk@quicinc.com,
 hoegsberg@google.com, dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add writeback support to modetest with the below options:

- Passing in -c will now also show the writeback connector

- Test a built-in mode on writeback connector

- Test a custom mode from user input on writeback connector
  Usage: "./modetest -M msm -x <connector_id>:<mode_parameters>
            -a -P <plane_id>@<crtc_id>:<widthxheight>+0+0@RG24."
  Refer to --help for exact syntax

- Dump the writeback output buffer to bitstream
  Usage: "./modetest -M msm -s <connector_id>:<widthxheight>
          -a -o <filepath>
          -P <plane_id>@<crtc_id>:<widthxheight>+0+0@RG24"

This currently supports a singular writeback connector.
This patch also fixes a bug for running modetest with the atomic flag.

Rohith Iyer (2):
  tests/modetest: Allocate drmModeAtomicReq before setting properties
  tests/modetest: Add support for writeback connector

 tests/modetest/buffers.c  |  19 ++++++
 tests/modetest/buffers.h  |   1 +
 tests/modetest/modetest.c | 128 ++++++++++++++++++++++++++++++++------
 3 files changed, 128 insertions(+), 20 deletions(-)

-- 
2.31.0

