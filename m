Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B0A87DA0C
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 12:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C965510E9F8;
	Sat, 16 Mar 2024 11:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="f64dPdfa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CB510E9F8
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 11:59:52 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4Txfn31qT3z9vDX;
 Sat, 16 Mar 2024 11:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1710590391; bh=WQmxlTwntkNSsllxZyg/C1a/cT0ISfU7jYv4Gvy4DNg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=f64dPdfaX8zGoyN4b9rG4CEgoLbOj3lPAZkAPG7E0t67dZoFJkjm5J3cT6tgbIKQ9
 gXM+AK3QTLvRv6WAx5a3Q/93n/+uH7tp9c+yzfyIka6lfkSJoYEN31v/szESXHoMK6
 10LDCYhAvPFNsFVqv9VzzRgzlbfZrPlt4MDgyymI=
X-Riseup-User-ID: 6C74F281042F65B51CCBE0B3DA10EC412235F4C595D00882D3E048DA1DED345E
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Txfmv1rZqzFtSW;
 Sat, 16 Mar 2024 11:59:42 +0000 (UTC)
Message-ID: <2aa81b6b-0eb1-46d6-8e36-3bd43b8961c4@riseup.net>
Date: Sat, 16 Mar 2024 08:59:40 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] drm: Fix drm_fixp2int_round() making it add 0.5
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>
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
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <yyrvbqpmqplwtqfdsjkhzmx7wrk4h67kn5443bdou7c7uciouy@hac7zfxiff7t>
Content-Type: text/plain; charset=UTF-8
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



On 12/03/24 15:27, Melissa Wen wrote:
> On 03/06, Arthur Grillo wrote:
>> As well noted by Pekka[1], the rounding of drm_fixp2int_round is wrong.
>> To round a number, you need to add 0.5 to the number and floor that,
>> drm_fixp2int_round() is adding 0.0000076. Make it add 0.5.
>>
>> [1]: https://lore.kernel.org/all/20240301135327.22efe0dd.pekka.paalanen@collabora.com/
>>
> Hi Arthur,
> 
> thanks for addressing this issue.
> 
> Please, add a fix tag to the commit that you are fixing, so we can
> easily backport. Might be this commit:
> https://cgit.freedesktop.org/drm/drm-misc/commit/drivers/gpu/drm/vkms?id=ab87f558dcfb2562c3497e89600dec798a446665

Wouldn't be this commit instead?
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8b25320887d7feac98875546ea0f521628b745bb

Best Regards,
~Arthur Grillo


>> Suggested-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
>> ---
>>  include/drm/drm_fixed.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
>> index 0c9f917a4d4b..de3a79909ac9 100644
>> --- a/include/drm/drm_fixed.h
>> +++ b/include/drm/drm_fixed.h
>> @@ -90,7 +90,7 @@ static inline int drm_fixp2int(s64 a)
>>  
>>  static inline int drm_fixp2int_round(s64 a)
>>  {
>> -	return drm_fixp2int(a + (1 << (DRM_FIXED_POINT_HALF - 1)));
> Also, this is the only usage of DRM_FIXED_POINT_HALF. Can you also
> remove it as it won't be used anymore?
> 
>> +	return drm_fixp2int(a + DRM_FIXED_ONE / 2);
> Would this division be equivalent to just shifting 1ULL by 31 instead of
> 32 as done in DRM_FIXED_ONE?
> 
> Melissa
> 
>>  }
>>  
>>  static inline int drm_fixp2int_ceil(s64 a)
>>
>> -- 
>> 2.43.0
>>
