Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCD5A65358
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 15:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098BA10E40C;
	Mon, 17 Mar 2025 14:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LezkOzDt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAFA10E40C;
 Mon, 17 Mar 2025 14:27:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3D1CF5C53B6;
 Mon, 17 Mar 2025 14:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E317C4CEE3;
 Mon, 17 Mar 2025 14:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742221659;
 bh=S0vgTmExSs8TP4DO0y0I4mxzu5Fz3Cx3YODvfxwaHDk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=LezkOzDt2OSliT4NtauNzcjMXFHv4rE1MShFYSlPsiyVq3kgTbVIB/ReX1WGb4IXS
 BqPMsCV1S/NKA5QH8+AwybcnNqj8mJhl2klLKBa26rA5Jy0HlD6/wyC3br0dCxMIs+
 Fh06skPiLQaYf0BaIkdHOzy4S4boiit5dZ37xaNQ3K2f/IEbbtczv73GzsHJqSkyxB
 Ouzj9U/jGWcQWWs3NjdxzuOfMnef9Jt7ejnKpqWxlJ+H0sC012PwqO1wnKy5WZ3Dyj
 EMiQcvVe4nsH1K9HSlZ+cCh6WHw/K7fc9a6u8Tap1HLEuLihL3UDIrFRtJJpf5sK9F
 zelMN2Y4Re/Jg==
Date: Mon, 17 Mar 2025 15:27:35 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, oak.zeng@intel.com,
 dri-devel@lists.freedesktop.org, bbrezillon@kernel.org
Subject: Re: [RFC 13/29] drm/gpuvm: Introduce MADVISE Operations
Message-ID: <Z9gxV0RZLopxf8et@pollux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314080226.2059819-14-himal.prasad.ghimiray@intel.com>
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

(Cc: dri-devel@lists.freedesktop.org, Boris)

Hi Himal,

Please make sure to copy in dri-devel for such patches.

On Fri, Mar 14, 2025 at 01:32:10PM +0530, Himal Prasad Ghimiray wrote:
> Introduce MADVISE operations that do not unmap the GPU VMA. These
> operations split VMAs if the start or end addresses fall within existing
> VMAs. The operations can create up to 2 REMAPS and 2 MAPs.

Can you please add some more motivation details for this patch? What exactly is
it used for?

> 
> If the input range is within the existing range, it creates REMAP:UNMAP,
> REMAP:PREV, REMAP:NEXT, and MAP operations for the input range.
>   Example:
>   Input Range: 0x00007f0a54000000 to 0x00007f0a54400000
>   GPU VMA: 0x0000000000000000 to 0x0000800000000000
>   Operations Result:
>   - REMAP:UNMAP: addr=0x0000000000000000, range=0x0000800000000000
>   - REMAP:PREV: addr=0x0000000000000000, range=0x00007f0a54000000
>   - REMAP:NEXT: addr=0x00007f0a54400000, range=0x000000f5abc00000
>   - MAP: addr=0x00007f0a54000000, range=0x0000000000400000

This would be much easier to read if you'd pick some more human readable
numbers.

> 
> If the input range starts at the beginning of one GPU VMA and ends at
> the end of another VMA, covering multiple VMAs, the operations do nothing.
>   Example:
>   Input Range: 0x00007fc898800000 to 0x00007fc899000000
>   GPU VMAs:
>   - 0x0000000000000000 to 0x00007fc898800000
>   - 0x00007fc898800000 to 0x00007fc898a00000
>   - 0x00007fc898a00000 to 0x00007fc898c00000
>   - 0x00007fc898c00000 to 0x00007fc899000000
>   - 0x00007fc899000000 to 0x00007fc899200000
>   Operations Result: None

Same here.

> 
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c | 175 +++++++++++++++++++++++++++++++++++-
>  include/drm/drm_gpuvm.h     |   6 ++
>  2 files changed, 180 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index f9eb56f24bef..904a26641b21 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2230,7 +2230,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  				ret = op_remap_cb(ops, priv, NULL, &n, &u);
>  				if (ret)
>  					return ret;
> -				break;
> +				return 0;
>  			}
>  		}
>  	}
> @@ -2240,6 +2240,143 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  			 req_obj, req_offset);
>  }
>  
> +static int
> +__drm_gpuvm_skip_split_map(struct drm_gpuvm *gpuvm,
> +			   const struct drm_gpuvm_ops *ops, void *priv,
> +			   u64 req_addr, u64 req_range,
> +			   bool skip_gem_obj_va, u64 req_offset)

This looks like a full copy of __drm_gpuvm_sm_map(). I think you should extend
__drm_gpuvm_sm_map() instead and add an optional flags parameter, e.g.

	enum drm_gpuvm_madvise_flags {
		DRM_GPUVM_SKIP_GEM_OBJ_VA = BIT(0),
	}

Not sure whether "SKIP_GEM_OBJ_VA" is a good name, but I haven't gone through
this to such extend that I could propose something better.

> +struct drm_gpuva_ops *
> +drm_gpuvm_madvise_ops_create(struct drm_gpuvm *gpuvm,
> +			     u64 req_addr, u64 req_range,
> +			     bool skip_gem_obj_va, u64 req_offset)

Same here, I don't think we need a new function for this, but just the
corresponding flags argument to the existing one.

Besides that, when adding new functionality, please extend the documentation of
drm_gpuvm accordingly. It's fine you didn't do so for the RFC of course. :)
