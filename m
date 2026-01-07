Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518E6CFDA04
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 13:23:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C598910E59E;
	Wed,  7 Jan 2026 12:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="QcMi+Mm2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE9D10E59E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 12:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=UCt1lPgHWvel1sNHnwKhUv+0Xd6FvEiFSdmAT35AsTA=; b=QcMi+Mm2Qxw/hPUjXVJGubc3M9
 ZeuRnypQwkTrC4Sg8m0/qzqCa+MPlSRB1RPQA+ptlRvDCSCQy79wQCzxQRw956eaOdsiWKyCYqclT
 V03Lq5s7AX8jDbtTPprKtEbUpUr/YhVCFifQQlJLIfQds9sL8msieudO/3wIOjfCTPpIYI11FstMz
 gNs3tzD3t17UqLjhPA8l4nnC1BfGwcGpMvr+wLyO0gkIWD7QTixpupJW9FhvY7YYRaryxrs2fI+Xo
 GDH4Iq0l4lAJvKV9x9dezvGjECJH8M7eSpWBHM25kYKeXFnkFht+FGrfJ4VYCimXjQNVuuJSln98i
 Po9ZwSHA==;
Received: from i53875b57.versanet.de ([83.135.91.87] helo=phil..)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vdSZI-001NGe-8G; Wed, 07 Jan 2026 13:23:16 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH] drm/bridge: dw-hdmi-qp: Fix spurious IRQ on resume
Date: Wed,  7 Jan 2026 13:23:13 +0100
Message-ID: <176778858168.3105559.3292923031171588352.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251014-rockchip-hdmi-suspend-fix-v1-1-983fcbf44839@collabora.com>
References: <20251014-rockchip-hdmi-suspend-fix-v1-1-983fcbf44839@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Tue, 14 Oct 2025 18:00:57 +0200, Sebastian Reichel wrote:
> After resume from suspend to RAM, the following splash is generated if
> the HDMI driver is probed (independent of a connected cable):
> 
> [ 1194.484052] irq 80: nobody cared (try booting with the "irqpoll" option)
> [ 1194.484074] CPU: 0 UID: 0 PID: 627 Comm: rtcwake Not tainted 6.17.0-rc7-g96f1a11414b3 #1 PREEMPT
> [ 1194.484082] Hardware name: Rockchip RK3576 EVB V10 Board (DT)
> [ 1194.484085] Call trace:
> [ 1194.484087]  ... (stripped)
> [ 1194.484283] handlers:
> [ 1194.484285] [<00000000bc363dcb>] dw_hdmi_qp_main_hardirq [dw_hdmi_qp]
> [ 1194.484302] Disabling IRQ #80
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: dw-hdmi-qp: Fix spurious IRQ on resume
      commit: 14adddc65340f2034751c95616861c0e888e2bb1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
