Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F9C3B9D78
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 10:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0AB89FE8;
	Fri,  2 Jul 2021 08:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4307D89FE8;
 Fri,  2 Jul 2021 08:20:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="269823409"
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; d="scan'208";a="269823409"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 01:20:09 -0700
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; d="scan'208";a="482215068"
Received: from flast-mobl.ger.corp.intel.com (HELO localhost) ([10.252.43.116])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 01:20:03 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 50/53] drm/i915/display/dsc: Add Per connector debugfs
 node for DSC BPP enable
In-Reply-To: <20210701202427.1547543-51-matthew.d.roper@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
 <20210701202427.1547543-51-matthew.d.roper@intel.com>
Date: Fri, 02 Jul 2021 11:19:59 +0300
Message-ID: <8735sxqg9c.fsf@intel.com>
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
Cc: Patnana Venkata Sai <venkata.sai.patnana@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>, dri-devel@lists.freedesktop.org,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 01 Jul 2021, Matt Roper <matthew.d.roper@intel.com> wrote:
> From: Anusha Srivatsa <anusha.srivatsa@intel.com>
>
> DSC can be supported per DP connector. This patch creates
> a per connector debugfs node to expose the Input and
> Compressed BPP.
>
> The same node can be used from userspace to force
> DSC to a certain BPP.
>
> force_dsc_bpp is written through this debugfs
> node to force DSC BPP to all accepted values

I think this patch needs rework, and it's independent of the rest of the
series. Please just drop this one and the next.

BR,
Jani.

>
> Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  .../drm/i915/display/intel_display_debugfs.c  | 103 +++++++++++++++++-
>  .../drm/i915/display/intel_display_types.h    |   1 +
>  2 files changed, 103 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index af9e58619667..1805d70ea817 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -2389,6 +2389,100 @@ static const struct file_operations i915_dsc_fec_support_fops = {
>  	.write = i915_dsc_fec_support_write
>  };
>  
> +static int i915_dsc_bpp_support_show(struct seq_file *m, void *data)
> +{
> +	struct drm_connector *connector = m->private;
> +	struct drm_device *dev = connector->dev;
> +	struct drm_crtc *crtc;
> +	struct intel_dp *intel_dp;
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct intel_crtc_state *crtc_state = NULL;
> +	int ret = 0;
> +	bool try_again = false;
> +
> +	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
> +
> +	do {
> +		try_again = false;
> +		ret = drm_modeset_lock(&dev->mode_config.connection_mutex,
> +				       &ctx);
> +		if (ret) {
> +			ret = -EINTR;
> +			break;
> +		}
> +		crtc = connector->state->crtc;
> +		if (connector->status != connector_status_connected || !crtc) {
> +			ret = -ENODEV;
> +			break;
> +		}
> +		ret = drm_modeset_lock(&crtc->mutex, &ctx);
> +		if (ret == -EDEADLK) {
> +			ret = drm_modeset_backoff(&ctx);
> +			if (!ret) {
> +				try_again = true;
> +				continue;
> +			}
> +			break;
> +		} else if (ret) {
> +			break;
> +		}
> +		intel_dp = intel_attached_dp(to_intel_connector(connector));
> +		crtc_state = to_intel_crtc_state(crtc->state);
> +		seq_printf(m, "Input_BPP: %d\n", crtc_state->pipe_bpp);
> +		seq_printf(m, "Compressed_BPP: %d\n",
> +				crtc_state->dsc.compressed_bpp);
> +	} while (try_again);
> +
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
> +
> +	return ret;
> +}
> +
> +static ssize_t i915_dsc_bpp_support_write(struct file *file,
> +						const char __user *ubuf,
> +						size_t len, loff_t *offp)
> +{
> +	int dsc_bpp = 0;
> +	int ret;
> +	struct drm_connector *connector =
> +		((struct seq_file *)file->private_data)->private;
> +	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
> +	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
> +	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
> +
> +	if (len == 0)
> +		return 0;
> +
> +	drm_dbg(&i915->drm,
> +		"Copied %zu bytes from user to force BPP\n", len);
> +
> +	ret = kstrtoint_from_user(ubuf, len, 0, &dsc_bpp);
> +
> +	intel_dp->force_dsc_bpp = dsc_bpp;
> +	if (ret < 0)
> +		return ret;
> +
> +	*offp += len;
> +	return len;
> +}
> +
> +static int i915_dsc_bpp_support_open(struct inode *inode,
> +					   struct file *file)
> +{
> +	return single_open(file, i915_dsc_bpp_support_show,
> +			   inode->i_private);
> +}
> +
> +static const struct file_operations i915_dsc_bpp_support_fops = {
> +	.owner = THIS_MODULE,
> +	.open = i915_dsc_bpp_support_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +	.write = i915_dsc_bpp_support_write
> +};
> +
>  /**
>   * intel_connector_debugfs_add - add i915 specific connector debugfs files
>   * @connector: pointer to a registered drm_connector
> @@ -2427,9 +2521,16 @@ int intel_connector_debugfs_add(struct drm_connector *connector)
>  				    connector, &i915_hdcp_sink_capability_fops);
>  	}
>  
> -	if ((DISPLAY_VER(dev_priv) >= 11 || IS_CANNONLAKE(dev_priv)) && ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort && !to_intel_connector(connector)->mst_port) || connector->connector_type == DRM_MODE_CONNECTOR_eDP))
> +	if ((DISPLAY_VER(dev_priv) >= 11 || IS_CANNONLAKE(dev_priv)) &&
> +	    ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
> +	      !to_intel_connector(connector)->mst_port) ||
> +	     connector->connector_type == DRM_MODE_CONNECTOR_eDP)) {
>  		debugfs_create_file("i915_dsc_fec_support", S_IRUGO, root,
>  				    connector, &i915_dsc_fec_support_fops);
> +		debugfs_create_file("i915_dsc_bpp_support", 0444,
> +				    root, connector,
> +				    &i915_dsc_bpp_support_fops);
> +	}
>  
>  	/* Legacy panels doesn't lpsp on any platform */
>  	if ((DISPLAY_VER(dev_priv) >= 9 || IS_HASWELL(dev_priv) ||
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 29ae1d9b5abc..00320d89d266 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1627,6 +1627,7 @@ struct intel_dp {
>  
>  	/* Display stream compression testing */
>  	bool force_dsc_en;
> +	int force_dsc_bpp;
>  
>  	bool hobl_failed;
>  	bool hobl_active;

-- 
Jani Nikula, Intel Open Source Graphics Center
