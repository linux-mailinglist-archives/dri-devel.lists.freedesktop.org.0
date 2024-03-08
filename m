Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5E3876054
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 09:54:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0EC10F8D9;
	Fri,  8 Mar 2024 08:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="U+DIYKfh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E307610F8D9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 08:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ueYuErBzNOQow9i3cCLMsyBomG/pby6aV6w567ivZY4=;
 b=U+DIYKfhbKZmmrLVBDFw3kOcAYxoAfbWLFcr2qyIseEx3IpE98uMol8O
 zjGrA9YYi+QPHqcGkS7GKCYOAPuyyyUFsUomknrqmcPIQVJBpiDBcbims
 3aHDBxF1AxsetHjCE1jP3irdXgBCSzQ4yRoCAQS6AwJ/HGc9Zr/LSaWI6
 ylWB2rehzjySN60GE6UwEaF6Wy+jx6FGDOKXpNIudrwn0wjZlIlun8s2X
 beWM24ydrBRJu9ik/ps/vsysgkV9Qu8CGRSucNxRQ+9Vyom9NejAU0bxP
 4gPkj2P+X/fptLAsqzEjSKUMWcafVMOik4U0YfDCi0VAKHYTNpfhj12TT Q==;
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 08 Mar 2024 16:54:33 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 4288sSeO079655;
 Fri, 8 Mar 2024 16:54:28 +0800 (GMT-8)
 (envelope-from kuro.chung@ite.com.tw)
Received: from ite-XPS-13-9360.internal.ite.com.tw (192.168.72.42) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 16:54:28 +0800
From: kuro <kuro.chung@ite.com.tw>
To: 
CC: Allen Chen <allen.chen@ite.com.tw>, Pin-yen Lin <treapking@chromium.org>, 
 Kuro Chung <kuro.chung@ite.com.tw>,
 Kenneth Haung <kenneth.hung@ite.com.tw>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/1] drm/bridge: it6505: fix hibernate to resume no display
 issue
Date: Fri, 8 Mar 2024 17:05:46 +0800
Message-ID: <20240308090548.269625-1-kuro.chung@ite.com.tw>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.72.42]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: 0787A66D1D05A46525F5F1DB9E5BA4C8B4B3FFE9486B63953D78B7D6F5C182042002:8
X-MAIL: mse.ite.com.tw 4288sSeO079655
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

From: Kuro Chung <kuro.chung@ite.com.tw>


New patch description for v4 patch

	update by reviewer Pin-yen Lin comment, remove function it6505_irq_video_fifo_error/it6505_irq_io_latch_fifo_overflow
	update by reviewer Pin-yen Lin comment, update Signed-off-by column

New patch description for v3 patch 
	
	update upstream MAINTAINERS mail list

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


allen (1):
  UPSTREAM: drm/bridge: it6505: fix hibernate to resume no display issue

 drivers/gpu/drm/bridge/ite-it6505.c | 50 ++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 15 deletions(-)

-- 
2.25.1

