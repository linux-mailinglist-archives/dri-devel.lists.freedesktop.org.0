Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B744E6189D2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 21:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77FA10E03C;
	Thu,  3 Nov 2022 20:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED90510E03C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 20:46:00 +0000 (UTC)
Received: from notapiano (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BC4E9660295F;
 Thu,  3 Nov 2022 20:45:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667508359;
 bh=ISVrpYt4PR/qsbbqqG5f/trgN2UjQtmT5vQsGuTNWYQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aPffSOWHfvf3cv7PtJFElqX+kIJyAs5RUE5oMEjV9GXiGcZsze8QTHbE4ouhQedUN
 bnO4/UoNxjIMaeETlEinj3tg6typI5IjS4OJF2CgxBYKtrgJOcgfIJ4m898oekR9aS
 ArbRbzSExbF8FzJ/U4nEkpUvKJG3QPpBqZVY5VqsWJJcBxIC6Ni9+sI3aM7W9kqg2v
 6orABOsR2DhsSCFMXEcZDai78MVOp+N2ia8JV18M0W9LuzcJFlMlNolxpqVZ6Pu6bD
 Sb9pYH/MkEIavj3ibVF9UQfQ6vNmvrqj4ObF3cGK/pVIDR5d8AHySEo9EE59mDt2fm
 B/a6hGxIi8Q+g==
Date: Thu, 3 Nov 2022 16:45:52 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Subject: Re: [PATCH v27 08/11] soc: mediatek: mmsys: add mmsys for support 64
 reset bits
Message-ID: <20221103204552.5aklyrn7mbdhxw63@notapiano>
References: <20221103032512.9144-1-nancy.lin@mediatek.com>
 <20221103032512.9144-9-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221103032512.9144-9-nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, wim@linux-watchdog.org,
 linux@roeck-us.net,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 03, 2022 at 11:25:09AM +0800, Nancy.Lin wrote:
> Add mmsys for support 64 reset bits. It is a preparation for MT8195
> vdosys1 HW reset. MT8195 vdosys1 has more than 32 reset bits.
> 
> 1. Add the number of reset bits in mmsys private data
> 2. move the whole "reset register code section" behind the
> "get mmsys->data" code section for getting the num_resets in mmsys->data.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Change-Id: Ic7c30ad6c4f74a6b2ebf75fc0e3f9f207b0416d1

Again, no Change-Id please.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas
