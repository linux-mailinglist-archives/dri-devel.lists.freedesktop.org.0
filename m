Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D60C9491C
	for <lists+dri-devel@lfdr.de>; Sun, 30 Nov 2025 00:41:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E086410E22F;
	Sat, 29 Nov 2025 23:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="pSXtdplp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651EF10E218;
 Sat, 29 Nov 2025 23:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=hh84OO8GDGioMHVuU15qRxGnztTlPm7zWtk9ta/Y+Yo=; b=pSXtdplp3ng8Hcy3TODJbEoRcL
 I1rX0aVrIOwQD+ozA0c+p2Y9AZHC1zUcE/ZGTmkilBoLVOoz3u9LYFUhb+0BKIBgNMicgNMpFumBF
 2p9Ojxkcay4snVxTypgXSvqtzQuPN77LsKMTgkrOcd9jUJ2f0U+Gj5ZQHRbloEIJia2dMUOOVDntq
 eA9lVjnVjlfFj01/jzU1WmIS/yo1E/JOg+JkHRDVJGukINIsGxmRfK3cS0l42BOoYex3l9sxP5PTT
 LNRrfJ148moI7dxPKeq/I7ftykxMyQWD0Efo11DThw8lBagWofKWnB+B1rVmXTJlqC8ium7lGm5Va
 zUMmFdpQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vPUYc-00000001sCH-3mX3; Sat, 29 Nov 2025 23:40:50 +0000
Message-ID: <d88fe23b-dbe2-4084-80b6-52c79a6d94e1@infradead.org>
Date: Sat, 29 Nov 2025 15:40:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] kernel.h: drop STACK_MAGIC macro
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Ingo Molnar <mingo@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
References: <20251129195304.204082-1-yury.norov@gmail.com>
 <20251129195304.204082-2-yury.norov@gmail.com>
 <aStYXphpN84Nr8LZ@smile.fi.intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aStYXphpN84Nr8LZ@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 11/29/25 12:32 PM, Andy Shevchenko wrote:
> On Sat, Nov 29, 2025 at 02:53:00PM -0500, Yury Norov (NVIDIA) wrote:
>> The macro is only used by i915. Move it to a local header and drop from
>> the kernel.h.
> 
> Agree, if one wants to reinstate it, there should be better place for it
> (something related to kasan?).

or <linux/poison.h>

> FWIW,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy
