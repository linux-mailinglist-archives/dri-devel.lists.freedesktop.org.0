Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BBD885606
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 09:48:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BDC10E208;
	Thu, 21 Mar 2024 08:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ZkzYRtUP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com
 [91.218.175.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E6810E208
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 08:48:24 +0000 (UTC)
Message-ID: <b52c0030-77ef-4bc2-8ad4-a6acf54fbd5d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1711010901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3QHevvqX2GZ5SYb5pWqxmmcJcol9SWMBMH87Ea+Vsek=;
 b=ZkzYRtUPmbgqYktl26mn3v+K4YokW47QzlwxSf8zuZCkil93ZgOcnsziK1i7v4ccQewY0K
 A+UZbpcL/nSXjerEtN4oYeix8eYK/3y2X8sz1CBk2G/N8+/j9ExrFQQOoOjTjw8HuFYiY9
 fycO0QJzweomqoVWnnPjsUrNHWQe528=
Date: Thu, 21 Mar 2024 16:48:06 +0800
MIME-Version: 1.0
Subject: Re: [v5,06/13] drm/ast: Rename struct ast_i2c_chan to struct ast_ddc
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240320093738.6341-7-tzimmermann@suse.de>
 <39eeaa47-28af-462d-aa4d-4fddb3d47b4a@linux.dev>
 <08e70629-72aa-4102-955c-dc531ca5589d@suse.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <08e70629-72aa-4102-955c-dc531ca5589d@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2024/3/21 16:13, Thomas Zimmermann wrote:
> Hi
>
> Am 20.03.24 um 18:32 schrieb Sui Jingfeng:
>> Hi,
>>
>>
>> On 2024/3/20 17:34, Thomas Zimmermann wrote:
>>> The struct struct ast_i2c_chan represents the Display Data Channel
>>> (DDC); I2C is the underlying bus. Rename the structure, the variables
>>> and the helper ast_i2c_create() to ddc-like terms. No functional
>>> changes.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>>
>> Personally, I think _i2c_ is better name than _ddc_. Because It seems 
>> that
>> the Display Data Channel is comes from VESA standard, while aspeed 
>> I2C can
>> be used to configure the external display bridges(encoder). So _i2c_ 
>> is a
>> *abstract* name, and can be utilized to do something else beyond the DDC
>> itself.
>
> This specific instance of i2c is for DDC; even the AST manual refers 
> to it as DDC. I don't think there's anything else we could do with 
> those registers. If we have other uses for i2c, we can easily add them 
> in separate code.
>
>>
>>
>> Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
>
> Thanks for reviewing the series. I think the new helper in patch 12 
> could be useful for loongson [1][2] as well.
>

Yes, after this series landed. I'm going to post a few patch to remove some boilerplate.
I want to follow as well, but need a period of time. I have tested the whole series with
ast 2600 dGPU, the /sys/class/.../status will reflect the physical hut-plug status.


> Best regards
> Thomas
>
> [1] 
> https://elixir.bootlin.com/linux/v6.8/source/drivers/gpu/drm/loongson/lsdc_output_7a1000.c#L80
> [2] 
> https://elixir.bootlin.com/linux/v6.8/source/drivers/gpu/drm/loongson/lsdc_output_7a2000.c#L177
>

-- 
Best regards,
Sui

