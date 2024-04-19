Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0F78AA93D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 09:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16A410E004;
	Fri, 19 Apr 2024 07:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="pjhK20HN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 431 seconds by postgrey-1.36 at gabe;
 Fri, 19 Apr 2024 07:34:30 UTC
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CF910E004
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 07:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T+Ztn+2yf3o6zBSPphj743Io9F2W5o5ZAKQconu0ZWE=;
 b=pjhK20HN2hyVi9X6x+FfD6dz67rGGosa8l1akxujpvGZto13T/g1nYFy
 4KatoPQQbYjFbdG9iSmPf/N6Qbfp5ckW/RJr/xj5HjAKuz7Ecy3+PS8BG
 IUTBso2847CCiwpawjPLYNn0p4AcrlhC5HEcYnZCg1XmIEHc5lIuPq6uf
 CIdnPIApH7wjtiP07Qe5+9UoR2CgYs8Q/1RUwRk0PH/PCyn8IvIhpagHC
 AH3hTlr/mlZiGfIn63k+k7QGnV0KBClhT342A2HE4iWl0WjbMNDppAnz9
 3xskYoLKx2V5wNRBd7oJmG6dobWnezashfE/yHAQGetS8papaKHpU2avW A==;
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 19 Apr 2024 15:27:16 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 43J7RDbO011974;
 Fri, 19 Apr 2024 15:27:13 +0800 (GMT-8)
 (envelope-from kuro.chung@ite.com.tw)
Received: from ite-XPS-13-9360.internal.ite.com.tw (192.168.72.42) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 15:27:14 +0800
From: kuro <kuro.chung@ite.com.tw>
To: 
CC: Allen Chen <allen.chen@ite.com.tw>, Pin-yen Lin <treapking@chromium.org>, 
 Kuro Chung <kuro.chung@ite.com.tw>,
 Kenneth Haung <kenneth.hung@ite.com.tw>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/1] drm/bridge: it6505: fix hibernate to resume no display
 issue
Date: Fri, 19 Apr 2024 15:38:06 +0800
Message-ID: <20240419073809.706471-1-kuro.chung@ite.com.tw>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.72.42]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: 9BD95BE845961D5F40378580C0137BF3EF857CE80068BC8D89636A8820A2BD242002:8
X-MAIL: mse.ite.com.tw 43J7RDbO011974
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

From: Kuro <kuro.chung@ite.com.tw>


New patch description for v5 patch

        after customer feedback and test finished, update again, kernel build pass.
        
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

 drivers/gpu/drm/bridge/ite-it6505.c | 181 +++++++++++++++++++---------
 1 file changed, 124 insertions(+), 57 deletions(-)

-- 
2.25.1

