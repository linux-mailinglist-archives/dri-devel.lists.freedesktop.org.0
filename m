Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FC468803D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 15:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6804D10E110;
	Thu,  2 Feb 2023 14:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B059110E110
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 14:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675348578; x=1706884578;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Wvpezp3OskIj7sgYnhd55F+1EVKyYTneVatby1gnkZM=;
 b=Zyk02vr0SWLwYc6UUYsEOnM2bcQ+BM2ZIHmRUxAO5freQaRlkrCwbXj2
 GjKRNSOfNBt/A4OTwOM70p0qquUPzks3atkZ7oeaACt09e9jvmaFG2h+g
 SmJqA8/4jYbI0HVGfM/I+ZX440+jym9izlvVGVKxuuIR0ajzOUE94tO3K
 NhnqcjImBUIp0D8JIZWnCMRxc+iTJcUmIcPsUNDTI5y9knNGSSamsLd6k
 9lZtanB3D0m4hf0Evsd1Gf6aMRcD3MIdG1W21obLAoy/UgrARnVxTls25
 LHKBKagS8bpH1YfBK57Mfsv0tzo2emidfJclF23tfswniAYh7xqFfr3nQ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="308797009"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="308797009"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 06:36:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="728894111"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="728894111"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 06:36:16 -0800
Date: Thu, 2 Feb 2023 15:36:15 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH] drm/vgem: add missing mutex_destroy
Message-ID: <20230202143615.GA2637512@linux.intel.com>
References: <20230202125517.427976-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230202125517.427976-1-mcanal@igalia.com>
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
Cc: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 02, 2023 at 09:55:17AM -0300, Maíra Canal wrote:
> vgem_fence_open() instantiates a mutex for a particular fence
> instance, but never destroys it by calling mutex_destroy() in
> vgem_fence_close().
> 
> So, add the missing mutex_destroy() to guarantee proper resource
> destruction.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

> ---
>  drivers/gpu/drm/vgem/vgem_fence.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
> index c2a879734d40..e15754178395 100644
> --- a/drivers/gpu/drm/vgem/vgem_fence.c
> +++ b/drivers/gpu/drm/vgem/vgem_fence.c
> @@ -249,4 +249,5 @@ void vgem_fence_close(struct vgem_file *vfile)
>  {
>  	idr_for_each(&vfile->fence_idr, __vgem_fence_idr_fini, vfile);
>  	idr_destroy(&vfile->fence_idr);
> +	mutex_destroy(&vfile->fence_mutex);
>  }
> -- 
> 2.39.1
> 
