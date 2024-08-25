Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF0895E1D9
	for <lists+dri-devel@lfdr.de>; Sun, 25 Aug 2024 07:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9715510E1BF;
	Sun, 25 Aug 2024 05:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="tI7fZsIR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr
 [80.12.242.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EB810E1BF
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2024 05:16:37 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id i5c3sfnbnQaX2i5c3sLa2L; Sun, 25 Aug 2024 07:16:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1724562996;
 bh=etav4+/0d2M+KsLJwpfXRerYAOxWEVkaPUajKyxnERA=;
 h=Message-ID:Date:MIME-Version:Subject:From:To;
 b=tI7fZsIR0lGDL5Pu+kP2C5UybE/oSXFDDtlpXC4+Ou/dEZJehmNg3cSPp0fbMf+kJ
 /nl2i/cUQLxosXcliwSxw3wuWv1gSX3eMn5fwpSpJEvvgwh25wLN7dCi9tYfPRfsmc
 BnTbo2u/NXT/bYI62v1S8aCAA6tXBDJGWee+849U9n/xNfCZyds4E7ajW15ItIv5tZ
 u/Jr34DFxZb30t2kiYsdiIfD28l9kULLWpDdtBkNwMMGKigaobpkuSaKzNBaxGRi/c
 o9HO204ux7k3oFB9h4pPS7qTj+KxSnKqvBWFbmxZzuOowXc2IQn7gJU01z3jUuGA3j
 3dX0K6x9UEmLw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 25 Aug 2024 07:16:36 +0200
X-ME-IP: 90.11.132.44
Message-ID: <6d4ec950-878f-499c-a808-dd5b31c2ddb6@wanadoo.fr>
Date: Sun, 25 Aug 2024 07:16:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 2/5] drm/mediatek: Fix missing of_node_put() for
 mtk_drm_get_all_drm_priv()
From: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jinjie Ruan <ruanjinjie@huawei.com>, hjc@rock-chips.com, heiko@sntech.de, 
 andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 krzk@kernel.org, jic23@kernel.org
References: <20240823092053.3170445-1-ruanjinjie@huawei.com>
 <20240823092053.3170445-3-ruanjinjie@huawei.com>
 <a4d23c3a-9791-4d2b-9853-9c9b27460db5@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <a4d23c3a-9791-4d2b-9853-9c9b27460db5@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



Le 23/08/2024 à 12:46, Christophe JAILLET a écrit :
>> @@ -933,10 +931,8 @@ static int mtk_drm_probe(struct platform_device 
>> *pdev)
>>           }
>>           ret = mtk_ddp_comp_init(node, &private->ddp_comp[comp_id], 
>> comp_id);
>> -        if (ret) {
>> -            of_node_put(node);
>> +        if (ret)
>>               goto err_node;
> 
> Hi,
> 
> I've seen on another thread that is was not sure that scoped versions 
> and gotos played well together.
> 
> It was asked to check more in details and confirm that it was safe 
> before applying the patch.
> 
> I've not followed the discussion, so I just point it out, in case it helps.
> 
> I'll try to give it a look in the coming days.
> 
> 
> CJ
> 

Hi,
looking at the generated asm file (gcc 14.2.1), everything looks fine.

# drivers/gpu/drm/mediatek/mtk_drm_drv.c:933: 		ret = 
mtk_ddp_comp_init(node, &private->ddp_comp[comp_id], comp_id);
	salq	$5, %rax	#, _36
	movl	%r14d, %edx	# comp_id,
	movq	%rbx, %rdi	# node,
	leaq	552(%rbp,%rax), %rsi	#, _28
	call	mtk_ddp_comp_init	#
	movl	%eax, %r12d	# tmp205, <retval>
# drivers/gpu/drm/mediatek/mtk_drm_drv.c:934: 		if (ret)
	testl	%eax, %eax	# <retval>
	jne	.L212	#,

...

.L212:
# ./include/linux/of.h:138: DEFINE_FREE(device_node, struct device_node 
*, if (_T) of_node_put(_T))
	movq	%rbx, %rdi	# node,
	call	of_node_put	#
	jmp	.L171	#

CJ
