Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7706FA1CF
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 10:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7F210E14E;
	Mon,  8 May 2023 08:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D1510E14E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 08:01:12 +0000 (UTC)
Received: from [IPV6:2a02:2f05:8115:9300:9eb6:d0ff:fe91:8037] (unknown
 [IPv6:2a02:2f05:8115:9300:9eb6:d0ff:fe91:8037])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8DFCF6603232;
 Mon,  8 May 2023 09:01:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1683532871;
 bh=Ta+fDQpyCJ5xZRTM/ar3vc0uN38wweEAf+HdFJry0l0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=i2rzElNMUbJKs4CQSvQS9k5W1jE90JHBpvzY4V9bccYptv3xMaqYfNCsG0n/ZS9e+
 Ni1pdSW1MCEhP+ogejW4iOH1GjR5uZuqkB3XkyPv3uY8y5nXBaW/yFu3q40bIRf9YR
 3zqwyaoL/7acLo2j7XMO6CPF0zbOuTXZgWdpLYJb/7985+7osEtKZNZV6rb9HYIsC6
 hKv0X0Hl33/v8awRRr26V7YF0W7Gk1fYSc/YsI1lMX0bY4t8TLlguiKsyXfDkl2H+z
 HnEgeY2Fcf9gl668wZT83N7UUmHYYgJd4LtDQMGqR/Gabqi5bYtcG9asweEE22gQvr
 yhWfrf4mI1VNA==
Message-ID: <dce92ae0-3b8f-c059-aefc-601b6d272a5c@collabora.com>
Date: Mon, 8 May 2023 11:01:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 2/3] vkms: Add support for multiple pipes
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
References: <20230426104059.28732-1-marius.vlad@collabora.com>
 <20230426104059.28732-3-marius.vlad@collabora.com>
 <44246b67-fc44-8ab1-0d0b-6d70fa67adcb@igalia.com>
Content-Language: en-US
From: Marius Vlad <marius.vlad@collabora.com>
In-Reply-To: <44246b67-fc44-8ab1-0d0b-6d70fa67adcb@igalia.com>
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
Cc: mwen@igalia.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 yixie@chromium.org, melissa.srw@gmail.com, brpol@chromium.org,
 igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/4/23 15:20, Maíra Canal wrote:
> Hi Marius,
> 
> I'm not sure if you'll keep working in this series after the proposal of
> the Chromium folks. Anyway, just a small comment.

Hi Maíra,

No worries, thanks for a lot for taking another look. I've added another 
patch to adjust the number of overalys, rather than the pipes. It will 
probably take some time until that configFS series make it through though.

