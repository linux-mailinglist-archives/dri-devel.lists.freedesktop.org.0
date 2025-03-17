Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62433A64613
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 09:49:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A235B10E02D;
	Mon, 17 Mar 2025 08:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DHO7A4Tz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D5C10E02D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 08:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742201391;
 bh=1rfFLt1FGwRgYWw/LMCOw039hfCefer9lrU++Y7m7yQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DHO7A4TzNIY+kl7FjgK92H8XgzGX5OK+PG92cDnJsYXUKg79N/I2KtlUzLpcFN3OZ
 xGVtDl5g8o9InTjieFWFOHsp9jKiL99tZEHE2yImw1eLFOAIOKU/n/zw/EuFiI4ZNg
 bf0cs3Je4lPc2GVdirmD8RKUaKyYderkv0lZD/ac38d5gAq8qbj27yBgip9Uf6ii0o
 2nrCkJwtql8o376/PNVzvuQtOqlpKMH/cUkU+VdwxtAi2llJjMLE2S3awcaLMuaSJp
 /vcHRnd96R3bOYqenrWofpH4LGBQ3OQorx/9t5m4wGC9YUq0EKwKklQQtQy0TL0lNm
 aTBbzanb/LRiA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3565D17E0848;
 Mon, 17 Mar 2025 09:49:50 +0100 (CET)
Message-ID: <e217363f-5492-486e-8063-8e3eed047b00@collabora.com>
Date: Mon, 17 Mar 2025 09:49:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] drm/panfrost: Add support for AARCH64_4K page
 table format
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com
References: <20250314173858.212264-1-ariel.dalessandro@collabora.com>
 <20250314173858.212264-5-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250314173858.212264-5-ariel.dalessandro@collabora.com>
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
> Currently, Panfrost only supports MMU configuration in "LEGACY" (as
> Bifrost calls it) mode, a (modified) version of LPAE "Large Physical
> Address Extension", which in Linux we've called "mali_lpae".
> 
> This commit adds support for conditionally enabling AARCH64_4K page
> table format. To achieve that, a "GPU optional quirks" field was added
> to `struct panfrost_features` with the related flag.
> 
> Note that, in order to enable AARCH64_4K mode, the GPU variant must have
> the HW_FEATURE_AARCH64_MMU feature flag present.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

I would've preferred the LEGACY format to be a quirk, instead of AARCH64, but
okay.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


