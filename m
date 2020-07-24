Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A5822DFDB
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD5A89ED6;
	Sun, 26 Jul 2020 15:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail4.protonmail.ch (mail4.protonmail.ch [185.70.40.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56FE6E98C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 21:09:13 +0000 (UTC)
Date: Fri, 24 Jul 2020 21:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1595624951;
 bh=Y8a3UGIVUH//nWWAHOfJ574aWDANSyRzuKfaeg2ulx4=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=YGj/lN+HFANsv1agtWAfUQJ7IvssJEJY15hq9PWChRGnsw5JEgsYYiWDl31LukOud
 dOE/V34tZUicUA8wP8eoHSncAd542wShdz8LPbuUbbzSPBZJ5Dc7yEPvZxzXeW/Ik6
 Q9yTCzgVKFotxwH/ft0g8N6MDWQonb3zGWZES6KI=
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
From: Mazin Rezk <mnrzk@protonmail.com>
Subject: Re: [PATCH] amdgpu_dm: fix nonblocking atomic commit use-after-free
Message-ID: <84wa2rcw2dJSFkRVMxsGwnf-BOUvLL6jFG8orKz4_sjwWChkTbrAUVmOupfV1AmPm0MxqbRGwtvn_v_EAMhM_ngI73p-sjscgKg106fcu4U=@protonmail.com>
In-Reply-To: <3iDgskt5iP3y77MHUJ2_5uSThyUteHxPvVqoL5SpnpTIpz5cdkifyDOynpiVukS_peaYGOkn9bHSpvRYa-vFOCjUYH68taIuKyZqhOByAVI=@protonmail.com>
References: <YIGsJ9LlFquvBI2iWPKhJwjKBwDUr_C-38oVpLJJHJ5rDCY_Zrrv392o6UPNxHoeQrcpLYC9U4fZdpD9ilz6Amg2IxkSexGLQMCQIBek8rc=@protonmail.com>
 <ccd5d51b-b018-a3db-169b-ba6278a7be9f@amd.com>
 <3iDgskt5iP3y77MHUJ2_5uSThyUteHxPvVqoL5SpnpTIpz5cdkifyDOynpiVukS_peaYGOkn9bHSpvRYa-vFOCjUYH68taIuKyZqhOByAVI=@protonmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-0.5 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_REPLYTO
 shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
X-Mailman-Approved-At: Sun, 26 Jul 2020 15:02:44 +0000
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
Reply-To: Mazin Rezk <mnrzk@protonmail.com>
Cc: "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>,
 "anthony.ruhier@gmail.com" <anthony.ruhier@gmail.com>,
 "1i5t5.duncan@cox.net" <1i5t5.duncan@cox.net>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>, Mazin Rezk <mnrzk@protonmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "regressions@leemhuis.info" <regressions@leemhuis.info>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "mphantomx@yahoo.com.br" <mphantomx@yahoo.com.br>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, July 23, 2020 6:57 PM, Mazin Rezk <mnrzk@protonmail.com> wrote:

> It seems that I spoke too soon. I ran the system for another hour after
> submitting the patch and the bug just occurred. :/
>
> Sadly, that means the bug isn't really fixed and that I have to go
> investigate further.
>
> At the very least, this patch seems to delay the occurrence of the bug
> significantly which may help in further discovering the cause.
>
> On Thursday, July 23, 2020 6:16 PM, Kazlauskas, Nicholas nicholas.kazlauskas@amd.com wrote:
>
> > On 2020-07-23 5:10 p.m., Mazin Rezk wrote:
> >
> > > When amdgpu_dm_atomic_commit_tail is running in the workqueue,
> > > drm_atomic_state_put will get called while amdgpu_dm_atomic_commit_tail is
> > > running, causing a race condition where state (and then dm_state) is
> > > sometimes freed while amdgpu_dm_atomic_commit_tail is running. This bug has
> > > occurred since 5.7-rc1 and is well documented among polaris11 users [1].
> > > Prior to 5.7, this was not a noticeable issue since the freelist pointer
> > > was stored at the beginning of dm_state (base), which was unused. After
> > > changing the freelist pointer to be stored in the middle of the struct, the
> > > freelist pointer overwrote the context, causing dc_state to become garbage
> > > data and made the call to dm_enable_per_frame_crtc_master_sync dereference
> > > a freelist pointer.
> > > This patch fixes the aforementioned issue by calling drm_atomic_state_get
> > > in amdgpu_dm_atomic_commit before drm_atomic_helper_commit is called and
> > > drm_atomic_state_put after amdgpu_dm_atomic_commit_tail is complete.
> > > According to my testing on 5.8.0-rc6, this should fix bug 207383 on
> > > Bugzilla [1].
> > > [1] https://bugzilla.kernel.org/show_bug.cgi?id=207383
> > > Fixes: 3202fa62f ("slub: relocate freelist pointer to middle of object")
> > > Reported-by: Duncan 1i5t5.duncan@cox.net
> > > Signed-off-by: Mazin Rezk mnrzk@protonmail.com
> >
> > Thanks for the investigation and your patch. I appreciate the help in
> > trying to narrow down the root cause as this issue has been difficult to
> > reproduce on my setups.
> > Though I'm not sure this really resolves the issue - we make use of the
> > drm_atomic_helper_commit helper function from DRM which internally does
> > what you're doing with this patch:
> > drm_atomic_state_get(state);
> > if (nonblock)
> > queue_work(system_unbound_wq, &state->commit_work);
> >
> >     else
> >     	commit_tail(state);
> >
> >
> > So even when it gets queued off to the unbound workqueue we still have a
> > reference on the state.
> > That reference gets dropped as part of commit tail helper in DRM as well:
> > if (funcs && funcs->atomic_commit_tail)
> >
> >     	funcs->atomic_commit_tail(old_state);
> >
> >     else
> >     	drm_atomic_helper_commit_tail(old_state);
> >
> >
> > commit_time_ms = ktime_ms_delta(ktime_get(), start);
> > if (commit_time_ms > 0)
> >
> >     	drm_self_refresh_helper_update_avg_times(old_state,
> >     					 (unsigned long)commit_time_ms,
> >     					 new_self_refresh_mask);
> >
> >
> > drm_atomic_helper_commit_cleanup_done(old_state);
> > drm_atomic_state_put(old_state);
>
> I initially noticed that right after I wrote this patch so I was expecting
> the patch to fail. However, after several hours of testing, the crash just
> didn't occur so I believed the bug was fixed.
>
> > So instead of a use after free happening when we access the state we get
> > a double-free happening later at the end of commit tail in DRM.
> > What I think would be the right next step here is to actually determine
> > what sequence of IOCTLs and atomic commits are happening under your
> > setup with a very verbose dmesg log. You can set a debug level for DRM
> > in your kernel parameters with something like:
> > drm.debug=0x54
> > I don't see anything in amdgpu_dm.c that looks like it would be freeing
> > the state so I suspect something in the core is this doing this.
>
> Going through the KASAN use-after-free bug report in the Bugzilla
> attachments, it appears that the state is being freed at the end of
> commit_tail. Perhaps amdgpu_dm_atomic_commit_tail is being called on the
> the same old state twice? I can't quite think of any other possible
> explanation as to why that happens.

I think I've more or less confirmed that this is the case.

I created two padding variables, one to store debug magic numbers and one
to store the freelist pointer. I had magic numbers for initialised,
preuse, and used states. When the dm_atomic_state is initialised, the
padding is set to the init magic number. Right before commit_tail is
called, the padding is set to the preuse magic number. During
dm_atomic_get_new_state checks the magic number to confirm that it
was in the preuse state and then set it to used. If it failed that check
and it was already in a used state, there was a breakpoint set so I could
gather further information.

At one point (presumably where the crash would have occurred), the debug
padding variable was set to the used state during the call to commit_tail
which I believe confirms my guess that amdgpu_dm_atomic_commit_tail is
being called on the same state twice.

What's weird, however, is that dmesg (w/ drm.debug=0x54) says this right
before amdgpu_dm_atomic_commit_tail is called:

[ 3277.580205] [drm:drm_atomic_state_init [drm]] Allocated atomic state 00000000a06f4024
[ 3277.580262] [drm:drm_atomic_get_crtc_state [drm]] Added [CRTC:49:crtc-1] 000000003b9da5c1 state to 00000000a06f4024
[ 3277.580316] [drm:drm_atomic_get_plane_state [drm]] Added [PLANE:44:plane-4] 000000003488c027 state to 00000000a06f4024
[ 3277.580366] [drm:drm_atomic_set_fb_for_plane [drm]] Set [FB:103] for [PLANE:44:plane-4] state 000000003488c027
[ 3277.580417] [drm:drm_atomic_check_only [drm]] checking 00000000a06f4024
[ 3277.580519] [drm:drm_atomic_get_private_obj_state [drm]] Added new private object 0000000002a633ab state 00000000695dff15 to 00000000a06f4024
[ 3277.580579] [drm:drm_atomic_nonblocking_commit [drm]] committing 00000000a06f4024 nonblocking
[ 3277.582325] [drm:drm_atomic_state_default_clear [drm]] Clearing atomic state 00000000a06f4024
[ 3277.582393] [drm:__drm_atomic_state_free [drm]] Freeing atomic state 00000000a06f4024

From the log, I'm noticing that drm_atomic_nonblocking_commit is only
called once and that whatever is calling the second non-blocking
commit_tail on the same state doesn't seem to be using
drm_atomic_nonblocking_commit.

Perhaps someone with more knowledge of the code can give a possible
explanation as to why that's happening.

Thanks,
Mazin Rezk

>
> > > drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +++
> > > 1 file changed, 3 insertions(+)
> > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > index 86ffa0c2880f..86d6652872f2 100644
> > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > @@ -7303,6 +7303,7 @@ static int amdgpu_dm_atomic_commit(struct drm_device *dev,
> > >
> > > -   unset legacy_cursor_update
> > >     */
> > >
> > >
> > > -   drm_atomic_state_get(state);
> >
> > Also note that if the drm_atomic_helper_commit() call fails here then
> > we're going to never free this structure. So we should really be
> > checking the return code here below before trying to do this, if at all.
>
> Oh right, that's true. I looked at amdgpu_dm_atomic_commit_tail and didn't
> see any return statements in there, so I thought it was safe.
>
> > Regards,
> > Nicholas Kazlauskas
> >
> > >       return drm_atomic_helper_commit(dev, state, nonblock);
> > >
> > >       /*TODO Handle EINTR, reenable IRQ*/
> > >
> > >
> > > @@ -7628,6 +7629,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
> > >
> > >       if (dc_state_temp)
> > >       	dc_release_state(dc_state_temp);
> > >
> > >
> > > -
> > > -   drm_atomic_state_put(state);
> > >     }
> > >
> > >
> > > --
> > > 2.27.0
>
> Thanks,
> Mazin Rezk


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
