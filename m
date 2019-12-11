Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5FA11B470
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 16:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DAA6EB71;
	Wed, 11 Dec 2019 15:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 11 Dec 2019 15:47:51 UTC
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166686EB71
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 15:47:51 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2019 07:40:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; d="scan'208";a="245326651"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 11 Dec 2019 07:40:38 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 11 Dec 2019 17:40:37 +0200
Date: Wed, 11 Dec 2019 17:40:37 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Anderson <thomasanderson@google.com>
Subject: Re: [PATCH] drm/edid: Increase size of VDB and CMDB bitmaps to 256
 bits
Message-ID: <20191211154037.GI1208@intel.com>
References: <20191210221048.83628-1-thomasanderson@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210221048.83628-1-thomasanderson@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Airlie <airlied@linux.ie>, Sean Pau <sean@poorly.run>,
 linux-kernel@vger.kernel.org, Bhawanpreet Lakha <Bhawanpreet.lakha@amd.com>,
 dri-devel@lists.freedesktop.org, Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 10, 2019 at 02:10:48PM -0800, Thomas Anderson wrote:
> CEA-861-G adds modes up to 219, so increase the size of the
> maps in preparation for adding the new modes to drm_edid.c.
> =

> Signed-off-by: Thomas Anderson <thomasanderson@google.com>

Thanks. lgtm. Pushed to drm-misc-next.

PS. I do wonder a bit if we should consider a more economical way to
track this stuff. Not really sure how many bits we can realistically
expect to be set in these bitmasks...

> ---
>  include/drm/drm_connector.h | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> =

> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 5f8c3389d46f..17b728d9c73d 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -188,19 +188,19 @@ struct drm_hdmi_info {
>  =

>  	/**
>  	 * @y420_vdb_modes: bitmap of modes which can support ycbcr420
> -	 * output only (not normal RGB/YCBCR444/422 outputs). There are total
> -	 * 107 VICs defined by CEA-861-F spec, so the size is 128 bits to map
> -	 * upto 128 VICs;
> +	 * output only (not normal RGB/YCBCR444/422 outputs). The max VIC
> +	 * defined by the CEA-861-G spec is 219, so the size is 256 bits to map
> +	 * up to 256 VICs.
>  	 */
> -	unsigned long y420_vdb_modes[BITS_TO_LONGS(128)];
> +	unsigned long y420_vdb_modes[BITS_TO_LONGS(256)];
>  =

>  	/**
>  	 * @y420_cmdb_modes: bitmap of modes which can support ycbcr420
> -	 * output also, along with normal HDMI outputs. There are total 107
> -	 * VICs defined by CEA-861-F spec, so the size is 128 bits to map upto
> -	 * 128 VICs;
> +	 * output also, along with normal HDMI outputs. The max VIC defined by
> +	 * the CEA-861-G spec is 219, so the size is 256 bits to map up to 256
> +	 * VICs.
>  	 */
> -	unsigned long y420_cmdb_modes[BITS_TO_LONGS(128)];
> +	unsigned long y420_cmdb_modes[BITS_TO_LONGS(256)];
>  =

>  	/** @y420_cmdb_map: bitmap of SVD index, to extraxt vcb modes */
>  	u64 y420_cmdb_map;
> -- =

> 2.24.0.525.g8f36a354ae-goog

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
