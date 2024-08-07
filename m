Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7BE949EFB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 07:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB3B10E15E;
	Wed,  7 Aug 2024 05:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eJA7ziTX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C163710E02B;
 Wed,  7 Aug 2024 05:13:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 08B796111F;
 Wed,  7 Aug 2024 05:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27D0C32782;
 Wed,  7 Aug 2024 05:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723007602;
 bh=um2GSGAvdjY0j0MtneCmmwl8RQ+HTQsfh/xKbEsHYF4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eJA7ziTXO28uCUme73hpCZF3OLsHd4lwtyFCAmJ1L4eCc/QTU9cfVMxbSC3WALSoy
 lHrZ7UhyZbLJFuT2PtoUsIloW+Qqb1NWq+6HVLivJm59yiY4oqL7zwuLAddfm7n9KO
 cC8TF/iE88IPUUR+YWh2EDmpsDVew17PhYO3aYVZBA3eL/kQixnQ1Ss5lTUz+6EBth
 EICk472OHMMw6uQGzjGtGW6OX1AQjViyc273VX01VndWyhIxlUtPAEHPRHPF8pEM6F
 eOBg6WDblf2kecf8nQ7O2+5RL2itFfJ/2keTN5k6ITA6O4ukEd17AcTjK8LYuTXJ/V
 6hgu2UZwbqnWA==
Message-ID: <0141fd24-ee8e-4d19-a93c-11e8d54b093a@kernel.org>
Date: Wed, 7 Aug 2024 00:13:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Revert "drm/amd/display: add panel_power_savings
 sysfs entry to eDP connectors"
To: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org
Cc: Sebastian Wick <sebastian@sebastianwick.net>,
 Xaver Hugl <xaver.hugl@gmail.com>, Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Hung <alex.hung@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Roman Li <roman.li@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Wayne Lin
 <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240806184214.224672-1-sebastian.wick@redhat.com>
 <20240806184214.224672-2-sebastian.wick@redhat.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20240806184214.224672-2-sebastian.wick@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/6/24 13:42, Sebastian Wick wrote:
> From: Sebastian Wick <sebastian@sebastianwick.net>
> 
> This reverts commit 63d0b87213a0ba241b3fcfba3fe7b0aed0cd1cc5.
> 
> The panel_power_savings sysfs entry can be used to change the displayed
> colorimetry which breaks color managed setups.
> 
> The "do not break userspace" rule which was violated here is enough
> reason to revert this commit.
> 
> The bigger problem is that this feature is part of the display chain
> which is supposed to be controlled by KMS. This sysfs entry bypasses the
> DRM master process and splits control to two independent processes which
> do not know about each other. This is what caused the broken user space.
> It also causes modesets which can be extremely confusing for the DRM
> master process, causing unexpected timings.
> 
> We should in general not allow anything other than KMS to control the
> display path. If we make an exception to this rule, this must be first
> discussed on dri-devel with all the stakeholders approving the
> exception.
> 
> This has not happened which is the second reason to revert this commit.
> 
> Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>

For anyone who hasn't seen it, there has been a bunch of discussions 
that have transpired on this topic and what to do about it on [1] as 
well as some other linked places on that bug.

Also FWIW there was a discussion on the merits of the sysfs file on 
dri-devel during the initial patch submission [2].

If this revert ends up going through, please also revert 
0887054d14ae23061e28e28747cdea7e40be9224 in the same series so the 
feature can "at least" be accessed by the compositor and changed at 
runtime like the sysfs file had allowed.

[1] https://gitlab.freedesktop.org/upower/power-profiles-daemon/-/issues/159
[2] 
https://lore.kernel.org/dri-devel/20240202152837.7388-1-hamza.mahfooz@amd.com/

> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 80 -------------------
>   1 file changed, 80 deletions(-)
> 
> diff --git ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c ../drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 4d4c75173fc3..16c9051d9ccf 100644
> --- ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ ../drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6772,82 +6772,10 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
>   	return ret;
>   }
>   
> -/**
> - * DOC: panel power savings
> - *
> - * The display manager allows you to set your desired **panel power savings**
> - * level (between 0-4, with 0 representing off), e.g. using the following::
> - *
> - *   # echo 3 > /sys/class/drm/card0-eDP-1/amdgpu/panel_power_savings
> - *
> - * Modifying this value can have implications on color accuracy, so tread
> - * carefully.
> - */
> -
> -static ssize_t panel_power_savings_show(struct device *device,
> -					struct device_attribute *attr,
> -					char *buf)
> -{
> -	struct drm_connector *connector = dev_get_drvdata(device);
> -	struct drm_device *dev = connector->dev;
> -	u8 val;
> -
> -	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
> -	val = to_dm_connector_state(connector->state)->abm_level ==
> -		ABM_LEVEL_IMMEDIATE_DISABLE ? 0 :
> -		to_dm_connector_state(connector->state)->abm_level;
> -	drm_modeset_unlock(&dev->mode_config.connection_mutex);
> -
> -	return sysfs_emit(buf, "%u\n", val);
> -}
> -
> -static ssize_t panel_power_savings_store(struct device *device,
> -					 struct device_attribute *attr,
> -					 const char *buf, size_t count)
> -{
> -	struct drm_connector *connector = dev_get_drvdata(device);
> -	struct drm_device *dev = connector->dev;
> -	long val;
> -	int ret;
> -
> -	ret = kstrtol(buf, 0, &val);
> -
> -	if (ret)
> -		return ret;
> -
> -	if (val < 0 || val > 4)
> -		return -EINVAL;
> -
> -	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
> -	to_dm_connector_state(connector->state)->abm_level = val ?:
> -		ABM_LEVEL_IMMEDIATE_DISABLE;
> -	drm_modeset_unlock(&dev->mode_config.connection_mutex);
> -
> -	drm_kms_helper_hotplug_event(dev);
> -
> -	return count;
> -}
> -
> -static DEVICE_ATTR_RW(panel_power_savings);
> -
> -static struct attribute *amdgpu_attrs[] = {
> -	&dev_attr_panel_power_savings.attr,
> -	NULL
> -};
> -
> -static const struct attribute_group amdgpu_group = {
> -	.name = "amdgpu",
> -	.attrs = amdgpu_attrs
> -};
> -
>   static void amdgpu_dm_connector_unregister(struct drm_connector *connector)
>   {
>   	struct amdgpu_dm_connector *amdgpu_dm_connector = to_amdgpu_dm_connector(connector);
>   
> -	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
> -	    amdgpu_dm_abm_level < 0)
> -		sysfs_remove_group(&connector->kdev->kobj, &amdgpu_group);
> -
>   	drm_dp_aux_unregister(&amdgpu_dm_connector->dm_dp_aux.aux);
>   }
>   
> @@ -6952,14 +6880,6 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
>   		to_amdgpu_dm_connector(connector);
>   	int r;
>   
> -	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
> -	    amdgpu_dm_abm_level < 0) {
> -		r = sysfs_create_group(&connector->kdev->kobj,
> -				       &amdgpu_group);
> -		if (r)
> -			return r;
> -	}
> -
>   	amdgpu_dm_register_backlight_device(amdgpu_dm_connector);
>   
>   	if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) ||

