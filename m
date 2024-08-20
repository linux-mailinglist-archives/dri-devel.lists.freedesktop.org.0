Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3CB958384
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 12:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A4A10E679;
	Tue, 20 Aug 2024 10:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="eK7M9ze3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2DE10E679
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 10:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6qHuklP1R3JmiSKEAlF05KWokF+xBh39awzkisLJtNE=; b=eK7M9ze3yXv93Q755wvkfH0kY3
 UOZRJeQhjURMnSmWESAnF97TlX3giKHBh9dZ4lkNv2QtuRxa+XcxOMmEL0lSBv2LS3DtRWs0sXuXp
 9kYCIhBk2Bu2s0bhQioXoj9g8T7bVtKGlG6frQdHgrQ/YQTXkufK31GLVLytFp6LvBPxzmEKcQ4br
 TTr/+SXKwnX1xQvhZdAqcw4KhoWF1FEr0vHjhbvI5Z74PXkZ6VKb+O7aBha6AlwQryxUmYvaCxvq/
 bfFfNbla7TjQOx86WBs+yKt4UINZtRDiIRVGfAaJ+FVrSZvlh2PNQaGzCemSdRrXD4Y+eZFCZEa0P
 uSiCEHuw==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sgLi1-002ZY7-05; Tue, 20 Aug 2024 12:03:24 +0200
Message-ID: <1ecee242-6f47-499c-b16e-983eb632b98a@igalia.com>
Date: Tue, 20 Aug 2024 07:03:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/4] drm/vkms: Switch to managed for connector
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, melissa.srw@gmail.com,
 miquel.raynal@bootlin.com, mripard@kernel.org, nicolejadeyee@google.com,
 rodrigosiqueiramelo@gmail.com, seanpaul@google.com,
 thomas.petazzoni@bootlin.com, tzimmermann@suse.de
References: <20240814-google-vkms-managed-v1-1-7ab8b8921103@bootlin.com>
 <20240820090912.2854-1-jose.exposito89@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240820090912.2854-1-jose.exposito89@gmail.com>
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

Hi Louis,

On 8/20/24 06:09, José Expósito wrote:
> Hi Louis,
> 
> Thanks for these patches. Easy review as my configfs series included similar
> patches :) I think that this series could be easily rebased on drm-misc-next,
> but I don't know if that'd add a lot of work rebasing other series. I'd be nice
> to get these 4 merged.
> 

I'm with José on this one. If you rebase it on top of drm-misc-next, I 
can review faster and merge this patches right away.

Best Regards,
- Maíra

>> The current VKMS driver uses non-managed function to create connectors. It
>> is not an issue yet, but in order to support multiple devices easily,
>> convert this code to use drm and device managed helpers.
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> Reviewed-by: José Expósito <jose.exposito89@gmail.com>
> 
>> ---
>>   drivers/gpu/drm/vkms/vkms_drv.h    |  1 -
>>   drivers/gpu/drm/vkms/vkms_output.c | 22 ++++++++++------------
>>   2 files changed, 10 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
>> index f74a5c2045f9..cea7b2640c5d 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
>> @@ -43,7 +43,6 @@
>>   struct vkms_output {
>>   	struct drm_crtc crtc;
>>   	struct drm_encoder encoder;
>> -	struct drm_connector connector;
>>   	struct drm_writeback_connector wb_connector;
>>   	struct hrtimer vblank_hrtimer;
>>   	ktime_t period_ns;
>> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
>> index 20073a00b200..4767838c3a73 100644
>> --- a/drivers/gpu/drm/vkms/vkms_output.c
>> +++ b/drivers/gpu/drm/vkms/vkms_output.c
>> @@ -3,6 +3,7 @@
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_edid.h>
>>   #include <drm/drm_probe_helper.h>
>> +#include <drm/drm_managed.h>
> 
> Nit: Keep includes sorted alphabetically if possible
> 
>>   
>>   #include "vkms_writeback.h"
>>   #include "vkms_plane.h"
>> @@ -10,7 +11,6 @@
>>   
>>   static const struct drm_connector_funcs vkms_connector_funcs = {
>>   	.fill_modes = drm_helper_probe_single_connector_modes,
>> -	.destroy = drm_connector_cleanup,
>>   	.reset = drm_atomic_helper_connector_reset,
>>   	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>>   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>> @@ -54,7 +54,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
>>   {
>>   	struct vkms_output *output = &vkmsdev->output;
>>   	struct drm_device *dev = &vkmsdev->drm;
>> -	struct drm_connector *connector = &output->connector;
>> +	struct drm_connector *connector;
>>   	struct drm_encoder *encoder = &output->encoder;
>>   	struct drm_crtc *crtc = &output->crtc;
>>   	struct vkms_plane *primary, *cursor = NULL;
>> @@ -90,11 +90,15 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
>> -				 DRM_MODE_CONNECTOR_VIRTUAL);
>> +	connector = drmm_kzalloc(&vkmsdev->drm, sizeof(*connector), GFP_KERNEL);
> 
> "&vkmsdev->drm" can be replaced with "dev".
> 
>> +	if (!connector)
> 
> For consistency with the init function, it'd be nice to log this error as well:
> 
> 		DRM_ERROR("Failed to allocate connector\n");
> 
>> +		return -ENOMEM;
>> +
>> +	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
>> +				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
>>   	if (ret) {
>>   		DRM_ERROR("Failed to init connector\n");
>> -		goto err_connector;
>> +		return ret;
>>   	}
>>   
>>   	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
>> @@ -103,7 +107,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
>>   			       DRM_MODE_ENCODER_VIRTUAL, NULL);
>>   	if (ret) {
>>   		DRM_ERROR("Failed to init encoder\n");
>> -		goto err_encoder;
>> +		return ret;
>>   	}
>>   	/*
>>   	 * This is an hardcoded value to select crtc for the encoder.
>> @@ -130,11 +134,5 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
>>   err_attach:
>>   	drm_encoder_cleanup(encoder);
>>   
>> -err_encoder:
>> -	drm_connector_cleanup(connector);
>> -
>> -err_connector:
>> -	drm_crtc_cleanup(crtc);
>> -
> 
> I think that, technically, err_encoder should call drm_crtc_cleanup() in this
> patch. However, since a future patch will remove this code I don't find it that
> relevant.
> 
>>   	return ret;
>>   }
