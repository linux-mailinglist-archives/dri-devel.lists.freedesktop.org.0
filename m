Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3121B79A8CB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 16:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D362D10E305;
	Mon, 11 Sep 2023 14:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77B410E305
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694443406; x=1725979406;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=g6LNZoXHOiKMGWRLpT6oIKoFZc/vg7KVOmyjC4U+09E=;
 b=iH89hCsWCE/o5S6XX1fmbbn/n5mx7bvPQAbF8wfRJgVDCrmYzzPQM6dU
 nGDbh/FXZg/Tfol3W6Ebdkk7XA9hXDo81BMeFSLJEYxuoWkCSjXh9JW6k
 pj6pdkadSG5+odXKmjoL5ms8H6FWYM3RG4kJ9Frd0PDKGaOHZuX54UVF2
 SCdygW5r5dv6Shrr1rHc6Gwrw0tSuWL31GpWDaR/FgFf6R1459EPdbtZD
 IqnSMsCDEMnV+5EyMg487Vc51UKOjNZ4TiSCLsis8coowogdKXq9kIpmt
 3fpE6zYFLHPKFr+nAz0if1DmzN8AThk1kM2FTtFso9cTSVXKhSuzzH+0k g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="381904373"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="381904373"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 07:43:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="917045930"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="917045930"
Received: from kschuele-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.119])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 07:43:22 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, j@jannau.net, Javier Martinez
 Canillas <javierm@redhat.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/simpledrm: Add support for multiple "power-domains"
In-Reply-To: <3efb0304-df1a-4038-a716-a910b53c1445@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230910-simpledrm-multiple-power-domains-v1-1-f8718aefc685@jannau.net>
 <3efb0304-df1a-4038-a716-a910b53c1445@suse.de>
