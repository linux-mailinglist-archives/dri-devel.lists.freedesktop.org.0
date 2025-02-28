Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 583ADA49F91
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 17:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B57810E071;
	Fri, 28 Feb 2025 16:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="EYpjfiEU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3066A10E09E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 16:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E7/z05/BU1Ot4Goq15zsDNcp3gCxqZhQV/gnnMd27D4=; b=EYpjfiEUhuPorDZ9Z8iDd4iRO4
 Tyf2KtjoTHIo4JAszuhJI5mle5dTaVWG5qcCWGMcWsqRdsTPF6JQITZI6JjOsrXRq2LL7wOnDBITb
 sTksxrkUsqY2xWryMCQ1/2MYukJ8g9Ork6wAK5wg+NBS746cQlZfeC6ZwPr7X7cgl5iCRR4yGXajc
 V9BVvu9PPegbMSUMrwg/ukvTy57SitmArFR+hivsoYu7AT1JfbclzCB70Tmpp1GtG8oeQ3jKmT4WW
 DJC9sitKkwVFOc06dn2ASo5u4byDKTlAj1t4bZSXE0P4p6HS1Q3C1H+4MgXBu1LghQUVjZFWIo5NO
 5RNmn2Nw==;
Received: from i53875b47.versanet.de ([83.135.91.71]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1to3gg-00029i-Nz; Fri, 28 Feb 2025 17:58:10 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, quentin.schulz@cherry.de
Subject: [PATCH 0/2] drm/rockchip: lvds: probe logging improvements
Date: Fri, 28 Feb 2025 17:57:53 +0100
Message-ID: <20250228165755.405138-1-heiko@sntech.de>
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

Getting the panel already uses dev_err_probe to stay silent, when
the panel just probes later, and the lvds defers.

But the phy needed on px30, also has the capability to probe after
the lvds. So make the rest of the lvds probe/bind logic also use
more modern logging than DRM_DEV_ERR, that is deprecated anyway.

Heiko Stuebner (2):
  drm/rockchip: lvds: move pclk preparation in with clk_get
  drm/rockchip: lvds: Hide scary error messages on probe deferral

 drivers/gpu/drm/rockchip/rockchip_lvds.c | 76 +++++++++---------------
 1 file changed, 28 insertions(+), 48 deletions(-)

-- 
2.47.2

