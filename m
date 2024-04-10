Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC468A01D1
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 23:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0540F10E160;
	Wed, 10 Apr 2024 21:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="bN8ChonH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A4210EA45;
 Wed, 10 Apr 2024 15:39:13 +0000 (UTC)
Received: from [10.240.168.185] (unknown [178.176.73.225])
 by mail.ispras.ru (Postfix) with ESMTPSA id 841D74076735;
 Wed, 10 Apr 2024 15:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 841D74076735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1712763550;
 bh=xQKnhyAxfz2O94v4XYI3za4g+mMCNJTNwLCL1CPF8Ok=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bN8ChonH1inQLvXBDq36U8i+WC0O2pHHPJZfyfYM7wlLgdot/eojoCS4wURkL4Ebp
 tDwbqg7+qnK6nKWLjpgvGHTY22886SDRtiz2SjKSQ8nmLLU5VYHo63IP+yAbAKze0+
 4b2lbeBNkcT9LGmUJGit/D/YIpEXp+TIZ9uEcCI4=
Message-ID: <624ee851-162b-4490-8444-0d9e06b5863b@ispras.ru>
Date: Wed, 10 Apr 2024 18:39:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: nv04: Add check to avoid out of bounds access
To: Danilo Krummrich <me@dakr.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, Karol Herbst <kherbst@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Francisco Jerez <currojerez@riseup.net>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, Fedor Pchelkin <pchelkin@ispras.ru>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>
References: <20240331064552.6112-1-m.kobuk@ispras.ru>
 <c3253f8a-e654-4016-b0c6-d92703107c48@redhat.com>
 <11096e558e67f2fea2aee976c70a19af1b7c212b.camel@redhat.com>
 <03263130-0627-45c4-ab14-aa0e3b597442@dakr.org>
Content-Language: en-US
From: Mikhail Kobuk <m.kobuk@ispras.ru>
In-Reply-To: <03263130-0627-45c4-ab14-aa0e3b597442@dakr.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 10 Apr 2024 21:13:19 +0000
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

On 08/04/2024 16:23, Danilo Krummrich wrote:
> On 4/5/24 22:05, Lyude Paul wrote:
>> On Fri, 2024-04-05 at 17:53 +0200, Danilo Krummrich wrote:
>>> On 3/31/24 08:45, Mikhail Kobuk wrote:
>>>> Output Resource (dcb->or) value is not guaranteed to be non-zero
>>>> (i.e.
>>>> in drivers/gpu/drm/nouveau/nouveau_bios.c, in
>>>> 'fabricate_dcb_encoder_table()'
>>>> 'dcb->or' is assigned value '0' in call to
>>>> 'fabricate_dcb_output()').
>>>
>>> I don't really know much about the semantics of this code.
>>>
>>> Looking at fabricate_dcb_output() though I wonder if the intention
>>> was to assign
>>> BIT(or) to entry->or.
>>>
>>> @Lyude, can you help here?
>> 
>> This code is definitely a bit before my time as well - but I think
>> you're completely correct. Especially considering this bit I found in
>> nouveau_bios.h:
> 
> Thanks for confirming.
> 
> @Mikhail, I think we should rather fix this assignment then.

Thank you all for a thorough look!

> 
> - Danilo
> 
>> 
>> enum nouveau_or {
>> 	DCB_OUTPUT_A = (1 << 0),
>> 	DCB_OUTPUT_B = (1 << 1),
>> 	DCB_OUTPUT_C = (1 << 2)
>> };
>> 
>> 

Considering this code bit, and the fact that fabricate_dcb_output() is 
called in drivers/gpu/drm/nouveau/nouveau_bios.c only, there's option to 
adjust function calls instead of adding BIT(or), i.e.:

fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 0, all_heads, DCB_OUTPUT_B);

instead of current:

fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 0, all_heads, 1);

and etc.

Should I make a new patch with adjusted calls or stick with BIT(or)?

>>>
>>> Otherwise, for parsing the DCB entries, it seems that the bound
>>> checks are
>>> happening in olddcb_outp_foreach() [1].
>>>
>>> [1]
>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nouveau_bios.c#L1331
>>>
>>>>
>>>> Add check to validate 'dcb->or' before it's used.
>>>>
>>>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>>>
>>>> Fixes: 2e5702aff395 ("drm/nouveau: fabricate DCB encoder table for
>>>> iMac G4")
>>>> Signed-off-by: Mikhail Kobuk <m.kobuk@ispras.ru>
>>>> ---
>>>>    drivers/gpu/drm/nouveau/dispnv04/dac.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/nouveau/dispnv04/dac.c
>>>> b/drivers/gpu/drm/nouveau/dispnv04/dac.c
>>>> index d6b8e0cce2ac..0c8d4fc95ff3 100644
>>>> --- a/drivers/gpu/drm/nouveau/dispnv04/dac.c
>>>> +++ b/drivers/gpu/drm/nouveau/dispnv04/dac.c
>>>> @@ -428,7 +428,7 @@ void nv04_dac_update_dacclk(struct drm_encoder
>>>> *encoder, bool enable)
>>>>    	struct drm_device *dev = encoder->dev;
>>>>    	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
>>>>    
>>>> -	if (nv_gf4_disp_arch(dev)) {
>>>> +	if (nv_gf4_disp_arch(dev) && ffs(dcb->or)) {
>>>>    		uint32_t *dac_users = &nv04_display(dev)-
>>>>> dac_users[ffs(dcb->or) - 1];
>>>>    		int dacclk_off = NV_PRAMDAC_DACCLK +
>>>> nv04_dac_output_offset(encoder);
>>>>    		uint32_t dacclk = NVReadRAMDAC(dev, 0,
>>>> dacclk_off);
>>>> @@ -453,7 +453,7 @@ bool nv04_dac_in_use(struct drm_encoder
>>>> *encoder)
>>>>    	struct drm_device *dev = encoder->dev;
>>>>    	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
>>>>    
>>>> -	return nv_gf4_disp_arch(encoder->dev) &&
>>>> +	return nv_gf4_disp_arch(encoder->dev) && ffs(dcb->or) &&
>>>>    		(nv04_display(dev)->dac_users[ffs(dcb->or) - 1] &
>>>> ~(1 << dcb->index));
>>>>    }
>>>>    
>>>
>> 

