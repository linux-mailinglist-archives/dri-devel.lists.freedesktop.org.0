Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 406B7838F79
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 14:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6088810E7A4;
	Tue, 23 Jan 2024 13:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com
 [95.215.58.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6E410E7C0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 13:10:43 +0000 (UTC)
Message-ID: <25e08a8e-9d10-4e29-b6a8-01f33a011349@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1706015439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7qyk0qJOJtF/c91kLS1zwU64q2ScrrEuanCNe4bQUpE=;
 b=QUxKiy9keJJXFaoWJw+yvNzgDry3pt/C2HTMwQ5n6YimPSOMvBCrThPxXtMqwTga6nQdUL
 4fvVpMYjnEFdjCBDsX2ff1cSCAvG10RkBcyZDhFwIgD0aso2ifqyuWdfOovoFnMXIOGhd+
 C++Ni92BOG5y5iXbod6C/kgrmH4KUrQ=
Date: Tue, 23 Jan 2024 21:10:30 +0800
MIME-Version: 1.0
Subject: Re: drm/loongson: Error out if no VRAM detected
Content-Language: en-US
To: Katyusha <KatyushaScarlet@Outlook.com>,
 Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Huacai Chen <chenhuacai@kernel.org>
References: <20240119104049.335449-1-chenhuacai@loongson.cn>
 <1ead2284-dbc1-4938-bdce-66971c70ef1e@linux.dev>
 <TYCP286MB29897A1BAEC60654F6AC3D13AA772@TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM>
 <f41bc98a-cb8f-4e75-9445-f24e3c55b69f@linux.dev>
 <TYCP286MB29891E14DB45F41FDB48A53EAA762@TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <TYCP286MB29891E14DB45F41FDB48A53EAA762@TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: "loongson-kernel@lists.loongnix.cn" <loongson-kernel@lists.loongnix.cn>,
 Li Chao <lichao@loongson.cn>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


CCing Li Chao <lichao@loongson.cn>


On 2024/1/21 15:07, Katyusha wrote:
> Hi,
>
> On 2024/1/21 5:28, Sui JIngfeng wrote:
>> Hi,
>>
>>
>> On 2024/1/20 20:01, Katyusha wrote:
>>>
>>> Hi,
>>>
>>> This patch works fine with my Loongson 3A5000M laptop (L71), which 
>>> has a 7A1000 chipset without VRAM.
>>>
>>>
>>
>> Can you give more details about the hardware configuration about this 
>> laptop?
>> For example, by using 'lspci | grep VGA' command. I want to make sure 
>> if the
>> integrated display controller are there.
>>
>>
>> Normally, the integrated graphics should not be used if there is no 
>> dedicated
>> VRAM equipped. And the platform BIOS should disable it.
>>
> Here's my result of lspci:
>
> $ sudo lspci -k | grep VGA
> 00:06.1 VGA compatible controller: Loongson Technology LLC DC (Display 
> Controller) (rev 01)
> 07:00.0 VGA compatible controller: Advanced Micro Devices, Inc. 
> [AMD/ATI] Oland [Radeon HD 8570 / R5 430 OEM / R7 240/340 / Radeon 520 
> OEM] (rev 87)
>

Thanks a lot for feedback, please feed this back to Loongson UEFI firmware team.
Update the firmware, as this is not the right way to fix a bug.

When Loongson laptop or notebook is equipped with a Radeon GPU,
the integrated graphics will not be used. Besides don't has a
dedicated VRAM, it also don't has a external video transmitters.
Therefore, the integrate graphics are completely not usable.
Please disable it on such cases.


