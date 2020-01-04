Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C884913021D
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 12:24:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435986E439;
	Sat,  4 Jan 2020 11:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4F4CE892FB
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2020 05:50:20 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id EA95F8043;
 Sat,  4 Jan 2020 05:50:59 +0000 (UTC)
Date: Fri, 3 Jan 2020 21:50:11 -0800
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, "H . Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>
Subject: Re: [PATCH] drm/omap: gem: Fix tearing with BO_TILED
Message-ID: <20200104055011.GA5885@atomide.com>
References: <20191221005711.47314-1-tony@atomide.com>
 <20191221164141.GI35479@atomide.com>
 <20200104050950.GA11429@chinchilla>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200104050950.GA11429@chinchilla>
X-Mailman-Approved-At: Sat, 04 Jan 2020 11:23:45 +0000
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

* Matthijs van Duin <matthijsvanduin@gmail.com> [200104 05:10]:
> On Sat, Dec 21, 2019 at 08:41:41AM -0800, Tony Lindgren wrote:
> > Also, I'm wondering if this change makes sense alone without the pinning
> > changes for a fix, or if also the pinning changes are needed.
> 
> Both pinning and page-alignment are done just to support the direct
> userspace mapping.  By themselves they mostly just waste tiler memory
> but otherwise don't really have much impact.

OK thanks, so no specific fix, that's the part I was wondering about :)

> It's not really clear to me why you have such interest in this specific
> patch.  Does my patch series fix the tearing issue you've described?  If
> so maybe without my patches tiled memory is just so slow that the frame
> is being submitted too late, which perhaps causes an async page flip
> (does it? I'm not sure) thus resulting in tearing?

Just changing the alingment fixes the issue. Looks like the minimum
alignment we currently allow is 128, I think 512 was the minimum
that worked for me, so maybe the right fix would be to just change
the minimum to 512 with no specific need to use 4096 for now.

I did not see any issue with frame updates being too slow, I just
picked that alignment change manually without trying the rest of
your series.

Regards,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
