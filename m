Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EEC996189
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 09:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4795C10E675;
	Wed,  9 Oct 2024 07:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="fcQN+lWM";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="3E1wWQRr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D69910E673;
 Wed,  9 Oct 2024 07:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1728460372;
 bh=TwQFW9tPrHdFyxaB+VA5WYj
 aJwktX4894jgQc39gzPQ=; b=fcQN+lWMzFGyFZQQdW3LpVYf31OVE3RHeeYST3Z1ucz+pqEa5X
 6pOf6ya/M7LY83rAfAcmEl4hOlbOgd+P5XPr6LL7MxxGDmiGeU9A4IBlDbfF+9BRLu/mQUIOkHg
 rmgQHOtQYSDHhwWEKlkDzaQyUj2ssA7/WN837Paw7+CIXwedcPsOmAvEtwjE4+QpYZ8svoWg/+9
 ge+qK+xSvGsS/ILevtTUawxHtj2/iPUDAP2tBq91/4q05t7g49T6943ys/OYD5cPg9eNaXMg44L
 tdOowp3OsiEwdIvOz4UcZBs+Kka2ZvtbKzLxxBVDLDWdfuw9xvpti0l4g/QrFtj+ySQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1728460372; bh=TwQFW9tPrHdFyxaB+VA5WYj
 aJwktX4894jgQc39gzPQ=; b=3E1wWQRr06qfLxKyLi/arn00Kg/n3CshjZnpuISsVfpOa0vg9F
 qYHHMIncFcNJ2qhVfFC/pD9MNllIloQcNTDg==;
