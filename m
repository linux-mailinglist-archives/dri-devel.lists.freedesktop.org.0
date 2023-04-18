Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9906E6A5C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 19:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE2A10E0EF;
	Tue, 18 Apr 2023 17:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BF210E0DA;
 Tue, 18 Apr 2023 17:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681837213; x=1713373213;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=paTJcddG06iVBTPSVFSP/1hFmO7UqKIvTpuCikzeWxs=;
 b=YYZlTqqUVyhU+3ltDEDWPySxJvA29AHtVdLZyEBHtEm286oFTuUhYtG4
 XJLxbSO+xX3BNMYvtcnYfsnmesYZZGPxFbkBs1xsevDvHY+s6moI8IWZa
 GdBkwoynqpnXBYaDLGz/hlTVLZtNJvfHY+5syj1aQFUWXBMOWJ/Q/V99p
 1wFthT3M7ZP5SGK4Z+LYK58O3F9NGJlA6HLCPA+2xWRZp43RRIPE8nwcw
 RD++14wYs7eYbdjlROYZV8piicVwy1U8wKv2+289fZw7wyKcd2yDBqc5v
 owpxel8WDE/U4bcGahyXjTaZcERTsaSExA76yV5hcUe9oh53WXSrmVpIX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="342716685"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="342716685"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 10:00:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="802602758"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="802602758"
Received: from ashfaqur-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.213.178])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 10:00:07 -0700
Date: Tue, 18 Apr 2023 18:59:44 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] drm/amdkfd: Fix potential deallocation of previously
 deallocated memory.
Message-ID: <ZD7MgL619KVYKeTV@ashyti-mobl2.lan>
References: <20230418065521.453001-1-d.dulov@aladdin.ru>
 <ZD5ZFoEk92MNQpqD@ashyti-mobl2.lan>
 <d41669a1-9e18-defb-d0cc-d43d7be7d23e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d41669a1-9e18-defb-d0cc-d43d7be7d23e@kernel.org>
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
Cc: lvc-project@linuxtesting.org, David Airlie <airlied@linux.ie>,
 Daniil Dulov <d.dulov@aladdin.ru>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Christian =?iso-8859-15?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Oak Zeng <ozeng@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 18, 2023 at 12:07:15PM +0200, Krzysztof Kozlowski wrote:
> On 18/04/2023 10:47, Andi Shyti wrote:
> > Hi Daniil,
> > 
> > On Mon, Apr 17, 2023 at 11:55:21PM -0700, Daniil Dulov wrote:
> >> Pointer mqd_mem_obj can be deallocated in kfd_gtt_sa_allocate().
> >> The function then returns non-zero value, which causes the second deallocation.
> >>
> >> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> >>
> >> Fixes: d1f8f0d17d40 ("drm/amdkfd: Move non-sdma mqd allocation out of init_mqd")
> >> Signed-off-by: Daniil Dulov <d.dulov@aladdin.ru>
> >> ---
> >>  drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> >> index 3b6f5963180d..bce11c5b07d6 100644
> >> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> >> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> >> @@ -119,7 +119,8 @@ static struct kfd_mem_obj *allocate_mqd(struct kfd_dev *kfd,
> >>  	}
> >>  
> >>  	if (retval) {
> >> -		kfree(mqd_mem_obj);
> >> +		if (mqd_mem_obj)
> >> +			kfree(mqd_mem_obj);
> > 
> > I think this is not needed. kfree() returns immediately if
> > mqd_mem_obj is NULL.
> > 
> 
> Yep, the tool has to be fixed because such patch is just misleading.
> However different point - the commit description actually describes
> entirely different case: double free. Maybe the issue is true, just the
> fix is wrong?

Yes, indeed, the fix is wrong, but the bug exists. I'm pasting
the original function:

	if (kfd->cwsr_enabled && (q->type == KFD_QUEUE_TYPE_COMPUTE)) {
		mqd_mem_obj = kzalloc(sizeof(struct kfd_mem_obj), GFP_KERNEL);
		if (!mqd_mem_obj)
			return NULL;
		...
	} else {
		retval = kfd_gtt_sa_allocate(kfd, sizeof(struct v9_mqd),
				&mqd_mem_obj);
	}

	if (retval) {
		kfree(mqd_mem_obj);
		return NULL;
	}

The "kfd_gtt_sa_allocate()" function allocates mqd_mem_obj and if
an error occurs internally frees it, without setting it to NULL;
retval is true and we kfree a memory that has already been freed.

The real fix is to move the "if (retval)" inside the if. It would
basically be:

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
index fdbfd725841ff..31d47d687bd62 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
@@ -115,18 +115,20 @@ static struct kfd_mem_obj *allocate_mqd(struct kfd_dev *kfd,
                        &(mqd_mem_obj->gtt_mem),
                        &(mqd_mem_obj->gpu_addr),
                        (void *)&(mqd_mem_obj->cpu_ptr), true);
+
+               if (retval) {
+                       kfree(mqd_mem_obj);
+                       return NULL;
+               }
+
        } else {
                retval = kfd_gtt_sa_allocate(kfd, sizeof(struct v9_mqd),
                                &mqd_mem_obj);
-       }
-
-       if (retval) {
-               kfree(mqd_mem_obj);
-               return NULL;
+               if (retval)
+                       return NULL;
        }
 
        return mqd_mem_obj;
-
 }

Maybe with some clever refactoring we could reduce some code
duplication.

Daniil will you look into this?

Andi
