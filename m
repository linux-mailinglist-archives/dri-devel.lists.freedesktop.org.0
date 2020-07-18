Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727C4224854
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jul 2020 05:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105896E185;
	Sat, 18 Jul 2020 03:43:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C5E6E185;
 Sat, 18 Jul 2020 03:43:31 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f126f6e0000>; Fri, 17 Jul 2020 20:41:34 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 17 Jul 2020 20:43:31 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 17 Jul 2020 20:43:31 -0700
Received: from [172.20.40.65] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 18 Jul
 2020 03:43:30 +0000
Subject: Re: [PATCH] drm/nouveau: Accept 'legacy' format modifiers
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200717185757.2786-1-jajones@nvidia.com>
 <20200717194751.GS3278063@phenom.ffwll.local>
X-Nvconfidentiality: public
From: James Jones <jajones@nvidia.com>
Message-ID: <279b4b06-3f1e-9a5d-6bd8-c2518629bee1@nvidia.com>
Date: Fri, 17 Jul 2020 20:43:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717194751.GS3278063@phenom.ffwll.local>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595043694; bh=kbFgpJluXgkOW5if3XG8oeyt100Ly6TttuzLtSbxh5g=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=VWX1O0RPJm5qwP68y93lv34RPz9HEghRGbAC6CD4KtwAsgBx5tBqyc51fxbMxrYVq
 drtR/4uDAAFB0OE5eGCmY0IrXVnJSIuRInc3hA/HHwoAEHxJrQd2FMb6HB5+FrQTQw
 0abybKYA39PI0QM9ZFL98j/APPavCKkWEaLcpE7H+aniw3ZvcN52XPU3wZjSWbUNS1
 6N641TkghvzZVJGa7wV0jdW5tfnP4CR3r7jOWDiuXEidA9Vmwi3rEB7TJf2Pd4h7nY
 cssCICkZm5QgoT+JyIWv4cg++equ5uVZukCZMmmOgYxfaoA6RbOBdwNaEE3x2tJp+p
 A1Ig4r9mo7ifw==
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
Cc: Nouveau <nouveau@lists.freedesktop.org>,
 "Kirill A . Shutemov" <kirill@shutemov.name>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/17/20 12:47 PM, Daniel Vetter wrote:
> On Fri, Jul 17, 2020 at 11:57:57AM -0700, James Jones wrote:
>> Accept the DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK()
>> family of modifiers to handle broken userspace
>> Xorg modesetting and Mesa drivers.
>>
>> Tested with Xorg 1.20 modesetting driver,
>> weston@c46c70dac84a4b3030cd05b380f9f410536690fc,
>> gnome & KDE wayland desktops from Ubuntu 18.04,
>> and sway 1.5
> 
> Just bikeshed, but maybe a few more words on what exactly is broken and
> how this works around it. Specifically why we only accept these, but don't
> advertise them.

Added quite a few words.

>>
>> Signed-off-by: James Jones <jajones@nvidia.com>
> 
> Needs Fixes: line here. Also nice to mention the bug reporter/link.

Done in v2.

>> ---
>>   drivers/gpu/drm/nouveau/nouveau_display.c | 26 +++++++++++++++++++++--
>>   1 file changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
>> index 496c4621cc78..31543086254b 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
>> @@ -191,8 +191,14 @@ nouveau_decode_mod(struct nouveau_drm *drm,
>>   		   uint32_t *tile_mode,
>>   		   uint8_t *kind)
>>   {
>> +	struct nouveau_display *disp = nouveau_display(drm->dev);
>>   	BUG_ON(!tile_mode || !kind);
>>   
>> +	if ((modifier & (0xffull << 12)) == 0ull) {
>> +		/* Legacy modifier.  Translate to this device's 'kind.' */
>> +		modifier |= disp->format_modifiers[0] & (0xffull << 12);
>> +	}
> 
> Hm I tried to understand what this magic does by looking at drm_fourcc.h,
> but the drm_fourcc_canonicalize_nvidia_format_mod() in there implements
> something else. Is that function wrong, or should we use it here instead?
>
 > Or is there something else going on entirely?

This may be slightly clearer with the expanded change description:

Canonicalize assumes the old modifiers are only used by certain Tegra 
revisions, because the Mesa patches were supposed to land and obliterate 
all uses beyond that.  That assumption means it can assume the specific 
page kind (0xfe) used by the display-engine-compatible layout on those 
specific devices.  There is no way to generally canonicalize a legacy 
modifier without referencing a specific device type, as is indirectly 
done here.

This code does a limited device-specific canonicalization: It 
substitutes the display-appropriate page kind used by this specific 
device, ensuring we derive this correct page kind later in the function. 
  I iterated on the best way to accomplish this a few times, and this 
was the least-invasive thing I came up with, but it does require a 
pretty thorough understanding of the NVIDIA modifier macros.

Thanks for the quick review.

-James

> 
> Cheers, Daniel
> 
>> +
>>   	if (modifier == DRM_FORMAT_MOD_LINEAR) {
>>   		/* tile_mode will not be used in this case */
>>   		*tile_mode = 0;
>> @@ -227,6 +233,16 @@ nouveau_framebuffer_get_layout(struct drm_framebuffer *fb,
>>   	}
>>   }
>>   
>> +static const u64 legacy_modifiers[] = {
>> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0),
>> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1),
>> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2),
>> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3),
>> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4),
>> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5),
>> +	DRM_FORMAT_MOD_INVALID
>> +};
>> +
>>   static int
>>   nouveau_validate_decode_mod(struct nouveau_drm *drm,
>>   			    uint64_t modifier,
>> @@ -247,8 +263,14 @@ nouveau_validate_decode_mod(struct nouveau_drm *drm,
>>   	     (disp->format_modifiers[mod] != modifier);
>>   	     mod++);
>>   
>> -	if (disp->format_modifiers[mod] == DRM_FORMAT_MOD_INVALID)
>> -		return -EINVAL;
>> +	if (disp->format_modifiers[mod] == DRM_FORMAT_MOD_INVALID) {
>> +		for (mod = 0;
>> +		     (legacy_modifiers[mod] != DRM_FORMAT_MOD_INVALID) &&
>> +		     (legacy_modifiers[mod] != modifier);
>> +		     mod++);
>> +		if (legacy_modifiers[mod] == DRM_FORMAT_MOD_INVALID)
>> +			return -EINVAL;
>> +	}
>>   
>>   	nouveau_decode_mod(drm, modifier, tile_mode, kind);
>>   
>> -- 
>> 2.17.1
>>
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
