Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3023BA885
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jul 2021 13:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89F76E218;
	Sat,  3 Jul 2021 11:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1E489EB7;
 Sat,  3 Jul 2021 11:38:58 +0000 (UTC)
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 03 Jul 2021 04:32:55 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 03 Jul 2021 04:32:53 -0700
X-QCInternal: smtphost
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
 by ironmsg01-blr.qualcomm.com with ESMTP; 03 Jul 2021 17:02:44 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id D65274961; Sat,  3 Jul 2021 04:32:43 -0700 (PDT)
From: Kalyan Thota <kalyan_t@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [RFC] Inline rotation support in dpu driver
Date: Sat,  3 Jul 2021 04:32:42 -0700
Message-Id: <1625311962-14185-1-git-send-email-kalyan_t@codeaurora.org>
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
Cc: mkrishn@codeaurora.org, dianders@chromium.org, linux-kernel@vger.kernel.org,
 Kalyan Thota <kalyan_t@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change adds support for inline rotation in the dpu driver.
When inline rotation is enabled the VIG pipes will directly fetch the image
from memory in a rotated fashion

Inline rotation has following restrictions 
1) Supported only with compressed formats
2) max pre rotated height is 1088
3) restrictions with downscaling ratio

Queries: 

1) Since inline rotation works for fewer pixel formats with specific modifier, how can we provide this information to the compositor so that
chrome compositor can choose between overlaying or falling back to GPU. In the patch it fails in the atomic check.

2) If a display composition fails in atomic check due to any of the restrictions in overlays
can chrome compositor switch it back to the GPU and re trigger the commit ?

posting it as RFC as validation is not complete, please share early comments on this.

Kalyan Thota (1):
  drm/msm/disp/dpu1: add support for inline rotation in dpu driver

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 47 +++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 20 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 93 ++++++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |  2 +
 4 files changed, 128 insertions(+), 34 deletions(-)

-- 
2.7.4

