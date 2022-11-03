Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE4A618918
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 20:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0074F10E2BF;
	Thu,  3 Nov 2022 19:56:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DD310E2BF
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 19:56:34 +0000 (UTC)
Received: from notapiano (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1BB04660295F;
 Thu,  3 Nov 2022 19:56:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667505392;
 bh=r3uuCl1jdRH8Jqbm5SAIzC2TzpgfqC792VBUHdoQyC0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XQTtf5uJmlOWcu/21JkiG0/r25aw1II4w2ymWeVMxecEC4zy0Bseq+gy+6fVrynGd
 v8PwkAw9mmcTRW54E3NbWG2xEvcHCS1Y5BEkVFR8zJvn1rZtPvnxvCHOBPeTPTHR6R
 KEsVzi/wOp2AMtcryLhaXQqgMdfJ8StE7Igb/woBN59VuF4IW5h82reDr5JM5L1Wno
 msNJhnXfm1I+UgERuRT0v0svOYIVM5agqVEbE4SPXr+wd1+bSTdbJBqnm7TXIlT/md
 +FcWVpNTdIpCR5k56g1clyIkQAFxBaI00K0dyMNCcj3+uoieGuWwTyVtx8wC3cfv21
 scb7+zoXgamRg==
Date: Thu, 3 Nov 2022 15:56:25 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Subject: Re: [PATCH v27 06/11] soc: mediatek: add mtk-mmsys config API for
 mt8195 vdosys1
Message-ID: <20221103195625.azajpe3vf5kxccar@notapiano>
References: <20221103032512.9144-1-nancy.lin@mediatek.com>
 <20221103032512.9144-7-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221103032512.9144-7-nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, wim@linux-watchdog.org,
 linux@roeck-us.net,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 03, 2022 at 11:25:07AM +0800, Nancy.Lin wrote:
> Add four mmsys config APIs. The config APIs are used for config
> mmsys reg. Some mmsys regs need to be set according to the
> HW engine binding to the mmsys simultaneously.
> 
> 1. mtk_mmsys_merge_async_config: config merge async width/height.
>    async is used for cross-clock domain synchronization.
> 2. mtk_mmsys_hdr_confing: config hdr backend async width/height.
[..]
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
[..]
> +void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int be_height)

confing -> config

Need to update the following commit as well.

Thanks,
Nícolas

> +{
> +	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8195_VDO1_HDRBE_ASYNC_CFG_WD, ~0,
> +			      be_height << 16 | be_width);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_hdr_confing);
[..]
> +void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int be_height);
[..]
