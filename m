Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8261D857FB4
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 15:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00E910EAEE;
	Fri, 16 Feb 2024 14:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ii6VOP0L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E24F10E187;
 Fri, 16 Feb 2024 14:47:19 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2d21a68dd3bso7600111fa.1; 
 Fri, 16 Feb 2024 06:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708094837; x=1708699637; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Iuc3CoMbFD+TKuQgVYGV990AOkdGq2rI+kpQYGy5zEc=;
 b=ii6VOP0LFmvjnj8pgHPhBG43SpcaFxowRuphIk5PpLBr6Gs3Zw7o1NRTKDye/5tA8N
 SKpC7peMO50EWpLdapSBuOAfQ5V0iSvbFDVMlEuNG+rfIpo6rFGUlzNeXqdKpYde/c9y
 W1gC46VQ6LXHx4Y6s8PHrkr1fUqrIeUc8gvt3lbzJ1dEW1FSiH9uJ+GjZkDuA7tYn/ep
 ImQvQx/um9s+k9ramAPyZrzuHWVuEbglShI9IDkobMK3/cUtfE+4BAYSAUnnC9460UFw
 ICu+yMc6XiaX4CfDgym4GUfmeMOiyGisTVhDsZCAoNoeTeT1pJaCtpX5q9+PpPN5dP4C
 WPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708094837; x=1708699637;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Iuc3CoMbFD+TKuQgVYGV990AOkdGq2rI+kpQYGy5zEc=;
 b=hMwEctVw2ySA3xKHH44LHP3oftptB8lwUbZHsVTgv9UZQox4Eaesio1REiPEQuBjwk
 vKdQDbG8x1550fv9hacwDF/A5pOQtYA3eAgPnX8x9C7TvctVAVj9K9uxPwh4fL/VdBah
 wYXzD/eLgouZC222hq5x5zKIftHcWgNhLbzfrTfcae/GdLbN9SWhRYUrhBpUYtt1XBW4
 TF1t+1rBoRVg7rRrhu+oCzFosQ2sdZitpphaoDIJ8RkiHPk89fjBLeJbAEPExiTUBMOJ
 dErCTu+UTPSjPmxYqhvyrTrsmYna+mMO4LeawAFRMC861YoPJLPgnYPxyUU4F4O0BlCB
 QJQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU17AnhFozThxxX94PoyVyJARzrqCcDB2G5OUGTdJm2xZJHiZevJAqkYhUAwKSQp1QKlfjPq6SIuJMeFSacYvDclzGF0QD7dVEiJePKZA==
X-Gm-Message-State: AOJu0YxJoU8W9uxD+Ei59qP92+rhW7rgt6+i3RZ2xy7bHHP1r5Q1vozo
 q2nUwHq4cIWFmaCFZIn8xk/jSRD1bdDB7smEI/yuCXPrcIM0S/WEWVBAKXfu
X-Google-Smtp-Source: AGHT+IHEZIromTxYp46GBgpyOaAFmPwW4HyDJ8twLyu/+j6Q78Hv7oUtoI4C95EcLWHLk29QWMLScQ==
X-Received: by 2002:a2e:8503:0:b0:2d0:a801:b4cd with SMTP id
 j3-20020a2e8503000000b002d0a801b4cdmr3573014lji.38.1708094837466; 
 Fri, 16 Feb 2024 06:47:17 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 r3-20020adfce83000000b0033d2541b3e1sm583646wrn.72.2024.02.16.06.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 06:47:17 -0800 (PST)
Message-ID: <e47b859d-eb0c-49f8-8a96-6f454fa18592@gmail.com>
Date: Fri, 16 Feb 2024 15:47:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: Only allow one entity to control ABM
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Hamza Mahfooz <Hamza.Mahfooz@amd.com>,
 Harry Wentland <Harry.Wentland@amd.com>, Sun peng Li <Sunpeng.Li@amd.com>
References: <20240216140709.73708-1-mario.limonciello@amd.com>
 <8970de85-3117-4e28-82b4-3b35c5beb7cf@gmail.com>
 <6b9e6f24-8fa5-43c5-88a2-068dfcb9996e@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <6b9e6f24-8fa5-43c5-88a2-068dfcb9996e@amd.com>
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

