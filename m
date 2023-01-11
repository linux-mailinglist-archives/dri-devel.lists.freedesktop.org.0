Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E40665E01
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 15:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5060F10E74C;
	Wed, 11 Jan 2023 14:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9280810E74C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 14:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M+dBT6p4zVwjXU4/RV1if3xmV/QAQBs00Hk9M0Si6Ak=; b=f1j8GXC9FJFcx+e1ScNLHB5UVb
 8orKNHu5z5onrOjmK27T7cHIOrspam9bSaHlYdogja0BR79sWoizujYATTzzIswGNX4imY0Pock3n
 04yq7RwzeiS5Lni1qRAKR4yGs36TVFoM7mCZpW9c2I4k4qgCw6ITu9q0jWCOsmivKV/dU4CJmNQiR
 WCeL2CsI4AnAboS0bzYEQolszBjAvMxrnumskRu8b7hykmIPbCJO59n/fiMTKVifoRiqDrRpwRyvd
 5GBX5AUb624U7/UXnjVetFqEabCpJcncN6dRIGXqPPZwprsvczYNUGR7mSn3qDKDiK7GLbPszjJcU
 xwFPY1CA==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pFc9p-005M9y-M0; Wed, 11 Jan 2023 15:32:49 +0100
Message-ID: <61439c1b-fd08-0942-8fcf-d3f24623d8e6@igalia.com>
Date: Wed, 11 Jan 2023 11:32:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/vc4: Check for valid formats
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20230102135757.262676-1-mcanal@igalia.com>
 <a4d642d8-5556-7efb-308f-ab5f9c7284b0@suse.de> <Y765bF+c2y5b22P4@intel.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <Y765bF+c2y5b22P4@intel.com>
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
Cc: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/11/23 10:28, Ville Syrjälä wrote:
> On Mon, Jan 02, 2023 at 03:20:06PM +0100, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 02.01.23 um 14:57 schrieb Maíra Canal:
>>> Currently, vc4 is not checking valid formats before creating a
>>> framebuffer, which is triggering the IGT test
>>> igt@kms_addfb_basic@addfb25-bad-modifier to fail, as vc4 accepts
>>> to create a framebuffer with an invalid modifier. Therefore, check
>>> for valid formats before creating framebuffers on vc4 and vc5 in
>>> order to avoid creating framebuffers with invalid formats.
>>>
>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>>> ---
>>>    drivers/gpu/drm/vc4/vc4_kms.c | 23 ++++++++++++++++++++++-
>>>    1 file changed, 22 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
>>> index 53d9f30460cf..5d1afd66fcc1 100644
>>> --- a/drivers/gpu/drm/vc4/vc4_kms.c
>>> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
>>> @@ -500,6 +500,27 @@ static struct drm_framebuffer *vc4_fb_create(struct drm_device *dev,
>>> 		mode_cmd = &mode_cmd_local;
>>> 	}
>>>
>>> +	if (!drm_any_plane_has_format(dev, mode_cmd->pixel_format,
>>> +				      mode_cmd->modifier[0])) {
>>> +		drm_dbg_kms(dev, "Unsupported pixel format %p4cc / modifier 0x%llx\n",
>>> +			    &mode_cmd->pixel_format, mode_cmd->modifier[0]);
>>> +		return ERR_PTR(-EINVAL);
>>> +	}
>>
>> This might be a stupid question, but why doesn't drm_fbgem_fb_create()
>> do this test already? It seems like a no-brainer and *not* testing for
>> the plane formats should be the exception.
> 
> That was the approach I tried originally but there were a bunch of
> problems with various drivers it at the time. Dunno if all of those
> got sorted out or not. IIRC the idea floating around for ancient
> drivers was to skip the check based on plane->format_default. Looks
> like we're already using that approach in the setcrtc ioctl.
> 

I ended up following Thomas's idea to check drm_drv_uses_atomic_modesetting()
in order to check the modifier only for atomic drivers. If you have any feedback
on this idea, I would be glad to hear it. The current version of this patch is [1].

[1] https://lore.kernel.org/dri-devel/20230109105807.18172-1-mcanal@igalia.com/T/

Best Regards,
- Maíra Canal
