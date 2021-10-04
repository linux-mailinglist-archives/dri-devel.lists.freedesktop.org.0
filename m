Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AA44212F8
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 17:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2C16EA3C;
	Mon,  4 Oct 2021 15:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8241F6E1BB;
 Mon,  4 Oct 2021 15:45:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="206292586"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="206292586"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 08:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="483164961"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga007.fm.intel.com with SMTP; 04 Oct 2021 08:34:17 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 04 Oct 2021 18:34:16 +0300
Date: Mon, 4 Oct 2021 18:34:16 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rajat Jain <rajatja@google.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude <lyude@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mark Gross <markgross@kernel.org>,
 Andy Shevchenko <andy@infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Mario Limonciello <mario.limonciello@outlook.com>,
 Mark Pearson <markpearson@lenovo.com>,
 Sebastien Bacher <seb128@ubuntu.com>,
 Marco Trevisan <marco.trevisan@canonical.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 09/10] drm/i915: Add intel_modeset_probe_defer() helper
Message-ID: <YVse+Kr2J4VO+2uu@intel.com>
References: <20211002163618.99175-1-hdegoede@redhat.com>
 <20211002163618.99175-10-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211002163618.99175-10-hdegoede@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 02, 2021 at 06:36:17PM +0200, Hans de Goede wrote:
> The upcoming privacy-screen support adds another check for
> deferring probe till some other drivers have bound first.
> 
> Factor out the current vga_switcheroo_client_probe_defer() check
> into an intel_modeset_probe_defer() helper, so that further
> probe-deferral checks can be added there.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
>  drivers/gpu/drm/i915/display/intel_display.h |  1 +
>  drivers/gpu/drm/i915/i915_pci.c              |  9 ++-------
>  3 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 60b2bc3ad011..e67f3207ba54 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -32,6 +32,7 @@
>  #include <linux/module.h>
>  #include <linux/dma-resv.h>
>  #include <linux/slab.h>
> +#include <linux/vga_switcheroo.h>
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> @@ -12690,6 +12691,18 @@ void intel_modeset_driver_remove_nogem(struct drm_i915_private *i915)
>  	intel_bios_driver_remove(i915);
>  }
>  
> +bool intel_modeset_probe_defer(struct pci_dev *pdev)
> +{
> +	/*
> +	 * apple-gmux is needed on dual GPU MacBook Pro
> +	 * to probe the panel if we're the inactive GPU.
> +	 */
> +	if (vga_switcheroo_client_probe_defer(pdev))
> +		return true;
> +
> +	return false;
> +}

Seems fine. Presumably Jani isn't too grumpy about it :P

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +
>  void intel_display_driver_register(struct drm_i915_private *i915)
>  {
>  	if (!HAS_DISPLAY(i915))
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
> index 3028072c2cf3..d3d34acb6c08 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -633,6 +633,7 @@ void intel_display_driver_register(struct drm_i915_private *i915);
>  void intel_display_driver_unregister(struct drm_i915_private *i915);
>  
>  /* modesetting */
> +bool intel_modeset_probe_defer(struct pci_dev *pdev);
>  void intel_modeset_init_hw(struct drm_i915_private *i915);
>  int intel_modeset_init_noirq(struct drm_i915_private *i915);
>  int intel_modeset_init_nogem(struct drm_i915_private *i915);
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index d4a6a9dcf182..cf4ad648b742 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -22,8 +22,6 @@
>   *
>   */
>  
> -#include <linux/vga_switcheroo.h>
> -
>  #include <drm/drm_drv.h>
>  #include <drm/i915_pciids.h>
>  
> @@ -1187,11 +1185,8 @@ static int i915_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (PCI_FUNC(pdev->devfn))
>  		return -ENODEV;
>  
> -	/*
> -	 * apple-gmux is needed on dual GPU MacBook Pro
> -	 * to probe the panel if we're the inactive GPU.
> -	 */
> -	if (vga_switcheroo_client_probe_defer(pdev))
> +	/* Detect if we need to wait for other drivers early on */
> +	if (intel_modeset_probe_defer(pdev))
>  		return -EPROBE_DEFER;
>  
>  	err = i915_driver_probe(pdev, ent);
> -- 
> 2.31.1

-- 
Ville Syrjälä
Intel
