Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E768AC09C5
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 12:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD8F10E81B;
	Thu, 22 May 2025 10:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MVVZqxhl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C734D10E81B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 10:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1747909837;
 bh=8iGntFQbL8GyTwozwP1vKL9KhhFgtY8ccE9Bf576A2k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MVVZqxhl4Gbge9gbMkOlT+f4gnKPpv87Zwj0xWaV5byaRKY09dD3b4XPfH/e+IzUw
 Z7UjslOoRz4XTo/DN9bGkAXn9m6kVgSeDNcZntMnk5ADdYWU85PdisjdH9sQwVrWbi
 OAB6g/5VkfdX78uyCH8UL1zvlqC9U+kE9rkIHp8F3vCqsoBuLgbduGJRjhZs9QwOYI
 DH3tlpegyKX77Bn6LA5ovZiPyIDfXU2aUU09Do6J7iGA2w9HUl5KpCB73pDVwwoi5r
 joFD/1NveBRB/8IeKIvFt+tCuw59l1mL5Hy5iXOUIoQ6+oANkhapcKSLiB04oO868J
 0Afx7dsIrgxTQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AFA4117E0FCE;
 Thu, 22 May 2025 12:30:36 +0200 (CEST)
Message-ID: <aed94e06-455f-4aa3-8740-57bd1facad22@collabora.com>
Date: Thu, 22 May 2025 12:30:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Add wait_event_timeout when disabling plane
To: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Zhenxing Qin <zhenxing.qin@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>,
 Xavier Chang <xavier.chang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250522085149.3361598-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250522085149.3361598-1-jason-jh.lin@mediatek.com>
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

Il 22/05/25 10:34, Jason-JH Lin ha scritto:
> Our hardware registers are set through GCE, not by the CPU.
> DRM might assume the hardware is disabled immediately after calling
> atomic_disable() of drm_plane, but it is only truly disabled after the
> GCE IRQ is triggered.
> 
> Additionally, the cursor plane in DRM uses async_commit, so DRM will
> not wait for vblank and will free the buffer immediately after calling
> atomic_disable().
> 
> To prevent the framebuffer from being freed before the layer disable
> settings are configured into the hardware, which can cause an IOMMU
> fault error, a wait_event_timeout has been added to wait for the
> ddp_cmdq_cb() callback,indicating that the GCE IRQ has been triggered.
> 
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


