Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FF95F752E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 10:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B9D10E34F;
	Fri,  7 Oct 2022 08:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A500B10E0F1
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 08:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665130788; x=1696666788;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rkSLcZPhXlS0302lxoz6waCtvtB0TActkp2Ml/8/uqE=;
 b=Fo1pTJjlilMtX56Puo0TrvaeEx1uO6GlAJyGIfE/BMTRDPtAPFpYiTKt
 B0imcTHbVoAxE7IjEhdZ0WbHC+DIadAd4IT/EIHhLMGwbhon3BwzFhKDK
 eToFwNshkOvbibexdhTsYjylOFyaMOZcTyqIK1W21poEUTl9FpDjHLJVB
 cUfkhOTthl6Dwm9vsC7AmQRH/Bh1G892AxZMl5Wq6VIRH0QW1QasONBrE
 4HMAqbBrdcvVV8s3n/qVuQDseV81OaUazfb9lpyIH8aHB68FQxEQEH3/J
 n5NFZkpxhOJGwJFbc9O0xKLGb6SAYF5htzZ2mNbOG8c1c3TTgwIB9pJWa w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="304681534"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; d="scan'208";a="304681534"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2022 01:19:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="693709683"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; d="scan'208";a="693709683"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga004.fm.intel.com with SMTP; 07 Oct 2022 01:19:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Oct 2022 11:19:45 +0300
Date: Fri, 7 Oct 2022 11:19:45 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: drm fb helpers hotplug/resize
Message-ID: <Yz/hIZaKJhtznFnc@intel.com>
References: <9884c2f0daeccbaeaa9995bd8bdb25b98838b980.camel@vmware.com>
 <8fc0e4de-2448-1d04-d1b0-16f87498fe98@suse.de>
 <a3f7176eb7ae321f939d906adb1873cef7fe01ce.camel@vmware.com>
 <156b7bad-810b-80ce-3f79-bca10641d1a1@suse.de>
 <Yz/SLn6jnUsTAw6y@intel.com>
 <3e761cd0-7527-871e-5d53-1af223418fac@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e761cd0-7527-871e-5d53-1af223418fac@suse.de>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 07, 2022 at 09:58:31AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 07.10.22 um 09:15 schrieb Ville Syrjälä:
> 
> >>
> >> For the absolute size of fbdev memory, I think we should introduce a
> >> module parameter in drm_fb_helper, which an option to set a default
> >> value in the kernel config. It would benefit all drivers that use fbdev
> >> emulation and work how overalloc works.
> >>
> >> If no size is given, the current approach would be used.
> >>
> >> I don't think resizing would work immediately. There isn't anything in
> >> the check_var and set_par functions that implements the necessary atomic
> >> check and commit.
> > 
> > set_par() is the thing tht does the commit.
> > 
> 
> I know. There actually even is a commit statement in set_par, which can 
> restore the initial mode. My point is that it has no means of changing 
> the display mode. A full modeset would require us to convert the fb 
> screeninfo into an atomic state and commit that instead. For the fbconv 
> helper, I once made code to convert between the two. Leaving this here 
> for reference. [1][2]

Uff. Right, we'd probably just want to properly implemnt set_par()
then. 

BTW I had a slightly different take on the bitfiled stuff.
Maybe a bit easier to extend for new formats, but full of macros:
https://patchwork.freedesktop.org/patch/203189/?series=37820&rev=1

> 
> Similarly, in check_var we sort out and reject all mode changes. We'd 
> have to change that as well.

I guess we could do a TEST_ONLY commit there. Though I think
not doing that and just failing from set_par() should be fine
too.

> 
> I guess we can continue to ignore non-atomic modesetting.
> 
> Best regards
> Thomas
> 
> [1] 
> https://gitlab.freedesktop.org/tzimmermann/linux/-/commit/385161cd2d048b5cf80544bff8ced3da7a82dfa9
> [2] 
> https://gitlab.freedesktop.org/tzimmermann/linux/-/commit/a541c405a638f47ee80389b222fbde6e311e8220
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev




-- 
Ville Syrjälä
Intel
