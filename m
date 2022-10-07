Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7A65F74B6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 09:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B4888867;
	Fri,  7 Oct 2022 07:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C7D10E0F7
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 07:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665127787; x=1696663787;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HQo4mxWAplwlyNU3T99USoS8KvAepJqACI+3srl6Io4=;
 b=kPAbY20S4+WeGW9zBLS3J3owCJNN4q+AoBTDlzkQhwr8APFgz1y9c36p
 oCoI9bcajQhGmkAN/c8waZCH7ss8KRsHLqELexIggnoEFZK/Mg+KdbaVN
 l9E6XssDb+eXJGy7TzAfRtdCIpUWakL46ERnByEdWBDzii/uIkTND1Bzk
 T4awLuov4M7xYdHVno1zTGV20E02HXAaOvfBfLi1dB7xXVpVkf+guLWSg
 yfl8kdrbOBMrej3NX59Vz5EzHqIj59xDTksVDlQKDqXz7xElxBiktpZ0R
 Kgyc469cq/JJdTrIR6LT+0027abuXwyDULBkzR57NX+kfw0oP0ZAmEQgH g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="304672397"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; d="scan'208";a="304672397"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2022 00:29:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="767474416"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; d="scan'208";a="767474416"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga001.fm.intel.com with SMTP; 07 Oct 2022 00:29:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Oct 2022 10:29:42 +0300
Date: Fri, 7 Oct 2022 10:29:42 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 2/2] drm/atomic-helper: Replace
 drm_atomic_helper_check_crtc_state()
Message-ID: <Yz/VZqQN33gvk1Ab@intel.com>
References: <20221005114002.3715-1-tzimmermann@suse.de>
 <20221005114002.3715-3-tzimmermann@suse.de>
 <7bea011f-f1d0-4375-ee1c-f97e12cd3f0a@redhat.com>
 <Yz/QICUIu25XjZGX@intel.com>
 <890f79b7-4c6b-0f99-f9c7-ba16bb9367a9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <890f79b7-4c6b-0f99-f9c7-ba16bb9367a9@redhat.com>
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
Cc: jfalempe@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 07, 2022 at 09:17:50AM +0200, Javier Martinez Canillas wrote:
> On 10/7/22 09:07, Ville Syrjälä wrote:
> > On Thu, Oct 06, 2022 at 10:28:12PM +0200, Javier Martinez Canillas wrote:
> >> On 10/5/22 13:40, Thomas Zimmermann wrote:
> >>> Rename the atomic helper function drm_atomic_helper_check_crtc_state()
> >>> to drm_atomic_helper_check_crtc_primary_plane() and only check for an
> >>> attached primary plane. Adapt callers.
> >>>
> >>> Instead of having one big function to check for various CRTC state
> >>> conditions, we rather want smaller functions that drivers can pick
> >>> individually.
> >>>
> >>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>> ---
> >>
> >> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> >>
> >> [...]
> >>
> >>> +	drm_for_each_plane_mask(plane, dev, crtc_state->plane_mask) {
> >>> +		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
> >>> +			return 0;
> >>>  	}
> >>
> >> I believe the code convention is to drop the curly braces when you
> >> have a single statement inside the a loop ?
> > 
> > This has two.
> > 
> 
> No, it has only one that is the if statement. So according to the Linux
> kernel coding style AFAIU it should be written as:
> 
> 	drm_for_each_plane_mask(plane, dev, crtc_state->plane_mask)
> 		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
> 			return 0;

That is exactly what it says not to do.

-- 
Ville Syrjälä
Intel
