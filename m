Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F489AD4F59
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 11:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D6810E03E;
	Wed, 11 Jun 2025 09:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="oeBR2Cdk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C82410E03E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 09:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1749632830;
 bh=3Ip4QlReFFhe2GLgKmX5HdTzhz5q7Ydnp6NSKHxRFlA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oeBR2Cdkvw5FS5Uj+EMSWDpyYAIRfmum/UQEmEmc2NH+uR3ykyn782Cwk++CJV68w
 lTMYB9QLbBFILVapHjXCVkxxn5HO6MNp5wabOBINNpPKg+zMFNdNpnUQQOPFquqLki
 G9rTB3wl25n8txJ16MHKJVl39rzd4R5a7jQNZGPJTpKr3oTnBa56QUxTzwSUsiih8j
 SMDxAGmHpK87FuHPmv3PDqQLHn0otU7xM6ldZhTSKbLwT/3bCNvLeBHqWQLz7BaQSv
 Z/n5sTMwJwpoIo4bJVvlISXhbuZrlJieYT/6XSceGYnn42SPeGunysx+E0yd0dHrTw
 a5EWbwjgoQwkA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 858FC17E1045;
 Wed, 11 Jun 2025 11:07:09 +0200 (CEST)
Message-ID: <c197ad80-cd12-4168-b1db-9826cc42760f@collabora.com>
Date: Wed, 11 Jun 2025 11:07:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: mtk_dpi: Reorder output formats on MT8195/88
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250606-mtk_dpi-mt8195-fix-wrong-color-v1-1-47988101b798@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250606-mtk_dpi-mt8195-fix-wrong-color-v1-1-47988101b798@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 06/06/25 14:50, Louis-Alexis Eyraud ha scritto:
> Reorder output format arrays in both MT8195 DPI and DP_INTF block
> configuration by decreasing preference order instead of alphanumeric
> one, as expected by the atomic_get_output_bus_fmts callback function
> of drm_bridge controls, so the RGB ones are used first during the
> bus format negotiation process.
> 
> Fixes: 20fa6a8fc588 ("drm/mediatek: mtk_dpi: Allow additional output formats on MT8195/88")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Well actually there is a way to make this still behave while having those
alphabetically sorted, which I was thinking that was already properly implemented
for MediaTek drivers.

Apparently it's not true for *all* of them... but then, just keeping things ordered
by preference is a simpler solution and probably the best one for now.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


