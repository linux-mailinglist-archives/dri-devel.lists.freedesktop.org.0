Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9286AD00B5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 12:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B2810E337;
	Fri,  6 Jun 2025 10:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DtE0BkTt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AAD10E337
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 10:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1749206791;
 bh=gP7zhnvVOaSrXBkdcJcqYZvIvxhaiTvAhnHbEn99qQk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DtE0BkTtV+Ui75dsaW+kEgEMQ2LNiPHbI7LEvo+CxejIkk8CS19GiINveF4O5wifN
 zlL9pfAjaUuHne6PRiohcxiafiDTWDDUvWXBE+diAZ8q0JLuim8lnNrlL/Z7PcpyAG
 4viBkpQfwKn2RCNmSSIzFDVKKwB9hC+TOdHOeAX8BddEZMYKVAAS3jBn0xq16V1Unw
 baPxph5mGc4oggB4Wo5mDwXt7HbMl7bYRMlBL2eRlc+hPbudEX3ZXxcViAXTMogb2R
 qDBKvRg9RIZpIu+qqWs/bJAovQdLlMNz2nJLfJ0lLZBwh/3C1ahF3VrZrdoAQ13ajt
 d46l7qix2zyKA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 881A017E0C99;
 Fri,  6 Jun 2025 12:46:31 +0200 (CEST)
Date: Fri, 6 Jun 2025 12:46:26 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v5 0/2] drm/panthor: Add 64-bit register accessors
Message-ID: <20250606124626.449469a9@collabora.com>
In-Reply-To: <20250606101835.41840-1-boris.brezillon@collabora.com>
References: <20250606101835.41840-1-boris.brezillon@collabora.com>
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

On Fri,  6 Jun 2025 12:18:33 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Hi all,
> 
> This patch series adds support for 64-bit and poll register accessors in
> the Panthor DRM driver and performs a cleanup of the 64-bit register
> definitions.
> 
> The first patch introduces new accessor functions to simplify and
> standardize 64-bit and polling register operations. The second patch
> refactors the existing 64-bit register definitions for improved clarity
> and consistency.
> 
> v5:
> - Rebased so I can apply cleanly with dim b4-shazam
> 
> v4:
> - [PATCH 1/2]:
>   - Fixed missing check against mask value in PWRTRANS register polling.
>   - Removed panthor_gpu_read_timestamp() and
>     panthor_gpu_read_timestamp_offset() in favour of direct register
>     access as they currently only serve as wrapper functions.
> - [PATCH 2/2]:
>   - Updated the register names inline with the removal of the two
>     timestamp functions.
> - Picked up Rb tags from Liviu and Steven
> - Link to v3: https://lore.kernel.org/dri-devel/20250411164805.2015088-1-karunika.choo@arm.com/
> v3:
> - Picked up Rb tags from Boris.
> - Link to v2: https://lore.kernel.org/dri-devel/20250411151140.1815435-1-karunika.choo@arm.com/
> v2:
> - Updated padding of the poll functions as requested
> - Removed *_HI register definitions and renamed *_LO registers
> - Link to v1: https://lore.kernel.org/dri-devel/20250410163546.919749-1-karunika.choo@arm.com/
> 
> Regards,
> 
> Boris
> 
> Karunika Choo (2):
>   drm/panthor: Add 64-bit and poll register accessors
>   drm/panthor: Clean up 64-bit register definitions

Queued to drm-misc-next.

> 
>  drivers/gpu/drm/panthor/panthor_device.h |  71 ++++++++++
>  drivers/gpu/drm/panthor/panthor_drv.c    |   4 +-
>  drivers/gpu/drm/panthor/panthor_fw.c     |   9 +-
>  drivers/gpu/drm/panthor/panthor_gpu.c    | 159 +++++------------------
>  drivers/gpu/drm/panthor/panthor_gpu.h    |  12 +-
>  drivers/gpu/drm/panthor/panthor_mmu.c    |  34 ++---
>  drivers/gpu/drm/panthor/panthor_regs.h   |  90 ++++---------
>  7 files changed, 157 insertions(+), 222 deletions(-)
> 

