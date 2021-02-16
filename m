Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F68E31C923
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 11:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0676E40A;
	Tue, 16 Feb 2021 10:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9341F6E40A
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 10:55:38 +0000 (UTC)
IronPort-SDR: U9Fn8JqCzWncCiaccK4Egrtvh5RyjddDZds3xlhbhRzuTGZ0pFnCb2Ey1hYByjg2+zRdf0zVSt
 NV8K25xKqBcw==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="202044527"
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; d="scan'208";a="202044527"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 02:55:38 -0800
IronPort-SDR: K/LCoTRRj2skVEigNtRgGbmiWl7VPsq9Xk5of6rTkxjO4Csd6HfCfVlrMP0TNZiJKJ4o7J3C2+
 0eIWCxqUh+QQ==
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; d="scan'208";a="366415880"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 02:55:34 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lBy0x-005ReY-75; Tue, 16 Feb 2021 12:55:31 +0200
Date: Tue, 16 Feb 2021 12:55:31 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v8 3/4] drm: Switch to %p4cc format modifier
Message-ID: <YCuko55bGhmxvNiq@smile.fi.intel.com>
References: <20210216101931.2110-1-sakari.ailus@linux.intel.com>
 <20210216101931.2110-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210216101931.2110-4-sakari.ailus@linux.intel.com>
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
Cc: Petr Mladek <pmladek@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Joe Perches <joe@perches.com>, mchehab@kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 16, 2021 at 12:19:30PM +0200, Sakari Ailus wrote:
> Switch DRM drivers from drm_get_format_name() to %p4cc. This gets rid of a
> large number of temporary variables at the same time.

...

> -	seq_printf(m, "\t\tuapi: [FB:%d] %s,0x%llx,%dx%d, visible=%s, src=" DRM_RECT_FP_FMT ", dst=" DRM_RECT_FMT ", rotation=%s\n",
> -		   fb ? fb->base.id : 0, fb ? format_name.str : "n/a",
> +	seq_printf(m, "\t\tuapi: [FB:%d] ", fb ? fb->base.id : 0);
> +	if (fb)
> +		seq_printf(m, "%p4cc", &fb->format->format);
> +	else
> +		seq_puts(m, "n/a");
> +	seq_printf(m, ",0x%llx,%dx%d, visible=%s, src=" DRM_RECT_FP_FMT ", dst=" DRM_RECT_FMT ", rotation=%s\n",
>  		   fb ? fb->modifier : 0,
>  		   fb ? fb->width : 0, fb ? fb->height : 0,
>  		   plane_visibility(plane_state),

I still think this can be improved. See below for the example:

  seq_puts(m, "\t\tuapi: ");
  if (fb)
    seq_printf(m, "[FB:%d] %p4cc,0x%llx,%dx%d, ",
       fb->base.id, &fb->format->format, fb->modifier, fb->width, fb->height);
  else
    seq_puts(m, "[FB:0] n/a,0,0x0, ");
  seq_printf(m, "visible=%s, src=" DRM_RECT_FP_FMT ", dst=" DRM_RECT_FMT ", rotation=%s\n",
       plane_visibility(plane_state), DRM_RECT_FP_ARG(&src),
       DRM_RECT_ARG(&dst), rot_str);

This will show logical parts separately and clear view on what would be printed
when !fb. Also it uses seq_puts() without any needs for formatting.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
