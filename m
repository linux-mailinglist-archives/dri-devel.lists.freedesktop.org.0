Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED04472C4E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 13:31:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E76910E8DD;
	Mon, 13 Dec 2021 12:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A22B10E8DD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 12:30:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="262846461"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="262846461"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 04:30:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="544760066"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 13 Dec 2021 04:30:52 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 13 Dec 2021 14:30:51 +0200
Date: Mon, 13 Dec 2021 14:30:51 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lee Shawn C <shawn.c.lee@intel.com>
Subject: Re: [PATCH] drm/edid: Refine HDMI VSDB detect
Message-ID: <Ybc8+3YonPSH99kl@intel.com>
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
Cc: Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 12, 2021 at 11:33:31PM +0800, Lee Shawn C wrote:
> According to CEA-861-F chapter 7.5.4. It says "The VSDB shall contain the
> 3 bytes of the IEEE OUI as well as any additional payload bytes needed."
> Now DRM driver check HDMI OUI but VSDB payload size at least five bytes.
> That may caused some HDMI monitors' audio feature can't be enabled.
> Because of they only have three bytes payload (OUI only) in VSDB.

HDMI 1.4a says
"Sinks shall contain an HDMI VSDB minimally containing a 2-byte Source
 Physical Address field following the 24-bit identifier. ...
 The minimum value of N (length) is 5 and the maximum value of N is 31."

Do you actually have an EDID that violates that?

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
>  
>  	return oui(db[3], db[2], db[1]) == HDMI_IEEE_OUI;
> -- 
> 2.31.1

-- 
Ville Syrjälä
Intel
