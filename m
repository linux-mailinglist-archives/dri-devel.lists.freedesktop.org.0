Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD3722FDFE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 01:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55686E131;
	Mon, 27 Jul 2020 23:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40138.protonmail.ch (mail-40138.protonmail.ch
 [185.70.40.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEE589F8B;
 Mon, 27 Jul 2020 20:27:10 +0000 (UTC)
Date: Mon, 27 Jul 2020 20:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1595881628;
 bh=L4/PzAU/PlbzwZ2pM51uKqp5OqHinU8wQ2m72zcFpIY=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=jF0s0rqm7pfzq1RbqLiBAPHmL5jPQVQRQbxaFTLpjxvthnH5rtUz6Ah/JfKsW+Ezn
 V0gJRcz1wQFiX//qEie+nSWCYSkSVMMvEOBTvoJgqegQ53mBxNYUQ6un5xMn3xMo67
 ovFGLELi6xu21otX+KxrLfGTgSd5V9YIT7lrLakk=
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
From: Mazin Rezk <mnrzk@protonmail.com>
Subject: Re: [PATCH] drm/amd/display: Clear dm_state for fast updates
Message-ID: <_8mO29uo4bTBeV3K8ZXjTwJA7HX3nPP0pdFIESyPYhiVyPdT4ejgJyp-kMVW3_UnqZsolGj8uP2C1dLvelaOgqiY6saKE_m97ECqhdIdr8o=@protonmail.com>
In-Reply-To: <c8e3031a-b21f-2b19-9d39-7a01687c7f06@amd.com>
References: <M0lxN5AUlPvzBKULfIBe5BZRwfQGXeMQCdWItYcQ-9P79y32WzExYK2Y0DwyNVtyGelqbvV07_lFk1oeT4cApbT-P_oH0bnxQbMmFsJv_xg=@protonmail.com>
 <c8e3031a-b21f-2b19-9d39-7a01687c7f06@amd.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_REPLYTO
 shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
X-Mailman-Approved-At: Mon, 27 Jul 2020 23:32:42 +0000
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 "mphantomx@yahoo.com.br" <mphantomx@yahoo.com.br>,
 Duncan <1i5t5.duncan@cox.net>, Kees Cook <keescook@chromium.org>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>, Mazin Rezk <mnrzk@protonmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "regressions@leemhuis.info" <regressions@leemhuis.info>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "anthony.ruhier@gmail.com" <anthony.ruhier@gmail.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, July 27, 2020 9:26 AM, Kazlauskas, Nicholas <nicholas.kazlauskas@amd.com> wrote:

> On 2020-07-27 1:40 a.m., Mazin Rezk wrote:
> > This patch fixes a race condition that causes a use-after-free during
> > amdgpu_dm_atomic_commit_tail. This can occur when 2 non-blocking commits
> > are requested and the second one finishes before the first. Essentially,
> > this bug occurs when the following sequence of events happens:
> >
> > 1. Non-blocking commit #1 is requested w/ a new dm_state #1 and is
> > deferred to the workqueue.
> >
> > 2. Non-blocking commit #2 is requested w/ a new dm_state #2 and is
> > deferred to the workqueue.
> >
> > 3. Commit #2 starts before commit #1, dm_state #1 is used in the
> > commit_tail and commit #2 completes, freeing dm_state #1.
> >
> > 4. Commit #1 starts after commit #2 completes, uses the freed dm_state
> > 1 and dereferences a freelist pointer while setting the context.
> >
> > Since this bug has only been spotted with fast commits, this patch fixes
> > the bug by clearing the dm_state instead of using the old dc_state for
> > fast updates. In addition, since dm_state is only used for its dc_state
> > and amdgpu_dm_atomic_commit_tail will retain the dc_state if none is found,
> > removing the dm_state should not have any consequences in fast updates.
> >
> > This use-after-free bug has existed for a while now, but only caused a
> > noticeable issue starting from 5.7-rc1 due to 3202fa62f ("slub: relocate
> > freelist pointer to middle of object") moving the freelist pointer from
> > dm_state->base (which was unused) to dm_state->context (which is
> > dereferenced).
> >
> > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=207383
> > Fixes: bd200d190f45 ("drm/amd/display: Don't replace the dc_state for fast updates")
> > Reported-by: Duncan <1i5t5.duncan@cox.net>
> > Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
> > ---
> >   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 36 ++++++++++++++-----
> >   1 file changed, 27 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 86ffa0c2880f..710edc70e37e 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -8717,20 +8717,38 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
> >   		 * the same resource. If we have a new DC context as part of
> >   		 * the DM atomic state from validation we need to free it and
> >   		 * retain the existing one instead.
> > +		 *
> > +		 * Furthermore, since the DM atomic state only contains the DC
> > +		 * context and can safely be annulled, we can free the state
> > +		 * and clear the associated private object now to free
> > +		 * some memory and avoid a possible use-after-free later.
> >   		 */
> > -		struct dm_atomic_state *new_dm_state, *old_dm_state;
> >
> > -		new_dm_state = dm_atomic_get_new_state(state);
> > -		old_dm_state = dm_atomic_get_old_state(state);
> > +		for (i = 0; i < state->num_private_objs; i++) {
> > +			struct drm_private_obj *obj = state->private_objs[i].ptr;
> >
> > -		if (new_dm_state && old_dm_state) {
> > -			if (new_dm_state->context)
> > -				dc_release_state(new_dm_state->context);
> > +			if (obj->funcs == adev->dm.atomic_obj.funcs) {
> > +				int j = state->num_private_objs-1;
> >
> > -			new_dm_state->context = old_dm_state->context;
> > +				dm_atomic_destroy_state(obj,
> > +						state->private_objs[i].state);
> > +
> > +				/* If i is not at the end of the array then the
> > +				 * last element needs to be moved to where i was
> > +				 * before the array can safely be truncated.
> > +				 */
> > +				if (i != j)
> > +					state->private_objs[i] =
> > +						state->private_objs[j];
> >
> > -			if (old_dm_state->context)
> > -				dc_retain_state(old_dm_state->context);
> > +				state->private_objs[j].ptr = NULL;
> > +				state->private_objs[j].state = NULL;
> > +				state->private_objs[j].old_state = NULL;
> > +				state->private_objs[j].new_state = NULL;
> > +
> > +				state->num_private_objs = j;
> > +				break;
> > +			}
>
> In the bug report itself I mentioned that I don't really like hacking
> around the DRM core for resolving this patch but to go into more
> specifics, it's really two issues of code maintenance:
>
> 1. It's iterating over internal structures and layout of private objects
> in the state and modifying the state. The core doesn't really guarantee
> how these things are going to be laid out and it may change in the future.
>
> 2. It's freeing an allocation we don't own from DM. DRM doesn't track
> this state elsewhere for purposes of freeing, but nothing is really
> stopping the core from doing this later down the line.
>
> The implementation itself is correct from a technical perspective, but
> I'd rather it reside in DRM as a helper for code maintenance purposes.

So would something like this in drm_atomic_helper.c work?

void drm_atomic_helper_delete_private_obj(struct drm_atomic_state *state,
					int i)
{
	struct drm_private_obj *obj = state->private_objs[i].ptr;
	int end = state->num_private_objs-1;

	obj->funcs->atomic_destroy_state(obj, state->private_objs[i].state);

	/* If i is not at the end of the array then the last element
	 * needs to be moved to where i was before the array can safely
	 * be truncated.
	 */
	if (i != end)
		state->private_objs[i] = state->private_objs[end];

	state->private_objs[end].ptr = NULL;
	state->private_objs[end].state = NULL;
	state->private_objs[end].old_state = NULL;
	state->private_objs[end].new_state = NULL;

	state->num_private_objs = end;
}

I was considering doing something like that, but I wanted to avoid
modifying DRM core to fix a bug in amdgpu. I guess this makes more sense
though since it does seem rather unorthodox to make changes to
drm_atomic_state outside of DRM core. Perhaps there will be a use for this
function outside of this patch in the future.

Thanks,
Mazin Rezk

>
> Regards,
> Nicholas Kazlauskas
>
> >   		}
> >   	}
> >
> > --
> > 2.27.0
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
