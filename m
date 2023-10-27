Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 985337D9849
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 14:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A229510E99A;
	Fri, 27 Oct 2023 12:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0723610E99A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 12:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698409965; x=1729945965;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2WFc0xktwdPr3K6DLDyFQydg5aZGQ7HEhIRKjX8dajE=;
 b=V1fedcgAV0oD4Zyv6Kk6ZquHbeNdbdrTMHzdeA+E59GTYpjJnSehlNGE
 2LxSxChgLagMCt3yc9Jy7ztgW8FYxCUi50YAxA1cwsr40BHcb1SZF7i4j
 5IOkqDDmgR0ehZPvB2i8ctWOnt0xEPewi+yeNeSigJLRGqCAIAUCKIOjH
 sKAnG7nIw1NO4D3aimK9y54F8MQVhKO715aWvRFYewzhNO8cV0hEbyhkh
 Y+EqGZumOmmn4aXBbOI+5DcUNiqwZXdO/E1tj+0BiIs/QuhMlg723S2dR
 w7mn+KZkVqsNPTXrVZVwKOo3kAuDUacd9xV22yr1hBJeNFHY0wA/ZVUPg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="418877266"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; d="scan'208";a="418877266"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 05:32:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="709398360"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; d="scan'208";a="709398360"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga003.jf.intel.com with SMTP; 27 Oct 2023 05:32:20 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 27 Oct 2023 15:32:19 +0300
Date: Fri, 27 Oct 2023 15:32:19 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Peng Hao <penghao@dingdao.com>
Subject: Re: [PATCH] gpu/drm/drm_framebuffer.c: Add judgement for return
 value of drm_get_format_info().
Message-ID: <ZTut09A43yidJD9Z@intel.com>
References: <20231027091912.1244107-1-penghao@dingdao.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231027091912.1244107-1-penghao@dingdao.com>
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 27, 2023 at 05:19:12PM +0800, Peng Hao wrote:
> Since drm_get_format_info() may return NULL,

Not in this case since we already checked it earlier.

> so a judgement of return
> value is needed to add.
> 
> Signed-off-by: Peng Hao <penghao@dingdao.com>
> ---
>  drivers/gpu/drm/drm_framebuffer.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index aff3746dedfb..be7dd1998c04 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -194,6 +194,10 @@ static int framebuffer_check(struct drm_device *dev,
>  
>  	/* now let the driver pick its own format info */
>  	info = drm_get_format_info(dev, r);
> +	if (!info) {
> +		drm_dbg_kms(dev, "no matched format info\n");
> +		return -EFAULT;
> +	}
>  
>  	for (i = 0; i < info->num_planes; i++) {
>  		unsigned int width = fb_plane_width(r->width, info, i);
> -- 
> 2.37.1

-- 
Ville Syrjälä
Intel
