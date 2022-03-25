Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C114E7040
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 10:49:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DFF10E5F8;
	Fri, 25 Mar 2022 09:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3357210E594
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 09:49:35 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id
 p12-20020a05600c430c00b0038cbdf52227so4055427wme.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 02:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=DfT5O8Gal4+cteaTC6rWY4ssizS/Flx63uxHthtaZDE=;
 b=HcyOP/9CoQAcquBFsAeSDoqR3wXjrorMh7BT47PYb76YWB+7bM1eAcXCIJoX2LAy4z
 vRuuqOEeg7TaWhnb/9vTrXEf5uukpQBog4cxrHTv0N6iXul/KCWbqCwzx3Yiuz2fpx8f
 60i/hgm2Wpy3fx0alnq+XzOG2T/iTJmGWI6/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=DfT5O8Gal4+cteaTC6rWY4ssizS/Flx63uxHthtaZDE=;
 b=e57D8yuzVVNIgtULBVpaEE9y2g5CAwLCYjAMJN1SprwgZCiFVrroo8YtE3S8G1CV/B
 wAktqNsVj5JW8pDdrqoburgA2RZa31EsIqCQAtQCoC+75CEMg5vt+LgvzFJuvOcEBt3q
 H0D/EF7bpieqWrj/jbD1owXNZddlE/8ZlUnjihTLzm7Y7PuZUsvUgfJHd6VJNJiizEvi
 st4KJoRct2BFp90bGCGpbUBald3iKTB/Xz7gBQ/f32MkKyMeAGBEPTeYQffIkZA3fbHP
 wBBVZBQNzAJdR42xJoJwvFDz9ygZYqiEADU7E1waxD25Pya5O11d7yRH4MSE8+TnwwOO
 +Dog==
X-Gm-Message-State: AOAM531NRjNtIzfaTyIzmLMfti893rCdwANapQB3GMCTV8ArHgC0LGH3
 lengQmhaXQJnrmp4mI9Rb0RC8A==
X-Google-Smtp-Source: ABdhPJzexb0SxQohaHmXb/tTvBXEm7shj2YeTL8tbTdMeOO2VDv+ZelO4wFl7rK7qEDE7T5Ea4khLA==
X-Received: by 2002:a05:600c:3d8d:b0:38c:82dc:cd58 with SMTP id
 bi13-20020a05600c3d8d00b0038c82dccd58mr8905906wmb.50.1648201772655; 
 Fri, 25 Mar 2022 02:49:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 10-20020a5d47aa000000b00204012e4373sm5387913wrb.101.2022.03.25.02.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 02:49:32 -0700 (PDT)
Date: Fri, 25 Mar 2022 10:49:30 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2 3/25] drm/amdgpu: Disable ABM when AC mode
Message-ID: <Yj2QKsKet4/pHvvX@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 "Lin, Tsung-hua (Ryan)" <Tsung-hua.Lin@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "David1.Zhou@amd.com" <David1.Zhou@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "bas@basnieuwenhuizen.nl" <bas@basnieuwenhuizen.nl>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "sashal@kernel.org" <sashal@kernel.org>,
 "markyacoub@google.com" <markyacoub@google.com>,
 "victorchengchi.lu@amd.com" <victorchengchi.lu@amd.com>,
 "ching-shih.li@amd.corp-partner.google.com"
 <ching-shih.li@amd.corp-partner.google.com>, 
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "ddavenport@chromium.org" <ddavenport@chromium.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Li, Leon" <Leon.Li@amd.com>
References: <20220325040515.4073706-1-tsung-hua.lin@amd.com>
 <2125c5b2-b377-076a-4177-d5ef482eb657@amd.com>
 <DM6PR12MB44177923FF4E05331A7B727FB21A9@DM6PR12MB4417.namprd12.prod.outlook.com>
 <26042d92-0fb7-fadb-140e-b633f2979632@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26042d92-0fb7-fadb-140e-b633f2979632@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: "sashal@kernel.org" <sashal@kernel.org>,
 "David1.Zhou@amd.com" <David1.Zhou@amd.com>,
 "ddavenport@chromium.org" <ddavenport@chromium.org>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Li, Leon" <Leon.Li@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "ching-shih.li@amd.corp-partner.google.com"
 <ching-shih.li@amd.corp-partner.google.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "victorchengchi.lu@amd.com" <victorchengchi.lu@amd.com>, "Lin,
 Tsung-hua \(Ryan\)" <Tsung-hua.Lin@amd.com>,
 "markyacoub@google.com" <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 25, 2022 at 08:22:29AM +0100, Christian König wrote:
