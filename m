Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC79A575D87
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 10:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F3011BABA;
	Fri, 15 Jul 2022 08:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EFE11BAC7
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 08:34:14 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6D8E96601A3F;
 Fri, 15 Jul 2022 09:34:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657874052;
 bh=GqdfRsVfLCo2VWTEZGi7k9cm/HFoOJvuQH77gu2Dunk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KDykdN7WZCR7CkUpY6NB2K+XHNXANiCEgbnbDDyNtLQO+Qv9R7uewhqvy+GEBUG+m
 zF0dpvL03LKbH0xuWIZTe0YM9siRdZPpvMPwmXml/sWj7pZgzyVIuQ7LMKvzr4B1Gy
 +o2wih/tmqc/VMear4eT7zwT5JJsM+/JmLQ9l2wbJ2C6JaK46t85ICGq3y+thP4oij
 SdAhjQoblPVlXJr9gi1X5H2A5EVGDu54+XGwNL40UItP0cinnqzLoW3mY2pFCIT2WY
 KZ8u9J1TpPTDdnJrIliFzslcKliKjGlIerzie0waovd8PpYSPUVI+jpDOeMjc7lFya
 DDOQ6Kybdxq2Q==
Message-ID: <6d8aeee4-9732-1c62-67e0-6e8f56373aa6@collabora.com>
Date: Fri, 15 Jul 2022 10:34:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RESEND] media: mediatek: vcodec: Add to support VP9 inner racing
 mode
Content-Language: en-US
To: Mingjia Zhang <mingjia.zhang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
References: <20220715064938.5812-1-mingjia.zhang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220715064938.5812-1-mingjia.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Il 15/07/22 08:49, Mingjia Zhang ha scritto:
> In order to reduce decoder latency, enable VP9 inner racing mode.
> Send lat trans buffer information to core when trigger lat to work,
> need not to wait until lat decode done.
> 
> Signed-off-by: mingjia zhang <mingjia.zhang@mediatek.com>
> ---
> CTS/GTS test pass

CTS/GTS passing is a good indication but, please, test with GStreamer (and
show the output, as well!).

Thanks,
Angelo

> ---
>   .../vcodec/vdec/vdec_vp9_req_lat_if.c         | 64 ++++++++++++-------
>   1 file changed, 40 insertions(+), 24 deletions(-)
> 
