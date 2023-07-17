Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC0D755D59
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 09:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE9510E04C;
	Mon, 17 Jul 2023 07:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5454610E04C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 07:47:11 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 24DFC6603203;
 Mon, 17 Jul 2023 08:47:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689580029;
 bh=26aPzlNp986WPqG7Lr26YQExo7j+A8YekqKqBBz+4rU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eT/cA7mzOMzprdYTN7JPBq6J8JkCnQ3Md41jwehyo3Wox495OAwDew95SwshJvlqX
 p9vq+ZN62VFp0DzvvFkNZKf1NI/HXI9/fS3GLfygbbYvBL6w3WCcughXfuQEE7NRB9
 dHMmYOEbYUteeZiGKnbDxWsLU3OrF8obZcsRQkTpvwstAwu2DUjSAjq5Z8GSGBjIHJ
 tRWbyg3itBTj9UZzWWx6aMnDPVeIT4T9kBh/1ebUhV8w3z1duWjfrtRLKqF4NQ9VYN
 J1JWBzA7n5g5nBHDAm/srxjFLMnB+PyWk3hnKiVk+8hoA1UQgKafeoTzBzH9pdjpJt
 BySmsC1pm0C8g==
Message-ID: <1e84f0e3-8902-d55e-ed15-5c6476944656@collabora.com>
Date: Mon, 17 Jul 2023 09:47:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 3/4] drm/mediatek: Fix unintentional integer overflow
 in multiplying different types
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>
References: <20230714094908.13087-1-jason-jh.lin@mediatek.com>
 <20230714094908.13087-4-jason-jh.lin@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230714094908.13087-4-jason-jh.lin@mediatek.com>
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
Cc: Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 14/07/23 11:49, Jason-JH.Lin ha scritto:
> 1. Instead of multiplying 2 variable of different types. Change to
> assign a value of one variable and then multiply the other variable.
> 
> 2. Add a int variable for multiplier calculation instead of calculating
> different types multiplier with dma_addr_t variable directly.
> 
> Fixes: 1a64a7aff8da ("drm/mediatek: Fix cursor plane no update")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

