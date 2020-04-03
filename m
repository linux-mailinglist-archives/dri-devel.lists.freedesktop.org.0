Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE4419E4F5
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 14:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DB16E178;
	Sat,  4 Apr 2020 12:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CD76EB50
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 09:31:04 +0000 (UTC)
IronPort-SDR: k45wyoczAkQeJpBKHbwhUcta8HPnOPY6/URI3RCNv2m8NHsicVjIsc6an15TTFjrOpemmZCAxC
 IRYSEL6kmYhQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 02:31:05 -0700
IronPort-SDR: Ff+uh1GlRsAzAACn6hWcKwB6L/7wQ6bTYA7eA69rBEVqU7gH6ev/OBSCkNoeT2Ric3r7jt7Mg5
 r7eRvnv3tT1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,339,1580803200"; d="scan'208";a="449968404"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga005.fm.intel.com with ESMTP; 03 Apr 2020 02:31:01 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jKIfH-00FOWT-O4; Fri, 03 Apr 2020 12:31:03 +0300
Date: Fri, 3 Apr 2020 12:31:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20200403093103.GI1922688@smile.fi.intel.com>
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Sat, 04 Apr 2020 12:45:44 +0000
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
Cc: Petr Mladek <pmladek@suse.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Joe Perches <joe@perches.com>, mchehab@kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 03, 2020 at 12:11:56PM +0300, Sakari Ailus wrote:
> Add a printk modifier %ppf (for pixel format) for printing V4L2 and DRM
> pixel formats denoted by 4ccs. The 4cc encoding is the same for both so
> the same implementation can be used.

...

> +static noinline_for_stack
> +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> +		    struct printf_spec spec, const char *fmt)
> +{

> +#define FOURCC_STRING_BE	"-BE"
> +	char s[sizeof(*fourcc) + sizeof(FOURCC_STRING_BE)] = { 0 };

I guess it makes it too complicated.

	char s[8];

> +	if (check_pointer(&buf, end, fourcc, spec))
> +		return buf;
> +
> +	if (fmt[1] != 'c' || fmt[2] != 'c')
> +		return error_string(buf, end, "(%p4?)", spec);
> +

> +	put_unaligned_le32(*fourcc & ~BIT(31), s);

Can you elaborate what the difference in output with this bit set over cleared?
I.o.w. why don't we need to put it as BE and for LE case addd "-LE"?

> +	if (*fourcc & BIT(31))
> +		strscpy(s + sizeof(*fourcc), FOURCC_STRING_BE,
> +			sizeof(FOURCC_STRING_BE));

We know the size, and we may put '\0' as well
	if (*fourcc & BIT(31))
		strscpy(&s[4], "-BE", sizeof("-BE"));
	else
		strscpy(&s[4], "", sizeof(""));


> +	return string(buf, end, s, spec);
> +}

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
