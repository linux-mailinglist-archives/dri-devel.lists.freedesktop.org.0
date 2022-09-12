Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 683915B61E3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 21:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB9610E219;
	Mon, 12 Sep 2022 19:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCF810E219
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 19:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663012230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w0YHTFiHmCMOhY8jwxABxa5BgJfL6gkhs2YD6OMTr1g=;
 b=UvxJtnvAoyeymMb8UqjiICkPlXAWzZb5rkj1nEwlxCld5HMvK6g8haxH9WN4YngGdUMZjx
 WlO/RGM48c9BmdjsyB8C8AwOgK9YCvSDZgbEjodkx9V8/1V+hH/iYsZRyRBHjzCkeTOYBg
 3rXRgz8J424zAIpDv2HMZRv40ezTNkk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-447-JKLtKqgjM12YM_ilyqLGng-1; Mon, 12 Sep 2022 15:50:29 -0400
X-MC-Unique: JKLtKqgjM12YM_ilyqLGng-1
Received: by mail-ed1-f71.google.com with SMTP id
 e15-20020a056402190f00b0044f41e776a0so6743645edz.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 12:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=w0YHTFiHmCMOhY8jwxABxa5BgJfL6gkhs2YD6OMTr1g=;
 b=jAl81aE4YQNLJpinRwnyF1A05+08eyuzEdzTBX7HA+klxoiD1j7zKbsCHKwqJWfUWM
 pb64MJH82KnIohe1qvMKP4oD9kO+9Ua4lcIpAG9qKcwmkIjwdGx4IKmYGFGIFDj/RkYI
 J01duOOlnPCrLPqdQ5jOXEgnP19YDzk16fAcFejEEIOdguyLRCgr3x0NBf9xSBo9m06K
 RHOs3qrLpn/pxjlXwWaJpzGZBWOvzaLmeYhKORJYqTvbPXqtxEywRYvZkbeFmoadDNTm
 D4046nI408238ZdaWBjcEoSGF6oha2jNvYl6yiJlKhdG8vBI5s2Q+7DObptjgjzsDNIu
 lzeQ==
X-Gm-Message-State: ACgBeo0CB8WmPrkSTB7QSxQXrbYWB/vYUP/7KqP/AyeR17wc7f1LYQUT
 ssspJoVLpofoVPt2JCmOn8comk8ZeG5emt3psgg7f+WREE1RMZnhV7tRhDFWDBQRgtikjBSfg8b
 rYLJeuXI+9Gja6POQktDp+uEKAuRt
X-Received: by 2002:a05:6402:3485:b0:451:f615:321f with SMTP id
 v5-20020a056402348500b00451f615321fmr3394894edc.65.1663012228295; 
 Mon, 12 Sep 2022 12:50:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4XL9fTgyaRKc9Ofbmv7caRrEgXhMgt6F/fC9gah/5BqD0T4QwTibDWloQvf5gK3w7wJXiFQA==
X-Received: by 2002:a05:6402:3485:b0:451:f615:321f with SMTP id
 v5-20020a056402348500b00451f615321fmr3394881edc.65.1663012228134; 
 Mon, 12 Sep 2022 12:50:28 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b40:2ee8:642:1aff:fe31:a15c?
 ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 9-20020a170906210900b007767c82acc6sm4841512ejt.151.2022.09.12.12.50.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 12:50:27 -0700 (PDT)
Message-ID: <dc472070-34a8-93e1-2ca3-4847c49f12eb@redhat.com>
Date: Mon, 12 Sep 2022 21:50:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH RESEND drm-misc-next 4/7] drm/arm/hdlcd: plane: use drm
 managed resources
To: Liviu Dudau <liviu.dudau@arm.com>
References: <20220905152719.128539-1-dakr@redhat.com>
 <20220905152719.128539-5-dakr@redhat.com>
 <Yx9uAe//u/Z9zfmM@e110455-lin.cambridge.arm.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Yx9uAe//u/Z9zfmM@e110455-lin.cambridge.arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liviu,

