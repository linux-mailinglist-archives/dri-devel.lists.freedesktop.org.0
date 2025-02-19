Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 717F0A3BE82
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 13:49:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADB910E7D8;
	Wed, 19 Feb 2025 12:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cK/vZpER";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8AB10E7D8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 12:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739969360;
 bh=V/WEvuBRuTT45uwY1xRUJn103l1/KNoD2naTbW/Fd10=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cK/vZpERB7nKL4xb6kb9RHN1i1yY2D6BWmuvV3dLZm2n7ENfEF/H3GrtIS/pVIH7V
 h1VZGWFoXWuksKUT7gy9lX+sIbxe9Itm+ZqeuNOq/O7yIllgfRPuqBHjJXGREVsgA8
 4kfix8eWWG8k2Sj5rPm1D+UDJaFQPn0gYGAVnEJMxPNq/xsihmTRZ5bg7sz0mFmhu9
 9oWpVwPckn30yxd0GvrcL67HWaPEPgSLkYHxILxcRvL7tojgvLdWU1hOfrbXMecfBs
 t/oxnLjdZr7XNoZDskPB0DbANqc8Llfgz6gUkZh23cZjnYeq19tve6JLGzVsDJWcVv
 BnnMieV1cBuTQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6D86A17E14D5;
 Wed, 19 Feb 2025 13:49:19 +0100 (CET)
Message-ID: <9d3886e7-f7dc-494e-b77c-1e44e7114d84@collabora.com>
Date: Wed, 19 Feb 2025 13:49:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/mediatek: fix CCORR mtk_ctm_s31_32_to_s1_n
 function issue
To: Jay Liu <jay.liu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250219092040.11227-1-jay.liu@mediatek.com>
 <20250219092040.11227-3-jay.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250219092040.11227-3-jay.liu@mediatek.com>
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

Il 19/02/25 10:20, Jay Liu ha scritto:
> if matrixbit is 11,
> The range of color matrix is from 0 to (BIT(11) - 1).
> Values from 0 to (BIT(11) - 1) represent positive numbers,
> values from BIT(11) to (BIT(12) - 1) represent negative numbers.
> For example, -1 need converted to 8191.
> 
> Fixes: 738ed4156fba ("drm/mediatek: Add matrix_bits private data for ccorr")
> 
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


