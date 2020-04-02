Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A14BB19BE19
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 10:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB05A6EA18;
	Thu,  2 Apr 2020 08:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2916EA18
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 08:52:26 +0000 (UTC)
IronPort-SDR: jYK8pWaeQHg96/5mcvavgxp0WuqhHO22u62A9T3BfThUFwDbTlHshCdOrPCuC+dsS+yHK2Kphh
 KfvPKh7k0rMg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 01:52:26 -0700
IronPort-SDR: lSTxC31/lHPveE8rO2r7/yKYE2gQkKeyi8aH5qvCKS22HS/1Hd4IKGn+ruHLVGhkTUBclS8gPv
 35cNGLbs1wsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,335,1580803200"; d="scan'208";a="240768676"
Received: from tronach-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com)
 ([10.252.38.191])
 by fmsmga007.fm.intel.com with ESMTP; 02 Apr 2020 01:52:22 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
 id 0668121F19; Thu,  2 Apr 2020 11:52:16 +0300 (EEST)
Date: Thu, 2 Apr 2020 11:52:16 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 1/1] lib/vsprintf: Add support for printing V4L2 and DRM
 fourccs
Message-ID: <20200402085216.GC1522@kekkonen.localdomain>
References: <20200401140522.966-1-sakari.ailus@linux.intel.com>
 <87eet6mgk7.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87eet6mgk7.fsf@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hverkuil@xs4all.nl, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, mchehab@kernel.org,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Moi,

On Thu, Apr 02, 2020 at 11:34:48AM +0300, Jani Nikula wrote:
> On Wed, 01 Apr 2020, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > Add a printk modifier %ppf (for pixel format) for printing V4L2 and DRM
> > pixel formats denoted by 4ccs. The 4cc encoding is the same for both so
> > the same implementation can be used.
> 
> I'm not going to take a strong stand in one way or the other regarding
> the patch at hand, but I do think at some point we have to draw a line
> what should be included in printk formats. Arguably they should be
> reserved to things that are generally useful across large parts of the
> kernel, right?
> 
> I think the more specialized you get, the more you should think about
> just using the plain old %s, and your own helpers. Because frankly, the
> kernel printk specifiers also start getting more than a little obscure.

I don't really disagree... While this is functionality very commonly needed
in drivers, there are alternatives such as posted here:

<URL:https://lore.kernel.org/linux-media/20190916100433.24367-1-hverkuil-cisco@xs4all.nl/>

The 4cc codes added by this set is still relatively generic (while still
Linux subsystem specific and not related to e.g. hardware standards), but I
wonder how many other, possibly similar cases there could be in the kernel,
and how many new specifiers we might get with those all added.

For what it's worth, even C99 defines macros for printing some formats
such as PRIu64 for uint64_t.

-- 
Terveisin,

Sakari Ailus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
