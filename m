Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2974940F3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 20:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F0510EAB3;
	Wed, 19 Jan 2022 19:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C770210EAB3;
 Wed, 19 Jan 2022 19:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642620900; x=1674156900;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Y7zetMO+F9o9TgvTfnNqU31+rhVBHq60hicGgEyx15I=;
 b=ZvUGnuVcbUE+E8v0nIddyIjtghLwsKMkQLFVRbVFcwqVA3/KAVnqESb3
 eMn6QRjPiwl8iLU76WjK8Ox93erxUg4lU18OLqy8TILTwm+BDMG8z4iy2
 bq+uN72Hl3nFi44N+wwobRgyV1ZapxPdi+9cooAcO+5TmD3U0fYLK37uG
 OFXVjQNO0LUeh+ecVP5z0g5OCqIL+GV3SMYugTvA5ZJQC2R0Q2EFw06Vg
 fK8fw/WK/AoPWtuWhutBvaHIq0plb+BeXfIyrNV0GFhs6jK4T1KkQmLA3
 OaCSO0In8Zjn4wkcQIBop6IY8wYH36jj70ar35KtVOqVertn/ThmT2wkd w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="242734441"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="242734441"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 11:26:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="765057648"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 11:26:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nAGZw-00CEZW-RK; Wed, 19 Jan 2022 21:25:08 +0200
Date: Wed, 19 Jan 2022 21:25:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 1/3] lib/string_helpers: Consolidate yesno() implementation
Message-ID: <YehllDq7wC3M2PQZ@smile.fi.intel.com>
References: <20220119072450.2890107-1-lucas.demarchi@intel.com>
 <20220119072450.2890107-2-lucas.demarchi@intel.com>
 <YefXg03hXtrdUj6y@paasikivi.fi.intel.com>
 <20220119100635.6c45372b@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119100635.6c45372b@gandalf.local.home>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Vishal Kulkarni <vishal@chelsio.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Raju Rangoju <rajur@chelsio.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Eryk Brol <eryk.brol@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 19, 2022 at 10:06:35AM -0500, Steven Rostedt wrote:
> On Wed, 19 Jan 2022 11:18:59 +0200
> Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > On Tue, Jan 18, 2022 at 11:24:48PM -0800, Lucas De Marchi wrote:
> > > @@ -1354,8 +1345,7 @@ static bool tomoyo_print_condition(struct tomoyo_io_buffer *head,
> > >  	case 3:
> > >  		if (cond->grant_log != TOMOYO_GRANTLOG_AUTO)
> > >  			tomoyo_io_printf(head, " grant_log=%s",
> > > -					 tomoyo_yesno(cond->grant_log ==
> > > -						      TOMOYO_GRANTLOG_YES));
> > > +					 yesno(cond->grant_log == TOMOYO_GRANTLOG_YES));  
> > 
> > This would be better split on two lines.
> 
> Really? Yuck!
> 
> I thought the "max line size" guideline was going to grow to a 100, but I
> still see it as 80. But anyway...
> 
> 	cond->grant_log ==
> 	TOMOYO_GRANTLOG_YES
> 
> is not readable at all. Not compared to
> 
> 	cond->grant_log == TOMOYO_GRANTLOG_YES
> 
> I say keep it one line!
> 
> Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

I believe Sakari strongly follows the 80 rule, which means...

> > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

...chose either of these tags and be happy with :-)

-- 
With Best Regards,
Andy Shevchenko


