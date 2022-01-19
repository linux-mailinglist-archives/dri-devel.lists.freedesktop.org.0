Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A54493708
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 10:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D1310E96D;
	Wed, 19 Jan 2022 09:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C5F10E96D;
 Wed, 19 Jan 2022 09:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642583952; x=1674119952;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Zf7maaT407OcqJiMSYXoEAzMcLY861f8NYGTlKtPnGA=;
 b=ZFNwW0Dd9ESaHoa0UPh0BzF1zqZNveic6/jajEPk6qIJOnltb2XtBENE
 885yBSiun1DGbR2uQ7RjwbCELiS2skBvZQgtW+grFtz7tSYK6b0RBOL/y
 AAIjYSX8rjjSgCN+Hv8SKBxs8xtEQUtwkHI1Y3mf0ZUqdF1Ay8uK9YsMy
 ordGnhWbMpmC1jlKXmhOyE8+ftckvfAD2s515M4FB+5rjVfwwUbaSQN4p
 EajkxxmSlJaQc/l5HNiih7vtpeb8WHIWvqYIuJruGo338HwJ7i4nFZh/P
 e3xZpoctQHC4BqAxceYeKH38QlSoFHVCmEoST1+GVW3rgexoNpDOKK+Vw g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="232388195"
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="232388195"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 01:19:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="622447667"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 01:19:01 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
 by paasikivi.fi.intel.com (Postfix) with SMTP id CEBE0203C8;
 Wed, 19 Jan 2022 11:18:59 +0200 (EET)
Date: Wed, 19 Jan 2022 11:18:59 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/3] lib/string_helpers: Consolidate yesno() implementation
Message-ID: <YefXg03hXtrdUj6y@paasikivi.fi.intel.com>
References: <20220119072450.2890107-1-lucas.demarchi@intel.com>
 <20220119072450.2890107-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119072450.2890107-2-lucas.demarchi@intel.com>
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
 Kentaro Takeda <takedakn@nttdata.co.jp>, Mikita Lipski <mikita.lipski@amd.com>,
 amd-gfx@lists.freedesktop.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Raju Rangoju <rajur@chelsio.com>,
 Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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

Hi Lucas,

On Tue, Jan 18, 2022 at 11:24:48PM -0800, Lucas De Marchi wrote:
> @@ -1354,8 +1345,7 @@ static bool tomoyo_print_condition(struct tomoyo_io_buffer *head,
>  	case 3:
>  		if (cond->grant_log != TOMOYO_GRANTLOG_AUTO)
>  			tomoyo_io_printf(head, " grant_log=%s",
> -					 tomoyo_yesno(cond->grant_log ==
> -						      TOMOYO_GRANTLOG_YES));
> +					 yesno(cond->grant_log == TOMOYO_GRANTLOG_YES));

This would be better split on two lines.

Then,

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
