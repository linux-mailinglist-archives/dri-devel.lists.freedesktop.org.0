Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8961BF0617
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 12:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F6610E395;
	Mon, 20 Oct 2025 10:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DRhdYVbr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF25A10E395
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 10:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760954668;
 bh=L1rux84uqgx/z11sRLkzA6t6Db5oXXI6MffF6eUjKHs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DRhdYVbrEghPgLy5Qcqa1koh1Qni8U62cjyXqlP4zHLE1ILf7rnxPpwQjAUw4juEo
 nh++ADgODNcbf3NB0UiAU3avqnYn5OTwRZCzNIhSiJLXgehnwMzvZ/Xof2OxLm5w0b
 0UDf8QiP7Xe+KGG9CLfHwXS/TIdZxl1VQdpRPytPuixPJ9NFaPzMNhYxRy1lvMZzmB
 4X/3xgZ9WEs9pkPJpE3IPSQrBJz9aVZWwNTWKi5QHMZ2qXNopcdNtzm8V1ul55Xw0l
 KghISDNQZZHriuQaTI+p+WbSr+HiQz4k6ZBuBb1Wo/NrMlXs1bpR79iLB+TXId978T
 MvXlpTXrmVBSQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 67B0017E127F;
 Mon, 20 Oct 2025 12:04:27 +0200 (CEST)
Message-ID: <a30a7076-9c27-4e78-b57e-cdf2a14dc5c8@collabora.com>
Date: Mon, 20 Oct 2025 12:04:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 16/20] soc: mediatek: mtk-cmdq: Remove shift_pa
 parameter from cmdq_pkt_jump()
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
 <20251017065028.1676930-17-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-17-jason-jh.lin@mediatek.com>
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
> Since shift_pa will be stored in the cmdq_mbox_priv structure within
> cmdq_pkt, all shift_pa parameters in CMDQ helper APIs can be removed.
> 
> Remove the shift_pa parameters from cmdq_pkt_jump(), cmdq_pkt_jump_abs(),
> and cmdq_pkt_jump_rel().
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


