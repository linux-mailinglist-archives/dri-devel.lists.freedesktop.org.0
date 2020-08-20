Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7D124C39B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 18:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1962A6E986;
	Thu, 20 Aug 2020 16:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB48B6E986
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 16:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597942190;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dW8r8JdJJ1XvxqUMvr8aT7H6lBrW72ZARyz6ehntw7M=;
 b=J3wBdHuaBOHtsBK/8FvGW4pl0eWpsFTMBjtyJh+dFFb7OnBmFgXAUb3ho0UsgqReyJq1mP
 GPbatcd45pTifUCEj2m35xxgzfmN11GUHJMvOstnskNPXRYKVohSGVdjnkV57aLN27Dunc
 LCzwGWL/hF8hFkxuHhCNgpRAtcUVH90=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-v195PM5rPd65oWDtFj8lyQ-1; Thu, 20 Aug 2020 12:49:44 -0400
X-MC-Unique: v195PM5rPd65oWDtFj8lyQ-1
Received: by mail-qt1-f199.google.com with SMTP id b18so1930035qte.18
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 09:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=dW8r8JdJJ1XvxqUMvr8aT7H6lBrW72ZARyz6ehntw7M=;
 b=IakJF3vcVWGHzTktvcH73vaLVJS5Fh9qL+JIMbTmyLZxEyNQUr8hkSEobmb6LZN4yy
 +cRq8q646fW0rIBSqvUJvxMy4zKjx0uLlHgt4LY8aQo6M56Z9g9g7m9Jm9AMdr7f97mp
 VhqHp/ww7eQYuSWk56RqdLqEPhCM/19JeAmy2qCOPS3gzeH4vIKTGRPlP4HIH+m7v05B
 fyf2YfVE4te4XipbWU65Ooe0BRpE/A0JfiUyjrYEUhsFConRdSZSA4sZ9LeWlS4lOu2P
 f3O73fLlPoOh5XRdgk7Hed7OqqXdEoNn5E3pOEJ8Co3bi9jHppT0P3KKTjHFaWZ6vYk6
 Bnqw==
X-Gm-Message-State: AOAM532MQXfWDxYfrBP3gFFITJDMaGV9/k4IF8AYXbv1ob4jYbjLf9Mq
 37PFF1sfGFDK9lWKoLy1Hs+K6PIolcbbR35xUNSVDUzCyr0Z1KJ0dIend2e9GTCypa4AegFSg9l
 MC5RLvEg0w0RAl2R3pI/GHkjbVQwJ
X-Received: by 2002:ac8:72cb:: with SMTP id o11mr3580676qtp.13.1597942184150; 
 Thu, 20 Aug 2020 09:49:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdJLNsMa2rhIfJlw/yMUDCjOhhaVf2QMxZHnbrsfhT2Zb3XRU8t0cqYl15X39VId9T64toFw==
X-Received: by 2002:ac8:72cb:: with SMTP id o11mr3580638qtp.13.1597942183827; 
 Thu, 20 Aug 2020 09:49:43 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id a20sm3549908qtw.45.2020.08.20.09.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 09:49:42 -0700 (PDT)
Message-ID: <501a431dce94fdaa086324ed6660b1188e1f3390.camel@redhat.com>
Subject: Re: [RFC 19/20] drm/i915/dp: Extract drm_dp_read_dpcd_caps()
From: Lyude Paul <lyude@redhat.com>
To: Sean Paul <sean@poorly.run>
Date: Thu, 20 Aug 2020 12:49:41 -0400
In-Reply-To: <20200819152914.GE46474@art_vandelay>
References: <20200811200457.134743-1-lyude@redhat.com>
 <20200811200457.134743-20-lyude@redhat.com>
 <20200819152914.GE46474@art_vandelay>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-08-19 at 11:29 -0400, Sean Paul wrote:
