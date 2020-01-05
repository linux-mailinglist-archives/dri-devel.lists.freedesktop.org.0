Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB29130E6E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 09:10:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A87689DFF;
	Mon,  6 Jan 2020 08:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8A56C89FE6
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jan 2020 20:37:08 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 0479E80E2;
 Sun,  5 Jan 2020 20:37:48 +0000 (UTC)
Date: Sun, 5 Jan 2020 12:37:04 -0800
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, "H . Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>,
 Matthijs van Duin <matthijsvanduin@gmail.com>
Subject: Re: [PATCH] drm/omap: gem: Fix tearing with BO_TILED
Message-ID: <20200105203704.GD5885@atomide.com>
References: <20191221005711.47314-1-tony@atomide.com>
 <20191221164141.GI35479@atomide.com>
 <20200104050950.GA11429@chinchilla>
 <20200104055011.GA5885@atomide.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200104055011.GA5885@atomide.com>
X-Mailman-Approved-At: Mon, 06 Jan 2020 08:09:58 +0000
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

Hi,

* Tony Lindgren <tony@atomide.com> [200104 05:51]:
> 
> Just changing the alingment fixes the issue. Looks like the minimum
> alignment we currently allow is 128, I think 512 was the minimum
> that worked for me, so maybe the right fix would be to just change
> the minimum to 512 with no specific need to use 4096 for now.

So Matthijs and I chatted about this a bit on irc, and here's what
we concluded so far:

1. We have at least three different alignment needs for tiler

- Linux use of tiler aligned to 128 bytes

- SGX use of tiler aligned to 4096 bytes (or 512 bytes?)

- Fast userspace mapping aligned to 4096 bytes

2. The alignment need may need to be configured by the tiler consumer
   in #1 above

3. The alignment need for SGX seems to be based on SGX MMU page size

4. The issue I'm seeing with stellarium on droid4 may be a stride
   issue as about one out of 3 or 4 frames is OK and aligning to
   512 also fixes the issue maybe because it happens to make
   multiple frames align to 4096

So let's wait on this patch until we have more info and know how
the different alignments should be handled.

Regards,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
