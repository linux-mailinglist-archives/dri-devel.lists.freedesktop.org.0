Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812874C2963
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 11:30:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5828710F97B;
	Thu, 24 Feb 2022 10:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3618710F97B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 10:30:01 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id c30dee63-955c-11ec-b2df-0050568cd888;
 Thu, 24 Feb 2022 10:30:18 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 48650194B49;
 Thu, 24 Feb 2022 11:30:02 +0100 (CET)
Date: Thu, 24 Feb 2022 11:29:55 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 4/5] fbdev: Improve performance of cfb_imageblit()
Message-ID: <YhdeIz29aHrwXvi8@ravnborg.org>
References: <20220223193804.18636-1-tzimmermann@suse.de>
 <20220223193804.18636-5-tzimmermann@suse.de>
 <YhaYSeyYIwqur2hy@ravnborg.org>
 <02cd3c81-d937-eb2a-ebe1-3eb9d83f6adc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02cd3c81-d937-eb2a-ebe1-3eb9d83f6adc@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 deller@gmx.de, dri-devel@lists.freedesktop.org, geert@linux-m68k.org,
 kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,
On Thu, Feb 24, 2022 at 10:02:59AM +0100, Javier Martinez Canillas wrote:
> Hello Sam,
> 
> On 2/23/22 21:25, Sam Ravnborg wrote:
> 
> [snip]
> 
> > 
> > Question: What is cfb an abbreviation for anyway?
> > Not related to the patch - but if I have known the memory is lost..
> > 
> 
> I was curious so I dug on this. It seems CFB stands for Color Frame Buffer.
> Doing a `git grep "(CFB)"` in the linux history repo [0], I get this:
> 
>   Documentation/isdn/README.diversion:   (CFB). 
>   drivers/video/pmag-ba-fb.c: *   PMAG-BA TURBOchannel Color Frame Buffer (CFB) card support,
>   include/video/pmag-ba-fb.h: *   TURBOchannel PMAG-BA Color Frame Buffer (CFB) card support,
> 
> Probably the helpers are called like this because they were for any fbdev
> driver but assumed that the framebuffer was always in I/O memory. Later some
> drivers were allocating the framebuffer in system memory and still using the
> helpers, that were using I/O memory accessors and it's ilegal on some arches.
> 
> So the sys_* variants where introduced by commit 68648ed1f58d ("fbdev: add
> drawing functions for framebuffers in system RAM") to fix this. The old
> ones just kept their name, but probably it should had been renamed to io_*
> for the naming to be consistent with the sys_* functions.
> 
> [0]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/

Interesting - thanks for the history lesson and thanks for taking your
time to share your findings too.

	Sam
