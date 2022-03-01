Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB584C938A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 19:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C675C10E750;
	Tue,  1 Mar 2022 18:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868CF10E750
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 18:50:06 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id b20so6298599qkn.9
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 10:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=tR+m3BKtc2q7T6REjyTd+tbxkuYAbwb84wcNcVtcDDo=;
 b=qv5pnnvk7TeB5F2VVork6VcyASkHuuOWpbcXzJ/cyRI1+PmIYBs0U/EhxwQ2jdj+iz
 ctAJe9aKpLrV9V6eod+MqOLF+7QiLy6rK3fu33GePVDsbqQmnuhE4iWBKDcnPXK3Xv76
 KPohYg/mFz2m3Zsr2NedsoI1aJoRw2JRXFjNubOcth+U1/2fAxw4X9GX4vE685YUHQ28
 sQv3PydxnGXuozXRJ9RMqeXb8xDJBTJmcf91k/L9cFuON1fxzCJlrb/gUoRQiVr/NaQV
 7BSHai6kmrDU03Az1bPf2EYC2mSqSYYo5T5M1N0vBIFrL5rK9XKddEJohWn7UTm7gZrd
 AdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=tR+m3BKtc2q7T6REjyTd+tbxkuYAbwb84wcNcVtcDDo=;
 b=kxtXaAHi1giJaAS1vukhP88S0EfTqab+fVrdqa7rVTEvznPgkuxzHDbre1hbnopkmf
 ZfYmMUozQVbJ3DrH1bia0td+s2xGY6xsAeyD4X3OSuQd78maDeazTcYLUU5UxhUFnkpT
 Wl21FIrv3XCFLDx+PDi0JiV1qI9VHzct72QLGarcjPaygWxpt4CTD3MvPVgfL+nM7VLX
 fbmdKRd6//SVK3852ASIH9y3/b5efaIjSyeiaPPDL+0H7Fkbp1CxyJrmG5bREKmXbwnw
 ITjjRtGLtxh20SKilkISYfMEFWi4ds/zN2aogUzWbXT3LKiLQVAX3jAIbPqVRW06noJO
 O2Ig==
X-Gm-Message-State: AOAM530KUKPISVwucqOuKv1YUkOcdDeNVm6WA91354YOh/gSlkfl88DI
 OrbNE0CernxYsZiQZlbKCZG85Q==
X-Google-Smtp-Source: ABdhPJzSf4CtwvIG03wik3crXOBqVn2fR41pWQVrAZp/7qf1AZE3+yMudYLmNy+Tlo28zIT/Kyx94g==
X-Received: by 2002:a37:6c45:0:b0:478:a755:8845 with SMTP id
 h66-20020a376c45000000b00478a7558845mr14371883qkc.362.1646160605528; 
 Tue, 01 Mar 2022 10:50:05 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net.
 [173.246.12.168]) by smtp.gmail.com with ESMTPSA id
 h17-20020a37de11000000b0047caf996ef8sm7044983qkj.20.2022.03.01.10.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 10:50:05 -0800 (PST)
Message-ID: <9d44d2136ba60e7471ea82551f4cfed2c030ce2b.camel@ndufresne.ca>
Subject: Re: [PATCH v7, 05/15] media: mtk-vcodec: Call
 v4l2_m2m_set_dst_buffered() set capture buffer buffered
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi
 Shih <tzungbi@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Date: Tue, 01 Mar 2022 13:50:03 -0500
In-Reply-To: <20220223034008.15781-6-yunfei.dong@mediatek.com>
References: <20220223034008.15781-1-yunfei.dong@mediatek.com>
 <20220223034008.15781-6-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Steve Cho <stevecho@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mercredi 23 février 2022 à 11:39 +0800, Yunfei Dong a écrit :
> lat thread: output queue      \
>                                -> lat hardware -> lat trans buffer
>             lat trans buffer  /
> 
> core thread: capture queue     \
>                                 ->core hardware -> capture queue
>              lat trans buffer  /
> 
> Lat and core work in different thread, setting capture buffer buffered.

... so that output queue buffers (bitstream) can be process regardless if there
is available capture buffers.

I have concerns around the usefulness of running a dedicated thread to drive the
lat and the core blocks. Having 3 threads (counting the m2m worker thread) here
increase the complexity. The hardware is asynchronous by definition. I think
this patch will go away after a proper rework of the driver thread model here.

> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> index 5aebf88f997b..23a154c4e321 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> @@ -314,6 +314,9 @@ static void mtk_init_vdec_params(struct mtk_vcodec_ctx *ctx)
>  	src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
>  				 V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>  
> +	if (ctx->dev->vdec_pdata->hw_arch != MTK_VDEC_PURE_SINGLE_CORE)
> +		v4l2_m2m_set_dst_buffered(ctx->m2m_ctx, 1);
> +
>  	/* Support request api for output plane */
>  	src_vq->supports_requests = true;
>  	src_vq->requires_requests = true;

