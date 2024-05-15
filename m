Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 102C78C6135
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 09:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C45410E16F;
	Wed, 15 May 2024 07:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="fotcWryP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9424C10E16F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 07:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IIoHEBypBuUFVSchJJMBHvhvDg18qPviVNpAw4yV414=;
 b=fotcWryPYXAiRMMzAgON0/KnphtNA2Bo/uekT9uU/LNbm2LyvlfGuIED
 aSzy26n4dpCKOsELBR6QzGe/ByAtDJWsp84ySsziEUnFqjVK+oZiTM5D5
 hn7leqoSyUXNGR35V1PS6PF8mShfXZv33bl3PkJgeZXdmbCcGjfW0BFuK
 y+kJGkc22edmo4KoQKk2Z/Q9cNTPAl3tfSWdNgIAUrgg6IDWs38M9zXwY
 WlYtIFz92rwMEZ6++I8Iv+AbsVP2i6JQEbpVsaTRMyc19xd5CQ65ROr6n
 IE84JUDse6b2qMNtYuJXvjrwgZ68ePr6rf8KqUJdfS6+estBYU7VnHDjM A==;
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 15 May 2024 15:12:46 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 44F7Chec099689;
 Wed, 15 May 2024 15:12:43 +0800 (GMT-8)
 (envelope-from kuro.chung@ite.com.tw)
Received: from ite-XPS-13-9360.internal.ite.com.tw (192.168.72.42) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 15:12:42 +0800
From: kuro <kuro.chung@ite.com.tw>
To: 
CC: Allen Chen <allen.chen@ite.com.tw>, Pin-yen Lin <treapking@chromium.org>, 
 Kuro Chung <kuro.chung@ite.com.tw>,
 Kenneth Haung <kenneth.hung@ite.com.tw>,
 Kuro <kuro.chung@ite.corp-partner.google.com>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 0/1] drm/bridge: it6505: fix hibernate to resume no display
 issue
Date: Wed, 15 May 2024 15:23:27 +0800
Message-ID: <20240515072328.1010920-1-kuro.chung@ite.com.tw>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.72.42]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: A11021EA28A7D463AE6B142DA2BD4517620255AADFE51846BCE361304E44381F2002:8
X-MAIL: mse.ite.com.tw 44F7Chec099689
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

From: Kuro <kuro.chung@ite.corp-partner.google.com>

New patch description for v8 patch 

	resolve merge conflict

New patch description for v7 patch

        modify code from
        it6505_set_bits(it6505, REG_VID_BUS_CTRL1, TX_FIFO_RESET, 0x02); to
        it6505_set_bits(it6505, REG_VID_BUS_CTRL1, TX_FIFO_RESET, TX_FIFO_RESET); for macro define

New patch description for v6 patch

        remove the unrelated patch change (split into anoter patch)
        remove extra line

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


Kuro Chung (1):
  drm/bridge: it6505: fix hibernate to resume no display issue

 drivers/gpu/drm/bridge/ite-it6505.c | 73 +++++++++++++++++++----------
 1 file changed, 49 insertions(+), 24 deletions(-)

-- 
2.25.1