Date: Mon, 11 Sep 2023 17:43:20 +0300
Message-ID: <87tts0epo7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Sep 2023, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 10.09.23 um 18:39 schrieb Janne Grunau via B4 Relay:
>> From: Janne Grunau <j@jannau.net>
>> 
>> Multiple power domains need to be handled explicitly in each driver. The
>> driver core can not handle it automatically since it is not aware of
>> power sequencing requirements the hardware might have. This is not a
>> problem for simpledrm since everything is expected to be powered on by
>> the bootloader. simpledrm has just ensure it remains powered on during
>> its lifetime.
>> This is required on Apple silicon M2 and M2 Pro/Max/Ultra desktop
>> systems. The HDMI output initialized by the bootloader requires keeping
>> the display controller and a DP phy power domain on.
>> 
>> Signed-off-by: Janne Grunau <j@jannau.net>
>> ---
>>   drivers/gpu/drm/tiny/simpledrm.c | 106 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 106 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
>> index ff86ba1ae1b8..efedede57d42 100644
>> --- a/drivers/gpu/drm/tiny/simpledrm.c
>> +++ b/drivers/gpu/drm/tiny/simpledrm.c
>> @@ -6,6 +6,7 @@
>>   #include <linux/of_address.h>
>>   #include <linux/platform_data/simplefb.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm_domain.h>
>>   #include <linux/regulator/consumer.h>
>>   
>>   #include <drm/drm_aperture.h>
>> @@ -227,6 +228,12 @@ struct simpledrm_device {
>>   	unsigned int regulator_count;
>>   	struct regulator **regulators;
>>   #endif
>> +	/* power-domains */
>> +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
>> +	int pwr_dom_count;
>> +	struct device **pwr_dom_devs;
>> +	struct device_link **pwr_dom_links;
>> +#endif
>>   
>>   	/* simplefb settings */
>>   	struct drm_display_mode mode;
>> @@ -468,6 +475,102 @@ static int simpledrm_device_init_regulators(struct simpledrm_device *sdev)
>>   }
>>   #endif
>>   
>> +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
>> +/*
>> + * Generic power domain handling code.
>> + *
>> + * Here we handle the power-domains properties of our "simple-framebuffer"
>> + * dt node. This is only necessary if there is more than one power-domain.
>> + * A single power-domains is handled automatically by the driver core. Multiple
>> + * power-domains have to be handled by drivers since the driver core can't know
>> + * the correct power sequencing. Power sequencing is not an issue for simpledrm
>> + * since the bootloader has put the power domains already in the correct state.
>> + * simpledrm has only to ensure they remain active for its lifetime.
>> + *
>> + * When the driver unloads, we detach from the power-domains.
>> + *
>> + * We only complain about errors here, no action is taken as the most likely
>> + * error can only happen due to a mismatch between the bootloader which set
>> + * up the "simple-framebuffer" dt node, and the PM domain providers in the
>> + * device tree. Chances are that there are no adverse effects, and if there are,
>> + * a clean teardown of the fb probe will not help us much either. So just
>> + * complain and carry on, and hope that the user actually gets a working fb at
>> + * the end of things.
>> + */
>> +static void simpledrm_device_detach_genpd(void *res)
>> +{
>> +	int i;
>> +	struct simpledrm_device *sdev = /*(struct simpledrm_device *)*/res;
>> +
>> +
>> +	drm_err(&sdev->dev, "% power-domains count:%d\n", __func__, sdev->pwr_dom_count);
>
> If anything, drm_dbg()

Drive-by comment, drm_dbg() already prints the function, there's no need
to use __func__.

BR,
Jani.

>
>> +	if (sdev->pwr_dom_count <= 1)
>> +		return;
>> +
>> +	for (i = sdev->pwr_dom_count - 1; i >= 0; i--) {
>> +		if (!sdev->pwr_dom_links[i])
>> +			device_link_del(sdev->pwr_dom_links[i]);
>> +		if (!IS_ERR_OR_NULL(sdev->pwr_dom_devs[i]))
>> +			dev_pm_domain_detach(sdev->pwr_dom_devs[i], true);
>> +	}
>> +}
>> +
>> +static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev)
>> +{
>> +	struct device *dev = sdev->dev.dev;
>> +	int i;
>> +
>> +	sdev->pwr_dom_count = of_count_phandle_with_args(dev->of_node, "power-domains",
>> +							 "#power-domain-cells");
>> +	/*
>> +	 * Single power-domain devices are handled by driver core nothing to do
>> +	 * here. The same for device nodes without "power-domains" property.
>> +	 */
>> +	if (sdev->pwr_dom_count <= 1)
>> +		return 0;
>> +
>> +	sdev->pwr_dom_devs = devm_kcalloc(dev, sdev->pwr_dom_count,
>> +					       sizeof(*sdev->pwr_dom_devs),
>> +					       GFP_KERNEL);
>> +	if (!sdev->pwr_dom_devs)
>> +		return -ENOMEM;
>> +
>> +	sdev->pwr_dom_links = devm_kcalloc(dev, sdev->pwr_dom_count,
>> +						sizeof(*sdev->pwr_dom_links),
>> +						GFP_KERNEL);
>> +	if (!sdev->pwr_dom_links)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < sdev->pwr_dom_count; i++) {
>> +		sdev->pwr_dom_devs[i] = dev_pm_domain_attach_by_id(dev, i);
>> +		if (IS_ERR(sdev->pwr_dom_devs[i])) {
>> +			int ret = PTR_ERR(sdev->pwr_dom_devs[i]);
>> +			if (ret == -EPROBE_DEFER) {
>> +				simpledrm_device_detach_genpd(sdev);
>> +				return PTR_ERR(sdev->pwr_dom_devs[i]);
>> +			}
>> +			drm_err(&sdev->dev,
>> +				"pm_domain_attach_by_id(%u) failed: %d\n", i, ret);
>
> The driver's not really failing to initialize AFAICT. CAlling drm_warn() 
> might be more appropriate.
>
>> +		}
>> +
>> +		sdev->pwr_dom_links[i] = device_link_add(dev,
>> +							 sdev->pwr_dom_devs[i],
>> +							 DL_FLAG_STATELESS |
>> +							 DL_FLAG_PM_RUNTIME |
>> +							 DL_FLAG_RPM_ACTIVE);
>> +		if (!sdev->pwr_dom_links[i])
>> +			drm_err(&sdev->dev, "failed to link power-domain %u\n", i);
>
> Also drm_warn() ?
>
> Best regards
> Thomas
>
>> +	}
>> +
>> +	return devm_add_action_or_reset(dev, simpledrm_device_detach_genpd, sdev);
>> +}
>> +#else
>> +static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev)
>> +{
>> +	return 0;
>> +}
>> +#endif
>> +
>>   /*
>>    * Modesetting
>>    */
>> @@ -651,6 +754,9 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
>>   	if (ret)
>>   		return ERR_PTR(ret);
>>   	ret = simpledrm_device_init_regulators(sdev);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +	ret = simpledrm_device_attach_genpd(sdev);
>>   	if (ret)
>>   		return ERR_PTR(ret);
>>   
>> 
>> ---
>> base-commit: 15d30b46573d75f5cb58cfacded8ebab9c76a2b0
>> change-id: 20230910-simpledrm-multiple-power-domains-f41efa6ad9bc
>> 
>> Best regards,

-- 
Jani Nikula, Intel Open Source Graphics Center
