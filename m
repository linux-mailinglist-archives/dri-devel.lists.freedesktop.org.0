Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E814AD28B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 08:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E439D10E2C2;
	Tue,  8 Feb 2022 07:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C06110E269;
 Tue,  8 Feb 2022 07:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644306733; x=1675842733;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zSjGWEp/lad+yOmZqYzDcbgsisGuWA+cNAYLyxP20Lw=;
 b=iCCf0cFrOTqfG3ozo4WcCvGBKZCbSBCPL8wchRiUctZhgAxpPyE3lHaP
 MMWmOIcU1cuHisv/YJZpFXhjJ7q7WsoaJ3VBRz2SPn/+W7QJjAzNnKG9t
 VDRVQ3A2Eghoe98h/gm5IGuWqvV/4n0HA5adTwyEjuz/pQwZbT2q/JAkK
 CptBKq13aHU5Ppxk6dAvqzLE4yhE+gYrzrManDXUs1Yrc/OwWlPZLYzrG
 /1KEwL2V5WRZjGe1xCIlCaIkUD3gmrahfN9uSL4FnWN4gGmEFqWRyoFKC
 67GzL1S/Hk0loXRRcOV9uPaeF7OyW1OIzeTjELmN8YR1mE0kBi+H7iU78 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="249103292"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="249103292"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 23:52:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="484724374"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga006.jf.intel.com with SMTP; 07 Feb 2022 23:52:06 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 08 Feb 2022 09:52:05 +0200
Date: Tue, 8 Feb 2022 09:52:05 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [Intel-gfx] [PATCH v7 1/3] gpu: drm: separate panel orientation
 property creating and value setting
Message-ID: <YgIhJb3+MckKD4dC@intel.com>
References: <20220208073714.1540390-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220208073714.1540390-1-hsinyi@chromium.org>
X-Patchwork-Hint: comment
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 08, 2022 at 03:37:12PM +0800, Hsin-Yi Wang wrote:
> +int drm_connector_init_panel_orientation_property(
> +	struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_property *prop;
> +
> +	prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
> +			"panel orientation",
> +			drm_panel_orientation_enum_list,
> +			ARRAY_SIZE(drm_panel_orientation_enum_list));
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	dev->mode_config.panel_orientation_property = prop;

Leak when called multiple times. I guess you could just put
this into drm_connector_create_standard_properties() instead
and avoid that issue entirely.

-- 
Ville Syrjälä
Intel
