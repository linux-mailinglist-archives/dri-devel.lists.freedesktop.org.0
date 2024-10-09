Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA9F996187
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 09:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C706810E66E;
	Wed,  9 Oct 2024 07:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="YL33/5vD";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="OEjMf8H8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5084510E66E;
 Wed,  9 Oct 2024 07:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1728460324;
 bh=JzWQqMib1g2ISJm3AwfMGWP
 vrMwjVdduKXKG1mUHP2Y=; b=YL33/5vDSHC64JYWFTE7ToTpNdN8pp1n9rhNIHgj5TLKNrQAge
 V1E8f0ue9wTmIEcS3qU0iswym2YnfaOcAmjoHZxpd7L+qmNokVUYsx8mhJuB1V3IDxlvlgSJRtr
 rs58EJahuIa/ck7uLOpPUDI3nRqz6HelVXO58OTo4HZ5g5UcGbWLG/ea8ULUWo9wDynemrva30T
 ZOVNmtO+Ocn83SLnwGq2pBAHU8Nyf++4Zs7gJ+cLhVVRoH97HAxoSrFAwi0QN1VnUEpLp1sgZHk
 1IjiZOfAVdrBIHNgpqCgXadKn3Lyb1l5TMUAyPXLsHW4+vohnYuxe8B6lNI0Ou1KHjg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1728460324; bh=JzWQqMib1g2ISJm3AwfMGWP
 vrMwjVdduKXKG1mUHP2Y=; b=OEjMf8H8BJJfUxM0yVCU6B/HB+bdIoaDqWsjJjzoMC177D11GL
 026WezJ35D/RfG8Iq5pRGsQ4Jpl1lhFyvFDQ==;
Content-Type: multipart/mixed; boundary="------------VdFXX3Lrul4sBT77C60E6El0"
Message-ID: <dcb37f0f-ea8e-4c22-bc7c-f9b9cf7f7f75@damsy.net>
Date: Wed, 9 Oct 2024 09:52:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] drm/amdgpu: use drm_file::name in
 task_info::process_desc
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dmitry.osipenko@collabora.com, jani.nikula@linux.intel.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 alexander.deucher@amd.com
References: <20241003124506.470931-1-pierre-eric.pelloux-prayer@amd.com>
 <20241003124506.470931-7-pierre-eric.pelloux-prayer@amd.com>
 <54f65e13-79db-4800-9d96-8943e9397822@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <54f65e13-79db-4800-9d96-8943e9397822@amd.com>
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

This is a multi-part message in MIME format.
--------------VdFXX3Lrul4sBT77C60E6El0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/10/2024 à 10:24, Christian König a écrit :
> Am 03.10.24 um 14:43 schrieb Pierre-Eric Pelloux-Prayer:
>> If a drm_file name is set append it to the process name.
>>
>> This information is useful with the virtio/native-context driver: this
>> allows the guest applications identifier to visible in amdgpu's output.
>>
>> The output in amdgpu_vm_info/amdgpu_gem_info looks like this:
>>     pid:12255    Process:glxgears/test-set-fd-name ----------
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  1 +
>>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  3 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 34 ++++++++++++++-----
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  2 +-
>>   drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  3 ++
>>   6 files changed, 34 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>> index f9d119448442..ad909173e419 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>> @@ -299,6 +299,7 @@ int amdgpu_amdkfd_gpuvm_set_vm_pasid(struct amdgpu_device *adev,
>>                        struct amdgpu_vm *avm, u32 pasid);
>>   int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
>>                       struct amdgpu_vm *avm,
>> +                    struct drm_file *filp,
>>                       void **process_info,
>>                       struct dma_fence **ef);
>>   void amdgpu_amdkfd_gpuvm_release_process_vm(struct amdgpu_device *adev,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/ 
>> amdgpu_amdkfd_gpuvm.c
>> index 6d5fd371d5ce..172882af6705 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> @@ -1558,6 +1558,7 @@ int amdgpu_amdkfd_gpuvm_set_vm_pasid(struct amdgpu_device *adev,
>>   int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
>>                          struct amdgpu_vm *avm,
>> +                       struct drm_file *filp,
>>                          void **process_info,
>>                          struct dma_fence **ef)
>>   {
>> @@ -1577,7 +1578,7 @@ int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
>>       if (ret)
>>           return ret;
>> -    amdgpu_vm_set_task_info(avm);
>> +    amdgpu_vm_set_task_info(avm, filp);
>>       return 0;
>>   }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> index 891128ecee6d..5d43e24906d2 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> @@ -1178,7 +1178,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>>       }
>>       /* Use this opportunity to fill in task info for the vm */
>> -    amdgpu_vm_set_task_info(vm);
>> +    amdgpu_vm_set_task_info(vm, p->filp);
>>       if (adev->debug_vm) {
>>           /* Invalidate all BOs to test for userspace bugs */
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> index 561ff832930e..920660c23e0f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> @@ -2355,24 +2355,41 @@ amdgpu_vm_get_task_info_pasid(struct amdgpu_device *adev, u32 pasid)
>>               amdgpu_vm_get_vm_from_pasid(adev, pasid));
>>   }
>> -static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
>> +static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm, struct drm_file *filp)
> 
> It would be nice to pass in only the const char *client_name here and lock/unlock the mutex outside 
> of the VM code.
> 
> Only nice to have, but I would rather like to keep the drm_file internals outside of the VM code.

