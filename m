Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F9EB52E1E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 12:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B649010EA6E;
	Thu, 11 Sep 2025 10:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eI7S84UK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FABD10EA6E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 10:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757585750;
 bh=aF7rZ5pnheQnLEFsnlZ2JySSI3HQohgNyKgwl/jgnFQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eI7S84UKCA4Dko7vZwjJd14mi1E2gunUuBBC9GuPuOIz6bwu6aBD9WBO50yldplMY
 GsVjfCyyE9C3GcuzqSOb6ssrCu8/iM2JyB4IxYpfsgSiAcsY31Ef8dUN+BBvwb/8tK
 nwqoB9OVqqRPkQw99xCmBTPmCZnDSuFvgau4qANq6Jy9OsxZ8rtQQL01FRAABOn67p
 bJOWdL0cfU+l8jJmlxX+2BdzgYiw4GT0dkT86bytnoJNzjqosIVYeWnfP4WKFRe6Su
 782KaFBoOATVlEUjkNRjoKQl35rX5RCae5DJMY7WqdmOLtjhpyCj7ulbYkLNujdzf8
 /lv/mz00Ap5Og==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0944617E0A2B;
 Thu, 11 Sep 2025 12:15:49 +0200 (CEST)
Date: Thu, 11 Sep 2025 12:15:37 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, "Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?="
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Liviu Dudau
 <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/2] panthor: use drm_gpuva_unlink_defer()
Message-ID: <20250911121537.523195c5@fedora>
In-Reply-To: <20250909-vmbo-defer-v2-2-9835d7349089@google.com>
References: <20250909-vmbo-defer-v2-0-9835d7349089@google.com>
 <20250909-vmbo-defer-v2-2-9835d7349089@google.com>
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

On Tue, 09 Sep 2025 13:36:23 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

>  static void panthor_vma_init(struct panthor_vma *vma, u32 flags)
> @@ -2084,12 +2010,12 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
>  	if (ret)
>  		return ret;
>  
> -	/* Ref owned by the mapping now, clear the obj field so we don't release the
> -	 * pinning/obj ref behind GPUVA's back.
> -	 */
>  	drm_gpuva_map(&vm->base, &vma->base, &op->map);
>  	panthor_vma_link(vm, vma, op_ctx->map.vm_bo);
> +
> +	drm_gpuvm_bo_put_deferred(op_ctx->map.vm_bo);

Hm, I don't see why we need a drm_gpuvm_bo_put_deferred() here. The
original idea was to delegate the vm_bo ownership to the VA being added
to the VM tree, so if we put it here, we have a UAF situation, don't we?

>  	op_ctx->map.vm_bo = NULL;
> +
>  	return 0;
>  }
