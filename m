Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE804F5EEF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 15:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1A510E10F;
	Wed,  6 Apr 2022 13:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFA410E10F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 13:14:57 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id cs16so2167701qvb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 06:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=8N0CvfLws0NLfRseiGnNqJN6eohHipGooNObOqOlBoc=;
 b=EvQQ/HwBH9nTQj1t5326cVr1a8c+tpiFpSw2vuQcKK4x1e0TX8OBzNpnPZ096XFsrE
 0ReG2cE6XRXkl41gyZjT1S/DgUXamBCWr4HVULUDSQM2wWOOPKeRifJ5M6EXG2QzqlZc
 rW69m0WEf3gxCTxUmY2EuNEMZu9dgd4aWHjmhCZHXdDbhC8OSIdOWbLE64/7BLNiW3X2
 kBP2BEgL7y7aFgyN3ebhig0yxbvsPW0+UHATP2UhXGdpweSmVBjQq/HX9htgqGjYbsQg
 jjAWm0ttcxyAOtfp1LxwQ0cRTv8+AsL2Fx1Y2MQxfqDJ3dvKWOVv0BxVUknTX3MAsC6A
 3Ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=8N0CvfLws0NLfRseiGnNqJN6eohHipGooNObOqOlBoc=;
 b=5+qFOHBYggIxEcfS4qkhZ42JqYOx+gQ80rCqYDGCFfR7NV1TxTjy70Z7/pL3eVdHSu
 4BIvhIn8VLNf4TPxRs5Vy1oqsfS6uQC74V5wR+hN2fFXWiwUWcdj6JIdILhtbnNPFjAJ
 NPS3fXxZwZMRBswkuSkU6OTbyiSdq1H6F+sx33oG0sjt/l+1pcgqPSyYfU5hEs4rhuiZ
 JtqD6gfmq+unEPaBB7/3hAJ5Lk5A+E3EQSkvEDztB++dsLoqjmlAETZ+I7ENki5jKhfv
 dN2cHQ6wg6zdafFJzrJp2a2AMJEn3c5wQIsAmVEO24MGWiOxa5iDZyKnEiXlvYRtkT+1
 OzIw==
X-Gm-Message-State: AOAM532vXVfkNgoJd816CEzs50tOj6C+2t/B32dvy9m38KgjxUF3V0EA
 o/ikQs6XgZs7OfNdD/hH6ej4rw==
X-Google-Smtp-Source: ABdhPJySaVPBdyzFHzfJKSHKkPd1JA+dpYpBIJIxwqBWJeTCDsXQB8+GyZydfPlDh/ZW4wIZUkA5IQ==
X-Received: by 2002:a05:6214:4011:b0:443:e253:61fc with SMTP id
 kd17-20020a056214401100b00443e25361fcmr6868372qvb.110.1649250896805; 
 Wed, 06 Apr 2022 06:14:56 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net.
 [173.246.12.168]) by smtp.gmail.com with ESMTPSA id
 t67-20020ae9df46000000b006809a144ac1sm10369209qkf.99.2022.04.06.06.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 06:14:56 -0700 (PDT)
Message-ID: <5c200bbb0e2d73642115649f05f945840b0ef67a.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: Fix v4l2 compliance decoder
 cmd test fail
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Tomasz
 Figa <tfiga@google.com>
Date: Wed, 06 Apr 2022 09:14:54 -0400
In-Reply-To: <20220406012048.5970-1-yunfei.dong@mediatek.com>
References: <20220406012048.5970-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
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

Le mercredi 06 avril 2022 =C3=A0 09:20 +0800, Yunfei Dong a =C3=A9crit=C2=
=A0:
> Will return -EINVAL using standard framework api when test stateless
> decoder with cmd VIDIOC_(TRY)DECODER_CMD.
>=20
> Using another return value to adjust v4l2 compliance test for user
> driver(GStreamer/Chrome) won't use decoder cmd.
>=20
> Fixes: 8cdc3794b2e3 ("media: mtk-vcodec: vdec: support stateless API")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> changes compared with v2:
> - add reviewed-by tag
> changes compared with v1:
> - add Fixes: tag
> ---
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/dr=
ivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> index 3859e4c651c6..69b0e797d342 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> @@ -51,8 +51,7 @@ static int vidioc_try_decoder_cmd(struct file *file, vo=
id *priv,
> =20
>  	/* Use M2M stateless helper if relevant */
>  	if (ctx->dev->vdec_pdata->uses_stateless_api)
> -		return v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv,
> -								cmd);
> +		return -ENOTTY;
>  	else
>  		return v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
>  }

