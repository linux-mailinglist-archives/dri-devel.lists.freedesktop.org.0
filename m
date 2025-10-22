Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66104BFA0E3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 07:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BBA10E0CE;
	Wed, 22 Oct 2025 05:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FM14vIVZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D29010E0CE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 05:28:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2A95640544;
 Wed, 22 Oct 2025 05:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0A7C4CEE7;
 Wed, 22 Oct 2025 05:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1761110933;
 bh=3Ff1ASD4+Th70oO4lsVjO5rTjRYPN1ABVSR9uE5fR7g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FM14vIVZxOjSYglNeWLtEEHC/JxTP6WKADZiXeEpooRHBfSgLL7xWxg3sOb153DAq
 2pZWBHKtdv9BrP51l3fR4tZ1vO+Uln8WBZL+cRDwi9j43/9iL+LN4DoRCxeXHEQ8Td
 m9xJk81/wmEAOKIg9POnRuKi5sA0uGkVQlCKJfzA=
Date: Wed, 22 Oct 2025 07:28:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, Nick Bowler <nbowler@draconx.ca>,
 Douglas Anderson <dianders@chromium.org>, Dave Airlie <airlied@redhat.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 6.17 040/159] drm/ast: Blank with VGACR17 sync enable,
 always clear VGACRB6 sync off
Message-ID: <2025102235-pediatric-sandlot-f2de@gregkh>
References: <20251021195043.182511864@linuxfoundation.org>
 <20251021195044.163217433@linuxfoundation.org>
 <499eb508-5f24-4ef4-a2a3-f3d76d89db66@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <499eb508-5f24-4ef4-a2a3-f3d76d89db66@leemhuis.info>
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

On Wed, Oct 22, 2025 at 06:49:21AM +0200, Thorsten Leemhuis wrote:
> On 10/21/25 21:50, Greg Kroah-Hartman wrote:
> > 6.17-stable review patch.  If anyone has any objections, please let me know.
> > 
> > ------------------
> > 
> > From: Thomas Zimmermann <tzimmermann@suse.de>
> > 
> > commit 6f719373b943a955fee6fc2012aed207b65e2854 upstream.
> > 
> > Blank the display by disabling sync pulses with VGACR17<7>. Unblank
> > by reenabling them. This VGA setting should be supported by all Aspeed
> > hardware.
> 
> TWIMC, a regression report about 6.18-rc2 that was bisected to this
> commit just came in:
> 
> https://lore.kernel.org/all/a40caf8e-58ad-4f9c-af7f-54f6f69c29bb@googlemail.com/
> 
> To quote:
> 
> """
> I have encountered a serious (for me) regression with 6.18-rc2 on my
> 2-socket Ivy Bridge Xeon E5-2697 v2 server. After
> booting, my console screen goes blank and stays blank. 6.18-rc1 was
> still fine.
> 
> [...]
> 
> When I revert this from 6.18-rc2, the issue goes away and my console
> screen works again.
> """

Thanks, I'll go drop this patch from the stable queues for now.

greg k-h
