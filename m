Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F6911E1D4
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 11:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A626E313;
	Fri, 13 Dec 2019 10:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C6A6E313;
 Fri, 13 Dec 2019 10:20:52 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 02:20:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; d="scan'208";a="208419276"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by orsmga008.jf.intel.com with ESMTP; 13 Dec 2019 02:20:48 -0800
Date: Fri, 13 Dec 2019 15:50:01 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v2 01/12] drm/i915: Fix sha_text population code
Message-ID: <20191213101959.GA3829@intel.com>
References: <20191212190230.188505-1-sean@poorly.run>
 <20191212190230.188505-2-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212190230.188505-2-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2019-12-12 at 14:02:19 -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch fixes a few bugs:
> 
> 1- We weren't taking into account sha_leftovers when adding multiple
>    ksvs to sha_text. As such, we were or'ing the end of ksv[j - 1] with
>    the beginning of ksv[j]
> 
> 2- In the sha_leftovers == 2 and sha_leftovers == 3 case, bstatus was
>    being placed on the wrong half of sha_text, overlapping the leftover
>    ksv value
> 
> 3- In the sha_leftovers == 2 case, we need to manually terminate the
>    byte stream with 0x80 since the hardware doesn't have enough room to
>    add it after writing M0
> 
> The upside is that all of the "HDCP supported" HDMI repeaters I could
> find on Amazon just strip HDCP anyways, so it turns out to be _really_
> hard to hit any of these cases without an MST hub, which is not (yet)
> supported. Oh, and the sha_leftovers == 1 case works perfectly!

Yes. The repeaters tested at our side too with sha_leftovers = 1 with
mostly ksv count of 1. non availability of the repeaters is killer here.
> 
> Fixes: ee5e5e7a5e0f ("drm/i915: Add HDCP framework + base implementation")
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v4.17+
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-2-sean@poorly.run #v1
> 
> Changes in v2:
> -None
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 25 +++++++++++++++++------
>  include/drm/drm_hdcp.h                    |  3 +++
>  2 files changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 0fdbd39f6641..eaab9008feef 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -335,8 +335,10 @@ int intel_hdcp_validate_v_prime(struct intel_connector *connector,
>  
>  		/* Fill up the empty slots in sha_text and write it out */
>  		sha_empty = sizeof(sha_text) - sha_leftovers;
> -		for (j = 0; j < sha_empty; j++)
> -			sha_text |= ksv[j] << ((sizeof(sha_text) - j - 1) * 8);
> +		for (j = 0; j < sha_empty; j++) {
> +			u8 off = ((sizeof(sha_text) - j - 1 - sha_leftovers) * 8);
Didn't hit this as ksv count was 1 mostly with sha_leftovers = 1.
Thanks for fixing it.
> +			sha_text |= ksv[j] << off;
> +		}
>  
>  		ret = intel_write_sha_text(dev_priv, sha_text);
>  		if (ret < 0)
> @@ -426,7 +428,7 @@ int intel_hdcp_validate_v_prime(struct intel_connector *connector,
>  	} else if (sha_leftovers == 2) {
>  		/* Write 32 bits of text */
>  		I915_WRITE(HDCP_REP_CTL, rep_ctl | HDCP_SHA1_TEXT_32);
> -		sha_text |= bstatus[0] << 24 | bstatus[1] << 16;
> +		sha_text |= bstatus[0] << 8 | bstatus[1];
>  		ret = intel_write_sha_text(dev_priv, sha_text);
>  		if (ret < 0)
>  			return ret;
> @@ -440,16 +442,27 @@ int intel_hdcp_validate_v_prime(struct intel_connector *connector,
>  				return ret;
>  			sha_idx += sizeof(sha_text);
>  		}
> +
> +		/*
> +		 * Terminate the SHA-1 stream by hand. For the other leftover
> +		 * cases this is appended by the hardware.
> +		 */
> +		I915_WRITE(HDCP_REP_CTL, rep_ctl | HDCP_SHA1_TEXT_32);
> +		sha_text = DRM_HDCP_SHA1_TERMINATOR << 24;
> +		ret = intel_write_sha_text(dev_priv, sha_text);
> +		if (ret < 0)
> +			return ret;
> +		sha_idx += sizeof(sha_text);
>  	} else if (sha_leftovers == 3) {
> -		/* Write 32 bits of text */
> +		/* Write 32 bits of text (filled from LSB) */
>  		I915_WRITE(HDCP_REP_CTL, rep_ctl | HDCP_SHA1_TEXT_32);
> -		sha_text |= bstatus[0] << 24;
> +		sha_text |= bstatus[0];

Looks good to me though this path never been exercised. Hopefully MST
will do it.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>

>  		ret = intel_write_sha_text(dev_priv, sha_text);
>  		if (ret < 0)
>  			return ret;
>  		sha_idx += sizeof(sha_text);
>  
> -		/* Write 8 bits of text, 24 bits of M0 */
> +		/* Write 8 bits of text (filled from LSB), 24 bits of M0 */
>  		I915_WRITE(HDCP_REP_CTL, rep_ctl | HDCP_SHA1_TEXT_8);
>  		ret = intel_write_sha_text(dev_priv, bstatus[1]);
>  		if (ret < 0)
> diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
> index 06a11202a097..20498c822204 100644
> --- a/include/drm/drm_hdcp.h
> +++ b/include/drm/drm_hdcp.h
> @@ -29,6 +29,9 @@
>  /* Slave address for the HDCP registers in the receiver */
>  #define DRM_HDCP_DDC_ADDR			0x3A
>  
> +/* Value to use at the end of the SHA-1 bytestream used for repeaters */
> +#define DRM_HDCP_SHA1_TERMINATOR		0x80
> +
>  /* HDCP register offsets for HDMI/DVI devices */
>  #define DRM_HDCP_DDC_BKSV			0x00
>  #define DRM_HDCP_DDC_RI_PRIME			0x08
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
