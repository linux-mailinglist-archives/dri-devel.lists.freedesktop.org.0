Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F5A4B2318
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 11:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A1310EA6E;
	Fri, 11 Feb 2022 10:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81F610EA6A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 10:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644575351; x=1676111351;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mL2EGWEJ1+X7al0OFxqCBnHU+Yoy9youEb4rP8YJwsg=;
 b=iqyhCRfLTafgqreykf3XCxMm7ctmlgSPY3bqJpqalRju/IFEQYO+JeRg
 QjcjwibwoSbzAg243Bf90kFth3KZy4xS1N0SlgmZYzmttZNugTCFZ0J7Z
 NlpZ6lYsBHHnnU/XmVnnK0moHzo+3xERIVdbT6W88x8KqKzFAqyc35EGn
 ywfHDXw/CO7skGzL2Ydh0S+Gozb+vZe3aw4K3qz0EaekA2E2Tq5BHt3xD
 8JFS0wXjNOa7PD3mvUsE+Nvv5e0618TYcZKQQFPzCsezUkDcif56ncTBm
 8XLCDZGJUieWRO9O9fvQP73JOjqnCInEXK77h0eksKoEtcvCccJGdfnNx g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="229674469"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="229674469"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 02:29:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="586307272"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 02:29:08 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nIT9u-003PIr-EB; Fri, 11 Feb 2022 12:28:10 +0200
Date: Fri, 11 Feb 2022 12:28:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
Message-ID: <YgY6OqN+guBlt/ED@smile.fi.intel.com>
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-2-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211091927.2988283-2-javierm@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 10:19:22AM +0100, Javier Martinez Canillas wrote:
> Pull the per-line conversion logic into a separate helper function.
> 
> This will allow to do line-by-line conversion in other helpers that
> convert to a gray8 format.

...

> +static void drm_fb_xrgb8888_to_gray8_line(u8 *dst, const u32 *src, unsigned int pixels)
> +{
> +	unsigned int x;
> +
> +	for (x = 0; x < pixels; x++) {
> +		u8 r = (*src & 0x00ff0000) >> 16;
> +		u8 g = (*src & 0x0000ff00) >> 8;
> +		u8 b =  *src & 0x000000ff;
> +
> +		/* ITU BT.601: Y = 0.299 R + 0.587 G + 0.114 B */
> +		*dst++ = (3 * r + 6 * g + b) / 10;
> +		src++;
> +	}

Can be done as

	while (pixels--) {
		...
	}

or

	do {
		...
	} while (--pixels);

> +}


-- 
With Best Regards,
Andy Shevchenko


