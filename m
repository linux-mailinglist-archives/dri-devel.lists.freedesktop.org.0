Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A3363F174
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 14:21:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49D910E5DD;
	Thu,  1 Dec 2022 13:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3616710E5DD
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 13:21:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5F8B86200F;
 Thu,  1 Dec 2022 13:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4E5C433D6;
 Thu,  1 Dec 2022 13:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1669900874;
 bh=3Q0nqM/0El/JdGglB4N55DCT/z+HmXOFsWcr+k7N5A0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1vjc336rGPJFMCRw/GbQPdyQ9hBEG3PR+0ADeDQQOXNPyUxXjMyJV9cIQMAjNok45
 +1LsfQAdo3RwXXqHE9lnN6gKfTqeVUN6PFGQi5YFKJfyKU7dHo02Y/3ObEvw7AT2A+
 LGLMGXyNoHQpwQw61HZ0HgdiMSc3Vm5j5DLSLH7M=
Date: Thu, 1 Dec 2022 14:21:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v2 0/6] drm/gud: Use the shadow plane helper
Message-ID: <Y4iqR94aGFa3NahQ@kroah.com>
References: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
 <Y4hB5odv9IGaq3Di@kroah.com>
 <1cb40762-5f0a-1739-1670-155f59ec7110@tronnes.org>
 <Y4iaODY6hMVNsfP1@kroah.com>
 <4e75582c-b3d6-fb0e-19b4-e4fd58c6bf55@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e75582c-b3d6-fb0e-19b4-e4fd58c6bf55@tronnes.org>
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
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, tools@linux.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 01, 2022 at 02:14:42PM +0100, Noralf Trønnes wrote:
> 
> 
> Den 01.12.2022 13.12, skrev Greg KH:
> > On Thu, Dec 01, 2022 at 11:00:44AM +0100, Noralf Trønnes wrote:
> >>
> >>
> >> Den 01.12.2022 06.55, skrev Greg KH:
> >>> On Wed, Nov 30, 2022 at 08:26:48PM +0100, Noralf Trønnes via B4 Submission Endpoint wrote:
> >>>> Hi,
> >>>>
> >>>> I have started to look at igt for testing and want to use CRC tests. To
> >>>> implement support for this I need to move away from the simple kms
> >>>> helper.
> >>>>
> >>>> When looking around for examples I came across Thomas' nice shadow
> >>>> helper and thought, yes this is perfect for drm/gud. So I'll switch to
> >>>> that before I move away from the simple kms helper.
> >>>>
> >>>> The async framebuffer flushing code path now uses a shadow buffer and
> >>>> doesn't touch the framebuffer when it shouldn't. I have also taken the
> >>>> opportunity to inline the synchronous flush code path and make this the
> >>>> default flushing stategy.
> >>>>
> >>>> Noralf.
> >>>>
> >>>> Cc: Maxime Ripard <mripard@kernel.org>
> >>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >>>> Cc: dri-devel@lists.freedesktop.org
> >>>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> >>>>
> >>>> ---
> >>>> Changes in v2:
> >>>> - Drop patch (Thomas):
> >>>>   drm/gem: shadow_fb_access: Prepare imported buffers for CPU access
> >>>> - Use src as variable name for iosys_map (Thomas)
> >>>> - Prepare imported buffer for CPU access in the driver (Thomas)
> >>>> - New patch: make sync flushing the default (Thomas)
> >>>> - Link to v1: https://lore.kernel.org/r/20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org
> >>>
> >>> <formletter>
> >>>
> >>> This is not the correct way to submit patches for inclusion in the
> >>> stable kernel tree.  Please read:
> >>>     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> >>> for how to do this properly.
> >>>
> >>> </formletter>
> >>
> >> Care to elaborate?
> >> Is it because stable got the whole patchset and not just the one fix
> >> patch that cc'ed stable?
> > 
> > That is what triggered this, yes.
> > 
> >> This patchset was sent using the b4 tool and I can't control this
> >> aspect. Everyone mentioned in the patches gets the whole set.
> > 
> > Fair enough, but watch out, bots will report this as being a problem as
> > they can't always read through all patches in a series to notice this...
> > 
> 
> Konstantin,
> 
> Can you add a rule in b4 to exclude stable@vger.kernel.org
> (stable@kernel.org as well?) from getting the whole patchset?

stable@kernel.org is a pipe to /dev/null so that's not needed to be
messed with.

As for this needing special casing in b4, it's rare that you send out a
patch series and only want 1 or 2 of them in stable, right?

thanks,

greg k-h
