Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBACF98D06D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 11:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDD510E6E6;
	Wed,  2 Oct 2024 09:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FfeOQ2hV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D368810E6E6
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 09:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727862615; x=1759398615;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HnsZjKKVkAPqLyddXyl6oXy5j2RjfT6mu7/pk1AUBVY=;
 b=FfeOQ2hVp6Iq3uK0gYvBSPgWd64B1w9dkKcEQH2USmc/9qBKJaqyCRcM
 WU3WYhseBo/aC5Cz9f6Ov07berrCyu63nX0s2tLthCSf8qLlejirpVgJ/
 zr4vxK4HQ6vomsksoDjNcKwZXTDoM4aj/uBNarPMUGhideFsxZCmbE8z1
 IVBMyNVEHXZ2ucR87W8xRzXkV88pobf84A1jh1x33Wpoy+jQgE9bpyr69
 25AAv5SCGv6g91HYbkfQe55+gFJqsm1cNtoDDQ60H99ZHjnvJBPyjQOoT
 wzNiW8NqYC7cWh+kUCuU+Tq0bZIaWBDP5KI3rJrWrV5OetCvlS0ZNcdIL g==;
X-CSE-ConnectionGUID: Sji39O3wRXig+LRgQkkJOA==
X-CSE-MsgGUID: 6kJH3K0AQEiN4ictROZWPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="30905846"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="30905846"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 02:50:14 -0700
X-CSE-ConnectionGUID: myxeqxXATJizn1mdVbVhWw==
X-CSE-MsgGUID: wkHXQWsnSku1E6KJpnUI0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="74066282"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Oct 2024 02:50:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 02 Oct 2024 12:50:11 +0300
Date: Wed, 2 Oct 2024 12:50:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Brahmajit Das <brahmajit.xyz@gmail.com>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/1] drm/display: Fix building with GCC 15
Message-ID: <Zv0XU3t9IYwTisb9@intel.com>
References: <20241001144224.3492196-1-brahmajit.xyz@gmail.com>
 <87a5fmvrkt.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a5fmvrkt.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 02, 2024 at 11:26:10AM +0300, Jani Nikula wrote:
> On Tue, 01 Oct 2024, Brahmajit Das <brahmajit.xyz@gmail.com> wrote:
> > GCC 15 enables -Werror=unterminated-string-initialization by default.
> > This results in the following build error
> >
> > drivers/gpu/drm/display/drm_dp_dual_mode_helper.c: In function ‘is_hdmi_adaptor’:
> > drivers/gpu/drm/display/drm_dp_dual_mode_helper.c:164:17: error: initializer-string for array of
> >  ‘char’ is too long [-Werror=unterminated-string-initialization]
> >   164 |                 "DP-HDMI ADAPTOR\x04";
> >       |                 ^~~~~~~~~~~~~~~~~~~~~
> >
> > After discussion with Ville, the fix was to increase the size of
> > dp_dual_mode_hdmi_id array by one, so that it can accommodate the new
> > line character. This should let us build the kernel with GCC 15.
> 
> Should be terminating NUL, not new line.
> 
> >
> > Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_dual_mode_helper.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> > index 14a2a8473682..295375868db6 100644
> > --- a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> > @@ -160,11 +160,12 @@ EXPORT_SYMBOL(drm_dp_dual_mode_write);
> >  
> >  static bool is_hdmi_adaptor(const char hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN])
> >  {
> > -	static const char dp_dual_mode_hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN] =
> > +	//+1 to avaoid spurious -Werror=unterminated-string-initialization warning
> 
> If we added comments for every little thing like this, there'd be more
> comments than code. ;)

I asked for a comment, otherwise I suspect I''d end up undoing this
after forgetting why it's there. OTOH maybe I'll get the "broken"
gcc upgrade before I look at this code again, which would solve
that particular problem.

> 
> > +	static const char dp_dual_mode_hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN + 1] =
> >  		"DP-HDMI ADAPTOR\x04";
> >  
> >  	return memcmp(hdmi_id, dp_dual_mode_hdmi_id,
> > -		      sizeof(dp_dual_mode_hdmi_id)) == 0;
> > +		      DP_DUAL_MODE_HDMI_ID_LEN) == 0;
> >  }
> >  
> >  static bool is_type1_adaptor(uint8_t adaptor_id)
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
