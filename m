Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE6A17EA04
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 21:29:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD196E56A;
	Mon,  9 Mar 2020 20:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658246E56A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 20:29:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D14372D2;
 Mon,  9 Mar 2020 21:29:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583785786;
 bh=EpBQA2hEwrpXQE7qeQj5oSBZYdMLILyNUEjpUkBeqD0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TzbPaSJMGc90Rdp2ClKW6IeLRD+mLsaYXP1fDJZmlg17E1V80QTU9RsRy8LWIH1Yz
 9LMtP+ObOK6FonuVLvB97xJDLbuVVQFXjB18R79BE1jNZPpBDWxzuiH4WYOqyQuLzf
 u0EN/v4I312KHpQGQzlLkHyhnBqwGx67Z2Q0fOiQ=
Date: Mon, 9 Mar 2020 22:29:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm: panel: Set connector type for OrtusTech
 COM43H4M85ULC panel
Message-ID: <20200309202942.GD4916@pendragon.ideasonboard.com>
References: <20200309184210.10042-1-laurent.pinchart@ideasonboard.com>
 <20200309190047.GA7543@ravnborg.org>
 <20200309190127.GB4916@pendragon.ideasonboard.com>
 <20200309194541.GA8617@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200309194541.GA8617@ravnborg.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Mon, Mar 09, 2020 at 08:45:41PM +0100, Sam Ravnborg wrote:
> On Mon, Mar 09, 2020 at 09:01:27PM +0200, Laurent Pinchart wrote:
> > On Mon, Mar 09, 2020 at 08:00:47PM +0100, Sam Ravnborg wrote:
> > > On Mon, Mar 09, 2020 at 08:42:10PM +0200, Laurent Pinchart wrote:
> > > > The OrtusTech COM43H4M85ULC is a DPI panel, set the connector type
> > > > accordingly.
> > > > 
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >
> > > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > > 
> > > I assume you will apply to drm-misc-next - OK?
> > 
> > I still haven't got around to using dim :-)
> 
> I can manage - so the entry level is pretty low.
> 
> My lame and simple workflow
> 
> dim update-branches
> # save patch from mutt
> cat mbox | dim apply
> git rebase etc.
> dim checkpatch <= if I make changes while applying
> #build testing
> dim push
> 
> 
> And when I do my own stuff:
> dim update-branches
> git checkout -b sam-my-stuff
> hacking-hacking
> commit, commit
> git rebase --exec "dim add-missing-cc" HEAD~5
> 
> 
> dim can do much more than that - but the above is
> the few dim commands I use.
> This help me to do things remotely correct.
> 
> So maybe this is as good as any time to try out dim?

As good as any, and as bad as any I suppose :-)

There are a few things I don't like with dim, and I haven't found time
yet to see how to fix (how live with :-) them yet. Among those issues
are

- dim requires the kernel tree to be under $DIM_PREFIX. This is my main
  issue, as I have one kernel tree per project, with and develop for
  different subsystems in each. I would like dim to instead handle any
  kernel tree regardless of where it is located on the disk, without
  requiring me to add another DRM-specific tree to my workflow.

- The script auto-updates itself, and I find that to be a security issue
  that I'm not comfortable with.

- The dim script makes a special case of intel repositories internally,
  which I don't find very fair. Maybe that can be considered as a
  compensation for Intel's efforts in DRM development, but a model where
  the community maintaining drm-misc has to resolve conflicts with
  drm-intel before it reaches drm-next bothers me.

The second issue is easy to solve by commenting out auto-update (not
sure if Daniel will like that though :-)), and the third one isn't
really a blocker, but the first one currently prevents me from using
dim.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
