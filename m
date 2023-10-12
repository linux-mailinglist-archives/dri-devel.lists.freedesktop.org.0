Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF8A7C6620
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 09:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93F410E111;
	Thu, 12 Oct 2023 07:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E6E10E111;
 Thu, 12 Oct 2023 07:10:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0F56ACE26F7;
 Thu, 12 Oct 2023 07:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6960EC433C8;
 Thu, 12 Oct 2023 07:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1697094598;
 bh=O14Gyn27mSQRHdRIVyvrPGN+SxNqyOZQQR3iMuU8frA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KeULQfJq05Z1AnlTYEf8sYzkPyE7ZoUOroDPClDTiqBqOoLD3ftTZkTV+TXlsp7wB
 nvltw/pzzpXCgEQNSAivl4MCQTbVLALo9o6fCYnCYIUdC8cME+A0Kus5tW7FRXXIgO
 r46aRwWAjIeJkVkd/WrlIN3iD+hqxuvagBgbVV+0=
Date: Thu, 12 Oct 2023 09:09:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <2023101247-coexist-isolated-584b@gregkh>
References: <20231012122209.6f2768df@canb.auug.org.au>
 <20231012122749.45d37e52@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012122749.45d37e52@canb.auug.org.au>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 RD Babiera <rdbabiera@google.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 12, 2023 at 12:27:49PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 12 Oct 2023 12:22:09 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the drm-misc tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > drivers/usb/typec/altmodes/displayport.c: In function 'dp_altmode_vdm':
> > drivers/usb/typec/altmodes/displayport.c:309:33: error: too few arguments to function 'drm_connector_oob_hotplug_event'
> >   309 |                                 drm_connector_oob_hotplug_event(dp->connector_fwnode);
> >       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > In file included from drivers/usb/typec/altmodes/displayport.c:17:
> > include/drm/drm_connector.h:1984:6: note: declared here
> >  1984 | void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> >       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Caused by commit
> > 
> >   fc93835bb0d7 ("drm: Add HPD state to drm_connector_oob_hotplug_event()")
> > 
> > interacting with commit
> > 
> >   89434b069e46 ("usb: typec: altmodes/displayport: Signal hpd low when exiting mode")
> > 
> > from the usb.current tree.
> > 
> > I have applied the following merge fix patch.
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Thu, 12 Oct 2023 12:17:31 +1100
> > Subject: [PATCH] fix up for "drm: Add HPD state to
> >  drm_connector_oob_hotplug_event()"
> > 
> > interacting with commit
> > 
> >   89434b069e46 ("usb: typec: altmodes/displayport: Signal hpd low when exiting mode")
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/usb/typec/altmodes/displayport.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> > index ddfb5b6ace4f..eb0bf08fc97a 100644
> > --- a/drivers/usb/typec/altmodes/displayport.c
> > +++ b/drivers/usb/typec/altmodes/displayport.c
> > @@ -306,7 +306,8 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
> >  			dp->data.status = 0;
> >  			dp->data.conf = 0;
> >  			if (dp->hpd) {
> > -				drm_connector_oob_hotplug_event(dp->connector_fwnode);
> > +				drm_connector_oob_hotplug_event(dp->connector_fwnode
> 
> Pretend that there is a comma at the end of the above line :-)

Looks good to me, thanks!

greg k-h
