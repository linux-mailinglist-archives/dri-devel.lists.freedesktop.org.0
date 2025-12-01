Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0E3C98EA3
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 20:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D098510E463;
	Mon,  1 Dec 2025 19:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="u6oxBj1y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A8F10E463;
 Mon,  1 Dec 2025 19:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=lHFArRupasM7BNvHKiWIXC1PtoLVsBgVkotkW/Jg0vE=; b=u6oxBj1yUwATRFTDdYOpfVGxNH
 nfBDfRZ79bvzO25OH0JEDj5iD7Y9at48ZJQEv59Nh7X1bgBjPn94CfuypMXEszeorwuglgjhz9R5g
 Qp8AeZsMQ0ywDxRmddmVIFtqN8x/QWirQpLfvgvZypbQL3c8dAXHYnDYXfbCPe1MZM4Mrbaev1oxt
 7It7xFoTGWvxes7VfG9HNAKuKaKehi61gs8rAZuYO1dfCjrubFxTo3ty14U1dDdcqQ4BhJg+dr8mR
 qXyDzUkMj+mMe/GgFrPiX2+uqeSRGP3cI+4uD3L5/uLFDuIX4/mTWJN1z1xZtPSw8MmCTQ5/Zx6Er
 hP5oryyw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vQ9vh-00000004TXb-3UWY; Mon, 01 Dec 2025 19:51:25 +0000
Message-ID: <fd755bbf-50a8-46f7-bff1-61cc625118a9@infradead.org>
Date: Mon, 1 Dec 2025 11:51:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] kernel.h: move VERIFY_OCTAL_PERMISSIONS() to sysfs.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Yury Norov <yury.norov@gmail.com>
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
 <20251129195304.204082-3-yury.norov@gmail.com>
 <aStWkK6exUj9YEC1@smile.fi.intel.com>
 <e0d34a20-7547-4788-8449-95fcd5588434@infradead.org> <aSyCC7TQoGgTn2rT@yury>
 <aSydSI-h3KZiYBn6@smile.fi.intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aSydSI-h3KZiYBn6@smile.fi.intel.com>
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



On 11/30/25 11:38 AM, Andy Shevchenko wrote:
> On Sun, Nov 30, 2025 at 12:42:35PM -0500, Yury Norov wrote:

>> This series was tested by 0-day and LKP. 0-day runs allyesconfig,
> 
> AFAICS in the below no configuration had been tested against allYESconfig.
> All of them are allNOconfig.
> 
>> as far as I know. It only sends email in case of errors. LKP is OK, find the
>> report below.
> 
>> All but XFS include it via linux/module.h -> linux/moduleparam.h path.
>> XFS has a linkage layer: xfs.h -> xfs_linux.h-> linux/module.h, so
>> it's pretty much the same.
>>
>> I think, module.h inclusion path is OK for this macro and definitely
>> better than kernel.h. Notice, none of them, except for vgpu_dbg,
>> include kernel.h directly.
> 
> Ideally those (especially and in the first place headers) should follow IWYU
> principle and avoid indirect (non-guaranteed) inclusions.

Can you (or anyone) get IWYU (software) to work?
I tried it a few months ago but didn't have the correct magic
incantation for it.
(no specifics at the moment)

-- 
~Randy

