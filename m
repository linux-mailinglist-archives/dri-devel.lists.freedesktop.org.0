Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 076E75C01F3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 17:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22AEB10E473;
	Wed, 21 Sep 2022 15:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B61110E473;
 Wed, 21 Sep 2022 15:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663775142; x=1695311142;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v8hHbat5N6VA30ihoXXlhd3xZsiKWP0LhwqZjL4MyHI=;
 b=QxDvzAHbr+qPbi21jBNNkJnkmmh0mUFOICELR4wpyruMZUTNOtixPgvw
 jbCDvACC99ZSAq6xbDNwtprUxJumZhAu6Qr3WFJwUoIoO7Hyqf6cBQ+LZ
 geuki2FHOhKfCFG6Te8X3+SAk1NHU1l/0aoerMbT2ujD5/b8k08YPjBez
 F8nXJ6nyThUiMSJE7XBfvpIuRp4bbcdFM6xvVZtLf7XL4cpW4xpBa7GNA
 JnXP18aZXwY//UAf1sWMjRBExSsHEY39vJ/Yever7Ie3hGxjhbHZJz/5/
 hJDrYwEp4P5qPN7tiAHkRj7sKTRnz65XrhC59H5Ep/AGNt4gaWAZqU/tr A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="298757146"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="298757146"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 08:45:41 -0700
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="948206992"
Received: from ashyti-mobl2.igk.intel.com (HELO intel.com) ([172.28.180.68])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 08:45:39 -0700
Date: Wed, 21 Sep 2022 17:45:37 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/7] drm/i915/hwmon: Add HWMON infrastructure
Message-ID: <YysxoXpnsct6QHyT@ashyti-mobl2.lan>
References: <20220916150054.807590-1-badal.nilawar@intel.com>
 <20220916150054.807590-2-badal.nilawar@intel.com>
 <YysHM8Ot1escBzEy@ashyti-mobl2.lan>
 <cf707153-a034-fae7-22b0-443592594433@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf707153-a034-fae7-22b0-443592594433@intel.com>
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
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Badal,

> > > +struct hwm_reg {
> > > +};
> > > +
> > > +struct hwm_drvdata {
> > > +	struct i915_hwmon *hwmon;
> > > +	struct intel_uncore *uncore;
> > > +	struct device *hwmon_dev;
> > > +	char name[12];
> > > +};
> > > +
> > > +struct i915_hwmon {
> > > +	struct hwm_drvdata ddat;
> > > +	struct mutex hwmon_lock;		/* counter overflow logic and rmw */
> > > +	struct hwm_reg rg;
> > > +};
> > > +
> > > +static const struct hwmon_channel_info *hwm_info[] = {
> > > +	NULL
> > > +};
> > > +
> > > +static umode_t
> > > +hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
> > > +	       u32 attr, int channel)
> > > +{
> > > +	switch (type) {
> > > +	default:
> > > +		return 0;
> > > +	}
> > > +}
> > > +
> > > +static int
> > > +hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> > > +	 int channel, long *val)
> > > +{
> > > +	switch (type) {
> > > +	default:
> > > +		return -EOPNOTSUPP;
> > > +	}
> > > +}
> > > +
> > > +static int
> > > +hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> > > +	  int channel, long val)
> > > +{
> > > +	switch (type) {
> > > +	default:
> > > +		return -EOPNOTSUPP;
> > > +	}
> > > +}
> > > +
> > > +static const struct hwmon_ops hwm_ops = {
> > > +	.is_visible = hwm_is_visible,
> > > +	.read = hwm_read,
> > > +	.write = hwm_write,
> > > +};
> > > +
> > > +static const struct hwmon_chip_info hwm_chip_info = {
> > > +	.ops = &hwm_ops,
> > > +	.info = hwm_info,
> > > +};
> > 
> > what's the point for splitting so much? Can't you just send the
> > hwmon driver all at once? With this patch you are not actually
> > doing anything useful. In my opinion this should be squashed with
> > the next ones.

> During discussion in cover letter of rev0 series we decided to create
> separate infrastructure patch, as we wanted to keep kconfig, i915 hwmon
> structures and new file addition in separate patch. Further feature wise we
> kept adding new patches.

I don't really like this patch splitting, but it's my fault I
haven't reviewed it already in v1. Please, ignore then.

Andi
