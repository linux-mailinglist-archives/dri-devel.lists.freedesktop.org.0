Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7182F4ED54A
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 10:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0A710F5F0;
	Thu, 31 Mar 2022 08:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A283910EE54;
 Thu, 31 Mar 2022 08:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648714530; x=1680250530;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mMZCj5AcWureUxhwf6dtEqTJa8BwCyQIOHoujBCAYIs=;
 b=N7DlitQiUSElbKMmAni5AbpihqaaRyjJRS4KRDdt/kv9PlJF3Zu6JgP/
 U2hLbIle+raN03GdUCVV0O659doq0DKI5tEY/ntOf87YyS/yQor2+RiWK
 Vv4HKeqGASvLfcEWBKHqF3UI6TC7tm4iK6CUSYZoEBODLr4Zqki6HJG6L
 MSSPuhXLJzBmyJF+v+fT5HVhh1d7TCYh9+aH8fRrIW2d6TI4863kkhI08
 J0RaHf04YzxKOP87XcYzrEUfCIdQ4pTqjx7PFUEwCz+in7J1u0CePvDvm
 F+R2a+YyqwL2OSeZ6D1ocI/VjbyjhuFETKGlfWtjgLNLiYwMbjOAxeKcL Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259729770"
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; d="scan'208";a="259729770"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 01:15:30 -0700
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; d="scan'208";a="522239448"
Received: from vvendra-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.255.230.104])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 01:15:29 -0700
Date: Thu, 31 Mar 2022 01:15:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: drm-tip compile break
Message-ID: <20220331081529.4gsfd6diznsjzfay@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <87o81n9ikg.wl-ashutosh.dixit@intel.com>
 <d3d90c7f-b3a9-e81c-c97e-b40ee3ee5baf@amd.com>
 <40ccaa09-42d3-37c0-65cb-5b5eabe8d706@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40ccaa09-42d3-37c0-65cb-5b5eabe8d706@amd.com>
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
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 31, 2022 at 09:35:50AM +0200, Christian König wrote:
>Well the fix is trivial, but somehow rebuilding drm-tip always fails 
>for me while merging drm-intel-next.
>
>I probably have somehow messed up reverting the conflict resolution. Ideas?

It looks like the error is in the wrong conflict resolution in
629041de3a0c M─┐ Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip 

you'd need to redo the merge (-i) after telling git
rerere to forget the previous conflict resolution.

https://drm.pages.freedesktop.org/maintainer-tools/drm-tip.html#removing-a-wrong-conflict-resolution

it's also useful to use dim -i, to make sure we can build on each merge
afterwards.

AFAICS the revert would be on 141577c6d0bd ("2022y-03m-29d-09h-01m-04s UTC: drm-tip rerere cache update")

taking a stab on it, should be like below. It even builds,
but I have no confidence to commit it.

Lucas De Marchi

-------
diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index dd78402e3cb0,68494b959116..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@@ -200,17 -187,20 +187,17 @@@ static void amdgpu_gtt_mgr_del(struct t
    *
    * Re-init the gart for each known BO in the GTT.
    */
  -int amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr)
  +void amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr)
   {
- 	struct amdgpu_gtt_node *node;
+ 	struct ttm_range_mgr_node *node;
   	struct drm_mm_node *mm_node;
   	struct amdgpu_device *adev;
  -	int r = 0;
   
   	adev = container_of(mgr, typeof(*adev), mman.gtt_mgr);
   	spin_lock(&mgr->lock);
   	drm_mm_for_each_node(mm_node, &mgr->mm) {
- 		node = container_of(mm_node, typeof(*node), base.mm_nodes[0]);
- 		amdgpu_ttm_recover_gart(node->tbo);
+ 		node = container_of(mm_node, typeof(*node), mm_nodes[0]);
  -		r = amdgpu_ttm_recover_gart(node->base.bo);
  -		if (r)
  -			break;
++		amdgpu_ttm_recover_gart(node->base.bo);
   	}
   	spin_unlock(&mgr->lock);
   
diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index fc4563cf2828,28f5e8b21a99..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@@ -375,9 -375,7 +375,9 @@@ static void amdgpu_vm_bo_base_init(stru
   	if (bo->tbo.base.resv != vm->root.bo->tbo.base.resv)
   		return;
   
  +	dma_resv_assert_held(vm->root.bo->tbo.base.resv);
  +
- 	vm->bulk_moveable = false;
+ 	ttm_bo_set_bulk_move(&bo->tbo, &vm->lru_bulk_move);
   	if (bo->tbo.type == ttm_bo_type_kernel && bo->parent)
   		amdgpu_vm_bo_relocated(base);
   	else
@@@ -2660,12 -2597,9 +2606,12 @@@ void amdgpu_vm_bo_del(struct amdgpu_dev
   	struct amdgpu_vm *vm = bo_va->base.vm;
   	struct amdgpu_vm_bo_base **base;
   
  +	dma_resv_assert_held(vm->root.bo->tbo.base.resv);
  +
   	if (bo) {
  +		dma_resv_assert_held(bo->tbo.base.resv);
   		if (bo->tbo.base.resv == vm->root.bo->tbo.base.resv)
- 			vm->bulk_moveable = false;
+ 			ttm_bo_set_bulk_move(&bo->tbo, NULL);
   
   		for (base = &bo_va->base.bo->vm_bo; *base;
   		     base = &(*base)->next) {


>
>Christian.
>
>Am 31.03.22 um 08:28 schrieb Christian König:
>>I'm going to take a look, but need to figure out how to find the 
>>broken merge
>>
>>Christian.
>>
>>Am 31.03.22 um 00:33 schrieb Dixit, Ashutosh:
>>>Is anyone looking into fixing this:
>>>
>>>drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c: In function 
>>>‘amdgpu_gtt_mgr_recover’:
>>>drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:200:31: error: ‘struct 
>>>ttm_range_mgr_node’ has no member named ‘tbo’
>>>    amdgpu_ttm_recover_gart(node->tbo);
>>>                                ^~
>>>make[4]: *** [scripts/Makefile.build:288: 
>>>drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.o] Error 1
>>>
>>>Thanks.
>>
>
