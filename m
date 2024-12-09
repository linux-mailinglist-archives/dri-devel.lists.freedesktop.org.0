Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F13B9E8E88
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 10:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB3F10E348;
	Mon,  9 Dec 2024 09:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OzLcTAet";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DBD10E348
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 09:18:03 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-434a2033562so39721625e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 01:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733735881; x=1734340681; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9wBAwdJ29oKofR805FVZElGCgodJqD684iSyvXfouII=;
 b=OzLcTAetiGg6Ouw1oYA+oI3ru7drPVJoJWS6Uj6EVP9WpxJJ6hX0jwdnhUabQ0/1qZ
 bwwYh7c/XcmGeBNIMP0wA81HHnEbccrS413Wb8b4YejfeNHpHgVN2Fp4xghf+2oYlFcZ
 cs8eswq1sS+2JiuQTA9VJAGn9aBfIiqA/M+qmx43jgIbT1Vgqn/bJ5AaqERp851XLoTi
 58klhQk8PSES7w4x06xltvXFwaP3IGYDG8p2FQXml3y5e1jsx+zIsuz1eCQyD4SvSK7u
 FVtlVJJyXEvv39n7nvS8BZJAS2R5SzW75tWyI8Q7SLh/rbMM2M6SERIrj578g0S7tJ7M
 +h4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733735881; x=1734340681;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9wBAwdJ29oKofR805FVZElGCgodJqD684iSyvXfouII=;
 b=mQ4c6GTKRUq7VWrwSUGiZvHqfGhxUCwcTIub2o0lunuE+EtTh7p8ebWWETkCzZlNqj
 6QTCwSZabIA3EkWGVmtGCP+lX3s4r69IvpGN6RnocI8+zsfocuf2lE9yiTEqqU3LS8hg
 ZkF8WrP7Q8dJNj2XO/oGMa/oqAEjSdYK+M+6LgqDBHX6VO8m6GLwAoE/L7/zZb0CkaAw
 30nKsjOYaUyy7oYIH+a8CrZZ29x/277ihPmkL4S7mhIE8vG/PZtpmt63Sh3LgIdiB/6V
 mc6GvOuIULYVCITprw1T+cHo2w7NK1RtJLd0rNjY740bObFb7MLc62iUGSndSly7XNUo
 icYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1HW1tZ2yLkdEQ0c/ODS4kU3NGh+u3PCoQJjC0z2X+6oEGvdYetKDQSWSiS3W0kwwtbXYwzmkzQsM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyk0kQW/fiTXiHpwLG2ux+D0RknaY4oxKPy/Lx2yGaSQTHpSAIF
 puwi2RqpW2QIzAVwWeabfRC/TzKho5gIF8xpCbPcaTOS3E+7vpGf
X-Gm-Gg: ASbGncsBSO7uwmlTPDyCSk7lzUBP+NjN5MPvLo8ZuB7E3QRdSDr2SFeCvxNtE2qM8YM
 LtZdCKp1U4SLU/1Mpn/xITEMrQ17D+gYhN0Ker/Oz8NnjhiR49sEHOPVghjczEbXF3Q2dNr/5CM
 +90o6dlL8Ekw9VMXSBHsSEe3zqizmEYx2KPTzTpiEs/hNXtx8Jm2qxZP70VW6R/g6UwoBlxXFxg
 tzlM9Iy71s/M1akLsVBhpqmETnLBPsIkd+rlsURtEcv7ShVm2EmxoU8HR1J6dcQe9ZKQHQ3DY5r
 evG9AJxdfBL3RZtQbsxB0G7bWKjNQBqo/KdsG3IG8RMLSYXxj1o8i1eoZ5puOPgCMepGfQ2VtQU
 1etMtlheREvbSgSBJrcBz0/jtOb1gluoLUfw8mXBEA3o=
X-Google-Smtp-Source: AGHT+IEb/Umt7kRF5RN8R8jT90v/Z87riaC2QztSPPZs6jc4W9y10iiBGuMRWsWgVsjo+OroWx0Kog==
X-Received: by 2002:a05:600c:4710:b0:431:93dd:8e77 with SMTP id
 5b1f17b1804b1-434ddeddbe5mr106386965e9.31.1733735880400; 
 Mon, 09 Dec 2024 01:18:00 -0800 (PST)
Received: from ?IPV6:2a02:8389:41cf:e200:bfd5:cd4d:44ef:6ffe?
 (2a02-8389-41cf-e200-bfd5-cd4d-44ef-6ffe.cable.dynamic.v6.surfer.at.
 [2a02:8389:41cf:e200:bfd5:cd4d:44ef:6ffe])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434f5774454sm43327715e9.13.2024.12.09.01.17.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 01:17:59 -0800 (PST)
