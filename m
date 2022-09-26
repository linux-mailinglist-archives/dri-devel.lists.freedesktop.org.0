Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 918345EA3F6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 13:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE6E10E2C2;
	Mon, 26 Sep 2022 11:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368C510E2C2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 11:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664192224; x=1695728224;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=l8cJZ5nZRG0uHz3Sa9OLQ1/1gGRqKclgPkG6e83e0a8=;
 b=FVqjLul3zp/Hpms5881C4oRQvrzjeD+reSN+5m6mC7bW6uQWz8OleSYR
 XAczpZTKoNWd6Rqan444UNgLtrdRWhHFoe3hX0lL/lF65qs+urlo2lqN/
 rzkClUOTh569E4Fc8tEwllstpYYx8j97nqUrEAJGJRqC8aKCRGYdS3PYd
 iv3ubI6QZZnWZH+LmI1fmocYNks/zwgyoQN1iP+MCizfd42jOI7ylRXcY
 PCNjkK3aF8zfV3/DQ5UzF2+b6M7ETlqvrHnU4Ps+RH/28igKLD7lkmzqy
 Dsp+SOAMJR4BUJlI87RDMaw4hI6NlnX+N8sPfwig7elf3EnmgyYswlwFS A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="302473254"
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200"; d="scan'208";a="302473254"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 04:37:03 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="651794097"
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200"; d="scan'208";a="651794097"
Received: from lsabisze-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.243])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 04:37:01 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Simon Rettberg <simon.rettberg@rz.uni-freiburg.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH RESEND] drm/display: Don't assume dual mode adaptors
 support i2c sub-addressing
In-Reply-To: <20220926124017.529806df@computer>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220926124017.529806df@computer>
Date: Mon, 26 Sep 2022 14:36:41 +0300
Message-ID: <87edvy2wqe.fsf@intel.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Sep 2022, Simon Rettberg <simon.rettberg@rz.uni-freiburg.de> wrote:
> Current dual mode adaptor ("DP++") detection code assumes that all adaptors
> support i2c sub-addressing for read operations from the DP-HDMI adaptor ID
> buffer.  It has been observed that multiple adaptors do not in fact
> support this, and always return data starting at register 0.  On
> affected adaptors, the code failed to read the proper registers that
> would identify the device as a type 2 adaptor, and handled those as
> type 1, limiting the TMDS clock to 165MHz.
> Fix this by always reading the ID buffer starting from offset 0, and
> discarding any bytes before the actual offset of interest.
>
> Signed-off-by: Simon Rettberg <simon.rettberg@rz.uni-freiburg.de>
> Reviewed-by: Rafael Gieschke <rafael.gieschke@rz.uni-freiburg.de>
> ---
> (Resend because of no response, probably my fault since I ran
> get_maintainers on a shallow clone and missed a bunch of people)
>
> We had problems with multiple different "4k ready" DP++ adaptors only
> resulting in 1080p resolution on Linux. While one of them turned out to
> actually just be a type1 adaptor, the others, according to the data
> retreived via i2cdump, were in fact proper type2 adaptors, advertising a
> TMDS clock of 300MHz. As it turned out, none of them supported
> sub-addressing when reading from the DP-HDMI adaptor ID buffer via i2c.
> The existing code suggested that this is known to happen with "broken"
> type1 adaptors, but evidently, type2 adaptors are also affected.
> We tried finding authoritative documentation on whether or not this is
> allowed behavior, but since all the official VESA docs are paywalled,
> the best we could come up with was the spec sheet for Texas Instruments'
> SNx5DP149 chip family.[1] It explicitly mentions that sub-adressing is
> supported for register writes, but *not* for reads (See NOTE in
> section 8.5.3). Unless TI blatantly and openly decided to violate the
> VESA spec, one could take that as a strong hint that sub-addressing is
> in fact not mandated by VESA.
>
> [1] https://www.ti.com/lit/ds/symlink/sn75dp149.pdf

Cc: Ville. Also bounced to intel-gfx list to get CI results.

We'll probably want to have the above details included in the commit
message too.

BR,
Jani.



