Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 582105B92B2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 04:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7B210E159;
	Thu, 15 Sep 2022 02:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D9388867
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 02:37:28 +0000 (UTC)
X-UUID: ab7de8d4908a483e840d2e13d01d0fb8-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Tfm9WqDKMMDTh8ScYXfRfETUOk5oUA8teQhQ5zsKe1k=; 
 b=H7f4cfwj/dYJhpcu5refZH+xF6Be+qC4/tnWABomBIb+qTrrAlXEcXRt0wPZWw7qmUD/JNPC14P8UJq/4kiWcZ0CgDvGPRJPWWcITzjKBw2lnySHWyzzm2IxBnE96G0Z4x/6+oOTFqsDNUb/8AtE/f280cbkawUznomjcEXbE2w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:c3aa6675-6117-4a16-82b0-c9c0799d04a7, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:39a5ff1, CLOUDID:61bdad7b-ea28-4199-b57e-003c7d60873a,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ab7de8d4908a483e840d2e13d01d0fb8-20220915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 283273672; Thu, 15 Sep 2022 10:37:18 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Sep 2022 10:37:17 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 15 Sep 2022 10:37:16 +0800
Message-ID: <a7606a4a3f336f63545ae2d5131a6e38b5bababe.camel@mediatek.com>
Subject: Re: [PATCH v7, 2/4] drm/mediatek: Separate poweron/poweroff from
 enable/disable and define new funcs
From: xinlei.lee <xinlei.lee@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>
Date: Thu, 15 Sep 2022 10:37:14 +0800
In-Reply-To: <7a5b9c8a-f074-e6ce-d458-61068452e43f@collabora.com>
References: <1653012007-11854-1-git-send-email-xinlei.lee@mediatek.com>
 <1653012007-11854-3-git-send-email-xinlei.lee@mediatek.com>
 <7a5b9c8a-f074-e6ce-d458-61068452e43f@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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
