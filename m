Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAA1BF0635
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 12:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A9810E3AA;
	Mon, 20 Oct 2025 10:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UZpHQW33";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A4010E3A3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 10:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760954673;
 bh=h3N0Gm87ALyNcMBnk14h1KKNXe9sbhc0PNDBK6yXbfU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UZpHQW33ZW2yMdrw+jf9iIk/dEEIrtba/DdToyFk+k5pA+T78Z/DdZQAHjTbGoJX5
 YttNV59CQ1DBx10iPVo+BaVOKjXQ7Vc2WUPRxPQxkhwKTOsQRBEImPfb1NKxvvVI+t
 jgTHaf/Wg1UYDlfBp3cZyhlbxVp7hNPp6KinhjUVmL0a9/Awts4aVRvpjJq+S92YuR
 1M135gTH7zV75y/WKxrYQ+evqiLqm0XZPx3mdrOo2C5jHsdz/C5DDrfHZtFiGjR9+a
 Q0irX2k8l3ES8/gySgnuN8yccLqR8GkPiec1CreRONBzl0HPQCeLX7esVrL1fcF28t
 6pn1zf97lIiRA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 731F217E108C;
 Mon, 20 Oct 2025 12:04:32 +0200 (CEST)
Message-ID: <9258e1ca-56b2-4fb6-bf17-40c86b8c05b6@collabora.com>
Date: Mon, 20 Oct 2025 12:04:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 14/20] media: platform: mtk-mdp3: Refactor CMDQ writes
 for CMDQ API change
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
 <20251017065028.1676930-15-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-15-jason-jh.lin@mediatek.com>
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
> Update CMDQ register writes to use subsys-aware APIs,
> cmdq_pkt_write_subsys() and cmdq_pkt_write_mask_subsys().
> This conforms to recent CMDQ API changes that split access by
> subsys ID support.
> 
> Since all current MDP SoCs support subsys ID, and future MDP
> deployments will not run on SoCs without subsys ID, only
> subsys-specific API calls are needed. No logic for non-subsys ID
> hardware is required.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


