Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDED5A20ED8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 17:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E494110E6BB;
	Tue, 28 Jan 2025 16:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l6ItAYV+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3BC10E6BB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 16:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738082612; x=1769618612;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=D64twa18YWTbFCeP+NDxcL/MlTZI7Ggll+Li/4x7fbo=;
 b=l6ItAYV+In7Ib9B8JBXUOK0xLzE9xzk4QXEeNOOlyX/ffhNG43zP2pz9
 Slhkgnly3YSOSfyNOm/mMnHbmXC/QAUBKpctUfmznZIM8v+AztKqQBNHq
 opzlNKAV1J5XMHsG4IMsn2xf8SftTdo6GhbgWlp7OjexDKHku19oWwk+4
 kPk9sn1ZmNphG3zdsk4otazgIjOTauV2F2uQFEBeedsiTtatWYwMjpp1G
 YwJfaRBua8/uqYblllmAKD3E8NBSEHb7gKIsDrwv6qCoI0fx5vhM6U2kL
 oJehpjLy/B/oR/MrRPxNqvbe4/X2CuyyoUIBBXwqG1IUYbT8xZdYZ4g22 Q==;
X-CSE-ConnectionGUID: QO1/2pFMRHqP3X8Sv7rYnQ==
X-CSE-MsgGUID: uHXLSuSCTgyV4H9cpaqsxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="49163656"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="49163656"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 08:43:32 -0800
X-CSE-ConnectionGUID: n4WohlxIS7GprOK67OL+9A==
X-CSE-MsgGUID: GNEgHlFgS2G19cR74yvIDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="113784616"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 08:43:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tcogQ-000000067pQ-3oqe; Tue, 28 Jan 2025 18:43:26 +0200
Date: Tue, 28 Jan 2025 18:43:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/1] regmap: Synchronize cache for the page selector
Message-ID: <Z5kJLrE6xOzOKaeb@smile.fi.intel.com>
References: <20250116124303.3941583-1-andriy.shevchenko@linux.intel.com>
 <CGME20250117135754eucas1p1a8558792f9475c2acc009e1ba20c7109@eucas1p1.samsung.com>
 <a193bcb5-1b35-48ba-801b-925ab2f92d6f@samsung.com>
 <Z4pktkZ1ihfkZjHm@smile.fi.intel.com>
 <Z4ppo8wV3nicOfAQ@smile.fi.intel.com>
 <8a7581e4-6422-4d77-8027-02df0d7da489@samsung.com>
 <Z4qTQ9ypkX6iS1Pl@smile.fi.intel.com>
 <42fe4488-0ff2-4b92-ae11-cce1664a7176@samsung.com>
 <Z4-hMdUUTeQHN5W_@smile.fi.intel.com>
 <6b4cba29-786c-4999-ac1d-27b3e4cea6f8@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b4cba29-786c-4999-ac1d-27b3e4cea6f8@samsung.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 28, 2025 at 05:08:08PM +0100, Marek Szyprowski wrote:
> On 21.01.2025 14:29, Andy Shevchenko wrote:
> > On Tue, Jan 21, 2025 at 08:33:09AM +0100, Marek Szyprowski wrote:
> >> On 17.01.2025 18:28, Andy Shevchenko wrote:
> >>> On Fri, Jan 17, 2025 at 05:05:42PM +0100, Marek Szyprowski wrote:
> >>>
> >>> Does it fail in the same way?
> >> Yes, the hw revision is reported as zero in this case: LT9611 revision:
> >> 0x00.00.00
> > Hmm... This is very interesting! It means that the page selector is a bit
> > magical there. Dmitry, can you chime in and perhaps shed some light on this?
> >
> >>>> Does it mean that there is really a bug in the driver?
> >>> Without looking at the datasheet it's hard to say. At least what I found so far
> >>> is one page of the I²C traffic dump on Windows as an example how to use their
> >>> evaluation board and software, but it doesn't unveil the bigger picture. At
> >>> least what I think is going on here is that the programming is not so easy as
> >>> just paging. Something is more complicated there.
> >>>
> >>> But at least (and as Mark said) the most of the regmap based drivers got
> >>> the ranges wrong (so, at least there is one bug in the driver).
> >> I can do more experiments if this helps. Do you need a dump of all
> >> regmap accesses or i2c traffic from this driver?
> > It would be helpful! Traces from the failed and non-failed cases
> > till the firmware revision and chip ID reading would be enough to
> > start with.
> 
> I'm sorry for the delay, I was a bit busy with other stuff.

No problem and thanks for sharing.

> Here are logs (all values are in hex):
> 
> next-20250128 (probe broken):
> root@target:~# dmesg | grep regmap
> [   14.817604] regmap_write reg 80ee <- 1
> [   14.823036] regmap_read reg 8100 -> 0
> [   14.827631] regmap_read reg 8101 -> 0
> [   14.832130] regmap_read reg 8102 -> 0



> next-20250128 + 1fd60ed1700c reverted (probe okay):
> root@target:~# dmesg | grep regmap
> [   13.565920] regmap_write reg 80ee <- 1
> [   13.567509] regmap_read reg 8100 -> 17
> [   13.568219] regmap_read reg 8101 -> 4
> [   13.568909] regmap_read reg 8102 -> 93

Something is missing here. Like we have an identical start and an immediate
failure. If you did it via printk() approach, it's probably wrong as my patch
uses internal regmap function. Most likely you need to enable trace events
for regmap and collect those for let's say 2 seconds:

	echo 1 > ...trace events...
	modprobe ...
	sleep 2
	echo 0 > ...trace events...

and dump the buffer to a file. It might have though more than needed
as some other devices might also use regmap at the same time. I don't remember
if the trace events for regmap have a device instance name field which can be
used as a filter.

Alternatively you may also try to add a printk() into regmap core, but I don't
think it's more practical than trace events.

-- 
With Best Regards,
Andy Shevchenko