> 
> On 4/26/23 07:40, Marius Vlad wrote:
>> This adds support for creating multiple virtual pipes, in case one would
>> need to display multiple independent things on different outputs.
>>
>> We use a module parameter to specify how many to create,  defaulting to
>> just one with the possibility of specifying a maximum of 4 possible 
>> pipes.
>>
>> This is of particular importance when testing out the DRM back-end in
>> compositors, but also to be able to independently set different DPMS 
>> states.
>>
>> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
>> ---
>>   drivers/gpu/drm/vkms/vkms_crtc.c      |  3 +--
>>   drivers/gpu/drm/vkms/vkms_drv.c       | 38 ++++++++++++++++++++++-----
>>   drivers/gpu/drm/vkms/vkms_drv.h       | 12 ++++++---
>>   drivers/gpu/drm/vkms/vkms_output.c    |  5 ++--
>>   drivers/gpu/drm/vkms/vkms_writeback.c | 24 ++++++++---------
>>   5 files changed, 55 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c 
>> b/drivers/gpu/drm/vkms/vkms_crtc.c
>> index 515f6772b866..051e7b647db9 100644
>> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
>> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
>> @@ -89,8 +89,7 @@ static bool vkms_get_vblank_timestamp(struct 
>> drm_crtc *crtc,
>>   {
>>       struct drm_device *dev = crtc->dev;
>>       unsigned int pipe = crtc->index;
>> -    struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
>> -    struct vkms_output *output = &vkmsdev->output;
>> +    struct vkms_output *output = drm_crtc_to_vkms_output(crtc);
>>       struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
>>       if (!READ_ONCE(vblank->enabled)) {
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c 
>> b/drivers/gpu/drm/vkms/vkms_drv.c
>> index e3c9c9571c8d..0ee17065bc6f 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.c
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> 
> [...]
> 
>> @@ -230,7 +243,18 @@ static int __init vkms_init(void)
>>       config->cursor = enable_cursor;
>>       config->writeback = enable_writeback;
>>       config->overlay = enable_overlay;
>> -
>> +    config->max_pipes = max_pipes;
>> +    if (config->max_pipes > NUM_MAX_PIPES)
>> +        config->max_pipes = NUM_MAX_PIPES;
>> +    if (config->max_pipes < NUM_MIN_PIPES)
>> +        config->max_pipes = NUM_MIN_PIPES;
>> +
>> +    /* with 8 overlays and 4 pipes we exceed the amount of planes we
>> +     * have; see __drm_universal_plane_init() */
>> +    if (config->overlay && config->max_pipes == NUM_MAX_PIPES)
>> +        config->max_pipes = NUM_MAX_PIPES - 1;
> 
> Instead of reducing the number of pipes, you could change the maximum 
> number
> of overlay planes to 6-4 planes. So many overlay planes are not that needed
> and it would be nice to have 4 pipes with overlay planes enabled.
> 
> Best Regards,
> - Maíra Canal
> 
>> +
>> +    DRM_INFO("Initialized with %u pipes\n", config->max_pipes);
>>       ret = vkms_create(config);
>>       if (ret)
>>           kfree(config);
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h 
>> b/drivers/gpu/drm/vkms/vkms_drv.h
>> index f152d54baf76..b096832ed0f2 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
>> @@ -21,7 +21,9 @@
>>   #define XRES_MAX  8192
>>   #define YRES_MAX  8192
>> -#define NUM_OVERLAY_PLANES 8
>> +#define NUM_OVERLAY_PLANES    8
>> +#define NUM_MAX_PIPES        4
>> +#define NUM_MIN_PIPES        1
>>   struct vkms_frame_info {
>>       struct drm_framebuffer *fb;
>> @@ -112,6 +114,7 @@ struct vkms_config {
>>       bool writeback;
>>       bool cursor;
>>       bool overlay;
>> +    unsigned int max_pipes;
>>       /* only set when instantiated */
>>       struct vkms_device *dev;
>>   };
>> @@ -119,13 +122,16 @@ struct vkms_config {
>>   struct vkms_device {
>>       struct drm_device drm;
>>       struct platform_device *platform;
>> -    struct vkms_output output;
>> +    struct vkms_output output[NUM_MAX_PIPES];
>>       const struct vkms_config *config;
>>   };
>>   #define drm_crtc_to_vkms_output(target) \
>>       container_of(target, struct vkms_output, crtc)
>> +#define wb_connector_to_vkms_output(target) \
>> +    container_of(target, struct vkms_output, wb_connector)
>> +
>>   #define drm_device_to_vkms_device(target) \
>>       container_of(target, struct vkms_device, drm)
>> @@ -157,6 +163,6 @@ void vkms_set_composer(struct vkms_output *out, 
>> bool enabled);
>>   void vkms_compose_row(struct line_buffer *stage_buffer, struct 
>> vkms_plane_state *plane, int y);
>>   /* Writeback */
>> -int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
>> +int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, int 
>> index);
>>   #endif /* _VKMS_DRV_H_ */
>> diff --git a/drivers/gpu/drm/vkms/vkms_output.c 
>> b/drivers/gpu/drm/vkms/vkms_output.c
>> index 1b8aa3a34e46..9c801b8c4c12 100644
>> --- a/drivers/gpu/drm/vkms/vkms_output.c
>> +++ b/drivers/gpu/drm/vkms/vkms_output.c
>> @@ -48,7 +48,7 @@ static int vkms_add_overlay_plane(struct vkms_device 
>> *vkmsdev, int index,
>>   int vkms_output_init(struct vkms_device *vkmsdev, int index)
>>   {
>> -    struct vkms_output *output = &vkmsdev->output;
>> +    struct vkms_output *output = &vkmsdev->output[index];
>>       struct drm_device *dev = &vkmsdev->drm;
>>       struct drm_connector *connector = &output->connector;
>>       struct drm_encoder *encoder = &output->encoder;
>> @@ -104,12 +104,11 @@ int vkms_output_init(struct vkms_device 
>> *vkmsdev, int index)
>>       }
>>       if (vkmsdev->config->writeback) {
>> -        writeback = vkms_enable_writeback_connector(vkmsdev);
>> +        writeback = vkms_enable_writeback_connector(vkmsdev, index);
>>           if (writeback)
>>               DRM_ERROR("Failed to init writeback connector\n");
>>       }
>> -    drm_mode_config_reset(dev);
>>       return 0;
>> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c 
>> b/drivers/gpu/drm/vkms/vkms_writeback.c
>> index 84a51cd281b9..5f291689f870 100644
>> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
>> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
>> @@ -101,7 +101,7 @@ static void vkms_wb_cleanup_job(struct 
>> drm_writeback_connector *connector,
>>                   struct drm_writeback_job *job)
>>   {
>>       struct vkms_writeback_job *vkmsjob = job->priv;
>> -    struct vkms_device *vkmsdev;
>> +    struct vkms_output *output = wb_connector_to_vkms_output(connector);
>>       if (!job->fb)
>>           return;
>> @@ -110,19 +110,18 @@ static void vkms_wb_cleanup_job(struct 
>> drm_writeback_connector *connector,
>>       drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
>> -    vkmsdev = drm_device_to_vkms_device(job->fb->dev);
>> -    vkms_set_composer(&vkmsdev->output, false);
>> +    vkms_set_composer(output, false);
>>       kfree(vkmsjob);
>>   }
>>   static void vkms_wb_atomic_commit(struct drm_connector *conn,
>>                     struct drm_atomic_state *state)
>>   {
>> -    struct drm_connector_state *connector_state = 
>> drm_atomic_get_new_connector_state(state,
>> -                                             conn);
>> -    struct vkms_device *vkmsdev = drm_device_to_vkms_device(conn->dev);
>> -    struct vkms_output *output = &vkmsdev->output;
>> -    struct drm_writeback_connector *wb_conn = &output->wb_connector;
>> +    struct drm_connector_state *connector_state =
>> +        drm_atomic_get_new_connector_state(state, conn);
>> +    struct drm_writeback_job *wb_job = connector_state->writeback_job;
>> +    struct drm_writeback_connector *wb_conn = wb_job->connector;
>> +    struct vkms_output *output = wb_connector_to_vkms_output(wb_conn);
>>       struct drm_connector_state *conn_state = wb_conn->base.state;
>>       struct vkms_crtc_state *crtc_state = output->composer_state;
>>       struct drm_framebuffer *fb = connector_state->writeback_job->fb;
>> @@ -135,7 +134,7 @@ static void vkms_wb_atomic_commit(struct 
>> drm_connector *conn,
>>       if (!conn_state)
>>           return;
>> -    vkms_set_composer(&vkmsdev->output, true);
>> +    vkms_set_composer(output, true);
>>       active_wb = conn_state->writeback_job->priv;
>>       wb_frame_info = &active_wb->wb_frame_info;
>> @@ -147,6 +146,7 @@ static void vkms_wb_atomic_commit(struct 
>> drm_connector *conn,
>>       wb_frame_info->cpp = fb->format->cpp[0];
>>       crtc_state->wb_pending = true;
>>       spin_unlock_irq(&output->composer_lock);
>> +
>>       drm_writeback_queue_job(wb_conn, connector_state);
>>       active_wb->wb_write = get_line_to_frame_function(wb_format);
>>       drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);
>> @@ -160,9 +160,9 @@ static const struct drm_connector_helper_funcs 
>> vkms_wb_conn_helper_funcs = {
>>       .atomic_commit = vkms_wb_atomic_commit,
>>   };
>> -int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
>> +int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, int 
>> index)
>>   {
>> -    struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
>> +    struct drm_writeback_connector *wb = 
>> &vkmsdev->output[index].wb_connector;
>>       drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
>> @@ -171,5 +171,5 @@ int vkms_enable_writeback_connector(struct 
>> vkms_device *vkmsdev)
>>                           &vkms_wb_encoder_helper_funcs,
>>                           vkms_wb_formats,
>>                           ARRAY_SIZE(vkms_wb_formats),
>> -                        1);
>> +                        1 << index);
>>   }
