Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5444E25AA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 12:53:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A2F10E2E0;
	Mon, 21 Mar 2022 11:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D9C10E294
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 11:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647863591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ESVGJuk8lCQmgWQ1odylDolWMwEV6r0zet9lKX1Kekw=;
 b=gU7ttwjGgy10gj0FOJNHoeUbOnvFN5zIKndHduN6fYB0jGG2yKrHhu43qMTv8OVu5EeIMs
 +gp7ns7VHnit9B09yRWpvrjp1RLrVHMujIUOfwnb7sZ37VBzZO55CqHpWpt/f6k27urWOs
 56O2iAwbcjVws2wDA9xtJz9mEYoRoR8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-hbx37Yc4NLu6CDjJWGU8sA-1; Mon, 21 Mar 2022 07:53:09 -0400
X-MC-Unique: hbx37Yc4NLu6CDjJWGU8sA-1
Received: by mail-ed1-f71.google.com with SMTP id
 q25-20020a50aa99000000b004192a64d410so2229337edc.16
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 04:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ESVGJuk8lCQmgWQ1odylDolWMwEV6r0zet9lKX1Kekw=;
 b=bIPfyC/0IMHXnZahGUByIfUGCsiHiQ1JPl6kmZyU8tbKCCFkrYLYdcdjGPshCAW1x8
 AQeA0eRCHOlCXqDIKQCzdIla38ILMEkah6FQIPIuVXHoExwWH5uxt7BLMhNO/EOyoJ9+
 1lumQlmfyNQhSfGAI7w+UJkLsEYSABEIQS/FiZHLEwIfHFsZhtPFuLQRt+Wi4xRttU4U
 4B2EOZxUOlxd6S21aerNBmCz/a2w8/YTiUpAx8sRUgKCbyr41FsubrflCPcGHI4PUp9x
 CSFpn/D+t3hKkK7i+Ll6JvLO7/BHXlbu4EJq1tteQBzq5xapRkx47vUGqX8GM5U/zgCs
 vXDg==
X-Gm-Message-State: AOAM530CLHFPwumTrYEtl5yNyp4UnEjdtnpMtD11lcMp4deKrfol3krP
 Kg0mT7sQTvc4WRZ/waPDDaluASHfbjmAgPafKAPvmXB5uv0phJTFZTINfvTnkzrS6GbCxe8Py52
 FPuHQcbRupBLMrozE7B8TsA48yPgg
X-Received: by 2002:a17:907:2d06:b0:6e0:2ec:c7bd with SMTP id
 gs6-20020a1709072d0600b006e002ecc7bdmr5461673ejc.656.1647863587621; 
 Mon, 21 Mar 2022 04:53:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoI7zowWLm9+Xl2bWtVHyxCQJsEj3lUz5pheYXqdXDQ2sfdQhKLYK0bSqq9yzSYujnBbnc1Q==
X-Received: by 2002:a17:907:2d06:b0:6e0:2ec:c7bd with SMTP id
 gs6-20020a1709072d0600b006e002ecc7bdmr5461638ejc.656.1647863587311; 
 Mon, 21 Mar 2022 04:53:07 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a170906d18500b006ce371f09d4sm6730138ejz.57.2022.03.21.04.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 04:53:06 -0700 (PDT)
Message-ID: <b3a4882f-8f50-b32c-5405-0a065c72fa94@redhat.com>
Date: Mon, 21 Mar 2022 12:53:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] drm/amdgpu: Add support for drm_privacy_screen
To: Rajat Jain <rajatja@google.com>
References: <20220309150606.1877288-1-sean@poorly.run>
 <CACK8Z6GsZd5E74ZB9hRHWVov_cE0AfDNFcEvWeJHmtQAf_vz4A@mail.gmail.com>
 <b71a3775-a7e2-002d-7f2a-9036695eb172@redhat.com>
 <CACK8Z6E+xuwHHcyG6AFA6_bSEhDH=QkSw0GG1RKvyMUVYkjRYw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CACK8Z6E+xuwHHcyG6AFA6_bSEhDH=QkSw0GG1RKvyMUVYkjRYw@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/20/22 21:11, Rajat Jain wrote:
