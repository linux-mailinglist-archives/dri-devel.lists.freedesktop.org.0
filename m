Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CFCCA2E53
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 10:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369BB10E8FB;
	Thu,  4 Dec 2025 09:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hPMDm4W3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5452210E831
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 02:29:42 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7b9387df58cso631535b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 18:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764815382; x=1765420182; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=nbfVTq9KBWsmp1ChHIp5kh8RBkVe/heJoRGFGHla1nE=;
 b=hPMDm4W3E7BId8Vt0lOcF3xi6I+TfEvw3T/JpsmV4UZRufpOghmxlUEOhW+yLWiCHn
 +T+AQw4V3yQY4MaD/w1pVKANREPWw1du41crTaHKC0Fqrp96vO9lxAzHqO2bj5pH7rJn
 bu70KOhn44Jh1YuPMpiP/hM7MjhdfsWfB5Y0HYt+2sGuawlBvGWv76E6rxsdx3PMDk1q
 /mzSHtXgCz53RGG3eTegQ3+Jpf9aYfi4CU4wrnatu1ojdFUk7VUbRcQBu/xUgjL1LEDy
 SnNpWNhAykHWLrMRUB5VXqMhEkRtcFEJNCTRY4t47gH79hMl4H8tEzzTi41KBk6SlzqC
 nTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764815382; x=1765420182;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nbfVTq9KBWsmp1ChHIp5kh8RBkVe/heJoRGFGHla1nE=;
 b=BsomRLlirzNEqpcIgQzciOmTCNSdHBY3oJy4f81/gh7/eYWXGuuMS9cOKE8878pKNH
 nUXQ5URukufR0xrZSliji13CkxumA2D85uwkrWIBTA9NF8DmQnwqkFloizhaLIjdUJs9
 qSvagqA/5/x0fBluSFyYdK5a/34FUam20SXBCABpJod+VHv2mmcxAOAtqf3XB+DuAxo+
 w4HxoWou5phyK+Xgvhz+vx+TR1mZmjUS/Teu6UX6Kusb+gxHCXWW+BrkyJ7hSE0vlO+4
 L6oj22Yekk/OxWSHPHxW/eNBsJSeInU2FnLw9QcNyT3xSSsbKsmCgubyFRMU1Rq/SwCh
 1+QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCwIiqHYS1l5A2ogD3UdpKRzzYqrmzqoYSpWJsmpL/lDz5+ZrCwVIQROpQKCpZxXY8mhFdOpNXkBk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/BKmkkYvtwcRPreaAh752lUk9m6ZTEAcIcsjC3CyucO6d/2Nf
 tUVMcnT1Jvw4b+KqiZuqx9qdph3Y1n5RUtKetvPGJBCq0R0KEYfDJLVn
X-Gm-Gg: ASbGnctuKy1JNh2sFXwksb3MtCj5/PRggZheClk/ixDMc/y80wDDsJAs0ZhDSei59xq
 A5UtEPk5BQkgI7ngYaRK+xMBIm2LjYM7IoBXBUEe/N4ZfqOHp4v3OCKwiYgfWpkgYtsEsbqvOl9
 tePOWBMleu5jpnqI8k3rA8T+TzDiBNBSijd2zwiXLnYZd4S1F2QYOp7kG+E3wxp7STHQOg4nvEw
 JjSCUqMrYjm3pbynjw1bKahO7xFz4tA8XjwTj4c+2rT6OWgF+pUxu7uXgX1sFKh4IoBBjX5PTYz
 21AzlmJkprx6cWUSfrFkWhva9ToAdDPi5mbmEZlKOYe2TJVAVr3hdVJu7JQyyZ5gs8im31VbFG/
 x68BBiXb3WT5uVP5nayYG+AOdEO/xtd7YokkhoHRp73w1JI18ZNtHzmSEmOOFX4cVrLM/sGIsuM
 Blyhco40LlXXr/QdH02F/iXyV8KIriGzU+M60i3+keekUzpcEQlgg=
X-Google-Smtp-Source: AGHT+IFCeBy2y/CfEswHeFQ8PNewc7BH40l5HKVg8Zae9UGj70Zf3r7S53EITpLfFSzUJLeHLUcr5A==
X-Received: by 2002:a05:6a20:244d:b0:35d:8881:e6bb with SMTP id
 adf61e73a8af0-36403797f3cmr1771400637.22.1764815381665; 
 Wed, 03 Dec 2025 18:29:41 -0800 (PST)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7e2adc5bf17sm314210b3a.38.2025.12.03.18.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 18:29:40 -0800 (PST)
Date: Thu, 4 Dec 2025 10:29:37 +0800
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/dp: Add byte-by-byte fallback for broken USB-C
 adapters
Message-ID: <7klzod4x5e2mpz4bwdfoyvien4whsp7r2mvykvbuhfczczp3f4@iuszbs4p7yag>
Mail-Followup-To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251127044406.618543-1-acelan.kao@canonical.com>
 <aSjFZhZQLVb7czsh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aSjFZhZQLVb7czsh@intel.com>
