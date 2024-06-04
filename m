Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5E38FB7A0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 17:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704B110E52D;
	Tue,  4 Jun 2024 15:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QFYHrfR2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E3210E52D;
 Tue,  4 Jun 2024 15:41:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CC8FFCE0D92;
 Tue,  4 Jun 2024 15:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 419ADC2BBFC;
 Tue,  4 Jun 2024 15:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1717515705;
 bh=MkqW4oRMkhNEdYOvDU8SXsza2MZUGZIzZNiOeC/dQY8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QFYHrfR2wBDLSr/NAUq7a4NDJajg6kry2t9DxkVnMJNuCwbyEticVZz7z2cXgWxSV
 W/tFV8bzudGtOLJnKhHl1GTe7pvxoBR5+Kc53ItMaFHBUJT0bjGH7NoEruB+u04AF/
 QvjXc0tth8Ny884yL9+o4j1zEe6gYh2NE+pGVcfU=
Date: Tue, 4 Jun 2024 17:31:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, alexander.deucher@amd.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Baoquan He <bhe@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernel/resource: optimize find_next_iomem_res
Message-ID: <2024060427-upstairs-jackal-b10a@gregkh>
References: <20240531053704.2009827-1-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531053704.2009827-1-olvaffe@gmail.com>
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

On Thu, May 30, 2024 at 10:36:57PM -0700, Chia-I Wu wrote:
> We can skip children resources when the parent resource does not cover
> the range.
> 
> This should help vmf_insert_* users on x86, such as several DRM drivers.
> On my AMD Ryzen 5 7520C, when streaming data from cpu memory into amdgpu
> bo, the throughput goes from 5.1GB/s to 6.6GB/s.  perf report says
> 
>   34.69%--__do_fault
>   34.60%--amdgpu_gem_fault
>   34.00%--ttm_bo_vm_fault_reserved
>   32.95%--vmf_insert_pfn_prot
>   25.89%--track_pfn_insert
>   24.35%--lookup_memtype
>   21.77%--pat_pagerange_is_ram
>   20.80%--walk_system_ram_range
>   17.42%--find_next_iomem_res
> 
> before this change, and
> 
>   26.67%--__do_fault
>   26.57%--amdgpu_gem_fault
>   25.83%--ttm_bo_vm_fault_reserved
>   24.40%--vmf_insert_pfn_prot
>   14.30%--track_pfn_insert
>   12.20%--lookup_memtype
>   9.34%--pat_pagerange_is_ram
>   8.22%--walk_system_ram_range
>   5.09%--find_next_iomem_res
> 
> after.

That's great, but why is walk_system_ram_range() being called so often?

Shouldn't that be a "set up the device" only type of thing?  Why hammer
on "lookup_memtype" when you know the memtype, you just did the same
thing for the previous frame.

This feels like it could be optimized to just "don't call these things"
which would make it go faster, right?

What am I missing here, why does this always have to be calculated all
the time?  Resource mapping changes are rare, if at all, over the
lifetime of a system uptime.  Constantly calculating something that
never changes feels odd to me.

thanks,

greg k-h
