Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B430D1A2AE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 17:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB21710E510;
	Tue, 13 Jan 2026 16:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Hth9sqS0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C868B10E510
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768321152;
 bh=5Zd516jlMdZ9k/ZdmyxYmyDCnAdbWqAAEuijzcESTo4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Hth9sqS0tpiFuR8Np1P1rgknT//yN5AeK2k5bmW+3IUOOQTKGSWB5y9rOxCEfkyTh
 kU7CXr42sTLLdpbiIl/WjO0XzJaZ5XmMhalLtefnZ8MbdE0stL0kxsHUbxFHKKoyNs
 7AQTAiRknWzilD3/sG5G2wnZfkp6LtHMGu+rQmw2n7394FbjSxUn8ijAm5y6V825we
 AQ4UStpahsVdt66wzIl1B7fh4tXgSolx1TxJYbUEUBHOi/O9vlJM7aNrk7hMy5Iuvw
 ZkzH7ES9WhkbgtRgEtjbpuJTf1FL6Z7YpuiQPYv2Ef1NXpnfSaKrn/zjPWXU5Aevku
 ZAwm5LQFsGHUg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D158417E13E0;
 Tue, 13 Jan 2026 17:19:11 +0100 (CET)
Date: Tue, 13 Jan 2026 17:19:07 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, nd@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Mihail
 Atanassov <mihail.atanassov@arm.com>
Subject: Re: [PATCH v6 5/7] drm/panthor: Implement the counter sampler and
 sample handling
Message-ID: <20260113171907.02623198@fedora>
In-Reply-To: <20251215171453.2506348-6-lukas.zapolskas@arm.com>
References: <20251215171453.2506348-1-lukas.zapolskas@arm.com>
 <20251215171453.2506348-6-lukas.zapolskas@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Mon, 15 Dec 2025 17:14:51 +0000
Lukas Zapolskas <lukas.zapolskas@arm.com> wrote:

> +#define BLK_MASK(x) GENMASK_ULL((x) - 1, 0)
> +
> +static u64 get_sc_mask(struct panthor_device *ptdev)
> +{
> +	const u64 sc_mask = ptdev->gpu_info.shader_present;

Hm, so I've just merged a change to allow overriding this
shader_present with a value loaded from an nvmem cell, meaning the
value returned to userspace no longer matches the number of cores known
by the GPU. I have a local hack to apply such overrides late and keep
panthor_device::gpu_info as the HW state, but this forces us to
be careful about which variant of shader_present we want depending on
the context (in panthor_{fw,sched}.c we want the user value, in
panthor_perf.c, it we want the user value in get_sc_mask(), and the HW
value in get_reserved_sc_blocks()).

> +
> +	return BLK_MASK(hweight64(sc_mask));

I believe this should be sc_mask on v13-, and
BLK_MASK(hweight64(sc_mask)) on v14+.

> +}
