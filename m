Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EC1A64617
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 09:50:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833C710E3B3;
	Mon, 17 Mar 2025 08:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VhdM3Sgy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2954A10E032
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 08:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742201407;
 bh=WUiRsmcXf/5mpOBvUvpB9sSawrbuJ+mi9kvDgMHpCz4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VhdM3Sgy+M9TR4PPkjJ+jOpE7S79oBu32SNg0SksjR13gt9lNt1AeP68lupTSkOwx
 xAdcorLe6RRO7Ip1w8/aSlFynrlfZDVLPNxGA9XpbGw7r7WYu9dN4rzXLs0RDZlPyL
 LsrJoXr0hTqEYaGKb7NbG0gHgVi1WwLN1r//y2xNABVZcahZNd1Mm4FzGWKS/7eik5
 KxkGLycxmXQsvXZgBCwV38qwlzeZRnCIaNYjBo5qxei99gOp8UHapemXJ3J7dBunAw
 QKL5Wv5GFrNB15v+v4GXEYCK3p1IiL6PVii5b4sOBbAnHPn3wGJaEl7EcgdwOoZ9b8
 1OgWfjcFzzsfA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 064F217E0848;
 Mon, 17 Mar 2025 09:50:06 +0100 (CET)
Message-ID: <0cd19f91-2726-419c-ba92-fdb8e7a38377@collabora.com>
Date: Mon, 17 Mar 2025 09:50:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] drm/panfrost: Force AARCH64_4K page table format
 on MediaTek MT8192
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com
References: <20250314173858.212264-1-ariel.dalessandro@collabora.com>
 <20250314173858.212264-7-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250314173858.212264-7-ariel.dalessandro@collabora.com>
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

Il 14/03/25 18:38, Ariel D'Alessandro ha scritto:
> MediaTek MT8192 SoC has an ARM Mali-G57 MC5 GPU (Valhall-JM). Now that
> Panfrost supports AARCH64_4K page table format, let's enable it on this
> SoC.
> 
> Running glmark2-es2-drm [0] benchmark, reported the same performance
> score on both modes Mali LPAE (LEGACY) vs. AARCH64_4K, before and after
> this commit. Tested on a Mediatek (MT8395) Genio 1200 EVK board.
> 
> [0] https://github.com/glmark2/glmark2
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


