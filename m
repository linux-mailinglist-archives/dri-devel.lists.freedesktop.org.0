Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 143985BFE28
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 14:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF5010E3B4;
	Wed, 21 Sep 2022 12:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D9C10E24E;
 Wed, 21 Sep 2022 12:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663764280; x=1695300280;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KDQfceECUxtTPfl3QcG6NVqjgCRsknHtfgrpkFpRc7Q=;
 b=MY1MTuLt8Du5ZywFo7SrApJaJipMpGaqLKhLOULi6Ol9wFulGqNwDM5A
 ZecV4ElApoxAjWBd8CZfzkyvVU/NBYB9hFgiIwfBU5YVoGz0wSQeBbMbF
 EGZ0ZGUWQOfVvwLw8x5NB2/gQCiwIF9AFYanMAf0EPWV7bkK1dqNe1v53
 k5nZuZ3HWoe3kG+7eeZr98hf7j1DQEMqUSovmHpI3b+IxZYI5gOASp130
 oG5Q0G2Rubs4CAAhBnh2+qh/Iq4fL3efDZT1x2AbktUo6s36q+lfl3092
 RbGSlhy0w01nz5Rfg5c/Cm8FK4h1shKtYVjl/xQKnOYFuBobuG4MFolnb A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="326303617"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="326303617"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 05:44:39 -0700
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="864405711"
Received: from ashyti-mobl2.igk.intel.com (HELO intel.com) ([172.28.180.68])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 05:44:38 -0700
Date: Wed, 21 Sep 2022 14:44:35 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/7] drm/i915/hwmon: Add HWMON infrastructure
Message-ID: <YysHM8Ot1escBzEy@ashyti-mobl2.lan>
References: <20220916150054.807590-1-badal.nilawar@intel.com>
 <20220916150054.807590-2-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220916150054.807590-2-badal.nilawar@intel.com>
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
Cc: linux-hwmon@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Badal,

> +struct hwm_reg {
> +};
> +
> +struct hwm_drvdata {
> +	struct i915_hwmon *hwmon;
> +	struct intel_uncore *uncore;
> +	struct device *hwmon_dev;
> +	char name[12];
> +};
> +
> +struct i915_hwmon {
> +	struct hwm_drvdata ddat;
> +	struct mutex hwmon_lock;		/* counter overflow logic and rmw */
> +	struct hwm_reg rg;
> +};
> +
> +static const struct hwmon_channel_info *hwm_info[] = {
> +	NULL
> +};
> +
> +static umode_t
> +hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
> +	       u32 attr, int channel)
> +{
> +	switch (type) {
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	 int channel, long *val)
> +{
> +	switch (type) {
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int
> +hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	  int channel, long val)
> +{
> +	switch (type) {
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_ops hwm_ops = {
> +	.is_visible = hwm_is_visible,
> +	.read = hwm_read,
> +	.write = hwm_write,
> +};
> +
> +static const struct hwmon_chip_info hwm_chip_info = {
> +	.ops = &hwm_ops,
> +	.info = hwm_info,
> +};

what's the point for splitting so much? Can't you just send the
hwmon driver all at once? With this patch you are not actually
doing anything useful. In my opinion this should be squashed with
the next ones.

> +static void
> +hwm_get_preregistration_info(struct drm_i915_private *i915)
> +{
> +}
> +
> +void i915_hwmon_register(struct drm_i915_private *i915)
> +{
> +	struct device *dev = i915->drm.dev;
> +	struct i915_hwmon *hwmon;
> +	struct device *hwmon_dev;
> +	struct hwm_drvdata *ddat;
> +
> +	/* hwmon is available only for dGfx */
> +	if (!IS_DGFX(i915))
> +		return;
> +
> +	hwmon = kzalloc(sizeof(*hwmon), GFP_KERNEL);

why don't we use devm_kzalloc?

> +	if (!hwmon)
> +		return;
> +
> +	i915->hwmon = hwmon;
> +	mutex_init(&hwmon->hwmon_lock);
> +	ddat = &hwmon->ddat;
> +
> +	ddat->hwmon = hwmon;
> +	ddat->uncore = &i915->uncore;
> +	snprintf(ddat->name, sizeof(ddat->name), "i915");
> +
> +	hwm_get_preregistration_info(i915);
> +
> +	/*  hwmon_dev points to device hwmon<i> */
> +	hwmon_dev = hwmon_device_register_with_info(dev, ddat->name,
> +						    ddat,
> +						    &hwm_chip_info,
> +						    NULL);
> +	if (IS_ERR(hwmon_dev)) {
> +		mutex_destroy(&hwmon->hwmon_lock);

there is not such a big need to destroy the mutex. Destroying
mutexes is more useful when you actually are creating/destroying
and there is some debug need. I don't think that's the case.

With the devm_kzalloc this would be just a return.

Andi

> +		i915->hwmon = NULL;
> +		kfree(hwmon);
> +		return;
> +	}
> +
> +	ddat->hwmon_dev = hwmon_dev;
> +}
> +
> +void i915_hwmon_unregister(struct drm_i915_private *i915)
> +{
> +	struct i915_hwmon *hwmon;
> +	struct hwm_drvdata *ddat;
> +
> +	hwmon = fetch_and_zero(&i915->hwmon);
> +	if (!hwmon)
> +		return;
> +
> +	ddat = &hwmon->ddat;
> +	if (ddat->hwmon_dev)
> +		hwmon_device_unregister(ddat->hwmon_dev);
> +
> +	mutex_destroy(&hwmon->hwmon_lock);
> +	kfree(hwmon);
> +}
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i915_hwmon.h
> new file mode 100644
> index 000000000000..7ca9cf2c34c9
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/i915_hwmon.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#ifndef __I915_HWMON_H__
> +#define __I915_HWMON_H__
> +
> +struct drm_i915_private;
> +
> +#if IS_REACHABLE(CONFIG_HWMON)
> +void i915_hwmon_register(struct drm_i915_private *i915);
> +void i915_hwmon_unregister(struct drm_i915_private *i915);
> +#else
> +static inline void i915_hwmon_register(struct drm_i915_private *i915) { };
> +static inline void i915_hwmon_unregister(struct drm_i915_private *i915) { };
> +#endif
> +
> +#endif /* __I915_HWMON_H__ */
> -- 
> 2.25.1
