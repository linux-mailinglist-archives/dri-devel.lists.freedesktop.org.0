Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F71B76951D
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 13:42:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCF610E267;
	Mon, 31 Jul 2023 11:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FED10E267
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 11:42:27 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9668B2E4;
 Mon, 31 Jul 2023 13:41:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1690803683;
 bh=kXAeucgHM8pQRaW5d1hxlWWePTwnI/+HQ2wiDfbJf2k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=myQxQ28nNpoPcrTwJUNxEnxaz/PfNtLQ6yH5NSneBXVY/ekqyX6kr2wNcG6cv+x04
 WM0xB4VI50WMDJDwZ/2LKseroOpun0Oa98zZateS+RBNeNpKI1LxFFSpNB6A0u4o/7
 fbepTTmDYwRMiZfa6xgOA1Kqn/a6n6ANbiUTZ7eg=
Message-ID: <f490e6ed-4553-445e-21a8-82f8baeda15b@ideasonboard.com>
Date: Mon, 31 Jul 2023 14:42:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm/bridge: Add debugfs print for bridge chains
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230721-drm-bridge-chain-debugfs-v2-1-76df94347962@ideasonboard.com>
 <20230725113718.GE31069@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230725113718.GE31069@pendragon.ideasonboard.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/07/2023 14:37, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Fri, Jul 21, 2023 at 06:01:39PM +0300, Tomi Valkeinen wrote:
>> DRM bridges are not visible to the userspace and it may not be
>> immediately clear if the chain is somehow constructed incorrectly. I
>> have had two separate instances of a bridge driver failing to do a
>> drm_bridge_attach() call, resulting in the bridge connector not being
>> part of the chain. In some situations this doesn't seem to cause issues,
>> but it will if DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is used.
>>
>> Add a debugfs file to print the bridge chains. For me, on this TI AM62
>> based platform, I get the following output:
>>
>> encoder[39]
>> 	bridge[0] type: 0, ops: 0x0
>> 	bridge[1] type: 0, ops: 0x0, OF: /bus@f0000/i2c@20000000/dsi@e:toshiba,tc358778
>> 	bridge[2] type: 0, ops: 0x3, OF: /bus@f0000/i2c@20010000/hdmi@48:lontium,lt8912b
>> 	bridge[3] type: 11, ops: 0x7, OF: /hdmi-connector:hdmi-connector
> 
> Names would be more readable than numbers, but I'm not sure that's
> really worth it. It can always be improved on top if desired.

For type and ops? I agree, but it might also make the output more 
cluttered. To be honest, I'm not sure if type and ops are useful here, I 
just felt that I should print something else than just the OF node =).

