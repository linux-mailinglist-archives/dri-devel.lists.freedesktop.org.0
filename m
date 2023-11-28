Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 859767FB410
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 09:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71F210E450;
	Tue, 28 Nov 2023 08:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF1810E450
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 08:28:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F0E52CE19B1;
 Tue, 28 Nov 2023 08:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1126C433C8;
 Tue, 28 Nov 2023 08:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1701160131;
 bh=zYAML8pYZVkNA1Zvcok1nkSUd7fnE1Gq5rdjaPq3ww0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tzsig0lxGo6SKlj0UyjU5aDnvHQnK2a3qp8WyigMAXZ9HVhmGGlz+tC4bFvq79Rmr
 bjZKA3kTHiBeXvn8Q97tAOWHcNKwtpY9P4nPl95lecyvFLDaieG68CVqJX5Hj8o+5t
 BmR4z6SDCdR/m7thC/Y3tjcnkhBFiVxOg2FyseWM=
Date: Tue, 28 Nov 2023 08:28:48 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/3] Revert panel fixes and original buggy patch
Message-ID: <2023112811-abide-oversold-922f@gregkh>
References: <20231128-revert-panel-fix-v1-0-69bb05048dae@linaro.org>
 <20231127232542.GB25590@pendragon.ideasonboard.com>
 <CACRpkdYWjHbgWQc46hGM3bg+5nf4NiveEZJmHrnx0X-=XsUDLA@mail.gmail.com>
 <20231127235244.GD31314@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127235244.GD31314@pendragon.ideasonboard.com>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 01:52:44AM +0200, Laurent Pinchart wrote:
> On Tue, Nov 28, 2023 at 12:36:15AM +0100, Linus Walleij wrote:
> > On Tue, Nov 28, 2023 at 12:25 AM Laurent Pinchart wrote:
> > > On Tue, Nov 28, 2023 at 12:10:18AM +0100, Linus Walleij wrote:
> > > > This series reverts the attempts to fix the bug that went
> > > > into v6.7-rc1 in commit 199cf07ebd2b
> > > > "drm/bridge: panel: Add a device link between drm device and panel device"
> > > > and then it reverts that patch as well.
> > > >
> > > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > > > ---
> > > > Linus Walleij (3):
> > > >       Revert "driver core: Export device_is_dependent() to modules"
> > > >       Revert "drm/bridge: panel: Check device dependency before managing device link"
> > > >       Revert "drm/bridge: panel: Add a device link between drm device and panel device"
> > >
> > > To preserve bisectability, you should revert in the opposite order.
> > 
> > You mean apply patch 2, then 1, then 3 so the kernel builds after each
> > revert?
> > 
> > Yeah that's a good idea, I don't know if I should apply these though, better
> > someone else do it since I screwed up too much.
> > 
> > Another option is to just squash the reverts into one, that bisects too :/
> 
> I thought the commits have been applied to drm-misc in a bisectable
> order in the first place, but that doesn't seem to be the case :-(
> Reverting "driver core: Export device_is_dependent() to modules" last
> seems to be the best option in this case. I wouldn't squash them.

Agreed, don't squash, just revert in the opposite order they were
applied in originally, that way the tree can always build.

thanks,

greg k-h
