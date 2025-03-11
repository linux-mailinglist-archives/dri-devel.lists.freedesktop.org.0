Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824ABA5CBA4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 18:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40E310E638;
	Tue, 11 Mar 2025 17:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TIK4F35F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B886810E643
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 17:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741712805;
 bh=k0528PpBJ4d5S/tSCdLI0n+S5cnjRJpgZdA7WKFXydk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TIK4F35F1vpSd/30v33+ncik7dnEfI9Qk64nKHUahtMtXusBIaTEpMtxbz3vFOdLy
 /dfJJ0EXM00Bb79Q2src4fesSEMg9ApLjaSfr8cIH35fQtee/UpIuf6YyNxkm45ss4
 IMc3iDy77t+reonV/lSYwE1jP+8CwiQB+I4jUQQy81TUnQcBDet4PydzH7JLtcdtOH
 aid6ibwTRGFkGdtn8A0oNmIDxDe02cWqOyMsyvUeD4ulLP+iivvCSUnoVn5k/3XzVH
 TBlroXiotv/DwH1X7rFpC4C7nEoJKovuw39FO73IjIq14Lm313Qo5giHApheFxLR1I
 eP881GZrz3QBw==
Received: from [192.168.1.90] (unknown [84.232.140.93])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 57CA417E1088;
 Tue, 11 Mar 2025 18:06:45 +0100 (CET)
Message-ID: <abc73fd1-d7a3-43c7-809a-9dce5b07c3eb@collabora.com>
Date: Tue, 11 Mar 2025 19:06:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] drm/connector: hdmi: Add support for YUV420 format
 verification
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250311-hdmi-conn-yuv-v2-0-fbdb94f02562@collabora.com>
 <20250311-hdmi-conn-yuv-v2-2-fbdb94f02562@collabora.com>
 <20250311-spectral-utopian-poodle-4feadb@houat>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <20250311-spectral-utopian-poodle-4feadb@houat>
Content-Type: text/plain; charset=UTF-8
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

On 3/11/25 5:30 PM, Maxime Ripard wrote:
> On Tue, Mar 11, 2025 at 12:57:34PM +0200, Cristian Ciocaltea wrote:
>> Provide the necessary constraints verification in
>> sink_supports_format_bpc() in order to support handling of YUV420
>> output format.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 40 +++++++++++++++++++++++--
>>  1 file changed, 37 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> index 6bc96d5d1ab9115989e208d9899e16cd22254fb6..e99d868edc1854eddc5ebf8692ccffb9e2338268 100644
>> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> @@ -3,6 +3,7 @@
>>  #include <drm/drm_atomic.h>
>>  #include <drm/drm_connector.h>
>>  #include <drm/drm_edid.h>
>> +#include <drm/drm_modes.h>
>>  #include <drm/drm_print.h>
>>  
>>  #include <drm/display/drm_hdmi_audio_helper.h>
>> @@ -115,6 +116,12 @@ sink_supports_format_bpc(const struct drm_connector *connector,
>>  		return false;
>>  	}
>>  
>> +	if (drm_mode_is_420_only(info, mode) && format != HDMI_COLORSPACE_YUV420) {
>> +		drm_dbg_kms(dev, "%s format unsupported by the sink for VIC%u.\n",
>> +			    drm_hdmi_connector_get_output_format_name(format), vic);
> 
> We don't necessarily have a VIC for the mode we pass, so it's not super
> useful to pass it. I'd rather mention that the mode is supposed to be
> YUV420 only, but the format isn't YUV420.

Ack, I'll change the message as suggested.

>> +		return false;
>> +	}
>> +
>>  	switch (format) {
>>  	case HDMI_COLORSPACE_RGB:
>>  		drm_dbg_kms(dev, "RGB Format, checking the constraints.\n");
>> @@ -145,9 +152,36 @@ sink_supports_format_bpc(const struct drm_connector *connector,
>>  		return true;
>>  
>>  	case HDMI_COLORSPACE_YUV420:
>> -		/* TODO: YUV420 is unsupported at the moment. */
>> -		drm_dbg_kms(dev, "YUV420 format isn't supported yet.\n");
>> -		return false;
>> +		drm_dbg_kms(dev, "YUV420 format, checking the constraints.\n");
>> +
>> +		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR420)) {
>> +			drm_dbg_kms(dev, "Sink doesn't support YUV420.\n");
>> +			return false;
>> +		}
>> +
>> +		if (!drm_mode_is_420(info, mode)) {
>> +			drm_dbg_kms(dev, "Sink doesn't support YUV420 for VIC%u.\n", vic);
> 
> Again, we shouldn't print the VIC here. There's a printk format we can
> use to print drm_display_mode if you want to, but we should keep things
> consistent.

Agree, will proceed as above.

Thanks for the review,
Cristian
