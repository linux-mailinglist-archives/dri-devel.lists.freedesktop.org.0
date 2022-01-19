Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04981493B26
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 14:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2F98938B;
	Wed, 19 Jan 2022 13:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D53898C2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 13:35:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 16DA860B57;
 Wed, 19 Jan 2022 13:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994EBC340E5;
 Wed, 19 Jan 2022 13:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1642599318;
 bh=MJBZhpZfujJ78Q+Y4DFAt3dHmUNItZSed2KuLByhnlc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vmBaNkvL0H29zQblw/+q9Mm11UDoBEGlp6W/zm16RQOzLjtWqDu/IfI98mPvlXden
 4pNoBjaOiSsJxSsBWKAVi+xNPdNELsiiqQN8E+IOJvKWesszTRrHeCULqKWUC9GFXi
 fmuWLSByaLPeDKjFU2z9E3FI3gHHkXfdy3YnFOg0=
Date: Wed, 19 Jan 2022 14:35:15 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sven Schnelle <svens@stackframe.org>
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
Message-ID: <YegTkwdFAb56D5Ud@kroah.com>
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de> <Yef0j8+DBbwC7Kjv@kroah.com>
 <Yef15k2GtC40aJEu@kroah.com> <87o847khfr.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o847khfr.fsf@x1.stackframe.org>
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
Cc: linux-fbdev@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Claudio Suarez <cssk@net-c.es>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 19, 2022 at 02:01:44PM +0100, Sven Schnelle wrote:
> Hi Greg,
> 
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> 
> > On Wed, Jan 19, 2022 at 12:22:55PM +0100, Greg Kroah-Hartman wrote:
> >> On Wed, Jan 19, 2022 at 12:08:39PM +0100, Helge Deller wrote:
> >> > This reverts commit 39aead8373b3c20bb5965c024dfb51a94e526151.
> >> > 
> >> > Revert this patch.  This patch started to introduce the regression that
> >> > all hardware acceleration of more than 35 existing fbdev drivers were
> >> > bypassed and thus fbcon console output for those was dramatically slowed
> >> > down by factor of 10 and more.
> >> > 
> >> > Reverting this commit has no impact on DRM, since none of the DRM drivers are
> >> > tagged with the acceleration flags FBINFO_HWACCEL_COPYAREA,
> >> > FBINFO_HWACCEL_FILLRECT or others.
> >> > 
> >> > Signed-off-by: Helge Deller <deller@gmx.de>
> >> > Cc: stable@vger.kernel.org # v5.16
> >> 
> >> Why just 5.16?  This commit came in on 5.11 and was backported to
> >> 5.10.5.
> >> 
> >> As for "why", I think there was a number of private bugs that were
> >> reported in this code, which is why it was removed.  I do not think it
> >> can be safely added back in without addressing them first.  Let me go
> >> dig through my email to see if I can find them...
> >
> > Ah, no, that was just the soft scrollback code I was thinking of, which
> > was a different revert and is still gone, thankfully :)
> >
> > This one was just removed because Daniel noticed that only 3 drivers
> > used this (nouveau, omapdrm, and gma600), so this shouldn't have caused
> > any regressions in any other drivers like you are reporting here.
> 
> I'm counting more than 3 drivers using this. I think one of the reasons
> why it was reverted was that no one is actively maintaining fbdev. With
> Helge now volunteering i don't see a reason why it should stay reverted.
> If there are issues coming up i'm pretty sure Helge would care, and i
> would probably also take a look.

Ok, no objection from me, but I think Daniel should weigh in as it is
his commit that is being reverted here.

thanks,

greg k-h
