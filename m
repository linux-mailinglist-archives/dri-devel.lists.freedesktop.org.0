Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE597122F4
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 11:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3715E10E7CC;
	Fri, 26 May 2023 09:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5DD10E7CC
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 09:05:16 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 72A30846BA;
 Fri, 26 May 2023 11:05:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1685091913;
 bh=8d7WWant3ycGGGrLQswHvy/sJFkYyA/xVWGPPeoifnc=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=OUxZp1r1MN148c3Rs/DxYjpsJWu1PlNU47v8qlnXIQT4KLGWKYHsU9sjhHriZCnke
 WEyo4QLUQDbJsovrNNCzhpiwvXAfFck+YfFNm6UI++ByryjDH6DAcraC7mitNLR+9I
 AhIsQ2+OponyFsdtuuFeE9twvRqCOKn9YvkXOktBfLh30o3C+fRgnRuJtwN61l2hQb
 3zPVhUwsI17o0/0aYyk2XYzX//kUBsdjrMLM5p8qs8W3AvTVFiC6tlUUM/O7CplFPW
 Sc/Oww04pwr2ILTmpGs/IRKijWxIUqVDYfVP8avJ5z3waq7CFM5xv7HLQvOan910OO
 5IC8czUiNmU7A==
Message-ID: <de7cad77-1735-32a6-034e-8df24cda44c3@denx.de>
Date: Fri, 26 May 2023 11:05:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/stm: Fix resolution bitmasks
To: Philippe CORNU <philippe.cornu@foss.st.com>,
 Yannick FERTRE <yannick.fertre@foss.st.com>, dri-devel@lists.freedesktop.org
References: <20221011231048.505967-1-marex@denx.de>
 <93a77911-e9b2-d2e1-4fff-41f63c87376b@foss.st.com>
 <3ce425c7-978f-64e7-0630-b9aa5d1af55c@foss.st.com>
 <e7593ac2-fa0a-18ff-d286-2f4080bd5b86@denx.de>
 <58147ea7-d0dc-439d-5610-b293513b0e75@denx.de>
 <8c3ab04c-7fa8-63a3-a4b2-1a76fc7d6c54@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <8c3ab04c-7fa8-63a3-a4b2-1a76fc7d6c54@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

On 5/15/23 18:02, Philippe CORNU wrote:

Hi,

>>>> The genmask of regsiter SSCR, BPCR & others were setted accordly to 
>>>> the chipset stm32f4.
>>>
>>> So that means:
>>> F4 -> 2048x2048 framebuffer
>>> H7/MP1 -> 4096x4096 framebuffer
>>> ?
>>
>> Worse
>>
>> F4 is 2048x2048
>> F7 is 4096x2048
>> MP1 is 4096x4096
>>
>> and there is no IDR register on F4/F7 like on MP1, or is there ?
>>
>> How else can we tell those LTDC versions apart ?
>>
>>
> 
> Dear Marek,
> Many thanks for your patch (and sorry for this late reply).
> Your patch is good and fixes this ltdc driver source code vs. the 
> related reference manual.
> imho, it will not be an issue for F4 & F7 series if these bit-fields are 
> "bigger" as I am pretty sure stm32 MCUs are not really using such high 
> resolutions.
> Yannick already replied with his reviewed-by. I add my
> 
> Acked-by: Philippe Cornu <philippe.cornu@foss.st.com>
> 
> If you agree, I will merge your patch really soon.

I would say there is no rush, so let's get this done right .

> Dear Yannick,
> You may add to your todo list to double check if there is a need to 
> detect stm32 MCUs vs. these bit-field sizes...

Can we use a compatible string , or I think there is some ID register ?

[...]

btw I only received this email now, odd, I wonder whether it was stuck 
in some SMTP server. Sorry for the delayed reply, it was out of my control.