> On Tue, Aug 11, 2020 at 04:04:56PM -0400, Lyude Paul wrote:
> > Since DP 1.3, it's been possible for DP receivers to specify an
> > additional set of DPCD capabilities, which can take precedence over the
> > capabilities reported at DP_DPCD_REV.
> > 
> > Basically any device supporting DP is going to need to read these in an
> > identical manner, in particular nouveau, so let's go ahead and just move
> > this code out of i915 into a shared DRM DP helper that we can use in
> > other drivers.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > ---
> >  drivers/gpu/drm/drm_dp_helper.c             | 76 +++++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_dp.c     | 60 +---------------
> >  drivers/gpu/drm/i915/display/intel_dp.h     |  1 -
> >  drivers/gpu/drm/i915/display/intel_lspcon.c |  2 +-
> >  include/drm/drm_dp_helper.h                 |  3 +
> >  5 files changed, 82 insertions(+), 60 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_dp_helper.c
> > b/drivers/gpu/drm/drm_dp_helper.c
> > index 0ff2959c8f8e8..f9445915c6c26 100644
> > --- a/drivers/gpu/drm/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > @@ -423,6 +423,82 @@ bool drm_dp_send_real_edid_checksum(struct drm_dp_aux
> > *aux,
> >  }
> >  EXPORT_SYMBOL(drm_dp_send_real_edid_checksum);
> >  
> > +static int drm_dp_read_extended_dpcd_caps(struct drm_dp_aux *aux,
> > +					  u8 dpcd[DP_RECEIVER_CAP_SIZE])
> > +{
> > +	u8 dpcd_ext[6];
> > +	int ret;
> > +
> > +	/*
> > +	 * Prior to DP1.3 the bit represented by
> > +	 * DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT was reserved.
> > +	 * If it is set DP_DPCD_REV at 0000h could be at a value less than
> > +	 * the true capability of the panel. The only way to check is to
> > +	 * then compare 0000h and 2200h.
> > +	 */
> > +	if (!(dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> > +	      DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT))
> > +		return 0;
> > +
> > +	ret = drm_dp_dpcd_read(aux, DP_DP13_DPCD_REV, &dpcd_ext,
> > +			       sizeof(dpcd_ext));
> > +	if (ret != sizeof(dpcd_ext))
> > +		return -EIO;
> > +
> > +	if (dpcd[DP_DPCD_REV] > dpcd_ext[DP_DPCD_REV]) {
> > +		DRM_DEBUG_KMS("%s: Extended DPCD rev less than base DPCD rev (%d
> > > %d)\n",
> > +			      aux->name, dpcd[DP_DPCD_REV],
> > +			      dpcd_ext[DP_DPCD_REV]);
> 
> Might be a good opportunity to convert all of these to drm_dbg_dp()?
Oh also - thought about this as well, but this would be easier as a follow-up
patch since we'd want to add a backpointer to the original DRM device (not 100%
sure we can just determine the drm device parent from the aux device's parent)
> 
> > +		return 0;
> > +	}
> > +
> > +	if (!memcmp(dpcd, dpcd_ext, sizeof(dpcd_ext)))
> > +		return 0;
> > +
> > +	DRM_DEBUG_KMS("%s: Base DPCD: %*ph\n",
> > +		      aux->name, DP_RECEIVER_CAP_SIZE, dpcd);
> > +
> > +	memcpy(dpcd, dpcd_ext, sizeof(dpcd_ext));
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * drm_dp_read_dpcd_caps() - read DPCD caps and extended DPCD caps if
> > + * available
> > + * @aux: DisplayPort AUX channel
> > + * @dpcd: Buffer to store the resulting DPCD in
> > + *
> > + * Attempts to read the base DPCD caps for @aux. Additionally, this
> > function
> > + * checks for and reads the extended DPRX caps (%DP_DP13_DPCD_REV) if
> > + * present.
> > + *
> > + * Returns: %0 if the DPCD was read successfully, negative error code
> > + * otherwise.
> > + */
> > +int drm_dp_read_dpcd_caps(struct drm_dp_aux *aux,
> > +			  u8 dpcd[DP_RECEIVER_CAP_SIZE])
> > +{
> > +	int ret;
> > +
> > +	ret = drm_dp_dpcd_read(aux, DP_DPCD_REV, dpcd, DP_RECEIVER_CAP_SIZE);
> > +	if (ret != DP_RECEIVER_CAP_SIZE || dpcd[DP_DPCD_REV] == 0)
> > +		return -EIO;
> > +
> > +	ret = drm_dp_read_extended_dpcd_caps(aux, dpcd);
> > +	if (ret < 0)
> > +		return ret;
> 
> I wonder if we should just go with the "regular" dpcd caps we just read in
> this
> case?
> 
> Regardless of my nits,
> 
> Reviewed-by: Sean Paul <sean@poorly.run>
> 
> > +
> > +	DRM_DEBUG_KMS("%s: DPCD: %*ph\n",
> > +		      aux->name, DP_RECEIVER_CAP_SIZE, dpcd);
> > +
> > +	if (dpcd[DP_DPCD_REV] == 0)
> > +		ret = -EIO;
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL(drm_dp_read_dpcd_caps);
> > +
> >  /**
> >   * drm_dp_downstream_read_info() - read DPCD downstream port info if
> > available
> >   * @aux: DisplayPort AUX channel
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index e343965a483df..230aa0360dc61 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -4449,62 +4449,6 @@ intel_dp_link_down(struct intel_encoder *encoder,
> >  	}
> >  }
> >  
> > -static void
> > -intel_dp_extended_receiver_capabilities(struct intel_dp *intel_dp)
> > -{
> > -	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> > -	u8 dpcd_ext[6];
> > -
> > -	/*
> > -	 * Prior to DP1.3 the bit represented by
> > -	 * DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT was reserved.
> > -	 * if it is set DP_DPCD_REV at 0000h could be at a value less than
> > -	 * the true capability of the panel. The only way to check is to
> > -	 * then compare 0000h and 2200h.
> > -	 */
> > -	if (!(intel_dp->dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> > -	      DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT))
> > -		return;
> > -
> > -	if (drm_dp_dpcd_read(&intel_dp->aux, DP_DP13_DPCD_REV,
> > -			     &dpcd_ext, sizeof(dpcd_ext)) != sizeof(dpcd_ext)) {
> > -		drm_err(&i915->drm,
> > -			"DPCD failed read at extended capabilities\n");
> > -		return;
> > -	}
> > -
> > -	if (intel_dp->dpcd[DP_DPCD_REV] > dpcd_ext[DP_DPCD_REV]) {
> > -		drm_dbg_kms(&i915->drm,
> > -			    "DPCD extended DPCD rev less than base DPCD rev\n");
> > -		return;
> > -	}
> > -
> > -	if (!memcmp(intel_dp->dpcd, dpcd_ext, sizeof(dpcd_ext)))
> > -		return;
> > -
> > -	drm_dbg_kms(&i915->drm, "Base DPCD: %*ph\n",
> > -		    (int)sizeof(intel_dp->dpcd), intel_dp->dpcd);
> > -
> > -	memcpy(intel_dp->dpcd, dpcd_ext, sizeof(dpcd_ext));
> > -}
> > -
> > -bool
> > -intel_dp_read_dpcd(struct intel_dp *intel_dp)
> > -{
> > -	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> > -
> > -	if (drm_dp_dpcd_read(&intel_dp->aux, 0x000, intel_dp->dpcd,
> > -			     sizeof(intel_dp->dpcd)) < 0)
> > -		return false; /* aux transfer failed */
> > -
> > -	intel_dp_extended_receiver_capabilities(intel_dp);
> > -
> > -	drm_dbg_kms(&i915->drm, "DPCD: %*ph\n", (int)sizeof(intel_dp->dpcd),
> > -		    intel_dp->dpcd);
> > -
> > -	return intel_dp->dpcd[DP_DPCD_REV] != 0;
> > -}
> > -
> >  bool intel_dp_get_colorimetry_status(struct intel_dp *intel_dp)
> >  {
> >  	u8 dprx = 0;
> > @@ -4563,7 +4507,7 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
> >  	/* this function is meant to be called only once */
> >  	drm_WARN_ON(&dev_priv->drm, intel_dp->dpcd[DP_DPCD_REV] != 0);
> >  
> > -	if (!intel_dp_read_dpcd(intel_dp))
> > +	if (drm_dp_read_dpcd_caps(&intel_dp->aux, intel_dp->dpcd) != 0)
> >  		return false;
> >  
> >  	drm_dp_read_desc(&intel_dp->aux, &intel_dp->desc,
> > @@ -4650,7 +4594,7 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
> >  {
> >  	int ret;
> >  
> > -	if (!intel_dp_read_dpcd(intel_dp))
> > +	if (drm_dp_read_dpcd_caps(&intel_dp->aux, intel_dp->dpcd))
> >  		return false;
> >  
> >  	/*
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.h
> > b/drivers/gpu/drm/i915/display/intel_dp.h
> > index b901ab850cbd9..0a3af3410d52e 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.h
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> > @@ -99,7 +99,6 @@ bool intel_dp_source_supports_hbr3(struct intel_dp
> > *intel_dp);
> >  bool
> >  intel_dp_get_link_status(struct intel_dp *intel_dp, u8 *link_status);
> >  
> > -bool intel_dp_read_dpcd(struct intel_dp *intel_dp);
> >  bool intel_dp_get_colorimetry_status(struct intel_dp *intel_dp);
> >  int intel_dp_link_required(int pixel_clock, int bpp);
> >  int intel_dp_max_data_rate(int max_link_clock, int max_lanes);
> > diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c
> > b/drivers/gpu/drm/i915/display/intel_lspcon.c
> > index b781bf4696443..dc1b35559afdf 100644
> > --- a/drivers/gpu/drm/i915/display/intel_lspcon.c
> > +++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
> > @@ -571,7 +571,7 @@ bool lspcon_init(struct intel_digital_port *dig_port)
> >  		return false;
> >  	}
> >  
> > -	if (!intel_dp_read_dpcd(dp)) {
> > +	if (drm_dp_read_dpcd_caps(&dp->aux, dp->dpcd) != 0) {
> >  		DRM_ERROR("LSPCON DPCD read failed\n");
> >  		return false;
> >  	}
> > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> > index 0c141fc81aaa8..11649e93e5bb6 100644
> > --- a/include/drm/drm_dp_helper.h
> > +++ b/include/drm/drm_dp_helper.h
> > @@ -1607,6 +1607,9 @@ static inline ssize_t drm_dp_dpcd_writeb(struct
> > drm_dp_aux *aux,
> >  	return drm_dp_dpcd_write(aux, offset, &value, 1);
> >  }
> >  
> > +int drm_dp_read_dpcd_caps(struct drm_dp_aux *aux,
> > +			  u8 dpcd[DP_RECEIVER_CAP_SIZE]);
> > +
> >  int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
> >  				 u8 status[DP_LINK_STATUS_SIZE]);
> >  
> > -- 
> > 2.26.2
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
