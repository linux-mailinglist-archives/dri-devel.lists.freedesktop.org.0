Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCD0164407
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 13:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16A889E86;
	Wed, 19 Feb 2020 12:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA39489E86
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 12:17:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B41F42F9;
 Wed, 19 Feb 2020 13:17:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582114665;
 bh=dvxqB2OBu/RZbZpYKfqE1RrUwdmqUTzLkL3YGIeA6gM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZkFCpcuMIh8XXuG9Q/fnLEDjTMqeUFn6QuCVzxZCj618tc25DMrWrnRrpN/JS+PK9
 Bp7n9R4qboL0SAuFB6xx+CtVvFLDTLzGiDrsUxhK4NnVHec19i2jF3wbGAEVwICH3C
 gc8sMlWHyrMQFsBMOsAILxO29uuLrJtF9PMmMjB8=
Date: Wed, 19 Feb 2020 14:17:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 37/52] drm/rcar-du: Drop explicit drm_mode_config_cleanup
 call
Message-ID: <20200219121727.GC5070@pendragon.ideasonboard.com>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-38-daniel.vetter@ffwll.ch>
 <CAMuHMdXit+F2nK8JSXyzP26epeDA3pxOYyzVMFtKWqaGCNqBxA@mail.gmail.com>
 <CAKMK7uFrzjAOxBK0GBPtHt=VGRjvC3GJcOTvP087gyO1nAEVPQ@mail.gmail.com>
 <CAMuHMdUBKJTcPg8GB_c52p8jXWqdn8JX3tiPxsQkRRW2EA3+yA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUBKJTcPg8GB_c52p8jXWqdn8JX3tiPxsQkRRW2EA3+yA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Wed, Feb 19, 2020 at 12:10:18PM +0100, Geert Uytterhoeven wrote:
> On Wed, Feb 19, 2020 at 11:57 AM Daniel Vetter wrote:
> > On Wed, Feb 19, 2020 at 11:30 AM Geert Uytterhoeven wrote:
> > > On Wed, Feb 19, 2020 at 11:22 AM Daniel Vetter wrote:
> > > > It's right above the drm_dev_put().
> > > >
> > > > Aside: Another driver with a bit much devm_kzalloc, which should
> > > > probably use drmm_kzalloc instead ...
> > >
> > > What's drmm_kzalloc()?
> > > The only references I can find are in this patch series.
> >
> > Yup, it's all new. Read cover letter for reading instructions for the
> > entire patch series. I'm afraid the driver patches wont make much
> > sense without the context. None actually :-/
> 
> IC, as the cover letter was sent only to dri-devel and intel-gfx, many
> recipients of the patches won't have received it...
> https://lore.kernel.org/dri-devel/20200219102122.1607365-1-daniel.vetter@ffwll.ch/

I was also going to mention that it would be nice to send the cover
letter to all recipients from the series, otherwise it's a bit painful.
Daniel, is this something that could be integrated in your workflow ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
