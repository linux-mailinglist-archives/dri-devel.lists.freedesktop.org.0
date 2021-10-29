Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 232DB43FB99
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 13:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E176EA3C;
	Fri, 29 Oct 2021 11:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785546EA3C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 11:42:18 +0000 (UTC)
Received: from [IPv6:2a02:810a:880:f54:6141:93b5:19a6:af87] (unknown
 [IPv6:2a02:810a:880:f54:6141:93b5:19a6:af87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7CB8E1F45953;
 Fri, 29 Oct 2021 12:42:16 +0100 (BST)
Subject: Re: [PATCH v8, 04/17] media: mtk-vcodec: Build decoder pm file as
 module
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Collabora Kernel ML <kernel@collabora.com>
References: <20211029035527.454-1-yunfei.dong@mediatek.com>
 <20211029035527.454-5-yunfei.dong@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <367efd7e-667c-6c0f-a36e-0eff6d323f48@collabora.com>
Date: Fri, 29 Oct 2021 13:42:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029035527.454-5-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 29.10.21 05:55, Yunfei Dong wrote:
> Need to build decoder pm file as module for master and comp
> use the same pm interface.

Do you still use the component framework in this patchset?
In the cover letter you write: "- Use of_platform_populate to manage multi hardware, not component framework for patch 4/15"
If that frameworks is not used anymore you should also change the commit log, and maybe this patch is not needed anymore?

Thanks,
Dafna
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v8: add new patch to build pm file as module
> ---
>   drivers/media/platform/mtk-vcodec/Makefile            | 6 ++++--
>   drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c | 9 +++++++++
>   2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
> index ca8e9e7a9c4e..5d36e05535d7 100644
> --- a/drivers/media/platform/mtk-vcodec/Makefile
> +++ b/drivers/media/platform/mtk-vcodec/Makefile
> @@ -2,7 +2,8 @@
>   
>   obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-dec.o \
>   				       mtk-vcodec-enc.o \
> -				       mtk-vcodec-common.o
> +				       mtk-vcodec-common.o \
> +				       mtk-vcodec-dec-common.o
>   
>   mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
>   		vdec/vdec_vp8_if.o \
> @@ -14,7 +15,8 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
>   		mtk_vcodec_dec.o \
>   		mtk_vcodec_dec_stateful.o \
>   		mtk_vcodec_dec_stateless.o \
> -		mtk_vcodec_dec_pm.o \
> +
> +mtk-vcodec-dec-common-y := mtk_vcodec_dec_pm.o
>   
>   mtk-vcodec-enc-y := venc/venc_vp8_if.o \
>   		venc/venc_h264_if.o \
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> index 20bd157a855c..09a281e3065a 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> @@ -77,12 +77,14 @@ int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
>   	put_device(pm->larbvdec);
>   	return ret;
>   }
> +EXPORT_SYMBOL_GPL(mtk_vcodec_init_dec_pm);
>   
>   void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm)
>   {
>   	pm_runtime_disable(pm->dev);
>   	put_device(pm->larbvdec);
>   }
> +EXPORT_SYMBOL_GPL(mtk_vcodec_release_dec_pm);
>   
>   int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
>   {
> @@ -94,6 +96,7 @@ int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
>   
>   	return ret;
>   }
> +EXPORT_SYMBOL_GPL(mtk_vcodec_dec_pw_on);
>   
>   void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
>   {
> @@ -103,6 +106,7 @@ void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
>   	if (ret)
>   		mtk_v4l2_err("pm_runtime_put_sync fail %d", ret);
>   }
> +EXPORT_SYMBOL_GPL(mtk_vcodec_dec_pw_off);
>   
>   void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
>   {
> @@ -129,6 +133,7 @@ void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
>   	for (i -= 1; i >= 0; i--)
>   		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
>   }
> +EXPORT_SYMBOL_GPL(mtk_vcodec_dec_clock_on);
>   
>   void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm)
>   {
> @@ -139,3 +144,7 @@ void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm)
>   	for (i = dec_clk->clk_num - 1; i >= 0; i--)
>   		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
>   }
> +EXPORT_SYMBOL_GPL(mtk_vcodec_dec_clock_off);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Mediatek video decoder driver");
> 