Content-Type: multipart/mixed; boundary="------------6Iyf9vcfP3VQ6Z0HVA5kbt5Z"
Message-ID: <13d85e12-fa10-4dd9-8221-dfeb589f718c@damsy.net>
Date: Wed, 9 Oct 2024 09:52:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] drm/amdgpu: alloc and init vm::task_info from
 first submit
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dmitry.osipenko@collabora.com, jani.nikula@linux.intel.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 alexander.deucher@amd.com
References: <20241003124506.470931-1-pierre-eric.pelloux-prayer@amd.com>
 <20241003124506.470931-5-pierre-eric.pelloux-prayer@amd.com>
 <45be3629-7d02-434d-ae2d-afd9b87bf036@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <45be3629-7d02-434d-ae2d-afd9b87bf036@amd.com>
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
--------------6Iyf9vcfP3VQ6Z0HVA5kbt5Z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/10/2024 à 10:13, Christian König a écrit :
> Am 03.10.24 um 14:43 schrieb Pierre-Eric Pelloux-Prayer:
>> This will allow to use flexible array to store the process name and
>> other information.
>>
>> This also means that process name will be determined once and for all,
>> instead of at each submit.
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 29 ++++++++++++--------------
>>   1 file changed, 13 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> index e20d19ae01b2..6cd5bd5362d4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> @@ -2331,7 +2331,7 @@ amdgpu_vm_get_task_info_vm(struct amdgpu_vm *vm)
>>   {
>>       struct amdgpu_task_info *ti = NULL;
>> -    if (vm) {
>> +    if (vm && vm->task_info) {
>>           ti = vm->task_info;
>>           kref_get(&vm->task_info->refcount);
>>       }
>> @@ -2361,6 +2361,10 @@ static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
>>       if (!vm->task_info)
>>           return -ENOMEM;
>> +    /* Set process attributes now. */
>> +    vm->task_info->tgid = current->group_leader->pid;
>> +    get_task_comm(vm->task_info->process_name, current->group_leader);
>> +
>>       kref_init(&vm->task_info->refcount);
>>       return 0;
>>   }
>> @@ -2372,20 +2376,16 @@ static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
>>    */
>>   void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>>   {
>> -    if (!vm->task_info)
>> -        return;
>> -
>> -    if (vm->task_info->pid == current->pid)
>> +    if (!vm->task_info) {
>> +        if (amdgpu_vm_create_task_info(vm))
>> +            return;
>> +    } else if (vm->task_info->pid == current->pid) {
>>           return;
>> +    }
>> +    /* Update task attributes. */
>>       vm->task_info->pid = current->pid;
>>       get_task_comm(vm->task_info->task_name, current);
>> -
>> -    if (current->group_leader->mm != current->mm)
>> -        return;
>> -
>> -    vm->task_info->tgid = current->group_leader->pid;
>> -    get_task_comm(vm->task_info->process_name, current->group_leader);
>>   }
>>   /**
>> @@ -2482,10 +2482,6 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>       if (r)
>>           goto error_free_root;
>> -    r = amdgpu_vm_create_task_info(vm);
>> -    if (r)
>> -        DRM_DEBUG("Failed to create task info for VM\n");
>> -
>>       amdgpu_bo_unreserve(vm->root.bo);
>>       amdgpu_bo_unref(&root_bo);
>> @@ -2608,7 +2604,8 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>>       root = amdgpu_bo_ref(vm->root.bo);
>>       amdgpu_bo_reserve(root, true);
>> -    amdgpu_vm_put_task_info(vm->task_info);
>> +    if (vm->task_info)
>> +        amdgpu_vm_put_task_info(vm->task_info);
> 
> That NULL check should probably be moved into amdgpu_vm_put_task_info().
> 
> Apart from that the patch is Reviewed-by: Christian König <christian.koenig@amd.com>.

Fixed in attached patch.

Pierre-Eric

> 
> Regards,
> Christian.
> 
>>       amdgpu_vm_set_pasid(adev, vm, 0);
>>       dma_fence_wait(vm->last_unlocked, false);
>>       dma_fence_put(vm->last_unlocked);

--------------6Iyf9vcfP3VQ6Z0HVA5kbt5Z
Content-Type: text/x-patch; charset=UTF-8;
 name="0004-drm-amdgpu-alloc-and-init-vm-task_info-from-first-su.patch"
Content-Disposition: attachment;
 filename*0="0004-drm-amdgpu-alloc-and-init-vm-task_info-from-first-su.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBmYmFmNTYxNWI2ZTBkOWI2YTA4MGE1NWU1MTYxNWMwMjE2ZDMzY2YzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBQaWVycmUtRXJpYyBQZWxsb3V4LVByYXllciA8cGll
cnJlLWVyaWMucGVsbG91eC1wcmF5ZXJAYW1kLmNvbT4KRGF0ZTogVGh1LCAxOSBTZXAgMjAy
NCAxNDozOTo0NiArMDIwMApTdWJqZWN0OiBbUEFUQ0ggNC82XSBkcm0vYW1kZ3B1OiBhbGxv
YyBhbmQgaW5pdCB2bTo6dGFza19pbmZvIGZyb20gZmlyc3QKIHN1Ym1pdApNSU1FLVZlcnNp
b246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVu
dC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKVGhpcyB3aWxsIGFsbG93IHRvIHVzZSBmbGV4
aWJsZSBhcnJheSB0byBzdG9yZSB0aGUgcHJvY2VzcyBuYW1lIGFuZApvdGhlciBpbmZvcm1h
dGlvbi4KClRoaXMgYWxzbyBtZWFucyB0aGF0IHByb2Nlc3MgbmFtZSB3aWxsIGJlIGRldGVy
bWluZWQgb25jZSBhbmQgZm9yIGFsbCwKaW5zdGVhZCBvZiBhdCBlYWNoIHN1Ym1pdC4KClJl
dmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IFBpZXJyZS1FcmljIFBlbGxvdXgtUHJheWVyIDxwaWVycmUtZXJp
Yy5wZWxsb3V4LXByYXllckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV92bS5jIHwgMjkgKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCmluZGV4IDYwMDUyODBmNWYzOC4uOWNi
Y2NmYWJlYTlmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwpA
QCAtMjMzMCw3ICsyMzMwLDggQEAgYW1kZ3B1X3ZtX2dldF92bV9mcm9tX3Bhc2lkKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LCB1MzIgcGFzaWQpCiAgKi8KIHZvaWQgYW1kZ3B1X3Zt
X3B1dF90YXNrX2luZm8oc3RydWN0IGFtZGdwdV90YXNrX2luZm8gKnRhc2tfaW5mbykKIHsK
LQlrcmVmX3B1dCgmdGFza19pbmZvLT5yZWZjb3VudCwgYW1kZ3B1X3ZtX2Rlc3Ryb3lfdGFz
a19pbmZvKTsKKwlpZiAodGFza19pbmZvKQorCQlrcmVmX3B1dCgmdGFza19pbmZvLT5yZWZj
b3VudCwgYW1kZ3B1X3ZtX2Rlc3Ryb3lfdGFza19pbmZvKTsKIH0KIAogLyoqCkBAIC0yMzQ2
LDcgKzIzNDcsNyBAQCBhbWRncHVfdm1fZ2V0X3Rhc2tfaW5mb192bShzdHJ1Y3QgYW1kZ3B1
X3ZtICp2bSkKIHsKIAlzdHJ1Y3QgYW1kZ3B1X3Rhc2tfaW5mbyAqdGkgPSBOVUxMOwogCi0J
aWYgKHZtKSB7CisJaWYgKHZtICYmIHZtLT50YXNrX2luZm8pIHsKIAkJdGkgPSB2bS0+dGFz
a19pbmZvOwogCQlrcmVmX2dldCgmdm0tPnRhc2tfaW5mby0+cmVmY291bnQpOwogCX0KQEAg
LTIzNzYsNiArMjM3NywxMCBAQCBzdGF0aWMgaW50IGFtZGdwdV92bV9jcmVhdGVfdGFza19p
bmZvKHN0cnVjdCBhbWRncHVfdm0gKnZtKQogCWlmICghdm0tPnRhc2tfaW5mbykKIAkJcmV0
dXJuIC1FTk9NRU07CiAKKwkvKiBTZXQgcHJvY2VzcyBhdHRyaWJ1dGVzIG5vdy4gKi8KKwl2
bS0+dGFza19pbmZvLT50Z2lkID0gY3VycmVudC0+Z3JvdXBfbGVhZGVyLT5waWQ7CisJZ2V0
X3Rhc2tfY29tbSh2bS0+dGFza19pbmZvLT5wcm9jZXNzX25hbWUsIGN1cnJlbnQtPmdyb3Vw
X2xlYWRlcik7CisKIAlrcmVmX2luaXQoJnZtLT50YXNrX2luZm8tPnJlZmNvdW50KTsKIAly
ZXR1cm4gMDsKIH0KQEAgLTIzODcsMjAgKzIzOTIsMTYgQEAgc3RhdGljIGludCBhbWRncHVf
dm1fY3JlYXRlX3Rhc2tfaW5mbyhzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSkKICAqLwogdm9pZCBh
bWRncHVfdm1fc2V0X3Rhc2tfaW5mbyhzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSkKIHsKLQlpZiAo
IXZtLT50YXNrX2luZm8pCi0JCXJldHVybjsKLQotCWlmICh2bS0+dGFza19pbmZvLT5waWQg
PT0gY3VycmVudC0+cGlkKQorCWlmICghdm0tPnRhc2tfaW5mbykgeworCQlpZiAoYW1kZ3B1
X3ZtX2NyZWF0ZV90YXNrX2luZm8odm0pKQorCQkJcmV0dXJuOworCX0gZWxzZSBpZiAodm0t
PnRhc2tfaW5mby0+cGlkID09IGN1cnJlbnQtPnBpZCkgewogCQlyZXR1cm47CisJfQogCisJ
LyogVXBkYXRlIHRhc2sgYXR0cmlidXRlcy4gKi8KIAl2bS0+dGFza19pbmZvLT5waWQgPSBj
dXJyZW50LT5waWQ7CiAJZ2V0X3Rhc2tfY29tbSh2bS0+dGFza19pbmZvLT50YXNrX25hbWUs
IGN1cnJlbnQpOwotCi0JaWYgKGN1cnJlbnQtPmdyb3VwX2xlYWRlci0+bW0gIT0gY3VycmVu
dC0+bW0pCi0JCXJldHVybjsKLQotCXZtLT50YXNrX2luZm8tPnRnaWQgPSBjdXJyZW50LT5n
cm91cF9sZWFkZXItPnBpZDsKLQlnZXRfdGFza19jb21tKHZtLT50YXNrX2luZm8tPnByb2Nl
c3NfbmFtZSwgY3VycmVudC0+Z3JvdXBfbGVhZGVyKTsKIH0KIAogLyoqCkBAIC0yNDkwLDEw
ICsyNDkxLDYgQEAgaW50IGFtZGdwdV92bV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwKIAlpZiAocikKIAkJZ290byBlcnJvcl9mcmVl
X3Jvb3Q7CiAKLQlyID0gYW1kZ3B1X3ZtX2NyZWF0ZV90YXNrX2luZm8odm0pOwotCWlmIChy
KQotCQlEUk1fREVCVUcoIkZhaWxlZCB0byBjcmVhdGUgdGFzayBpbmZvIGZvciBWTVxuIik7
Ci0KIAlhbWRncHVfYm9fdW5yZXNlcnZlKHZtLT5yb290LmJvKTsKIAlhbWRncHVfYm9fdW5y
ZWYoJnJvb3RfYm8pOwogCi0tIAoyLjQwLjEKCg==

--------------6Iyf9vcfP3VQ6Z0HVA5kbt5Z--
