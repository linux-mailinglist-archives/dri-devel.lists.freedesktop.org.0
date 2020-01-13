Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A29139960
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 19:55:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CE16E143;
	Mon, 13 Jan 2020 18:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6564C6E142;
 Mon, 13 Jan 2020 18:55:01 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 3DDE58072E;
 Mon, 13 Jan 2020 19:54:57 +0100 (CET)
Date: Mon, 13 Jan 2020 19:54:56 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/6] drm/print: introduce new struct
 drm_device based WARN* macros
Message-ID: <20200113185456.GA32145@ravnborg.org>
References: <20200113115557.32713-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200113115557.32713-2-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200113115557.32713-2-pankaj.laxminarayan.bharadiya@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=6ais3OYN73AznueNaSQA:9 a=CjuIK1q_8ugA:10
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 sudeep.dutt@intel.com, dri-devel@lists.freedesktop.org,
 pankaj.laxminaryan.bharadiya@freedesktop.org, David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pankaj.

On Mon, Jan 13, 2020 at 05:25:52PM +0530, Pankaj Bharadiya wrote:
> Add new struct drm_device based WARN* macros. These are modeled after
> the core kernel device based WARN* macros. These would be preferred
> over the regular WARN* macros, where possible.
> 
> These macros include device information in the backtrace, so we know
> what device the warnings originate from.
> 
> Knowing the device specific information in the backtrace would be
> helpful in development all around.
> 
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> ---
>  include/drm/drm_print.h | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 8f99d389792d..61a7224e697d 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -553,4 +553,34 @@ void __drm_err(const char *format, ...);
>  #define DRM_DEBUG_PRIME_RATELIMITED(fmt, ...)				\
>  	DRM_DEV_DEBUG_PRIME_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
>  
> +/*
> + * struct drm_device based WARNs
> + *
> + *
> + * drm_WARN*() acts like WARN*(), but with the key difference of
> + * using device specific information so that we know from which device
> + * warning is originating from.
> + *
> + * Prefer drm_device based dev_WARN* over regular WARN*
> + */
...

> +	drm_WARN_ONCE((drm), (x), "%s",					\
> +		      "drm_WARN_ON_ONCE(" __stringify(x) ")")
> +
>  #endif /* DRM_PRINT_H_ */

As this is the now recommend way to use WARN() and friends, can we have
this moved upward in this file.
So we at some not-so-distant-future can have all the legacy logging in
the bottom of the file, and all the shiny new stuff at the top.
So people browsing the file see the new stuff before the legacy stuff.

Not a big deal - we can always move it later if we are inclined to do
so.

Very good that you follow-up with some actual usage.
This is a good way to verify that you got it right.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
