Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4EC6FB0DC
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 15:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCA910E27E;
	Mon,  8 May 2023 13:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C7D10E27E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 13:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vzdd3C53DM6ld5672V5kg7+c/idSC6CEnH3g770CXDY=; b=C9zQKCn8pxIlVb53aHdlhb4lDj
 M4Q47aMPzIA8KLJby5+WBvsEFkau/ngd56InTWLXQODf8uehFAL0Wob5D3ndQ0IgotLYv/vFVpLSF
 yhNLuzokeRWh9mOA1Bnf80JMtKnpzS9u1IZHdNkfWya3hM8tl28n1nU3DX4nP3PvTt/E68LIlGF4h
 EGsDqJqyJXc1bOFqACMCKVMAgcXs7LcJQwRymZfJvKY1Z/WCuH5iFYuDVO7y46mIpJsqXmrWR2MOA
 XVUJytG1yDDVvMFfJprXH+QhfF1m0klu6mkGa7ZFY97Xp1B4ByI5tSoJN9Set3i4W12tlYDfOcdV/
 YIgmQGww==;
Received: from [177.34.168.16] (helo=[192.168.0.4])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pw0Vf-003soO-PC; Mon, 08 May 2023 15:02:36 +0200
Message-ID: <8615a5ba-df5f-05df-fad3-95ab2f19776a@igalia.com>
Date: Mon, 8 May 2023 10:02:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 0/6] drm/vkms: introduce plane rotation property
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>
References: <20230418130525.128733-1-mcanal@igalia.com>
 <40b667bc-0553-5c7f-11f0-dafb9d49ff1c@igalia.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <40b667bc-0553-5c7f-11f0-dafb9d49ff1c@igalia.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org, Arthur Grillo <arthurgrillo@riseup.net>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/7/23 17:54, Melissa Wen wrote:
> On 04/18, Maíra Canal wrote:
>> This patchset implements all possible rotation value in vkms. All operations
>> were implemented by software by changing the way the pixels are read. The way
>> the blending is performed can be depicted as:
>>
>> - rotate-0:
>>     (x) ---->
>>     ----------------------
>> (y) |                    |
>>   | |                    |
>>   | |                    |
>>   ˇ |                    |
>>     ----------------------
>>
>> - rotate-90:
>>     <---- (y)
>>     ----------------------
>> (x) |                    |
>>   | |                    |
>>   | |                    |
>>   ˇ |                    |
>>     ----------------------
>>
>> - rotate-180:
>>     <---- (x)
>>     ----------------------
>> (y) |                    |
>>   ^ |                    |
>>   | |                    |
>>   | |                    |
>>     ----------------------
>>
>> - rotate-270:
>>     (y) ---->
>>     ----------------------
>> (x) |                    |
>>   ^ |                    |
>>   | |                    |
>>   | |                    |
>>     ----------------------
>>
>> - reflect-x:
>>     <---- (x)
>>     ----------------------
>> (y) |                    |
>>   | |                    |
>>   | |                    |
>>   ˇ |                    |
>>     ----------------------
>>
>> - reflect-y:
>>     (x) ---->
>>     ----------------------
>> (y) |                    |
>>   ^ |                    |
>>   | |                    |
>>   | |                    |
>>     ----------------------
>>
>> The patchset was tested with IGT's kms_rotation_crc tests and also with some
>> additional tests [1] for the reflection operations.
>>
>> In order to avoid code duplication, I introduced a patch that isolates the
>> pixel format convertion and wraps it in a single loop.
>>
>> I tried to apply Ville's suggestion to avoid hand rolled coordinate
>> calculation stuff. Although I couldn't apply all the code suggested by
>> Ville, I was able to remove all the hardcoded code related to the x-offset.
>> As VKMS' composition is performed by line, I still need to indicate the
>> right pixel, which means that I still have some hardcoded code. Thanks for
>> the suggestion, Ville! It really reduced the code complexity.
>> v1 -> v2: https://lore.kernel.org/dri-devel/20230406130138.70752-1-mcanal@igalia.com/T/
>>
>> * Add patch to isolate pixel format conversion (Arthur Grillo).
>>
>> v2 -> v3: https://lore.kernel.org/dri-devel/20230414135151.75975-1-mcanal@igalia.com/T/
>>
>> * Use cpp to calculate pixel size instead of hard-coding (Arthur Grillo).
>> * Don't use the x coordinate in the pixel_read functions (Arthur Grillo).
>> * Use drm_rotate_simplify() to avoid hard-coding rotate-180 (Ville Syrjälä).
>> * Use u8* to input the src_pixels instead of using u16*.
>>
>> v3 -> v4: https://lore.kernel.org/dri-devel/20230417121056.63917-1-mcanal@igalia.com/T/
>>
>> * Create a original rectangle and a rotated rectangle and use the original
>>   rectangle to offset the x-axis (Ville Syrjälä).
>>
>> [1] https://patchwork.freedesktop.org/series/116025/
> 
> Hi Maíra,
> 
> Thanks for adding rotation properties to VKMS!
> Overall, LGTM and this series is:
> 
> Reviewed-by: Melissa Wen <mwen@igalia.com>

Thanks for the review, Melissa! Applied to drm/drm-misc (drm-misc-next).

> 
> As you already applied the first patch, not a big issue, but I see new
> function documentation is missing. Could you send a follow-up patch
> documenting "vkms_compose_row()"? Also, would be good to apply the same
> improvement for the remaining conversion functions too.

I'll try to work on some follow-up patches ASAP.

Best Regards,
- Maíra Canal

> 
> Thanks,
> 
> Melissa
> 
>>
>> Best Regards,
>> - Maíra Canal
>>
>> Maíra Canal (6):
>>   drm/vkms: isolate pixel conversion functionality
>>   drm/vkms: add rotate-0 and reflect-x property
>>   drm/vkms: add reflect-y and rotate-180 property
>>   drm/vkms: add rotate-90 property
>>   drm/vkms: add rotate-270 property
>>   drm/vkms: drop "Rotation" TODO
>>
>>  Documentation/gpu/vkms.rst           |   2 +-
>>  drivers/gpu/drm/vkms/vkms_composer.c |  38 ++++++--
>>  drivers/gpu/drm/vkms/vkms_drv.h      |   6 +-
>>  drivers/gpu/drm/vkms/vkms_formats.c  | 139 +++++++++++++--------------
>>  drivers/gpu/drm/vkms/vkms_formats.h  |   2 +-
>>  drivers/gpu/drm/vkms/vkms_plane.c    |  16 ++-
>>  6 files changed, 117 insertions(+), 86 deletions(-)
>>
>> -- 
>> 2.39.2
>>
