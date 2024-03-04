Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7B586F8C7
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 04:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB8610FB3B;
	Mon,  4 Mar 2024 03:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="kdqTflJy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F4410FB3B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 03:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wDTq/D2hc/OJm7z52caZ+Fc3DqtMuNzZgV4Uj2VbYcU=;
 b=kdqTflJyvp4GatjcXWJv1ijZSys5szMHMozkJrz1IzacHI2L0E/oRiAk
 CccGIXk8ypHwXpoSxdFNvXh3qKG6QDaR7ip9RPJtXP89LjkRw7ZcpCVxF
 BnZaNfS4ZQ4DcfnD7Zot9jJLJdOrZwnHmWfKbRv0CNVht8/vQ6UhwR+wS
 JZtDX1O4gBo8ur5b23Le6IdIa5L1Nklv/WcenqFco5GX/N/fH7EKp2HOQ
 AcWUAOBX5NnxSRX/PNWGtLb1vh1AHTaoDGtRsDi1M564Zo49Mxwlj1gfE
 mvm4iN02ZlV631q2L7uV1o8kYdDsEnDo8vMuOB4b7d3DDg19ZdWZaGLqp A==;
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 04 Mar 2024 11:08:29 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 42438Rbj022561;
 Mon, 4 Mar 2024 11:08:27 +0800 (GMT-8)
 (envelope-from kuro.chung@ite.com.tw)
Received: from ite-XPS-13-9360.internal.ite.com.tw (192.168.72.42) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 11:08:26 +0800
From: kuro <kuro.chung@ite.com.tw>
To: 
CC: Allen Chen <allen.chen@ite.com.tw>, Pin-yen Lin <treapking@chromium.org>, 
 Kuro Chung <kuro.chung@ite.com.tw>,
 Kenneth Haung <kenneth.hung@ite.com.tw>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/1] drm/bridge: it6505: fix hibernate to resume no display
 issue patch v2
Date: Mon, 4 Mar 2024 11:19:43 +0800
Message-ID: <20240304031945.250763-1-kuro.chung@ite.com.tw>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.72.42]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: 7F0A6FCDE736CFB60C97BD189F2683B14FE28BD5CCD7DA3F713AB6A0ED3C61D12002:8
X-MAIL: mse.ite.com.tw 42438Rbj022561
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

From: kuro chung <kuro.chung@ite.com.tw>

New patch description for v2 patch

	Missing declaration for i variable in function it6505_irq_video_error_handler
	, add it by this patch

Origianl description for v1 patch 

	drm/bridge: it6505: fix hibernate to resume no display issue

	ITE added a FIFO reset bit for input video. When system power resume,
	the TTL input of it6505 may get some noise before video signal stable
	and the hardware function reset is required.
	But the input FIFO reset will also trigger error interrupts of output module rising.
	Thus, it6505 have to wait a period can clear those expected error interrupts
	caused by manual hardware reset in one interrupt handler calling to avoid interrupt looping.

	Signed-off-by: Allen Chen <allen.chen@ite.corp-partner.google.com>
	(cherry picked from commit Iaa3cd9da92a625496f579d87d0ab74ca9c4937c4)

allen (1):
  UPSTREAM: drm/bridge: it6505: fix hibernate to resume no display issue

 drivers/gpu/drm/bridge/ite-it6505.c | 54 ++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 9 deletions(-)

-- 
2.25.1

