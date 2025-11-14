Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D65BC5F8E6
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 00:05:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F87C10EB2B;
	Fri, 14 Nov 2025 23:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="LhmE55MQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F9010EB2B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 23:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=SAwgCljmLeSzds/qZNduKXgcWBQyRkP73TPbPdmYrkE=; b=LhmE55MQoWJPMe3gUMAv6eiO2W
 W+r6px1uMCf0SYjbv1v+NMlhNzbABJzbwEO9Xg+tGqSXMsGr8HMKGkjKcymGNCRATcL+sDkY4ugn7
 JbIQIR4Uuz5oQHn3/KR2vv/a3RhrzcTIQ1P0lSer1O/Djgqc/2cqxltEarRs/kxZmRLQC9sxbYcxt
 AWDkduKmoLwAke36ymKojGzkon/rR/uZfDItPEwPQXy235baaNon9VncLfF1mxzKRzZ9F2GZ3wLdk
 Umnf7htlnKUzWW28o5qxLHF4vQzQI+zDFIRp9y1W1V0EfalxAQfJPFKrkq9BLmC4Uvy5xUA5CeOTU
 lUMaDwtQ==;
Received: from i53875ae8.versanet.de ([83.135.90.232] helo=phil..)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vK2pv-0008IQ-SB; Sat, 15 Nov 2025 00:04:11 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v3 0/5] High color depth support for RK3576/RK3588 HDMI
 output
Date: Sat, 15 Nov 2025 00:04:06 +0100
Message-ID: <176316144244.624283.15533493108717304321.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251021-rk3588-10bpc-v3-0-3d3eed00a6db@collabora.com>
References: <20251021-rk3588-10bpc-v3-0-3d3eed00a6db@collabora.com>
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


On Tue, 21 Oct 2025 13:19:13 +0300, Cristian Ciocaltea wrote:
> Since both Rockchip RK3576 and RK3588 SoCs are capable of handling 10
> bpc color depth HDMI output and we've already landed the required HDPTX
> PHY driver changes to support the setup, let's add the missing bits and
> pieces to VOP2, DW HDMI QP encoder and bridge library.
> 
> 

Applied, thanks!

[1/5] drm/rockchip: vop2: Check bpc before switching DCLK source
      commit: b0362c45c401c36412a1305b34a3bfeae35dbca7
[2/5] drm/bridge: dw-hdmi-qp: Handle platform supported formats and color depth
      commit: 1ff27c5929ab0f5e34d5062637369ca542a6d385
[3/5] drm/rockchip: dw_hdmi_qp: Switch to phy_configure()
      commit: ba9c2fe18c171fabe0958502e080e000671ac36f
[4/5] drm/rockchip: dw_hdmi_qp: Use bit macros for RK3576 regs
      commit: 97ffefaaf4e9ab3aeddb2273e1a9b2854c481b11
[5/5] drm/rockchip: dw_hdmi_qp: Add high color depth support
      commit: e95b9ff6bfa400d34e1cfcd8062641ba3be821a7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
