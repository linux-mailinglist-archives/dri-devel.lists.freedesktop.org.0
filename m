Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C06626F9BA4
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 22:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8870A10E055;
	Sun,  7 May 2023 20:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1261910E055
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 20:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/5+6Tjo9iHoDRguVoioEqLYO8GUcbEel/OCxqjIHP74=; b=Cud1weoKijU+7aKQ4hKYVH3oaJ
 hCCXFk6NY8u7jOUlKNi6z/dQNs5hANNif+IU751mXrB5Npngx2bmBpWuAHYYEBbSbmE1advuuvjYm
 vutUnYgQ83IbdtHqwVoCitVV2CnvYw1mDVDkezb3yj8W6+kuGf1t6oy81gnJE2aQPkqUyNppLFB8C
 b8xWet9vAbD6jyDNzbgtxP2i8pJHBfxDmHzTxllL5KkzUGRbJjvAZZH/0Xr0qpjFlPHGIt51/PnYN
 D4Kgju6LW3mQbYzZ3TPaYOvWadJc1v2PmCIm2bovOmw41M44DJdwQw41r0GBMv0zwjWpmRWQny80g
 hme2HUMw==;
Received: from [38.44.72.37] (helo=[192.168.31.42])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pvlPD-003NK5-LZ; Sun, 07 May 2023 22:54:55 +0200
Message-ID: <40b667bc-0553-5c7f-11f0-dafb9d49ff1c@igalia.com>
Date: Sun, 7 May 2023 19:54:54 -0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH v4 0/6] drm/vkms: introduce plane rotation property
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
References: <20230418130525.128733-1-mcanal@igalia.com>
Content-Language: en-US
In-Reply-To: <20230418130525.128733-1-mcanal@igalia.com>
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

On 04/18, Maíra Canal wrote:
> This patchset implements all possible rotation value in vkms. All operations
> were implemented by software by changing the way the pixels are read. The way
> the blending is performed can be depicted as:
> 
> - rotate-0:
>     (x) ---->
>     ----------------------
> (y) |                    |
>   | |                    |
>   | |                    |
>   ˇ |                    |
>     ----------------------
> 
> - rotate-90:
>     <---- (y)
>     ----------------------
> (x) |                    |
>   | |                    |
>   | |                    |
>   ˇ |                    |
>     ----------------------
> 
> - rotate-180:
>     <---- (x)
>     ----------------------
> (y) |                    |
>   ^ |                    |
>   | |                    |
>   | |                    |
>     ----------------------
> 
> - rotate-270:
>     (y) ---->
>     ----------------------
> (x) |                    |
>   ^ |                    |
>   | |                    |
>   | |                    |
>     ----------------------
> 
> - reflect-x:
>     <---- (x)
>     ----------------------
> (y) |                    |
>   | |                    |
>   | |                    |
>   ˇ |                    |
>     ----------------------
> 
> - reflect-y:
>     (x) ---->
>     ----------------------
> (y) |                    |
>   ^ |                    |
>   | |                    |
>   | |                    |
>     ----------------------
> 
> The patchset was tested with IGT's kms_rotation_crc tests and also with some
> additional tests [1] for the reflection operations.
> 
> In order to avoid code duplication, I introduced a patch that isolates the
> pixel format convertion and wraps it in a single loop.
> 
> I tried to apply Ville's suggestion to avoid hand rolled coordinate
> calculation stuff. Although I couldn't apply all the code suggested by
> Ville, I was able to remove all the hardcoded code related to the x-offset.
> As VKMS' composition is performed by line, I still need to indicate the
> right pixel, which means that I still have some hardcoded code. Thanks for
> the suggestion, Ville! It really reduced the code complexity. 
> 
> v1 -> v2: https://lore.kernel.org/dri-devel/20230406130138.70752-1-mcanal@igalia.com/T/
> 
> * Add patch to isolate pixel format conversion (Arthur Grillo).
> 
> v2 -> v3: https://lore.kernel.org/dri-devel/20230414135151.75975-1-mcanal@igalia.com/T/
> 
> * Use cpp to calculate pixel size instead of hard-coding (Arthur Grillo).
> * Don't use the x coordinate in the pixel_read functions (Arthur Grillo).
> * Use drm_rotate_simplify() to avoid hard-coding rotate-180 (Ville Syrjälä).
> * Use u8* to input the src_pixels instead of using u16*.
> 
> v3 -> v4: https://lore.kernel.org/dri-devel/20230417121056.63917-1-mcanal@igalia.com/T/
> 
> * Create a original rectangle and a rotated rectangle and use the original
>   rectangle to offset the x-axis (Ville Syrjälä).
> 
> [1] https://patchwork.freedesktop.org/series/116025/

Hi Maíra,

Thanks for adding rotation properties to VKMS!
Overall, LGTM and this series is:

Reviewed-by: Melissa Wen <mwen@igalia.com>

As you already applied the first patch, not a big issue, but I see new
function documentation is missing. Could you send a follow-up patch
documenting "vkms_compose_row()"? Also, would be good to apply the same
improvement for the remaining conversion functions too.

Thanks,

Melissa

> 
> Best Regards,
> - Maíra Canal
> 
> Maíra Canal (6):
>   drm/vkms: isolate pixel conversion functionality
>   drm/vkms: add rotate-0 and reflect-x property
>   drm/vkms: add reflect-y and rotate-180 property
>   drm/vkms: add rotate-90 property
>   drm/vkms: add rotate-270 property
>   drm/vkms: drop "Rotation" TODO
> 
>  Documentation/gpu/vkms.rst           |   2 +-
>  drivers/gpu/drm/vkms/vkms_composer.c |  38 ++++++--
>  drivers/gpu/drm/vkms/vkms_drv.h      |   6 +-
>  drivers/gpu/drm/vkms/vkms_formats.c  | 139 +++++++++++++--------------
>  drivers/gpu/drm/vkms/vkms_formats.h  |   2 +-
>  drivers/gpu/drm/vkms/vkms_plane.c    |  16 ++-
>  6 files changed, 117 insertions(+), 86 deletions(-)
> 
> -- 
> 2.39.2
> 
