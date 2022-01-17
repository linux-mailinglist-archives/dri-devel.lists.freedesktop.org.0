Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D42D49004F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 03:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D63310E22A;
	Mon, 17 Jan 2022 02:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D1E10E163
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 02:45:37 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id r135so6421860pgr.6
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jan 2022 18:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=qUMGXQA24GuCkD0foGZ5EQ/jWXa2C4jCsPx92Oi0DR4=;
 b=3JcalMkLwRqtx0dh+FBtyQAGr4zEik0NNokh7CZm9OjxATON/gXp5yImWlNGSIthv+
 GKYZ+O5JUE82OShMSyjYbUfxwuerQa/dKw8d7y9kVZm3zCqZJOKr0d1o6ayrotoo3lAJ
 MmQZ1GZ5ae53FWqTbV1p4NViMmmFmTtzBh4sCCWV8S0DvMixlOTHfAfZkbOp699BGmZc
 afbQ9vjEADSw0zK+vnLf4MyjIuPu5pTDn2igIrZ7D0ZnOdZrUU1kZWmPomddoEpg5LNj
 9nnyRMfVFRPxSyImBzr3BFn7mjlhalInCzqMRsNZTIpyJ2B3c6mTjAHrA4Tyv0wFWSRS
 SZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qUMGXQA24GuCkD0foGZ5EQ/jWXa2C4jCsPx92Oi0DR4=;
 b=OyfsAnqkTUz3K3jrq7iHe6Jgsvi6pZ4ko3r5uyoi4sTQaTyolifC7NkwSk96FuGawa
 GRZap2w5HGmEOtmcUJ1dZUh6jPPPbx9mM/QL4rlvK58QZFjigYmqSZpFS+8qsNddXBkm
 6/vucoHQQ9HtJ8Sg0n9bMVdS977GAc1CpyG7bZp6VrKIilOFGZJTL6PSqCsclJ+wedhi
 R8HZba6TtFLE0gJujJr5gIYmoUX/hHyjj3SLPjYmp0XJzB7kqTpmJg1Pht6FpRN3zlK5
 oKIpOGYxi9I4tNzXrdDC42B1tC28lirYvQ6TUQTZNNyBjGWg1SgK29ocAQYkQRzhs3r1
 kwHg==
X-Gm-Message-State: AOAM533M4zDEOtpQ1cu8BhaFhIMat0QqzzABKZBBE1/CyY39xuFCETmi
 b80i0UXexxJ9c0G+v5rRRsYM0KmuJVdkmr0G
X-Google-Smtp-Source: ABdhPJzq0NYrXjwknb/WYsPDwFTg401OZR3e8p/eQrIgNjYBek+0BxMrjWkmpMsqlGtfJhXoVGGOoA==
X-Received: by 2002:a05:6a00:188a:b0:4c2:faa1:b6ed with SMTP id
 x10-20020a056a00188a00b004c2faa1b6edmr10839523pfh.54.1642387536771; 
 Sun, 16 Jan 2022 18:45:36 -0800 (PST)
