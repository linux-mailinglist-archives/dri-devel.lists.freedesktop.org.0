Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D334444461
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 16:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F23373651;
	Wed,  3 Nov 2021 15:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86CC73651
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 15:11:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: leandrohrb) with ESMTPSA id 171921F45997
Message-ID: <6d4c3ce1-705c-8f00-8ec6-2992baa8cb26@collabora.com>
Date: Wed, 3 Nov 2021 12:11:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.1
Subject: Re: [PATCH v2 5/8] drm: drm_atomic_helper: Add a new helper to deal
 with the writeback connector validation
Content-Language: en-US
To: Igor Torrente <igormtorrente@gmail.com>, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, ppaalanen@gmail.com, tzimmermann@suse.de
References: <20211026113409.7242-1-igormtorrente@gmail.com>
 <20211026113409.7242-6-igormtorrente@gmail.com>
 <8adbff15-3ba6-317f-e50e-cc7a8eaf25d1@collabora.com>
 <85ac57d9-b02d-3698-e1b1-67ccdf012f09@gmail.com>
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
In-Reply-To: <85ac57d9-b02d-3698-e1b1-67ccdf012f09@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: airlied@linux.ie, hamohammed.sa@gmail.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/3/21 12:03, Igor Torrente wrote:
> Hi Leandro,
> 
> On 10/28/21 6:38 PM, Leandro Ribeiro wrote:
>> Hi,
>>
>> On 10/26/21 08:34, Igor Torrente wrote:
>>> Add a helper function to validate the connector configuration receive in
>>> the encoder atomic_check by the drivers.
>>>
>>> So the drivers don't need do these common validations themselves.
>>>
>>> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
>>> ---
>>> V2: Move the format verification to a new helper at the
>>> drm_atomic_helper.c
>>>      (Thomas Zimmermann).
>>> ---
>>>   drivers/gpu/drm/drm_atomic_helper.c   | 47 +++++++++++++++++++++++++++
>>>   drivers/gpu/drm/vkms/vkms_writeback.c |  9 +++--
>>>   include/drm/drm_atomic_helper.h       |  3 ++
>>>   3 files changed, 54 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c
>>> b/drivers/gpu/drm/drm_atomic_helper.c
>>> index 2c0c6ec92820..c2653b9824b5 100644
>>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>>> @@ -766,6 +766,53 @@ drm_atomic_helper_check_modeset(struct
>>> drm_device *dev,
>>>   }
>>>   EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
>>>   +/**
>>> + * drm_atomic_helper_check_wb_connector_state() - Check writeback
>>> encoder state
>>> + * @encoder: encoder state to check
>>> + * @conn_state: connector state to check
>>> + *
>>> + * Checks if the wriback connector state is valid, and returns a
>>> erros if it
>>> + * isn't.
>>> + *
>>> + * RETURNS:
>>> + * Zero for success or -errno
>>> + */
>>> +int
>>> +drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
>>> +                     struct drm_connector_state *conn_state)
>>> +{
>>> +    struct drm_writeback_job *wb_job = conn_state->writeback_job;
>>> +    struct drm_property_blob *pixel_format_blob;
>>> +    bool format_supported = false;
>>> +    struct drm_framebuffer *fb;
>>> +    int i, n_formats;
>>> +    u32 *formats;
>>> +
>>> +    if (!wb_job || !wb_job->fb)
>>> +        return 0;
>>
>> I think that this should be removed and that this functions should
>> assume that (wb_job && wb_job->fb) == true.
> 
> Ok.
> 
>>
>> Actually, it's weird to have conn_state as argument and only use it to
>> get the wb_job. Instead, this function could receive wb_job directly.
> 
> In the Thomas review of v1, he said that maybe other things could be
> tested in this helper. I'm not sure what these additional checks could
> be, so I tried to design the function signature expecting more things
> to be added after his review.
> 
> As you can see, the helper is receiving the `drm_encoder` and doing
> nothing with it.
> 
> If we, eventually, don't find anything else that this helper can do, I
> will revert to something very similar (if not equal) to your proposal.
> I just want to wait for Thomas's review first.
>

Sure, that makes sense.

Thanks,
Leandro Ribeiro

>>
>> Of course, its name/description would have to change.
>>
>>> +
>>> +    pixel_format_blob = wb_job->connector->pixel_formats_blob_ptr;
>>> +    n_formats = pixel_format_blob->length / sizeof(u32);
>>> +    formats = pixel_format_blob->data;
>>> +    fb = wb_job->fb;
>>> +
>>> +    for (i = 0; i < n_formats; i++) {
>>> +        if (fb->format->format == formats[i]) {
>>> +            format_supported = true;
>>> +            break;
>>> +        }
>>> +    }
>>> +
>>> +    if (!format_supported) {
>>> +        DRM_DEBUG_KMS("Invalid pixel format %p4cc\n",
>>> +                  &fb->format->format);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    return 0;
>>
>> If you do this, you can get rid of the format_supported flag:
>>
>>     for(...) {
>>         if (fb->format->format == formats[i])
>>             return 0;
>>     }
>>
>>
>>     DRM_DEBUG_KMS(...);
>>     return -EINVAL;
>>
> 
> Indeed. Thanks!
> 
>> Thanks,
>> Leandro Ribeiro
>>
>>> +}
>>> +EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
>>> +
>>>   /**
>>>    * drm_atomic_helper_check_plane_state() - Check plane state for
>>> validity
>>>    * @plane_state: plane state to check
>>> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c
>>> b/drivers/gpu/drm/vkms/vkms_writeback.c
>>> index 32734cdbf6c2..42f3396c523a 100644
>>> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
>>> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
>>> @@ -30,6 +30,7 @@ static int vkms_wb_encoder_atomic_check(struct
>>> drm_encoder *encoder,
>>>   {
>>>       struct drm_framebuffer *fb;
>>>       const struct drm_display_mode *mode = &crtc_state->mode;
>>> +    int ret;
>>>         if (!conn_state->writeback_job ||
>>> !conn_state->writeback_job->fb)
>>>           return 0;
>>> @@ -41,11 +42,9 @@ static int vkms_wb_encoder_atomic_check(struct
>>> drm_encoder *encoder,
>>>           return -EINVAL;
>>>       }
>>>   -    if (fb->format->format != vkms_wb_formats[0]) {
>>> -        DRM_DEBUG_KMS("Invalid pixel format %p4cc\n",
>>> -                  &fb->format->format);
>>> -        return -EINVAL;
>>> -    }
>>> +    ret = drm_atomic_helper_check_wb_encoder_state(encoder,
>>> conn_state);
>>> +    if (ret < 0)
>>> +        return ret;
>>>         return 0;
>>>   }
>>> diff --git a/include/drm/drm_atomic_helper.h
>>> b/include/drm/drm_atomic_helper.h
>>> index 4045e2507e11..3fbf695da60f 100644
>>> --- a/include/drm/drm_atomic_helper.h
>>> +++ b/include/drm/drm_atomic_helper.h
>>> @@ -40,6 +40,9 @@ struct drm_private_state;
>>>     int drm_atomic_helper_check_modeset(struct drm_device *dev,
>>>                   struct drm_atomic_state *state);
>>> +int
>>> +drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
>>> +                     struct drm_connector_state *conn_state);
>>>   int drm_atomic_helper_check_plane_state(struct drm_plane_state
>>> *plane_state,
>>>                       const struct drm_crtc_state *crtc_state,
>>>                       int min_scale,
>>>
> 
> Thanks,
> ---
> Igor M. A. Torrente
