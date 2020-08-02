Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB7023A0D4
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 10:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38378891CC;
	Mon,  3 Aug 2020 08:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413966E0FF;
 Sun,  2 Aug 2020 11:25:30 +0000 (UTC)
IronPort-SDR: H5sM5qUnI1i9g+Mb4SN+wegLE9MloZf8GoD7tIMOlCDNZGVyraHuTlC1T/vyx6PqXFN82T/Lmj
 JjUNZCU9ETmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9700"; a="213523576"
X-IronPort-AV: E=Sophos;i="5.75,426,1589266800"; d="scan'208";a="213523576"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 04:25:28 -0700
IronPort-SDR: UTOmpJ4fZQD2Rw5VNiUh+1mVo9aD5GDEpqPm95/RPFxD7Iwv7woQUiF1/Rm20KQhIGKuCd79wP
 imQWstfJClOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,426,1589266800"; d="scan'208";a="305523573"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga002.jf.intel.com with ESMTP; 02 Aug 2020 04:25:25 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1k2C7I-005iAE-LN; Sun, 02 Aug 2020 14:25:24 +0300
Date: Sun, 2 Aug 2020 14:25:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 00/16] acpi/pwm/i915: Convert pwm-crc and i915
 driver's PWM code to use the atomic PWM API
Message-ID: <20200802112524.GS3703480@smile.fi.intel.com>
References: <20200717133753.127282-1-hdegoede@redhat.com>
 <20200729105436.GT3703480@smile.fi.intel.com>
 <e8f93474-1775-b20c-f9f2-e33592a02028@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e8f93474-1775-b20c-f9f2-e33592a02028@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Mon, 03 Aug 2020 08:20:37 +0000
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 01, 2020 at 04:38:16PM +0200, Hans de Goede wrote:
> On 7/29/20 12:54 PM, Andy Shevchenko wrote:
> > On Fri, Jul 17, 2020 at 03:37:37PM +0200, Hans de Goede wrote:

...

> > One comment to consider, though. There are three channels in that PWM AFAIU.
> > One of them is backlight control, another one can be attached to haptics. The
> > concern is how this series may (or may not?) affect haptics behaviour.
> 
> When you say "in that PWM" do you mean the LPSS one or the CRC one ?

CRC one. I have read it from PMIC spec, that's why the question.

> The CRC PWM driver patches do make it honor the requested output frequency,
> where before, because of a bug, it would stick with the out frequency
> setup by the firmware (or the power-on-reset value if no value is set
> by the firmware). This fix causing this is very clearly correct, but
> it could have unexpected side-effects.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
