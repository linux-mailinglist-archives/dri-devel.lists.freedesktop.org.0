Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 291FABF0647
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 12:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FA810E3B5;
	Mon, 20 Oct 2025 10:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cH2jcxgG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A90F10E394
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 10:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760954686;
 bh=ARtDZwsdCFqaJMeHgUn82RRxg6fZeKD7Hzqi7I3KSJA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cH2jcxgGTWXbL5Uj9plnlDcSy1rIpK6H0scnSzyf3uB+Y6IVZjH5SpJIZMPQ6J82p
 AlZFZK26tN47zUgLf/JSIF15au/EParWh5QZ1QqcG+p0xF1xLetq4VtSgqjidZvY8O
 RUXUtIqGo8f2xt3wrohwYKbmKJY0RtCb7jDlUELVaec2A75/e4777hmbpQ4z2JwZdz
 Ap1oab188MzOSS48fZvU71C55N4t5SCGnAvArZcvQoI7HfSlrq6ISEAAZ+5P9nlf5c
 ABovrbf1C68PpMuMneDeIEK8ifEP0dleQanTHIzgAj0WOp5w8518XbmCM46HhhTt6i
 PMH3MFhCB0cqw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 611DC17E0FAD;
 Mon, 20 Oct 2025 12:04:45 +0200 (CEST)
Message-ID: <bd9a2670-008a-4e0a-9ad2-90bdad22778d@collabora.com>
Date: Mon, 20 Oct 2025 12:04:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/20] mailbox: mtk-cmdq: Refine DMA address handling
 for the command buffer
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
 <20251017065028.1676930-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-3-jason-jh.lin@mediatek.com>
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

Il 17/10/25 08:44, Jason-JH Lin ha scritto:
> GCE can only fetch the command buffer address from a 32-bit register.
> Some SoCs support a 35-bit command buffer address for GCE, which
> requires a right shift of 3 bits before setting the address into
> the 32-bit register. A comment has been added to the header of
> cmdq_get_shift_pa() to explain this requirement.
> 
> To prevent the GCE command buffer address from being DMA mapped beyond
> its supported bit range, the DMA bit mask for the device is set during
> initialization.
> 
> Additionally, to ensure the correct shift is applied when setting or
> reading the register that stores the GCE command buffer address,
> new APIs, cmdq_convert_gce_addr() and cmdq_revert_gce_addr(), have
> been introduced for consistent operations on this register.
> 
> The variable type for the command buffer address has been standardized
> to dma_addr_t to prevent handling issues caused by type mismatches.
> 
> Fixes: 0858fde496f8 ("mailbox: cmdq: variablize address shift in platform")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

