Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9F78D50BC
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 19:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C3B10E239;
	Thu, 30 May 2024 17:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EdfECa1E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544A010E00F;
 Thu, 30 May 2024 17:14:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 057BBCE1B15;
 Thu, 30 May 2024 17:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8734CC2BBFC;
 Thu, 30 May 2024 17:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717089274;
 bh=EtJPMO8Qsbmacd1a3SLmAxIagzEDdqfsAqMgxfjoBO0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EdfECa1EM7VH7Kw+eI1rSxkEbyBZHklpOdNL6ZMDygZiZlxj6HOe4ltF9a7h3jofm
 pkuuo4lBaHKz3PbcunHVpVX+tuo7NzoufrGOmJaIA6BTDDdq6cRc1Ar0BmodJ0uRDZ
 HWqVEdK5shm6pf6v+cNpCjcspAgbsWQeZfqTXd8KnnAhKDhM29/MGa1WIRWeAskGxL
 iBQ7dJPop3h7ulPdCQKvaYaeaeIddTsjNhoPErFOTx4DNs6E4iowE22Pf7Mbd1aABU
 R3AtXBfRhSKZ3iInEdY7s3buxLO9UhnTg0vX+8LXRGee2gH9ZSPx1yOldghi1f0bmn
 mlPrIX5PUW55Q==
Date: Thu, 30 May 2024 20:14:26 +0300
From: Zhi Wang <zhiwang@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/i915/gvt: stop using drm_edid_block_valid()
Message-ID: <20240530201426.00006d57.zhiwang@kernel.org>
In-Reply-To: <20240530124352.362736-1-jani.nikula@intel.com>
References: <20240530124352.362736-1-jani.nikula@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-w64-mingw32)
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

On Thu, 30 May 2024 15:43:51 +0300
Jani Nikula <jani.nikula@intel.com> wrote:

> We'll want to stop drm_edid_block_valid() usage. KVMGT is the last
> user. Replace with drm_edid_valid(), which unfortunately requires an
> allocated drm_edid. However, on the plus side, this would be required
> to handle the TODO comment about EDID extension block support.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Zhi Wang <zhi.wang.linux@gmail.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c
> b/drivers/gpu/drm/i915/gvt/kvmgt.c index 4f74d867fe1a..7e3e5382c0c0
> 100644 --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -425,6 +425,18 @@ static const struct intel_vgpu_regops
> intel_vgpu_regops_opregion = { .release =
> intel_vgpu_reg_release_opregion, };
>  
> +static bool edid_valid(const void *edid, size_t size)
> +{
> +	const struct drm_edid *drm_edid;
> +	bool is_valid;
> +
> +	drm_edid = drm_edid_alloc(edid, size);
> +	is_valid = drm_edid_valid(drm_edid);
> +	drm_edid_free(drm_edid);
> +
> +	return is_valid;
> +}
> +
>  static int handle_edid_regs(struct intel_vgpu *vgpu,
>  			struct vfio_edid_region *region, char *buf,
>  			size_t count, u16 offset, bool is_write)
> @@ -443,11 +455,7 @@ static int handle_edid_regs(struct intel_vgpu
> *vgpu, switch (offset) {
>  		case offsetof(struct vfio_region_gfx_edid,
> link_state): if (data == VFIO_DEVICE_GFX_LINK_STATE_UP) {
> -				if (!drm_edid_block_valid(
> -					(u8 *)region->edid_blob,
> -					0,
> -					true,
> -					NULL)) {
> +				if (!edid_valid(region->edid_blob,
> EDID_SIZE)) { gvt_vgpu_err("invalid EDID blob\n");
>  					return -EINVAL;
>  				}

Acked-by: Zhi Wang <zhiwang@kernel.org>
