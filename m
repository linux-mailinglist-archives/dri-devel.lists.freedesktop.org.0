Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 188397805FE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 08:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E77A10E063;
	Fri, 18 Aug 2023 06:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A414310E063
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 06:54:06 +0000 (UTC)
Received: from [IPV6:2a02:2f08:e800:b00:5212:24d1:45f7:b78e] (unknown
 [IPv6:2a02:2f08:e800:b00:5212:24d1:45f7:b78e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 02E8A6607185;
 Fri, 18 Aug 2023 07:54:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692341645;
 bh=y1W6g43THvHRr3OobY4s/mDdYVcj5y1uV3cxkV23ggg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VwkvQuPf1l9TrVCoxW2y9zK+nwIWpuKlOiNw76TzwevVwdcMa0cXbac4QSoCdc828
 MnFvXkgi8uQ/Ai7S1JN5QfuE3CzmeHer5aC0kclWTV+xnM5UsewLGlJisK6K/tn+rg
 Z0qPiPiRlIMOTC4VHYzNjujvsOZVF3rNaa0CQy8DiAKOziX3ELSwFT86rOZyCcfr+i
 4bReFGohIWvMAAQBGyjlA1nTJZJKLZqKVZocgURq0lSRsvIAmer45irdsacwUzMUxg
 +uAqA2lKI7RgY8JyVr7NFJ8B2b8Xp9LPFuBa/yC+ubph0YcbGayUbbLE4lND2KHvZu
 AzYm6/HOV5Irw==
Message-ID: <664583b8-96c1-cc1f-9747-863b4e46682c@collabora.com>
Date: Fri, 18 Aug 2023 09:54:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 5/6] drm/vkms: Support enabling ConfigFS devices
To: Brandon Ross Pollack <brpol@chromium.org>,
 Jim Shargo <jshargo@chromium.org>
References: <20230623222353.97283-1-jshargo@chromium.org>
 <20230623222353.97283-6-jshargo@chromium.org> <ZNuFU3VbiKhZTIWk@xpredator>
 <0dadd751-1546-170f-3693-7087ba6ab262@chromium.org>
Content-Language: en-US
From: Marius Vlad <marius.vlad@collabora.com>
In-Reply-To: <0dadd751-1546-170f-3693-7087ba6ab262@chromium.org>
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
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <melissa.srw@gmail.com>,
 mairacanal@riseup.net, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Seem my comments below.

On 8/18/23 08:24, Brandon Ross Pollack wrote:
> 
> On 8/15/23 23:01, Marius Vlad wrote:
>> Hi,
>>
>> See below some minor comments:
>>
>> On Fri, Jun 23, 2023 at 06:23:47PM -0400, Jim Shargo wrote:
>>> VKMS now supports creating and using virtual devices!
>>>
>>> In addition to the enabling logic, this commit also prevents users from
>>> adding new objects once a card is registered.
>>>
>>> Signed-off-by: Jim Shargo <jshargo@chromium.org>
>>> ---
>>>   drivers/gpu/drm/vkms/vkms_configfs.c |  37 +++--
>>>   drivers/gpu/drm/vkms/vkms_crtc.c     |   4 +-
>>>   drivers/gpu/drm/vkms/vkms_drv.c      |   3 +-
>>>   drivers/gpu/drm/vkms/vkms_drv.h      |   2 +-
>>>   drivers/gpu/drm/vkms/vkms_output.c   | 201 +++++++++++++++++++++++----
>>>   5 files changed, 202 insertions(+), 45 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c 
>>> b/drivers/gpu/drm/vkms/vkms_configfs.c
>>> index 544024735d19..f5eed6d23dcd 100644
>>> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
>>> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
>>> @@ -504,29 +504,40 @@ static ssize_t device_enabled_store(struct 
>>> config_item *item, const char *buf,
>>>   {
>>>       struct vkms_configfs *configfs = item_to_configfs(item);
>>>       struct vkms_device *device;
>>> -    int value, ret;
>>> +    int enabled, ret;
>>> -    ret = kstrtoint(buf, 0, &value);
>>> +    ret = kstrtoint(buf, 0, &enabled);
>>>       if (ret)
>>>           return ret;
>>> -    if (value != 1)
>>> -        return -EINVAL;
>>> -
>>> -    mutex_lock(&configfs->lock);
>>> -
>>> -    if (configfs->vkms_device) {
>>> +    if (enabled == 0) {
>>> +        mutex_lock(&configfs->lock);
>>> +        if (configfs->vkms_device) {
>>> +            vkms_remove_device(configfs->vkms_device);
>>> +            configfs->vkms_device = NULL;
>>> +        }
>>>           mutex_unlock(&configfs->lock);
>>> +
>>>           return len;
>>>       }
>>> -    device = vkms_add_device(configfs);
>>> -    mutex_unlock(&configfs->lock);
>>> +    if (enabled == 1) {
>>> +        mutex_lock(&configfs->lock);
>>> +        if (!configfs->vkms_device) {
>>> +            device = vkms_add_device(configfs);
>>> +            if (IS_ERR(device)) {
>>> +                mutex_unlock(&configfs->lock);
>>> +                return -PTR_ERR(device);
>>> +            }
>>> +
>>> +            configfs->vkms_device = device;
>>> +        }
>>> +        mutex_unlock(&configfs->lock);
>>> -    if (IS_ERR(device))
>>> -        return -PTR_ERR(device);
>>> +        return len;
>>> +    }
>>> -    return len;
>>> +    return -EINVAL;
>>>   }
>>>   CONFIGFS_ATTR(device_, enabled);
>>> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c 
>>> b/drivers/gpu/drm/vkms/vkms_crtc.c
>>> index d91e49c53adc..5ebb5264f6ef 100644
>>> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
>>> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
>>> @@ -278,7 +278,7 @@ static const struct drm_crtc_helper_funcs 
>>> vkms_crtc_helper_funcs = {
>>>   struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
>>>                    struct drm_plane *primary,
>>> -                 struct drm_plane *cursor)
>>> +                 struct drm_plane *cursor, const char *name)
>>>   {
>>>       struct drm_device *dev = &vkmsdev->drm;
>>>       struct vkms_crtc *vkms_crtc;
>>> @@ -290,7 +290,7 @@ struct vkms_crtc *vkms_crtc_init(struct 
>>> vkms_device *vkmsdev,
>>>       vkms_crtc = &vkmsdev->output.crtcs[vkmsdev->output.num_crtcs++];
>>>       ret = drmm_crtc_init_with_planes(dev, &vkms_crtc->base, 
>>> primary, cursor,
>>> -                     &vkms_crtc_funcs, NULL);
>>> +                     &vkms_crtc_funcs, name);
>>>       if (ret) {
>>>           DRM_ERROR("Failed to init CRTC\n");
>>>           goto out_error;
>>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c 
>>> b/drivers/gpu/drm/vkms/vkms_drv.c
>>> index 1b5b7143792f..314a04659c5f 100644
>>> --- a/drivers/gpu/drm/vkms/vkms_drv.c
>>> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
>>> @@ -210,7 +210,7 @@ static int vkms_platform_probe(struct 
>>> platform_device *pdev)
>>>       ret = drm_dev_register(&vkms_device->drm, 0);
>>>       if (ret) {
>>>           DRM_ERROR("Unable to register device with id %d\n", pdev->id);
>>> -        return ret;
>>> +        goto out_release_group;
>>>       }
>>>       drm_fbdev_generic_setup(&vkms_device->drm, 0);
>>> @@ -256,6 +256,7 @@ struct vkms_device *vkms_add_device(struct 
>>> vkms_configfs *configfs)
>>>               dev, &vkms_platform_driver.driver))) {
>>>           pdev = to_platform_device(dev);
>>>           max_id = max(max_id, pdev->id);
>>> +        put_device(dev);
>>>       }
>>>       pdev = platform_device_register_data(NULL, DRIVER_NAME, max_id 
>>> + 1,
>>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h 
>>> b/drivers/gpu/drm/vkms/vkms_drv.h
>>> index 3634eeeb4548..3d592d085f49 100644
>>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
>>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
>>> @@ -239,7 +239,7 @@ void vkms_remove_device(struct vkms_device 
>>> *vkms_device);
>>>   /* CRTC */
>>>   struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
>>>                    struct drm_plane *primary,
>>> -                 struct drm_plane *cursor);
>>> +                 struct drm_plane *cursor, const char *name);
>>>   int vkms_output_init(struct vkms_device *vkmsdev);
>>>   int vkms_output_init_default(struct vkms_device *vkmsdev);
>>> diff --git a/drivers/gpu/drm/vkms/vkms_output.c 
>>> b/drivers/gpu/drm/vkms/vkms_output.c
>>> index c9e6c653de19..806ff01954ad 100644
>>> --- a/drivers/gpu/drm/vkms/vkms_output.c
>>> +++ b/drivers/gpu/drm/vkms/vkms_output.c
>>> @@ -2,8 +2,10 @@
>>>   #include <drm/drm_atomic_helper.h>
>>>   #include <drm/drm_connector.h>
>>> +#include <drm/drm_crtc.h>
>>>   #include <drm/drm_edid.h>
>>>   #include <drm/drm_encoder.h>
>>> +#include <drm/drm_plane.h>
>>>   #include <drm/drm_probe_helper.h>
>>>   #include <drm/drm_simple_kms_helper.h>
>>> @@ -82,7 +84,6 @@ static struct drm_encoder *vkms_encoder_init(struct 
>>> vkms_device *vkms_device)
>>>   int vkms_output_init_default(struct vkms_device *vkmsdev)
>>>   {
>>> -    struct vkms_output *output = &vkmsdev->output;
>>>       struct drm_device *dev = &vkmsdev->drm;
>>>       struct drm_connector *connector;
>>>       struct drm_encoder *encoder;
>>> @@ -101,8 +102,7 @@ int vkms_output_init_default(struct vkms_device 
>>> *vkmsdev)
>>>               struct vkms_plane *overlay = vkms_plane_init(
>>>                   vkmsdev, DRM_PLANE_TYPE_OVERLAY);
>>>               if (IS_ERR(overlay)) {
>>> -                ret = PTR_ERR(overlay);
>>> -                goto err_planes;
>>> +                return PTR_ERR(overlay);
>>>               }
>>>           }
>>>       }
>>> @@ -110,17 +110,16 @@ int vkms_output_init_default(struct vkms_device 
>>> *vkmsdev)
>>>       if (vkmsdev->config.cursor) {
>>>           cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
>>>           if (IS_ERR(cursor)) {
>>> -            ret = PTR_ERR(cursor);
>>> -            goto err_planes;
>>> +            return PTR_ERR(cursor);
>>>           }
>>>       }
>>>       vkms_crtc = vkms_crtc_init(vkmsdev, &primary->base,
>>> -                   cursor ? &cursor->base : NULL);
>>> +                   cursor ? &cursor->base : NULL,
>>> +                   "crtc-default");
>>>       if (IS_ERR(vkms_crtc)) {
>>>           DRM_ERROR("Failed to init crtc\n");
>>> -        ret = PTR_ERR(vkms_crtc);
>>> -        goto err_planes;
>>> +        return PTR_ERR(vkms_crtc);
>>>       }
>>>       for (int i = 0; i < vkmsdev->output.num_planes; i++) {
>>> @@ -131,22 +130,20 @@ int vkms_output_init_default(struct vkms_device 
>>> *vkmsdev)
>>>       connector = vkms_connector_init(vkmsdev);
>>>       if (IS_ERR(connector)) {
>>>           DRM_ERROR("Failed to init connector\n");
>>> -        ret = PTR_ERR(connector);
>>> -        goto err_connector;
>>> +        return PTR_ERR(connector);
>>>       }
>>>       encoder = vkms_encoder_init(vkmsdev);
>>>       if (IS_ERR(encoder)) {
>>>           DRM_ERROR("Failed to init encoder\n");
>>> -        ret = PTR_ERR(encoder);
>>> -        goto err_encoder;
>>> +        return PTR_ERR(encoder);
>>>       }
>>>       encoder->possible_crtcs |= drm_crtc_mask(&vkms_crtc->base);
>>>       ret = drm_connector_attach_encoder(connector, encoder);
>>>       if (ret) {
>>>           DRM_ERROR("Failed to attach connector to encoder\n");
>>> -        goto err_attach;
>>> +        return ret;
>>>       }
>>>       if (vkmsdev->config.writeback) {
>>> @@ -158,27 +155,175 @@ int vkms_output_init_default(struct 
>>> vkms_device *vkmsdev)
>>>       drm_mode_config_reset(dev);
>>>       return 0;
>>> +}
>>> -err_attach:
>>> -    drm_encoder_cleanup(encoder);
>>> +static bool is_object_linked(struct vkms_config_links *links, 
>>> unsigned long idx)
>>> +{
>>> +    return links->linked_object_bitmap & (1 << idx);
>>> +}
>>> -err_encoder:
>>> -    drm_connector_cleanup(connector);
>>> +int vkms_output_init(struct vkms_device *vkmsdev)
>>> +{
>>> +    struct drm_device *dev = &vkmsdev->drm;
>>> +    struct vkms_configfs *configfs = vkmsdev->configfs;
>>> +    struct vkms_output *output = &vkmsdev->output;
>>> +    struct plane_map {
>>> +        struct vkms_config_plane *config_plane;
>>> +        struct vkms_plane *plane;
>>> +    } plane_map[VKMS_MAX_PLANES] = { 0 };
>>> +    struct encoder_map {
>>> +        struct vkms_config_encoder *config_encoder;
>>> +        struct drm_encoder *encoder;
>>> +    } encoder_map[VKMS_MAX_OUTPUT_OBJECTS] = { 0 };
>>> +    struct config_item *item;
>>> +    int map_idx = 0;
>>> +
>>> +    list_for_each_entry(item, &configfs->planes_group.cg_children,
>>> +                ci_entry) {
>>> +        struct vkms_config_plane *config_plane =
>>> +            item_to_config_plane(item);
>>> +        struct vkms_plane *plane =
>>> +            vkms_plane_init(vkmsdev, config_plane->type);
>>> +
>>> +        if (IS_ERR(plane)) {
>>> +            DRM_ERROR("Unable to init plane from config: %s",
>>> +                  item->ci_name);
>>> +            return PTR_ERR(plane);
>>> +        }
>>> -err_connector:
>>> -    drm_crtc_cleanup(&vkms_crtc->base);
>>> +        plane_map[map_idx].config_plane = config_plane;
>>> +        plane_map[map_idx].plane = plane;
>>> +        map_idx += 1;
>>> +    }
>>> -err_planes:
>>> -    for (int i = 0; i < output->num_planes; i++) {
>>> -        drm_plane_cleanup(&output->planes[i].base);
>>> +    map_idx = 0;
>>> +    list_for_each_entry(item, &configfs->encoders_group.cg_children,
>>> +                ci_entry) {
>>> +        struct vkms_config_encoder *config_encoder =
>>> +            item_to_config_encoder(item);
>>> +        struct drm_encoder *encoder = vkms_encoder_init(vkmsdev);
>>> +
>>> +        if (IS_ERR(encoder)) {
>>> +            DRM_ERROR("Failed to init config encoder: %s",
>>> +                  item->ci_name);
>>> +            return PTR_ERR(encoder);
>>> +        }
>>> +        encoder_map[map_idx].config_encoder = config_encoder;
>> A two connector configuration without an encoder would have the
>> potential of blowing up if we don't create a second_encoder.
> 
> What a catch!!! I tested this and sure enough BOOM!
> 
> Switched to limiting based on output->num_encoders as it should be.
> 
>>> +        encoder_map[map_idx].encoder = encoder;
>>> +        map_idx += 1;
>>>       }
>>> -    memset(output, 0, sizeof(*output));
>>> +    list_for_each_entry(item, &configfs->connectors_group.cg_children,
>>> +                ci_entry) {
>>> +        struct vkms_config_connector *config_connector =
>>> +            item_to_config_connector(item);
>>> +        struct drm_connector *connector = vkms_connector_init(vkmsdev);
>>> -    return ret;
>>> -}
>>> +        if (IS_ERR(connector)) {
>>> +            DRM_ERROR("Failed to init connector from config: %s",
>>> +                  item->ci_name);
>>> +            return PTR_ERR(connector);
>>> +        }
>>> -int vkms_output_init(struct vkms_device *vkmsdev)
>>> -{
>>> -    return -ENOTSUPP;
>>> +        for (int j = 0; j < output->num_connectors; j++) {
>>> +            struct encoder_map *encoder = &encoder_map[j];
>>> +
>>> +            if (is_object_linked(
>>> +                    &config_connector->possible_encoders,
>>> +                    encoder->config_encoder
>>> +                        ->encoder_config_idx)) {
>> Here encoder->config_encoder for two connectors but a single encoder
>> will give back a empty encoder.
>>> +                drm_connector_attach_encoder(connector,
>>> +                                 encoder->encoder);
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    list_for_each_entry(item, &configfs->crtcs_group.cg_children,
>>> +                ci_entry) {
>>> +        struct vkms_config_crtc *config_crtc =
>>> +            item_to_config_crtc(item);
>>> +        struct vkms_crtc *vkms_crtc;
>>> +        struct drm_plane *primary = NULL, *cursor = NULL;
>>> +
>>> +        for (int j = 0; j < output->num_planes; j++) {
>>> +            struct plane_map *plane_entry = &plane_map[j];
>>> +            struct drm_plane *plane = &plane_entry->plane->base;
>>> +
>>> +            if (!is_object_linked(
>>> +                    &plane_entry->config_plane->possible_crtcs,
>>> +                    config_crtc->crtc_config_idx)) {
>>> +                continue;
>>> +            }
>>> +
>>> +            if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
>>> +                if (primary) {
>>> +                    DRM_WARN(
>>> +                        "Too many primary planes found for crtc %s.",
>>> +                        item->ci_name);
>>> +                    return EINVAL;
>>> +                }
>>> +                primary = plane;
>>> +            } else if (plane->type == DRM_PLANE_TYPE_CURSOR) {
>>> +                if (cursor) {
>>> +                    DRM_WARN(
>>> +                        "Too many cursor planes found for crtc %s.",
>>> +                        item->ci_name);
>>> +                    return EINVAL;
>>> +                }
>>> +                cursor = plane;
>>> +            }
>>> +        }
>>> +
>>> +        if (!primary) {
>>> +            DRM_WARN("No primary plane configured for crtc %s",
>>> +                 item->ci_name);
>>> +            return EINVAL;
>>> +        }
>>> +
>>> +        vkms_crtc =
>>> +            vkms_crtc_init(vkmsdev, primary, cursor, item->ci_name);
>>> +        if (IS_ERR(vkms_crtc)) {
>>> +            DRM_WARN("Unable to init crtc from config: %s",
>>> +                 item->ci_name);
>>> +            return PTR_ERR(vkms_crtc);
>>> +        }
>>> +
>>> +        for (int j = 0; j < output->num_planes; j++) {
>>> +            struct plane_map *plane_entry = &plane_map[j];
>>> +
>>> +            if (!plane_entry->plane)
>>> +                break;
>>> +
>>> +            if (is_object_linked(
>>> +                    &plane_entry->config_plane->possible_crtcs,
>>> +                    config_crtc->crtc_config_idx)) {
>>> +                plane_entry->plane->base.possible_crtcs |=
>>> +                    drm_crtc_mask(&vkms_crtc->base);
>>> +            }
>>> +        }
>>> +
>>> +        for (int j = 0; j < output->num_encoders; j++) {
>>> +            struct encoder_map *encoder_entry = &encoder_map[j];
>>> +
>>> +            if (is_object_linked(&encoder_entry->config_encoder
>>> +                              ->possible_crtcs,
>>> +                         config_crtc->crtc_config_idx)) {
>>> +                encoder_entry->encoder->possible_crtcs |=
>>> +                    drm_crtc_mask(&vkms_crtc->base);
>>> +            }
>>> +        }
>>> +
>>> +        if (vkmsdev->config.writeback) {
>>> +            int ret = vkms_enable_writeback_connector(vkmsdev,
>>> +                                  vkms_crtc);
>>> +            if (ret)
>>> +                DRM_WARN(
>>> +                    "Failed to init writeback connector for config 
>>> crtc: %s. Error code %d",
>>> +                    item->ci_name, ret);
>>> +        }
>>> +    }
>> I think we might be needing here a test for missing symlinks - invalid
>> configurations, like unused crtcs, encoders, connectors. I
>> suppose anything that's not matched with is_object_linked(),
>> such we avoid invalid configuration found by drm_mode_config_validate()
>> and inform users about missing them.
>>
>> An example here would be to create a second encoder, connector, crtc and
>> not symlink them to their possible_encoders,possible_crtcs mask. An
>> i-g-t test for this very thing would be needed to stress different kind
>> of combinations.
> 
> I wonder about this.  Shouldn't a user be free to create dangling files 
> to simulate some scenario?

Problem is we end up with invalid pipelines which would be invalided by 
`drm_mode_config_validate()`, further more leading to kernel 
warns/errors. That seems to be case now. If the system is still usable 
--  while still having these missing bits, and possibly inform the user 
about an invalid pipeline would be ideal.

> 
> I could see a further development to publish a warning in the log, but 
> disallowing it seems overly restrictive.

Sure, I think ideally this should be the case, if we can do that in the 
first place, given that we operate on a transaction model, only when 
enable it we go over all items that were created/added by the user. 
Dangling or not, my impression is that these invalid bits need to be 
dropped entirely when submitted back to the DRM helpers.

If the user configures 3 pipelines, two correctly, and one not,  still 
allow those two pipelines to work and inform that it might have an 
invalid one, rather than invalidating the entire config, I think that's 
the point.
> 
> Either way we could accomplish this pretty easily by adding a flag to 
> each vkms object in the form of `bool is_linked` and set it when we 
> detect it's linked.  Then at the end iterate through all planes, 
> encoders, connectors, crtcs that can be linked and if they are not just 
> publish a warning saying
> 
> kwarn: "crtc/plane/encoder $NAME is created but unlinked"
Yeah, that would be really good.
> 
> IGT tests to test that that was done make sense to me.
> 
>>> +
>>> +    drm_mode_config_reset(dev);
>>> +
>>> +    return 0;
>>>   }
>>> -- 
>>> 2.41.0.162.gfafddb0af9-goog
>>>
