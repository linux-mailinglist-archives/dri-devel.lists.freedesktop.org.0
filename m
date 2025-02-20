Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF22A3E8AF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 00:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95ED210E9F4;
	Thu, 20 Feb 2025 23:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="zCqaZdRK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB29E10E9F3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 23:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pAp6aTU3MDvbZXbMddmb4brUtJ96X0DNMEe6D505W3o=; b=zCqaZdRKtbRWquJ7RUr0725Q8Z
 I/iBTPCptWUcH5wEXytEHhz2afiedCNckgIwT9zaXryJoyr6p5yqlkSKt6t7ZaPjLao9BP51innAv
 KfCeUfpKW77sGdUEAkra71ijEsmWnLUeMtbDOBZGIKDHokiS4v9zSuTaGwly0JC2Z71j8wk8wPXTN
 Ov/jv/6j1h6jje4W6XGmZnoXwgI/oSXjaziHOAs1o03piA/GsPqRHhhEqHU3TN43AUEF/ZPDpSWt6
 KwojoeoLXNvEVPucII/ufJtPBqkD41ArbWRd7O4ovDSm4+oRpbay9AIX/1QBwsCuPJfCfv2dIF0Hk
 ktE/4Vlw==;
Received: from i53875bc0.versanet.de ([83.135.91.192]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tlGAx-0004Wc-Q9; Fri, 21 Feb 2025 00:41:51 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: gregkh@linuxfoundation.org,
	heiko@sntech.de
Cc: rafael@kernel.org, dakr@kernel.org, hjc@rock-chips.com,
 andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, quentin.schulz@cherry.de
Subject: [PATCH 0/2] Fix the shutdown callback of a drm component device
Date: Fri, 21 Feb 2025 00:41:39 +0100
Message-ID: <20250220234141.2788785-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Probe deferral can cause the platform-data we access to be freed already
causing ugly splats on system shutdown.

Fix this via a small component-helper and adapting the rockchip-drm
shutdown handler.

Heiko Stuebner (2):
  drivers: base: component: add function to query the bound status
  drm/rockchip: Fix shutdown when no drm-device is set up

 drivers/base/component.c                    | 14 ++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c |  6 ++++--
 include/linux/component.h                   |  4 +++-
 3 files changed, 21 insertions(+), 3 deletions(-)

-- 
2.47.2

