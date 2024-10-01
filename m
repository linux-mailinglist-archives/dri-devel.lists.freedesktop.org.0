Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D49B98B4BD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 08:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1D410E5DF;
	Tue,  1 Oct 2024 06:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="lXbgNz5+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744F610E5DC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 06:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yId9hUjXMvIgIK6EfcFuOboUd7/oDFwEzCFgGZmvOZs=;
 b=lXbgNz5+ZHEg03rJXnxpTB8uza0OgIZakcoogsLRkwesleiBlzRbQDRM
 L4ZMpsHJK7w58SZEq3iX+UPH6ZEHSg6QiRzIH2vAXnmvUqSt35pRlJ6Lh
 kTOELNdGnUcbSkjuqk7AiqbF5vtPOdZ6+6uxnqZ2qiHQ2NP2g5vOAZLa/
 Ak3suGPCJOGAjpbbRZUAz8ACda2/rJw+tMW3ratM+vkpubL18aCzUwXNv
 lRVGuL9Uqy+lxRv09K5tVrRNcDPQVai4HVCFSGf+hyuoiIlQKtu1kEjlt
 24eWKllLQCxYnXLd6W5/7wxSBS/pel1NIGged0B108rBzRhj4So3ELCOH Q==;
X-CSE-ConnectionGUID: 19ILxpjeTqiKkqOJYEVW6Q==
X-CSE-MsgGUID: EnfVdjXZQhawdG3M6Ix2UA==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 01 Oct 2024 14:43:42 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 4916hcY2044673;
 Tue, 1 Oct 2024 14:43:38 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from LAPTOP-C4GM1L3U.localdomain (192.168.82.6) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 14:43:38 +0800
From: Hermes Wu <Hermes.Wu@ite.com.tw>
To: Pin-yen Lin <treapking@chromium.org>
CC: Kenneth Hung <Kenneth.hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>,
 Hermes Wu <Hermes.wu@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "open
 list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, Hermes Wu
 <hermes.wu@ite.com.tw>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas
 Karlman <jonas@kwiboo.se>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, open list
 <linux-kernel@vger.kernel.org>, Robert Foss <rfoss@kernel.org>
Subject: [PATCH v5 00/10]drm/bridge: it6505: fix HDCP CTS fail items and add
 MCCS support
Date: Tue, 1 Oct 2024 14:42:59 +0800
Message-ID: <20241001064305.32180-1-Hermes.Wu@ite.com.tw>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.82.6]
X-ClientProxiedBy: TPEMAIL1.internal.ite.com.tw (192.168.15.58) To
 TPEMAIL1.internal.ite.com.tw (192.168.15.58)
X-TM-SNTS-SMTP: 5BEC668B2C8AAEBEF419837CB032D160902223DAA3B18AA826522A2476B3CE132002:8
X-MAIL: mse.ite.com.tw 4916hcY2044673
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

From: Hermes Wu <Hermes.wu@ite.com.tw>

This is a v5 patch-set.

There are lots of failure items while running HDCP CTS using UNIGRAF DPR-100.
In Order to fix those failures, HDCP flow needs to be changed.

The DisplayPort AUX protocol supports I2C transport.
In Order to support MCCS via the aux channel, the aux-i2c operation is added.

v4 ->v5:
	-add more messages for changes.
	-[2/10] modified AUX transfer data size judgment.
		change for-loop to do-while.
	-[7/10] change for-loop to do-while.
	-[9/10] change wait timer with timer_after()

	links:
	https://lore.kernel.org/all/20240926074755.22176-4-Hermes.Wu@ite.com.tw/
	https://lore.kernel.org/all/20240926075134.22394-1-Hermes.Wu@ite.com.tw/

v3 ->v4:
	-split changes  into patches.

v2- > v3:
	-split aux read  KSV function to a patch.
	-[1/3] new in v3
	-[2/3] add description of patch

v1 -> v2 :
	- ignored.



Hermes Wu (10):
  drm/bridge: it6505: Change definition of AUX_FIFO_MAX_SIZE
  drm/bridge: it6505: improve AUX operation for edid read
  drm/bridge: it6505: add AUX operation for HDCP KSV list read
  drm/bridge: it6505: Change definition MAX_HDCP_DOWN_STREAM_COUNT
  drm/bridge: it6505: fix HDCP Bstatus check
  drm/bridge: it6505: fix HDCP encryption when R0 ready
  drm/bridge: it6505: fix HDCP CTS KSV list read with UNIGRAF DPR-100.
  drm/bridge: it6505: fix HDCP CTS compare V matching
  drm/bridge: it6505: fix HDCP CTS KSV list wait timer
  drm/bridge: it6505: add I2C functionality on AUX

 drivers/gpu/drm/bridge/ite-it6505.c | 334 +++++++++++++++++++++++-----
 1 file changed, 277 insertions(+), 57 deletions(-)

-- 
2.34.1