Thanks for having a look!

This is not about this patch, it's about patch 3/7 "drm/arm/hdlcd: crtc: 
use drmm_crtc_init_with_planes()".

And there it's the other way around. When using 
drmm_crtc_init_with_planes() we shouldn't have a destroy hook in place, 
that's the whole purpose of drmm_crtc_init_with_planes().

We should just drop patch 3/7 "drm/arm/hdlcd: crtc: use 
drmm_crtc_init_with_planes()", it's wrong.

Do you want me to send a v2 for that?

- Danilo



On 9/12/22 19:36, Liviu Dudau wrote:
> Hi Danilo,
> 
> I have applied your patch series for HDLCD on top of drm-next (commit 213cb76ddc8b)
> and on start up I get a warning:
> 
> [   12.882554] hdlcd 7ff50000.hdlcd: drm_WARN_ON(funcs && funcs->destroy)
> [   12.882596] WARNING: CPU: 1 PID: 211 at drivers/gpu/drm/drm_crtc.c:393 __drmm_crtc_init_with_planes+0x70/0xf0 [drm]
> 
> It looks like the .destroy hook is still required or I'm missing some other required
> series where the WARN has been removed?
> 
> Best regards,
> Liviu
> 
> On Mon, Sep 05, 2022 at 05:27:16PM +0200, Danilo Krummrich wrote:
>> Use drm managed resource allocation (drmm_universal_plane_alloc()) in
>> order to get rid of the explicit destroy hook in struct drm_plane_funcs.
>>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   drivers/gpu/drm/arm/hdlcd_crtc.c | 20 +++++++-------------
>>   1 file changed, 7 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
>> index c0a5ca7f578a..17d3ccf12245 100644
>> --- a/drivers/gpu/drm/arm/hdlcd_crtc.c
>> +++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
>> @@ -289,7 +289,6 @@ static const struct drm_plane_helper_funcs hdlcd_plane_helper_funcs = {
>>   static const struct drm_plane_funcs hdlcd_plane_funcs = {
>>   	.update_plane		= drm_atomic_helper_update_plane,
>>   	.disable_plane		= drm_atomic_helper_disable_plane,
>> -	.destroy		= drm_plane_cleanup,
>>   	.reset			= drm_atomic_helper_plane_reset,
>>   	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>>   	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
>> @@ -297,24 +296,19 @@ static const struct drm_plane_funcs hdlcd_plane_funcs = {
>>   
>>   static struct drm_plane *hdlcd_plane_init(struct drm_device *drm)
>>   {
>> -	struct hdlcd_drm_private *hdlcd = drm->dev_private;
>> +	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
>>   	struct drm_plane *plane = NULL;
>>   	u32 formats[ARRAY_SIZE(supported_formats)], i;
>> -	int ret;
>> -
>> -	plane = devm_kzalloc(drm->dev, sizeof(*plane), GFP_KERNEL);
>> -	if (!plane)
>> -		return ERR_PTR(-ENOMEM);
>>   
>>   	for (i = 0; i < ARRAY_SIZE(supported_formats); i++)
>>   		formats[i] = supported_formats[i].fourcc;
>>   
>> -	ret = drm_universal_plane_init(drm, plane, 0xff, &hdlcd_plane_funcs,
>> -				       formats, ARRAY_SIZE(formats),
>> -				       NULL,
>> -				       DRM_PLANE_TYPE_PRIMARY, NULL);
>> -	if (ret)
>> -		return ERR_PTR(ret);
>> +	plane = drmm_universal_plane_alloc(drm, struct drm_plane, dev, 0xff,
>> +					   &hdlcd_plane_funcs,
>> +					   formats, ARRAY_SIZE(formats),
>> +					   NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
>> +	if (IS_ERR(plane))
>> +		return plane;
>>   
>>   	drm_plane_helper_add(plane, &hdlcd_plane_helper_funcs);
>>   	hdlcd->plane = plane;
>> -- 
>> 2.37.2
>>
> 

