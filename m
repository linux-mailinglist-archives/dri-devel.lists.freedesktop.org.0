Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB40464D8B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 13:09:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F846ECD4;
	Wed,  1 Dec 2021 12:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1574F6ECD4
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 12:09:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 42FF61F458EC
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638360541; bh=Pph0h28u90fWIpAEnT37cWqdNQe0Gk7uaTOWOIg4P9Q=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Vp1a4AnNC/hCYZImxafQPXGE6lBaxAJp+NpFtPmFYARGG2tdk+b0/U3v/ustS4H9i
 FOI0ql6mGk9KG0SaguWGmT6UhxEwnGwSmL+2qwZIywym1GVTRPNz24PHdlOSoHySWu
 XsicMKGJWClwyRyX+Ja3p0V4w8pMICqADb/r1CZjrz+F/x4pshyu2+wWx2XYRrF09G
 7Nf4XpjfXAvLfyiql6V/l9x0v1pAatAEAB4JqRfbQd43e4j7sJQH/yjOVeLixF+vSv
 gTGDoYq6xP8fjVjYw4geuQp2PQzBvMkVn7LvTmLJSkHme3Cf1NG2FTPqQ1z6gxCZp3
 FG0bomir76f/g==
Subject: Re: [PATCH v11, 19/19] media: mtk-vcodec: Remove
 mtk_vcodec_release_enc_pm
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
References: <20211129034201.5767-1-yunfei.dong@mediatek.com>
 <20211129034201.5767-20-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <5d235ba6-213a-598f-e18f-93b51e535285@collabora.com>
Date: Wed, 1 Dec 2021 13:08:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211129034201.5767-20-yunfei.dong@mediatek.com>
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
Cc: Irui Wang <irui.wang@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 29/11/21 04:42, Yunfei Dong ha scritto:
> There are only two lines in mtk_vcodec_release_enc_pm, using
> pm_runtime_disable and put_device instead directly.
> 
> Move pm_runtime_enable outside mtk_vcodec_release_enc_pm to symmetry with
> pm_runtime_disable, after that, rename mtk_vcodec_init_enc_pm to *_clk since
> it only has clock operations now.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Co-developed-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 9 ++++++---
>   drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c  | 9 +--------
>   drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h  | 3 +--
>   3 files changed, 8 insertions(+), 13 deletions(-)
> 





Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
