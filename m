Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 769655F7BF0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 19:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13AC10E128;
	Fri,  7 Oct 2022 17:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E4610E051
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 17:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665162030; x=1696698030;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Z/G9S17bom96uc4tc9BUj5lHNKgdMXXbXnt003617GA=;
 b=XiJRELRPVjoRdfdhbzOmmjfiLIPj3pIYtofYJ8viQh3Lvkvx01DQUpwo
 /1rvfTrUmOQcZegggbrDABKu/3Ng3KkPktZqer68mOkW0cl+h7BRfjBOl
 3wBNmDi5Jk7gZ5hlKfR732ShuEQzYqRI3JIiPvdOFi/Ur7x33kQffndkJ
 sXdVuuia8bhBB/mNllf/FYkkNy3EJgFY50SCNSeIfRcFpX3ciMZ+xQLhU
 J52p7VhPOamRXn18KruuvQZtT2iQhki30jvD3aRllXJYP+9V5kAoQscF4
 TTri6ypt6NgAIAKZ+UeNDdsEKWmasWPSaaFDJGvn8CTS/ORKprqiYPL5i Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10493"; a="302502972"
X-IronPort-AV: E=Sophos;i="5.95,167,1661842800"; d="scan'208";a="302502972"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2022 10:00:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10493"; a="687969504"
X-IronPort-AV: E=Sophos;i="5.95,167,1661842800"; d="scan'208";a="687969504"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga008.fm.intel.com with SMTP; 07 Oct 2022 10:00:27 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Oct 2022 20:00:26 +0300
Date: Fri, 7 Oct 2022 20:00:26 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Rettberg <simon.rettberg@rz.uni-freiburg.de>
Subject: Re: [PATCH v2] drm/display: Don't assume dual mode adaptors support
 i2c sub-addressing
Message-ID: <Y0BbKr10gUO/xjZ/@intel.com>
References: <20221006113314.41101987@computer>
 <Yz7wKZnJeUzbz4Dw@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yz7wKZnJeUzbz4Dw@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 06, 2022 at 06:11:37PM +0300, Ville Syrjälä wrote:
> On Thu, Oct 06, 2022 at 11:33:14AM +0200, Simon Rettberg wrote:
> > Current dual mode adaptor ("DP++") detection code assumes that all
> > adaptors support i2c sub-addressing for read operations from the
> > DP-HDMI adaptor ID buffer.  It has been observed that multiple
> > adaptors do not in fact support this, and always return data starting
> > at register 0.  On affected adaptors, the code fails to read the proper
> > registers that would identify the device as a type 2 adaptor, and
> > handles those as type 1, limiting the TMDS clock to 165MHz, even if
> > the according register would announce a higher TMDS clock.
> > Fix this by always reading the ID buffer starting from offset 0, and
> > discarding any bytes before the actual offset of interest.
> > 
> > We tried finding authoritative documentation on whether or not this is
> > allowed behaviour, but since all the official VESA docs are paywalled,
> > the best we could come up with was the spec sheet for Texas Instruments'
> > SNx5DP149 chip family.[1]  It explicitly mentions that sub-addressing is
> > supported for register writes, but *not* for reads (See NOTE in
> > section 8.5.3).  Unless TI openly decided to violate the VESA spec, one
> > could take that as a hint that sub-addressing is in fact not mandated
> > by VESA.
> > The other two adaptors affected used the PS8409(A) and the LT8611,
> > according to the data returned from their ID buffers.
> > 
> > [1] https://www.ti.com/lit/ds/symlink/sn75dp149.pdf
> > 
> > Signed-off-by: Simon Rettberg <simon.rettberg@rz.uni-freiburg.de>
> > Reviewed-by: Rafael Gieschke <rafael.gieschke@rz.uni-freiburg.de>
> > ---
> > 
> > v2 changes form last submission's feedback (thanks for taking the time):
> > - Added a shortened version of our "background story" to the commit message
> > - Only use tmpbuf if the read offset is != 0
> 
> Bounced to intel-gfx to get the i915 CI to check it...

CI didn't blow up, and I also gave this a quick smoking on my end
with both type 1 HDMI and type 2 HDMI adaptors. 

I'm thinking we want a cc:stable on this? I can slap that on
when pushing if there are no objections?

