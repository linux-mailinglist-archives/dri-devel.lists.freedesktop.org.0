Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3277CBFB0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 11:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0927410E2AC;
	Tue, 17 Oct 2023 09:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560A010E2AC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 09:41:12 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DB11166072E4;
 Tue, 17 Oct 2023 10:41:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697535671;
 bh=uWopz2l4ztZi8CjWSNtPqJmsfX3SAwxisTyb3uW4K9Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YnAkHri1PFq3SlqsU5RkPFJFbj5O5ZbLnTuXp9y3BAkedLQu2JUqQ5UQe9e9dPnwE
 Qm1J/IE68xyiWtFpuvbIdj+GDINugnH/JwVjRhbTuXgLzs9qQ8TF8rVMMtrv+Km7q4
 id5zWDCqUbXvPRUoiDZ+AnVuph74xvMAZ5RvjODk244QzcHWsRRVNnce8gEQHB3ytZ
 uRKJyp4TIv/eOX9+cx358V3RWZMudce6RS44c94kDDKwnq/g96ojrEPH5l/OL9elnn
 +3xz0oVAToJ1JzgjQ2dcB2KRd5BdSSSMjT2CFnGSidMvCNAANtuwl6RsIzQwRgyInQ
 ssONO8WMuGNrw==
Message-ID: <3aa34fa5-1dea-4cbf-8a31-a405581edbe8@collabora.com>
Date: Tue, 17 Oct 2023 11:41:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 15/23] drm/mediatek: Manage component's clock with
 function pointers
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20231016104010.3270-1-shawn.sung@mediatek.com>
 <20231016104010.3270-16-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231016104010.3270-16-shawn.sung@mediatek.com>
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Fei Shao <fshao@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 16/10/23 12:40, Hsiao Chien Sung ha scritto:
> By registering component related functions to the pointers,
> we can easily manage them within a for-loop and simplify the
> logic of clock control significantly.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

