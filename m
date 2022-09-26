Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7314C5EA959
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 16:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBA010E40A;
	Mon, 26 Sep 2022 14:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C18410E40A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 14:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664204272; x=1695740272;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FXodbCaIV1FYYufg5eF01DSXoGdBrIhcx9rpUf81Xnw=;
 b=k5itNIyldm6fcJvpCd2oc6KexmqsvcBVABF6JUIfWe0tloGgvknVaqkU
 aGGbmn12pWqrX8r6+PDErdWx0rQJs0ev8rIk/Su6JYFjmIsb/vJRCyi/H
 mGdV770mhlAZj/lTzShCYa7AW2ZIvrj6MlkYxlx2AMj75Jt02OWFdQykn
 UMDmvpEain93jC9g0zlIyoGO2iU3tcT4kgR3u+MvnfxKAbSPZ3jS8PaAf
 nVXuQGmETSqoTjDziwI/iTjBZY927MhP8tV7RvZAF3GbIredBBa8Zg8RD
 BF4afHs6MExFwJdpznai3WGbb9puzfKpzmFutBicm5Zh3CVqdmzUXkdc/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="299771799"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="299771799"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 07:57:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="796360273"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="796360273"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga005.jf.intel.com with SMTP; 26 Sep 2022 07:57:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 26 Sep 2022 17:57:47 +0300
Date: Mon, 26 Sep 2022 17:57:47 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Rettberg <simon.rettberg@rz.uni-freiburg.de>
Subject: Re: [PATCH RESEND] drm/display: Don't assume dual mode adaptors
 support i2c sub-addressing
