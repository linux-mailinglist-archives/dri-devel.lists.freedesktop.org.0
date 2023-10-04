Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F05987B7A12
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 10:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A8010E0E8;
	Wed,  4 Oct 2023 08:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBE510E34D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 08:32:26 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DDC42660576C;
 Wed,  4 Oct 2023 09:32:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1696408345;
 bh=4Ba5LFXdDysLehenyraAH5emOyFnN5MNv84LC56TNIc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Zok3+TzrkyFWpS7sPVti62h/Okuw1RhGt+q1VisVyQRciWKRqAaLtgTd7SwlDW5hx
 Xwv0b0SWNSBTWNPqfc9fZCgg42nYsRXnGcjeVLZ/UGqGdeY7h5/GBYPWiNLOunFOc3
 rHZafdLei+Dd1ojVlJbIgAE9dtNlXoc8yWAXHK60VM8O8fYOa0LJxc6AzKjApgoRRH
 PTb0rXKiVt/2tWrLcT1eS5mLVRKVQdjwG4fKNqmd7CxBNEAnEPNf5NCbsIEtMlmG/Y
 kh5zNZAaFG4rMlOxrGl4zsjFgjbnrUszbLYSA540b1DDFncAf/ouOAdMs9NUUIY+t/
 iZrECxJxKBy7w==
Message-ID: <022f57cc-9aff-2592-f4f9-5a10e1877554@collabora.com>
Date: Wed, 4 Oct 2023 10:32:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v11 5/9] drm/mediatek: Add connector dynamic selection
 capability
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20231004024013.18956-1-jason-jh.lin@mediatek.com>
 <20231004024013.18956-6-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231004024013.18956-6-jason-jh.lin@mediatek.com>
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 04/10/23 04:40, Jason-JH.Lin ha scritto:
> Add dynamic select available connector flow in mtk_drm_crtc_create()
> and mtk_drm_crtc_atomic_enable().
> 
> In mtk_drm_crtc_create(), if there is a connector routes array in drm
> driver data, all components definded in the connector routes array will
> be checked and their encoder_index will be set.
> 
> In mtk_drm_crtc_atomic_enable(), crtc will check its encoder_index to
> identify which componet in the connector routes array should append.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> Tested-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