X-Mailman-Approved-At: Thu, 04 Dec 2025 09:04:28 +0000
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

On Thu, Nov 27, 2025 at 11:40:54PM +0200, Ville Syrjälä wrote:
> On Thu, Nov 27, 2025 at 12:44:06PM +0800, Chia-Lin Kao (AceLan) wrote:
> > Some USB-C hubs and adapters have buggy firmware where multi-byte AUX
> > reads from DPCD address 0x00000 consistently timeout, while single-byte
> > reads from the same address work correctly.
> > 
> > Known affected devices that exhibit this issue:
> > - Lenovo USB-C to VGA adapter (VIA VL817 chipset)
> >   idVendor=17ef, idProduct=7217
> > - Dell DA310 USB-C mobile adapter hub
> >   idVendor=413c, idProduct=c010
> > 
> > Analysis of the failure pattern shows:
> > - Single-byte probes to 0xf0000 (LTTPR) succeed
> > - Single-byte probes to 0x00102 (TRAINING_AUX_RD_INTERVAL) succeed
> > - 15-byte reads from 0x00000 (DPCD capabilities) timeout with -ETIMEDOUT
> > - Retrying does not help - the failure is consistent across all attempts
> 
> I thought we changed that to the more sensible 16 bytes.
> Anyone know what happened to that patch?
> 
> Anyways, does 16 bytes work better than 15 bytes?
Change DP_RECEIVER_CAP_SIZE from 15 to 16 and it doesn't help.
I can see it tried to read 16 bytes but it still timed out.

> 
> > 
> > The issue appears to be a firmware bug in the AUX transaction handling
> > that specifically affects multi-byte reads from the base DPCD address.
> > 
> > Add a fallback mechanism that attempts byte-by-byte reading when the
> > normal multi-byte drm_dp_read_dpcd_caps() fails. This workaround only
> > activates for adapters that fail the standard read path, ensuring no
> > impact on correctly functioning hardware.
> > 
> > The byte-by-byte read uses drm_dp_dpcd_readb() to read each of the 15
> > DPCD capability bytes individually, working around the firmware bug
> > while maintaining compatibility with all other adapters.
> > 
> > Tested with:
> > - Lenovo USB-C to VGA adapter (VIA VL817) - now works with fallback
> > - Dell DA310 USB-C hub - now works with fallback
> > - Dell/Analogix Slimport adapter - continues to work with normal path
> > 
> > Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> > ---
> >  .../drm/i915/display/intel_dp_link_training.c | 21 ++++++++++++++++++-
> >  1 file changed, 20 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > index aad5fe14962f..738a5bb4adb3 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > @@ -213,6 +213,7 @@ static int intel_dp_init_lttpr(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEI
> >  int intel_dp_read_dprx_caps(struct intel_dp *intel_dp, u8 dpcd[DP_RECEIVER_CAP_SIZE])
> >  {
> >  	struct intel_display *display = to_intel_display(intel_dp);
> > +	int ret, i;
> >  
> >  	if (intel_dp_is_edp(intel_dp))
> >  		return 0;
> > @@ -226,7 +227,25 @@ int intel_dp_read_dprx_caps(struct intel_dp *intel_dp, u8 dpcd[DP_RECEIVER_CAP_S
> >  				      DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV))
> >  			return -EIO;
> >  
> > -	if (drm_dp_read_dpcd_caps(&intel_dp->aux, dpcd))
> > +	ret = drm_dp_read_dpcd_caps(&intel_dp->aux, dpcd);
> > +	if (ret == 0)
> > +		return 0;
> > +
> > +	/*
> > +	 * Workaround for USB-C hubs/adapters with buggy firmware that fail
> > +	 * multi-byte AUX reads from DPCD address 0x00000 but work with
> > +	 * single-byte reads. Known affected devices:
> > +	 * - Lenovo USB-C to VGA adapter (VIA VL817, idVendor=17ef, idProduct=7217)
> > +	 * - Dell DA310 USB-C hub (idVendor=413c, idProduct=c010)
> > +	 * Read the DPCD capabilities byte-by-byte as a fallback.
> > +	 */
> > +	for (i = 0; i < DP_RECEIVER_CAP_SIZE; i++) {
> > +		ret = drm_dp_dpcd_readb(&intel_dp->aux, DP_DPCD_REV + i, &dpcd[i]);
> > +		if (ret < 0)
> > +			return -EIO;
> > +	}
> 
> Doing this in i915 specific code doesn't make sense.
Right, I'll move the workaround to the drm driver, and submit v2.

> 
> > +
> > +	if (dpcd[DP_DPCD_REV] == 0)
> >  		return -EIO;
> >  
> >  	return 0;
> > -- 
> > 2.43.0
> 
> -- 
> Ville Syrjälä
> Intel
