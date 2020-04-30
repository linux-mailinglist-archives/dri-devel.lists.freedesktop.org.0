Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1A01BEFEE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 07:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1D06EA8B;
	Thu, 30 Apr 2020 05:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F99C6EA89;
 Thu, 30 Apr 2020 05:52:51 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id l19so5100200lje.10;
 Wed, 29 Apr 2020 22:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RwmYZ3E2Cn3/mLXJyzZsWl6huqbPer1PdGV+pzidiwA=;
 b=JMMsSbBY9Xotty3p1/IOhmUfb1M9vDuomzbNVK9plmB1y+RJx7utPY0/QRdMvEelOt
 Xmr5Von19/WQmSodxjguM171c5DhGOJUwydRla7c3M8bFbTCtYkxg4q2V0wBtk2ywXJl
 4l1V1aBV2Gi9GOTd+e7FfmarOp83wiRuR5oOzpNagGS4VZjFFBwBl7KcN/WBXrgOieTH
 YvgptMgduY0xTTXiFTE1bOqfrVsnVTTQ2tPw1XAkALs/EhJKQoicrWIPpjsab6B1/nG1
 F/aa+7aPppsp5La/NvyuejWJOFIocwkPO807G/dXNYJYlVDzA4tGcBI6XIy0Uh784SRp
 w8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RwmYZ3E2Cn3/mLXJyzZsWl6huqbPer1PdGV+pzidiwA=;
 b=knY8rolun3CG8xDV98C9AorjFXsO94n+H18qTz1SNCpp5XlmuzdGAjyrjdX6Xju1gC
 GVXZ9RfznvRwvfoZcATxNjoO59OlFqTYzA/exyVln3ZbO9PsWnaWxy5CZNQ0RWx9fZ3t
 6RI8TqqySq38gMwpWKc/m4l1tC2RzqOg4myrsy4Vl/HY3Jjw5pByGlwbZRQ7aOqmNNGr
 jdShDIdYwnMWk+eUVWVZtIwuwHDokcO2UOUxa2/xPb4XMbSQ/GQRSdwpCHoGnCHDXRt2
 nBYXHe9LxT8N3yu4OMvX428irL2dIqClLV3tHwX8ZIcIKB9hCrUt4i6Pw6pOHf6+B3Mi
 pLnw==
X-Gm-Message-State: AGi0PuasrQqmSlbT4iqPie19aZnTeLJwro3oUcsVJuR9X3hE+2ryy5RP
 w1Pq0rOtvroRv2kk2GLWuDLzJekahHn4ZQ==
X-Google-Smtp-Source: APiQypLutdv0RfgCbbx60i8SZmUJ4DmZhZ2I+iHcCi1c66UJa9V3ha0BZI7e3IXSOgpcMDklzORucQ==
X-Received: by 2002:a2e:9084:: with SMTP id l4mr1157836ljg.132.1588225969010; 
 Wed, 29 Apr 2020 22:52:49 -0700 (PDT)
Received: from [192.168.0.103] (static-91-225-135-18.devs.futuro.pl.
 [91.225.135.18])
 by smtp.gmail.com with ESMTPSA id k18sm4836849lfg.81.2020.04.29.22.52.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Apr 2020 22:52:48 -0700 (PDT)
Subject: Re: [PATCH] drm: Replace drm_modeset_lock/unlock_all with
 DRM_MODESET_LOCK_ALL_* helpers
To: Jani Nikula <jani.nikula@linux.intel.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
References: <1588093804-30446-1-git-send-email-michalorzel.eng@gmail.com>
 <875zdiacv2.fsf@intel.com>
From: =?UTF-8?B?TWljaGHFgiBPcnplxYI=?= <michalorzel.eng@gmail.com>
Message-ID: <dab8f564-d2b3-de19-f56d-f741046c39c6@gmail.com>
Date: Thu, 30 Apr 2020 07:52:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <875zdiacv2.fsf@intel.com>
Content-Language: en-US
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 29.04.2020 10:57, Jani Nikula wrote:
> On Tue, 28 Apr 2020, Michal Orzel <michalorzel.eng@gmail.com> wrote:
>> As suggested by the TODO list for the kernel DRM subsystem, replace
>> the deprecated functions that take/drop modeset locks with new helpers.
>>
>> Signed-off-by: Michal Orzel <michalorzel.eng@gmail.com>
>> ---
>>  drivers/gpu/drm/drm_mode_object.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
>> index 35c2719..901b078 100644
>> --- a/drivers/gpu/drm/drm_mode_object.c
>> +++ b/drivers/gpu/drm/drm_mode_object.c
>> @@ -402,12 +402,13 @@ int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data,
>>  {
>>  	struct drm_mode_obj_get_properties *arg = data;
>>  	struct drm_mode_object *obj;
>> +	struct drm_modeset_acquire_ctx ctx;
>>  	int ret = 0;
>>  
>>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>>  		return -EOPNOTSUPP;
>>  
>> -	drm_modeset_lock_all(dev);
>> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
> 
> I cry a little every time I look at the DRM_MODESET_LOCK_ALL_BEGIN and
> DRM_MODESET_LOCK_ALL_END macros. :(
> 
> Currently only six users... but there are ~60 calls to
> drm_modeset_lock_all{,_ctx} that I presume are to be replaced. I wonder
> if this will come back and haunt us.
> 
> BR,
> Jani.

Hm, so we can either replace all of these calls(I think it's a better option) or abandon the idea of removing this deprecated function.
In the latter scenario, it'd be beneficial to remove this from TODO.

Best regards
Michal

> 
> 
>>  
>>  	obj = drm_mode_object_find(dev, file_priv, arg->obj_id, arg->obj_type);
>>  	if (!obj) {
>> @@ -427,7 +428,7 @@ int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data,
>>  out_unref:
>>  	drm_mode_object_put(obj);
>>  out:
>> -	drm_modeset_unlock_all(dev);
>> +	DRM_MODESET_LOCK_ALL_END(ctx, ret);
>>  	return ret;
>>  }
>>  
>> @@ -449,12 +450,13 @@ static int set_property_legacy(struct drm_mode_object *obj,
>>  {
>>  	struct drm_device *dev = prop->dev;
>>  	struct drm_mode_object *ref;
>> +	struct drm_modeset_acquire_ctx ctx;
>>  	int ret = -EINVAL;
>>  
>>  	if (!drm_property_change_valid_get(prop, prop_value, &ref))
>>  		return -EINVAL;
>>  
>> -	drm_modeset_lock_all(dev);
>> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>>  	switch (obj->type) {
>>  	case DRM_MODE_OBJECT_CONNECTOR:
>>  		ret = drm_connector_set_obj_prop(obj, prop, prop_value);
>> @@ -468,7 +470,7 @@ static int set_property_legacy(struct drm_mode_object *obj,
>>  		break;
>>  	}
>>  	drm_property_change_valid_put(prop, ref);
>> -	drm_modeset_unlock_all(dev);
>> +	DRM_MODESET_LOCK_ALL_END(ctx, ret);
>>  
>>  	return ret;
>>  }
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
