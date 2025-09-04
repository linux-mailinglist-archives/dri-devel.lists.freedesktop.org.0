Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 967AEB431E3
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 08:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB6C10E976;
	Thu,  4 Sep 2025 06:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YbFApHCM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D9110E978
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 06:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756965763;
 bh=090gkLICbGM7TNk6kExYlvvMe+p36xr/EilWtJfF52g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YbFApHCMtpPV7aWtDBimSagK7GUlxOLsVOhn2efk4y6D7WTKDqaDKNVh2Qw5HJa49
 YT9K5uzYEUyhQS4tVDJXDUPkez3c6hNvH38OH/cZNvjSnvu7ia4Ij18GA5LV6Nq6aV
 dkR5BklGOP+AfqjjFFrWhxfvzfXqo76Pd/BqUJsAJtyPWxrIv0x2N1PJvUHzlOrleY
 wn/HCFCbSnr/lLPiHhxWv/EvkVBbjTFRlzLfvnUDjmh3oNbYKqXK9g1nFX8YYFBd8I
 L2b6AYtvTLSQAsH+Kj07nc0Q6XsBsZR+CrMse/+ajzchGiixuDRRdt6isiKPzCRsTG
 nTvYqllWSba2A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A221A17E0EB8;
 Thu,  4 Sep 2025 08:02:42 +0200 (CEST)
Date: Thu, 4 Sep 2025 08:02:39 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [RFC PATCH 2/2] drm/panthor: add initial mt8196 support
Message-ID: <20250904080239.779b5e24@fedora>
In-Reply-To: <20250903225504.542268-3-olvaffe@gmail.com>
References: <20250903225504.542268-1-olvaffe@gmail.com>
 <20250903225504.542268-3-olvaffe@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed,  3 Sep 2025 15:55:04 -0700
Chia-I Wu <olvaffe@gmail.com> wrote:

> diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
> index 02db21748c125..75e92c461304b 100644
> --- a/drivers/gpu/drm/panthor/Makefile
> +++ b/drivers/gpu/drm/panthor/Makefile
> @@ -12,4 +12,6 @@ panthor-y := \
>  	panthor_mmu.o \
>  	panthor_sched.o
>  
> +panthor-$(CONFIG_DRM_PANTHOR_SOC_MT8196) += panthor_soc_mt8196.o

Based on the stuff you describe (ASN hash, core mask read from an nvmem
cell, extra clks/regulators?), I don't think we need per-soc source
files and per-soc config options. If it becomes too HW specific (no
abstraction to make it SoC-agnostic), we can reconsider the per-SoC
file approach, but I believe it can all live in panthor_drv.c for now.
