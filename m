Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29567B7165
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 20:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B35F10E311;
	Tue,  3 Oct 2023 18:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14A810E2E2;
 Tue,  3 Oct 2023 18:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696359456; x=1727895456;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2RmLHXlDrvpms2MO/iCl0m6YdD9Afj1b4iuJowttADI=;
 b=RMt24Z2satFHFN/hr7GO/jCd5AAgWoPDruZse2W1xA1ZLPEBczb12FXC
 dDXEYIBGZEWyM440k6lsLR22h6zv3Seqm3ejhLNPTyzVDGDIEmPiNzSvr
 38c8/MjKJpaG+q55n77dfH4bp0CIvoqrSgvURAwjEL1ecl/nuEIkxz7R3
 +iCgK0KkeQ17A0WGh9gvA9P/OIjoQ3lXcfRO7oRi93C4begs4Dv3JGhHR
 8255SVFJnWEeKkgVAOTrfB2ukRmM7u6A3Zr71OooNkrROTNQRqbqLG4Se
 l9uSNrMRtvK5DgVN1wnyTqjRco5gWtwuZ4kaDR1H6GhWx5mP3eyNl98ME Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="1549146"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="1549146"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 11:57:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="816808372"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="816808372"
Received: from fhoeg-mobl1.ger.corp.intel.com (HELO [10.249.254.234])
 ([10.249.254.234])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 11:57:31 -0700
Message-ID: <b01f77e2-a885-af0e-ef9b-265e93b2dee0@linux.intel.com>
Date: Tue, 3 Oct 2023 20:57:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v5 4/6] drm/gpuvm: track/lock/validate
 external/evicted objects
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20230928191624.13703-1-dakr@redhat.com>
 <20230928191624.13703-5-dakr@redhat.com>
 <e4e68970-c7c9-55e2-9483-01252f38c956@linux.intel.com>
 <20231003120554.547090bc@collabora.com>
 <f551ee9059e52d46343f5fa997b7d9f8ab6654d9.camel@linux.intel.com>
 <20231003162143.490e3ef0@collabora.com> <ZRxHcwYUbp5/fS+v@pollux>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZRxHcwYUbp5/fS+v@pollux>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: matthew.brost@intel.com, sarah.walker@imgtec.com,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net, donald.robson@imgtec.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/3/23 18:55, Danilo Krummrich wrote:
> It seems like we're mostly aligned on this series, except for the key
> controversy we're discussing for a few versions now: locking of the internal
> lists. Hence, let's just re-iterate the options we have to get this out of the
> way.
>
> (1) The spinlock dance. This basically works for every use case, updating the VA
>      space from the IOCTL, from the fence signaling path or anywhere else.
>      However, it has the downside of requiring spin_lock() / spin_unlock() for
>      *each* list element when locking all external objects and validating all
>      evicted objects. Typically, the amount of extobjs and evicted objects
>      shouldn't be excessive, but there might be exceptions, e.g. Xe.
>
> (2) The dma-resv lock dance. This is convinient for drivers updating the VA
>      space from a VM_BIND ioctl() and is especially efficient if such drivers
>      have a huge amount of external and/or evicted objects to manage. However,
>      the downsides are that it requires a few tricks in drivers updating the VA
>      space from the fence signaling path (e.g. job_run()). Design wise, I'm still
>      skeptical that it is a good idea to protect internal data structures with
>      external locks in a way that it's not clear to callers that a certain
>      function would access one of those resources and hence needs protection.
>      E.g. it is counter intuitive that drm_gpuvm_bo_put() would require both the
>      dma-resv lock of the corresponding object and the VM's dma-resv lock held.
>      (Additionally, there were some concerns from amdgpu regarding flexibility in
>      terms of using GPUVM for non-VM_BIND uAPIs and compute, however, AFAICS
>      those discussions did not complete and to me it's still unclear why it
>      wouldn't work.)
>
> (3) Simply use an internal mutex per list. This adds a tiny (IMHO negligible)
>      overhead for drivers updating the VA space from a VM_BIND ioctl(), namely
>      a *single* mutex_lock()/mutex_unlock() when locking all external objects
>      and validating all evicted objects. And it still requires some tricks for
>      drivers updating the VA space from the fence signaling path. However, it's
>      as simple as it can be and hence way less error prone as well as
>      self-contained and hence easy to use. Additionally, it's flexible in a way
>      that we don't have any expections on drivers to already hold certain locks
>      that the driver in some situation might not be able to acquire in the first
>      place.
>
> (4) Arbitrary combinations of the above. For instance, the current V5 implements
>      both (1) and (2) (as either one or the other). But also (1) and (3) (as in
>      (1) additionally to (3)) would be an option, where a driver could opt-in for
>      the spinlock dance in case it updates the VA space from the fence signaling
>      path.
>
> I also considered a few other options as well, however, they don't seem to be
> flexible enough. For instance, as by now we could use SRCU for the external
> object list. However, this falls apart once a driver wants to remove and re-add
> extobjs for the same VM_BO instance. (For the same reason it wouldn't work for
> evicted objects.)
>
> Personally, after seeing the weird implications of (1), (2) and a combination of
> both, I tend to go with (3). Optionally, with an opt-in for (1). The reason for
> the latter is that with (3) the weirdness of (1) by its own mostly disappears.
>
> Please let me know what you think, and, of course, other ideas than the
> mentioned ones above are still welcome.
>
> - Danilo
>
Here are the locking principles Daniel put together and Dave once called 
out for us to be applying when reviewing DRM code. These were prompted 
by very fragile and hard to understand locking patterns in the i915 
driver and I think the xe vm_bind locking design was made with these in 
mind, (not sure exactly who wrote what, though so can't say for sure).

https://blog.ffwll.ch/2022/07/locking-engineering.html
https://blog.ffwll.ch/2022/08/locking-hierarchy.html

At least to me, this motivates using the resv design unless we strictly 
need lower level locks that are taken in the eviction paths or userptr 
invalidation paths, but doesn't rule out spinlocks or lock dropping 
tricks where these are really necessary. But pretty much rules out RCU / 
SRCU from what I can tell.

It also calls for documenting how individual members of structs are 
protected when ever possible.

Thanks,
Thomas


