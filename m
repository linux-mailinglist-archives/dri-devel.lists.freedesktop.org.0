Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 022349F1355
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 18:11:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B3210F0B2;
	Fri, 13 Dec 2024 17:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GkxOFPVD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3584410F0AD;
 Fri, 13 Dec 2024 17:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734109874; x=1765645874;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=43lcs1+73oMcgYgVNa8OI3qmg7j0TEA5KYxken4+b0I=;
 b=GkxOFPVDo+0aPYwy7ad6SkQ2luH3OYIZy/eD47jBuGp6E3yBJToWjZPt
 FlFH2mgqhYHJLu9E/9yfVjbajw/0plskprwaPHPy4FC0V/2vei3P2WBrt
 8PXkj3e4gAWgY0wAwmua0/Rkc13v60rc5Cni30gpnhj57omPVeMl6h8hk
 TUqUMuyKmscjpPNsUU0LZlrOexktcPGxVnXrhhA5jterdoW7n4iU/n6vp
 FrpArLw7QIATo+2qIci7MpUqBxjeGjIpkAPC2cpNT9y6KBBZR+ICpSRxM
 uhbJatHwZFtbbrKIY8XesjcAdbHegXbho2BhuReAk1L1yIOnBO9cffynV g==;
X-CSE-ConnectionGUID: mV1y3PioTbKuytia316epg==
X-CSE-MsgGUID: Lnu/1RboTl6t6WgQgYakRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45576426"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45576426"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 09:11:14 -0800
X-CSE-ConnectionGUID: THz8Mw9lT1KULhWa98pHdg==
X-CSE-MsgGUID: 088O5EVCSju/YnpNX2zO4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101560852"
Received: from smile.fi.intel.com ([10.237.72.154])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 09:11:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tM9Bx-00000007Q2C-0sOT; Fri, 13 Dec 2024 19:11:05 +0200
Date: Fri, 13 Dec 2024 19:11:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Kalle Valo <kvalo@kernel.org>, Petr Mladek <pmladek@suse.com>,
 Yafang Shao <laoar.shao@gmail.com>, torvalds@linux-foundation.org,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-wireless@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ocfs2-devel@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH 1/7] vsprintf: Add %pTN to print task name
Message-ID: <Z1xqqENp6n6HZ_gM@smile.fi.intel.com>
References: <20241213054610.55843-1-laoar.shao@gmail.com>
 <20241213054610.55843-2-laoar.shao@gmail.com>
 <Z1vq2-V7vB5KhBR9@pathway.suse.cz> <87r06crnew.fsf@kernel.org>
 <20241213132709.GAZ1w2LW4LgHi-6XfZ@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213132709.GAZ1w2LW4LgHi-6XfZ@fat_crate.local>
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

On Fri, Dec 13, 2024 at 02:27:09PM +0100, Borislav Petkov wrote:
> On Fri, Dec 13, 2024 at 10:35:03AM +0200, Kalle Valo wrote:
> > I agree, it makes the code harder to read for someone who is not
> > familiar with all the %p magic we have (like me).

> +1

And me too. In case one thinks of unprintable characters, %pE is for that.


-- 
With Best Regards,
Andy Shevchenko


