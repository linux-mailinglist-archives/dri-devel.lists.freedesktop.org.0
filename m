Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07967FA056
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF57710E08D;
	Mon, 27 Nov 2023 13:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FFF10E08D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:08:38 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id B09F1604AC;
 Mon, 27 Nov 2023 13:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1701090517;
 bh=cgT3yGEsBF6QOKQZf/lmHN1DxtY/WoY3R7KwVz7L6Cc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cFvblgh1AjwkswjQyhQqYHOCXtRVsYR6TKEZW1dcSX8lQZ3F4h1W7+9+5EIpKbcb3
 Uh2TEI2YD5yVkFY6SjZE0UcwzK+04yUYq3FFSuMo+vnRBOx/NmhddUNLZ5v8jGYBx2
 5vnngIgzCK1veFjC1rc7qxPZBLZxac6xPgNkzATgr61LaYoPB3pnCi5dy9mC2IK0WO
 0bJ8XHfDQJcgeOl7OpTWwuYH26sK3bSN5I25YbEtgNeqGXsEBiRSc0rBHTpQA/kn+1
 hgqOiDKxZcM/jxWeiejkwM8w3o653t6/o1o8qdtbDDnNx6FGHJGZWKUzel+72eYJVR
 KAeOLdQ6TxUpA==
Date: Mon, 27 Nov 2023 15:07:46 +0200
From: Tony Lindgren <tony@atomide.com>
To: Michael Walle <mwalle@kernel.org>, Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH 1/6] dt-bindings: tc358775: Add support for tc358765
Message-ID: <20231127130746.GD5166@atomide.com>
References: <20231126163247.10131-1-tony@atomide.com>
 <20231127124430.2153227-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127124430.2153227-1-mwalle@kernel.org>
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
Cc: krzysztof.kozlowski+dt@linaro.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 ivo.g.dimitrov.75@gmail.com, rfoss@kernel.org, jernej.skrabec@gmail.com,
 simhavcs@gmail.com, merlijn@wizzup.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, jonas@kwiboo.se, pavel@ucw.cz, mripard@kernel.org,
 robh+dt@kernel.org, philipp@uvos.xyz, neil.armstrong@linaro.org,
 sre@kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Michael Walle <mwalle@kernel.org> [231127 12:44]:
> Hi,
> 
> > The tc358765 is similar to tc358775 except for the stdby-gpios.
> 
> Bad timing (for me). I'm about to send a bigger patch series for the
> tc358775 which fixes the (completely) broken initialialization. And also
> contains some of your fixes.

OK cool, let's merge patches as needed then. Maybe ack the patches that
can already be merged, and put together some merged set for the rest of
the patches? Or let me know what you prefer, I'll be glad to test and
tweak as needed for tc358765.

> That being said, I intend to make the standby gpio optional also for the
> tc358755, because it might just be hardwired on the board.

OK that sounds good to me.

> But second, I'm really curious if this bridge is working for you correctly
> as it is at the moment. One particular thing I've noticed is that you must
> release the reset while both the clock and the data lanes are in LP11 mode.
> Otherwise, the bridge won't work properly (i.e. horizontally shifted
> picture, or no picture at all).

Yes things are working for me. But then again the bridge is initialized
by the bootloader, and then Android kernel, and then I kexec to the
mainline kernel. And this is with a tc358765 if that might make a
difference.

So I have not seen your reset issue. Andreas may be seeing it on another
tc bridge variant though, so adding Andreas to the loop also.

> What DSI host controller are you using?

This is an old motorola mz617 tablet with a tc358765 bridge, so omapdrm.
I do have one pending patch for omapdrm dsi to change the init order a
bit so tc358765 probes reliably. But seems that's a separate issue from
your reset issue, I'll post that to the lists too to discuss.

What's the dsi host you have? Do you also have some separate i2c eeprom
that's needed for initializing something or is that lcd panel specific?
No idea what the eeprom is really doing here..

Regards,

Tony
