Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ACFA16CA8
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 13:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A57610E3E3;
	Mon, 20 Jan 2025 12:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MzUKpUy6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183CD10E3E3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 12:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1737377905;
 bh=DD53uhNj6LwdrJl6hL2eBnCsm6oKdkojK2oOswBhZrI=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=MzUKpUy6eAO9Low0cid5YvDD3L4ML3IXM5S24O4r8b6/xPEp8BF9F3Em3HVEC1+1/
 b0QxzWngOiybOrbuPs+oMxvmjRPwOfPpaC/VCDPvjgq71U6uZQBDxBCWtIEtL/ak9p
 A6cWA5G5cJYNCc8Kcpr4fswHhuRza5GTZrqeGk0FuBbAo2QH9RZi9YKpPaqUlyHjhu
 h/BPUh+3o6oMsG+tUpHiAp3mvft4uFFZ7G5cRxZlpqkacIx7ZsUOLFCJ80mruuYLhC
 KL7ajupU9cUAHZmHYk1Hio4yeD0D4EoK3qL4vH+qT4Vv57ZkfvjItlfwjrdSs+JgTW
 mPSc0iWf9PUFQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 04FED17E0343;
 Mon, 20 Jan 2025 13:58:24 +0100 (CET)
Message-ID: <15006d4c-81ac-4691-b817-d6510992a14a@collabora.com>
Date: Mon, 20 Jan 2025 13:58:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Drop redundant Mediatek driver data
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250118160645.78473-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250118160645.78473-1-krzysztof.kozlowski@linaro.org>
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

Il 18/01/25 17:06, Krzysztof Kozlowski ha scritto:
> mediatek_mt8192_supplies are exactly the same as
> mediatek_mt8183_b_supplies.  mediatek_mt8188_data is exactly the same as
> &mediatek_mt8183_b_data.  There is never point in duplicating all these
> structures - it only raises questions or encourages bugs when someone
> updates one variant without changing the other.  Drop duplicated code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

The reason why these are different is that 8183 and 8192 have different
GPU architectures, where the former is bifrost and the latter is valhall.

Regardless, even if there actually was a reason for that, I agree about
this deduplication here, as the architecture is anyway made clear by the
devicetree bindings for those SoCs.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!
