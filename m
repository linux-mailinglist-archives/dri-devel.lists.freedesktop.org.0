Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C00B375A946
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 10:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E7310E57F;
	Thu, 20 Jul 2023 08:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C9510E57F;
 Thu, 20 Jul 2023 08:28:24 +0000 (UTC)
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4R65N85vy8ztRZ2;
 Thu, 20 Jul 2023 16:25:12 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 16:28:20 +0800
Message-ID: <1e839238-c78d-71e0-28ae-7efff0e04953@huawei.com>
Date: Thu, 20 Jul 2023 16:28:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 3/4] selinux: use vma_is_initial_stack() and
 vma_is_initial_heap()
Content-Language: en-US
To: Paul Moore <paul@paul-moore.com>, =?UTF-8?Q?Christian_G=c3=b6ttsche?=
 <cgzones@googlemail.com>
References: <20230719075127.47736-1-wangkefeng.wang@huawei.com>
 <20230719075127.47736-4-wangkefeng.wang@huawei.com>
 <CAJ2a_DfGvPeDuN38UBXD4f2928n9GZpHFgdiPo9MoSAY7YXeOg@mail.gmail.com>
 <dc8223db-b4ac-7bee-6f89-63475a7dcaf8@huawei.com>
 <CAHC9VhQzJ3J0kEymDUn3i+dnP_34GMNRjaCHXc4oddUCFb0Ygw@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <CAHC9VhQzJ3J0kEymDUn3i+dnP_34GMNRjaCHXc4oddUCFb0Ygw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
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
Cc: selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-perf-users@vger.kernel.org, linux-mm@kvack.org,
 amd-gfx@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 Eric Paris <eparis@parisplace.org>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/7/19 23:25, Paul Moore wrote:
> On Wed, Jul 19, 2023 at 6:23 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>> On 2023/7/19 17:02, Christian Göttsche wrote:
>>> On Wed, 19 Jul 2023 at 09:40, Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>>>>
>>>> Use the helpers to simplify code.
>>>>
>>>> Cc: Paul Moore <paul@paul-moore.com>
>>>> Cc: Stephen Smalley <stephen.smalley.work@gmail.com>
>>>> Cc: Eric Paris <eparis@parisplace.org>
>>>> Acked-by: Paul Moore <paul@paul-moore.com>
>>>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>>>> ---
>>>>    security/selinux/hooks.c | 7 ++-----
>>>>    1 file changed, 2 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
>>>> index d06e350fedee..ee8575540a8e 100644
>>>> --- a/security/selinux/hooks.c
>>>> +++ b/security/selinux/hooks.c
>>>> @@ -3762,13 +3762,10 @@ static int selinux_file_mprotect(struct vm_area_struct *vma,
>>>>           if (default_noexec &&
>>>>               (prot & PROT_EXEC) && !(vma->vm_flags & VM_EXEC)) {
>>>>                   int rc = 0;
>>>> -               if (vma->vm_start >= vma->vm_mm->start_brk &&
>>>> -                   vma->vm_end <= vma->vm_mm->brk) {
>>>> +               if (vma_is_initial_heap(vma)) {
>>>
>>> This seems to change the condition from
>>>
>>>       vma->vm_start >= vma->vm_mm->start_brk && vma->vm_end <= vma->vm_mm->brk
>>>
>>> to
>>>
>>>       vma->vm_start <= vma->vm_mm->brk && vma->vm_end >= vma->vm_mm->start_brk
>>>
>>> (or AND arguments swapped)
>>>
>>>       vma->vm_end >= vma->vm_mm->start_brk && vma->vm_start <= vma->vm_mm->brk
>>>
>>> Is this intended?
>>
>> The new condition is to check whether there is intersection between
>> [startbrk,brk] and [vm_start,vm_end], it contains orignal check, so
>> I think it is ok, but for selinux check, I am not sure if there is
>> some other problem.
> 
> This particular SELinux vma check is see if the vma falls within the
> heap; can you confirm that this change preserves this?

Yes, within is one case of new vma scope check.

> 
