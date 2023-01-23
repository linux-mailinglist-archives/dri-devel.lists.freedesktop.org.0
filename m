Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CDF6779FD
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 12:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEF410E33E;
	Mon, 23 Jan 2023 11:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4D110E33E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 11:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674472693; x=1706008693;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=r7oZJIGCZYHMDZA56Sy4+NIuiwU7Or6QmjTFvFA3D+Y=;
 b=T+spS0Dv7hE+1/WXMG5uCN54W138Ze16rTcYp47OLvgp7ate3ilGgw5r
 iTEpznHLz84ExhoACnJ3AsdjqfHz5j8ZW4F6fDIO0EjoSnBF1hY58nn5b
 2pyczVunLOYO7bsnY5cpzXBXXRKEoed9iUWbuVy40weg5dl4R19bXPXNY
 5aCRnwMk7CEb4rDduKBVul5iRmPywQNo49V6RBj8BUYdV2VvqF94PQfrk
 9S5w+lqA4UElZmrtIpgStaEoprlRCZ0R3jxCHoeNmunHAeYBatSzDaCJp
 ZdzNuhjvWmnmOlSYrgnWcWHFlKbmBLc+whgekUjJnHa6kQ75WzzULi8Rn g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="388371383"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="388371383"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 03:18:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="769765790"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="769765790"
Received: from bridge4x-mobl.ger.corp.intel.com (HELO [10.213.214.72])
 ([10.213.214.72])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 03:18:11 -0800
Message-ID: <438ce7ac-a68a-b2fd-7afd-270db4872497@linux.intel.com>
Date: Mon, 23 Jan 2023 11:18:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RFC 4/4] drm/panfrost: Expose some memory related stats
 through fdinfo
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
References: <20230104130308.3467806-1-boris.brezillon@collabora.com>
 <20230104130308.3467806-5-boris.brezillon@collabora.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230104130308.3467806-5-boris.brezillon@collabora.com>
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
Cc: Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

Chris was kind enough to bring my attention to this thread. Indeed this 
information was asked for by various people for many years so it sounds 
very useful to actually do attempt it.

On 04/01/2023 13:03, Boris Brezillon wrote:
> drm-memory-all: memory hold by this context. Not that all the memory is
> not necessarily resident: heap BO size is counted even though only part
> of the memory reserved for those BOs might be allocated.
> 
> drm-memory-resident: resident memory size. For normal BOs it's the same
> as drm-memory-all, but for heap BOs, only the memory actually allocated
> is counted.
> 
> drm-memory-purgeable: amount of memory that can be reclaimed by the
> system (madvise(DONT_NEED)).
> 
> drm-memory-shared: amount of memory shared through dma-buf.

A bunch of comments/questions..

First of all, lets please continue documenting the fdinfo content in 
Documentation/gpu/drm-usage-stats.rst as stuff is proposed to be added. 
Idea was to have as much commonality as reasonably possible, and so to 
have more usable user facing tools etc. And also please copy people 
involved with adding new stuff to that file.

(Half-digression - for some reason get_maintainers.pl does not play nice 
with this file, I was expecting it to count and sort contributors after 
maintainers but it doesn't for some reason. Perhaps it only does that 
for source code.)

For the actual key/fields name.. I suspect apart from category we will 
need a memory type part, at least with discrete GPUs (non unified/shared 
memory designs), that further breakdown will be required. We therefore 
need to discuss if we do that from the start, or start with your 
proposal and extend later.

In more practical terms I am talking about something this:

drm-memory-local-all: <ulong> <unit>
drm-memory-local-resident: <ulong> <unit>
drm-memory-system-all: <ulong> <unit>
drm-memory-system-resident: <ulong> <unit>

"All/resident/..." could then probably be standardized and the 
"local/system" could be partially standardized or left for drivers to 
use names they see fit (same as with engine names).

Also, I an not quite liking "all". Analogy from the CPU land for it 
would be "virtual", but does translate into the GPU world?

Finally, we also need to define the semantics of resident when we deal 
with shared objects. For instance process P / fd Fp creates a buffer and 
passes the handle to process Q / fd Fq. Whose fdinfo sees what, in what 
fields and when?

I suspect if Q is the first to start using the shared object it should 
show it under "resident". P should not, until it starts using it itself. 
For the "all" category both should see it.

For "shared" are you proposing to count imported or exported counts as 
well? I think it needs to be clearly documented. Is it "this fd is using 
this much shared buffers", or "this fd has exported this much shared 
buffers", or both?

I don't know your driver to quickly figure out what semantics you proposed?

Regards,

Tvrtko

> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>   drivers/gpu/drm/panfrost/panfrost_drv.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 6ee43559fc14..05d5d480df2a 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -519,9 +519,16 @@ static void panfrost_show_fdinfo(struct seq_file *m, struct file *f)
>   {
>   	struct drm_file *file = f->private_data;
>   	struct panfrost_file_priv *panfrost_priv = file->driver_priv;
> +	struct panfrost_mmu_stats mmu_stats; > +
> +	panfrost_mmu_get_stats(panfrost_priv->mmu, &mmu_stats);
>   
>   	seq_printf(m, "drm-driver:\t%s\n", file->minor->dev->driver->name);
>   	seq_printf(m, "drm-client-id:\t%llu\n", panfrost_priv->sched_entity[0].fence_context);
> +	seq_printf(m, "drm-memory-all:\t%llu KiB\n", mmu_stats.all >> 10);
> +	seq_printf(m, "drm-memory-resident:\t%llu KiB\n", mmu_stats.resident >> 10);
> +	seq_printf(m, "drm-memory-purgeable:\t%llu KiB\n", mmu_stats.purgeable >> 10);
> +	seq_printf(m, "drm-memory-shared:\t%llu KiB\n", mmu_stats.shared >> 10);
>   }
>   
>   static const struct file_operations panfrost_drm_driver_fops = {
