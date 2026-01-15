Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0862BD233C1
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 09:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3874310E701;
	Thu, 15 Jan 2026 08:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jWwB+Uce";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450A310E701
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768466837; x=1800002837;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VB3s4Vtnia94BYmzH5RpaIiyd/44mzLETLVflJuTnek=;
 b=jWwB+UceVnl73wW+L2B6M50LSfkmoExxOYL9pwkNHfGKj0G+Ug7MENSm
 CcIlkqw8+BsIY8c5Jzb5czgZJ7BEhA792fJK83kHuTGyotHlNUHuG481j
 GrlBvIFZBQW8+azHCAy/Wr6hZ3NrCtIHFfJodJF+A/g7wSPdE0epHqpSY
 HzQJQ7/n7kdkDKxa2JUHauSSkmIihJ0uEN8qdPZHQQ0v7G3+uwW566IvG
 GFLAO5FWWZwlTa/RFEkHhm79l4KyOXs7iqeXj4C83EdMHDTMQnDpH9NLD
 xRkXxREpIyCujZOgVtUv5hviDJ/C23nmm+xQcb88N8Wt6nw03dc5TlCuQ Q==;
X-CSE-ConnectionGUID: kTDDizClSSaU/cC7503vlg==
X-CSE-MsgGUID: 4Vv9Bj8fQ36PZAMi2s3LpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="92439705"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="92439705"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 00:47:16 -0800
X-CSE-ConnectionGUID: FPdCwKzhQaKIGTXzzgfHew==
X-CSE-MsgGUID: t4H+Il3eRNCelmQ6mJETmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="204111066"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.216])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 00:47:15 -0800
Date: Thu, 15 Jan 2026 10:47:12 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: WooYoung Jeon <chococookieman1@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: replace udelay with usleep_range
Message-ID: <aWipkPM0pwqx3red@smile.fi.intel.com>
References: <20260115084019.28574-1-chococookieman1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115084019.28574-1-chococookieman1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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

On Thu, Jan 15, 2026 at 05:40:19PM +0900, WooYoung Jeon wrote:
> In the fb_ra8875 driver, udelay(100) is used for delay which
> causes busy-waiting. Replacing it with usleep_range(100, 120)
> allows the CPU to sleep during the delay, improving system
> resource efficiency.
> 
> This change was suggested by checkpatch.pl.

Without HW test it's no go. See the previous attempts to "fix" the same place
over and over. (https://lore.kernel.org/ is at your service to dive into mail
archives)

-- 
With Best Regards,
Andy Shevchenko


