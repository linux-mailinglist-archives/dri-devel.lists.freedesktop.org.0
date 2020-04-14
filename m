Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F10A1A790E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 13:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD18E6E065;
	Tue, 14 Apr 2020 11:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D314F6E065
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:04:00 +0000 (UTC)
IronPort-SDR: 4p4iWtZ+VJXPhWtwPp7HQ+WgZIHGnUUGA6imgxz2b7y/ZWsxBcgXyKyrrehR9+Xxl7YGlWWT3L
 JGYB0yvaFmBg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 04:03:59 -0700
IronPort-SDR: xN6M04+6XoH3Nl0a+kETp45TvlkFOiB8Z1PLiDQ1H2p9QOt7JBpVVKHg2GSDLdNi1UnytuVl2H
 rE2ACbZErW7Q==
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; d="scan'208";a="427024859"
Received: from mdoerbec-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.38.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 04:03:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Aurabindo Pillai <mail@aurabindo.in>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH] drm: dpcd: Print more useful information during error
In-Reply-To: <20200409195200.5483-1-mail@aurabindo.in>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200409195200.5483-1-mail@aurabindo.in>
Date: Tue, 14 Apr 2020 14:03:53 +0300
Message-ID: <87o8rumiqu.fsf@intel.com>
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 09 Apr 2020, Aurabindo Pillai <mail@aurabindo.in> wrote:
> When DPCD access errors occur, knowing the register and request
> associated with the error helps debugging, so print the
> details in the debug message.
>
> Signed-off-by: Aurabindo Pillai <mail@aurabindo.in>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index a5364b519..545606aac 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -257,7 +257,9 @@ static int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
>  			err = ret;
>  	}
>  
> -	DRM_DEBUG_KMS("Too many retries, giving up. First error: %d\n", err);
> +	DRM_DEBUG_KMS("dpcd: Too many retries, giving up. First error: %d\t"
> +		      "address: %x\trequest: %x\t size:%zu\n",
> +		      err, msg.address, msg.request, msg.size);

Nitpicks, please don't add tabs, maybe use commas instead, and please
add 0x in front of hex.

BR,
Jani.


>  	ret = err;
>  
>  unlock:

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
