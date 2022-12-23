Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D25A655105
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 14:30:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1B310E64A;
	Fri, 23 Dec 2022 13:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E36A10E64A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 13:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1671802212; bh=hh/P3iw4eBs4c5XAeMc1qUpSafty1+QfORKyRMiRZao=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=n1B1LDqv6ibhdD+F1if+LE9+mv3hvjRnOo21E/+Buuu/QjyNmPF3pI3b5VtGru07X
 VGsjkCkaavKuJamlbNN2SaDCwCy23PBBGErKX7Z/88J6wW0Pia1zIq+U4IlMCgJeqU
 a+62jC2eDd1Lu8pE9/6K/+aCv/S11cQ/Pe3OnoWM=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Fri, 23 Dec 2022 14:30:12 +0100 (CET)
X-EA-Auth: MYGhqpJwe1OkJiLuBz/mYu+NlbOxDTxwSvtBnShGmqmsf/chpNNZBWpBSU29/z8cdyBFOs/MbjLq++Sv/DHCZGsYyjHVbdB5
Date: Fri, 23 Dec 2022 19:00:05 +0530
From: Deepak R Varma <drv@mailo.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gvt: Replace DEFINE_SIMPLE_ATTRIBUTE by
 DEFINE_DEBUGFS_ATTRIBUTE
Message-ID: <Y6WtXSMDcYDyGZt4@qemulion>
References: <Y5yX01RC4B22j5w8@qemulion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5yX01RC4B22j5w8@qemulion>
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>, drv@mailo.com,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 16, 2022 at 09:37:47PM +0530, Deepak R Varma wrote:
> The DEFINE_DEBUGFS_ATTRIBUTE macro has implementation for protecting the
> read/write file operations from removal race conditions. This further
> enables using debugfs_create_file_unsafe() function since there is no need
> for a proxy file operations struct for protection. Hence replace the
> DEFINE_SIMPLE_ATTRIBUTE macro by DEFINE_DEBUGFS_ATTRIBUTE and the
> debugfs_create_file() by the lightweight debugfs_create_file_unsafe()
> versions.
>
> This issue was identified using the coccinelle debugfs_simple_attr.cocci
> semantic patch.
>
> Signed-off-by: Deepak R Varma <drv@mailo.com>

Hello,
May I please request a review and feedback on this change proposal?

Thank you,
./drv


> ---
> Please note: The changes are compile tested only.
>
>  drivers/gpu/drm/i915/gvt/debugfs.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/debugfs.c
> index 9f1c209d9251..a45a43c35a6b 100644
> --- a/drivers/gpu/drm/i915/gvt/debugfs.c
> +++ b/drivers/gpu/drm/i915/gvt/debugfs.c
> @@ -147,9 +147,9 @@ vgpu_scan_nonprivbb_set(void *data, u64 val)
>  	return 0;
>  }
>
> -DEFINE_SIMPLE_ATTRIBUTE(vgpu_scan_nonprivbb_fops,
> -			vgpu_scan_nonprivbb_get, vgpu_scan_nonprivbb_set,
> -			"0x%llx\n");
> +DEFINE_DEBUGFS_ATTRIBUTE(vgpu_scan_nonprivbb_fops,
> +			 vgpu_scan_nonprivbb_get, vgpu_scan_nonprivbb_set,
> +			 "0x%llx\n");
>
>  /**
>   * intel_gvt_debugfs_add_vgpu - register debugfs entries for a vGPU
> @@ -165,8 +165,8 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu)
>  	debugfs_create_bool("active", 0444, vgpu->debugfs, &vgpu->active);
>  	debugfs_create_file("mmio_diff", 0444, vgpu->debugfs, vgpu,
>  			    &vgpu_mmio_diff_fops);
> -	debugfs_create_file("scan_nonprivbb", 0644, vgpu->debugfs, vgpu,
> -			    &vgpu_scan_nonprivbb_fops);
> +	debugfs_create_file_unsafe("scan_nonprivbb", 0644, vgpu->debugfs, vgpu,
> +				   &vgpu_scan_nonprivbb_fops);
>  }
>
>  /**
> --
> 2.34.1
>