Cc: jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-07-21 at 19:28 +0200, AngeloGioacchino Del Regno wrote:
> Il 20/05/22 04:00, xinlei.lee@mediatek.com ha scritto:
> > From: Jitao Shi <jitao.shi@mediatek.com>
> > 
> > In order to match the changes of "Use the drm_panel_bridge API",
> > the poweron/poweroff of dsi is extracted from enable/disable and
> > defined as new funcs (atomic_pre_enable/atomic_post_disable).
> > 
> > Since dsi_poweron is moved from dsi_enable to pre_enable function,
> > in
> > order to avoid poweron failure, the operation of dsi register fails
> > to
> > cause bus hang. Therefore, the protection mechanism is added to the
> > dsi_enable function.
> > 
> > Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the
> > drm_panel_bridge API")
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 
> Hello Xinlei, CK, maintainers:
> 
> This patch is breaking machines that are using a DSI->DisplayPort
> bridge (like
> the ANX7625 chip), but that's not the main issue.
> 
> ----> I have never given a Reviewed-by tag for this commit <----
> 
> It's true I've given my tag for an older version [1] of this one,
> which was *not*
> using atomic_* callbacks and that one worked fine (which is why I
> gave you
> my R-b tag for it).
> 
> You have changed commits in this series to use atomic_(pre_)enable
> callbacks
> but kept my tag, which is seriously wrong - and even more, because
> it's actually
> breaking display support for a generous number of Chromebooks
> upstream.
> 
> 
> Please be careful next time and ask for a new review when you make
> substantial
> changes to your commits.
> 
> 
> Anyway, I have already sent a fix for this situation, please look at
> [2].
> 
> Regards,
> Angelo
> 
> [1]: 
> 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/1649644308-8455-3-git-send-email-xinlei.lee@mediatek.com/__;!!CTRNKA9wMg0ARbw!w_fzKvfOShPFrK2vYxBTHs_hi6kORmXAKzNeFORzxRKuNfk8_8Ogvf3h4bPwfjmukw$
>  
> 
> [2]: 
> 
https://lore.kernel.org/lkml/20220721172727.14624-1-angelogioacchino.delregno@collabora.com/T/#u
> 
> > ---
> >   drivers/gpu/drm/mediatek/mtk_dsi.c | 53 +++++++++++++++++++----
> > -------
> >   1 file changed, 34 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index f880136cec09..d9a6b928dba8 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -691,16 +691,6 @@ static void mtk_dsi_poweroff(struct mtk_dsi
> > *dsi)
> >   	if (--dsi->refcount != 0)
> >   		return;
> >   
> > -	/*
> > -	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
> > -	 * mtk_dsi_stop() should be called after
> > mtk_drm_crtc_atomic_disable(),
> > -	 * which needs irq for vblank, and mtk_dsi_stop() will disable
> > irq.
> > -	 * mtk_dsi_start() needs to be called in
> > mtk_output_dsi_enable(),
> > -	 * after dsi is fully set.
> > -	 */
> > -	mtk_dsi_stop(dsi);
> > -
> > -	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
> >   	mtk_dsi_reset_engine(dsi);
> >   	mtk_dsi_lane0_ulp_mode_enter(dsi);
> >   	mtk_dsi_clk_ulp_mode_enter(dsi);
> > @@ -715,17 +705,9 @@ static void mtk_dsi_poweroff(struct mtk_dsi
> > *dsi)
> >   
> >   static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
> >   {
> > -	int ret;
> > -
> >   	if (dsi->enabled)
> >   		return;
> >   
> > -	ret = mtk_dsi_poweron(dsi);
> > -	if (ret < 0) {
> > -		DRM_ERROR("failed to power on dsi\n");
> > -		return;
> > -	}
> > -
> >   	mtk_dsi_set_mode(dsi);
> >   	mtk_dsi_clk_hs_mode(dsi, 1);
> >   
> > @@ -739,7 +721,16 @@ static void mtk_output_dsi_disable(struct
> > mtk_dsi *dsi)
> >   	if (!dsi->enabled)
> >   		return;
> >   
> > -	mtk_dsi_poweroff(dsi);
> > +	/*
> > +	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
> > +	 * mtk_dsi_stop() should be called after
> > mtk_drm_crtc_atomic_disable(),
> > +	 * which needs irq for vblank, and mtk_dsi_stop() will disable
> > irq.
> > +	 * mtk_dsi_start() needs to be called in
> > mtk_output_dsi_enable(),
> > +	 * after dsi is fully set.
> > +	 */
> > +	mtk_dsi_stop(dsi);
> > +
> > +	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
> >   
> >   	dsi->enabled = false;
> >   }
> > @@ -776,13 +767,37 @@ static void
> > mtk_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
> >   {
> >   	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> >   
> > +	if (dsi->refcount == 0)
> > +		return;
> > +
> >   	mtk_output_dsi_enable(dsi);
> >   }
> >   
> > +static void mtk_dsi_bridge_atomic_pre_enable(struct drm_bridge
> > *bridge,
> > +					     struct drm_bridge_state
> > *old_bridge_state)
> > +{
> > +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> > +	int ret;
> > +
> > +	ret = mtk_dsi_poweron(dsi);
> > +	if (ret < 0)
> > +		DRM_ERROR("failed to power on dsi\n");
> > +}
> > +
> > +static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge
> > *bridge,
> > +					       struct drm_bridge_state
> > *old_bridge_state)
> > +{
> > +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> > +
> > +	mtk_dsi_poweroff(dsi);
> > +}
> > +
> >   static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
> >   	.attach = mtk_dsi_bridge_attach,
> >   	.atomic_disable = mtk_dsi_bridge_atomic_disable,
> >   	.atomic_enable = mtk_dsi_bridge_atomic_enable,
> > +	.atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
> > +	.atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
> >   	.mode_set = mtk_dsi_bridge_mode_set,
> >   };
> >   

Hi Angelo:

I am deeply sorry for the problems caused by this patch. 
I understand what you said. If there are substantial changes, I will 
re-request for review. Thank you again for your help.

Best Regards!
xinlei

