Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 076457BB2AF
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 09:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9989F10E4BE;
	Fri,  6 Oct 2023 07:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED2F10E4B8;
 Fri,  6 Oct 2023 07:51:48 +0000 (UTC)
Received: from [192.168.88.20] (91-157-153-81.elisa-laajakaista.fi
 [91.157.153.81])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33F1D63B;
 Fri,  6 Oct 2023 09:49:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1696578599;
 bh=XWtAQg8GXgTWs7nmApGqhg31c28AEyTd1g3eZbcqhO4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aeP5qpBnSbnZG+DsOqgQtq4FMrlZgbktqUO7jK3W8CNPZFlrAmKs/XXIgSCk8zuO9
 p+yi5Z24BFVD3BUnJ2s5KkRLmCIrEUxxLUlItv7JDFAc1Bd8pHIqPXVCh27O3RH6S3
 /foHQwOGF0a88y4rueasTzjT43Cbco4wM6iZmklA=
Message-ID: <aae055a1-6925-ce2f-1d17-7e119c78e9f7@ideasonboard.com>
Date: Fri, 6 Oct 2023 10:51:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/3] drm/bridge: migrate bridge_chains to per-encoder file
Content-Language: en-US
To: neil.armstrong@linaro.org, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230904015338.2941417-1-dmitry.baryshkov@linaro.org>
 <20230904015338.2941417-3-dmitry.baryshkov@linaro.org>
 <11a07867-8799-479f-b5b6-e3fd9bb31dbc@linaro.org>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <11a07867-8799-479f-b5b6-e3fd9bb31dbc@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 06/10/2023 10:35, Neil Armstrong wrote:
