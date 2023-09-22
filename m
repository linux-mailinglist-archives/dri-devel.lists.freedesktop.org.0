Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B697AB219
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 14:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7CE10E0BA;
	Fri, 22 Sep 2023 12:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF5610E669;
 Fri, 22 Sep 2023 12:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695385710; x=1726921710;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Wl5hKbTwWIKz4jMPdh4mnw83mPlcsKt64N+zcm6ASJk=;
 b=IW8P15/BwVIbvUCcA2I6bnsFW9o0i1JyIWc+OrURZA3HDUXjPqtfitmr
 Jf+zaw+HRAdyI/kDqlmbcUlE4cdjC9J+gPWqqPZxs1mm1xJY6gROnDe70
 NTp7uOc+u8YUGdVnbakoysA9WcQM6acHvEz30fbNdEM4JmDpZlM0o7LHK
 ymWSOlg6CefxY4CPgdyHDpJWdGdajrBQLZku7N76p9XZm6Qq+WiGKCm1S
 FEWqUdB//jKSYd/ITROfuv6vNSXzSXd545YkR3We40kuJAT8CsHeifNwL
 bY5dt4uYUsWSOTLEiKfCRyB4NIZJc+5wNcDB/Hz34Vwz3Cv34wDp6RBe6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="360195339"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="360195339"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 05:28:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="890799342"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="890799342"
Received: from aboreiko-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.50.131])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 05:27:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>, Mitul Golani
 <mitulkumar.ajitkumar.golani@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 7/8] drm/i915/dsc: Add debugfs entry to validate DSC
 fractional bpp
In-Reply-To: <81bd6bdf-6a83-5365-b360-3d2574b8fea1@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230913060606.1105349-1-mitulkumar.ajitkumar.golani@intel.com>
 <20230913060606.1105349-8-mitulkumar.ajitkumar.golani@intel.com>
 <8734z8q7lf.fsf@intel.com>
 <00f0441f-98e5-6d09-8f33-9c69e764b153@intel.com>
 <87il83pvta.fsf@intel.com>
 <81bd6bdf-6a83-5365-b360-3d2574b8fea1@intel.com>