> 
> > 
> >  .../gpu/drm/display/drm_dp_dual_mode_helper.c | 51 +++++++++++--------
> >  1 file changed, 29 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> > index 3ea53bb67d3b..bd61e20770a5 100644
> > --- a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> > @@ -63,23 +63,45 @@
> >  ssize_t drm_dp_dual_mode_read(struct i2c_adapter *adapter,
> >  			      u8 offset, void *buffer, size_t size)
> >  {
> > +	u8 zero = 0;
> > +	char *tmpbuf = NULL;
> > +	/*
> > +	 * As sub-addressing is not supported by all adaptors,
> > +	 * always explicitly read from the start and discard
> > +	 * any bytes that come before the requested offset.
> > +	 * This way, no matter whether the adaptor supports it
> > +	 * or not, we'll end up reading the proper data.
> > +	 */
> >  	struct i2c_msg msgs[] = {
> >  		{
> >  			.addr = DP_DUAL_MODE_SLAVE_ADDRESS,
> >  			.flags = 0,
> >  			.len = 1,
> > -			.buf = &offset,
> > +			.buf = &zero,
> >  		},
> >  		{
> >  			.addr = DP_DUAL_MODE_SLAVE_ADDRESS,
> >  			.flags = I2C_M_RD,
> > -			.len = size,
> > +			.len = size + offset,
> >  			.buf = buffer,
> >  		},
> >  	};
> >  	int ret;
> >  
> > +	if (offset) {
> > +		tmpbuf = kmalloc(size + offset, GFP_KERNEL);
> > +		if (!tmpbuf)
> > +			return -ENOMEM;
> > +
> > +		msgs[1].buf = tmpbuf;
> > +	}
> > +
> >  	ret = i2c_transfer(adapter, msgs, ARRAY_SIZE(msgs));
> > +	if (tmpbuf)
> > +		memcpy(buffer, tmpbuf + offset, size);
> > +
> > +	kfree(tmpbuf);
> > +
> >  	if (ret < 0)
> >  		return ret;
> >  	if (ret != ARRAY_SIZE(msgs))
> > @@ -208,18 +230,6 @@ enum drm_dp_dual_mode_type drm_dp_dual_mode_detect(const struct drm_device *dev,
> >  	if (ret)
> >  		return DRM_DP_DUAL_MODE_UNKNOWN;
> >  
> > -	/*
> > -	 * Sigh. Some (maybe all?) type 1 adaptors are broken and ack
> > -	 * the offset but ignore it, and instead they just always return
> > -	 * data from the start of the HDMI ID buffer. So for a broken
> > -	 * type 1 HDMI adaptor a single byte read will always give us
> > -	 * 0x44, and for a type 1 DVI adaptor it should give 0x00
> > -	 * (assuming it implements any registers). Fortunately neither
> > -	 * of those values will match the type 2 signature of the
> > -	 * DP_DUAL_MODE_ADAPTOR_ID register so we can proceed with
> > -	 * the type 2 adaptor detection safely even in the presence
> > -	 * of broken type 1 adaptors.
> > -	 */
> >  	ret = drm_dp_dual_mode_read(adapter, DP_DUAL_MODE_ADAPTOR_ID,
> >  				    &adaptor_id, sizeof(adaptor_id));
> >  	drm_dbg_kms(dev, "DP dual mode adaptor ID: %02x (err %zd)\n", adaptor_id, ret);
> > @@ -233,11 +243,10 @@ enum drm_dp_dual_mode_type drm_dp_dual_mode_detect(const struct drm_device *dev,
> >  				return DRM_DP_DUAL_MODE_TYPE2_DVI;
> >  		}
> >  		/*
> > -		 * If neither a proper type 1 ID nor a broken type 1 adaptor
> > -		 * as described above, assume type 1, but let the user know
> > -		 * that we may have misdetected the type.
> > +		 * If not a proper type 1 ID, still assume type 1, but let
> > +		 * the user know that we may have misdetected the type.
> >  		 */
> > -		if (!is_type1_adaptor(adaptor_id) && adaptor_id != hdmi_id[0])
> > +		if (!is_type1_adaptor(adaptor_id))
> >  			drm_err(dev, "Unexpected DP dual mode adaptor ID %02x\n", adaptor_id);
> >  
> >  	}
> > @@ -343,10 +352,8 @@ EXPORT_SYMBOL(drm_dp_dual_mode_get_tmds_output);
> >   * @enable: enable (as opposed to disable) the TMDS output buffers
> >   *
> >   * Set the state of the TMDS output buffers in the adaptor. For
> > - * type2 this is set via the DP_DUAL_MODE_TMDS_OEN register. As
> > - * some type 1 adaptors have problems with registers (see comments
> > - * in drm_dp_dual_mode_detect()) we avoid touching the register,
> > - * making this function a no-op on type 1 adaptors.
> > + * type2 this is set via the DP_DUAL_MODE_TMDS_OEN register.
> > + * Type1 adaptors do not support any register writes.
> >   *
> >   * Returns:
> >   * 0 on success, negative error code on failure
> > -- 
> > 2.35.1
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Ville Syrjälä
Intel
