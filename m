Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46776A5F4E1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 13:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1226E10E87D;
	Thu, 13 Mar 2025 12:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hHjw2pig";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7447310E87D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 12:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741870172;
 bh=ldBDGgTkPPYuyTRF2v5+H50f0Ki5xayYC0ECnthlcf0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hHjw2pigsG5DsBzm/jEYPomMS3pE9MEp3/MLzh/rHvopa2pA6QJsSXsqK/CqL2TTX
 jwVZDNMymLABCy7ct0McWzze8s6ps5RQQKiCh3YgLnd59nvlAEqIEtT/g/qxsa5j7V
 DTvSO2bH19OcPuM8BvagGbnDSMLF/Ld7gevIk/wq2s8cjRJW005pKFqCEKnv0+NwIi
 qIrBOUwrWM0ziTER+j0hdkHznr0F6UaPA9tWzLGIdxxBDEqspB/2sUnlwIiUmauKSX
 m+c5m3+R4Yj8HiPleDFrUdj5SSD0b1dPEkzZ+o9U633FnEI9UnUz8QCzk3msE9u3gG
 P6l4pp4dTkwjA==
Received: from notapiano (unknown [70.107.117.78])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A653617E09AA;
 Thu, 13 Mar 2025 13:49:28 +0100 (CET)
Date: Thu, 13 Mar 2025 09:49:26 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: linux-mediatek@lists.infradead.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
 krzk@kernel.org, daniels@collabora.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, arnd@kernel.org, ck.hu@mediatek.com,
 laura.nao@collabora.com, matthias.bgg@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, lumag@kernel.org,
 ville.syrjala@linux.intel.com, jani.nikula@intel.com, arnd@arndb.de,
 geert+renesas@glider.be, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: defconfig: mediatek: enable PHY drivers
Message-ID: <986ad850-3e7c-43f4-84f0-cbce888676fe@notapiano>
References: <20250313040855.62259-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313040855.62259-1-vignesh.raman@collabora.com>
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

On Thu, Mar 13, 2025 at 09:38:24AM +0530, Vignesh Raman wrote:
> The mediatek display driver fails to probe on mt8173-elm-hana and
> mt8183-kukui-jacuzzi-juniper-sku16 in v6.14-rc4 due to missing PHY
> configurations.
> 
> Commit [1] stopped selecting the MediaTek PHY drivers, requiring them
> to be explicitly enabled in defconfig.
> 
> Enable the following PHY drivers for MediaTek platforms:
> - CONFIG_PHY_MTK_HDMI=m for HDMI display
> - CONFIG_PHY_MTK_MIPI_DSI=m for DSI display
> - CONFIG_PHY_MTK_DP=m for DP display
> 
> [1] commit 924d66011f24 ("drm/mediatek: stop selecting foreign drivers")

Usually this would go directly in the paragraph, like so:

  Commit 924d66011f24 ("drm/mediatek: stop selecting foreign drivers") stopped
  selecting the MediaTek PHY drivers, requiring them to be explicitly enabled in
  defconfig.

But that's just so you know in the future, you don't need to send a new version
just for that.

> 
> Fixes: 924d66011f24 ("drm/mediatek: stop selecting foreign drivers")
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas
