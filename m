Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D41875B98CF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 12:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027CC10E191;
	Thu, 15 Sep 2022 10:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276B510E191
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 10:31:38 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B010D6601AAA;
 Thu, 15 Sep 2022 11:31:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663237896;
 bh=cp5+P5/eVC23Y06aMDu4G9zzQ4tDw1bLiEbcJtyd80A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Plecua1coG6nM5wiavPLyXNtL+1mi3IgE/uuxr/sDXXrnL7UL0/rsy8a0BB9YsGQa
 bUvAgi5OYqC8DMeoBfn+glTb5WoI5B58uyGSQvU4nb5TdAafX7/96e4ZKUIOu4X7rN
 GAGzC57HMwohszCXz1QtqCG0jsNiZkojeIKBLKdeni42ieKLfgsm3uhdZn+JNlfpu0
 gitiIFFDpA/DqA8j+xUarGfqhonkfDEC3QkvQspD2WH+Sx/IGE0K1I8H9ttNt0vlLM
 +HKtQ4YvaVQ1sMW/2ZwbVFRmQ7RCZM/mQfp7ppL/iTf3tOdJJ/eA1UXOm1iCWXO6+r
 jOrmAH0BdouLg==
Message-ID: <6ac75c74-e706-bfa5-98dc-a0950a776302@collabora.com>
Date: Thu, 15 Sep 2022 12:31:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 3/3] drm/mediatek: dp: Fix warning in mtk_dp_video_mute()
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie
References: <20220915075028.644-1-rex-bc.chen@mediatek.com>
 <20220915075028.644-4-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220915075028.644-4-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 15/09/22 09:50, Bo-Chen Chen ha scritto:
> Warning:
> ../drivers/gpu/drm/mediatek/mtk_dp.c: In function ‘mtk_dp_video_mute’:
> ../drivers/gpu/drm/mediatek/mtk_dp.c:947:23: warning: format ‘%x’
> expects argument of type ‘unsigned int’, but argument 4 has type ‘long
> unsigned int’ [-Wformat=]
>    947 |  dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: 0x%x, ret: 0x%lx-0x%lx\n",
>        |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/dev_printk.h:129:27: note: in definition of macro ‘dev_printk’
>    129 |   _dev_printk(level, dev, fmt, ##__VA_ARGS__);  \
>        |                           ^~~
> ../include/linux/dev_printk.h:163:31: note: in expansion of macro ‘dev_fmt’
>    163 |   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
>        |                               ^~~~~~~
> ../drivers/gpu/drm/mediatek/mtk_dp.c:947:2: note: in expansion of
> macro ‘dev_dbg’
>    947 |  dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: 0x%x, ret: 0x%lx-0x%lx\n",
>        |  ^~~~~~~
> ../drivers/gpu/drm/mediatek/mtk_dp.c:947:36: note: format string is defined here
>    947 |  dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: 0x%x, ret: 0x%lx-0x%lx\n",
>        |                                   ~^
>        |                                    |
>        |                                    unsigned int
>        |                                   %lx
> 
> To fix this issue, we use %s to replace 0x%x.
> 
> Reported-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Please add a Fixes tag to this commit.

Thanks,
Angelo.


