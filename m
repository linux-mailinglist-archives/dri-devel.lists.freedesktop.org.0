Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D247DCF54
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 15:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A778910E51E;
	Tue, 31 Oct 2023 14:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B59B10E51A;
 Tue, 31 Oct 2023 14:39:36 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1cc2b8deb23so5863585ad.1; 
 Tue, 31 Oct 2023 07:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698763175; x=1699367975; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kjZxw10fAU3NmXMNfuWyvxVE4h8G74zXwe6kt+CGm4c=;
 b=KtA2H8vdh6+NB9A56Se8OI/O2vXRKv3ygRKs6Aw9CZ4m+ISuIQZGUVLFg0snIQwZrK
 1TXr8kaUPW8RsqkU/1CJgFiYp47xw8m31AbrQHnhh/gflfmaH8P44Bh0HAbCWweY0tq/
 vxdoaR4AUPcthpnLw+SchnGXYSOyZm13HoSV/qIjdgDbkO+NgY+AgclnSaNN4vldvCRK
 2uHU0PWMVzRdYSx6b8OE4HdQv9UoWB0/MOGxjh9vFF7IzGQciUxj4NURPSbtLhWUAJdL
 IvNR6zK84dL5eyXBu2FZiW4ySkWiS2vXIcsejxJtYStLbmy9PFT5HdxEWF64w+zX13DE
 o3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698763175; x=1699367975;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kjZxw10fAU3NmXMNfuWyvxVE4h8G74zXwe6kt+CGm4c=;
 b=doIFAO7z43gzVJ2J/+pNggYKzzvmJZ0y5tQz4pugWjXlkMgd/ALTMbWlgvuodlXhSg
 jWi8V7etBdvfteLq4/pedWSGNQLypkqeXxnj5xeoZqUrtoHUyjDIJHvptIvvAaCuVTG8
 K+SiGXOHic8sdE9bytkAv0MhP9oe5N4tJt/LuL4b8nURLgSiXk4BFCPVEZe8cMhKUI0p
 PplBr+9EUVpkeoE6CbFpyU2abPhtPXeB+iLu1Yu0Z0qo8RAR7Z04hE1z1eTT24aYvcYv
 MHW7ihQhOAo+uOW35TabLZCU+MGSmDjvADJ9qoJq6NNq0k/IT/a7k0/HE10VP4v6LMEa
 wl8Q==
X-Gm-Message-State: AOJu0YxKyY6L9i2jbNeujoqCbLKhidd3E8nRrvLS2KAc214zVEtg4Wvk
 lXk24Sl7f2VPtgHf+YvOIfA=
X-Google-Smtp-Source: AGHT+IHWEPNaBjGOU+YY+CXdewp8+Vq9U/KnpJoojPPGL/WnMWV0TDR6U9dgKRpGyIMWMb82wXcQeQ==
X-Received: by 2002:a17:903:32d2:b0:1cc:32c6:e5fa with SMTP id
 i18-20020a17090332d200b001cc32c6e5famr9269300plr.6.1698763175384; 
 Tue, 31 Oct 2023 07:39:35 -0700 (PDT)
Received: from smtpclient.apple (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 w15-20020a170902e88f00b001cc20dd8825sm1398165plg.213.2023.10.31.07.39.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Oct 2023 07:39:34 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH 2/6] drm/amdgpu: Separate eviction from VM status.
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
In-Reply-To: <e2349c50-5d15-4e76-b63a-904abc4f6802@amd.com>
Date: Tue, 31 Oct 2023 23:39:21 +0900
Content-Transfer-Encoding: quoted-printable
Message-Id: <011E5998-09CB-4AE4-AEB8-1619BF005B64@gmail.com>
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
 <20231031134059.171277-3-ishitatsuyuki@gmail.com>
 <e2349c50-5d15-4e76-b63a-904abc4f6802@amd.com>
