Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4ED494254
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 22:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289C110E1C8;
	Wed, 19 Jan 2022 21:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9632810E1D0;
 Wed, 19 Jan 2022 21:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642626331; x=1674162331;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3TDiFifv04AcCVYzOm6HZ64dJH3KSAV3f2PXyUIwWhM=;
 b=EhcDk7iWSYY8RHR7iC/JCqn798xGRTdfZBv6WIp8TDO20oeHL7rWRgvs
 lL9z8P6z/wUvQyq9QyqETGltxZPZBXPKM/KeO08/UlvIpMIQeupCLTQXo
 OHEGCE1PIzN7evxX9GHkYUl6mFHUDCDzezoXsseyS5biKxab/LCpUO0nL
 pKc1HL3dsC9H8pelyMUqwayy7DOMn93dc/uidOShLcpct5LmCBy4IC7H3
 UATYT/IbQV7K2+aqd2CoJAGn+N+d2YCZI++b/VmoUsMj0MFKjPwQXe/GS
 /fuwLb5LTwoiWFZJci4QQe4fIozp6PjvWVgsdYfpxPQJM+wdjv/kXZ+bg w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="244012662"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="244012662"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 13:05:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="765084718"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 13:05:17 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nAI7i-00CH8V-7G; Wed, 19 Jan 2022 23:04:06 +0200
Date: Wed, 19 Jan 2022 23:04:05 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 1/3] lib/string_helpers: Consolidate yesno() implementation
Message-ID: <Yeh8xRCcR7D1xdxz@smile.fi.intel.com>
References: <20220119072450.2890107-1-lucas.demarchi@intel.com>
 <20220119072450.2890107-2-lucas.demarchi@intel.com>
 <YefXg03hXtrdUj6y@paasikivi.fi.intel.com>
 <20220119100635.6c45372b@gandalf.local.home>
 <YehllDq7wC3M2PQZ@smile.fi.intel.com>
 <20220119160017.65bd1fa5@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119160017.65bd1fa5@gandalf.local.home>
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

On Wed, Jan 19, 2022 at 04:00:17PM -0500, Steven Rostedt wrote:
> On Wed, 19 Jan 2022 21:25:08 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > > I say keep it one line!
> > > 
> > > Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>  
> > 
> > I believe Sakari strongly follows the 80 rule, which means...
> 
> Checkpatch says "100" I think we need to simply update the docs (the
> documentation always lags the code ;-)

The idea of checkpatch change is for old code to avoid tons of patches
to satisfy 80 rule in (mostly) staging code. Some maintainers started /
have been using relaxed approach.

-- 
With Best Regards,
Andy Shevchenko


