Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFC395FE6B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 03:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6AB710E1F8;
	Tue, 27 Aug 2024 01:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCCA10E1F8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 01:42:35 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Wt9CX2yzTz20mq7;
 Tue, 27 Aug 2024 09:37:44 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 3B824140120;
 Tue, 27 Aug 2024 09:42:32 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 27 Aug 2024 09:42:30 +0800
Message-ID: <9f93fe1f-c7d7-7d96-44ab-2bca0aae407e@huawei.com>
Date: Tue, 27 Aug 2024 09:42:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next 2/5] drm/mediatek: Fix missing of_node_put() for
 mtk_drm_get_all_drm_priv()
Content-Language: en-US
To: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 <hjc@rock-chips.com>, <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <krzk@kernel.org>, <jic23@kernel.org>
References: <20240823092053.3170445-1-ruanjinjie@huawei.com>
 <20240823092053.3170445-3-ruanjinjie@huawei.com>
 <a4d23c3a-9791-4d2b-9853-9c9b27460db5@wanadoo.fr>
 <6d4ec950-878f-499c-a808-dd5b31c2ddb6@wanadoo.fr>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <6d4ec950-878f-499c-a808-dd5b31c2ddb6@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemh500013.china.huawei.com (7.202.181.146)
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



On 2024/8/25 13:16, Marion & Christophe JAILLET wrote:
> 
> 
> Le 23/08/2024 à 12:46, Christophe JAILLET a écrit :
>>> @@ -933,10 +931,8 @@ static int mtk_drm_probe(struct platform_device
>>> *pdev)
>>>           }
>>>           ret = mtk_ddp_comp_init(node, &private->ddp_comp[comp_id],
>>> comp_id);
>>> -        if (ret) {
>>> -            of_node_put(node);
>>> +        if (ret)
>>>               goto err_node;
>>
>> Hi,
>>
>> I've seen on another thread that is was not sure that scoped versions
>> and gotos played well together.
>>
>> It was asked to check more in details and confirm that it was safe
>> before applying the patch.
>>
>> I've not followed the discussion, so I just point it out, in case it
>> helps.
>>
>> I'll try to give it a look in the coming days.
>>
>>
>> CJ
>>
> 
> Hi,
> looking at the generated asm file (gcc 14.2.1), everything looks fine.

Yes, as I pointed out in another thread, the test show that goto with
this scoped function is good.

> 
> # drivers/gpu/drm/mediatek/mtk_drm_drv.c:933:         ret =
> mtk_ddp_comp_init(node, &private->ddp_comp[comp_id], comp_id);
>     salq    $5, %rax    #, _36
>     movl    %r14d, %edx    # comp_id,
>     movq    %rbx, %rdi    # node,
>     leaq    552(%rbp,%rax), %rsi    #, _28
>     call    mtk_ddp_comp_init    #
>     movl    %eax, %r12d    # tmp205, <retval>
> # drivers/gpu/drm/mediatek/mtk_drm_drv.c:934:         if (ret)
>     testl    %eax, %eax    # <retval>
>     jne    .L212    #,
> 
> ...
> 
> .L212:
> # ./include/linux/of.h:138: DEFINE_FREE(device_node, struct device_node
> *, if (_T) of_node_put(_T))
>     movq    %rbx, %rdi    # node,
>     call    of_node_put    #
>     jmp    .L171    #
> 
> CJ
> 