Fixed in the attached patch.

Pierre-Eric

> 
> Regards,
> Christian.
> 
>>   {
>>       char process_name[TASK_COMM_LEN];
>> -    size_t pname_len;
>> +    size_t pname_len, pdesc_len;
>>       get_task_comm(process_name, current->group_leader);
>> -    pname_len = strlen(process_name);
>> +    pdesc_len = pname_len = strlen(process_name);
>> +
>> +    mutex_lock(&filp->client_name_lock);
>> +    if (filp->client_name)
>> +        pdesc_len += strlen(filp->client_name) + 1;
>> +
>> +    /* Add 1 for the NUL char. */
>> +    pdesc_len += 1;
>>       vm->task_info = kzalloc(
>> -        struct_size(vm->task_info, process_desc, pname_len + 1),
>> +        struct_size(vm->task_info, process_desc, pdesc_len),
>>           GFP_KERNEL);
>> -    if (!vm->task_info)
>> +    if (!vm->task_info) {
>> +        mutex_unlock(&filp->client_name_lock);
>>           return -ENOMEM;
>> +    }
>>       /* Set process attributes now. */
>>       vm->task_info->tgid = current->group_leader->pid;
>> -    strscpy(vm->task_info->process_desc, process_name, pname_len + 1);
>> +    strscpy(vm->task_info->process_desc, process_name, pdesc_len);
>> +
>> +    if (filp->client_name) {
>> +        /* Append the drm-client-name. */
>> +        vm->task_info->process_desc[pname_len] = '/';
>> +        strscpy(&vm->task_info->process_desc[pname_len + 1],
>> +            filp->client_name, pdesc_len - (pname_len + 1));
>> +    }
>> +    mutex_unlock(&filp->client_name_lock);
>>       kref_init(&vm->task_info->refcount);
>>       return 0;
>> @@ -2382,11 +2399,12 @@ static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
>>    * amdgpu_vm_set_task_info - Sets VMs task info.
>>    *
>>    * @vm: vm for which to set the info
>> + * @filp: drm_file instance
>>    */
>> -void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>> +void amdgpu_vm_set_task_info(struct amdgpu_vm *vm, struct drm_file *filp)
>>   {
>>       if (!vm->task_info) {
>> -        if (amdgpu_vm_create_task_info(vm))
>> +        if (amdgpu_vm_create_task_info(vm, filp))
>>               return;
>>       } else if (vm->task_info->pid == current->pid) {
>>           return;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> index 44da250217be..8df3dece54c2 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> @@ -561,7 +561,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
>>                   u32 vmid, u32 node_id, uint64_t addr, uint64_t ts,
>>                   bool write_fault);
>> -void amdgpu_vm_set_task_info(struct amdgpu_vm *vm);
>> +void amdgpu_vm_set_task_info(struct amdgpu_vm *vm, struct drm_file *filp);
>>   void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
>>                   struct amdgpu_vm *vm);
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>> index a902950cc060..e473fe433d3f 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>> @@ -1654,6 +1654,7 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
>>                      struct file *drm_file)
>>   {
>>       struct amdgpu_fpriv *drv_priv;
>> +    struct drm_file *filp;
>>       struct amdgpu_vm *avm;
>>       struct kfd_process *p;
>>       struct dma_fence *ef;
>> @@ -1673,8 +1674,10 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
>>       p = pdd->process;
>>       dev = pdd->dev;
>> +    filp = drm_file->private_data;
>>       ret = amdgpu_amdkfd_gpuvm_acquire_process_vm(dev->adev, avm,
>> +                             filp,
>>                                &p->kgd_process_info,
>>                                &ef);
>>       if (ret) {

--------------VdFXX3Lrul4sBT77C60E6El0
Content-Type: text/x-patch; charset=UTF-8;
 name="0006-drm-amdgpu-use-drm_file-name-in-task_info-process_de.patch"
Content-Disposition: attachment;
 filename*0="0006-drm-amdgpu-use-drm_file-name-in-task_info-process_de.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAzOGQ0MGQyNWQyNGY5NGQyZTViYjhiMjk1Nzg5ZmIxNDY3MTk5M2UwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBQaWVycmUtRXJpYyBQZWxsb3V4LVByYXllciA8cGll
cnJlLWVyaWMucGVsbG91eC1wcmF5ZXJAYW1kLmNvbT4KRGF0ZTogRnJpLCAyMCBTZXAgMjAy
NCAxMTowNjo0OCArMDIwMApTdWJqZWN0OiBbUEFUQ0ggNi82XSBkcm0vYW1kZ3B1OiB1c2Ug
ZHJtX2ZpbGU6Om5hbWUgaW4gdGFza19pbmZvOjpwcm9jZXNzX2Rlc2MKTUlNRS1WZXJzaW9u
OiAxLjAKQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQt
VHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKCklmIGEgZHJtX2ZpbGUgbmFtZSBpcyBzZXQgYXBw
ZW5kIGl0IHRvIHRoZSBwcm9jZXNzIG5hbWUuCgpUaGlzIGluZm9ybWF0aW9uIGlzIHVzZWZ1
bCB3aXRoIHRoZSB2aXJ0aW8vbmF0aXZlLWNvbnRleHQgZHJpdmVyOiB0aGlzCmFsbG93cyB0
aGUgZ3Vlc3QgYXBwbGljYXRpb25zIGlkZW50aWZpZXIgdG8gdmlzaWJsZSBpbiBhbWRncHUn
cyBvdXRwdXQuCgpUaGUgb3V0cHV0IGluIGFtZGdwdV92bV9pbmZvL2FtZGdwdV9nZW1faW5m
byBsb29rcyBsaWtlIHRoaXM6CiAgIHBpZDoxMjI1NQlQcm9jZXNzOmdseGdlYXJzL3Rlc3Qt
c2V0LWZkLW5hbWUgLS0tLS0tLS0tLQoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogUGllcnJlLUVyaWMg
UGVsbG91eC1QcmF5ZXIgPHBpZXJyZS1lcmljLnBlbGxvdXgtcHJheWVyQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oICAgIHwgIDEg
KwogLi4uL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgIHwgIDUg
KysrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgICAgICAgIHwg
IDQgKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyAgICAgICAg
fCAyOSArKysrKysrKysrKysrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdm0uaCAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX3Byb2Nlc3MuYyAgICAgIHwgIDMgKysKIDYgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0
aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2FtZGtmZC5oCmluZGV4IGY5ZDExOTQ0ODQ0Mi4uYWQ5MDkxNzNlNDE5IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oCkBAIC0y
OTksNiArMjk5LDcgQEAgaW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1fc2V0X3ZtX3Bhc2lkKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJCSAgICAgc3RydWN0IGFtZGdwdV92bSAq
YXZtLCB1MzIgcGFzaWQpOwogaW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1fYWNxdWlyZV9wcm9j
ZXNzX3ZtKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJCQlzdHJ1Y3QgYW1kZ3B1
X3ZtICphdm0sCisJCQkJCXN0cnVjdCBkcm1fZmlsZSAqZmlscCwKIAkJCQkJdm9pZCAqKnBy
b2Nlc3NfaW5mbywKIAkJCQkJc3RydWN0IGRtYV9mZW5jZSAqKmVmKTsKIHZvaWQgYW1kZ3B1
X2FtZGtmZF9ncHV2bV9yZWxlYXNlX3Byb2Nlc3Nfdm0oc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
YW1ka2ZkX2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1k
a2ZkX2dwdXZtLmMKaW5kZXggY2U1Y2EzMDRkYmE5Li5hMjQxZTJlOTZjNmMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMK
QEAgLTE1NTIsNiArMTU1Miw3IEBAIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX3NldF92bV9w
YXNpZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAogaW50IGFtZGdwdV9hbWRrZmRf
Z3B1dm1fYWNxdWlyZV9wcm9jZXNzX3ZtKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAog
CQkJCQkgICBzdHJ1Y3QgYW1kZ3B1X3ZtICphdm0sCisJCQkJCSAgIHN0cnVjdCBkcm1fZmls
ZSAqZmlscCwKIAkJCQkJICAgdm9pZCAqKnByb2Nlc3NfaW5mbywKIAkJCQkJICAgc3RydWN0
IGRtYV9mZW5jZSAqKmVmKQogewpAQCAtMTU3MSw3ICsxNTcyLDkgQEAgaW50IGFtZGdwdV9h
bWRrZmRfZ3B1dm1fYWNxdWlyZV9wcm9jZXNzX3ZtKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LAogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKLQlhbWRncHVfdm1fc2V0X3Rhc2tf
aW5mbyhhdm0pOworCW11dGV4X2xvY2soJmZpbHAtPmNsaWVudF9uYW1lX2xvY2spOworCWFt
ZGdwdV92bV9zZXRfdGFza19pbmZvKGF2bSwgZmlscC0+Y2xpZW50X25hbWUpOworCW11dGV4
X3VubG9jaygmZmlscC0+Y2xpZW50X25hbWVfbG9jayk7CiAKIAlyZXR1cm4gMDsKIH0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMKaW5kZXggODkxMTI4ZWNlZTZk
Li4wNGYyNWE1YTYzZjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9jcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9j
cy5jCkBAIC0xMTc4LDcgKzExNzgsOSBAQCBzdGF0aWMgaW50IGFtZGdwdV9jc192bV9oYW5k
bGluZyhzdHJ1Y3QgYW1kZ3B1X2NzX3BhcnNlciAqcCkKIAl9CiAKIAkvKiBVc2UgdGhpcyBv
cHBvcnR1bml0eSB0byBmaWxsIGluIHRhc2sgaW5mbyBmb3IgdGhlIHZtICovCi0JYW1kZ3B1
X3ZtX3NldF90YXNrX2luZm8odm0pOworCW11dGV4X2xvY2soJnAtPmZpbHAtPmNsaWVudF9u
YW1lX2xvY2spOworCWFtZGdwdV92bV9zZXRfdGFza19pbmZvKHZtLCBwLT5maWxwLT5jbGll
bnRfbmFtZSk7CisJbXV0ZXhfdW5sb2NrKCZwLT5maWxwLT5jbGllbnRfbmFtZV9sb2NrKTsK
IAogCWlmIChhZGV2LT5kZWJ1Z192bSkgewogCQkvKiBJbnZhbGlkYXRlIGFsbCBCT3MgdG8g
dGVzdCBmb3IgdXNlcnNwYWNlIGJ1Z3MgKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3ZtLmMKaW5kZXggYmUxNDk5Nzg0NDdkLi42MzYzYWQ3NmQyNmYgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCkBAIC0yMzcxLDE2ICsyMzcxLDIz
IEBAIGFtZGdwdV92bV9nZXRfdGFza19pbmZvX3Bhc2lkKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LCB1MzIgcGFzaWQpCiAJCQlhbWRncHVfdm1fZ2V0X3ZtX2Zyb21fcGFzaWQoYWRl
diwgcGFzaWQpKTsKIH0KIAotc3RhdGljIGludCBhbWRncHVfdm1fY3JlYXRlX3Rhc2tfaW5m
byhzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSkKK3N0YXRpYyBpbnQgYW1kZ3B1X3ZtX2NyZWF0ZV90
YXNrX2luZm8oc3RydWN0IGFtZGdwdV92bSAqdm0sCisJCQkJICAgICAgY29uc3QgY2hhciAq
Y2xpZW50X25hbWUpCiB7CiAJY2hhciBwcm9jZXNzX25hbWVbVEFTS19DT01NX0xFTl07Ci0J
c2l6ZV90IHBuYW1lX2xlbjsKKwlzaXplX3QgcG5hbWVfbGVuLCBwZGVzY19sZW47CiAKIAln
ZXRfdGFza19jb21tKHByb2Nlc3NfbmFtZSwgY3VycmVudC0+Z3JvdXBfbGVhZGVyKTsKLQlw
bmFtZV9sZW4gPSBzdHJsZW4ocHJvY2Vzc19uYW1lKTsKKwlwZGVzY19sZW4gPSBwbmFtZV9s
ZW4gPSBzdHJsZW4ocHJvY2Vzc19uYW1lKTsKKworCWlmIChjbGllbnRfbmFtZSkKKwkJcGRl
c2NfbGVuICs9IHN0cmxlbihjbGllbnRfbmFtZSkgKyAxOworCisJLyogQWRkIDEgZm9yIHRo
ZSBOVUwgY2hhci4gKi8KKwlwZGVzY19sZW4gKz0gMTsKIAogCXZtLT50YXNrX2luZm8gPSBr
emFsbG9jKAotCQlzdHJ1Y3Rfc2l6ZSh2bS0+dGFza19pbmZvLCBwcm9jZXNzX2Rlc2MsIHBu
YW1lX2xlbiArIDEpLAorCQlzdHJ1Y3Rfc2l6ZSh2bS0+dGFza19pbmZvLCBwcm9jZXNzX2Rl
c2MsIHBkZXNjX2xlbiksCiAJCUdGUF9LRVJORUwpOwogCiAJaWYgKCF2bS0+dGFza19pbmZv
KQpAQCAtMjM4OCw3ICsyMzk1LDE0IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX2NyZWF0ZV90
YXNrX2luZm8oc3RydWN0IGFtZGdwdV92bSAqdm0pCiAKIAkvKiBTZXQgcHJvY2VzcyBhdHRy
aWJ1dGVzIG5vdy4gKi8KIAl2bS0+dGFza19pbmZvLT50Z2lkID0gY3VycmVudC0+Z3JvdXBf
bGVhZGVyLT5waWQ7Ci0Jc3Ryc2NweSh2bS0+dGFza19pbmZvLT5wcm9jZXNzX2Rlc2MsIHBy
b2Nlc3NfbmFtZSwgcG5hbWVfbGVuICsgMSk7CisJc3Ryc2NweSh2bS0+dGFza19pbmZvLT5w
cm9jZXNzX2Rlc2MsIHByb2Nlc3NfbmFtZSwgcGRlc2NfbGVuKTsKKworCWlmIChjbGllbnRf
bmFtZSkgeworCQkvKiBBcHBlbmQgdGhlIGRybS1jbGllbnQtbmFtZS4gKi8KKwkJdm0tPnRh
c2tfaW5mby0+cHJvY2Vzc19kZXNjW3BuYW1lX2xlbl0gPSAnLyc7CisJCXN0cnNjcHkoJnZt
LT50YXNrX2luZm8tPnByb2Nlc3NfZGVzY1twbmFtZV9sZW4gKyAxXSwKKwkJCWNsaWVudF9u
YW1lLCBwZGVzY19sZW4gLSAocG5hbWVfbGVuICsgMSkpOworCX0KIAogCWtyZWZfaW5pdCgm
dm0tPnRhc2tfaW5mby0+cmVmY291bnQpOwogCXJldHVybiAwOwpAQCAtMjM5OCwxMSArMjQx
MiwxMiBAQCBzdGF0aWMgaW50IGFtZGdwdV92bV9jcmVhdGVfdGFza19pbmZvKHN0cnVjdCBh
bWRncHVfdm0gKnZtKQogICogYW1kZ3B1X3ZtX3NldF90YXNrX2luZm8gLSBTZXRzIFZNcyB0
YXNrIGluZm8uCiAgKgogICogQHZtOiB2bSBmb3Igd2hpY2ggdG8gc2V0IHRoZSBpbmZvCisg
KiBAY2xpZW50X25hbWU6IG9wdGlvbmFsIGRlYnVnIG5hbWUgYXR0YWNoZWQKICAqLwotdm9p
ZCBhbWRncHVfdm1fc2V0X3Rhc2tfaW5mbyhzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSkKK3ZvaWQg
YW1kZ3B1X3ZtX3NldF90YXNrX2luZm8oc3RydWN0IGFtZGdwdV92bSAqdm0sIGNvbnN0IGNo
YXIgKmNsaWVudF9uYW1lKQogewogCWlmICghdm0tPnRhc2tfaW5mbykgewotCQlpZiAoYW1k
Z3B1X3ZtX2NyZWF0ZV90YXNrX2luZm8odm0pKQorCQlpZiAoYW1kZ3B1X3ZtX2NyZWF0ZV90
YXNrX2luZm8odm0sIGNsaWVudF9uYW1lKSkKIAkJCXJldHVybjsKIAl9IGVsc2UgaWYgKHZt
LT50YXNrX2luZm8tPnBpZCA9PSBjdXJyZW50LT5waWQpIHsKIAkJcmV0dXJuOwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmggYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaAppbmRleCA4MjIwNDY5YzA1YjMuLjEw
ZTEzMTViY2RjNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgK
QEAgLTU2Miw3ICs1NjIsNyBAQCBib29sIGFtZGdwdV92bV9oYW5kbGVfZmF1bHQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHUzMiBwYXNpZCwKIAkJCSAgICB1MzIgdm1pZCwgdTMy
IG5vZGVfaWQsIHVpbnQ2NF90IGFkZHIsIHVpbnQ2NF90IHRzLAogCQkJICAgIGJvb2wgd3Jp
dGVfZmF1bHQpOwogCi12b2lkIGFtZGdwdV92bV9zZXRfdGFza19pbmZvKHN0cnVjdCBhbWRn
cHVfdm0gKnZtKTsKK3ZvaWQgYW1kZ3B1X3ZtX3NldF90YXNrX2luZm8oc3RydWN0IGFtZGdw
dV92bSAqdm0sIGNvbnN0IGNoYXIgKmNsaWVudF9uYW1lKTsKIAogdm9pZCBhbWRncHVfdm1f
bW92ZV90b19scnVfdGFpbChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCQlzdHJ1
Y3QgYW1kZ3B1X3ZtICp2bSk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfcHJvY2Vzcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3By
b2Nlc3MuYwppbmRleCBkMDdhY2YxYjJmOTMuLmZjODc5NjZhZGI2YSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3MuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jCkBAIC0xNjgwLDYgKzE2ODAsNyBA
QCBpbnQga2ZkX3Byb2Nlc3NfZGV2aWNlX2luaXRfdm0oc3RydWN0IGtmZF9wcm9jZXNzX2Rl
dmljZSAqcGRkLAogCQkJICAgICAgIHN0cnVjdCBmaWxlICpkcm1fZmlsZSkKIHsKIAlzdHJ1
Y3QgYW1kZ3B1X2Zwcml2ICpkcnZfcHJpdjsKKwlzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHA7CiAJ
c3RydWN0IGFtZGdwdV92bSAqYXZtOwogCXN0cnVjdCBrZmRfcHJvY2VzcyAqcDsKIAlzdHJ1
Y3QgZG1hX2ZlbmNlICplZjsKQEAgLTE2OTksOCArMTcwMCwxMCBAQCBpbnQga2ZkX3Byb2Nl
c3NfZGV2aWNlX2luaXRfdm0oc3RydWN0IGtmZF9wcm9jZXNzX2RldmljZSAqcGRkLAogCiAJ
cCA9IHBkZC0+cHJvY2VzczsKIAlkZXYgPSBwZGQtPmRldjsKKwlmaWxwID0gZHJtX2ZpbGUt
PnByaXZhdGVfZGF0YTsKIAogCXJldCA9IGFtZGdwdV9hbWRrZmRfZ3B1dm1fYWNxdWlyZV9w
cm9jZXNzX3ZtKGRldi0+YWRldiwgYXZtLAorCQkJCQkJICAgICBmaWxwLAogCQkJCQkJICAg
ICAmcC0+a2dkX3Byb2Nlc3NfaW5mbywKIAkJCQkJCSAgICAgJmVmKTsKIAlpZiAocmV0KSB7
Ci0tIAoyLjQwLjEKCg==

--------------VdFXX3Lrul4sBT77C60E6El0--
