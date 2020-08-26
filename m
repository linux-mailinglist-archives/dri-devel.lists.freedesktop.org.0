Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF482535CE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 19:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A2E89EAC;
	Wed, 26 Aug 2020 17:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B9A89EAC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 17:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598461976;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HNxk+EQ8wQ8tVIGqRrZql9fbdwG5Cj1VEgrvd+qiq60=;
 b=Wc5fZDZp7jdCf/2ZLfB7hAsiqL761hpHzJsyIOQqTFsmdQMT9wUrXNWHnkEG5c8/3yXue1
 P0JRciT3f6Yr1+xgXZd499mPdjH4d+5/mY9XnZoaJSOrh3WG1JkZwR1L91lYQ9g4BRwCng
 AoCvEbOqUBNHg8PzYVM8S00faXrSg4E=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-1ofoZ-XMOC-8S2aKQUMyDQ-1; Wed, 26 Aug 2020 13:12:55 -0400
X-MC-Unique: 1ofoZ-XMOC-8S2aKQUMyDQ-1
Received: by mail-qt1-f198.google.com with SMTP id p22so2261664qtp.9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 10:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=HNxk+EQ8wQ8tVIGqRrZql9fbdwG5Cj1VEgrvd+qiq60=;
 b=MsLbCj1Q8ovZtYwGRfBRDNK7jixQIpVq2XHcNFavuRiADxAKun1EYK/1xi5Fn1u5o8
 WgZ44MxIlkZRU6N0/UeTDWiGalitgo2rkJ22bioOzZ39ph48tvr61HGqMr3TMK8rN7oS
 IgOe3H32l4DSUuF1aC+7gJltfJGLpyuKfW/9P14dMy6SdkvWMfY2SMiXS0PdLrcE5Ima
 hfAHExOFXytMZbS6hEDsE3G7YkoPuTePi7NltUUR/oJsCDNDhf2hkKIkRK3NzkWS9q+T
 WHUv4XeUBADPpB0AT2+9sd0szwloGNXQ5z4lWUy3fDEjH+4x0kD+kW8xgIRAva7Vt/oa
 cvsQ==
X-Gm-Message-State: AOAM531dTBZH6bmShy0l28KM9zhBWhzUGPITLez4iGAkqCsbHzx3oM/L
 dtg7VPYPCt2DX4oUMd0UNhw2RNoofKbI5D5pdQOxMEifJE0bXT4x/Pm5SOxgRERRnCvE+vZbTVY
 JWR7DKR5z0oF7Pgt2Ww/JzM40zSjK
X-Received: by 2002:ac8:458a:: with SMTP id l10mr14982586qtn.345.1598461974855; 
 Wed, 26 Aug 2020 10:12:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPN0gfqk25wNBQ7pctyKxl91Z5N9+T1TGM7wzP+o65H/927i5DVjZXXu0XPikzyIsh50ev/w==
X-Received: by 2002:ac8:458a:: with SMTP id l10mr14982565qtn.345.1598461974593; 
 Wed, 26 Aug 2020 10:12:54 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id r73sm2063390qka.76.2020.08.26.10.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 10:12:54 -0700 (PDT)
Message-ID: <0b9fe80d058320b4e8e4fdf51a5445eddb1b0467.camel@redhat.com>
Subject: Re: [RFC v4 16/20] drm/i915/dp: Extract drm_dp_get_sink_count()
From: Lyude Paul <lyude@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
Date: Wed, 26 Aug 2020 13:12:52 -0400
In-Reply-To: <87o8mx6g6a.fsf@intel.com>
References: <20200825195027.74681-1-lyude@redhat.com>
 <20200825195027.74681-17-lyude@redhat.com> <87o8mx6g6a.fsf@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-08-26 at 10:05 +0300, Jani Nikula wrote:
> On Tue, 25 Aug 2020, Lyude Paul <lyude@redhat.com> wrote:
> > And of course, we'll also need to read the sink count from other drivers
> > as well if we're checking whether or not it's supported. So, let's
> > extract the code for this into another helper.
> > 
> > v2:
> > * Fix drm_dp_dpcd_readb() ret check
> > * Add back comment and move back sink_count assignment in
> > intel_dp_get_dpcd()
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Reviewed-by: Sean Paul <sean@poorly.run>
> > ---
> >  drivers/gpu/drm/drm_dp_helper.c         | 22 ++++++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_dp.c | 11 +++++------
> >  include/drm/drm_dp_helper.h             |  1 +
> >  3 files changed, 28 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_dp_helper.c
> > b/drivers/gpu/drm/drm_dp_helper.c
> > index 863e0babc1903..67ad05eb05b7e 100644
> > --- a/drivers/gpu/drm/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > @@ -736,6 +736,28 @@ bool drm_dp_has_sink_count(struct drm_connector
> > *connector,
> >  }
> >  EXPORT_SYMBOL(drm_dp_has_sink_count);
> >  
> > +/**
> > + * drm_dp_get_sink_count() - Retrieve the sink count for a given sink
> 
> From the department of bikeshedding...
> 
> Should we have a naming scheme where it's obvious whether a function
> will do DPCD access, or just shuffle existing data?
> 
> For example, drm_dp_read_foo() for anything with DPCD access
> vs. drm_dp_get_foo() or even simpler for anything that only processes
> pre-read data?

Forgot to address this comment - yeah, I think that would be a good idea. I'll
go through my previous patches and make sure that they match this naming scheme
as well.
> 
> > + * @aux: The DP AUX channel to use
> > + *
> > + * Returns: The current sink count reported by @aux, or a negative error
> > code
> > + * otherwise.
> > + */
> > +int drm_dp_get_sink_count(struct drm_dp_aux *aux)
> > +{
> > +	u8 count;
> > +	int ret;
> > +
> > +	ret = drm_dp_dpcd_readb(aux, DP_SINK_COUNT, &count);
> > +	if (ret < 0)
> > +		return ret;
> > +	if (ret != 1)
> > +		return -EIO;
> 
> Makes me wonder if that shouldn't be at drm_dp_dpcd_read() level, for
> reads returning 0..len-1 bytes. Not necessarily part of this series, but
> seems silly to set a precedent to start handling that return value all
> over the place.
> 
> BR,
> Jani.
> 
> > +
> > +	return DP_GET_SINK_COUNT(count);
> > +}
> > +EXPORT_SYMBOL(drm_dp_get_sink_count);
> > +
> >  /*
> >   * I2C-over-AUX implementation
> >   */
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 35a4779a442e2..4337321a3be4f 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -4648,6 +4648,8 @@ intel_dp_has_sink_count(struct intel_dp *intel_dp)
> >  static bool
> >  intel_dp_get_dpcd(struct intel_dp *intel_dp)
> >  {
> > +	int ret;
> > +
> >  	if (!intel_dp_read_dpcd(intel_dp))
> >  		return false;
> >  
> > @@ -4664,11 +4666,8 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
> >  	}
> >  
> >  	if (intel_dp_has_sink_count(intel_dp)) {
> > -		u8 count;
> > -		ssize_t r;
> > -
> > -		r = drm_dp_dpcd_readb(&intel_dp->aux, DP_SINK_COUNT, &count);
> > -		if (r < 1)
> > +		ret = drm_dp_get_sink_count(&intel_dp->aux);
> > +		if (ret < 0)
> >  			return false;
> >  
> >  		/*
> > @@ -4676,7 +4675,7 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
> >  		 * a member variable in intel_dp will track any changes
> >  		 * between short pulse interrupts.
> >  		 */
> > -		intel_dp->sink_count = DP_GET_SINK_COUNT(count);
> > +		intel_dp->sink_count = ret;
> >  
> >  		/*
> >  		 * SINK_COUNT == 0 and DOWNSTREAM_PORT_PRESENT == 1 implies that
> > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> > index a1413a531eaf4..0c141fc81aaa8 100644
> > --- a/include/drm/drm_dp_helper.h
> > +++ b/include/drm/drm_dp_helper.h
> > @@ -1635,6 +1635,7 @@ struct drm_dp_desc;
> >  bool drm_dp_has_sink_count(struct drm_connector *connector,
> >  			   const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> >  			   const struct drm_dp_desc *desc);
> > +int drm_dp_get_sink_count(struct drm_dp_aux *aux);
> >  
> >  void drm_dp_remote_aux_init(struct drm_dp_aux *aux);
> >  void drm_dp_aux_init(struct drm_dp_aux *aux);
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
