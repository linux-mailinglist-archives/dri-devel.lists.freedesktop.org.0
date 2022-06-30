Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA8956162A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 11:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177931136AF;
	Thu, 30 Jun 2022 09:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D75F112E4F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 09:21:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B84ED6202D;
 Thu, 30 Jun 2022 09:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91104C34115;
 Thu, 30 Jun 2022 09:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1656580907;
 bh=axuitQjFtpwc+k2ohCqhScWs+9Cz5t084MKPFGznb+c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aH867f0opGEEwvZZc80T6go20+G3Yh9oIrKFPpp3jSGtJ7mDMa4ij5ZZ1EzrtivFu
 neRXvl2bQO3saPkwLg447zPLs+9XaBpMnYvfuPro0FCEUlL3+DOWmXlLPVS9cFV+QO
 qK8v8vef2QYquuGSp+QSqIMzaqHL4qyph7sxFJQY=
Date: Thu, 30 Jun 2022 11:21:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 5.4 57/60] modpost: fix section mismatch check for
 exported init/exit sections
Message-ID: <Yr1rKDFBA70dbY3M@kroah.com>
References: <20220627111927.641837068@linuxfoundation.org>
 <20220627111929.368555413@linuxfoundation.org>
 <6cd16364-f0cd-b3f3-248f-4b6d585d05ef@gmail.com>
 <CAKwvOdm8UiY8CsqNgyoq4MdC2TbBj-1+cRE+fWZ9+vVBxNZz_Q@mail.gmail.com>
 <20220629053854.GA16297@lst.de>
 <CAKwvOd=S05LN=bDXcWpkpz1NG+C=M4Hd0HW0xcP_hrSsf8Mb9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=S05LN=bDXcWpkpz1NG+C=M4Hd0HW0xcP_hrSsf8Mb9Q@mail.gmail.com>
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Jessica Yu <jeyu@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 29, 2022 at 09:59:25AM -0700, Nick Desaulniers wrote:
> On Tue, Jun 28, 2022 at 10:38 PM Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Tue, Jun 28, 2022 at 12:11:50PM -0700, Nick Desaulniers wrote:
> > > Maybe let's check with Christoph if it's ok to backport bf22c9ec39da
> > > to stable 5.10 and 5.4?
> >
> > I'd be fine with that, but in the end it is something for the relevant
> > maintainers to decide.
> 
> $ ./scripts/get_maintainer.pl -f drivers/gpu/drm/drm_crtc_helper_internal.h
> Maarten Lankhorst <maarten.lankhorst@linux.intel.com> (maintainer:DRM
> DRIVERS AND MISC GPU PATCHES)
> Maxime Ripard <mripard@kernel.org> (maintainer:DRM DRIVERS AND MISC GPU PATCHES)
> Thomas Zimmermann <tzimmermann@suse.de> (maintainer:DRM DRIVERS AND
> MISC GPU PATCHES)
> David Airlie <airlied@linux.ie> (maintainer:DRM DRIVERS)
> Daniel Vetter <daniel@ffwll.ch> (maintainer:DRM DRIVERS)
> dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)
> linux-kernel@vger.kernel.org (open list)
> 
> Maarten, Maxime, Thomas, David, or Daniel,
> Is it ok to backport
> commit bf22c9ec39da ("drm: remove drm_fb_helper_modinit")
> to 5.10.y and 5.4.y to fix the modpost warning reported by Florian in
> https://lore.kernel.org/stable/6cd16364-f0cd-b3f3-248f-4b6d585d05ef@gmail.com/ ?

I've queued this up now, thanks.

greg k-h
