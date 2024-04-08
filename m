Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FB189C1B4
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 15:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6463D1125B5;
	Mon,  8 Apr 2024 13:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hs01.dakr.org (hs01.dk-develop.de [173.249.23.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040961125B3;
 Mon,  8 Apr 2024 13:23:11 +0000 (UTC)
Message-ID: <03263130-0627-45c4-ab14-aa0e3b597442@dakr.org>
Date: Mon, 8 Apr 2024 15:23:01 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm: nv04: Add check to avoid out of bounds access
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 Mikhail Kobuk <m.kobuk@ispras.ru>, Karol Herbst <kherbst@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Francisco Jerez <currojerez@riseup.net>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, Fedor Pchelkin <pchelkin@ispras.ru>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>
References: <20240331064552.6112-1-m.kobuk@ispras.ru>
 <c3253f8a-e654-4016-b0c6-d92703107c48@redhat.com>
 <11096e558e67f2fea2aee976c70a19af1b7c212b.camel@redhat.com>
Content-Language: en-US
From: Danilo Krummrich <me@dakr.org>
In-Reply-To: <11096e558e67f2fea2aee976c70a19af1b7c212b.camel@redhat.com>
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

On 4/5/24 22:05, Lyude Paul wrote:
> On Fri, 2024-04-05 at 17:53 +0200, Danilo Krummrich wrote:
>> On 3/31/24 08:45, Mikhail Kobuk wrote:
>>> Output Resource (dcb->or) value is not guaranteed to be non-zero
>>> (i.e.
>>> in drivers/gpu/drm/nouveau/nouveau_bios.c, in
>>> 'fabricate_dcb_encoder_table()'
>>> 'dcb->or' is assigned value '0' in call to
>>> 'fabricate_dcb_output()').
>>
>> I don't really know much about the semantics of this code.
>>
>> Looking at fabricate_dcb_output() though I wonder if the intention
>> was to assign
>> BIT(or) to entry->or.
>>
>> @Lyude, can you help here?
> 
> This code is definitely a bit before my time as well - but I think
> you're completely correct. Especially considering this bit I found in
> nouveau_bios.h:

Thanks for confirming.

@Mikhail, I think we should rather fix this assignment then.

- Danilo

> 
> enum nouveau_or {
> 	DCB_OUTPUT_A = (1 << 0),
> 	DCB_OUTPUT_B = (1 << 1),
> 	DCB_OUTPUT_C = (1 << 2)
> };
> 
> 
>>
>> Otherwise, for parsing the DCB entries, it seems that the bound
>> checks are
>> happening in olddcb_outp_foreach() [1].
>>
>> [1]
>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nouveau_bios.c#L1331
>>
>>>
>>> Add check to validate 'dcb->or' before it's used.
>>>
>>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>>
>>> Fixes: 2e5702aff395 ("drm/nouveau: fabricate DCB encoder table for
>>> iMac G4")
>>> Signed-off-by: Mikhail Kobuk <m.kobuk@ispras.ru>
>>> ---
>>>    drivers/gpu/drm/nouveau/dispnv04/dac.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/dispnv04/dac.c
>>> b/drivers/gpu/drm/nouveau/dispnv04/dac.c
>>> index d6b8e0cce2ac..0c8d4fc95ff3 100644
>>> --- a/drivers/gpu/drm/nouveau/dispnv04/dac.c
>>> +++ b/drivers/gpu/drm/nouveau/dispnv04/dac.c
>>> @@ -428,7 +428,7 @@ void nv04_dac_update_dacclk(struct drm_encoder
>>> *encoder, bool enable)
>>>    	struct drm_device *dev = encoder->dev;
>>>    	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
>>>    
>>> -	if (nv_gf4_disp_arch(dev)) {
>>> +	if (nv_gf4_disp_arch(dev) && ffs(dcb->or)) {
>>>    		uint32_t *dac_users = &nv04_display(dev)-
>>>> dac_users[ffs(dcb->or) - 1];
>>>    		int dacclk_off = NV_PRAMDAC_DACCLK +
>>> nv04_dac_output_offset(encoder);
>>>    		uint32_t dacclk = NVReadRAMDAC(dev, 0,
>>> dacclk_off);
>>> @@ -453,7 +453,7 @@ bool nv04_dac_in_use(struct drm_encoder
>>> *encoder)
>>>    	struct drm_device *dev = encoder->dev;
>>>    	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
>>>    
>>> -	return nv_gf4_disp_arch(encoder->dev) &&
>>> +	return nv_gf4_disp_arch(encoder->dev) && ffs(dcb->or) &&
>>>    		(nv04_display(dev)->dac_users[ffs(dcb->or) - 1] &
>>> ~(1 << dcb->index));
>>>    }
>>>    
>>
> 
