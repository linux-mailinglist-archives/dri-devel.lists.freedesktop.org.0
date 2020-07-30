Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83688233C5A
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 01:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874556E97D;
	Thu, 30 Jul 2020 23:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2496E97A;
 Thu, 30 Jul 2020 23:59:17 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f235ea70000>; Thu, 30 Jul 2020 16:58:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 30 Jul 2020 16:59:17 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 30 Jul 2020 16:59:17 -0700
Received: from [172.20.40.56] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jul
 2020 23:59:16 +0000
Subject: Re: [PATCH v3] drm/nouveau: Accept 'legacy' format modifiers
To: "Kirill A. Shutemov" <kirill@shutemov.name>
References: <20200730172617.4158-1-jajones@nvidia.com>
 <20200730221937.kcy7synseuedn6qf@box>
From: James Jones <jajones@nvidia.com>
Message-ID: <2a50af62-51c6-6da6-e14e-7c1da80bf47e@nvidia.com>
Date: Thu, 30 Jul 2020 16:59:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200730221937.kcy7synseuedn6qf@box>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1596153511; bh=Z+sBrbUNSH9qO+Hz3gqi4MOEb4zm35ucgzAdAaH1mzg=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=RZnwRDqNYgU5v+18QThKCwixdJT8F/+PDJ5R2aVmeT8xdtqgdqlARNzlOhCUycLcP
 bUtZClpKlYyRs/1RuWcuot3M3fJdxiVCV2r319Yvzs5cZyiDCx/kZ9n7Vd7canrsgh
 kjdJ0d1q2hJUycD/1mehJXSCZPLPZHDPeQgLvuV6Q71isgeUZuTqUSvY5NnWPJKJiL
 lYUncKgBYi+cEuGG4AlfN4LwxktvpTVyRgN079sT3RRoFdDXBYmEDINtfb6AfeTc+4
 r4G4QK08Q1ugsrIszRWzIUyPr9rsCxzIHXuhE7MZV62ZIwdtjrEqlcinD6fvoPL93T
 Aqdtymsr2/dHw==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nouveau <nouveau@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/30/20 3:19 PM, Kirill A. Shutemov wrote:
> On Thu, Jul 30, 2020 at 10:26:17AM -0700, James Jones wrote:
>> Accept the DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK()
>> family of modifiers to handle broken userspace
>> Xorg modesetting and Mesa drivers. Existing Mesa
>> drivers are still aware of only these older
>> format modifiers which do not differentiate
>> between different variations of the block linear
>> layout. When the format modifier support flag was
>> flipped in the nouveau kernel driver, the X.org
>> modesetting driver began attempting to use its
>> format modifier-enabled framebuffer path. Because
>> the set of format modifiers advertised by the
>> kernel prior to this change do not intersect with
>> the set of format modifiers advertised by Mesa,
>> allocating GBM buffers using format modifiers
>> fails and the modesetting driver falls back to
>> non-modifier allocation. However, it still later
>> queries the modifier of the GBM buffer when
>> creating its DRM-KMS framebuffer object, receives
>> the old-format modifier from Mesa, and attempts
>> to create a framebuffer with it. Since the kernel
>> is still not aware of these formats, this fails.
>>
>> Userspace should not be attempting to query format
>> modifiers of GBM buffers allocated with a non-
>> format-modifier-aware allocation path, but to
>> avoid breaking existing userspace behavior, this
>> change accepts the old-style format modifiers when
>> creating framebuffers and applying them to planes
>> by translating them to the equivalent new-style
>> modifier. To accomplish this, some layout
>> parameters must be assumed to match properties of
>> the device targeted by the relevant ioctls. To
>> avoid perpetuating misuse of the old-style
>> modifiers, this change does not advertise support
>> for them. Doing so would imply compatibility
>> between devices with incompatible memory layouts.
>>
>> Tested with Xorg 1.20 modesetting driver,
>> weston@c46c70dac84a4b3030cd05b380f9f410536690fc,
>> gnome & KDE wayland desktops from Ubuntu 18.04,
>> kmscube hacked to use linear mod, and sway 1.5
>>
>> Reported-by: Kirill A. Shutemov <kirill@shutemov.name>
>> Fixes: fa4f4c213f5f ("drm/nouveau/kms: Support NVIDIA format modifiers")
>> Link: https://lkml.org/lkml/2020/6/30/1251
>> Signed-off-by: James Jones <jajones@nvidia.com>
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
>> +
>>   	if (modifier == DRM_FORMAT_MOD_LINEAR) {
>>   		/* tile_mode will not be used in this case */
>>   		*tile_mode = 0;
> 
> Em. I thought Ben's suggestion was to move it under != MOD_LINEAR. I don't
> see it here.

Yes, it looks like I forgot to commit before generating the patch.  v4 sent.

Thanks,
-James

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
