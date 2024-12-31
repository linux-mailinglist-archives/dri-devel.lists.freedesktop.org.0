Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5715D9FEE88
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 10:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE0E10E629;
	Tue, 31 Dec 2024 09:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="p6SMH6CR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id CD30E10E628
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 09:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version:
 Content-Type; bh=KgtALxJqBWoQB4v1+ibC8c5vtvvbQuSbp6eJ9TpCs4o=;
 b=p6SMH6CRyG46D1iaJalUPdckQsBULJUgmM857QpPXRSGSKbX6bCwGcmzq+wk0O
 5yLGIphuAfDHIkWFQa7dJqWoikY2BFlY1zbsFd68bTU2CYMYfsOtxdfaSm/167HM
 3pwy6+h/jNUahP74w7a/MlyqGvVU/DmaCrxN6PX+5RszM=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wD3v8P6vHNnCZWrCw--.29543S2; 
 Tue, 31 Dec 2024 17:44:29 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: krzk+dt@kernel.org, mripard@kernel.org, robh@kernel.org,
 hjc@rock-chips.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 0/3] Add HDMI support for rk3576
Date: Tue, 31 Dec 2024 17:44:16 +0800
Message-ID: <20241231094425.253398-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3v8P6vHNnCZWrCw--.29543S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFW3Kr4UZr1UWF4UKr13twb_yoW3Zrb_K3
 4Sq3s8ur18uF1Yya47tw4xWa93tay2gFZ5GF48K3ZrJFWkJF48Xrn3JrWYqa4rZF1YkFnr
 Gr4YqFy8CanIyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbySotUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqR7GXmdztQzPNgAAs7
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


RK3576 HDMI TX Controller is very similar to that of RK3588, but with
some control bits for IO and interrupts status scattered across different
GRF.

PATCH 1/3 is add platform ctrl callback for IO setting and interrupts
status handing.
PATCH 2/3 ~ 3/3 are add support for rk3576

Changes in v2:
- Fix compilation warning: unused variable ‘val’ [-Wunused-variable]

Andy Yan (3):
  drm/rockchip: dw_hdmi_qp: Add platform ctrl callback
  dt-bindings: display: rockchip: Add rk3576 hdmi controller
  drm/rockchip: Add basic RK3576 HDMI output support

 .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml  |   1 +
 .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 225 +++++++++++++++---
 2 files changed, 196 insertions(+), 30 deletions(-)

-- 
2.34.1