>
>  .../gpu/drm/display/drm_dp_dual_mode_helper.c | 52 ++++++++++---------
>  1 file changed, 28 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> index 3ea53bb67..6147da983 100644
> --- a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> @@ -63,23 +63,42 @@
>  ssize_t drm_dp_dual_mode_read(struct i2c_adapter *adapter,
>  			      u8 offset, void *buffer, size_t size)
>  {
> +	int ret;
> +	u8 zero = 0;
> +	char *tmpbuf;
> +	/*
> +	 * As sub-addressing is not supported by all adaptors,
> +	 * always explicitly read from the start and discard
> +	 * any bytes that come before the requested offset.
> +	 * This way, no matter whether the adaptor supports it
> +	 * or not, we'll end up reading the proper data.
> +	 */
>  	struct i2c_msg msgs[] = {
>  		{
>  			.addr = DP_DUAL_MODE_SLAVE_ADDRESS,
>  			.flags = 0,
>  			.len = 1,
> -			.buf = &offset,
> +			.buf = &zero,
>  		},
>  		{
>  			.addr = DP_DUAL_MODE_SLAVE_ADDRESS,
>  			.flags = I2C_M_RD,
> -			.len = size,
> -			.buf = buffer,
> +			.len = size + offset,
> +			.buf = NULL,
>  		},
>  	};
> -	int ret;
>  
> +	tmpbuf = kmalloc(size + offset, GFP_KERNEL);
> +	if (!tmpbuf)
> +		return -ENOMEM;
> +
> +	msgs[1].buf = tmpbuf;
>  	ret = i2c_transfer(adapter, msgs, ARRAY_SIZE(msgs));
> +	if (ret == ARRAY_SIZE(msgs))
> +		memcpy(buffer, tmpbuf + offset, size);
> +
> +	kfree(tmpbuf);
> +
>  	if (ret < 0)
>  		return ret;
>  	if (ret != ARRAY_SIZE(msgs))
> @@ -208,18 +227,6 @@ enum drm_dp_dual_mode_type drm_dp_dual_mode_detect(const struct drm_device *dev,
>  	if (ret)
>  		return DRM_DP_DUAL_MODE_UNKNOWN;
>  
> -	/*
> -	 * Sigh. Some (maybe all?) type 1 adaptors are broken and ack
> -	 * the offset but ignore it, and instead they just always return
> -	 * data from the start of the HDMI ID buffer. So for a broken
> -	 * type 1 HDMI adaptor a single byte read will always give us
> -	 * 0x44, and for a type 1 DVI adaptor it should give 0x00
> -	 * (assuming it implements any registers). Fortunately neither
> -	 * of those values will match the type 2 signature of the
> -	 * DP_DUAL_MODE_ADAPTOR_ID register so we can proceed with
> -	 * the type 2 adaptor detection safely even in the presence
> -	 * of broken type 1 adaptors.
> -	 */
>  	ret = drm_dp_dual_mode_read(adapter, DP_DUAL_MODE_ADAPTOR_ID,
>  				    &adaptor_id, sizeof(adaptor_id));
>  	drm_dbg_kms(dev, "DP dual mode adaptor ID: %02x (err %zd)\n", adaptor_id, ret);
> @@ -233,11 +240,10 @@ enum drm_dp_dual_mode_type drm_dp_dual_mode_detect(const struct drm_device *dev,
>  				return DRM_DP_DUAL_MODE_TYPE2_DVI;
>  		}
>  		/*
> -		 * If neither a proper type 1 ID nor a broken type 1 adaptor
> -		 * as described above, assume type 1, but let the user know
> -		 * that we may have misdetected the type.
> +		 * If not a proper type 1 ID, still assume type 1, but let
> +		 * the user know that we may have misdetected the type.
>  		 */
> -		if (!is_type1_adaptor(adaptor_id) && adaptor_id != hdmi_id[0])
> +		if (!is_type1_adaptor(adaptor_id))
>  			drm_err(dev, "Unexpected DP dual mode adaptor ID %02x\n", adaptor_id);
>  
>  	}
> @@ -343,10 +349,8 @@ EXPORT_SYMBOL(drm_dp_dual_mode_get_tmds_output);
>   * @enable: enable (as opposed to disable) the TMDS output buffers
>   *
>   * Set the state of the TMDS output buffers in the adaptor. For
> - * type2 this is set via the DP_DUAL_MODE_TMDS_OEN register. As
> - * some type 1 adaptors have problems with registers (see comments
> - * in drm_dp_dual_mode_detect()) we avoid touching the register,
> - * making this function a no-op on type 1 adaptors.
> + * type2 this is set via the DP_DUAL_MODE_TMDS_OEN register.
> + * Type1 adaptors do not support any register writes.
>   *
>   * Returns:
>   * 0 on success, negative error code on failure

-- 
Jani Nikula, Intel Open Source Graphics Center
