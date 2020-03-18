Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF6D18A103
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 17:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC846E92D;
	Wed, 18 Mar 2020 16:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3819E6E92D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 16:58:49 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8E9D820724;
 Wed, 18 Mar 2020 16:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584550729;
 bh=50sIpwbTYylG3uOeXddKEerXCNu0A2f54RlDXQlgRCY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I1pTko21+eEy3TFE/HCcnefGq5yIi0x+IohXiwaDCSA9CrlauuC40vheU5h3Cp7s4
 uEiYvJoq0SGZTxXd5QNgGt1s4k3kXwiqkYH1zYdJr3NIKqfEWmFrbvXcK/Fswxr/IK
 eUKAnxYn6eMILCn40d4TT2DXztIL4wjfjAdEaSCo=
Date: Wed, 18 Mar 2020 17:58:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 10/17] drm/vram-helper: make
 drm_vram_mm_debugfs_init() return 0
Message-ID: <20200318165846.GC3090655@kroah.com>
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
 <20200310133121.27913-11-wambui.karugax@gmail.com>
 <20200318152627.GY2363188@phenom.ffwll.local>
 <alpine.LNX.2.21.99999.375.2003181857010.54051@wambui>
 <CAKMK7uGwJ6nzLPzwtfUY79e1fSFxkrSgTfJuDeM4px6c0v13qg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGwJ6nzLPzwtfUY79e1fSFxkrSgTfJuDeM4px6c0v13qg@mail.gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 18, 2020 at 05:31:47PM +0100, Daniel Vetter wrote:
> On Wed, Mar 18, 2020 at 5:03 PM Wambui Karuga <wambui.karugax@gmail.com> wrote:
> >
> >
> >
> > On Wed, 18 Mar 2020, Daniel Vetter wrote:
> >
> > > On Tue, Mar 10, 2020 at 04:31:14PM +0300, Wambui Karuga wrote:
> > >> Since 987d65d01356 (drm: debugfs: make
> > >> drm_debugfs_create_files() never fail), drm_debugfs_create_files() never
> > >> fails and should return void. Therefore, remove its use as the
> > >> return value of drm_vram_mm_debugfs_init(), and have the function
> > >> return 0 directly.
> > >>
> > >> v2: have drm_vram_mm_debugfs_init() return 0 instead of void to avoid
> > >> introducing build issues and build breakage.
> > >>
> > >> References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
> > >> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> > >> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > >> ---
> > >>  drivers/gpu/drm/drm_gem_vram_helper.c | 10 ++++------
> > >>  1 file changed, 4 insertions(+), 6 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> > >> index 92a11bb42365..c8bcc8609650 100644
> > >> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> > >> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> > >> @@ -1048,14 +1048,12 @@ static const struct drm_info_list drm_vram_mm_debugfs_list[] = {
> > >>   */
> > >>  int drm_vram_mm_debugfs_init(struct drm_minor *minor)
> > >>  {
> > >> -    int ret = 0;
> > >> -
> > >>  #if defined(CONFIG_DEBUG_FS)
> > >
> > > Just noticed that this #if here is not needed, we already have a dummy
> > > function for that case. Care to write a quick patch to remove it? On top
> > > of this patch series here ofc, I'm in the processing of merging the entire
> > > pile.
> > >
> > > Thanks, Daniel
> > Hi Daniel,
> > Without this check here, and compiling without CONFIG_DEBUG_FS, this
> > function is run and the drm_debugfs_create_files() does not have access to
> > the parameters also protected by an #if above this function. So the change
> > throws an error for me. Is that correct?
> 
> Hm right. Other drivers don't #ifdef out their debugfs file functions
> ... kinda a bit disappointing that we can't do this in the neatest way
> possible.
> 
> Greg, has anyone ever suggested to convert the debugfs_create_file
> function (and similar things) to macros that don't use any of the
> arguments, and then also annotating all the static functions/tables as
> __maybe_unused and let the compiler garbage collect everything?
> Instead of explicit #ifdef in all the drivers ...

No, no one has suggested that, having the functions be static inline
should make it all "just work" properly if debugfs is not enabled.  The
variables will not be used, so the compiler should just optimize them
away properly.

No checks for CONFIG_DEBUG_FS should be needed anywhere in .c code.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
