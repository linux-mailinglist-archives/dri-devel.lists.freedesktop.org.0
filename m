Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EAF8B2094
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 13:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7076611A3D0;
	Thu, 25 Apr 2024 11:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fZ53i8ZW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCC410EA35
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 11:43:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5789BCE1318;
 Thu, 25 Apr 2024 11:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999EEC113CC;
 Thu, 25 Apr 2024 11:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714045415;
 bh=6hbuEo73qBv0jvZBozo1DEDhJftdYqQqfhBq3uTN4Wc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fZ53i8ZWjxv2puTITm4U5wtba2pLlmhRXa0CGan/vm3jNACET538J4co1YWOd5R3A
 eQszDLjlEB5Xqw5HPnsNq67mGyAsQIUbTl+S17SVawU+hZZhbJS2fGmfmhIYWrhV0K
 JXjSDOo2As9Bemr/GzPVFmtxaYYsuiGD3bAd/OG20ltzZ6zXhUKkLj2PvCNN+xT+JD
 +msfZ4kyNburoymGfRgBNdM3X8T8LOAvJvsAdhcMcX68AFoZu7tg+V/gj/japRFyxT
 +Zg0K+KB/8IGL74r+uhz2OubhGuAA3grUW/uP6xK9XKzzMTvcRCWqiGsq8XC/sF6g+
 xrsxBiBBpi6bQ==
From: Robert Foss <rfoss@kernel.org>
To: Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Daniel Vetter <daniel@ffwll.ch>,
 Fabio Estevam <festevam@gmail.com>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 aford@beaconembedded.com, Lucas Stach <l.stach@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, 
 kernel test robot <lkp@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20240422103352.8886-1-aford173@gmail.com>
References: <20240422103352.8886-1-aford173@gmail.com>
Subject: Re: [PATCH V2] drm/bridge: imx: Fix unmet depenency for
 PHY_FSL_SAMSUNG_HDMI_PHY
Message-Id: <171404541028.1834748.16197484610982972035.b4-ty@kernel.org>
Date: Thu, 25 Apr 2024 13:43:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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

On Mon, 22 Apr 2024 05:33:52 -0500, Adam Ford wrote:
> When enabling i.MX8MP DWC HDMI driver, it automatically selects
> PHY_FSL_SAMSUNG_HDMI_PHY, since it wont' work without the phy.
> This may cause some Kconfig warnings during various build tests.
> Fix this by implying the phy instead of selecting the phy.
> 
> To prevent this from happening with the DRM_IMX8MP_HDMI_PVI, also
> imply it instead of selecting it.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: imx: Fix unmet depenency for PHY_FSL_SAMSUNG_HDMI_PHY
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=cbdbd9ca718e



Rob

