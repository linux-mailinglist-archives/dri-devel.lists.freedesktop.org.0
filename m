Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7CF314C58
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 11:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD5A6EAAD;
	Tue,  9 Feb 2021 10:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376146EAAD
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 10:01:58 +0000 (UTC)
IronPort-SDR: oLnjjPl5rtoT7+keAZgQJzP61w26k4I3GZ1vdsuQl0NpN9NWHFrNqRW9/5lLxPDu88AiRdRFRq
 MNoUJ54oR7wQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="181919580"
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; d="scan'208";a="181919580"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 02:01:57 -0800
IronPort-SDR: rnhFjJZUyagX9l6NkVSwVAXDoAYjA0WCGcS4e8PMLA+skaUN9neEPOnOysaFZHrDDu8mqtWyRN
 FM7iNXXX6yxQ==
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; d="scan'208";a="509823432"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 02:01:54 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1l9PqA-003BrA-CZ; Tue, 09 Feb 2021 12:01:50 +0200
Date: Tue, 9 Feb 2021 12:01:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v6 1/3] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <YCJdjv+NjfTn/KsQ@smile.fi.intel.com>
References: <20210208200903.28084-1-sakari.ailus@linux.intel.com>
 <20210208200903.28084-2-sakari.ailus@linux.intel.com>
 <CAHp75VciFMKrWM2zJZ6dppuL5M-7BLPGQfcnzkd9pQzY1bRWsQ@mail.gmail.com>
 <YCGmD1d1Zn+EhrDH@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCGmD1d1Zn+EhrDH@smile.fi.intel.com>
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
Cc: Petr Mladek <pmladek@suse.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Joe Perches <joe@perches.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 08, 2021 at 10:58:55PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 08, 2021 at 10:43:30PM +0200, Andy Shevchenko wrote:
> > On Mon, Feb 8, 2021 at 10:11 PM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:

...

> __le32 val;
> 
> val = cpu_to_le32(*fourcc & ~BIT(31));
> 
> p += string_escape_mem(&val, sizeof(*fourcc), output, sizeof(output), ESCAPE_NP | ESCAPE_HEX, NULL);

sizeof(val) and as we are discussing in parallel emails something like
skip_trailing_spaces() to be applied after above.

The rationale of the above, that we reuse existing code and existing standard
for the escaping non-printable characters.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