Date: Fri, 22 Sep 2023 15:28:24 +0300
Message-ID: <87fs36o0if.fsf@intel.com>
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
Cc: suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Sep 2023, "Sharma, Swati2" <swati2.sharma@intel.com> wrote:
> On 21-Sep-23 5:44 PM, Jani Nikula wrote:
>> On Thu, 21 Sep 2023, "Sharma, Swati2" <swati2.sharma@intel.com> wrote:
>>> On 21-Sep-23 1:30 PM, Jani Nikula wrote:
>>>> On Wed, 13 Sep 2023, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com> wrote:
>>>>> From: Swati Sharma <swati2.sharma@intel.com>
>>>>>
>>>>> DSC_Sink_BPP_Precision entry is added to i915_dsc_fec_support_show
>>>>> to depict sink's precision.
>>>>> Also, new debugfs entry is created to enforce fractional bpp.
>>>>> If Force_DSC_Fractional_BPP_en is set then while iterating over
>>>>> output bpp with fractional step size we will continue if output_bpp is
>>>>> computed as integer. With this approach, we will be able to validate
>>>>> DSC with fractional bpp.
>>>>>
>>>>> v2:
>>>>> Add drm_modeset_unlock to new line(Suraj)
>>>>>
>>>>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>>>>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>>>> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
>>>>> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>>>>> ---
>>>>>    .../drm/i915/display/intel_display_debugfs.c  | 83 +++++++++++++++++++
>>>>>    .../drm/i915/display/intel_display_types.h    |  1 +
>>>>>    2 files changed, 84 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>>>>> index f05b52381a83..776ab96def1f 100644
>>>>> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>>>>> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>>>>> @@ -1244,6 +1244,8 @@ static int i915_dsc_fec_support_show(struct seq_file *m, void *data)
>>>>>    								      DP_DSC_YCbCr420_Native)),
>>>>>    			   str_yes_no(drm_dp_dsc_sink_supports_format(intel_dp->dsc_dpcd,
>>>>>    								      DP_DSC_YCbCr444)));
>>>>> +		seq_printf(m, "DSC_Sink_BPP_Precision: %d\n",
>>>>> +			   drm_dp_dsc_sink_bpp_incr(intel_dp->dsc_dpcd));
>>>>>    		seq_printf(m, "Force_DSC_Enable: %s\n",
>>>>>    			   str_yes_no(intel_dp->force_dsc_en));
>>>>>    		if (!intel_dp_is_edp(intel_dp))
>>>>> @@ -1436,6 +1438,84 @@ static const struct file_operations i915_dsc_output_format_fops = {
>>>>>    	.write = i915_dsc_output_format_write
>>>>>    };
>>>>>    
>>>>> +static int i915_dsc_fractional_bpp_show(struct seq_file *m, void *data)
>>>>> +{
>>>>> +	struct drm_connector *connector = m->private;
>>>>> +	struct drm_device *dev = connector->dev;
>>>>> +	struct drm_crtc *crtc;
>>>>> +	struct intel_dp *intel_dp;
>>>>> +	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
>>>>> +	int ret;
>>>>> +
>>>>> +	if (!encoder)
>>>>> +		return -ENODEV;
>>>>> +
>>>>> +	ret = drm_modeset_lock_single_interruptible(&dev->mode_config.connection_mutex);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	crtc = connector->state->crtc;
>>>>> +	if (connector->status != connector_status_connected || !crtc) {
>>>>> +		ret = -ENODEV;
>>>>> +		goto out;
>>>>> +	}
>>>>> +
>>>>> +	intel_dp = intel_attached_dp(to_intel_connector(connector));
>>>>> +	seq_printf(m, "Force_DSC_Fractional_BPP_Enable: %s\n",
>>>>> +		   str_yes_no(intel_dp->force_dsc_fractional_bpp_en));
>>>>
>>>> Why "Force_DSC_Fractional_BPP_Enable" in the output?
>>>>
>>>> Usually debugfs files, like sysfs files, for stuff like this should be
>>>> attributes, one thing per file. Why print a long name for it, if the
>>>> name of the debugfs file is the name of the attribute?
>>>>
>>>> And even if you print it for humans, why the underscores?
>>>
>>> Hi Jani,
>>> Followed same strategy as we are doing for other dsc scenarios like
>>> force_dsc.
>>> Even naming convention followed same as other dsc stuff like
>>> Force_DSC_Enable, etc.
>>> All DSC related enteries have underscores in its naming convention.
>> 
>> There's value in that, though maybe my comment highlights I'm not fond
>> of the existing stuff. ;)
>
> Sure, I can work on cleanup part later.
>
>> 
>>> May be i can consolidate other dsc debugfs enteries into
>>> one as a cleanup task later. But it will impact IGT aswell. And i'm not
>>> sure if we can break compatibility but since IGT (intel as only vendor)
>>> is the only consumer, may be we change at both places and clean it up.
>> 
>> We can do what we want with debugfs, as long as we change both the
>> driver and igt.
>
> Sure, will make corresponding changes in both IGT and KMD.
>
>> 
>>>
>>>>
>>>>> +
>>>>> +out:
>>>>> +	drm_modeset_unlock(&dev->mode_config.connection_mutex);
>>>>> +
>>>>> +	return ret;
>>>>> +}
>>>>> +
>>>>> +static ssize_t i915_dsc_fractional_bpp_write(struct file *file,
>>>>> +					     const char __user *ubuf,
>>>>> +					     size_t len, loff_t *offp)
>>>>> +{
>>>>> +	struct drm_connector *connector =
>>>>> +		((struct seq_file *)file->private_data)->private;
>>>>
>>>> I know this is copy-pasted from elsewhere, but really it's nicer to
>>>> avoid the cast, and copy-paste from the places that get this right:
>>>>
>>>> 	struct seq_file *m = file->private_data;
>>>>           struct drm_connector *connector = m->private;
>>>
>>> Done.
>>>
>>>>
>>>>> +	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
>>>>> +	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
>>>>> +	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
>>>>> +	bool dsc_fractional_bpp_enable = false;
>>>>> +	int ret;
>>>>> +
>>>>> +	if (len == 0)
>>>>> +		return 0;
>>>>
>>>> kstrtobool_from_user() has this covered.
>>>
>>> Done.
>>>
>>>>
>>>>> +
>>>>> +	drm_dbg(&i915->drm,
>>>>> +		"Copied %zu bytes from user to force fractional bpp for DSC\n", len);
>>>>
>>>> That's useless.
>>>
>>> Done.
>>>
>>>>
>>>>> +
>>>>> +	ret = kstrtobool_from_user(ubuf, len, &dsc_fractional_bpp_enable);
>>>>> +	if (ret < 0)
>>>>> +		return ret;
>>>>> +
>>>>> +	drm_dbg(&i915->drm, "Got %s for DSC Fractional BPP Enable\n",
>>>>> +		(dsc_fractional_bpp_enable) ? "true" : "false");
>>>>
>>>> Is this useful?
>>>
>>> Yes, to know when fractional bpp is enabled.
>> 
>> I think it would be more useful to debug log this at the use site, not
>> when you're setting the debugfs knob.
>
> We already have those in IGT. Like said, to maintain consitency with 
> other dsc func() like fec_support_write(), this debug print is added 
> here. I can drop and will drop from fec_support_write() too during cleanup.
>
>> 
>> BR,
>> Jani.
>> 
>> 
>> 
>> 
>>>
>>>>
>>>>> +	intel_dp->force_dsc_fractional_bpp_en = dsc_fractional_bpp_enable;
>>>>> +
>>>>> +	*offp += len;
>>>>> +
>>>>> +	return len;
>>>>> +}
>>>>> +
>>>>> +static int i915_dsc_fractional_bpp_open(struct inode *inode,
>>>>> +					struct file *file)
>>>>> +{
>>>>> +	return single_open(file, i915_dsc_fractional_bpp_show, inode->i_private);
>>>>> +}
>>>>> +
>>>>> +static const struct file_operations i915_dsc_fractional_bpp_fops = {
>>>>> +	.owner = THIS_MODULE,
>>>>> +	.open = i915_dsc_fractional_bpp_open,
>>>>> +	.read = seq_read,
>>>>> +	.llseek = seq_lseek,
>>>>> +	.release = single_release,
>>>>> +	.write = i915_dsc_fractional_bpp_write
>>>>> +};
>>>>> +
>>>>>    /*
>>>>>     * Returns the Current CRTC's bpc.
>>>>>     * Example usage: cat /sys/kernel/debug/dri/0/crtc-0/i915_current_bpc
>>>>> @@ -1513,6 +1593,9 @@ void intel_connector_debugfs_add(struct intel_connector *intel_connector)
>>>>>    
>>>>>    		debugfs_create_file("i915_dsc_output_format", 0644, root,
>>>>>    				    connector, &i915_dsc_output_format_fops);
>>>>> +
>>>>> +		debugfs_create_file("i915_dsc_fractional_bpp", 0644, root,
>>>>> +				    connector, &i915_dsc_fractional_bpp_fops);
>>>>>    	}
>>>>>    
>>>>>    	if (connector->connector_type == DRM_MODE_CONNECTOR_DSI ||
>>>>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
>>>>> index 69bcabec4a29..27b31cb4c7b4 100644
>>>>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>>>>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>>>>> @@ -1797,6 +1797,7 @@ struct intel_dp {
>>>>>    	/* Display stream compression testing */
>>>>>    	bool force_dsc_en;
>>>>>    	int force_dsc_output_format;
>>>>> +	bool force_dsc_fractional_bpp_en;
>>>>>    	int force_dsc_bpc;
>>>>>    
>>>>>    	bool hobl_failed;
>>>>
>> 
>
> With above KMD changes IGT is already rb'ed and validated
> https://patchwork.freedesktop.org/series/117493/#rev12
> I request if we can get ack on this. As cleanup task,
> will make changes as requested.

Okay then.

BR,
Jani.


-- 
Jani Nikula, Intel