Message-ID: <3fc932cc-4b38-48fe-a692-c31e3346c9b3@gmail.com>
Date: Mon, 9 Dec 2024 10:17:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [git pull] drm for 6.13-rc1
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "sashal@kernel.org" <sashal@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "wenst@chromium.org" <wenst@chromium.org>
Cc: "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
 "sima@ffwll.ch" <sima@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CAPM=9txbfH8vf-YjwTXEYL729a6r2eeLBxCJc3MSD-t5jXVA-w@mail.gmail.com>
 <Z0NXQ6iRK43x6WbG@sashalap>
 <CAPM=9tw5eTBCDn93GyrMjF3r_kDbr2-v1GgKdZECFNupqakDFw@mail.gmail.com>
 <95f01caa-0f32-4c5c-b262-435f839c81aa@gmail.com>
 <17d4fac0db55a8f9835b53d55463ed9c4331950d.camel@mediatek.com>
 <c0cbd447-42c7-4529-8455-cdde9d693423@collabora.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <c0cbd447-42c7-4529-8455-cdde9d693423@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 09/12/2024 09:56, AngeloGioacchino Del Regno wrote:
> Il 06/12/24 09:54, CK Hu (胡俊光) ha scritto:
>> Hi, Sasha:
>>
>> On Mon, 2024-11-25 at 01:35 +0100, Javier Carrasco wrote:
>>> External email : Please do not click links or open attachments until
>>> you have verified the sender or the content.
>>>
>>>
>>> On 24/11/2024 23:58, Dave Airlie wrote:
>>>> On Mon, 25 Nov 2024 at 02:41, Sasha Levin <sashal@kernel.org> wrote:
>>>>>
>>>>> On Thu, Nov 21, 2024 at 10:25:45AM +1000, Dave Airlie wrote:
>>>>>> Hi Linus,
>>>>>>
>>>>>> This is the main drm pull request for 6.13.
>>>>>>
>>>>>> I've done a test merge into your tree, there were two conflicts both
>>>>>> of which seem easy enough to resolve for you.
>>>>>>
>>>>>> There's a lot of rework, the panic helper support is being added to
>>>>>> more drivers, v3d gets support for HW superpages, scheduler
>>>>>> documentation, drm client and video aperture reworks, some new
>>>>>> MAINTAINERS added, amdgpu has the usual lots of IP refactors, Intel
>>>>>> has some Pantherlake enablement and xe is getting some SRIOV bits,
>>>>>> but
>>>>>> just lots of stuff everywhere.
>>>>>>
>>>>>> Let me know if there are any issues,
>>>>>
>>>>> Hey Dave,
>>>>>
>>>>> After the PR was merged, I've started seeing boot failures reported by
>>>>> KernelCI:
>>>>
>>>> I'll add the mediatek names I see who touched anything in the area
>>>> recently.
>>>>
>>>> Dave.
>>>>>
>>>>> [    4.395400] mediatek-drm mediatek-drm.5.auto: bound
>>>>> 1c014000.merge (ops 0xffffd35fd12975f8)
>>>>> [    4.396155] mediatek-drm mediatek-drm.5.auto: bound 1c000000.ovl
>>>>> (ops 0xffffd35fd12977b8)
>>>>> [    4.411951] mediatek-drm mediatek-drm.5.auto: bound
>>>>> 1c002000.rdma (ops 0xffffd35fd12989c0)
>>>>> [    4.536837] mediatek-drm mediatek-drm.5.auto: bound
>>>>> 1c004000.ccorr (ops 0xffffd35fd1296cf0)
>>>>> [    4.545181] mediatek-drm mediatek-drm.5.auto: bound 1c005000.aal
>>>>> (ops 0xffffd35fd1296a80)
>>>>> [    4.553344] mediatek-drm mediatek-drm.5.auto: bound
>>>>> 1c006000.gamma (ops 0xffffd35fd12972b0)
>>>>> [    4.561680] mediatek-drm mediatek-drm.5.auto: bound
>>>>> 1c014000.merge (ops 0xffffd35fd12975f8)
>>>>> [    4.570025] ------------[ cut here ]------------
>>>>> [    4.574630] refcount_t: underflow; use-after-free.
>>>>> [    4.579416] WARNING: CPU: 6 PID: 81 at lib/refcount.c:28
>>>>> refcount_warn_saturate+0xf4/0x148
>>>>> [    4.587670] Modules linked in:
>>>>> [    4.590714] CPU: 6 UID: 0 PID: 81 Comm: kworker/u32:3 Tainted:
>>>>> G        W          6.12.0 #1 cab58e2e59020ebd4be8ada89a65f465a316c742
>>>>> [    4.602695] Tainted: [W]=WARN
>>>>> [    4.605649] Hardware name: Acer Tomato (rev2) board (DT)
>>>>> [    4.610947] Workqueue: events_unbound deferred_probe_work_func
>>>>> [    4.616768] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -
>>>>> SSBS BTYPE=--)
>>>>> [    4.623715] pc : refcount_warn_saturate+0xf4/0x148
>>>>> [    4.628493] lr : refcount_warn_saturate+0xf4/0x148
>>>>> [    4.633270] sp : ffff8000807639c0
>>>>> [    4.636571] x29: ffff8000807639c0 x28: ffff34ff4116c640 x27:
>>>>> ffff34ff4368e080
>>>>> [    4.643693] x26: ffffd35fd1299ac8 x25: ffff34ff46c8c410 x24:
>>>>> 0000000000000000
>>>>> [    4.650814] x23: ffff34ff4368e080 x22: 00000000fffffdfb x21:
>>>>> 0000000000000002
>>>>> [    4.657934] x20: ffff34ff470c6000 x19: ffff34ff410c7c10 x18:
>>>>> 0000000000000006
>>>>> [    4.665055] x17: 666678302073706f x16: 2820656772656d2e x15:
>>>>> ffff800080763440
>>>>> [    4.672176] x14: 0000000000000000 x13: 2e656572662d7265 x12:
>>>>> ffffd35fd2ed14f0
>>>>> [    4.679297] x11: 0000000000000001 x10: 0000000000000001 x9 :
>>>>> ffffd35fd0342150
>>>>> [    4.686418] x8 : c0000000ffffdfff x7 : ffffd35fd2e21450 x6 :
>>>>> 00000000000affa8
>>>>> [    4.693539] x5 : ffffd35fd2ed1498 x4 : 0000000000000000 x3 :
>>>>> 0000000000000000
>>>>> [    4.700660] x2 : 0000000000000000 x1 : 0000000000000000 x0 :
>>>>> ffff34ff40932580
>>>>> [    4.707781] Call trace:
>>>>> [    4.710216]  refcount_warn_saturate+0xf4/0x148 (P)
>>>>> [    4.714993]  refcount_warn_saturate+0xf4/0x148 (L)
>>>>> [    4.719772]  kobject_put+0x110/0x118
>>>>> [    4.723335]  put_device+0x1c/0x38
>>>>> [    4.726638]  mtk_drm_bind+0x294/0x5c0
>>>>> [    4.730289]  try_to_bring_up_aggregate_device+0x16c/0x1e0
>>>>> [    4.735673]  __component_add+0xbc/0x1c0
>>>>> [    4.739495]  component_add+0x1c/0x30
>>>>> [    4.743058]  mtk_disp_rdma_probe+0x140/0x210
>>>>> [    4.747314]  platform_probe+0x70/0xd0
>>>>> [    4.750964]  really_probe+0xc4/0x2a8
>>>>> [    4.754527]  __driver_probe_device+0x80/0x140
>>>>> [    4.758870]  driver_probe_device+0x44/0x120
>>>>> [    4.763040]  __device_attach_driver+0xc0/0x108
>>>>> [    4.767470]  bus_for_each_drv+0x8c/0xf0
>>>>> [    4.771294]  __device_attach+0xa4/0x198
>>>>> [    4.775117]  device_initial_probe+0x1c/0x30
>>>>> [    4.779286]  bus_probe_device+0xb4/0xc0
>>>>> [    4.783109]  deferred_probe_work_func+0xb0/0x100
>>>>> [    4.787714]  process_one_work+0x18c/0x420
>>>>> [    4.791712]  worker_thread+0x30c/0x418
>>>>> [    4.795449]  kthread+0x128/0x138
>>>>> [    4.798665]  ret_from_fork+0x10/0x20
>>>>> [    4.802229] ---[ end trace 0000000000000000 ]---
>>>>>
>>>>> I don't think that I'll be able to bisect further as I don't have the
>>>>> relevant hardware available.
>>>>>
>>>>> -- 
>>>>> Thanks,
>>>>> Sasha
>>>
>>>
>>> Hello, I am one of those who touched something in the area.
>>>
>>> To check if my changes are the cause of the boot failures, please apply
>>> this patch:
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> index 9a8ef8558da9..85be035a209a 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> @@ -373,11 +373,12 @@ static bool mtk_drm_get_all_drm_priv(struct device
>>> *dev)
>>>          struct mtk_drm_private *temp_drm_priv;
>>>          struct device_node *phandle = dev->parent->of_node;
>>>          const struct of_device_id *of_id;
>>> +       struct device_node *node;
>>>          struct device *drm_dev;
>>>          unsigned int cnt = 0;
>>>          int i, j;
>>>
>>> -       for_each_child_of_node_scoped(phandle->parent, node) {
>>> +       for_each_child_of_node(phandle->parent, node) {
>>>                  struct platform_device *pdev;
>>>
>>>                  of_id = of_match_node(mtk_drm_of_ids, node);
>>>
>>
>> Does Javier's patch fix the problem?
>>
> 
> CK, to resolve the issue, please revert commit
> 
> fd620fc25d88 ("drm/mediatek: Switch to for_each_child_of_node_scoped()")
> 
> Thanks,
> Angelo
> 

Hi Angelo, thanks for your feedback.

Are you sure that only reverting that resolves the issue? There is a
previous patch:

f708e8b4cfd1 ("drm/mediatek: Fix child node refcount handling in early
exit")

That adds the "missing" call to of_node_put(node), and the one you
mentioned switches to the _scoped() approach. I would expect the call to
of_node_put(node) to be the actual cause of the issue, and not the
scoped loop. In that case, both patches would have to be reverted (that
is what the patch above, only for testing purposes, manually does).

I still wonder why the child node is required after the loop when it is
not referenced, though. But as I said before, that is a minor concern in
comparison.

Thanks and best regards,
Javier Carrasco

