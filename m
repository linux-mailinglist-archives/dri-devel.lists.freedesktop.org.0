Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048A1BC8EA6
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 13:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5217A10E9E1;
	Thu,  9 Oct 2025 11:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nqBTzWtI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB05710E9E1
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 11:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760010985;
 bh=6gUz+9JoOYVGPpIwvEyu26OypnA//W1aFpeDtPUjxaQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nqBTzWtIwjw7fCRFp/gWpyyfyqCXm/UzYttMnMyC/r1TKf7qGYKGgn5yqtrInqUHl
 Jid+rfe2P65rn6jVjolgn1z4JPa4Iofyy3x4l2K3zZBEfCwIxJIo826gYYL/OJin01
 mH0fV0lG135kAvX+eScECWBYLLZyS22U5sPhorLN/DPseuEWedVJTLYA3LunjwBp8q
 D45/YX7uTqKi+Jb/tJsQsI7pnjqpt7qc+lhKEKmnHUtFoYmPgZQmhecXl2oeedGZvB
 MU3RPYN33wgluOO2P9LeoepkZ2WfYOxBtpEDxnoQ0OrwjqPjoiktUY8wIIfmRBg0f5
 JfX8GTG6naTxQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 70DDE17E0125;
 Thu,  9 Oct 2025 13:56:24 +0200 (CEST)
Message-ID: <9abaae2b-8e66-4e28-99c3-14cf3de13c8c@collabora.com>
Date: Thu, 9 Oct 2025 13:56:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 16/20] soc: mediatek: mtk-cmdq: Remove shift_pa
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
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-17-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-17-jason-jh.lin@mediatek.com>
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
> Since shift_pa will be stored in the cmdq_mbox_priv structure within
> cmdq_pkt, all shift_pa parameters in CMDQ helper APIs can be removed.
> 
> Remove the shift_pa parameters from cmdq_pkt_jump(), cmdq_pkt_jump_abs(),
> and cmdq_pkt_jump_rel().
> 
> Fixes: ade176534112 ("soc: mediatek: cmdq: Add parameter shift_pa to cmdq_pkt_jump()")

Drop those fixes tags, they're not pointing to any upstream commit, and then, those
are not fixes per-se, as you are performing migration, not fixing anything.

Cheers,
Angelo


