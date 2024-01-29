Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 642828400E8
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 10:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C28910F69B;
	Mon, 29 Jan 2024 09:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A9010F69B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 09:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706519269; x=1738055269;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=msuiibqFBcGfMgzA/fC14fkBPBHd7u1JVKZzOwMA6L0=;
 b=EpC6GTJPEFrBY3j4uMsQQSyMtlU0Lt8uqNm2BqWamkTPIdMI++13IG6R
 4QZgVcolVOGUQdzJxf26mbEmGV/7g07E7sWHuj1D0gBDUrMV0kRi/7GtJ
 aH0NVfRg+qS2nvpPLM6xmcqDY6ccPloIFQkXj9ogCSmW/E55p4TSIYwKT
 A095MQJriI45GCeJu3cYLtcqW9XN4W1utD9jgXUTE5Gc2r5epuFNGagM4
 rvAFQhLsA+gTn/Cu+pTTB9H1b+59BYG1pneGMC5y/Ecg2WBYQ8zB2O85D
 SyQ7yWBLrZYlt/wvfqWvpnlTeqwSGsNDX19SGvfiX1LTwiiKkSiAls4Ro w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="2724893"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="2724893"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 01:07:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="3407220"
Received: from hbrandbe-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.53])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 01:07:42 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: David Laight <David.Laight@ACULAB.COM>, "'linux-kernel@vger.kernel.org'"
 <linux-kernel@vger.kernel.org>, 'Linus
 Torvalds' <torvalds@linux-foundation.org>, 'Netdev'
 <netdev@vger.kernel.org>, "'dri-devel@lists.freedesktop.org'"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH next 10/11] block: Use a boolean expression instead of
 max() on booleans
In-Reply-To: <b564df3f987e4371a445840df1f70561@AcuMS.aculab.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <0ca26166dd2a4ff5a674b84704ff1517@AcuMS.aculab.com>
 <b564df3f987e4371a445840df1f70561@AcuMS.aculab.com>
Date: Mon, 29 Jan 2024 11:07:38 +0200
Message-ID: <87sf2gjyn9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: 'Jens Axboe' <axboe@kernel.dk>,
 "'Matthew Wilcox \(Oracle\)'" <willy@infradead.org>,
 'Christoph Hellwig' <hch@infradead.org>,
 'Dan Carpenter' <dan.carpenter@linaro.org>,
 'Andrew Morton' <akpm@linux-foundation.org>,
 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>,
 "'David S . Miller'" <davem@davemloft.net>,
 "'linux-btrfs@vger.kernel.org'" <linux-btrfs@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 28 Jan 2024, David Laight <David.Laight@ACULAB.COM> wrote:
> blk_stack_limits() contains:
> 	t->zoned =3D max(t->zoned, b->zoned);
> These are bool, so it is just a bitwise or.

Should be a logical or, really. And || in code.

BR,
Jani.


> However it generates:
> error: comparison of constant =C3=A2=E2=82=AC=CB=9C0=C3=A2=E2=82=AC=E2=84=
=A2 with boolean expression is always true [-Werror=3Dbool-compare]
> inside the signedness check that max() does unless a '+ 0' is added.
> It is a shame the compiler generates this warning for code that will
> be optimised away.
>
> Change so that the extra '+ 0' can be removed.
>
> Signed-off-by: David Laight <david.laight@aculab.com>
> ---
>  block/blk-settings.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/block/blk-settings.c b/block/blk-settings.c
> index 06ea91e51b8b..9ca21fea039d 100644
> --- a/block/blk-settings.c
> +++ b/block/blk-settings.c
> @@ -688,7 +688,7 @@ int blk_stack_limits(struct queue_limits *t, struct q=
ueue_limits *b,
>  						   b->max_secure_erase_sectors);
>  	t->zone_write_granularity =3D max(t->zone_write_granularity,
>  					b->zone_write_granularity);
> -	t->zoned =3D max(t->zoned, b->zoned);
> +	t->zoned =3D t->zoned | b->zoned;
>  	return ret;
>  }
>  EXPORT_SYMBOL(blk_stack_limits);

--=20
Jani Nikula, Intel
