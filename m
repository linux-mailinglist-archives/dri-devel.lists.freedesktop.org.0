Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E6AD25B93
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 17:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0788910E1AF;
	Thu, 15 Jan 2026 16:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="E7zLKdVd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E177410E188
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 16:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768494303;
 bh=bHsNW7HAQnNrUBtDDGcPlMhwlJ9HZhIEIGRZ5AuWkrk=;
 h=From:Subject:Date:To:Cc:From;
 b=E7zLKdVdJTAB6HdQdqSN8pRKtGdAFX/mRxTQg3sKw98q2/vhGHPeZ8gJXZJF4oD3G
 WKJOOZCT+b0MdsFZT4JR6ftaIePKRHSXKUHRDkAzjRnaOd8kblQ2pt3xhx6Lq2RA9i
 O8hKsD/A5jjei0fxDet6U1Rl+fBd5GaGsjirPtTUYG3Fr9D3BC+7nka549WpDNfbwf
 lS5DSohKyULQzubpth17mHrZF7Gy9GdzvVtLw5SVWkor205FJuOEo2XAUNXSB60Lp0
 Bl4aQOe1HL0lOSzHPKU0HlpouvJ73e9QsbOmcYEkhUiHPrnIxZitCKiv1xVvgwcAwu
 vjpbNQ6vkQP0w==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 514B617E0456;
 Thu, 15 Jan 2026 17:25:03 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/2] Hotplug detection fixup on Rockchip DW HDMI QP
Date: Thu, 15 Jan 2026 18:24:42 +0200
Message-Id: <20260115-dw-hdmi-qp-hpd-v1-0-e59c166eaa65@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMoUaWkC/x2MMQqAMAwAvyKZDZiiUvyKOBQTbQZrbUEF8e8Wl
 4Mb7h7IklQyDNUDSU7NuociVFcwexdWQeXiYBrTN0Qd8oWeN8Ujoo+M1BpryVkugBLFJIve/3C
 c3vcDzo5WxWAAAAA=
X-Change-ID: 20260115-dw-hdmi-qp-hpd-142881a8d81a
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
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

The threaded interrupt handler on RK3576 responsible for providing the
HDMI HPD capability is currently unreliable, since it's affected by a
bug leading to a broken hotplug detection in some cases.

RK3588 is affected by a similar implementation deficiency, however it
doesn't seem to cause any functional breakage.

The series aims to fix the RK3576 HPD issue and optimize HPD handling on
RK3588.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (2):
      drm/rockchip: dw_hdmi_qp: Fix RK3576 HPD interrupt handling
      drm/rockchip: dw_hdmi_qp: Optimize RK3588 HPD interrupt handling

 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)
---
base-commit: 9b7977f9e39b7768c70c2aa497f04e7569fd3e00
change-id: 20260115-dw-hdmi-qp-hpd-142881a8d81a

