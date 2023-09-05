Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 176897920ED
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 10:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA1E10E17D;
	Tue,  5 Sep 2023 08:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B964710E17D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 08:03:14 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D307B660716C;
 Tue,  5 Sep 2023 09:03:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693900993;
 bh=ds0zLIqF4zHaiOeC7HqV5SxOUmkM7LOq32FcWWfWQTs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AlDblQi667rjIYA6FJV2mzSgLg+4xrfRl1ZNuOnlnIS4zfpfViTzPyJvRSQwrkcVu
 zjlXSX5c3Ep80HnoFh0XR2zyq3Fj/bgMrku2VemIW4I1cupd+pIj61I4auP98ZEAIS
 lt4XRE6EumQd960xed2+Kuupa6ikuZxYJH1XGefi4lmvqjK4C676/r1O+R4INI0FWy
 ltTrVNQsIFT2tpUnMwMwP4almUZMiJmSdezilqRASQW6xBTxDOfWtibrUU3MCC4eaY
 qVRhdzz13X/+QMWhGrNENeHsX2l6+KlumYlva5eWuiJM+Sd+DYqLtrQ2wIj+jQ9Zvi
 8l+GFdMdNs1mA==
Message-ID: <02380e49-7848-c968-ef6a-bc64d87d6228@collabora.com>
Date: Tue, 5 Sep 2023 10:03:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/2] drm/mediatek: dpi/dsi: fix possible_crtcs
 calculation
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>
References: <20230901174557.3617839-1-mwalle@kernel.org>
 <20230901174557.3617839-2-mwalle@kernel.org>
 <d7e6917d-7315-12d6-d7d4-dc7ea8c58dc9@collabora.com>
 <cf7d01700f5e5adf2f28b0376451143b@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <cf7d01700f5e5adf2f28b0376451143b@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>, Stu Hsieh <stu.hsieh@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 05/09/23 09:58, Michael Walle ha scritto:
>> At this point, I think that it would be sane to change this function to
>> return a signed type, so that we can return -ENOENT if we couldn't find
>> any DDP path (so, if we couldn't find any possible crtc).
> 
> Fair enough, but should it be part of the fixes commit or a different one?
> 
> -michael

I would say that this should be part of the Fixes commit: after all, you're
fixing a case in which the possible_crtcs calculation *may fail*, so the
error handling for this possible failure is, indeed, one part of the fix :-)

Angelo