Am 16.02.24 um 15:42 schrieb Mario Limonciello:
> On 2/16/2024 08:38, Christian König wrote:
>> Am 16.02.24 um 15:07 schrieb Mario Limonciello:
>>> By exporting ABM to sysfs it's possible that DRM master and software
>>> controlling the sysfs file fight over the value programmed for ABM.
>>>
>>> Adjust the module parameter behavior to control who control ABM:
>>> -2: DRM
>>> -1: sysfs (IE via software like power-profiles-daemon)
>>
>> Well that sounds extremely awkward. Why should a 
>> power-profiles-deamon has control over the panel power saving features?
>>
>> I mean we are talking about things like reducing backlight level when 
>> the is inactivity, don't we?
>
> We're talking about activating the ABM algorithm when the system is in 
> power saving mode; not from inactivity.  This allows the user to 
> squeeze out some extra power "just" in that situation.
>
> But given the comments on the other patch, I tend to agree with 
> Harry's proposal instead that we just drop the DRM property entirely 
> as there are no consumers of it.

Yeah, but even then the design to let this be controlled by an userspace 
deamon is questionable. Stuff like that is handled inside the kernel and 
not exposed to userspace usually.

Regards,
Christian.

>
>>
>> Regards,
>> Christian.
>>
>>> 0-4: User via command line
>>>
>>> Also introduce a Kconfig option that allows distributions to choose
>>> the default policy that is appropriate for them.
>>>
>>> Fixes: f97e4303da16 ("drm/amd/display: add panel_power_savings sysfs 
>>> entry to eDP connectors")
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> ---
>>> Cc: Hamza Mahfooz <Hamza.Mahfooz@amd.com>
>>> Cc: Harry Wentland <Harry.Wentland@amd.com>
>>> Cc: Sun peng (Leo) Li <Sunpeng.Li@amd.com>
>>>   drivers/gpu/drm/amd/amdgpu/Kconfig            | 72 
>>> +++++++++++++++++++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 23 +++---
>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 +-
>>>   3 files changed, 90 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig 
>>> b/drivers/gpu/drm/amd/amdgpu/Kconfig
>>> index 22d88f8ef527..2ab57ccf6f21 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
>>> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
>>> @@ -80,6 +80,78 @@ config DRM_AMDGPU_WERROR
>>>         Add -Werror to the build flags for amdgpu.ko.
>>>         Only enable this if you are warning code for amdgpu.ko.
>>> +choice
>>> +    prompt "Amdgpu panel power Savings"
>>> +    default AMDGPU_SYSFS_ABM
>>> +    help
>>> +        Control the default behavior for adaptive panel power savings.
>>> +
>>> +        Panel power savings features will sacrifice color accuracy
>>> +        in exchange for power savings.
>>> +
>>> +        This can be configured for:
>>> +        - dynamic control by the DRM master
>>> +        - dynamic control by sysfs nodes
>>> +        - statically by the user at kernel compile time
>>> +
>>> +        This value can also be overridden by the amdgpu.abmlevel
>>> +        module parameter.
>>> +
>>> +config AMDGPU_DRM_ABM
>>> +    bool "DRM Master control"
>>> +    help
>>> +        Export a property called 'abm_level' that can be
>>> +        manipulated by the DRM master for supported hardware.
>>> +
>>> +config AMDGPU_SYSFS_ABM
>>> +    bool "sysfs control"
>>> +    help
>>> +        Export a sysfs file 'panel_power_savings' that can be
>>> +        manipulated by userspace for supported hardware.
>>> +
>>> +config AMDGPU_HARDCODE_ABM0
>>> +    bool "No Panel power savings"
>>> +    help
>>> +        Disable panel power savings.
>>> +        It can only overridden by the kernel command line.
>>> +
>>> +config AMDGPU_HARDCODE_ABM1
>>> +    bool "25% Panel power savings"
>>> +    help
>>> +        Set the ABM panel power savings algorithm to 25%.
>>> +        It can only overridden by the kernel command line.
>>> +
>>> +config AMDGPU_HARDCODE_ABM2
>>> +    bool "50% Panel power savings"
>>> +    help
>>> +        Set the ABM panel power savings algorithm to 50%.
>>> +        It can only overridden by the kernel command line.
>>> +
>>> +config AMDGPU_HARDCODE_ABM3
>>> +    bool "75% Panel power savings"
>>> +    help
>>> +        Set the ABM panel power savings algorithm to 75%.
>>> +        It can only overridden by the kernel command line.
>>> +
>>> +config AMDGPU_HARDCODE_ABM4
>>> +    bool "100% Panel power savings"
>>> +    help
>>> +        Set the ABM panel power savings algorithm to 100%.
>>> +        It can only overridden by the kernel command line.
>>> +endchoice
>>> +
>>> +config AMDGPU_ABM_POLICY
>>> +    int
>>> +    default -2 if AMDGPU_DRM_ABM
>>> +    default -1 if AMDGPU_SYSFS_ABM
>>> +    default 0 if AMDGPU_HARDCODE_ABM0
>>> +    default 1 if AMDGPU_HARDCODE_ABM1
>>> +    default 2 if AMDGPU_HARDCODE_ABM2
>>> +    default 3 if AMDGPU_HARDCODE_ABM3
>>> +    default 4 if AMDGPU_HARDCODE_ABM4
>>> +    default -1
>>> +
>>> +
>>>   source "drivers/gpu/drm/amd/acp/Kconfig"
>>>   source "drivers/gpu/drm/amd/display/Kconfig"
>>>   source "drivers/gpu/drm/amd/amdkfd/Kconfig"
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> index af7fae7907d7..00d6c8b58716 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> @@ -844,17 +844,24 @@ module_param_named(visualconfirm, 
>>> amdgpu_dc_visual_confirm, uint, 0444);
>>>    * DOC: abmlevel (uint)
>>>    * Override the default ABM (Adaptive Backlight Management) level 
>>> used for DC
>>>    * enabled hardware. Requires DMCU to be supported and loaded.
>>> - * Valid levels are 0-4. A value of 0 indicates that ABM should be 
>>> disabled by
>>> - * default. Values 1-4 control the maximum allowable brightness 
>>> reduction via
>>> - * the ABM algorithm, with 1 being the least reduction and 4 being 
>>> the most
>>> - * reduction.
>>> + * Valid levels are -2 through 4.
>>>    *
>>> - * Defaults to -1, or disabled. Userspace can only override this 
>>> level after
>>> - * boot if it's set to auto.
>>> + *  -2: indicates that ABM should be controlled by DRM property 
>>> 'abm_level.
>>> + *  -1: indicates that ABM should be controlled by the sysfs file
>>> + *      'panel_power_savings'.
>>> + *   0: indicates that ABM should be disabled.
>>> + * 1-4: control the maximum allowable brightness reduction via
>>> + *      the ABM algorithm, with 1 being the least reduction and 4 
>>> being the most
>>> + *      reduction.
>>> + *
>>> + * Both the DRM property 'abm_level' and the sysfs file 
>>> 'panel_power_savings'
>>> + * will only be available on supported hardware configurations.
>>> + *
>>> + * The default value is configured by kernel configuration option 
>>> AMDGPU_ABM_POLICY
>>>    */
>>> -int amdgpu_dm_abm_level = -1;
>>> +int amdgpu_dm_abm_level = CONFIG_AMDGPU_ABM_POLICY;
>>>   MODULE_PARM_DESC(abmlevel,
>>> -         "ABM level (0 = off, 1-4 = backlight reduction level, -1 
>>> auto (default))");
>>> +         "ABM level (0 = off, 1-4 = backlight reduction level, -1 = 
>>> sysfs control, -2 = drm control");
>>>   module_param_named(abmlevel, amdgpu_dm_abm_level, int, 0444);
>>>   int amdgpu_backlight = -1;
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c 
>>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index b9ac3d2f8029..147fe744f82e 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -6515,7 +6515,7 @@ static void 
>>> amdgpu_dm_connector_unregister(struct drm_connector *connector)
>>>       struct amdgpu_dm_connector *amdgpu_dm_connector = 
>>> to_amdgpu_dm_connector(connector);
>>>       if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
>>> -        amdgpu_dm_abm_level < 0)
>>> +        amdgpu_dm_abm_level == -1)
>>>           sysfs_remove_group(&connector->kdev->kobj, &amdgpu_group);
>>> drm_dp_aux_unregister(&amdgpu_dm_connector->dm_dp_aux.aux);
>>> @@ -6623,7 +6623,7 @@ amdgpu_dm_connector_late_register(struct 
>>> drm_connector *connector)
>>>       int r;
>>>       if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
>>> -        amdgpu_dm_abm_level < 0) {
>>> +        amdgpu_dm_abm_level == -1) {
>>>           r = sysfs_create_group(&connector->kdev->kobj,
>>>                          &amdgpu_group);
>>>           if (r)
>>> @@ -7654,7 +7654,7 @@ void amdgpu_dm_connector_init_helper(struct 
>>> amdgpu_display_manager *dm,
>>>       if (connector_type == DRM_MODE_CONNECTOR_eDP &&
>>>           (dc_is_dmcu_initialized(adev->dm.dc) ||
>>> -         adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level < 0) {
>>> +         adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level == -2) {
>>> drm_object_attach_property(&aconnector->base.base,
>>>                   adev->mode_info.abm_level_property, 0);
>>>       }
>>
>

