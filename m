Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB45A4223D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 15:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5DD10E3D5;
	Mon, 24 Feb 2025 14:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lmYWGnuV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B350010E3D5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 14:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740405757;
 bh=NtQ8UJ5HySKPPmQnEnNNQwk1UmdTw09FLFYUk5geJ0s=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lmYWGnuVgm+KmTD5YIxehDk+tVlRC1vDVfK3HtWmF4+Xq4+qBxIDwOjpAaJvHPift
 Iui0tPLrBtCwaPZFe1Y0gbWZIrnAXC10sAKWIMuEnQs3olEYWEDjRCysz/YtqhkcYH
 lWyzHOV4kXH761x7If9uEk2Ps2sjc7XQNhouXivC3kLAogKB4Fj1QFoIWUjp28UJIW
 VwWMp6/+QipGW+jONwhGszvac4z5tVDFcVG86uo2VvwY+0EjwCVhO4/kTG+8wgKlRP
 QNzimmhM4cg2etTnbrfvkeV0PvBbGwLAEkIuJjOqVK/BRTREvZESd7DV3lvUAh0NU8
 CAzRrDrDeB5rA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B74F517E00F6;
 Mon, 24 Feb 2025 15:02:36 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 Sirius Wang <sirius.wang@mediatek.com>, 
 Xavier Chang <xavier.chang@mediatek.com>, Fei Shao <fshao@chromium.org>, 
 Chen-yu Tsai <wenst@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20250224105414.3576243-1-jason-jh.lin@mediatek.com>
References: <20250224105414.3576243-1-jason-jh.lin@mediatek.com>
Subject: Re: [PATCH v2] mailbox: mtk-cmdq: Refine GCE_GCTL_VALUE setting
Message-Id: <174040575668.71176.5895162308675381424.b4-ty@collabora.com>
Date: Mon, 24 Feb 2025 15:02:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Mon, 24 Feb 2025 18:50:13 +0800, Jason-JH Lin wrote:
> Add cmdq_gctl_value_toggle() to configure GCE_CTRL_BY_SW and GCE_DDR_EN
> together in the same GCE_GCTL_VALUE register.
> 
> For the SoCs whose GCE is located in MMINFRA and uses MMINFRA_AO power,
> this allows it to be written without enabling the clocks. Otherwise, all
> GCE registers should be written after the GCE clocks are enabled.
> Move this function into cmdq_runtime_resume() and cmdq_runtime_suspend()
> to ensure it is called when the GCE clock is enabled.
> 
> [...]

Applied to v6.14-next/soc, thanks!

[1/1] mailbox: mtk-cmdq: Refine GCE_GCTL_VALUE setting
      commit: 6b9a5fc65a7880f7ac6a981a0a30b5ecba7bd5ae

Cheers,
Angelo


