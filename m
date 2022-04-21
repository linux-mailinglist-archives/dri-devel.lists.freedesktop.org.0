Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89F3509DF9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 12:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7C510F3D1;
	Thu, 21 Apr 2022 10:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1041D10F33B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 10:48:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 297F761A88;
 Thu, 21 Apr 2022 10:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D38FC385A5;
 Thu, 21 Apr 2022 10:48:00 +0000 (UTC)
Message-ID: <678a06f5-0519-dab3-35ac-5915b47d422e@xs4all.nl>
Date: Thu, 21 Apr 2022 12:47:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] media: mediatek: vcodec: Fix v4l2 compliance decoder cmd
 test fail
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
References: <20220406012048.5970-1-yunfei.dong@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220406012048.5970-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/04/2022 03:20, Yunfei Dong wrote:
> Will return -EINVAL using standard framework api when test stateless
> decoder with cmd VIDIOC_(TRY)DECODER_CMD.
> 
> Using another return value to adjust v4l2 compliance test for user
> driver(GStreamer/Chrome) won't use decoder cmd.
> 
> Fixes: 8cdc3794b2e3 ("media: mtk-vcodec: vdec: support stateless API")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> changes compared with v2:
> - add reviewed-by tag
> changes compared with v1:
> - add Fixes: tag
> ---
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> index 3859e4c651c6..69b0e797d342 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> @@ -51,8 +51,7 @@ static int vidioc_try_decoder_cmd(struct file *file, void *priv,
>  
>  	/* Use M2M stateless helper if relevant */
>  	if (ctx->dev->vdec_pdata->uses_stateless_api)
> -		return v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv,
> -								cmd);
> +		return -ENOTTY;
>  	else
>  		return v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
>  }

So in other words, if the stateless api is used, then (TRY_)DECODER_CMD
is not implemented. And that's because this driver doesn't set the
V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF capability as that's not needed.
And so there is no need for (TRY_)DECODER_CMD to be implemented.

If that's the case, then it is much better to just disable these two
ioctls with v4l2_disable_ioctl() if the stateless API is used.

And just drop the uses_stateless_api checks in both vidioc_try_decoder_cmd
and vidioc_decoder_cmd. This patch only changed vidioc_try_decoder_cmd,
but of course vidioc_decoder_cmd needs to be modified as well.

Regards,

	Hans
