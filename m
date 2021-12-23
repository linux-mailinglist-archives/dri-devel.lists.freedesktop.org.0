Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE0647E3E9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 14:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58CC10E347;
	Thu, 23 Dec 2021 13:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E4610E390
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 13:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640264583; x=1671800583;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZQKf2i6C2d/kE2MS8pBzxK1U+UM3+Zes7utRPr08Lsc=;
 b=VBCuhaZ3UcqJSixZ2Q53j00PBzzJ7Lfa6th3j05XlrN6w4K+2ZJX/jZH
 Zpqe+nvjLHOF1sINrXuDI46FnObPnDzPq58hcwAkrIt04oTMsgZQvw9pf
 48eyEpFVk6x3mPvcXaYQX8usubgxmcv0yWIjmC5fk4kOY5AKKw204dUPL
 JnO3R4xdeRUaiw4BMngjyGyLOo92p4mJZPFKLULPvnqfzrX5dHlXqwx6+
 PI/O6T49r+ZnO3aTU075PnAZm1ir0ylUnRYRQDrYQhyhXE4D3dTB4xKTH
 jOtEc2SzGtjE+o+dchc8DCye+oB9UEzgCxMeQvUVFJzQYRHNZE4ScrY7C A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="241043947"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="241043947"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 05:03:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="508852941"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.147])
 by orsmga007.jf.intel.com with SMTP; 23 Dec 2021 05:02:59 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 23 Dec 2021 15:02:59 +0200
Date: Thu, 23 Dec 2021 15:02:59 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lee Shawn C <shawn.c.lee@intel.com>
Subject: Re: [PATCH] drm/edid: Refine HDMI VSDB detect
Message-ID: <YcRzg2ZcbyjSm1q/@intel.com>
References: <20211212153331.15457-1-shawn.c.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211212153331.15457-1-shawn.c.lee@intel.com>
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
Cc: Dave Airlie <airlied@redhat.com>, Hans Verkuil <hans.verkuil@cisco.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 12, 2021 at 11:33:31PM +0800, Lee Shawn C wrote:
> According to CEA-861-F chapter 7.5.4. It says "The VSDB shall contain the
> 3 bytes of the IEEE OUI as well as any additional payload bytes needed."
> Now DRM driver check HDMI OUI but VSDB payload size at least five bytes.
> That may caused some HDMI monitors' audio feature can't be enabled.
> Because of they only have three bytes payload (OUI only) in VSDB.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Adam Jackson <ajax@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 12893e7be89b..5aa4a6bf4a13 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4205,7 +4205,7 @@ static bool cea_db_is_hdmi_vsdb(const u8 *db)
>  	if (cea_db_tag(db) != VENDOR_BLOCK)
>  		return false;
>  
> -	if (cea_db_payload_len(db) < 5)
> +	if (cea_db_payload_len(db) < 3)
>  		return false;

I was a a bit worried that we are now assuming that we can parse some
stuff without further length checks, but looks like that's just the 
"source physical address" stuff which we do not parse in drm_edid.c,
and the other fields we do parse are actually optional and so already
have the require length checks. So this seems fine.

Closes: https://gitlab.freedesktop.org/drm/misc/-/issues/28
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Note that there is a second edid parser in cec_get_edid_spa_location()
that does parse the source physical address. You may want to double
check that it doesn't make any bad assumptions about the length 
of the vsdb either. I think we should probably get rid of that
second parser and just have drm_edid.c extract the source physical
address and pass that on directly to the cec code instead. But I
guess the cec code still couldn't remove the second parser
since some media drivers need it :( Though it could then perhaps
be moved into the media code instead of having it as a massive
inline function in the cec headers.

-- 
Ville Syrjälä
Intel