Message-ID: <YzG969k/ipFwAKWA@intel.com>
References: <20220926124017.529806df@computer> <YzGdU50ttykco1QV@intel.com>
 <20220926163408.110bbc97@computer>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220926163408.110bbc97@computer>
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
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 26, 2022 at 04:34:08PM +0200, Simon Rettberg wrote:
> On Mon, 26 Sep 2022 15:38:43 +0300
>  Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > On Mon, Sep 26, 2022 at 12:40:17PM +0200, Simon Rettberg wrote:
> > > Current dual mode adaptor ("DP++") detection code assumes that all
> > > adaptors support i2c sub-addressing for read operations from the
> > > DP-HDMI adaptor ID buffer.  It has been observed that multiple
> > > adaptors do not in fact support this, and always return data
> > > starting at register 0.  On affected adaptors, the code failed to
> > > read the proper registers that would identify the device as a type
> > > 2 adaptor, and handled those as type 1, limiting the TMDS clock to
> > > 165MHz. Fix this by always reading the ID buffer starting from
> > > offset 0, and discarding any bytes before the actual offset of
> > > interest.
> > > 
> > > Signed-off-by: Simon Rettberg <simon.rettberg@rz.uni-freiburg.de>
> > > Reviewed-by: Rafael Gieschke <rafael.gieschke@rz.uni-freiburg.de>
> > > ---
> > > (Resend because of no response, probably my fault since I ran
> > > get_maintainers on a shallow clone and missed a bunch of people)
> > > 
> > > We had problems with multiple different "4k ready" DP++ adaptors
> > > only resulting in 1080p resolution on Linux. While one of them
> > > turned out to actually just be a type1 adaptor, the others,
> > > according to the data retreived via i2cdump, were in fact proper
> > > type2 adaptors, advertising a TMDS clock of 300MHz. As it turned
> > > out, none of them supported sub-addressing when reading from the
> > > DP-HDMI adaptor ID buffer via i2c. The existing code suggested that
> > > this is known to happen with "broken" type1 adaptors, but
> > > evidently, type2 adaptors are also affected. We tried finding
> > > authoritative documentation on whether or not this is allowed
> > > behavior, but since all the official VESA docs are paywalled, the
> > > best we could come up with was the spec sheet for Texas
> > > Instruments' SNx5DP149 chip family.[1] It explicitly mentions that
> > > sub-adressing is supported for register writes, but *not* for reads
> > > (See NOTE in section 8.5.3). Unless TI blatantly and openly decided
> > > to violate the VESA spec, one could take that as a strong hint that
> > > sub-addressing is in fact not mandated by VESA.  
> > 
> > I don't think that would pass the dual mode CTS for type2 adaptors
> > since it explicitly calls for reading individual bytes from various
> > offsets.
> > 
> > The actual dual mode spec specifies things rather poorly. Technically
> > it doesn't even specify the write protocol, and the read protocol is
> > only specified in the form of an example read of the HDMI ID buffer.
> > There it says the offset write is optional for the master, but
> > mandatory for the slave to ack. It neither explicitly allows nor
> > disallows the ack+ignore behaviour, but IIRC there is some
> > text in there that suggests that type1 adaptors might ignore it.
> 
> Interesting, but poor spec would explain why it's not implemented by
> at least three such chips. That's the TI one (we don't actually have
> it, but the data sheet above seems quite clear), and the two we
> confirmed it with: the PS8409(A), and the LT8611.
> So either way it might make sense to handle this. Since the first
> submission of this patch I also took the time to check it on
> Windows 10, and both adaptors make Windows list 4k resolutions with
> both the intel iGPU and an nvidia card.
> 
> Here are the two dumps for completeness:
> 
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
> 00: 44 50 2d 48 44 4d 49 20 41 44 41 50 54 4f 52 04    DP-HDMI ADAPTOR?
> 10: a0 00 1c f8 50 53 38 34 30 39 a2 00 00 78 08 ff    ?.??PS8409?..x?.
> 
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
> 00: 44 50 2d 48 44 4d 49 20 41 44 41 50 54 4f 52 04    DP-HDMI ADAPTOR?
> 10: a0 ff ff ff 4c 54 38 36 31 31 a2 00 00 78 0f 00    ?...LT8611?..x?.
> 
> > 
> > > 
> > > [1] https://www.ti.com/lit/ds/symlink/sn75dp149.pdf
> > > 
> > >  .../gpu/drm/display/drm_dp_dual_mode_helper.c | 52
> > > ++++++++++--------- 1 file changed, 28 insertions(+), 24
> > > deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> > > b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c index
> > > 3ea53bb67..6147da983 100644 ---
> > > a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c +++
> > > b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c @@ -63,23
> > > +63,42 @@ ssize_t drm_dp_dual_mode_read(struct i2c_adapter *adapter,
> > >  			      u8 offset, void *buffer, size_t size)
> > >  {
> > > +	int ret;
> > > +	u8 zero = 0;
> > > +	char *tmpbuf;
> > > +	/*
> > > +	 * As sub-addressing is not supported by all adaptors,
> > > +	 * always explicitly read from the start and discard
> > > +	 * any bytes that come before the requested offset.
> > > +	 * This way, no matter whether the adaptor supports it
> > > +	 * or not, we'll end up reading the proper data.
> > > +	 */
> > >  	struct i2c_msg msgs[] = {
> > >  		{
> > >  			.addr = DP_DUAL_MODE_SLAVE_ADDRESS,
> > >  			.flags = 0,
> > >  			.len = 1,
> > > -			.buf = &offset,
> > > +			.buf = &zero,
> > >  		},
> > >  		{
> > >  			.addr = DP_DUAL_MODE_SLAVE_ADDRESS,
> > >  			.flags = I2C_M_RD,
> > > -			.len = size,
> > > -			.buf = buffer,
> > > +			.len = size + offset,
> > > +			.buf = NULL,
> > >  		},
> > >  	};
> > > -	int ret;
> > >  
> > > +	tmpbuf = kmalloc(size + offset, GFP_KERNEL);
> > > +	if (!tmpbuf)
> > > +		return -ENOMEM;
> > > +
> > > +	msgs[1].buf = tmpbuf;
> > >  	ret = i2c_transfer(adapter, msgs, ARRAY_SIZE(msgs));
> > > +	if (ret == ARRAY_SIZE(msgs))
> > > +		memcpy(buffer, tmpbuf + offset, size);
> > > +
> > > +	kfree(tmpbuf);  
> > 
> > Could optimize a bit here and avoid the temp buffer when
> > the original offset is 0.
> 
> Was thinking about that too while writing the patch, but decided
> to keep it as straight forward as possible for the initial submission;
> it's also not really performance critical, should be called a few
> times when the adaptor is plugged in, and probably just once with
> offset 0.

Would avoid the extra failure point.

Looks like all you really need to do is make the tmpbuf 
allocation (+ msg mangling) conditional, and check that
tmpbuf was allocated before calling memcpy().

> It also didn't feel nice to have the "if (ret == ARRAY_SIZE(msgs))"
> check duplicated for the memcpy, to avoid copying potentially
> uninitialised memory into the output buffer. I didn't see how this
> would lead to an information leak to user space with the current
> code base, but better safe than sorry? :)
> The alternative is to move the memcpy down and merge it with the
> other if-block, but then we'd need a cleanup label at the bottom
> to do the kfree in the error case that comes before that...

