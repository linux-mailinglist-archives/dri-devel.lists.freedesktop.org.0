Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1138F986E0E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 09:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859C910EADB;
	Thu, 26 Sep 2024 07:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="jaZUDkiI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6E410EADB
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 07:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qn2e91U5L9ArAt10Dz9K7b2XtrVbPYlrhxZjNwk91Q8=;
 b=jaZUDkiImfxAzsI4Cotex/yRlyaZV+g/V+TC6Ndr6NsUz1aTCDqNXZrB
 xcBEzQ0H2pUed6Dw5I1ewma8nvFe2+PjLieCUsnCX0r2OfEZmJGo3ZlZD
 tRYUjB741N6aDOtPjilBFUurW5xmQ8I6kwpDLdrl0R2AvlFEeGhr/nKyV
 zyQf2I85TvJXU6wwQ17macw64siOO3DftnPiX7pwdxYXHJ6UC4nIsXEEr
 uW17X/W3Jrn4Le0Ar2872fF+kXpd+xKLML6mqVsS9SqncGw7PceClHvPm
 lCnNnGp3AHnK7yjICwye+g+JY0b3x2rMzqXP7JNhlHlzkVxbEP7qdUcTQ A==;
X-CSE-ConnectionGUID: y6cvHJLeT3GMSkQ4G9dt1Q==
X-CSE-MsgGUID: /X5EexboTiaTRYh2NW4szQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 26 Sep 2024 15:48:16 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 48Q7mCPD042909;
 Thu, 26 Sep 2024 15:48:12 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from LAPTOP-C4GM1L3U.localdomain (192.168.82.6) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 15:48:11 +0800
From: Hermes Wu <Hermes.Wu@ite.com.tw>
To: hermes wu <Hermes.wu@ite.com.tw>
CC: Kenneth Hung <Kenneth.hung@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Hermes Wu <hermes.wu@ite.com.tw>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, open list
 <linux-kernel@vger.kernel.org>, Robert Foss <rfoss@kernel.org>
Subject: [PATCH v4 00/11] fix HDCP CTS fail items and add MCCS support
Date: Thu, 26 Sep 2024 15:47:50 +0800
Message-ID: <20240926074755.22176-1-Hermes.Wu@ite.com.tw>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.82.6]
X-ClientProxiedBy: TPEMAIL1.internal.ite.com.tw (192.168.15.58) To
 TPEMAIL1.internal.ite.com.tw (192.168.15.58)
X-TM-SNTS-SMTP: 55296E61051678383A5EF0D02B3D425FF7C28377B5C4CA101971D598E0A691A72002:8
X-MAIL: mse.ite.com.tw 48Q7mCPD042909
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

This is a v4 patch-set.

There are lots of failure items while running HDCP CTS using UNIGRAF
DPR-100.
In Order to fix those failures, HDCP flow needs to be changed.

The DisplayPort AUX protocol supports I2C transport.
In Order to support MCCS via the aux channel, the aux-i2c operation is
added.

v3 ->v4:
	-split changes into patches.

v2- > v3:
	-split aux read  KSV function to a patch.
	-[1/3] new in v3
	-[2/3] add description of patch

v1 -> v2 :
	- ignored.

Link: https://lore.kernel.org/all/20240923094826.13471-2-Hermes.Wu@ite.com.tw/
Link: https://lore.kernel.org/all/20240923094826.13471-3-Hermes.Wu@ite.com.tw/
Link: https://lore.kernel.org/all/20240923094826.13471-4-Hermes.Wu@ite.com.tw/


Hermes Wu (11):
  drm/bridge: it6505: change aux max fifo size
  drm/bridge: it6505: improve aux operation for edid read
  drm/bridge: it6505: add aux operation for HDCP ksv list read
  drm/bridge: it6505: fix aux command write to aux operaction register
  drm/bridge: it6505: increase supports of HDCP repeater ksv devices
  drm/bridge: it6505: fix HDCP Bstatus check.
  drm/bridge: it6505: fix HDCP encription not enable when R0 ready
  drm/bridge: it6505: fix HDCP KSV list did not read correctly.
  drm/bridge: it6505: fix HDCP CTS compare V matching without retry
  drm/bridge: it6505: fix HDCP CTS ksv wait timer
  drm/bridge: it6505: Add aux i2c functionality

 drivers/gpu/drm/bridge/ite-it6505.c | 313 +++++++++++++++++++++++-----
 1 file changed, 266 insertions(+), 47 deletions(-)

-- 
2.34.1