> () Hello Hans, Sean,
> 
> 
> 
> On Fri, Mar 11, 2022 at 4:12 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> On 3/9/22 18:53, Rajat Jain wrote:
>>> On Wed, Mar 9, 2022 at 7:06 AM Sean Paul <sean@poorly.run> wrote:
>>>>
>>>> From: Sean Paul <seanpaul@chromium.org>
>>>>
>>>> This patch adds the necessary hooks to make amdgpu aware of privacy
>>>> screens. On devices with privacy screen drivers (such as thinkpad-acpi),
>>>> the amdgpu driver will defer probe until it's ready and then sync the sw
>>>> and hw state on each commit the connector is involved and enabled.
>>>>
>>>> Changes in v2:
>>>> -Tweaked the drm_privacy_screen_get() error check to avoid logging
>>>>  errors when privacy screen is absent (Hans)
>>>>
>>>> Signed-off-by: Sean Paul <seanpaul@chromium.org>
>>>> Link: https://patchwork.freedesktop.org/patch/477640/ #v1
>>>> ---
>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c          |  9 +++++++++
>>>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  3 +++
>>>>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  | 16 +++++++++++++++-
>>>>  3 files changed, 27 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> index 2ab675123ae3..e2cfae56c020 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> @@ -26,6 +26,7 @@
>>>>  #include <drm/drm_aperture.h>
>>>>  #include <drm/drm_drv.h>
>>>>  #include <drm/drm_gem.h>
>>>> +#include <drm/drm_privacy_screen_consumer.h>
>>>>  #include <drm/drm_vblank.h>
>>>>  #include <drm/drm_managed.h>
>>>>  #include "amdgpu_drv.h"
>>>> @@ -1988,6 +1989,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>>>>  {
>>>>         struct drm_device *ddev;
>>>>         struct amdgpu_device *adev;
>>>> +       struct drm_privacy_screen *privacy_screen;
>>>>         unsigned long flags = ent->driver_data;
>>>>         int ret, retry = 0, i;
>>>>         bool supports_atomic = false;
>>>> @@ -2063,6 +2065,13 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>>>>         size = pci_resource_len(pdev, 0);
>>>>         is_fw_fb = amdgpu_is_fw_framebuffer(base, size);
>>>>
>>>> +       /* If the LCD panel has a privacy screen, defer probe until its ready */
>>>> +       privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
>>>> +       if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -EPROBE_DEFER)
>>>> +               return -EPROBE_DEFER;
>>>> +
>>>> +       drm_privacy_screen_put(privacy_screen);
>>>> +
>>>>         /* Get rid of things like offb */
>>>>         ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &amdgpu_kms_driver);
>>>>         if (ret)
>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> index e1d3db3fe8de..9e2bb6523add 100644
>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> @@ -9781,6 +9781,9 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>>>>                 if (acrtc) {
>>>>                         new_crtc_state = drm_atomic_get_new_crtc_state(state, &acrtc->base);
>>>>                         old_crtc_state = drm_atomic_get_old_crtc_state(state, &acrtc->base);
>>>> +
>>>> +                       /* Sync the privacy screen state between hw and sw */
>>>> +                       drm_connector_update_privacy_screen(new_con_state);
>>>>                 }
>>>>
>>>>                 /* Skip any modesets/resets */
>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>>>> index 740435ae3997..594a8002975a 100644
>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>>>> @@ -27,6 +27,7 @@
>>>>  #include <drm/drm_atomic_helper.h>
>>>>  #include <drm/dp/drm_dp_mst_helper.h>
>>>>  #include <drm/dp/drm_dp_helper.h>
>>>> +#include <drm/drm_privacy_screen_consumer.h>
>>>>  #include "dm_services.h"
>>>>  #include "amdgpu.h"
>>>>  #include "amdgpu_dm.h"
>>>> @@ -506,6 +507,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>>>>                                        struct amdgpu_dm_connector *aconnector,
>>>>                                        int link_index)
>>>>  {
>>>> +       struct drm_device *dev = dm->ddev;
>>>>         struct dc_link_settings max_link_enc_cap = {0};
>>>>
>>>>         aconnector->dm_dp_aux.aux.name =
>>>> @@ -519,8 +521,20 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>>>>         drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
>>>>                                       &aconnector->base);
>>>>
>>>> -       if (aconnector->base.connector_type == DRM_MODE_CONNECTOR_eDP)
>>>> +       if (aconnector->base.connector_type == DRM_MODE_CONNECTOR_eDP) {
>>>> +               struct drm_privacy_screen *privacy_screen)
>>>> +
>>>> +               /* Reference given up in drm_connector_cleanup() */
>>>> +               privacy_screen = drm_privacy_screen_get(dev->dev, NULL);
>>>
>>> Can we try to be more specific when looking up for privacy screen, e.g.:
>>>
>>> privacy_screen = drm_privacy_screen_get(dev->dev,  "eDP-1");
>>> (and then also making the corresponding change in arch_init_data[] in
>>> drm_privacy_screen_x86.c"
>>
>> So I just checked and yes I think we can be more specific at least
>> for the thinkpad_acpi supported models. See the attached patch
>> which has been tested on a ThinkPad T14 gen 1 with a builtin privacy-screen.
>>
>> Rajat, can you adjust the chrome code in drivers/gpu/drm/drm_privacy_screen_x86.c
>> to match and check that with the chrome code changes, my patch does not break
>> things on chromebooks? (Note your changes will need to be squashed into the
>> patch so that we change all of this in one go) .
> 
> Thanks, I just confirmed that with a change similar to yours (use
> "eDP-1"), it works fine on the Intel chromebooks at my end, so feel
> free to do it:

Ok, I've just send out a patch for this including the changes for the
Chromebook entry in drivers/gpu/drm/drm_privacy_screen_x86.c .

Note I've modified the changes to drivers/gpu/drm/i915/display/intel_display.c
intel_modeset_probe_defer() a bit to walk over an array of internal-panel
connector-names, to make it a bit more future proof.  I expect / hope
this new version to be better liked by the i915 maintainers.

Regards,

Hans



> ===================================================
> diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c
> b/drivers/gpu/drm/drm_privacy_screen_x86.c
> index 88802cd7a1ee..894beefb6628 100644
> --- a/drivers/gpu/drm/drm_privacy_screen_x86.c
> +++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
> @@ -69,7 +69,7 @@ static const struct arch_init_data arch_init_data[]
> __initconst = {
>         {
>                 .lookup = {
>                         .dev_id = NULL,
> -                       .con_id = NULL,
> +                       .con_id = "eDP-1",
>                         .provider = "privacy_screen-GOOG0010:00",
>                 },
>                 .detect = detect_chromeos_privacy_screen,
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 1682ace5cd53..2666ba7b5a28 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4250,7 +4250,7 @@ intel_ddi_init_dp_connector(struct
> intel_digital_port *dig_port)
>                 struct drm_device *dev = dig_port->base.base.dev;
>                 struct drm_privacy_screen *privacy_screen;
> 
> -               privacy_screen = drm_privacy_screen_get(dev->dev, NULL);
> +               privacy_screen = drm_privacy_screen_get(dev->dev,
> connector->base.name);
>                 if (!IS_ERR(privacy_screen)) {
> 
> drm_connector_attach_privacy_screen_provider(&connector->base,
> 
> privacy_screen);
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 89be498127e4..b2903a55f910 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -13360,7 +13360,7 @@ bool intel_modeset_probe_defer(struct pci_dev *pdev)
>                 return true;
> 
>         /* If the LCD panel has a privacy-screen, wait for it */
> -       privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
> +       privacy_screen = drm_privacy_screen_get(&pdev->dev, "eDP-1");
>         if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -EPROBE_DEFER)
>                 return true;
>  =================================================
> 
> I found it a little surprising though. From what I remembered from my
> early venture, was that connector->base.name did not get filled in at
> the time intel_ddi_init_dp_connector() was called, but I guess I was
> remembering it wrong.
> 
>>
>> Sean, same request to you, can you adjust your amdgpu patch to match
>> the i915 changes in the attached patch and then check if a kernel
>> with both changes still works ?
> 
> Defer to Sean since I do not have the AMD chromebook to test.
> 
> Thanks & Best Regards,
> 
> Rajat
> 
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>>
>>> My comment applies to this driver as well as to i915. The reason being
>>> today there is only 1 internal display with privacy screen so we can
>>> just assume that there shall be only 1 privacy-screen and that shall
>>> apply to eDP-1/internal display. But dual display systems are not far
>>> enough out, and perhaps external monitors with inbuilt
>>> privacy-screens?
>>>
>>> Essentially the gap today is that today on Chromeos ACPI side, the
>>> device GOOG0010 represents the privacy-screen attached to the internal
>>> display/eDP-1, but there isn't a way to make it clear in the i915 and
>>> now amdgpu code.
>>>
>>> Thanks,
>>>
>>> Rajat
>>>
>>>
>>>> +               if (!IS_ERR(privacy_screen)) {
>>>> +                       drm_connector_attach_privacy_screen_provider(&aconnector->base,
>>>> +                                                                    privacy_screen);
>>>> +               } else if (PTR_ERR(privacy_screen) != -ENODEV) {
>>>> +                       drm_err(dev, "Error getting privacy screen, ret=%d\n",
>>>> +                               PTR_ERR(privacy_screen));
>>>> +               }
>>>>                 return;
>>>> +       }
>>>>
>>>>         dc_link_dp_get_max_link_enc_cap(aconnector->dc_link, &max_link_enc_cap);
>>>>         aconnector->mst_mgr.cbs = &dm_mst_cbs;
>>>> --
>>>> Sean Paul, Software Engineer, Google / Chromium OS
>>>>
>>>
> 