kfree(NULL) is perfectly legal.

> But I'll happily refine that further and submit a v2 if desired.
> 
> > 
> > > +
> > >  	if (ret < 0)
> > >  		return ret;
> > >  	if (ret != ARRAY_SIZE(msgs))
> > > @@ -208,18 +227,6 @@ enum drm_dp_dual_mode_type
> > > drm_dp_dual_mode_detect(const struct drm_device *dev, if (ret)
> > >  		return DRM_DP_DUAL_MODE_UNKNOWN;
> > >  
> > > -	/*
> > > -	 * Sigh. Some (maybe all?) type 1 adaptors are broken and
> > > ack
> > > -	 * the offset but ignore it, and instead they just always
> > > return
> > > -	 * data from the start of the HDMI ID buffer. So for a
> > > broken
> > > -	 * type 1 HDMI adaptor a single byte read will always give
> > > us
> > > -	 * 0x44, and for a type 1 DVI adaptor it should give 0x00
> > > -	 * (assuming it implements any registers). Fortunately
> > > neither
> > > -	 * of those values will match the type 2 signature of the
> > > -	 * DP_DUAL_MODE_ADAPTOR_ID register so we can proceed with
> > > -	 * the type 2 adaptor detection safely even in the presence
> > > -	 * of broken type 1 adaptors.
> > > -	 */
> > >  	ret = drm_dp_dual_mode_read(adapter,
> > > DP_DUAL_MODE_ADAPTOR_ID, &adaptor_id, sizeof(adaptor_id));  
> > 
> > Another optimization opportunity here to maybe combine the HDMI ID
> > buffer read with this one. Could perhaps just read the full 32 bytes
> > static capabilities section. But this one should probably be left for
> > a separate patch. Ideally I guess we'd also combine the max TMDS clock
> > read with this one. But for that we'd need to return more than the
> > single enum drm_dp_dual_mode_type from this function.
> 
> Pretty much same as above, keep v1 simple, but I noticed that too.
> If that's going to be another patch anyways, it might make sense
> if that's done by someone more familiar with that code in general
> (basically had to research all this DP++/i2c stuff from scratch).
> But I could give it a spin.

I think this one will need a bit more restructuing so better
done as a separate patch. Might not really be worth the hassle
unless we go all in and try to do just a single 32byte read
for everything including the max TMDS clock.

> 
> > 
> > >  	drm_dbg_kms(dev, "DP dual mode adaptor ID: %02x (err
> > > %zd)\n", adaptor_id, ret); @@ -233,11 +240,10 @@ enum
> > > drm_dp_dual_mode_type drm_dp_dual_mode_detect(const struct
> > > drm_device *dev, return DRM_DP_DUAL_MODE_TYPE2_DVI; }
> > >  		/*
> > > -		 * If neither a proper type 1 ID nor a broken type
> > > 1 adaptor
> > > -		 * as described above, assume type 1, but let the
> > > user know
> > > -		 * that we may have misdetected the type.
> > > +		 * If not a proper type 1 ID, still assume type 1,
> > > but let
> > > +		 * the user know that we may have misdetected the
> > > type. */
> > > -		if (!is_type1_adaptor(adaptor_id) && adaptor_id !=
> > > hdmi_id[0])
> > > +		if (!is_type1_adaptor(adaptor_id))
> > >  			drm_err(dev, "Unexpected DP dual mode
> > > adaptor ID %02x\n", adaptor_id); 
> > >  	}
> > > @@ -343,10 +349,8 @@
> > > EXPORT_SYMBOL(drm_dp_dual_mode_get_tmds_output);
> > >   * @enable: enable (as opposed to disable) the TMDS output buffers
> > >   *
> > >   * Set the state of the TMDS output buffers in the adaptor. For
> > > - * type2 this is set via the DP_DUAL_MODE_TMDS_OEN register. As
> > > - * some type 1 adaptors have problems with registers (see comments
> > > - * in drm_dp_dual_mode_detect()) we avoid touching the register,
> > > - * making this function a no-op on type 1 adaptors.
> > > + * type2 this is set via the DP_DUAL_MODE_TMDS_OEN register.
> > > + * Type1 adaptors do not support any register writes.
> > >   *
> > >   * Returns:
> > >   * 0 on success, negative error code on failure
> > > -- 
> > > 2.35.1  
> > 

-- 
Ville Syrjälä
Intel
