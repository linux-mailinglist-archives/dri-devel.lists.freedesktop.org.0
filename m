Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8CC621D29
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 20:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC9110E4FC;
	Tue,  8 Nov 2022 19:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AD110E4FC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 19:44:01 +0000 (UTC)
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 78F166602901;
 Tue,  8 Nov 2022 19:43:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667936640;
 bh=6IPOHqPNCs5nNHtjv5U5pfU8G/tXeRydSVK9DQqoUkM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nPXE7p8WqjCGRkfHD/65NWImZPY/i2vIC/StyEb0unYuDap47EAXgfs0u0q+jgkms
 szfJr9WEm99QqrmKzOpP89A42+huD66hckwCuLM0R3+N+IFoV39yh7a+QpsW8gw7DX
 2zPICGRqXjO+jW8lAQdr2juuUiF1kdUR4c05x3VegIw5U11c6+vFBrvPUKGQoBVC9i
 Zeigx9Buktk7dcxN7rQc3OYffrGPxgm3zyM4aMiPot03Z3MUIQTApS554yekyKx5nx
 eIMg/kLlDa5nirPo0oE6en73dqAHwlCV0ZIgG7l6OXr19HoFkUPC0tpLZcKj+zsOZV
 wjbU2tKpgfHZw==
Date: Tue, 8 Nov 2022 14:43:51 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v28 05/11] soc: mediatek: refine code to use
 mtk_mmsys_update_bits API
Message-ID: <20221108194351.u63k4mqzq3bkhpl7@notapiano>
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
 <20221107072243.15748-6-nancy.lin@mediatek.com>
 <58d55016-afc7-e560-32cf-8228794b5752@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58d55016-afc7-e560-32cf-8228794b5752@gmail.com>
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
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>, "Nancy.Lin" <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wim@linux-watchdog.org, singo.chang@mediatek.com, linux@roeck-us.net,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 08, 2022 at 06:37:19PM +0100, Matthias Brugger wrote:
> 
> 
> On 07/11/2022 08:22, Nancy.Lin wrote:
> > Simplify code for update  mmsys reg.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> >   drivers/soc/mediatek/mtk-mmsys.c | 45 ++++++++++++--------------------
> >   1 file changed, 16 insertions(+), 29 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> > index 9a327eb5d9d7..73c8bd27e6ae 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -99,22 +99,27 @@ struct mtk_mmsys {
> >   	struct reset_controller_dev rcdev;
> >   };
> > +static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
> > +{
> > +	u32 tmp;
> > +
> > +	tmp = readl_relaxed(mmsys->regs + offset);
> > +	tmp = (tmp & ~mask) | (val & mask);
> 
> I'm not sure about the change in the implementation of
> mtk_mmsys_update_bits(). Nicolas tried to explain it to me on IRC but I
> wasn't totally convincing. As we have to go for at least another round of
> this patches, I'd like to get a clear understanding while it is needed that
> val bits are set to 1 in the mask.

The point here was to make sure that mtk_mmsys_update_bits() didn't allow
setting bits outside of the mask, since that's never what you want: the entire
point of having a mask is to specify the bits that should be updated (and the
ones that should be kept unchanged). So for example if you had

mask = 0x0ff0
val  = 0x00ff

the previous implementation would happily overwrite the 4 least significant bits
on the destination register, despite them not being present in the mask, which
is wrong.

This wrong behavior could easily lead to hard to trace bugs as soon as a badly
formatted/wrong val is passed and an unrelated bit updated due to the mask being
ignored.

For reference, _regmap_update_bits() does the same masking of the value [1].

That said, given that this function already existed and was just being moved,
it would've been cleaner to make this change in a separate commit.

[1] https://elixir.bootlin.com/linux/latest/source/drivers/base/regmap/regmap.c#L3122

Thanks,
Nícolas

> 
> Regards,
> Matthias
> 
> > +	writel_relaxed(tmp, mmsys->regs + offset);
> > +}
[..]
> > -static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
> > -{
> > -	u32 tmp;
> > -
> > -	tmp = readl_relaxed(mmsys->regs + offset);
> > -	tmp = (tmp & ~mask) | val;
> > -	writel_relaxed(tmp, mmsys->regs + offset);
> > -}
> > -
[..]
