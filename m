Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9FC5BC3E8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 10:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365B210E568;
	Mon, 19 Sep 2022 08:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B14E10E568
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 08:05:28 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 792E96601A05;
 Mon, 19 Sep 2022 09:05:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663574727;
 bh=zXPTcvw/TefhoaPSogtRftO+DMhN8kcfYVae45CwGHw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CalT+fawla8opHrjOOc6bXxxBDHsNqDG7NXNc82xjT+R/AEjNMGxy3Hdqkxqj3ldK
 5W1ZxbUKOLqrhRWfQcb9Y7A74ArrN+3zoq3bPkpxa6t/o8b8V2jd5cXM8ZGqrCS/B3
 4tS7hVImGsEZyn28ytCXbEqLgKua+LbxeMxZDB1xTxTg2KFEKHfgjgOb1skXeKBB3u
 OUwit8fhknIZqcvNC0b6hw1D+Esx7b0gdR/55U7snrLfEV74c5DhpSTcEDxtzX/qH6
 gEKhqx1oriiXT4tgCFEv84oFKhzZYwvXB4PwVmnwB7kPvc9XbVzfMzwGgk5GVwQnqd
 N/2J+CDuqPFsQ==
Message-ID: <673d61a1-1c92-04b3-523b-1852c7980358@collabora.com>
Date: Mon, 19 Sep 2022 10:05:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 3/3] drm/mediatek: dp: Fix warning in
 mtk_dp_video_mute()
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie
References: <20220916133821.27980-1-rex-bc.chen@mediatek.com>
 <20220916133821.27980-4-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220916133821.27980-4-rex-bc.chen@mediatek.com>
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

Il 16/09/22 15:38, Bo-Chen Chen ha scritto:
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
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
> Reported-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


