Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B37295134DA
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 15:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C8E10E9E6;
	Thu, 28 Apr 2022 13:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1883F10E9E6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 13:19:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A8C9A1F4536D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651151987;
 bh=Y6r9EqSsbh3Dq7eavxiGIUP0pwnIFPvRrJcfm6QBnE8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HEe0sCPkAkBWKZhzzUzZdry5WIJSxY16gc5VTbcu1Iyil/jW5t1lblH6ZqHf2Lt8C
 tiuM8VRrJwFmYeZkQN2rfaI6SPqlYGF6+1F2S2pOkpVBM8ovivkkJNQco9jS8F3BM5
 3YxtmrigFaC8xRHW1vhw9UdHMzkzmj7oiUTSvUD5ov/B/RhGRkOnZRIN4qOogvE6S2
 Cxun4IVDrPxULNPup5cydHWqsrr61aCcOX208KEOdAfFsGonglKjlezDsgnTQpXH7i
 sdlrxLr7Lw8QEkT/MmxCyRu6PrYFUEYJY5ou/byucvEqeX5chpKT/5PtuQF+m5UJdj
 KTe6P5o2Fpz3Q==
Message-ID: <88ddf1ba-9395-cd40-53f5-25d1d2f9ef9e@collabora.com>
Date: Thu, 28 Apr 2022 15:19:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4, 1/1] drm/mediatek: add lut diff flag for new gamma
 hardware support
Content-Language: en-US
To: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20220428085829.15855-1-yongqiang.niu@mediatek.com>
 <20220428085829.15855-2-yongqiang.niu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220428085829.15855-2-yongqiang.niu@mediatek.com>
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
Cc: Yongqiang Niu <yongqiang.niu@mediatek.corp-partner.google.com>,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 David Airlie <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 28/04/22 10:58, Yongqiang Niu ha scritto:
> From: Yongqiang Niu <yongqiang.niu@mediatek.corp-partner.google.com>
> 
> mt8183 gamma module usage is different with before soc,
> gamma odd(index start from 0) lut value set to hardware
> register should be
> the difference of current lut value with last lut value.
> 
> for example, chrome os user space set lut
> like this(only r chanel for example):
> 2 4 6 8 10 12.
> 1) mt8183 gamma driver should set the gamma lut to hardware
> register like this:
> 2 [2] 6 [2] 10 [2]
> the value with [] is the difference value
> 2)gamma hardware process display data with original lut
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


