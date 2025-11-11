Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BD3C4F297
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 18:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D586010E11C;
	Tue, 11 Nov 2025 17:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="mxIpK6I7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBA510E11C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 17:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
 :Date:subject:date:message-id:reply-to;
 bh=tZoyP+M9xPo/FMe8WDOuLaf2cyBC7RlyzUKhtEPI9nc=; b=mxIpK6I7kAN9KIiGfCR48J8j04
 wUO0r6jU92y2dc0fUGhQCfVXaxMwNdqYsekltmjnfBwZDx4E2zzukpbOuB36oHlKp2keVGURxmbgM
 laLjnj5DtO+QXLk8E+xjZYGl1BIEUvk5ZZ9DJnWyuY4Xb5TjcAHL+tuDBLJHrhK+gtJM=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:43624
 helo=pettiford) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1vIrkb-00064X-2x; Tue, 11 Nov 2025 12:01:49 -0500
Date: Tue, 11 Nov 2025 12:01:48 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-Id: <20251111120148.943a0e193a65469a53a0cbc8@hugovil.com>
In-Reply-To: <20251105222530.979537-1-chris.brandt@renesas.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 * -1.9 NICE_REPLY_A Looks like a legit reply (A)
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,NICE_REPLY_A
 autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH v4 0/2] Remove hard coded values for MIPI-DSI
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
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

Hi Chris,

On Wed,  5 Nov 2025 17:25:28 -0500
Chris Brandt <chris.brandt@renesas.com> wrote:

> When the initial drivers were submitted, some of the timing was hard coded and
> did not allow for any MIPI-DSI panel to be attached.
> In general, panels or bridges can only be supported if MIPI-DSI lanes were 4.
> If the number of lanes were 3,2,1, the math no longer works out.
> 
> A new API was created for the clock driver because the behaivior of the clock
> driver depends on DPI vs MIPI, the bpp, and the number of MIPI lanes.
> 
> 
> Testing:
> * RZ/G2L SMARC  (MIPI-DSI to HDMI bridge, lanes = 4)
> * RZ/G2L-SBC    (MIPI-DSI to LCD panel, lanes = 2)
> * RZ/G2UL SMARC (DPI to HDMI bridge)
> * Multiple monitors, multiple resolutions
> 
> 
> 
> Chris Brandt (2):
>   clk: renesas: rzg2l: Remove DSI clock rate restrictions
>   drm: renesas: rz-du: Set DSI divider based on target MIPI device
> 
>  drivers/clk/renesas/rzg2l-cpg.c               | 147 ++++++++++++++++--
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    |  18 +++
>  include/linux/clk/renesas.h                   |  12 ++
>  3 files changed, 164 insertions(+), 13 deletions(-)
> 
> --
> 2.50.1
 
Your patchset is missing the base-commit tag like in this example:

    base-commit: 4e68ae36422e85ec1a86aded26a211319649426d

This helps when testing to know on which tree/commit you based your
patches.

See "Providing base tree information" here:
    https://docs.kernel.org/process/submitting-patches.html

I just tested your patchset on kernel 6.17.7, and my display no longer
works.

Also tested on torvalds/master tree commit 4427259cc7f7, with similar
results:

    rzg2l-cpg 11010000.clock-controller: hsclk out of range

Hugo.


-- 
Hugo Villeneuve
