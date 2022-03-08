Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4EE4D23EE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 23:10:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450C810E4E7;
	Tue,  8 Mar 2022 22:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191B310E4AA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 22:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646777440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rHHapBKRdhhDXmnYrTeCKV1NnPAwLYWNecWuP/Gyuk4=;
 b=eB08YWw6r5dOAd91Yfg46jmqlgOODsGqAFbcMLTW9yG9SReBfYR00haxBAAgQf3JjNTIxj
 1b/Y9Bdd5z33iRovA9KoIMVk1jI+NqK3WQTBXxfStbLIVcTLZTo1nQruNnvBuiv7EflEAa
 Ar27H4o5HtaXIS+cY1XGzzssMzvWWmI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-_Y8t_nN0P7m0aOMU8gqjzg-1; Tue, 08 Mar 2022 17:10:37 -0500
X-MC-Unique: _Y8t_nN0P7m0aOMU8gqjzg-1
Received: by mail-ej1-f72.google.com with SMTP id
 og24-20020a1709071dd800b006dab87bec4fso244027ejc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 14:10:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rHHapBKRdhhDXmnYrTeCKV1NnPAwLYWNecWuP/Gyuk4=;
 b=J/AsEGzIqlaKLdH5Yq0WoJ9X+PbOSW3b4dMDRMCiWPyzh32bYGH6dulLsqNPxNdBTj
 uy8DZ/qFFtPV2Rdb30roH7Fn3iO6sH7u1dw9L1hjApxoU04MqUG09XIrwmXZKnzb/Yab
 DDMkCK80q6xJ3/PJpTrzTu2nARKklRaRAu1b0Ovqr512YpjIPRqCtwAnsApIFz+iDhSz
 jLyXqV1/J3XcCOapHxIhKksRcacXPvnKX+Nr04j289s2JhFY16KOOKDNzyeUvjiDXphs
 zRNoviCJ5DcLn0z/gYc0fIJve7WRmzzQWHqOWq73xAbn7xGENWYYmXt84IrQtZNiS1/S
 pBHA==
X-Gm-Message-State: AOAM530A7FnSaKH2WFB42E5lhgNYlgB9xkYHDXaAx0NonekPTxS2e0jw
 1nB2DivqFT0dUIxIs75zGrqkuTNHbcpzUx2y6QwyyGxOdrEtpOJ6IZVywngWiIUUKUwR6UJLmoH
 zUWjb2AfCbIGUVSg36WIprALfkk1p
X-Received: by 2002:a17:906:66cb:b0:6cf:e4f7:9504 with SMTP id
 k11-20020a17090666cb00b006cfe4f79504mr15555263ejp.142.1646777435898; 
 Tue, 08 Mar 2022 14:10:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJkWfUcGkz9ggnBpwYVSu24Z2hXbLs1jI2HrK8WgIjy0zn2WjNeI+6H8+Y21prYdH3kVuvSQ==
X-Received: by 2002:a17:906:66cb:b0:6cf:e4f7:9504 with SMTP id
 k11-20020a17090666cb00b006cfe4f79504mr15555248ejp.142.1646777435657; 
 Tue, 08 Mar 2022 14:10:35 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a17090626d700b006cfcd39645fsm16503ejc.88.2022.03.08.14.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 14:10:35 -0800 (PST)
Message-ID: <0775d772-4aa0-de5f-e878-930b2722554e@redhat.com>
Date: Tue, 8 Mar 2022 23:10:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] drm/amdgpu: Add support for drm_privacy_screen
To: Harry Wentland <harry.wentland@amd.com>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexdeucher@gmail.com
References: <20220308205638.1744064-1-sean@poorly.run>
 <f19cddab-1053-39e7-10f2-5a775b452b4e@redhat.com>
 <3782c8c3-de17-08d3-7979-93993c877f0d@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3782c8c3-de17-08d3-7979-93993c877f0d@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Sean Paul <seanpaul@chromium.org>, Alex Deucher <alexander.deucher@amd.com>,
 rajatja@google.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/8/22 23:07, Harry Wentland wrote:
> 
> 
> On 2022-03-08 17:02, Hans de Goede wrote:
>> Hi,
>>
>> On 3/8/22 21:56, Sean Paul wrote:
>>> From: Sean Paul <seanpaul@chromium.org>
>>>
>>> This patch adds the necessary hooks to make amdgpu aware of privacy
>>> screens. On devices with privacy screen drivers (such as thinkpad-acpi),
>>> the amdgpu driver will defer probe until it's ready and then sync the sw
>>> and hw state on each commit the connector is involved and enabled.
>>>
>>> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> 
> The amdgpu_dm portion looks fine to me with Hans' comment
> addressed.
> 
> I don't know what the impact of the EPROBE_DEFER in amdgpu_pci_probe
> is.

Since it happens first thing in the probe function and the GPU
has not been touched yet (and thus cannot have been put in
a "bad" state), this should be fine.

