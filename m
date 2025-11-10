Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E00C450DD
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 06:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3916410E2A7;
	Mon, 10 Nov 2025 05:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Mon, 10 Nov 2025 05:59:14 UTC
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FCA10E2A7
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 05:59:14 +0000 (UTC)
X-UUID: ab57b4d0bdf911f0a38c85956e01ac42-20251110
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:2f6e72d8-d770-4979-b607-3281a7764172, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:b0e8edb61dd256a2a58d8e2f3ba068b7,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|15|52,E
 DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
 :0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ab57b4d0bdf911f0a38c85956e01ac42-20251110
X-User: oushixiong@kylinos.cn
Received: from [10.42.17.251] [(10.44.16.150)] by mailgw.kylinos.cn
 (envelope-from <oushixiong@kylinos.cn>)
 (Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
 with ESMTP id 1072133735; Mon, 10 Nov 2025 13:54:06 +0800
Message-ID: <376a4a95-5428-47d6-9da5-51c8141e71d1@kylinos.cn>
Date: Mon, 10 Nov 2025 13:54:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/fb-helper: add fbdev screen expended mode display
 support
To: Thomas Zimmermann <tzimmermann@suse.de>, oushixiong1025@163.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tiger Liu <liuyihu@kylinos.cn>
References: <20251107092641.111431-1-oushixiong1025@163.com>
 <15166a78-b603-464a-8fa5-b7dd43d55029@suse.de>
Content-Language: en-US
From: Shixiong Ou <oushixiong@kylinos.cn>
In-Reply-To: <15166a78-b603-464a-8fa5-b7dd43d55029@suse.de>
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


在 2025/11/7 18:06, Thomas Zimmermann 写道:
>
>
> Am 07.11.25 um 10:26 schrieb oushixiong1025@163.com:
>> From: Shixiong Ou <oushixiong@kylinos.cn>
>>
>> Add fbdev screen extended mode display support
>
> What? What is this about?
>
If an fbdev device has multiple screens, they are mirrored by default.
This patch aims to enable extended display for the tty, allowing 
horizontal or
vertical expansion to achieve a screen splicing effect in the tty terminal.

Best regards,
Shixiong

>>
>> Signed-off-by: Tiger Liu <liuyihu@kylinos.cn>
>> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
>> ---
>>   drivers/gpu/drm/drm_fb_helper.c | 143 ++++++++++++++++++++++++++++++--
>>   1 file changed, 135 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c 
>> b/drivers/gpu/drm/drm_fb_helper.c
>> index 53e9dc0543de..a6ec03bf3aef 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -78,6 +78,17 @@ MODULE_PARM_DESC(drm_leak_fbdev_smem,
>>            "Allow unsafe leaking fbdev physical smem address 
>> [default=false]");
>>   #endif
>>   +#define SCREEN_CLONE            0x0
>> +#define SCREEN_EXPAND_HORIZONTAL    0x1
>> +#define SCREEN_EXPAND_VERTICAL        0x2
>> +
>> +static bool drm_fbdev_screen_expand_mode_enabled;
>> +static int drm_fbdev_screen_mode = SCREEN_CLONE;
>> +module_param_named(screen_mode, drm_fbdev_screen_mode, int, 0444);
>> +MODULE_PARM_DESC(screen_mode,
>> +         "Screen display of the fbdev. [0 = clone(default), 1 = 
>> expand horizontally,"
>> +         "2 = expand vertically]");
>> +
>>   static LIST_HEAD(kernel_fb_helper_list);
>>   static DEFINE_MUTEX(kernel_fb_helper_lock);
>>   @@ -1345,15 +1356,35 @@ int drm_fb_helper_set_par(struct fb_info 
>> *info)
>>   }
>>   EXPORT_SYMBOL(drm_fb_helper_set_par);
>>   -static void pan_set(struct drm_fb_helper *fb_helper, int dx, int dy)
>> +static void pan_set_locked(struct drm_client_dev *client,
>> +               int dx, int dy)
>>   {
>>       struct drm_mode_set *mode_set;
>> +    int screen_x_offset = dx;
>> +    int screen_y_offset = dy;
>>   -    mutex_lock(&fb_helper->client.modeset_mutex);
>> -    drm_client_for_each_modeset(mode_set, &fb_helper->client) {
>> -        mode_set->x += dx;
>> -        mode_set->y += dy;
>> +    drm_client_for_each_modeset(mode_set, client) {
>> +        if (drm_fbdev_screen_expand_mode_enabled) {
>> +            if (drm_fbdev_screen_mode == SCREEN_EXPAND_HORIZONTAL) {
>> +                mode_set->x += screen_x_offset;
>> +                mode_set->y += screen_y_offset;
>> +                screen_x_offset += mode_set->mode->hdisplay;
>> +            } else if (drm_fbdev_screen_mode == 
>> SCREEN_EXPAND_VERTICAL) {
>> +                mode_set->x += screen_x_offset;
>> +                mode_set->y += screen_y_offset;
>> +                screen_y_offset += mode_set->mode->vdisplay;
>> +            }
>> +        } else {
>> +            mode_set->x = screen_x_offset;
>> +            mode_set->y = screen_y_offset;
>> +        }
>>       }
>> +}
>> +
>> +static void pan_set(struct drm_fb_helper *fb_helper, int dx, int dy)
>> +{
>> +    mutex_lock(&fb_helper->client.modeset_mutex);
>> +    pan_set_locked(&fb_helper->client, dx, dy);
>>       mutex_unlock(&fb_helper->client.modeset_mutex);
>>   }
>>   @@ -1387,10 +1418,8 @@ static int pan_display_legacy(struct 
>> fb_var_screeninfo *var,
>>         mutex_lock(&client->modeset_mutex);
>>       drm_modeset_lock_all(fb_helper->dev);
>> +    pan_set_locked(client, var->xoffset, var->yoffset);
>>       drm_client_for_each_modeset(modeset, client) {
>> -        modeset->x = var->xoffset;
>> -        modeset->y = var->yoffset;
>> -
>>           if (modeset->num_connectors) {
>>               ret = drm_mode_set_config_internal(modeset);
>>               if (!ret) {
>> @@ -1461,6 +1490,94 @@ static uint32_t 
>> drm_fb_helper_find_format(struct drm_fb_helper *fb_helper, const
>>       return DRM_FORMAT_INVALID;
>>   }
>>   +/*
>> + * Check if the device supports extended mode
>> + *
>> + * return true if the device supports extended mode,
>> + * otherwise return false.
>> + */
>> +static bool drm_fb_helper_validate_extended_mode(struct 
>> drm_fb_helper *fb_helper,
>> +                         struct drm_fb_helper_surface_size *sizes)
>> +{
>> +    struct drm_client_dev *client = &fb_helper->client;
>> +    struct drm_device *dev = fb_helper->dev;
>> +    struct drm_mode_config *config = &dev->mode_config;
>> +    struct drm_mode_set *mode_set;
>> +    u32 crtc_count;
>> +
>> +    drm_client_for_each_modeset(mode_set, client) {
>> +        crtc_count++;
>> +
>> +        for (int j = 0; j < mode_set->num_connectors; j++) {
>> +            struct drm_connector *connector = mode_set->connectors[j];
>> +
>> +            if (connector->has_tile) {
>> +                drm_dbg_kms(client->dev,
>> +                        "Don't support extended with tile mode 
>> connector yet\n");
>> +                return false;
>> +            }
>> +        }
>> +    }
>> +
>> +    if (crtc_count < 2) {
>> +        drm_dbg_kms(client->dev,
>> +                "Only support extended mode when device have 
>> mult-crtcs\n");
>> +        return false;
>> +    }
>> +
>> +    if (drm_fbdev_screen_mode == SCREEN_EXPAND_HORIZONTAL) {
>> +        u32 x = 0;
>> +
>> +        drm_client_for_each_modeset(mode_set, client) {
>> +            struct drm_display_mode *desired_mode;
>> +
>> +            desired_mode = mode_set->mode;
>> +            x = mode_set->x;
>> +            sizes->fb_width = sizes->surface_width  += 
>> desired_mode->hdisplay;
>> +            sizes->surface_height =
>> +                min_t(u32, desired_mode->vdisplay + mode_set->y,
>> +                      sizes->surface_height);
>> +            sizes->fb_height = min_t(u32, desired_mode->vdisplay + 
>> mode_set->y,
>> +                         sizes->fb_height);
>> +        }
>> +        sizes->fb_width = sizes->surface_width += x;
>> +
>> +        if (sizes->fb_width > config->max_width) {
>> +            drm_dbg_kms(client->dev,
>> +                    "screen_buffer total width %d > config width %d\n",
>> +                    sizes->fb_width, config->max_width);
>> +            return false;
>> +        }
>> +    } else if (drm_fbdev_screen_mode == SCREEN_EXPAND_VERTICAL) {
>> +        u32 y = 0;
>> +
>> +        drm_client_for_each_modeset(mode_set, client) {
>> +            struct drm_display_mode *desired_mode;
>> +
>> +            desired_mode = mode_set->mode;
>> +            y = mode_set->y;
>> +            sizes->fb_height = sizes->surface_height += 
>> desired_mode->vdisplay;
>> +            sizes->surface_width =
>> +                min_t(u32, desired_mode->hdisplay + mode_set->x,
>> +                      sizes->surface_width);
>> +            sizes->fb_width = min_t(u32, desired_mode->hdisplay + 
>> mode_set->x,
>> +                        sizes->fb_width);
>> +        }
>> +        sizes->fb_height = sizes->surface_height += y;
>> +
>> +        if (sizes->fb_height > config->max_height) {
>> +            drm_dbg_kms(client->dev,
>> +                    "screen_buffer_total_height %d > config height 
>> %d\n",
>> +                    sizes->fb_height, config->max_height);
>> +            return false;
>> +        }
>> +    } else {
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>   static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper,
>>                         struct drm_fb_helper_surface_size *sizes)
>>   {
>> @@ -1527,6 +1644,16 @@ static int __drm_fb_helper_find_sizes(struct 
>> drm_fb_helper *fb_helper,
>>         /* first up get a count of crtcs now in use and new min/maxes 
>> width/heights */
>>       crtc_count = 0;
>> +
>> +    /* Check if we support extended mode. If we do, we will adjust 
>> the sizes accordingly. */
>> +    if (drm_fbdev_screen_mode &&
>> +        drm_fb_helper_validate_extended_mode(fb_helper, sizes)) {
>> +        drm_fbdev_screen_expand_mode_enabled = true;
>> +        drm_dbg_kms(dev, "Extended mode: horizontal expansion, 
>> width: %d, height: %d\n",
>> +                sizes->surface_width, sizes->surface_height);
>> +        return 0;
>> +    }
>> +
>>       drm_client_for_each_modeset(mode_set, client) {
>>           struct drm_display_mode *desired_mode;
>>           int x, y, j;
>
