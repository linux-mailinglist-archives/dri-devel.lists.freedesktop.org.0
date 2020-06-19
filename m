Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0490B201A88
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 20:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348F76E4AD;
	Fri, 19 Jun 2020 18:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650BF6E4A2;
 Fri, 19 Jun 2020 18:41:46 +0000 (UTC)
IronPort-SDR: 3+sc+CtlWhqxiCySBjZIU2HSK2FyEZn6AWGr5aajaWl7Hb+nWBtIBAyACrd1WnO74T9bs8J9Ra
 USRsdkKuG6lg==
X-IronPort-AV: E=McAfee;i="6000,8403,9657"; a="140573199"
X-IronPort-AV: E=Sophos;i="5.75,256,1589266800"; d="scan'208";a="140573199"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 11:41:46 -0700
IronPort-SDR: bZCyhcpJfDqn2vB/ZvbzAIVl3dK/Efz2nZPYQV+rOphBFkchja26alTtDbyPDgFO6eg02+4gdA
 kAKovAweBHQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,256,1589266800"; d="scan'208";a="383911997"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com)
 ([10.165.21.211])
 by fmsmga001.fm.intel.com with ESMTP; 19 Jun 2020 11:41:44 -0700
Date: Fri, 19 Jun 2020 11:42:39 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [v8 3/3] drm/debug: Expose connector VRR monitor range via debugfs
Message-ID: <20200619184239.GA4000@intel.com>
References: <20200619212356.19285-1-bhanuprakash.modem@intel.com>
 <20200619212356.19285-4-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200619212356.19285-4-bhanuprakash.modem@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bhanu,

Thanks for the patch, functionality wise looks good. Have you tested this
with kms_vrr IGT, do we see the vrr_range properly exposed?

Also please find some comments below

On Sat, Jun 20, 2020 at 02:53:56AM +0530, Bhanuprakash Modem wrote:
> [Why]
> It's useful to know the min and max vrr range for IGT testing.
> =

> [How]
> Expose the min and max vfreq for the connector via a debugfs file
> on the connector, "vrr_range".
> =

> Example usage: cat /sys/kernel/debug/dri/0/DP-1/vrr_range
> =

> v2:
> * Fix the typo in max_vfreq (Manasi)
> * Change the name of node to i915_vrr_info so we can add
> other vrr info for more debug info (Manasi)
> * Change the VRR capable to display Yes or No (Manasi)
> * Fix indentation checkpatch errors (Manasi)
> v3:
> * Remove the unnecessary debug print (Manasi)
> v4:
> * Rebase
> v5:
> * Rename to vrr_range to match AMD debugfs
> v6:
> * Rebase (manasi)
> v7:
> * Fix cmpilation due to rebase
> v8:
> * Move debugfs node creation logic to DRM (Emil)
> * Remove AMD specific logic (Emil)
> =

> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 20 -----------------
>  drivers/gpu/drm/drm_debugfs.c                 | 22 +++++++++++++++++++
>  2 files changed, 22 insertions(+), 20 deletions(-)
> =

> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index 076af267b488..71387d2af2ed 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -820,24 +820,6 @@ static int output_bpc_show(struct seq_file *m, void =
*data)
>  	return res;
>  }
>  =

> -/*
> - * Returns the min and max vrr vfreq through the connector's debugfs fil=
e.
> - * Example usage: cat /sys/kernel/debug/dri/0/DP-1/vrr_range
> - */
> -static int vrr_range_show(struct seq_file *m, void *data)
> -{
> -	struct drm_connector *connector =3D m->private;
> -	struct amdgpu_dm_connector *aconnector =3D to_amdgpu_dm_connector(conne=
ctor);
> -
> -	if (connector->status !=3D connector_status_connected)
> -		return -ENODEV;
> -
> -	seq_printf(m, "Min: %u\n", (unsigned int)aconnector->min_vfreq);
> -	seq_printf(m, "Max: %u\n", (unsigned int)aconnector->max_vfreq);
> -
> -	return 0;
> -}
> -
>  #ifdef CONFIG_DRM_AMD_DC_HDCP
>  /*
>   * Returns the HDCP capability of the Display (1.4 for now).
> @@ -1001,7 +983,6 @@ static ssize_t dp_dpcd_data_read(struct file *f, cha=
r __user *buf,
>  DEFINE_SHOW_ATTRIBUTE(dmub_fw_state);
>  DEFINE_SHOW_ATTRIBUTE(dmub_tracebuffer);
>  DEFINE_SHOW_ATTRIBUTE(output_bpc);
> -DEFINE_SHOW_ATTRIBUTE(vrr_range);
>  #ifdef CONFIG_DRM_AMD_DC_HDCP
>  DEFINE_SHOW_ATTRIBUTE(hdcp_sink_capability);
>  #endif
> @@ -1059,7 +1040,6 @@ static const struct {
>  		{"phy_settings", &dp_phy_settings_debugfs_fop},
>  		{"test_pattern", &dp_phy_test_pattern_fops},
>  		{"output_bpc", &output_bpc_fops},
> -		{"vrr_range", &vrr_range_fops},
>  #ifdef CONFIG_DRM_AMD_DC_HDCP
>  		{"hdcp_sink_capability", &hdcp_sink_capability_fops},
>  #endif

I think the AMD sepecific debugfs removal should be in a separate patch fol=
lwing the drm_debugfs addition
patch because from merging pov that patch will get merged through AMD tree
and drm patch will get merged through drm_misc
Also cc the amd dev mailing list for that patch.

@Harry does that sound okay from merging pov?

Manasi

> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index bfe4602f206b..3d7182001004 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -376,6 +376,24 @@ static ssize_t edid_write(struct file *file, const c=
har __user *ubuf,
>  	return (ret) ? ret : len;
>  }
>  =

> +/*
> + * Returns the min and max vrr vfreq through the connector's debugfs fil=
e.
> + * Example usage: cat /sys/kernel/debug/dri/0/DP-1/vrr_range
> + */
> +static int vrr_range_show(struct seq_file *m, void *data)
> +{
> +	struct drm_connector *connector =3D m->private;
> +
> +	if (connector->status !=3D connector_status_connected)
> +		return -ENODEV;
> +
> +	seq_printf(m, "Min: %u\n", (u8)connector->display_info.monitor_range.mi=
n_vfreq);
> +	seq_printf(m, "Max: %u\n", (u8)connector->display_info.monitor_range.ma=
x_vfreq);
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(vrr_range);
> +
>  static const struct file_operations drm_edid_fops =3D {
>  	.owner =3D THIS_MODULE,
>  	.open =3D edid_open,
> @@ -413,6 +431,10 @@ void drm_debugfs_connector_add(struct drm_connector =
*connector)
>  	/* edid */
>  	debugfs_create_file("edid_override", S_IRUGO | S_IWUSR, root, connector,
>  			    &drm_edid_fops);
> +
> +	/* vrr range */
> +	debugfs_create_file("vrr_range", S_IRUGO, root, connector,
> +			    &vrr_range_fops);
>  }
>  =

>  void drm_debugfs_connector_remove(struct drm_connector *connector)
> -- =

> 2.20.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
