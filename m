Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A9684E327
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 15:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3E810E801;
	Thu,  8 Feb 2024 14:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2F3E710E801
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 14:29:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EF95DA7
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 06:30:16 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 176AD3F762
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 06:29:33 -0800 (PST)
Date: Thu, 8 Feb 2024 14:29:32 +0000
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Rob Herring <robh@kernel.org>,
 =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Daniel Stone <daniels@collabora.com>, Steven Price <steven.price@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, kernel@collabora.com,
 Heiko Stuebner <heiko@sntech.de>, Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 Chris Diamand <chris.diamand@foss.arm.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>
Subject: Re: [PATCH v4 01/14] drm/panthor: Add uAPI
Message-ID: <ZcTlOilAOq8yrVit@e110455-lin.cambridge.arm.com>
References: <20240122163047.1954733-1-boris.brezillon@collabora.com>
 <20240122163047.1954733-2-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122163047.1954733-2-boris.brezillon@collabora.com>
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

Hi Boris,

Minor spelling issues to raise in the documentation text uAPI:

On Mon, Jan 22, 2024 at 05:30:32PM +0100, Boris Brezillon wrote:
> Panthor follows the lead of other recently submitted drivers with
> ioctls allowing us to support modern Vulkan features, like sparse memory
> binding:
> 
> - Pretty standard GEM management ioctls (BO_CREATE and BO_MMAP_OFFSET),
>   with the 'exclusive-VM' bit to speed-up BO reservation on job submission
> - VM management ioctls (VM_CREATE, VM_DESTROY and VM_BIND). The VM_BIND
>   ioctl is loosely based on the Xe model, and can handle both
>   asynchronous and synchronous requests
> - GPU execution context creation/destruction, tiler heap context creation
>   and job submission. Those ioctls reflect how the hardware/scheduler
>   works and are thus driver specific.
> 
> We also have a way to expose IO regions, such that the usermode driver
> can directly access specific/well-isolate registers, like the
> LATEST_FLUSH register used to implement cache-flush reduction.
> 
> This uAPI intentionally keeps usermode queues out of the scope, which
> explains why doorbell registers and command stream ring-buffers are not
> directly exposed to userspace.
> 
> v4:
> - Add a VM_GET_STATE ioctl
> - Fix doc
> - Expose the CORE_FEATURES register so we can deal with variants in the
>   UMD
> - Add Steve's R-b
> 

[snip]

> +
> +/**
> + * enum drm_panthor_vm_state - VM states.
> + */
> +enum drm_panthor_vm_state {
> +	/**
> +	 * @DRM_PANTHOR_VM_STATE_USABLE: VM is usable.
> +	 *
> +	 * New VM operations will be accepted on this VM.
> +	 */
> +	DRM_PANTHOR_VM_STATE_USABLE,
> +
> +	/**
> +	 * @DRM_PANTHOR_VM_STATE_UNSABLE: VM is unsable.

s/UNSABLE/UNUSABLE/ and s/unsable/unusable/

> +	 *
> +	 * Something put the VM in an unusable state (like an asynchronous
> +	 * VM_BIND request failing for any reason).
> +	 *
> +	 * Once the VM is in this state, all new MAP operations will be
> +	 * rejected, and any GPU job targeting this VM will fail.
> +	 * UNMAP operations are still accepted.
> +	 *
> +	 * The only way to recover from an unusable VM is to create a new
> +	 * VM, and destroy the old one.
> +	 */
> +	DRM_PANTHOR_VM_STATE_UNUSABLE,
> +};
> +

[snip]

The rest of the patch looks good to me!

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
