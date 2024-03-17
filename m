Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FD187E058
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 22:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC99A10E03C;
	Sun, 17 Mar 2024 21:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="q3Pazfd8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6A210E03C
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 21:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=spdhsreoGQYh5QziLgmG3lJveDp2POLjj7v3Ev7ShyQ=; b=q3Pazfd83vCX8KHmCezaVUG1vK
 xXJULLisfWgce4daq3jv6NolJJxdIDosMxzH43BHmUnAjXrg8HzBDh/dtZ8/6FNBi0hjQ73v8+iH6
 zToBpnwzquxv0e6FH3hGIRipUicj79zKE2Uxi/LssHRbd2YNzj+lyIcmNte/CBdu4jWIu4DvBxU/D
 iHzoMk5o4DYOyJK3/PgmSyaaGLMWGpOvh02J8bUI3XMKeTMUyZkrVvBZ/L9Z/Aj+8Mim3w1B4xVgJ
 Y/n8HMXl5rfBeZUKrKIzRULS7B3sqPNef0/R4lG467Pw160b5rBqOu6oMs6P7FjlrVqKrxw0VEBkj
 whdWL3vA==;
Received: from [177.34.169.255] (helo=[192.168.0.139])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rly2z-00Bk6n-AV; Sun, 17 Mar 2024 22:28:01 +0100
Message-ID: <d296d1b2-7dcd-4dd3-a15c-678e29836063@igalia.com>
Date: Sun, 17 Mar 2024 18:27:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: Fix drm_fixp2int_round() making it add 0.5
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, Arthur Grillo <arthurgrillo@riseup.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240316-drm_fixed-v2-1-c1bc2665b5ed@riseup.net>
 <7636b3tjifajvw63ux7xfjz4hjzhgjrf37mqgulneqzb7eukph@i6nnyietvxji>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <7636b3tjifajvw63ux7xfjz4hjzhgjrf37mqgulneqzb7eukph@i6nnyietvxji>
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

Hi Melissa,

On 3/17/24 14:50, Melissa Wen wrote:
> On 03/16, Arthur Grillo wrote:
>> As well noted by Pekka[1], the rounding of drm_fixp2int_round is wrong.
>> To round a number, you need to add 0.5 to the number and floor that,
>> drm_fixp2int_round() is adding 0.0000076. Make it add 0.5.
>>
>> [1]: https://lore.kernel.org/all/20240301135327.22efe0dd.pekka.paalanen@collabora.com/
>>
>> Fixes: 8b25320887d7 ("drm: Add fixed-point helper to get rounded integer values")
>> Suggested-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> 
> Great, thanks!
> 
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> 
> I'll apply to drm-misc-next.

Shouldn't this patch be applied in drm-misc-fixes?

Best Regards,
- Maíra

> 
> Melissa
> 
>> ---
>> Changes in v2:
>> - Add Fixes tag (Melissa Wen)
>> - Remove DRM_FIXED_POINT_HALF (Melissa Wen)
>> - Link to v1: https://lore.kernel.org/all/20240306-louis-vkms-conv-v1-1-5bfe7d129fdd@riseup.net/
>> ---
>>   include/drm/drm_fixed.h | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
>> index 0c9f917a4d4b..81572d32db0c 100644
>> --- a/include/drm/drm_fixed.h
>> +++ b/include/drm/drm_fixed.h
>> @@ -71,7 +71,6 @@ static inline u32 dfixed_div(fixed20_12 A, fixed20_12 B)
>>   }
>>   
>>   #define DRM_FIXED_POINT		32
>> -#define DRM_FIXED_POINT_HALF	16
>>   #define DRM_FIXED_ONE		(1ULL << DRM_FIXED_POINT)
>>   #define DRM_FIXED_DECIMAL_MASK	(DRM_FIXED_ONE - 1)
>>   #define DRM_FIXED_DIGITS_MASK	(~DRM_FIXED_DECIMAL_MASK)
>> @@ -90,7 +89,7 @@ static inline int drm_fixp2int(s64 a)
>>   
>>   static inline int drm_fixp2int_round(s64 a)
>>   {
>> -	return drm_fixp2int(a + (1 << (DRM_FIXED_POINT_HALF - 1)));
>> +	return drm_fixp2int(a + DRM_FIXED_ONE / 2);
>>   }
>>   
>>   static inline int drm_fixp2int_ceil(s64 a)
>>
>> ---
>> base-commit: f89632a9e5fa6c4787c14458cd42a9ef42025434
>> change-id: 20240315-drm_fixed-c680ba078ecb
>>
>> Best regards,
>> -- 
>> Arthur Grillo <arthurgrillo@riseup.net>
>>
