Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A52A6518C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 14:45:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B30010E116;
	Mon, 17 Mar 2025 13:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hym0kP32";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E95610E116
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 13:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742219087;
 bh=JVmdQyfU6VNsa3dSvwc3s1VX9bvBvzsEOdDC3T1SiXg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hym0kP32VXeZ9Y8swpAitB2ywPMwWIR5TMF0ZqbdOKyF5ZCGo/j69C8vFQo1klT9a
 KZHEs1A4efzgf8ekooXaM3aeUER2GS/vKf1xtfCMyT8gLn2hyi1XhAi8Uysd0tUVT2
 rVeECek1J5hB+k0sg3QHTjhhpOuuRu3bTfbVAMPPYFoPRsv9x1J37Wu9wDPQQr5Jpe
 z+c73PZyXXL/SkZyTRx0vxSLu0QzAOt9xqM1toDpL1KMUnFhiKD4nh3QXhsSk+aFmh
 joKJC3NpkTf0DWN0JcVyed1m9YzGiY7avd49Vu1INRQ+CtF+ZuFK/l5k+kPP83q1Us
 enqrkhPs5W1KQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 91ADA17E0899;
 Mon, 17 Mar 2025 14:44:46 +0100 (CET)
Date: Mon, 17 Mar 2025 14:44:36 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com,
 angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v3 4/6] drm/panfrost: Add support for AARCH64_4K page
 table format
Message-ID: <20250317144436.2bcc17ed@collabora.com>
In-Reply-To: <20250317124044.16257-5-ariel.dalessandro@collabora.com>
References: <20250317124044.16257-1-ariel.dalessandro@collabora.com>
 <20250317124044.16257-5-ariel.dalessandro@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Mon, 17 Mar 2025 09:40:42 -0300
Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:

> +static int panfrost_mmu_cfg_init(struct panfrost_mmu *mmu,
> +				  enum io_pgtable_fmt fmt)
> +{
> +	struct panfrost_device *pfdev = mmu->pfdev;
> +
> +	switch (fmt) {
> +	case ARM_64_LPAE_S1:
> +		return mmu_cfg_init_aarch64_4k(mmu);
> +	case ARM_MALI_LPAE:
> +		return mmu_cfg_init_mali_lpae(mmu);
> +	default:
> +		/* This should never happen */
> +		return drm_WARN_ON(pfdev->ddev, -EINVAL);

This won't return -EINVAL, but !!(-EINVAL), AKA true. We should do

	default:
		drm_WARN(ptdev->ddev, "Invalid pgtable format");
		return -EINVAL;

instead.

> +	}
> +}
