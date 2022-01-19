Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF914941FB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 21:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B02710E1C6;
	Wed, 19 Jan 2022 20:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9DE10E177;
 Wed, 19 Jan 2022 20:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642625039; x=1674161039;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZnpQmdGf3petXh8fwqqd+ss75xCdI43Bzq3MlCXD9oc=;
 b=OoyopAln8gSZ5+9Z6e8HJRUl/wWCMW040VUuEITz3WZTw/Xm0IIqr94l
 0wXf4TNcadfWh+cB8tqVKsAxQQ3z9T3eiLmUM4YH3kw1xoWPvlmq7r0Sa
 AJmdcmQ/yD1aCJvWl8QOE/nv8FNCkZ9rA030xHGM8w+OeWQyfqQbAyd8y
 gck7l8Z6iEFib4ir+z29y7aYnOMoAx5usW2E0rYbbea18AOMjZWcSe4sp
 fzGdg1km9N8Gh8Wmbnwa3FLY2kN4tMR/EzbB4CcPemk4CGE5ykdwmR1XH
 oriU669wEmrXx8l1jVH62PiebJbIybU/AwK56rx2FpH1S4rynaPTcs9gU g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="244009806"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="244009806"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 12:43:57 -0800
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="518333103"
Received: from atefehad-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.238.132])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 12:43:56 -0800
Date: Wed, 19 Jan 2022 12:43:56 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [Intel-gfx] [PATCH 1/3] lib/string_helpers: Consolidate yesno()
 implementation
Message-ID: <20220119204356.vizlstcs6wi6kn4b@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220119072450.2890107-1-lucas.demarchi@intel.com>
 <20220119072450.2890107-2-lucas.demarchi@intel.com>
 <YefXg03hXtrdUj6y@paasikivi.fi.intel.com>
 <20220119100635.6c45372b@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220119100635.6c45372b@gandalf.local.home>
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
 Vishal Kulkarni <vishal@chelsio.com>, netdev@vger.kernel.org,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Mikita Lipski <mikita.lipski@amd.com>, Eryk Brol <eryk.brol@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-security-module@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Raju Rangoju <rajur@chelsio.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 19, 2022 at 10:06:35AM -0500, Steven Rostedt wrote:
>On Wed, 19 Jan 2022 11:18:59 +0200
>Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
>> On Tue, Jan 18, 2022 at 11:24:48PM -0800, Lucas De Marchi wrote:
>> > @@ -1354,8 +1345,7 @@ static bool tomoyo_print_condition(struct tomoyo_io_buffer *head,
>> >  	case 3:
>> >  		if (cond->grant_log != TOMOYO_GRANTLOG_AUTO)
>> >  			tomoyo_io_printf(head, " grant_log=%s",
>> > -					 tomoyo_yesno(cond->grant_log ==
>> > -						      TOMOYO_GRANTLOG_YES));
>> > +					 yesno(cond->grant_log == TOMOYO_GRANTLOG_YES));
>>
>> This would be better split on two lines.
>
>Really? Yuck!
>
>I thought the "max line size" guideline was going to grow to a 100, but I
>still see it as 80. But anyway...

Checking that: docs still say 80, but checkpatch was changed to warn
only on 100. Commit bdc48fa11e46 ("checkpatch/coding-style: deprecate
80-column warning") is clear why the discrepancy.

Lucas De Marchi

>
>	cond->grant_log ==
>	TOMOYO_GRANTLOG_YES
>
>is not readable at all. Not compared to
>
>	cond->grant_log == TOMOYO_GRANTLOG_YES
>
>I say keep it one line!
>
>Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
>
>-- Steve
>
>>
>> Then,
>>
>> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>
