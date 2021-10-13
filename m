Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B71942C102
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 15:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CB66EA56;
	Wed, 13 Oct 2021 13:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155B66EA56;
 Wed, 13 Oct 2021 13:09:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 636A1610FC;
 Wed, 13 Oct 2021 13:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1634130592;
 bh=7m7EfH/zUZP99e4EZpqOWzO8X2MkRjqzezczEyYF0zI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wx7I7ej+sxeJQCf9x4/LREq2NXMV01Tq8P+tnbeia7QrIxq0cY7L8deG75Z3DXX37
 oNOecuKpLP5egwHkQcgDxvJeu8hEwRzPaWa/k4RFSCKRtiNWfjE71HkGAm9ES6Vyr2
 LJhtwm15yKqYxG/rcAoEIXiE/8bw0Ss9OmlXjktQ=
Date: Wed, 13 Oct 2021 15:09:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org, jani.nikula@intel.com,
 Imre Deak <imre.deak@intel.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 "Rafael J . Wysocki" <rafael@kernel.org>, intel-gfx@lists.freedesktop.org,
 Russell King <rmk+kernel@armlinux.org.uk>
Subject: Re: [PATCH v2] component: do not leave master devres group open
 after bind
Message-ID: <YWbangk7KAxZFoq3@kroah.com>
References: <20210922085432.2776886-1-kai.vehmanen@linux.intel.com>
 <YVxiyzNrKG8S1GDb@kroah.com>
 <alpine.DEB.2.22.394.2110061613520.3554566@eliteleevi.tm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2110061613520.3554566@eliteleevi.tm.intel.com>
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

On Wed, Oct 06, 2021 at 04:47:57PM +0300, Kai Vehmanen wrote:
> Hi,
> 
> On Tue, 5 Oct 2021, Greg KH wrote:
> 
> > On Wed, Sep 22, 2021 at 11:54:32AM +0300, Kai Vehmanen wrote:
> > > In current code, the devres group for aggregate master is left open
> > > after call to component_master_add_*(). This leads to problems when the
> > > master does further managed allocations on its own. When any
> > > participating driver calls component_del(), this leads to immediate
> > > release of resources.
> [...]
> > > the devres group, and by closing the devres group after
> > > the master->ops->bind() call is done. This allows devres allocations
> > > done by the driver acting as master to be isolated from the binding state
> > > of the aggregate driver. This modifies the logic originally introduced in
> > > commit 9e1ccb4a7700 ("drivers/base: fix devres handling for master device")
> > > 
> > > BugLink: https://gitlab.freedesktop.org/drm/intel/-/issues/4136
> > > Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> > > Acked-by: Imre Deak <imre.deak@intel.com>
> > > Acked-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > 
> > What commit does this "fix:"?  And does it need to go to stable
> > kernel(s)?
> 
> I didn't put a "Fixes" on the original commit 9e1ccb4a7700 
> ("drivers/base: fix devres handling for master device") as it alone
> didn't cause problems. It did open the door for possible devres issues
> for anybody calling component_master_add_().
> 
> On audio side, this surfaced with the more recent commit 3fcaf24e5dce 
> ("ALSA: hda: Allocate resources with device-managed APIs"). In theory one 
> could have hit issues already before, but this made it very easy to hit
> on actual systems.
> 
> If I'd have to pick one, it would be 9e1ccb4a7700 ("drivers/base: fix 
> devres handling for master device"). And yes, given comments on this 
> thread, I'd say this needs to go to stable kernels.

Then please add a fixes: line and a cc: stable line and resend.

thanks,

greg k-h
