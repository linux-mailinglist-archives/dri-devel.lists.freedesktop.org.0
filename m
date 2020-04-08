Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E34A1A255E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 17:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709FC6E148;
	Wed,  8 Apr 2020 15:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0227.hostedemail.com
 [216.40.44.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761916E148;
 Wed,  8 Apr 2020 15:37:22 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 5739A18041E93;
 Wed,  8 Apr 2020 15:37:21 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 10, 1, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:1801:2195:2199:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3308:3352:3622:3865:3866:3867:3868:3870:4250:4321:4605:5007:6119:6609:10004:10400:10848:11026:11232:11657:11658:11914:12043:12296:12297:12740:12760:12895:13019:13069:13181:13229:13311:13357:13439:13523:13524:14181:14659:14721:14819:21080:21433:21434:21451:21627:30054:30069:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:3, LUA_SUMMARY:none
X-HE-Tag: bone48_22e7092f25135
X-Filterd-Recvd-Size: 2637
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf12.hostedemail.com (Postfix) with ESMTPA;
 Wed,  8 Apr 2020 15:37:19 +0000 (UTC)
Message-ID: <bfa1a07f6f2046d5edac80d282cc710328d84d72.camel@perches.com>
Subject: Re: [PATCH] drm/amd/amdgpu: add prefix for pr_* prints
From: Joe Perches <joe@perches.com>
To: Aurabindo Pillai <mail@aurabindo.in>, alexander.deucher@amd.com, 
 christian.koenig@amd.com
Date: Wed, 08 Apr 2020 08:35:20 -0700
In-Reply-To: <20200408133735.7679-1-mail@aurabindo.in>
References: <20200408133735.7679-1-mail@aurabindo.in>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
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
Cc: airlied@linux.ie, avid1.Zhou@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-04-08 at 09:37 -0400, Aurabindo Pillai wrote:
> amdgpu uses lots of pr_* calls for printing error messages.
> With this prefix, errors shall be more obvious to the end
> use regarding its origin, and may help debugging.
> 
> Prefix format:
> 
> [xxx.xxxxx] amdgpu: ...
[]
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
[]
> @@ -28,6 +28,12 @@
>  #ifndef __AMDGPU_H__
>  #define __AMDGPU_H__
>  
> +#ifdef pr_fmt
> +#undef pr_fmt
> +#endif
> +
> +#define pr_fmt(fmt) "amdgpu: " fmt
> +
>  #include "amdgpu_ctx.h"
>  
>  #include <linux/atomic.h>

All the embedded uses of "amdgpu:" in logging
messages should also be deleted.

$ git grep -P '(?:dev_|pr_).*"amdgpu:' drivers/gpu/drm/amd/amdgpu/
drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:               pr_err("amdgpu: failed to validate PT BOs\n");
drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:               pr_err("amdgpu: failed to validate PD\n");
drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:                       pr_err("amdgpu: failed to kmap PD, ret=%d\n", ret);
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:             pr_info("amdgpu: switched on\n");
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:             pr_info("amdgpu: switched off\n");
drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:                        dev_dbg(adev->dev, "amdgpu: using MSI/MSI-X.\n");
drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c:          dev_warn(adev->dev, "amdgpu: No suitable DMA available.\n");
drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c:          pr_warn("amdgpu: No suitable DMA available\n");
drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c:          pr_warn("amdgpu: No suitable DMA available\n");



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