To: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On Oct 31, 2023, at 22:55, Christian K=C3=B6nig =
<christian.koenig@amd.com> wrote:
>=20
> Am 31.10.23 um 14:40 schrieb Tatsuyuki Ishi:
>> In short, eviction never really belonged to the vm_status state =
machine.
>=20
> I strongly disagree to that.
>=20
>> Even when evicted, the BO could belong to either the moved or done =
state.
>> The "evicted" state needed to handle both cases, causing greater =
confusion.
>>=20
>> Additionally, there were inconsistencies in the definition of an =
evicted
>> BO. Some places are based on the `evict` parameter passed from the =
TTM move
>> callback, while the others were updated based on whether the BO got =
its
>> optimal placement. The second is more accurate for our use case. With =
this
>> refactor, the evicted state is solely determined by the second rule.
>=20
> That strongly sounds like you don't understand what the evicted state =
it good for.
>=20
> The evicted state is for page directories, page tables and per VM BOs =
which needs to move around before doing the next CS.
>=20
> Please further explain what you try to do here.

This is mainly an attempt to address inconsistency in the definition of =
=E2=80=9Ceviction=E2=80=9D. The TTM move callback sets eviction when =
eviction happens through ttm_bo_evict. This is however not the only way =
a BO might end up outside its preferred domains.

amdgpu_vm_bo_update later updates the eviction state based on whether =
the BO is in its preferred domains. In my understanding this includes =
all cases where the BO is evicted through ttm_bo_evict. Therefore we =
should apply this definition right from the move callback, not only =
after amdgpu_vm_bo_update has been called at least once.

Tatsuyuki.

