Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644C9D07AD9
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEDA10E7FE;
	Fri,  9 Jan 2026 08:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="gocwaOuH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3422210E3A5
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 08:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=qh
 xsnG7oHQhHQY/RtF0hhxwdrp2042d1OP3qas3MQFs=; b=gocwaOuHbVwslHW7cO
 PmHP4h4jSvsNX8ANIEzJ4jpgM6y1YQK4YlCmk0+1k2GzpaOfAkG0TY3s3UJxzZXJ
 igeNEfz3oXY59JZFwuNEvE33S3CNlFSwd4+447xzPOsrJYw8g7BpedkALupUYVCz
 khvlW5wGPMRbjoX8Xl6VvwlTo=
Received: from ProDesk-480.. (unknown [])
 by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id
 _____wDnzlW4tWBpx1iBFA--.64397S2; 
 Fri, 09 Jan 2026 16:01:00 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de,
	dmitry.baryshkov@oss.qualcomm.com
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, cristian.ciocaltea@collabora.com,
 Laurent.pinchart@ideasonboard.com, mripard@kernel.org, hjc@rock-chips.com,
 robh@kernel.org, sebastian.reichel@collabora.com, tzimmermann@suse.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 0/5] Add DisplayPort support for rk3576
Date: Fri,  9 Jan 2026 16:00:43 +0800
Message-ID: <20260109080054.228671-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnzlW4tWBpx1iBFA--.64397S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw4rWw1xXw4UCr17Zw4Dtwb_yoWkXFgEka
 4fZryDXa18uasIyFyxJw4fW3sxJw4qgr4kKF15tr1qqFy8A3W8ta4kAa4UJ3W5AF47Zr1f
 CryUXF1kCw13WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnVWlDUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxRwPbWlgtby92gAA3c
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

From: Andy Yan <andy.yan@rock-chips.com>


The DisplayPort found on RK3576 is very similar to that of RK3588,
but work in qual pixel mode and support for MST.

This patch series aims to add basic display output, not include audio
and MST, which will be the work for the next stage.

Only test with 2 lane standard DP port output now.



Andy Yan (5):
  dt-bindings: display: rockchip: Add rk3576 DisplayPort
  drm/bridge: synopsys: dw-dp: Set pixel mode by platform data
  drm/bridge: synopsys: dw-dp: Make i2s/spdif clk optional
  drm/rockchip: dw_dp: Add DisplayPort support for rk3576
  arm64: dts: rockchip: Add DisplayPort dt node for rk3576

 .../display/rockchip/rockchip,dw-dp.yaml      | 29 +++++++++++++++++--
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 28 ++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-dp.c       | 12 ++------
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c     | 27 ++++++++++++++---
 include/drm/bridge/dw_dp.h                    |  7 +++++
 5 files changed, 87 insertions(+), 16 deletions(-)

-- 
2.43.0

base-commit: ad939ed1f8108513e84e93da90ad7ea31b56ef87
branch: rk3576-dp-upstream

