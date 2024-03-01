Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B564286DE14
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 10:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490FC10EC48;
	Fri,  1 Mar 2024 09:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ht0pdJ8f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F315410EC37
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 09:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709284888;
 bh=1jALhOP0ztvSLDx+uNyI6Jp5fBRQvC+QlatCx8NfYeU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ht0pdJ8fkGuUtiIsKvA101pB/BR+Ttrysd2Nx2KfFN8zAaGD8Ja8fY1LcPulyiu1l
 mReu+YsJFsXgVDIhSmaxjUWWffizmmZQ+KMj3izhSIjad3n7KhxSATxvg+vc0z269B
 udwwY79EEibudcpJgYw7q8SJ/vSOG9b/VaOOfhMSw6dev95coHuRG9uT3fGWj2BlCC
 wB1hgCcnnSS6BQ2vGhbnKMWPs/kn4gAfJVA2WYKhFCqW5HimuvFp+eavWYI6NJypaI
 Ov5ZFGIIZB9j21sKuI1btw466DqYSN4Uosod/osSO/uD0N+QFdEr9yUQZoT/mly0N3
 dtQ6OJsLjgUZQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4E18437810CD;
 Fri,  1 Mar 2024 09:21:27 +0000 (UTC)
Date: Fri, 1 Mar 2024 10:21:25 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, "Marty E . Plummer"
 <hanetzer@startmail.com>, Rob Herring <robh@kernel.org>, =?UTF-8?B?Q2w=?=
 =?UTF-8?B?w6ltZW50IFDDqXJvbg==?= <peron.clem@gmail.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, Faith
 Ekstrand <faith.ekstrand@collabora.com>, Daniel Stone
 <daniels@collabora.com>, Liviu Dudau <Liviu.Dudau@arm.com>, Steven Price
 <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 kernel@collabora.com, Heiko Stuebner <heiko@sntech.de>, Tatsuyuki Ishi
 <ishitatsuyuki@gmail.com>, Chris Diamand <chris.diamand@foss.arm.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>
Subject: Re: [PATCH v6 00/14] drm: Add a driver for CSF-based Mali GPUs
Message-ID: <20240301102125.7b62f317@collabora.com>
In-Reply-To: <20240229162230.2634044-1-boris.brezillon@collabora.com>
References: <20240229162230.2634044-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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

On Thu, 29 Feb 2024 17:22:14 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:


> Boris Brezillon (13):
>   drm/panthor: Add uAPI
>   drm/panthor: Add GPU register definitions
>   drm/panthor: Add the device logical block
>   drm/panthor: Add the GPU logical block
>   drm/panthor: Add GEM logical block
>   drm/panthor: Add the devfreq logical block
>   drm/panthor: Add the MMU/VM logical block
>   drm/panthor: Add the FW logical block
>   drm/panthor: Add the heap logical block
>   drm/panthor: Add the scheduler logical block
>   drm/panthor: Add the driver frontend block
>   drm/panthor: Allow driver compilation
>   drm/panthor: Add an entry to MAINTAINERS
> 
> Liviu Dudau (1):
>   dt-bindings: gpu: mali-valhall-csf: Add support for Arm Mali CSF GPUs

Queued to drm-misc-next.

> 
>  .../bindings/gpu/arm,mali-valhall-csf.yaml    |  147 +
>  Documentation/gpu/driver-uapi.rst             |    5 +
>  MAINTAINERS                                   |   11 +
>  drivers/gpu/drm/Kconfig                       |    2 +
>  drivers/gpu/drm/Makefile                      |    1 +
>  drivers/gpu/drm/panthor/Kconfig               |   23 +
>  drivers/gpu/drm/panthor/Makefile              |   14 +
>  drivers/gpu/drm/panthor/panthor_devfreq.c     |  283 ++
>  drivers/gpu/drm/panthor/panthor_devfreq.h     |   21 +
>  drivers/gpu/drm/panthor/panthor_device.c      |  549 +++
>  drivers/gpu/drm/panthor/panthor_device.h      |  394 ++
>  drivers/gpu/drm/panthor/panthor_drv.c         | 1473 +++++++
>  drivers/gpu/drm/panthor/panthor_fw.c          | 1362 +++++++
>  drivers/gpu/drm/panthor/panthor_fw.h          |  503 +++
>  drivers/gpu/drm/panthor/panthor_gem.c         |  230 ++
>  drivers/gpu/drm/panthor/panthor_gem.h         |  142 +
>  drivers/gpu/drm/panthor/panthor_gpu.c         |  482 +++
>  drivers/gpu/drm/panthor/panthor_gpu.h         |   52 +
>  drivers/gpu/drm/panthor/panthor_heap.c        |  597 +++
>  drivers/gpu/drm/panthor/panthor_heap.h        |   39 +
>  drivers/gpu/drm/panthor/panthor_mmu.c         | 2768 +++++++++++++
>  drivers/gpu/drm/panthor/panthor_mmu.h         |  102 +
>  drivers/gpu/drm/panthor/panthor_regs.h        |  239 ++
>  drivers/gpu/drm/panthor/panthor_sched.c       | 3502 +++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_sched.h       |   50 +
>  include/uapi/drm/panthor_drm.h                |  945 +++++
>  26 files changed, 13936 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
>  create mode 100644 drivers/gpu/drm/panthor/Kconfig
>  create mode 100644 drivers/gpu/drm/panthor/Makefile
>  create mode 100644 drivers/gpu/drm/panthor/panthor_devfreq.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_devfreq.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_device.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_device.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_drv.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_fw.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_fw.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_gem.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_gem.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_gpu.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_gpu.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_heap.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_heap.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_mmu.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_mmu.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_regs.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_sched.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_sched.h
>  create mode 100644 include/uapi/drm/panthor_drm.h
> 

