Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F82286C48F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 10:11:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D29B10E358;
	Thu, 29 Feb 2024 09:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Z0aOc8MC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01A110E358
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709197879;
 bh=8+fXLx8fu5zGGU+P5vVpHeP2iqMzeNPpC+fu8ScbOcw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z0aOc8MCou4pusYWqbS/wHn4u7ryO6nX0N4+tq4y91ZuENy8HHJhfvJaQ+VmLmKNr
 h5lVuVlRwDvgMySm4XQogt6igMR/ilSUVVby+aSAasJ/0DIgc+ycYZRP1lpQ1+++88
 l1ig68gXvpkLfE9wfpl24n02cqR4sL9Yu/d3pk6i0UbM/CdVjyjeM//oee6A0qzJ4c
 vHb2+l93M+Dhy3wVtB8U+3SD9dcIJXxWcd2vXjUfx89jxUPCj2OEsADZi3KsT/oGgB
 NcwvGRCjJIwcaZ6bIyQVMTkSQpEnMurXDpKG9l1VJHJNHaSypBES9Ncqnvw6FN7Wb7
 hswtZBHT6zqaA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 55E2237820DE;
 Thu, 29 Feb 2024 09:11:18 +0000 (UTC)
Date: Thu, 29 Feb 2024 10:11:16 +0100
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
 Ketil Johnsen <ketil.johnsen@arm.com>, Grant Likely
 <grant.likely@linaro.org>
Subject: Re: [PATCH v5 11/14] drm/panthor: Add the driver frontend block
Message-ID: <20240229101116.11a50c52@collabora.com>
In-Reply-To: <20240218214131.3035480-12-boris.brezillon@collabora.com>
References: <20240218214131.3035480-1-boris.brezillon@collabora.com>
 <20240218214131.3035480-12-boris.brezillon@collabora.com>
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

On Sun, 18 Feb 2024 22:41:25 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> +static int panthor_ioctl_bo_create(struct drm_device *ddev, void *data,
> +				   struct drm_file *file)
> +{
> +	struct panthor_file *pfile = file->driver_priv;
> +	struct drm_panthor_bo_create *args = data;
> +	struct panthor_vm *vm = NULL;
> +	int cookie, ret;
> +
> +	if (!drm_dev_enter(ddev, &cookie))
> +		return -ENODEV;
> +
> +	if (!args->size || args->pad ||
> +	    (args->flags & ~PANTHOR_BO_FLAGS)) {
> +		ret = -EINVAL;
> +		goto out_dev_exit;
> +	}
> +
> +	if (args->exclusive_vm_id) {
> +		vm = panthor_vm_pool_get_vm(pfile->vms, args->exclusive_vm_id);
> +		if (!vm) {
> +			ret = -EINVAL;
> +			goto out_dev_exit;
> +		}
> +	}
> +
> +	ret = panthor_gem_create_with_handle(file, ddev, vm, args->size,
> +					     args->flags, &args->handle);

Despite what's stated in the uAPI doc, we never update args->size to
make it page-aligned. We need to change
panthor_gem_create_with_handle()'s prototype to take the size as an 'u64
*' so we can reflect the page-size alignment done by the BO allocation
logic.

Will send a v6 with this fix and the other 2 fixes for the bugs I
reported previously.
