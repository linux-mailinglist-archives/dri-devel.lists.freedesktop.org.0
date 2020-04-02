Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFC319BDA6
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 10:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9AA6EA07;
	Thu,  2 Apr 2020 08:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34F56EA05
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 08:35:02 +0000 (UTC)
IronPort-SDR: nxZVAiBhUrEEcMjqlcaW6wJNfRX6BAcVdK5zxr49VfP1kOoGUzUzkglMlW9MIdupvgDvUBl8G1
 H17eIOsNr/6g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 01:35:02 -0700
IronPort-SDR: mMYzz6H5D5xoa4LoyAVyyzL6Hz0UJwAygbl2JSIJ7JKQ9evbNFNqZG1KRaSO52Y38Tih2SNbQ6
 KXQLBlY8D9xw==
X-IronPort-AV: E=Sophos;i="5.72,335,1580803200"; d="scan'208";a="423047048"
Received: from assenmac-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.35.117])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 01:34:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH 1/1] lib/vsprintf: Add support for printing V4L2 and DRM
 fourccs
In-Reply-To: <20200401140522.966-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200401140522.966-1-sakari.ailus@linux.intel.com>
Date: Thu, 02 Apr 2020 11:34:48 +0300
Message-ID: <87eet6mgk7.fsf@intel.com>
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hverkuil@xs4all.nl, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, mchehab@kernel.org,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 01 Apr 2020, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> Add a printk modifier %ppf (for pixel format) for printing V4L2 and DRM
> pixel formats denoted by 4ccs. The 4cc encoding is the same for both so
> the same implementation can be used.

I'm not going to take a strong stand in one way or the other regarding
the patch at hand, but I do think at some point we have to draw a line
what should be included in printk formats. Arguably they should be
reserved to things that are generally useful across large parts of the
kernel, right?

I think the more specialized you get, the more you should think about
just using the plain old %s, and your own helpers. Because frankly, the
kernel printk specifiers also start getting more than a little obscure.

Or could we conceive of a way to make this locally extensible yet safe,
letting callers use something like %{foo}, as well as providing a
locally relevant function to do the conversion?


BR,
Jani.


>
> Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/core-api/printk-formats.rst | 11 +++++++++
>  lib/vsprintf.c                            | 29 +++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index 8ebe46b1af39..b6249f513c09 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -545,6 +545,17 @@ For printing netdev_features_t.
>  
>  Passed by reference.
>  
> +V4L2 and DRM fourcc code (pixel format)
> +---------------------------------------
> +
> +::
> +
> +	%ppf
> +
> +Print a 4cc code used by V4L2 or DRM.
> +
> +Passed by reference.
> +
>  Thanks
>  ======
>  
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 7c488a1ce318..b39f0ac317c5 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -1721,6 +1721,32 @@ char *netdev_bits(char *buf, char *end, const void *addr,
>  	return special_hex_number(buf, end, num, size);
>  }
>  
> +static noinline_for_stack
> +char *pixel_format_string(char *buf, char *end, const u32 *fourcc,
> +			  struct printf_spec spec, const char *fmt)
> +{
> +	char ch[2] = { 0 };
> +	unsigned int i;
> +
> +	if (check_pointer(&buf, end, fourcc, spec))
> +		return buf;
> +
> +	switch (fmt[1]) {
> +	case 'f':
> +		for (i = 0; i < sizeof(*fourcc); i++) {
> +			ch[0] = *fourcc >> (i << 3);
> +			buf = string(buf, end, ch, spec);
> +		}
> +
> +		if (*fourcc & BIT(31))
> +			buf = string(buf, end, "-BE", spec);
> +
> +		return buf;
> +	default:
> +		return error_string(buf, end, "(%pp?)", spec);
> +	}
> +}
> +
>  static noinline_for_stack
>  char *address_val(char *buf, char *end, const void *addr,
>  		  struct printf_spec spec, const char *fmt)
> @@ -2131,6 +2157,7 @@ char *fwnode_string(char *buf, char *end, struct fwnode_handle *fwnode,
>   *       correctness of the format string and va_list arguments.
>   * - 'K' For a kernel pointer that should be hidden from unprivileged users
>   * - 'NF' For a netdev_features_t
> + * - 'pf' V4L2 or DRM pixel format.
>   * - 'h[CDN]' For a variable-length buffer, it prints it as a hex string with
>   *            a certain separator (' ' by default):
>   *              C colon
> @@ -2223,6 +2250,8 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
>  		return restricted_pointer(buf, end, ptr, spec);
>  	case 'N':
>  		return netdev_bits(buf, end, ptr, spec, fmt);
> +	case 'p':
> +		return pixel_format_string(buf, end, ptr, spec, fmt);
>  	case 'a':
>  		return address_val(buf, end, ptr, spec, fmt);
>  	case 'd':

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
