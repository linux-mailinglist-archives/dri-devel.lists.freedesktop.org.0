Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 074887FAEB6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 00:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C618876A;
	Mon, 27 Nov 2023 23:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2686F10E031
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 23:52:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2212FBEB;
 Tue, 28 Nov 2023 00:52:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1701129123;
 bh=C9lSmPriSk8Tc76cOcwMIOxTOOqylhc2gUk3ucAQ1V4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FD3b28vcSL8lSle4SioXsQNDO1puHVgNTsJSvh2CBllaDucwh/EdrVLjzbWgnHxan
 IbFEd6Ph5h9FqGiFahdXCOuDohY8kV8FvsSQKKQZCeWiMEhtY6YmJ72Y5fmSTvrlDK
 sXNILFju6nh5WtQ9jCg7n29JWh1Tpe3SPZwBJ3ps=
Date: Tue, 28 Nov 2023 01:52:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] Revert panel fixes and original buggy patch
Message-ID: <20231127235244.GD31314@pendragon.ideasonboard.com>
References: <20231128-revert-panel-fix-v1-0-69bb05048dae@linaro.org>
 <20231127232542.GB25590@pendragon.ideasonboard.com>
 <CACRpkdYWjHbgWQc46hGM3bg+5nf4NiveEZJmHrnx0X-=XsUDLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYWjHbgWQc46hGM3bg+5nf4NiveEZJmHrnx0X-=XsUDLA@mail.gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 12:36:15AM +0100, Linus Walleij wrote:
> On Tue, Nov 28, 2023 at 12:25 AM Laurent Pinchart wrote:
> > On Tue, Nov 28, 2023 at 12:10:18AM +0100, Linus Walleij wrote:
> > > This series reverts the attempts to fix the bug that went
> > > into v6.7-rc1 in commit 199cf07ebd2b
> > > "drm/bridge: panel: Add a device link between drm device and panel device"
> > > and then it reverts that patch as well.
> > >
> > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > > ---
> > > Linus Walleij (3):
> > >       Revert "driver core: Export device_is_dependent() to modules"
> > >       Revert "drm/bridge: panel: Check device dependency before managing device link"
> > >       Revert "drm/bridge: panel: Add a device link between drm device and panel device"
> >
> > To preserve bisectability, you should revert in the opposite order.
> 
> You mean apply patch 2, then 1, then 3 so the kernel builds after each
> revert?
> 
> Yeah that's a good idea, I don't know if I should apply these though, better
> someone else do it since I screwed up too much.
> 
> Another option is to just squash the reverts into one, that bisects too :/

I thought the commits have been applied to drm-misc in a bisectable
order in the first place, but that doesn't seem to be the case :-(
Reverting "driver core: Export device_is_dependent() to modules" last
seems to be the best option in this case. I wouldn't squash them.

-- 
Regards,

Laurent Pinchart
