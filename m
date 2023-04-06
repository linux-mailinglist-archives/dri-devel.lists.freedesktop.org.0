Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 311946D9512
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 13:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D0E10EB67;
	Thu,  6 Apr 2023 11:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC9E10EB67
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 11:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j9zgix9Ki2wowJU7zS2d04njTU8sE2RfJgO5J+edVo8=; b=WzfJ0ptJMnAmUN+UGQvsNO51HC
 lnSwYG/XnDXAvnfQEgOKcFoQTrivuJDC/kLPqhs6AdhGoNGDSE4XOgvt1ZW0/aAqGPeK+HmxrmwGU
 dOQ7ZeENg2TapBT9f7lVZR7BIq7cJ48pknDqm1/5+lS+z2NGluLmjvir8DHEeauwZ59TDS+SrVLQD
 vU9WXn8dpXRjN9Ey68yx7jPju6bOIr6uCLMobjPlZ/oKh9HhgsB07eSFwF+41CuciBg4w71aLX1lA
 zNcTrIylt2egc1wLV6YtwjwDSpvekd72mKCSYXl9jRmCbJfMULISS6fPNFc9PLRYkts47yJ6DerSq
 zw9sjv6Q==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pkNlf-007zxn-2F; Thu, 06 Apr 2023 13:27:03 +0200
Message-ID: <accdc804-19e7-df59-7dd3-69c83f52405d@igalia.com>
Date: Thu, 6 Apr 2023 08:26:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] drm/vkms: Drop vkms_connector_destroy() wrapper
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Marius Vlad <marius.vlad@collabora.com>, David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20230406110235.3092055-1-javierm@redhat.com>
 <20230406110235.3092055-2-javierm@redhat.com>
 <ZC6o4l7tzSIwFTKw@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <ZC6o4l7tzSIwFTKw@phenom.ffwll.local>
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

On 4/6/23 08:11, Daniel Vetter wrote:
> On Thu, Apr 06, 2023 at 01:02:34PM +0200, Javier Martinez Canillas wrote:
>> This helper is just a wrapper that calls drm_connector_cleanup(), there's
>> no need to have another level of indirection.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> On both patches:
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Aside, would be a nice cleanup to move vkms output stuff (crtc and
> connector) over to the drmm_ stuff. The plane already does that.

I sent a patch [1] a while ago moving the CRTC to the drmm_ functions.
If you could take a look at it, it would be great.

[1] https://lore.kernel.org/dri-devel/20230116205800.1266227-1-mcanal@igalia.com/T/

Best Regards,
- Maíra Canal

> 
> That should also simplify the multi-output work.
> -Daniel
> 
>> ---
>>
>>   drivers/gpu/drm/vkms/vkms_output.c | 7 +------
>>   1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
>> index 991857125bb4..4de6f8ae38be 100644
>> --- a/drivers/gpu/drm/vkms/vkms_output.c
>> +++ b/drivers/gpu/drm/vkms/vkms_output.c
>> @@ -6,14 +6,9 @@
>>   #include <drm/drm_probe_helper.h>
>>   #include <drm/drm_simple_kms_helper.h>
>>   
>> -static void vkms_connector_destroy(struct drm_connector *connector)
>> -{
>> -	drm_connector_cleanup(connector);
>> -}
>> -
>>   static const struct drm_connector_funcs vkms_connector_funcs = {
>>   	.fill_modes = drm_helper_probe_single_connector_modes,
>> -	.destroy = vkms_connector_destroy,
>> +	.destroy = drm_connector_cleanup,
>>   	.reset = drm_atomic_helper_connector_reset,
>>   	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>>   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>> -- 
>> 2.40.0
>>
> 
