Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3D1BC8EB2
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 13:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3098910E9EE;
	Thu,  9 Oct 2025 11:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CmhDm10o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC19C10E9EB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 11:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760011002;
 bh=GCdo2WRMgThuwdhdaxtmNPngX0ETlYCYQ7iuLMzkZt0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CmhDm10oocxKkaF5tmsjNvE52BrCVUfY7m30lN8iDm/aVW6yLyk8S1fhLyy9JJ//o
 lG0OcN2d0Z2SWsBUAI3OhbZXzKXhfR1yZcmyvHpZzUL6pTFpJfFuIh4XnSaab5jd8B
 o0N9PVKK0WHJAcGZ/8dxQ3XfceDixM5FEzlZW05IATAEtz1pQT5b1UI9+OdKH3d35n
 PnWEquwvVQmvNo7qyjKcaJ/9B+VTxIAVwzLTtq7/Qsbl4/WQnklBP9buv+0imB3nYw
 JI9zcHMU6Gzh7EVV/ISC+9s/fRIs50+wXg36F+NQ3IxHGdjohcrHAP+Gsb4lt7x8Lb
 Ejw8718SW052g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6940117E0125;
 Thu,  9 Oct 2025 13:56:41 +0200 (CEST)
Message-ID: <dc04ae37-7707-4d32-8b01-f4804cd0cd90@collabora.com>
Date: Thu, 9 Oct 2025 13:56:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/20] soc: mediatek: mtk-cmdq: Add mminfra_offset
 adjustment for DRAM addresses
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
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-12-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-12-jason-jh.lin@mediatek.com>
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

Il 27/08/25 13:37, Jason-JH Lin ha scritto:
> Since GCE has been moved to MMINFRA in MT8196, all transactions from
> MMINFRA to DRAM will have their addresses adjusted by subtracting a
> mminfra_offset.
> 
> Therefore, the CMDQ helper driver needs to get the mminfra_offset value
> of the SoC from cmdq_mbox_priv of cmdq_pkt and then add it to the DRAM
> address when generating instructions to ensure GCE accesses the correct
> DRAM address. CMDQ users can then call CMDQ helper APIs as usual.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