> Hi,
> 
> On 04/09/2023 03:53, Dmitry Baryshkov wrote:
>> Instead of having a single file with all bridge chains, list bridges
>> under a corresponding per-encoder debugfs directory.
>>
>> Example of the listing:
>>
>> $ cat /sys/kernel/debug/dri/0/encoder-0/bridges
>> bridge[0]: dsi_mgr_bridge_funcs
>>     type: [0] Unknown
>>     ops: [0]
>> bridge[1]: lt9611uxc_bridge_funcs
>>     type: [11] HDMI-A
>>     OF: /soc@0/geniqup@9c0000/i2c@994000/hdmi-bridge@2b:lontium,lt9611uxc
>>     ops: [7] detect edid hpd
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/drm_bridge.c  | 44 -----------------------------------
>>   drivers/gpu/drm/drm_debugfs.c | 39 ++++++++++++++++++++++++++++---
>>   include/drm/drm_bridge.h      |  2 --
>>   3 files changed, 36 insertions(+), 49 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>> index 39e68e45bb12..cee3188adf3d 100644
>> --- a/drivers/gpu/drm/drm_bridge.c
>> +++ b/drivers/gpu/drm/drm_bridge.c
>> @@ -1347,50 +1347,6 @@ struct drm_bridge *of_drm_find_bridge(struct 
>> device_node *np)
>>   EXPORT_SYMBOL(of_drm_find_bridge);
>>   #endif
>> -#ifdef CONFIG_DEBUG_FS
>> -static int drm_bridge_chains_info(struct seq_file *m, void *data)
>> -{
>> -    struct drm_debugfs_entry *entry = m->private;
>> -    struct drm_device *dev = entry->dev;
>> -    struct drm_printer p = drm_seq_file_printer(m);
>> -    struct drm_mode_config *config = &dev->mode_config;
>> -    struct drm_encoder *encoder;
>> -    unsigned int bridge_idx = 0;
>> -
>> -    list_for_each_entry(encoder, &config->encoder_list, head) {
>> -        struct drm_bridge *bridge;
>> -
>> -        drm_printf(&p, "encoder[%u]\n", encoder->base.id);
>> -
>> -        drm_for_each_bridge_in_chain(encoder, bridge) {
>> -            drm_printf(&p, "\tbridge[%u] type: %u, ops: %#x",
>> -                   bridge_idx, bridge->type, bridge->ops);
>> -
>> -#ifdef CONFIG_OF
>> -            if (bridge->of_node)
>> -                drm_printf(&p, ", OF: %pOFfc", bridge->of_node);
>> -#endif
>> -
>> -            drm_printf(&p, "\n");
>> -
>> -            bridge_idx++;
>> -        }
>> -    }
>> -
>> -    return 0;
>> -}
>> -
>> -static const struct drm_debugfs_info drm_bridge_debugfs_list[] = {
>> -    { "bridge_chains", drm_bridge_chains_info, 0 },
>> -};
>> -
>> -void drm_bridge_debugfs_init(struct drm_minor *minor)
>> -{
>> -    drm_debugfs_add_files(minor->dev, drm_bridge_debugfs_list,
>> -                  ARRAY_SIZE(drm_bridge_debugfs_list));
>> -}
>> -#endif
>> -
>>   MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
>>   MODULE_DESCRIPTION("DRM bridge infrastructure");
>>   MODULE_LICENSE("GPL and additional rights");
>> diff --git a/drivers/gpu/drm/drm_debugfs.c 
>> b/drivers/gpu/drm/drm_debugfs.c
>> index cf7f33bdc963..70913067406d 100644
>> --- a/drivers/gpu/drm/drm_debugfs.c
>> +++ b/drivers/gpu/drm/drm_debugfs.c
>> @@ -273,10 +273,8 @@ int drm_debugfs_init(struct drm_minor *minor, int 
>> minor_id,
>>       drm_debugfs_add_files(minor->dev, drm_debugfs_list, 
>> DRM_DEBUGFS_ENTRIES);
>> -    if (drm_drv_uses_atomic_modeset(dev)) {
>> +    if (drm_drv_uses_atomic_modeset(dev))
>>           drm_atomic_debugfs_init(minor);
>> -        drm_bridge_debugfs_init(minor);
>> -    }
>>       if (drm_core_check_feature(dev, DRIVER_MODESET)) {
>>           drm_framebuffer_debugfs_init(minor);
>> @@ -603,6 +601,37 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc)
>>       crtc->debugfs_entry = NULL;
>>   }
>> +static int bridges_show(struct seq_file *m, void *data)
>> +{
>> +    struct drm_encoder *encoder = m->private;
>> +    struct drm_bridge *bridge;
>> +    unsigned int idx = 0;
>> +
>> +    drm_for_each_bridge_in_chain(encoder, bridge) {
>> +        seq_printf(m, "bridge[%d]: %ps\n", idx++, bridge->funcs);
>> +        seq_printf(m, "\ttype: [%d] %s\n",
>> +               bridge->type,
>> +               drm_get_connector_type_name(bridge->type));
>> +#ifdef CONFIG_OF
>> +        if (bridge->of_node)
>> +            seq_printf(m, "\tOF: %pOFfc\n", bridge->of_node);
>> +#endif
>> +        seq_printf(m, "\tops: [0x%x]", bridge->ops);
>> +        if (bridge->ops & DRM_BRIDGE_OP_DETECT)
>> +            seq_puts(m, " detect");
>> +        if (bridge->ops & DRM_BRIDGE_OP_EDID)
>> +            seq_puts(m, " edid");
>> +        if (bridge->ops & DRM_BRIDGE_OP_HPD)
>> +            seq_puts(m, " hpd");
>> +        if (bridge->ops & DRM_BRIDGE_OP_MODES)
>> +            seq_puts(m, " modes");
>> +        seq_puts(m, "\n");
>> +    }
>> +
>> +    return 0;
>> +}
>> +DEFINE_SHOW_ATTRIBUTE(bridges);
>> +
>>   void drm_debugfs_encoder_add(struct drm_encoder *encoder)
>>   {
>>       struct drm_minor *minor = encoder->dev->primary;
>> @@ -618,6 +647,10 @@ void drm_debugfs_encoder_add(struct drm_encoder 
>> *encoder)
>>       encoder->debugfs_entry = root;
>> +    /* bridges list */
>> +    debugfs_create_file("bridges", 0444, root, encoder,
>> +                &bridges_fops);
>> +
>>       if (encoder->funcs->debugfs_init)
>>           encoder->funcs->debugfs_init(encoder, root);
>>   }
>> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
>> index c339fc85fd07..902bc3f99c2a 100644
>> --- a/include/drm/drm_bridge.h
>> +++ b/include/drm/drm_bridge.h
>> @@ -950,6 +950,4 @@ static inline struct drm_bridge 
>> *drmm_of_get_bridge(struct drm_device *drm,
>>   }
>>   #endif
>> -void drm_bridge_debugfs_init(struct drm_minor *minor);
>> -
>>   #endif
> 
> It would be nice to have a review from Tomi since he pushed the bridge 
> chains debugfs.
> 
> Apart that it looks fine:
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

This change does more than move the code to per-encoder debugfs file: it 
changes the formatting, adding textual representations for the flags, 
and drops the use of drm_printer.

I'd prefer to have such changes separately, but as it's a small patch I 
guess it's fine-ish. But they should at least be mentioned in the patch 
description.

With that addressed:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