>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>> Changes in v2:
>> - Fixed compilation issue when !CONFIG_OF
>> - Link to v1: https://lore.kernel.org/r/20230721-drm-bridge-chain-debugfs-v1-1-8614ff7e890d@ideasonboard.com
>> ---
>>   drivers/gpu/drm/drm_bridge.c  | 50 +++++++++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/drm_debugfs.c |  3 +++
>>   include/drm/drm_bridge.h      |  5 +++++
>>   3 files changed, 58 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>> index c3d69af02e79..d3eb62d5ef3b 100644
>> --- a/drivers/gpu/drm/drm_bridge.c
>> +++ b/drivers/gpu/drm/drm_bridge.c
>> @@ -27,8 +27,10 @@
>>   #include <linux/mutex.h>
>>   
>>   #include <drm/drm_atomic_state_helper.h>
>> +#include <drm/drm_debugfs.h>
>>   #include <drm/drm_bridge.h>
>>   #include <drm/drm_encoder.h>
>> +#include <drm/drm_file.h>
>>   #include <drm/drm_of.h>
>>   #include <drm/drm_print.h>
>>   
>> @@ -1345,6 +1347,54 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>>   EXPORT_SYMBOL(of_drm_find_bridge);
>>   #endif
>>   
>> +#ifdef CONFIG_DEBUG_FS
>> +static int drm_bridge_chains_info(struct seq_file *m, void *data)
>> +{
>> +	struct drm_debugfs_entry *entry = m->private;
>> +	struct drm_device *dev = entry->dev;
>> +	struct drm_printer p = drm_seq_file_printer(m);
>> +	struct drm_mode_config *config = &dev->mode_config;
> 
> As Alexander reported, there's a crash for GPU drivers, as mode_config
> isn't initialized in that case. I would skip creating the debugfs entry
> if DRIVER_MODESET isn't set.

Yes, makes sense.

>> +	struct drm_encoder *encoder;
>> +	unsigned int bridge_idx = 0;
>> +
>> +	list_for_each_entry(encoder, &config->encoder_list, head) {
>> +		struct drm_bridge *bridge;
>> +
>> +		drm_printf(&p, "encoder[%u]\n", encoder->base.id);
>> +
>> +		bridge = drm_bridge_chain_get_first_bridge(encoder);
>> +
>> +		while (bridge) {
> 
> Would drm_for_each_bridge_in_chain() help ?

Yes.

>> +			drm_printf(&p, "\tbridge[%u] type: %u, ops: %#x",
>> +				   bridge_idx, bridge->type, bridge->ops);
>> +
>> +#ifdef CONFIG_OF
>> +			if (bridge->of_node)
>> +				drm_printf(&p, ", OF: %pOFfc", bridge->of_node);
>> +#endif
>> +
>> +			drm_printf(&p, "\n");
>> +
>> +			bridge_idx++;
>> +			bridge = drm_bridge_get_next_bridge(bridge);
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/* any use in debugfs files to dump individual planes/crtc/etc? */
> 
> Those can easily be listed from userspace, so I don't think that's
> needed.

Oops. That comment is not supposed to be there. It was a copy-paste error.

>> +static const struct drm_debugfs_info drm_bridge_debugfs_list[] = {
>> +	{"bridge_chains", drm_bridge_chains_info, 0},
> 
> Missing spaces after '{' and before '}'.

Yep.

>> +};
>> +
>> +void drm_bridge_debugfs_init(struct drm_minor *minor)
>> +{
>> +	drm_debugfs_add_files(minor->dev, drm_bridge_debugfs_list,
>> +			      ARRAY_SIZE(drm_bridge_debugfs_list));
>> +}
>> +#endif
>> +
>>   MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
>>   MODULE_DESCRIPTION("DRM bridge infrastructure");
>>   MODULE_LICENSE("GPL and additional rights");
>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>> index c90dbcffa0dc..3e89559d68cd 100644
>> --- a/drivers/gpu/drm/drm_debugfs.c
>> +++ b/drivers/gpu/drm/drm_debugfs.c
>> @@ -31,6 +31,7 @@
>>   
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_auth.h>
>> +#include <drm/drm_bridge.h>
>>   #include <drm/drm_client.h>
>>   #include <drm/drm_debugfs.h>
>>   #include <drm/drm_device.h>
>> @@ -272,6 +273,8 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>>   
>>   	drm_debugfs_add_files(minor->dev, drm_debugfs_list, DRM_DEBUGFS_ENTRIES);
>>   
>> +	drm_bridge_debugfs_init(minor);
>> +
>>   	if (drm_drv_uses_atomic_modeset(dev)) {
>>   		drm_atomic_debugfs_init(minor);
>>   	}
>> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
>> index bf964cdfb330..60dbee6bd1e6 100644
>> --- a/include/drm/drm_bridge.h
>> +++ b/include/drm/drm_bridge.h
>> @@ -949,4 +949,9 @@ static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
>>   }
>>   #endif
>>   
>> +#ifdef CONFIG_DEBUG_FS
> 
> You could drop the conditional compilation, it wouldn't hurt.

I used the same style as in drm_crtc_internal.h. But you're right, the 
ifdef doesn't really do much here.

>> +struct drm_minor;
>> +void drm_bridge_debugfs_init(struct drm_minor *minor);
>> +#endif
>> +
>>   #endif
>>
>> ---
>> base-commit: c7a472297169156252a50d76965eb36b081186e2
>> change-id: 20230721-drm-bridge-chain-debugfs-0bbc1522f57a
> 

  Tomi

