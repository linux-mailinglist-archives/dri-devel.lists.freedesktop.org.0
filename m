Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E14B8A0B5DF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 12:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4630B10E295;
	Mon, 13 Jan 2025 11:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="i5LgTsAC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF0810E295
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 11:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736768343;
 bh=vhD6tgVLRLRbfL34BndPBb0FfJdqEdhMUU11dYraRG8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=i5LgTsACFNwW3lxjCBjVh5hVbsiTCIpJxf+TP21V4kIBASq2pHui057KvbLok3uaG
 h7GjLVKPIT6yNEQ7VcKZaS6ZaSArJN5TREhYN56PD9vUAskCeF4qtChoEiEJT8QFjv
 OHOJRitB+lGaD5KW0HBRP7yW7gRHM4ey7yZ9THBDfOs9BLjUkDAFmDa6rWcBTf9CAM
 ac5Zc6+chezUsbFx4k+k4P3HqO/+fQIToKyuPP/Ge1iW3/0smTEtXenkAZ5ehJQxhw
 JQbVexaY+w1gGpuhRybkDx3Balsfcg2I94Zdp7iZqw2ofFjtQ05bjYn2mCQfIbd5yJ
 j8ZKnF/2W/law==
Received: from [192.168.1.90] (unknown [82.76.59.196])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CF5B517E0D72;
 Mon, 13 Jan 2025 12:39:02 +0100 (CET)
Message-ID: <9faebd93-1c82-49e2-87f2-2928a016b044@collabora.com>
Date: Mon, 13 Jan 2025 13:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/display: hdmi: Do not read EDID on disconnected
 connectors
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250111-hdmi-conn-edid-read-fix-v1-1-d68361624380@collabora.com>
 <2df6xkxqpljeowlqad6s5pxujefx6iw2a2caqlgljrgpmxlqqz@lark6bpzexca>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <2df6xkxqpljeowlqad6s5pxujefx6iw2a2caqlgljrgpmxlqqz@lark6bpzexca>
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

Hi Dmitry,

On 1/13/25 11:16 AM, Dmitry Baryshkov wrote:
> On Sat, Jan 11, 2025 at 12:04:09AM +0200, Cristian Ciocaltea wrote:
>> The recently introduced hotplug event handler in the HDMI Connector
>> framework attempts to unconditionally read the EDID data, leading to a
>> bunch of non-harmful, yet quite annoying DDC/I2C related errors being
>> reported.
>>
>> Ensure the operation is performed only for connectors having the status
>> connected or unknown.
>>
>> Fixes: ab716b74dc9d ("drm/display/hdmi: implement hotplug functions")
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> index 2691e8b3e480131ac6e4e4b74b24947be55694bd..8e4b30e09b53b84cfd36199d56db3221a00085b0 100644
>> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> @@ -786,8 +786,10 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
>>  	const struct drm_edid *drm_edid;
>>  
>>  	if (status == connector_status_disconnected) {
>> +		drm_edid_connector_update(connector, NULL);
>>  		// TODO: also handle CEC and scramber, HDMI sink disconnected.
>>  		drm_connector_hdmi_audio_plugged_notify(connector, false);
>> +		return;
> 
> I think, it should be other way around: plugged_notify before
> drm_edid_connector_update(). At least that would follow current logic of
> the function.

Yeah, I wasn't really sure about the order here. Will get this fixed in v2.

Thanks,
Cristian
