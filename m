Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A4ECF5310
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 19:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFBA10E3FB;
	Mon,  5 Jan 2026 18:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LAIw0nam";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90ECD10E3FB
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 18:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767636936; x=1799172936;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=e5epsI/FOBOTiwLsRv0AAFvBevDBQEV2EUy1O+lXnOU=;
 b=LAIw0namx1BC5MPDShU7DeRjbFaF9y+IzS/1Dl3adotTKI/0JIWLLSEo
 Grd+EzVWwsU4wlXhPJFeYxjRiyLpRbuldy6WqC4w0OD8b9vdtMMWDcR8k
 f/jSo2mH9oA7nnvLr70C4LfloGwDmjzmzRoSpX5Hqhdj5KZ55+mg/0VY0
 AgwuHw9Gg6Q1hht49qZbebwxEEe16G+1v3MdAqZQN9O94uxq7lX/O2sTS
 bzspkhOWwvrDp9nhPKXarUwH3ERr5V+ib8pT1QgNX+UqV0QQr4IeWXvwo
 xOi9fV8uZ/AGkUmFvpc9i3nY7DCt8Sj8xruvwB2+O8lUH9M5OjPEmTjb0 w==;
X-CSE-ConnectionGUID: AX8FTLGQR121XnVNDF7jIA==
X-CSE-MsgGUID: VIgVnBGVSpGq2k4siv+uFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69080449"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69080449"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 10:15:35 -0800
X-CSE-ConnectionGUID: uSOsMfyLRZmwsTClLKtk8w==
X-CSE-MsgGUID: 9PS+y98+Rd2JG/y8l6FgfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202917674"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.215])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 10:15:33 -0800
Date: Mon, 5 Jan 2026 20:15:31 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: sun jian <sun.jian.kdev@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 1/4] staging: fbtft: core: avoid large stack usage in
 DT init parsing
Message-ID: <aVv_w643SMuIELDE@smile.fi.intel.com>
References: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
 <20260104110638.532615-2-sun.jian.kdev@gmail.com>
 <aVvmr2qOrFvoEKGV@smile.fi.intel.com>
 <CABFUUZFeO51MW5n1uDp0tcwJeJvgxDRxY3rDqkj2Z-6cO23TwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABFUUZFeO51MW5n1uDp0tcwJeJvgxDRxY3rDqkj2Z-6cO23TwA@mail.gmail.com>
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

On Tue, Jan 06, 2026 at 01:00:33AM +0800, sun jian wrote:

> Thanks for the feedback.

You're welcome, but please, do not top-post!

> You are right: changing the DT init path from write_register() to
> fbtft_write_buf_dc() implicitly assumes "cmd byte + payload bytes" and
> does not preserve the generic write_register() semantics (e.g. regwidth /
> bus-specific handling).I only have clang/arm64 build coverage (no
> access to the actual panels),
> so I can’t provide runtime validation yet. For the remaining 3 driver-local
> patches, all affected drivers have .regwidth = 8 and the sequences are
> “1-byte command + N bytes data” (gamma/LUT). The intent was to avoid the
> huge write_reg() varargs call that triggers -Wframe-larger-than=1024.
> 
> Given the lack of hardware, would you prefer one of the following?

How can you test without hardware at hand?

> 1. Drop the driver changes and instead bump -Wframe-larger-than for these
>    specific objects in the Makefile as an exception; or
> 
> 2. Keep the driver changes but I should provide a detailed test pattern /
>    list of tested devices — if so, what level of detail would be acceptable
>    (exact panel model + wiring/bus type + expected output), and is “build-only”
>    ever sufficient for warning-only changes in fbtft?
> 
> Happy to follow the approach you think is appropriate for this staging driver.

I already explained in the response to the cover letter. Please, read it.

> On Tue, Jan 6, 2026 at 12:28 AM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> >
> > On Sun, Jan 04, 2026 at 07:06:35PM +0800, Sun Jian wrote:
> > > Clang reports a large stack frame for fbtft_init_display_from_property()
> > > (-Wframe-larger-than=1024) when the init sequence is emitted through a
> > > fixed 64-argument write_register() call.
> > >
> > > write_reg()/write_register() relies on NUMARGS((int[]){...}) and large
> > > varargs which inflates stack usage. Switch the DT "init" path to send the
> > > command byte and the payload via fbtft_write_buf_dc() instead.
> > >
> > > No functional change intended: the same register values are sent in the
> > > same order, only the transport is changed.
> >
> > How did you test this?

...

> > > -                     par->fbtftops.write_register(par, i,
> > > -                             buf[0], buf[1], buf[2], buf[3],
> > > -                             buf[4], buf[5], buf[6], buf[7],
> > > -                             buf[8], buf[9], buf[10], buf[11],
> > > -                             buf[12], buf[13], buf[14], buf[15],
> > > -                             buf[16], buf[17], buf[18], buf[19],
> > > -                             buf[20], buf[21], buf[22], buf[23],
> > > -                             buf[24], buf[25], buf[26], buf[27],
> > > -                             buf[28], buf[29], buf[30], buf[31],
> > > -                             buf[32], buf[33], buf[34], buf[35],
> > > -                             buf[36], buf[37], buf[38], buf[39],
> > > -                             buf[40], buf[41], buf[42], buf[43],
> > > -                             buf[44], buf[45], buf[46], buf[47],
> > > -                             buf[48], buf[49], buf[50], buf[51],
> > > -                             buf[52], buf[53], buf[54], buf[55],
> > > -                             buf[56], buf[57], buf[58], buf[59],
> > > -                             buf[60], buf[61], buf[62], buf[63]);
> > > +                     /* buf[0] is command, buf[1..i-1] is data */
> > > +                     ret = fbtft_write_buf_dc(par, &buf[0], 1, 0);
> > > +                     if (ret < 0)
> > > +                             goto out_free;
> > > +
> > > +                     if (i > 1) {
> > > +                             ret = fbtft_write_buf_dc(par, &buf[1], i - 1, 1);
> > > +                             if (ret < 0)
> > > +                                     goto out_free;
> > > +                     }
> >
> > I believe this is incorrect change and has not to be applied. write !=
> > write_register. Without any evidence of testing, definite NAK to it.
> > Otherwise, please provide detailed testing pattern and which devices were
> > tested.

-- 
With Best Regards,
Andy Shevchenko


