Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EA922977E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 13:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C926E81A;
	Wed, 22 Jul 2020 11:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4821389B4D;
 Wed, 22 Jul 2020 11:33:32 +0000 (UTC)
IronPort-SDR: 9YFp9nAOfyA6c6+x6pYp6kabMihn/c2aLJoYmQPcgG+se8JNDm1PQdZmuvt93VYlEtUanwaHU+
 fJGNCHb/K0Qg==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="147807473"
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="147807473"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 04:33:31 -0700
IronPort-SDR: crb0g6DXLg7BYUWf2B208Qvj2EicPyZp2PefbqKNCNUb8raK4+G1cXn5SWWRYqUz7yoxq86/gc
 3vYsnm181upg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="326667254"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 22 Jul 2020 04:33:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 22 Jul 2020 14:33:28 +0300
Date: Wed, 22 Jul 2020 14:33:28 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v1] drm/i915/dsi: Drop double check for ACPI
 companion device
Message-ID: <20200722113328.GA6112@intel.com>
References: <20200529123317.20470-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200529123317.20470-1-andriy.shevchenko@linux.intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 29, 2020 at 03:33:17PM +0300, Andy Shevchenko wrote:
> acpi_dev_get_resources() does perform the NULL pointer check against
> ACPI companion device which is given as function parameter. Thus,
> there is no need to duplicate this check in the caller.
> =

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Sorry, I did look at this but apparently forgot to reply...

> ---
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 24 ++++++++------------
>  1 file changed, 10 insertions(+), 14 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/d=
rm/i915/display/intel_dsi_vbt.c
> index 574dcfec9577..6f9e08cda964 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> @@ -426,23 +426,19 @@ static void i2c_acpi_find_adapter(struct intel_dsi =
*intel_dsi,
>  {
>  	struct drm_device *drm_dev =3D intel_dsi->base.base.dev;
>  	struct device *dev =3D &drm_dev->pdev->dev;
> -	struct acpi_device *acpi_dev;
> +	struct acpi_device *acpi_dev =3D ACPI_COMPANION(dev);
>  	struct list_head resource_list;
>  	struct i2c_adapter_lookup lookup;
>  =

> -	acpi_dev =3D ACPI_COMPANION(dev);
> -	if (acpi_dev) {
> -		memset(&lookup, 0, sizeof(lookup));
> -		lookup.slave_addr =3D slave_addr;
> -		lookup.intel_dsi =3D intel_dsi;
> -		lookup.dev_handle =3D acpi_device_handle(acpi_dev);
> -
> -		INIT_LIST_HEAD(&resource_list);
> -		acpi_dev_get_resources(acpi_dev, &resource_list,
> -				       i2c_adapter_lookup,
> -				       &lookup);
> -		acpi_dev_free_resource_list(&resource_list);
> -	}
> +	memset(&lookup, 0, sizeof(lookup));
> +	lookup.slave_addr =3D slave_addr;
> +	lookup.intel_dsi =3D intel_dsi;
> +	lookup.dev_handle =3D acpi_device_handle(acpi_dev);

struct i2c_adapter_lookup lookup =3D {
	.slave_addr =3D ...
};

?

> +
> +	INIT_LIST_HEAD(&resource_list);

Declare as LIST_HEAD(resource_list); ?

> +	acpi_dev_get_resources(acpi_dev, &resource_list,
> +			       i2c_adapter_lookup, &lookup);
> +	acpi_dev_free_resource_list(&resource_list);

I was very confused by this code since on the first glance it appears to
absolutely nothing. After a deeper look it looks like
i2c_adapter_lookup() magically mutates intel_dsi->i2c_bus_num.
Did I mention I hate functions with side effects? IMO would be much
better if i2c_adapter_lookup() did what it says on the tin and just
returned the adapter number and let the caller deal with it. But
this is a pre-existing issue with the code and so not directly related
to your patch.

>  }
>  #else
>  static inline void i2c_acpi_find_adapter(struct intel_dsi *intel_dsi,
> -- =

> 2.26.2
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
