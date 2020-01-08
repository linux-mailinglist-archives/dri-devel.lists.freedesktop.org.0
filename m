Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACC7135FD1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E77A6E94A;
	Thu,  9 Jan 2020 17:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0521E6E062
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 16:57:19 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 959CB80C5;
 Wed,  8 Jan 2020 16:57:58 +0000 (UTC)
Date: Wed, 8 Jan 2020 08:57:14 -0800
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, "H . Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>
Subject: Re: [PATCH] drm/omap: gem: Fix tearing with BO_TILED
Message-ID: <20200108165714.GI5885@atomide.com>
References: <20191221005711.47314-1-tony@atomide.com>
 <20191221164141.GI35479@atomide.com>
 <20200104050950.GA11429@chinchilla>
 <20200104055011.GA5885@atomide.com>
 <20200105203704.GD5885@atomide.com>
 <20200106180631.GA30670@chinchilla>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200106180631.GA30670@chinchilla>
X-Mailman-Approved-At: Thu, 09 Jan 2020 17:51:28 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Matthijs van Duin <matthijsvanduin@gmail.com> [200106 10:07]:
> On Sun, Jan 05, 2020 at 12:37:04PM -0800, Tony Lindgren wrote:
> > 4. The issue I'm seeing with stellarium on droid4 may be a stride
> >    issue as about one out of 3 or 4 frames is OK and aligning to
> >    512 also fixes the issue maybe because it happens to make
> >    multiple frames align to 4096
> 
> Yeah if your buffers are 960 pixels wide (assuming the droid4's screen
> is natively portrait) and 32bpp then 512-byte alignment suffices to
> automatically make them 4KB alignment.

Hmm sounds like I need to retest this. But doesn't 512-byte alignment
only make the 960 pixels case 2KB aligned?

> The most obvious thing I can think of that could do wrong is that it
> might contiguously map the pages that cover each line, which is what
> will happen if they use e.g. for_each_sg_page, but subsequently assume
> that the stride in sgx virtual memory is ALIGN( width * cpp, PAGE_SIZE )
> without taking the offset of the buffer inside the mapping into account.

OK

> If each line is at most 4KB (i.e. 1024 pixels @ 32bpp) but each line
> straddles an MMU page boundary, then the result would be that the even
> lines of the frame are written to the top half of the buffer, causing it
> to be scaled to 50% vertically, while the odd lines are "lost" (written
> outside the buffer, either to a different buffer or unmapped tiler
> memory).  This sounds like what you described on irc?

Yes this sounds like what I've been seeing.

Regards,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