The kernel will just keep retrying each time some other drivers
have successfully probed, until the privacy screen is available
and then the probe will continue normally.

Regards,

Hans




> 
> Harry
> 
>>> ---
>>>
>>> I tested this locally, but am not super confident everything is in the
>>> correct place. Hopefully the intent of the patch is clear and we can
>>> tweak positioning if needed.
>>
>> Thank you for working on this, from a drm-privacy screen
>> pov this looks good, one small remark below.
>>
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c          |  9 +++++++++
>>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  3 +++
>>>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  | 16 +++++++++++++++-
>>>  3 files changed, 27 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> index 2ab675123ae3..e2cfae56c020 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> @@ -26,6 +26,7 @@
>>>  #include <drm/drm_aperture.h>
>>>  #include <drm/drm_drv.h>
>>>  #include <drm/drm_gem.h>
>>> +#include <drm/drm_privacy_screen_consumer.h>
>>>  #include <drm/drm_vblank.h>
>>>  #include <drm/drm_managed.h>
>>>  #include "amdgpu_drv.h"
>>> @@ -1988,6 +1989,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>>>  {
>>>  	struct drm_device *ddev;
>>>  	struct amdgpu_device *adev;
>>> +	struct drm_privacy_screen *privacy_screen;
>>>  	unsigned long flags = ent->driver_data;
>>>  	int ret, retry = 0, i;
>>>  	bool supports_atomic = false;
>>> @@ -2063,6 +2065,13 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>>>  	size = pci_resource_len(pdev, 0);
>>>  	is_fw_fb = amdgpu_is_fw_framebuffer(base, size);
>>>  
>>> +	/* If the LCD panel has a privacy screen, defer probe until its ready */
>>> +	privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
>>> +	if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -EPROBE_DEFER)
>>> +		return -EPROBE_DEFER;
>>> +
>>> +	drm_privacy_screen_put(privacy_screen);
>>> +
>>>  	/* Get rid of things like offb */
>>>  	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &amdgpu_kms_driver);
>>>  	if (ret)
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index e1d3db3fe8de..9e2bb6523add 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -9781,6 +9781,9 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>>>  		if (acrtc) {
>>>  			new_crtc_state = drm_atomic_get_new_crtc_state(state, &acrtc->base);
>>>  			old_crtc_state = drm_atomic_get_old_crtc_state(state, &acrtc->base);
>>> +
>>> +			/* Sync the privacy screen state between hw and sw */
>>> +			drm_connector_update_privacy_screen(new_con_state);
>>>  		}
>>>  
>>>  		/* Skip any modesets/resets */
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>>> index 740435ae3997..e369fc95585e 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>>> @@ -27,6 +27,7 @@
>>>  #include <drm/drm_atomic_helper.h>
>>>  #include <drm/dp/drm_dp_mst_helper.h>
>>>  #include <drm/dp/drm_dp_helper.h>
>>> +#include <drm/drm_privacy_screen_consumer.h>
>>>  #include "dm_services.h"
>>>  #include "amdgpu.h"
>>>  #include "amdgpu_dm.h"
>>> @@ -506,6 +507,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>>>  				       struct amdgpu_dm_connector *aconnector,
>>>  				       int link_index)
>>>  {
>>> +	struct drm_device *dev = dm->ddev;
>>>  	struct dc_link_settings max_link_enc_cap = {0};
>>>  
>>>  	aconnector->dm_dp_aux.aux.name =
>>> @@ -519,8 +521,20 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>>>  	drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
>>>  				      &aconnector->base);
>>>  
>>> -	if (aconnector->base.connector_type == DRM_MODE_CONNECTOR_eDP)
>>> +	if (aconnector->base.connector_type == DRM_MODE_CONNECTOR_eDP) {
>>> +		struct drm_privacy_screen *privacy_screen;
>>> +
>>> +		/* Reference given up in drm_connector_cleanup() */
>>> +		privacy_screen = drm_privacy_screen_get(dev->dev, NULL);
>>> +		if (!IS_ERR(privacy_screen)) {
>>> +			drm_connector_attach_privacy_screen_provider(&aconnector->base,
>>> +								     privacy_screen);
>>> +		} else {
>>> +			drm_err(dev, "Error getting privacy screen, ret=%d\n",
>>> +				PTR_ERR(privacy_screen));
>>
>> This will now log a warning on all devices without a privacy-screen. The i915
>> code uses this instead:
>>
>>                 } else if (PTR_ERR(privacy_screen) != -ENODEV) {
>> 			drm_err(dev, "Error getting privacy screen, ret=%d\n",
>> 				PTR_ERR(privacy_screen));
>>                 }
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>
>>> +		}
>>>  		return;
>>> +	}
>>>  
>>>  	dc_link_dp_get_max_link_enc_cap(aconnector->dc_link, &max_link_enc_cap);
>>>  	aconnector->mst_mgr.cbs = &dm_mst_cbs;
>>
> 

