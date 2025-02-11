Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD6FA305C5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 09:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885CA10E233;
	Tue, 11 Feb 2025 08:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="q5mXKFsM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA83F10E233
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 08:30:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9A65B5C0352;
 Tue, 11 Feb 2025 08:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148A9C4CEDD;
 Tue, 11 Feb 2025 08:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739262619;
 bh=38hk58Y0kLRwemhQaSYbq9+FRPzKOCdH6VSASaua6m8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q5mXKFsMYV50EQ5sGGZZgzh0OmE+815ZQh2PjS3t8fd41NZaOpuv0f6k5iFHKlitW
 49yp1lfNGJ5OOSASgGRUE07QC/RMizUsUE2XUxlfp87lgzKBmTgPMQH+5HLoZwc7rJ
 EmNRTRZ7+LCVvGA2lT43pEDxcQA6bOjjadbSYyHo+5Dj+olTuDf4Sn7OVrRcbOM1yq
 Qc+Z0qFIrDaoRQqvQGH/HfDbdJdvzeRx76+Qzjvl9CUD8F0eSxVDGNPamAOG9Qsyb1
 SijNNUevS87VgRK2t/3Y2ouT5EORaVjWLgER0Do8oH7U+EHg/4cIY7URzMF6X3YmGn
 YOewXlG3oo6UQ==
Date: Tue, 11 Feb 2025 09:30:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 2/3] drm/panfrost: Add support for Mali on the MT8370
 SoC
Message-ID: <20250211-sociable-buzzard-of-enhancement-dfd4f0@krzk-bin>
References: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
 <20250207-mt8370-enable-gpu-v3-2-75e9b902f9c1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250207-mt8370-enable-gpu-v3-2-75e9b902f9c1@collabora.com>
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

On Fri, Feb 07, 2025 at 04:18:31PM +0100, Louis-Alexis Eyraud wrote:
> Add a compatible for the MediaTek MT8370 SoC, with an
> integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core),
> with the same platform data as MT8186 (one regulator, two power
> domains).
> Despite their different GPU architecture (making them not being
> compatible), the MT8186 platform data can still be used for MT8370
> because it only describes supplies, pm_domains and enablement of power
> management features in the panfrost driver.
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

