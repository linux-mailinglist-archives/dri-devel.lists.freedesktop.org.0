Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D36B4C4FBC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 21:36:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3129C10E931;
	Fri, 25 Feb 2022 20:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9781210E931;
 Fri, 25 Feb 2022 20:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645821407; x=1677357407;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Um3Ri3Z5tNczvjbg/Kqd4t82aFPTJQvoXqKHvporKMY=;
 b=HVRk5hM3NGY6TTZh6huaP57h3qzYUAMkJ3CRwfYx+m32FY70S/XpfoJK
 V/6zaYd/toKf8INPqtfOdiPdUP7dgb0qsFg7Dicc8VVTLtY72YM48rr4M
 SE7SqGRcxbMf7thkZcUdkqJWhiuNldkRSGEXbTSSxV1oWNSpiYpAADi+a
 gQQBTFdJ5h+gk98Sc3qFoCBODCG5wKTPlHAKD6V5GH302M1sqMFQViw8M
 0pNaRW742paCw7CPtyvm1TecL4TKhY0BVCwGFlvd9ZqCLIt2cxZjDMFEQ
 0HNM39YpFW/oB6vsZ3XgERN3+N3gBB7lPh0QxgW9ilp1MsArP545GfO46 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="315790735"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="315790735"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:36:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="638353417"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga002.fm.intel.com with SMTP; 25 Feb 2022 12:36:41 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 25 Feb 2022 22:36:41 +0200
Date: Fri, 25 Feb 2022 22:36:41 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 1/3] drm: Extend DEFINE_DRM_GEM_FOPS() for optional fops
Message-ID: <Yhk92RwhBqAAHcuT@intel.com>
References: <20220225202614.225197-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220225202614.225197-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 25, 2022 at 12:26:12PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Extend the helper macro so we don't have to throw it away if driver adds
> support for optional fops, like show_fdinfo().
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  include/drm/drm_gem.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 35e7f44c2a75..987e78b18244 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -327,7 +327,7 @@ struct drm_gem_object {
>   * non-static version of this you're probably doing it wrong and will break the
>   * THIS_MODULE reference by accident.
>   */
> -#define DEFINE_DRM_GEM_FOPS(name) \
> +#define DEFINE_DRM_GEM_FOPS(name, ...) \
>  	static const struct file_operations name = {\
>  		.owner		= THIS_MODULE,\
>  		.open		= drm_open,\
> @@ -338,6 +338,7 @@ struct drm_gem_object {
>  		.read		= drm_read,\
>  		.llseek		= noop_llseek,\
>  		.mmap		= drm_gem_mmap,\
> +		##__VA_ARGS__\
>  	}

Would it not be less convoluted to make the macro only provide
the initializers? So you'd get something like:

static const struct file_operations foo = {
	DRM_GEM_FOPS,
	.my_stuff = whatever,
};

>  
>  void drm_gem_object_release(struct drm_gem_object *obj);
> -- 
> 2.35.1

-- 
Ville Syrjälä
Intel