> Hi Ryan,
> 
> we should try to avoid that and if it isn't possible at least use some
> constant like ACPI_AC_CLASS.
> 
> Could be that the information isn't available otherwise. Alex should know
> more about that.

I wonder whether we shouldn't need a more dedicated notification from acpi
for power supply events instead of stitching this together ourselves. At
least this kind of stuff feels more into the policy/tuning territory where
a bit more careful interfaces might be good instead of just "hey there's
this very funny acpi protocol we just have to take part in to not upset
the hw/fw".
-Daniel

> 
> Regards,
> Christian.
> 
> Am 25.03.22 um 08:09 schrieb Lin, Tsung-hua (Ryan):
> > [AMD Official Use Only]
> > 
> > Hi Christian,
> > 
> > There is already a string comparison in the same function. I just reference that to port this solution.
> > 
> > 
> > 
> > #define ACPI_AC_CLASS           "ac_adapter"
> > 
> > 
> > static int amdgpu_acpi_event(struct notifier_block *nb,
> > 			     unsigned long val,
> > 			     void *data)
> > {
> > 	struct amdgpu_device *adev = container_of(nb, struct amdgpu_device, acpi_nb);
> > 	struct acpi_bus_event *entry = (struct acpi_bus_event *)data;
> > 
> > +	if (strcmp(entry->device_class, "battery") == 0) {
> > +		adev->pm.ac_power = power_supply_is_system_supplied() > 0;
> > +	}
> > 
> > 	if (strcmp(entry->device_class, ACPI_AC_CLASS) == 0) {      <-------------------here!
> > 		if (power_supply_is_system_supplied() > 0)
> > 			DRM_DEBUG_DRIVER("pm: AC\n");
> > 		else
> > 			DRM_DEBUG_DRIVER("pm: DC\n");
> > 
> > 		amdgpu_pm_acpi_event_handler(adev);
> > 	}
> > 
> > 	/* Check for pending SBIOS requests */
> > 	return amdgpu_atif_handler(adev, entry);
> > }
> > 
> > Thanks,
> > Ryan Lin.
> > 
> > -----Original Message-----
> > From: Koenig, Christian <Christian.Koenig@amd.com>
> > Sent: Friday, March 25, 2022 2:58 PM
> > To: Lin, Tsung-hua (Ryan) <Tsung-hua.Lin@amd.com>; Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; David1.Zhou@amd.com; airlied@linux.ie; daniel@ffwll.ch; seanpaul@chromium.org; bas@basnieuwenhuizen.nl; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; sashal@kernel.org; markyacoub@google.com; victorchengchi.lu@amd.com; ching-shih.li@amd.corp-partner.google.com; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; ddavenport@chromium.org; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Li, Leon <Leon.Li@amd.com>
> > Subject: Re: [PATCH v2 3/25] drm/amdgpu: Disable ABM when AC mode
> > 
> > Am 25.03.22 um 05:05 schrieb Ryan Lin:
> > > Disable ABM feature when the system is running on AC mode to get the
> > > more perfect contrast of the display.
> > > 
> > > Signed-off-by: Ryan Lin <tsung-hua.lin@amd.com>
> > > 
> > > ---
> > >    drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |  4 ++
> > >    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  1 +
> > >    drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c | 58 ++++++++++++-------
> > >    drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h       |  1 +
> > >    4 files changed, 42 insertions(+), 22 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > > index c560c1ab62ecb..bc8bb9aad2e36 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > > @@ -822,6 +822,10 @@ static int amdgpu_acpi_event(struct notifier_block *nb,
> > >    	struct amdgpu_device *adev = container_of(nb, struct amdgpu_device, acpi_nb);
> > >    	struct acpi_bus_event *entry = (struct acpi_bus_event *)data;
> > > +	if (strcmp(entry->device_class, "battery") == 0) {
> > String comparison in a hot path is not something we usually like to see in the kernel.
> > 
> > Isn't there any other way to detect that? Like a flag or similar?
> > 
> > Regards,
> > Christian.
> > 
> > > +		adev->pm.ac_power = power_supply_is_system_supplied() > 0;
> > > +	}
> > > +
> > >    	if (strcmp(entry->device_class, ACPI_AC_CLASS) == 0) {
> > >    		if (power_supply_is_system_supplied() > 0)
> > >    			DRM_DEBUG_DRIVER("pm: AC\n");
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > index abfcc1304ba0c..3a0afe7602727 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > @@ -3454,6 +3454,7 @@ int amdgpu_device_init(struct amdgpu_device
> > > *adev,
> > >    	adev->gfx.gfx_off_req_count = 1;
> > >    	adev->pm.ac_power = power_supply_is_system_supplied() > 0;
> > > +	adev->pm.old_ac_power = true;
> > >    	atomic_set(&adev->throttling_logging_enabled, 1);
> > >    	/*
> > > diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
> > > b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
> > > index 54a1408c8015c..478a734b66926 100644
> > > --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
> > > +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
> > > @@ -23,6 +23,8 @@
> > >     *
> > >     */
> > > +#include <linux/power_supply.h>
> > > +#include "amdgpu.h"
> > >    #include "dmub_abm.h"
> > >    #include "dce_abm.h"
> > >    #include "dc.h"
> > > @@ -51,6 +53,7 @@
> > >    #define DISABLE_ABM_IMMEDIATELY 255
> > > +extern uint amdgpu_dm_abm_level;
> > >    static void dmub_abm_enable_fractional_pwm(struct dc_context *dc)
> > >    {
> > > @@ -117,28 +120,6 @@ static void dmub_abm_init(struct abm *abm, uint32_t backlight)
> > >    	dmub_abm_enable_fractional_pwm(abm->ctx);
> > >    }
> > > -static unsigned int dmub_abm_get_current_backlight(struct abm *abm)
> > > -{
> > > -	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
> > > -	unsigned int backlight = REG_READ(BL1_PWM_CURRENT_ABM_LEVEL);
> > > -
> > > -	/* return backlight in hardware format which is unsigned 17 bits, with
> > > -	 * 1 bit integer and 16 bit fractional
> > > -	 */
> > > -	return backlight;
> > > -}
> > > -
> > > -static unsigned int dmub_abm_get_target_backlight(struct abm *abm) -{
> > > -	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
> > > -	unsigned int backlight = REG_READ(BL1_PWM_TARGET_ABM_LEVEL);
> > > -
> > > -	/* return backlight in hardware format which is unsigned 17 bits, with
> > > -	 * 1 bit integer and 16 bit fractional
> > > -	 */
> > > -	return backlight;
> > > -}
> > > -
> > >    static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
> > >    {
> > >    	union dmub_rb_cmd cmd;
> > > @@ -148,6 +129,9 @@ static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
> > >    	int edp_num;
> > >    	uint8_t panel_mask = 0;
> > > +	if (power_supply_is_system_supplied() > 0)
> > > +		level = 0;
> > > +
> > >    	get_edp_links(dc->dc, edp_links, &edp_num);
> > >    	for (i = 0; i < edp_num; i++) {
> > > @@ -170,6 +154,36 @@ static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
> > >    	return true;
> > >    }
> > > +static unsigned int dmub_abm_get_current_backlight(struct abm *abm) {
> > > +	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
> > > +	unsigned int backlight = REG_READ(BL1_PWM_CURRENT_ABM_LEVEL);
> > > +	struct dc_context *dc = abm->ctx;
> > > +	struct amdgpu_device *adev = dc->driver_context;
> > > +
> > > +	if (adev->pm.ac_power != adev->pm.old_ac_power) {
> > > +		dmub_abm_set_level(abm, amdgpu_dm_abm_level);
> > > +		adev->pm.ac_power = power_supply_is_system_supplied() > 0;
> > > +		adev->pm.old_ac_power = adev->pm.ac_power;
> > > +	}
> > > +
> > > +	/* return backlight in hardware format which is unsigned 17 bits, with
> > > +	 * 1 bit integer and 16 bit fractional
> > > +	 */
> > > +	return backlight;
> > > +}
> > > +
> > > +static unsigned int dmub_abm_get_target_backlight(struct abm *abm) {
> > > +	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
> > > +	unsigned int backlight = REG_READ(BL1_PWM_TARGET_ABM_LEVEL);
> > > +
> > > +	/* return backlight in hardware format which is unsigned 17 bits, with
> > > +	 * 1 bit integer and 16 bit fractional
> > > +	 */
> > > +	return backlight;
> > > +}
> > > +
> > >    static bool dmub_abm_init_config(struct abm *abm,
> > >    	const char *src,
> > >    	unsigned int bytes,
> > > diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> > > b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> > > index f6e0e7d8a0077..de459411a0e83 100644
> > > --- a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> > > +++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> > > @@ -445,6 +445,7 @@ struct amdgpu_pm {
> > >    	uint32_t                smu_prv_buffer_size;
> > >    	struct amdgpu_bo        *smu_prv_buffer;
> > >    	bool ac_power;
> > > +	bool old_ac_power;
> > >    	/* powerplay feature */
> > >    	uint32_t pp_feature;
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