Received: from [10.16.129.73] (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id c21sm2183587pgw.41.2022.01.16.18.45.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Jan 2022 18:45:36 -0800 (PST)
Message-ID: <dfc44001-cdb7-3a85-2c66-b6180183bd5a@igel.co.jp>
Date: Mon, 17 Jan 2022 11:45:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [RFC PATH 1/3] drm: add support modifiers for drivers whose
 planes only support linear layout
Content-Language: en-US
To: dri-devel@lists.freedesktop.org, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ben Skeggs <bskeggs@redhat.com>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <mdaenzer@redhat.com>, Simon Ser <contact@emersion.fr>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Mark Yacoub <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Evan Quan <evan.quan@amd.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@chromium.org>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>, Takanari Hayama <taki@igel.co.jp>
References: <20211222052727.19725-1-etom@igel.co.jp>
 <20211222052727.19725-2-etom@igel.co.jp>
 <YeGpw7L3jODHHnPC@phenom.ffwll.local>
From: Esaki Tomohito <etom@igel.co.jp>
In-Reply-To: <YeGpw7L3jODHHnPC@phenom.ffwll.local>
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

Thank you for your reviews.

On 2022/01/15 1:50, Daniel Vetter wrote:
> On Wed, Dec 22, 2021 at 02:27:25PM +0900, Tomohito Esaki wrote:
>> The LINEAR modifier is advertised as default if a driver doesn't specify
>> modifiers. However, there are legacy drivers such as radeon that do not
>> support modifiers but infer the actual layout of the underlying buffer.
>> Therefore, a new flag not_support_fb_modifires is introduced for these
>> legacy drivers. Allow_fb_modifiers will be replaced with this new flag.
>>
>> Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
>> ---
>>   drivers/gpu/drm/drm_plane.c   | 34 ++++++++++++++++++++++++++--------
>>   include/drm/drm_mode_config.h | 10 ++++++++++
>>   include/drm/drm_plane.h       |  3 +++
>>   3 files changed, 39 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
>> index 82afb854141b..75308ee240c0 100644
>> --- a/drivers/gpu/drm/drm_plane.c
>> +++ b/drivers/gpu/drm/drm_plane.c
>> @@ -161,6 +161,16 @@ modifiers_ptr(struct drm_format_modifier_blob *blob)
>>   	return (struct drm_format_modifier *)(((char *)blob) + blob->modifiers_offset);
>>   }
>>   
>> +static bool check_format_modifier(struct drm_plane *plane, uint32_t format,
>> +				  uint64_t modifier)
>> +{
>> +	if (plane->funcs->format_mod_supported)
>> +		return plane->funcs->format_mod_supported(plane, format,
>> +							  modifier);
>> +
>> +	return modifier == DRM_FORMAT_MOD_LINEAR;
>> +}
>> +
>>   static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane)
>>   {
>>   	const struct drm_mode_config *config = &dev->mode_config;
>> @@ -203,16 +213,15 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
>>   	memcpy(formats_ptr(blob_data), plane->format_types, formats_size);
>>   
>>   	/* If we can't determine support, just bail */
>> -	if (!plane->funcs->format_mod_supported)
>> +	if (config->fb_modifiers_not_supported)
>>   		goto done;
>>   
>>   	mod = modifiers_ptr(blob_data);
>>   	for (i = 0; i < plane->modifier_count; i++) {
>>   		for (j = 0; j < plane->format_count; j++) {
>> -			if (plane->funcs->format_mod_supported(plane,
>> -							       plane->format_types[j],
>> -							       plane->modifiers[i])) {
>> -
>> +			if (check_format_modifier(plane,
>> +						  plane->format_types[j],
>> +						  plane->modifiers[i])) {
>>   				mod->formats |= 1ULL << j;
>>   			}
>>   		}
>> @@ -242,6 +251,10 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>>   				      const char *name, va_list ap)
>>   {
>>   	struct drm_mode_config *config = &dev->mode_config;
>> +	const uint64_t default_modifiers[] = {
>> +		DRM_FORMAT_MOD_LINEAR,
>> +		DRM_FORMAT_MOD_INVALID
>> +	};
>>   	unsigned int format_modifier_count = 0;
>>   	int ret;
>>   
>> @@ -282,6 +295,11 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>>   
>>   		while (*temp_modifiers++ != DRM_FORMAT_MOD_INVALID)
>>   			format_modifier_count++;
>> +	} else {
>> +		if (!dev->mode_config.fb_modifiers_not_supported) {
>> +			format_modifiers = default_modifiers;
>> +			format_modifier_count = 1;
>> +		}
>>   	}
>>   
>>   	/* autoset the cap and check for consistency across all planes */
>> @@ -346,7 +364,7 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>>   		drm_object_attach_property(&plane->base, config->prop_src_h, 0);
>>   	}
>>   
>> -	if (config->allow_fb_modifiers)
>> +	if (format_modifier_count)
>>   		create_in_format_blob(dev, plane);
>>   
>>   	return 0;
>> @@ -373,8 +391,8 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>>    * drm_universal_plane_init() to let the DRM managed resource infrastructure
>>    * take care of cleanup and deallocation.
>>    *
>> - * Drivers supporting modifiers must set @format_modifiers on all their planes,
>> - * even those that only support DRM_FORMAT_MOD_LINEAR.
>> + * For drivers supporting modifiers, all planes will advertise
>> + * DRM_FORMAT_MOD_LINEAR support, if @format_modifiers is not set.
>>    *
>>    * Returns:
>>    * Zero on success, error code on failure.
>> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
>> index 48b7de80daf5..c56f298c55bd 100644
>> --- a/include/drm/drm_mode_config.h
>> +++ b/include/drm/drm_mode_config.h
>> @@ -920,6 +920,16 @@ struct drm_mode_config {
>>   	 */
>>   	bool allow_fb_modifiers;
>>   
>> +	/**
>> +	 * @fb_modifiers_not_supported:
>> +	 *
>> +	 * This flag is for legacy drivers such as radeon that do not support
> 
> Maybe don't put specific driver names into kerneldoc (in commit message to
> motivate your changes it's fine). It's unlikely radeon ever changes on
> this, but also no one will update this in the docs if we ever do that.
> 
> Perhaps also add that new driver should never set this, just to hammer it
> home that modifiers really should work everywhere.

I agree with you.
I'll modify this docs.

Thanks,
Tomohito Esaki

> 
> Otherwise I think this series is the right thing to do.
> -Daniel
> 
>> +	 * modifiers but infer the actual layout of the underlying buffer.
>> +	 * Generally, each drivers must support modifiers, this flag should not
>> +	 * be set.
>> +	 */
>> +	bool fb_modifiers_not_supported;
>> +
>>   	/**
>>   	 * @normalize_zpos:
>>   	 *
>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>> index 0c1102dc4d88..cad641b1f797 100644
>> --- a/include/drm/drm_plane.h
>> +++ b/include/drm/drm_plane.h
>> @@ -803,6 +803,9 @@ void *__drmm_universal_plane_alloc(struct drm_device *dev,
>>    *
>>    * The @drm_plane_funcs.destroy hook must be NULL.
>>    *
>> + * For drivers supporting modifiers, all planes will advertise
>> + * DRM_FORMAT_MOD_LINEAR support, if @format_modifiers is not set.
>> + *
>>    * Returns:
>>    * Pointer to new plane, or ERR_PTR on failure.
>>    */
>> -- 
>> 2.17.1
>>
> 
