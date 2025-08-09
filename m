Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFADB1F49D
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 14:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E0010E1CD;
	Sat,  9 Aug 2025 12:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u11pErsp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C6410E1A6;
 Sat,  9 Aug 2025 12:43:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 59488601EC;
 Sat,  9 Aug 2025 12:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7CB9C4CEE7;
 Sat,  9 Aug 2025 12:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754743414;
 bh=cgfbLlDM+uE3+w25kWktwTIc62T2IyuW6cl8fggU7PE=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=u11pErsp7VIq26LXHPPbXqrMnoGd+QIkhewgVPIlifdznkGsntXAcA4zu5/TXjDOL
 nSoP5O07QFLyQ4rl5OnTCu45GtAaYxOiP43sHntMZx3ZlI53g6wWOHMFWOLYjKGcnL
 cChTFQMFPIpJT6RtlZd8dbu7fhpnNGMo3rXjQ7FNqx3ex92YPcfOh67aOVn8Dvn6BX
 uqW2ZNPunsAnbhvpZAmpNJqF5W8L3zZ/Gxdtf6AI0OjFwB25J7G6SPHlsNxEuxUdd3
 jJi5MB8zl6GvvqFmiCvfzGY14AB32WJ17s+jDWR8/G5xh6rr3TScDWNq/RsbODR8Pm
 yML4kNE5XJHDQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 09 Aug 2025 14:43:30 +0200
Message-Id: <DBXWMIF2E8KO.3COG8ZYK5XE2N@kernel.org>
Subject: Re: [PATCH v6 01/26] drm/gpuvm: Pass map arguments through a struct
Cc: <intel-xe@lists.freedesktop.org>, "Matthew Brost"
 <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Brendan King" <Brendan.King@imgtec.com>,
 "Boris Brezillon" <bbrezillon@kernel.org>, "Caterina Shablia"
 <caterina.shablia@collabora.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
 <20250807164338.1832254-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250807164338.1832254-2-himal.prasad.ghimiray@intel.com>
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

On Thu Aug 7, 2025 at 6:43 PM CEST, Himal Prasad Ghimiray wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
>
> We are about to pass more arguments to drm_gpuvm_sm_map[_ops_create](),
> so, before we do that, let's pass arguments through a struct instead
> of changing each call site every time a new optional argument is added.
>
> v5
>  - Use drm_gpuva_op_map=E2=80=94same as drm_gpuvm_map_req
>  - Rebase changes for drm_gpuvm_sm_map_exec_lock()
>  - Fix kernel-docs
>
> v6
>  - Use drm_gpuvm_map_req (Danilo/Matt)
>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Brendan King <Brendan.King@imgtec.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Caterina Shablia <caterina.shablia@collabora.com>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>

Caterina does not seem to be involved in handling this patch. Either you sh=
ould
remove this SoB or adda Co-developed-by: tag for her if that's the case.

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

You may also want to add a Co-developed-by: tag for yourself given that you=
 made
significant changes to the patch. But that's between Boris and you of cours=
e.

> +/**
> + * struct drm_gpuvm_map_req - arguments passed to drm_gpuvm_sm_map[_ops_=
create]()
> + */
> +struct drm_gpuvm_map_req {
> +	/**
> +	 * @op_map: struct drm_gpuva_op_map
> +	 */
> +	struct drm_gpuva_op_map op_map;

I think this should just be 'op', the outer structure says 'map' already.

> +};
