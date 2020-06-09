Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 713FF1F4F32
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229A66E413;
	Wed, 10 Jun 2020 07:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002BB6E2B6;
 Tue,  9 Jun 2020 13:50:22 +0000 (UTC)
IronPort-SDR: 9S6GAk87mnWfWXwDj/+czI4rgxIc1dYNWziYGB0w7+t1FOqOvpXxGHsNff/S3d2GvKR9EiDX96
 H9SWfZSavuJQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2020 06:50:22 -0700
IronPort-SDR: Zgny2YQ4DUmzk6biJUauB5s/Nn4ggetWOBN+fxwdo6NAsLTk14Lu2tJgYwHWvwDf4Y16R0WDzJ
 3OM4tummlviA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,492,1583222400"; d="scan'208";a="306267063"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 09 Jun 2020 06:50:18 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jiedw-00BuiK-Mc; Tue, 09 Jun 2020 16:50:20 +0300
Date: Tue, 9 Jun 2020 16:50:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 10/15] pwm: crc: Implement apply() method to support
 the new atomic PWM API
Message-ID: <20200609135020.GP2428291@smile.fi.intel.com>
References: <20200607181840.13536-1-hdegoede@redhat.com>
 <20200607181840.13536-11-hdegoede@redhat.com>
 <20200609113220.GM2428291@smile.fi.intel.com>
 <93c7843d-1225-c8c6-9eb7-1f11b44bec34@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <93c7843d-1225-c8c6-9eb7-1f11b44bec34@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
Cc: linux-pwm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 09, 2020 at 03:44:18PM +0200, Hans de Goede wrote:
> On 6/9/20 1:32 PM, Andy Shevchenko wrote:
> > On Sun, Jun 07, 2020 at 08:18:35PM +0200, Hans de Goede wrote:

...

> > And again... :-(
> 
> Well yes I cannot help it that the original code, as submitted by Intel,
> was of very questionable quality, so instead of just converting it to the
> atomic PWM API I had to do a ton of bugfixes first...   I tried to do
> this all in small bits rather then in a single big rewrite the buggy
> <beep> commit to make life easier for reviewers.

Yes, I know about that old code quality, sorry, we were not at Intel that time
(or were just right-less newbies).

> I can introduce the crc_pwm_calc_clk_div helper earlier as you suggested
> in an earlier mail. I guess I could also keep the helper here, and then
> fold it into the function in a later commit (*).
> 
> Would that work for you ?

Definitely.

> *) Because having a helper for 3 lines of code when it is used only
> once is not helpful IMHO, it only makes it harder to figure out what
> the code is exactly doing when readin the code.

At least it will reduce churn to just

1) introduce foo();
2) do many changes with foo() being used;
3) drop foo() *if* it's not needed / makes little sense.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