>=20
> Regards,
> Christian.
>=20
>>=20
>> Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c    | 67 =
+++++++++--------------
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h    |  1 +
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c |  1 +
>>  3 files changed, 29 insertions(+), 40 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> index 7b9762f1cddd..dd6f72e2a1d6 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> @@ -174,19 +174,23 @@ int amdgpu_vm_set_pasid(struct amdgpu_device =
*adev, struct amdgpu_vm *vm,
>>   * State for PDs/PTs and per VM BOs which are not at the location =
they should
>>   * be.
>>   */
>> -static void amdgpu_vm_bo_evicted(struct amdgpu_vm_bo_base *vm_bo)
>> +static void amdgpu_vm_bo_set_evicted(struct amdgpu_vm_bo_base =
*vm_bo, bool evicted)
>>  {
>>  	struct amdgpu_vm *vm =3D vm_bo->vm;
>>  	struct amdgpu_bo *bo =3D vm_bo->bo;
>>  -	vm_bo->moved =3D true;
>>  	spin_lock(&vm_bo->vm->status_lock);
>> -	if (bo->tbo.type =3D=3D ttm_bo_type_kernel)
>> -		list_move(&vm_bo->vm_status, &vm->evicted);
>> -	else
>> -		list_move_tail(&vm_bo->vm_status, &vm->evicted);
>> +	if (evicted && bo->tbo.base.resv =3D=3D =
vm->root.bo->tbo.base.resv) {
>> +		if (bo->tbo.type =3D=3D ttm_bo_type_kernel)
>> +			list_move(&vm_bo->eviction_status, =
&vm->evicted);
>> +		else
>> +			list_move_tail(&vm_bo->eviction_status, =
&vm->evicted);
>> +	} else {
>> +		list_del_init(&vm_bo->eviction_status);
>> +	}
>>  	spin_unlock(&vm_bo->vm->status_lock);
>>  }
>> +
>>  /**
>>   * amdgpu_vm_bo_moved - vm_bo is moved
>>   *
>> @@ -310,6 +314,7 @@ void amdgpu_vm_bo_base_init(struct =
amdgpu_vm_bo_base *base,
>>  	base->bo =3D bo;
>>  	base->next =3D NULL;
>>  	INIT_LIST_HEAD(&base->vm_status);
>> +	INIT_LIST_HEAD(&base->eviction_status);
>>    	if (!bo)
>>  		return;
>> @@ -336,7 +341,7 @@ void amdgpu_vm_bo_base_init(struct =
amdgpu_vm_bo_base *base,
>>  	 * is currently evicted. add the bo to the evicted list to make =
sure it
>>  	 * is validated on next vm use to avoid fault.
>>  	 * */
>> -	amdgpu_vm_bo_evicted(base);
>> +	amdgpu_vm_bo_set_evicted(base, true);
>>  }
>>    /**
>> @@ -460,7 +465,7 @@ int amdgpu_vm_validate_pt_bos(struct =
amdgpu_device *adev, struct amdgpu_vm *vm,
>>  	while (!list_empty(&vm->evicted)) {
>>  		bo_base =3D list_first_entry(&vm->evicted,
>>  					   struct amdgpu_vm_bo_base,
>> -					   vm_status);
>> +					   eviction_status);
>>  		spin_unlock(&vm->status_lock);
>>    		bo =3D bo_base->bo;
>> @@ -1034,7 +1039,7 @@ void amdgpu_vm_get_memory(struct amdgpu_vm *vm,
>>  	list_for_each_entry_safe(bo_va, tmp, &vm->idle, base.vm_status)
>>  		amdgpu_vm_bo_get_memory(bo_va, stats);
>>  -	list_for_each_entry_safe(bo_va, tmp, &vm->evicted, =
base.vm_status)
>> +	list_for_each_entry_safe(bo_va, tmp, &vm->evicted, =
base.eviction_status)
>>  		amdgpu_vm_bo_get_memory(bo_va, stats);
>>    	list_for_each_entry_safe(bo_va, tmp, &vm->relocated, =
base.vm_status)
>> @@ -1153,21 +1158,10 @@ int amdgpu_vm_bo_update(struct amdgpu_device =
*adev, struct amdgpu_bo_va *bo_va,
>>  			return r;
>>  	}
>>  -	/* If the BO is not in its preferred location add it back to
>> -	 * the evicted list so that it gets validated again on the
>> -	 * next command submission.
>> -	 */
>> -	if (bo && bo->tbo.base.resv =3D=3D vm->root.bo->tbo.base.resv) {
>> -		uint32_t mem_type =3D bo->tbo.resource->mem_type;
>> -
>> -		if (!(bo->preferred_domains &
>> -		      amdgpu_mem_type_to_domain(mem_type)))
>> -			amdgpu_vm_bo_evicted(&bo_va->base);
>> -		else
>> -			amdgpu_vm_bo_idle(&bo_va->base);
>> -	} else {
>> +	if (bo && bo->tbo.base.resv =3D=3D vm->root.bo->tbo.base.resv)
>> +		amdgpu_vm_bo_idle(&bo_va->base);
>> +	else
>>  		amdgpu_vm_bo_done(&bo_va->base);
>> -	}
>>    	list_splice_init(&bo_va->invalids, &bo_va->valids);
>>  	bo_va->cleared =3D clear;
>> @@ -1883,6 +1877,7 @@ void amdgpu_vm_bo_del(struct amdgpu_device =
*adev,
>>    	spin_lock(&vm->status_lock);
>>  	list_del(&bo_va->base.vm_status);
>> +	list_del(&bo_va->base.eviction_status);
>>  	spin_unlock(&vm->status_lock);
>>    	list_for_each_entry_safe(mapping, next, &bo_va->valids, list) {
>> @@ -1959,13 +1954,18 @@ void amdgpu_vm_bo_invalidate(struct =
amdgpu_device *adev,
>>  	if (bo->parent && (amdgpu_bo_shadowed(bo->parent) =3D=3D bo))
>>  		bo =3D bo->parent;
>>  +	/* If the BO is not in its preferred location add it back to
>> +	 * the evicted list so that it gets validated again on the
>> +	 * next command submission.
>> +	 */
>> +	uint32_t mem_type =3D bo->tbo.resource->mem_type;
>> +	bool suboptimal =3D !(bo->preferred_domains &
>> +			 amdgpu_mem_type_to_domain(mem_type));
>> +
>>  	for (bo_base =3D bo->vm_bo; bo_base; bo_base =3D bo_base->next) =
{
>>  		struct amdgpu_vm *vm =3D bo_base->vm;
>>  -		if (evicted && bo->tbo.base.resv =3D=3D =
vm->root.bo->tbo.base.resv) {
>> -			amdgpu_vm_bo_evicted(bo_base);
>> -			continue;
>> -		}
>> +		amdgpu_vm_bo_set_evicted(bo_base, suboptimal);
>>    		if (bo_base->moved)
>>  			continue;
>> @@ -2648,13 +2648,11 @@ void amdgpu_debugfs_vm_bo_info(struct =
amdgpu_vm *vm, struct seq_file *m)
>>  {
>>  	struct amdgpu_bo_va *bo_va, *tmp;
>>  	u64 total_idle =3D 0;
>> -	u64 total_evicted =3D 0;
>>  	u64 total_relocated =3D 0;
>>  	u64 total_moved =3D 0;
>>  	u64 total_invalidated =3D 0;
>>  	u64 total_done =3D 0;
>>  	unsigned int total_idle_objs =3D 0;
>> -	unsigned int total_evicted_objs =3D 0;
>>  	unsigned int total_relocated_objs =3D 0;
>>  	unsigned int total_moved_objs =3D 0;
>>  	unsigned int total_invalidated_objs =3D 0;
>> @@ -2671,15 +2669,6 @@ void amdgpu_debugfs_vm_bo_info(struct =
amdgpu_vm *vm, struct seq_file *m)
>>  	total_idle_objs =3D id;
>>  	id =3D 0;
>>  -	seq_puts(m, "\tEvicted BOs:\n");
>> -	list_for_each_entry_safe(bo_va, tmp, &vm->evicted, =
base.vm_status) {
>> -		if (!bo_va->base.bo)
>> -			continue;
>> -		total_evicted +=3D amdgpu_bo_print_info(id++, =
bo_va->base.bo, m);
>> -	}
>> -	total_evicted_objs =3D id;
>> -	id =3D 0;
>> -
>>  	seq_puts(m, "\tRelocated BOs:\n");
>>  	list_for_each_entry_safe(bo_va, tmp, &vm->relocated, =
base.vm_status) {
>>  		if (!bo_va->base.bo)
>> @@ -2718,8 +2707,6 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm =
*vm, struct seq_file *m)
>>    	seq_printf(m, "\tTotal idle size:        %12lld\tobjs:\t%d\n", =
total_idle,
>>  		   total_idle_objs);
>> -	seq_printf(m, "\tTotal evicted size:     %12lld\tobjs:\t%d\n", =
total_evicted,
>> -		   total_evicted_objs);
>>  	seq_printf(m, "\tTotal relocated size:   %12lld\tobjs:\t%d\n", =
total_relocated,
>>  		   total_relocated_objs);
>>  	seq_printf(m, "\tTotal moved size:       %12lld\tobjs:\t%d\n", =
total_moved,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> index 204ab13184ed..d9ab97eabda9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> @@ -156,6 +156,7 @@ struct amdgpu_vm_bo_base {
>>    	/* protected by spinlock */
>>  	struct list_head		vm_status;
>> +	struct list_head		eviction_status;
>>    	/* protected by the BO being reserved */
>>  	bool				moved;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
>> index 96d601e209b8..f78f4040f466 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
>> @@ -652,6 +652,7 @@ static void amdgpu_vm_pt_free(struct =
amdgpu_vm_bo_base *entry)
>>    	spin_lock(&entry->vm->status_lock);
>>  	list_del(&entry->vm_status);
>> +	list_del(&entry->eviction_status);
>>  	spin_unlock(&entry->vm->status_lock);
>>  	amdgpu_bo_unref(&entry->bo);
>>  }
>=20

