Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693B560A18D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 13:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E53E10E3D0;
	Mon, 24 Oct 2022 11:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE76C10E3D0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:27:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 02885611D5;
 Mon, 24 Oct 2022 11:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 131A5C433C1;
 Mon, 24 Oct 2022 11:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1666610869;
 bh=K48NBAqgWRo1mETUSlqGN+xaE/Pq/ZahWJY6fwSb5EA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T56euOfBdEzjb+7ecAQnQL6UYh4mtgXlASkJmeiRtnBSCVX1odBlUG03sdqb0BjAh
 mGxZH7FIH56a9eHvffUiIa/Pl8ai+HV5TK3ebKF16V0VcqOtCTw0+1wn7DpNXovgPj
 UhzsVx4Xcu5lnaWnKhEu3i1eU0KFehGLs/fLErYs=
Date: Mon, 24 Oct 2022 13:27:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [Regression] CPU stalls and eventually causes a complete system
 freeze with 6.0.3 due to "video/aperture: Disable and unregister sysfb
 devices via aperture helpers"
Message-ID: <Y1Z2sq9RyEnIdixD@kroah.com>
References: <bbf7afe7-6ed2-6708-d302-4ba657444c45@leemhuis.info>
 <668a8ffd-ffc7-e1cc-28b4-1caca1bcc3d6@suse.de>
 <958fd763-01b6-0167-ba6b-97cbd3bddcb6@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <958fd763-01b6-0167-ba6b-97cbd3bddcb6@leemhuis.info>
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
Cc: Sasha Levin <sashal@kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andreas <andreas.thalhammer@linux.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 24, 2022 at 12:41:43PM +0200, Thorsten Leemhuis wrote:
> Hi! Thx for the reply.
> 
> On 24.10.22 12:26, Thomas Zimmermann wrote:
> > Am 23.10.22 um 10:04 schrieb Thorsten Leemhuis:
> >>
> >> I noticed a regression report in bugzilla.kernel.org. As many (most?)
> >> kernel developer don't keep an eye on it, I decided to forward it by
> >> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216616  :
> >>
> >>>   Andreas 2022-10-22 14:25:32 UTC
> >>>
> >>> Created attachment 303074 [details]
> >>> dmesg
> > 
> > I've looked at the kernel log and found that simpledrm has been loaded
> > *after* amdgpu, which should never happen. The problematic patch has
> > been taken from a long list of refactoring work on this code. No wonder
> > that it doesn't work as expected.
> > 
> > Please cherry-pick commit 9d69ef183815 ("fbdev/core: Remove
> > remove_conflicting_pci_framebuffers()") into the 6.0 stable branch and
> > report on the results. It should fix the problem.
> 
> Greg, is that enough for you to pick this up? Or do you want Andreas to
> test first if it really fixes the reported problem?

This should be good enough.  If this does NOT fix the issue, please let
me know.

thanks,

greg k-h
