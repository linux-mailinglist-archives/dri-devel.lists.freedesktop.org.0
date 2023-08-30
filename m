Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 988D078D571
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 13:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BCD10E4EA;
	Wed, 30 Aug 2023 11:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BFB10E4EA
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 11:11:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 91C7362810;
 Wed, 30 Aug 2023 11:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231EFC433C8;
 Wed, 30 Aug 2023 11:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693393901;
 bh=nR6xHB0OPWpcCVXuSRAMzthW2HNyxf0866+qn6RsY28=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T00wI/D3mUZ5Hy+fNHHsyZ1OoaFWiEE3c2uEdk25JgoHeL2s6E3AmQC89hL0tqZlw
 DhU58ttbRkdisHUNDl2l92hvnuNDaR86ghAzu9PfG8FMxNnhQFgif/rwAvOZa5dr6H
 6p6m3dGGOrTsiSuh29o0ca8Bdt1y0pOjHW1NP3/mh8EeRnmjqY4C7cL3jKCuIZrxl6
 OB5xsRFJPR6SjAyrAD+1xC6Yai3sUt9vJl+VWBMZP7y0O+9pOzJr7ozF3rus/Z3cme
 1gpMkhJBt95o+V3zwkD6ppYwwQWI4oxyLHGn1pqv0qRBY76YDrHKSALtGpnFLNd4d9
 8ttlSW+BCtKsA==
MIME-Version: 1.0
Date: Wed, 30 Aug 2023 13:11:35 +0200
From: Michael Walle <mwalle@kernel.org>
To: =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: Re: [PATCH v7 09/11] drm/mediatek: dp: Add support for embedded
 DisplayPort aux-bus
In-Reply-To: <cce6f9c2-e0b6-47e4-ae1c-9a3d8a4e4b02@notapiano>
References: <20230725073234.55892-10-angelogioacchino.delregno@collabora.com>
 <20230825120109.3132209-1-mwalle@kernel.org>
 <5b438dba-9b85-4448-bc89-08a11ddb822a@notapiano>
 <fc6c054941420ac2d016496ccbeecad4@kernel.org>
 <00f65d49-497c-4ade-a2f3-7a5b7ad803b6@notapiano>
 <18bfffdd7ce3bd7693c8362b28651b49@kernel.org>
 <cce6f9c2-e0b6-47e4-ae1c-9a3d8a4e4b02@notapiano>
Message-ID: <7a3257dddac78c46408341253a3286f4@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
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
Cc: chunkuang.hu@kernel.org, amergnat@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 ehristev@collabora.com, wenst@chromium.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> While digging through the code I realized that all the outputs and 
>> pipelines
>> are harcoded. Doh. For all the mediatek SoCs. Looks like major 
>> restriction
>> to
>> me. E.g. there is also DSI and HDMI output on the mt8195. I looked at 
>> the
>> downstream linux and there, the output is not part of the pipeline. 
>> Are you
>> aware of any work in that direction?
> 
> I'm not sure I get what output and pipelines are hardcoded that you're 
> referring
> to (besides the one in the mtk-dsi/dpi driver that you already sent the 
> patch
> fixing).

Have a look at [1]. That main path ends with the DP_INTF0 which is the
eDP output. But from what I understand that path can also use the DSI
output. But that is a pattern for all the paths in that file. Looks like
all supported boards in the kernel will have the output type for a given
SoC/path (or maybe the mt8195 is the first one which supports different
output interfaces).

If you have a look at the mediatek kernel instead [2], there the last
part of the path is not fixed, but there is also a .conn_routes property
by which you seem to be able to choose the actual output interface.

I was just curious if you know of any development for that (or similar)
in the kernel.

-michael

> And I'm not familiar with the DSI and HDMI output support on MT8195, so 
> I can't
> help with that.
> 
> Thanks,
> Nícolas

[1] 
https://elixir.bootlin.com/linux/v6.5/source/drivers/gpu/drm/mediatek/mtk_drm_drv.c#L210
[2] 
https://gitlab.com/mediatek/aiot/bsp/linux/-/blob/mtk-v5.15-dev/drivers/gpu/drm/mediatek/mtk_drm_drv.c?ref_type=heads#L425
