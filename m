Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E4887DA6B
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 15:11:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0B210ED0E;
	Sat, 16 Mar 2024 14:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FLN/sEIB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8940010ED0E
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 14:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KdHqSaYihPn5FB720GQj2s6e6OT+vaWHkLMQ10Tlf5U=; b=FLN/sEIBe7DtAcqD80jbTa/MT+
 2oM1hX2RwwJjw5gcYnjVhh5yIZDVgI11ghnTr7zL+JIhiXSNKoIr86u5BqKmhJcAcyKqq7+D9JU2D
 7s5Ls3iebh+Qzz1v6OkepMpkONJeFzJwiRShTA2LeV3xbBeMJUMaZak5Kc6QMuEcVE1hGKMVUcZW2
 JxHKBIk67H24X4zvSa3Wr60cl6Qj+HGDTEBks18y+zIoRBeTlVsqwDvrhV1Ue7VtNUbS8OMgzwaVv
 8RBH8yON97dmuyvIu6H9fpqiNbL9XnkkKcCukMdnVocYMKwVq13XjSeQ8lJGP1SqikDeUjRucrFFM
 YaWzYkug==;
Received: from [189.6.17.125] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rlUkH-00BGTR-2S; Sat, 16 Mar 2024 15:10:45 +0100
Message-ID: <1950f7fb-d326-4074-ba7c-8c5622eebb2e@igalia.com>
Date: Sat, 16 Mar 2024 11:10:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm: Fix drm_fixp2int_round() making it add 0.5
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, Louis Chauvet <louis.chauvet@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com, Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20240306-louis-vkms-conv-v1-0-5bfe7d129fdd@riseup.net>
 <20240306-louis-vkms-conv-v1-1-5bfe7d129fdd@riseup.net>
 <yyrvbqpmqplwtqfdsjkhzmx7wrk4h67kn5443bdou7c7uciouy@hac7zfxiff7t>
 <2aa81b6b-0eb1-46d6-8e36-3bd43b8961c4@riseup.net>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <2aa81b6b-0eb1-46d6-8e36-3bd43b8961c4@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 16/03/2024 08:59, Arthur Grillo wrote:
>
> On 12/03/24 15:27, Melissa Wen wrote:
>> On 03/06, Arthur Grillo wrote:
>>> As well noted by Pekka[1], the rounding of drm_fixp2int_round is wrong.
>>> To round a number, you need to add 0.5 to the number and floor that,
>>> drm_fixp2int_round() is adding 0.0000076. Make it add 0.5.
>>>
>>> [1]: https://lore.kernel.org/all/20240301135327.22efe0dd.pekka.paalanen@collabora.com/
>>>
>> Hi Arthur,
>>
>> thanks for addressing this issue.
>>
>> Please, add a fix tag to the commit that you are fixing, so we can
>> easily backport. Might be this commit:
>> https://cgit.freedesktop.org/drm/drm-misc/commit/drivers/gpu/drm/vkms?id=ab87f558dcfb2562c3497e89600dec798a446665
> Wouldn't be this commit instead?
> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8b25320887d7feac98875546ea0f521628b745bb
Yes, you're right!

Melissa
>
> Best Regards,
> ~Arthur Grillo
>
>
>>> Suggested-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
>>> ---
>>>   include/drm/drm_fixed.h | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
>>> index 0c9f917a4d4b..de3a79909ac9 100644
>>> --- a/include/drm/drm_fixed.h
>>> +++ b/include/drm/drm_fixed.h
>>> @@ -90,7 +90,7 @@ static inline int drm_fixp2int(s64 a)
>>>   
>>>   static inline int drm_fixp2int_round(s64 a)
>>>   {
>>> -	return drm_fixp2int(a + (1 << (DRM_FIXED_POINT_HALF - 1)));
>> Also, this is the only usage of DRM_FIXED_POINT_HALF. Can you also
>> remove it as it won't be used anymore?
>>
>>> +	return drm_fixp2int(a + DRM_FIXED_ONE / 2);
>> Would this division be equivalent to just shifting 1ULL by 31 instead of
>> 32 as done in DRM_FIXED_ONE?
>>
>> Melissa
>>
>>>   }
>>>   
>>>   static inline int drm_fixp2int_ceil(s64 a)
>>>
>>> -- 
>>> 2.43.0
>>>

