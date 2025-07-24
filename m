Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8C2B10AEF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 15:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8B810E202;
	Thu, 24 Jul 2025 13:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="gMB3Z0Re";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E31B10E202
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 13:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=HYbBR/vjtvPGQp6a/iAl/VH02ieL5RdhqTwrGy8yYEg=; b=gMB3Z0Re5e0Ku5KUYsXpWeF6CW
 QTTfHmKKsDRzxk4T4aBUpRGwLEoZrxHmYjiovGZX1VOCUh58SwscvBejmCwgkSNdaVonI2jMY1dfT
 6EDnSdXL5pyB2j/4FW038FEkOKguyLnl1YIxkunwLitGklZFTetQ4A2KBe1p90S2t8y7RYuAnNHT6
 iVTPEVC8iAFCxbCcJ7X91AQsohrM5Pww0SCpXexABY9T99TZuntmT9XD+bVFVq9udOzushM1nYBzT
 TEfGEUkZR8FxrnvwukqxJ455zKRq/IPB8bzMJhvjW+ff6MxSVeYIDRcAoH9kKMIsl3vMlV5Msy8nS
 IvCaybUw==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uevgU-0005mk-HK; Thu, 24 Jul 2025 15:08:30 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v3 14/14] drm/bridge: analogix_dp: Apply panel_bridge
 helper
Date: Thu, 24 Jul 2025 15:08:29 +0200
Message-ID: <22774005.EfDdHjke4D@diego>
In-Reply-To: <20250724080304.3572457-15-damon.ding@rock-chips.com>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-15-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Hi Damon,

Am Donnerstag, 24. Juli 2025, 10:03:04 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Damon Ding:
> In order to unify the handling of the panel and bridge, apply
> panel_bridge helpers for Analogix DP driver. With this patch, the
> bridge support will also become available.
>=20
> The following changes have ben made:
> - Apply plane_bridge helper to wrap the panel as the bridge.
> - Remove the explicit panel APIs calls, which can be replaced with
>   the automic bridge APIs calls wrapped by the panel.
> - Unify the API of getting modes to drm_bridge_get_modes().
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

To keep the code bisectable, I think patches 12+13+14 need to be one patch?
Removing the panel-handling fefore this conversion to the panel-bridge
would produce a gap, where previously hooked up panels would not work
if a git bisect lands directly before this patch 14, I think


Heiko



