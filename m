Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3410C72F822
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 10:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AAC10E42B;
	Wed, 14 Jun 2023 08:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF1C10E42B
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 08:43:59 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4E13D6606F14;
 Wed, 14 Jun 2023 09:43:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686732238;
 bh=Ge/Fde+IO5OnVVPpbznrh9tcQY2RO9OzpPAaX7OypS4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kWGhytc9Ew47gZQUjWb4E1/Ihz4y6ScmhBRnOX4EfFS9MPnAL4EALw9NqGe4xkRnu
 L8Fy76Wn5rwmRaXE4iXjeM4nlAOfZ3mIR65vmBhXRYR0fDi4lB96NxPoG4pEMI9CHN
 9+Cjz+SfKBCnJ+1YZ0Iq0xNQzNn0G2oYQXXEmu6lMuJCA/IqBa3iJZXkv8lMn7ZIje
 DCMyaJ2RVz04OHeGqCcdKz+UhAym6MMPea3BrVDQjnDuJI/DrUGo4cNiCyFW+/HNZF
 x5TbzufR6P7X7XvlWaAlxHFNFynvvrQ34mH4uoyqS4PJ/LFon05b2xGWnqk0HCSaK+
 /gk1YqpqYnG6g==
Message-ID: <98809b8a-1d30-a686-0da8-5032bb362560@collabora.com>
Date: Wed, 14 Jun 2023 10:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 4/4] drm/mediatek: Fix dereference before null check
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>
References: <20230613113210.24949-1-jason-jh.lin@mediatek.com>
 <20230613113210.24949-5-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230613113210.24949-5-jason-jh.lin@mediatek.com>
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
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 13/06/23 13:32, Jason-JH.Lin ha scritto:
> Null-checking state suggests that it may be null, but it has already
> been dereferenced on drm_atomic_get_new_plane_state(state, plane).
> 
> The parameter state will never be NULL currently, so just remove the
> state is NULL flow in this function.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Fixes: 5ddb0bd4ddc3 ("drm/atomic: Pass the full state to planes async atomic check and update")

Fixes before S-o-b...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


