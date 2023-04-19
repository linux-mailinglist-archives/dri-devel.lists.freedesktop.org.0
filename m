Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E62496E7DA5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 17:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EACA10E9DD;
	Wed, 19 Apr 2023 15:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164B510E9C2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 15:09:38 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-38bc978ac3eso755787b6e.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 08:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681916978; x=1684508978;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vxz4WpDlv6wH199UsEqYfGj6F7utE5kHnU1NSqrYkEI=;
 b=a3Xj8a4LitxGLjzfNfiSrOOIuEUFh4CTav04xvB0rDBxTRMVcIg6pyUQJp/xAlLnQe
 0Ur3qYeBmDt51R0iqSb2KTCKZsmfGorpAbGVYGJlNS6YiCIx6y+TLeTMXEUQRTHSpwWa
 /WT4J20/Q8d4ghyuY3j04x56N9IvmiEUFMNLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681916978; x=1684508978;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vxz4WpDlv6wH199UsEqYfGj6F7utE5kHnU1NSqrYkEI=;
 b=iWQXlDsPzMKuX6EyRVnDIAseH5M/1xqbEWTavcWeb37M4hz2t+2GlP0JxDTVam5dBD
 KdiE8YFMzEbXQzXOQq0Lah8gzhDk+A3sJx0a6BH9liqdXXkhJNHITeVd9ip2U958gOai
 gQC+HvxcT0CYfsC4TzluLikRt7eejMG+nzJNRk54+KTK3HVrW0fiKmf5qY2Kr8Ebxnus
 uzlgL9X0WWis1KQU3y4NgFnkCrF/lGcW5MbVHaow6enntA5zMCUVCaY2RhTVm9eGmhJR
 cOcnEoPRcMzMIzf3Iutr4mJMKb4VErtaiKh9CvP+0A+vQsLZpo5jn7/EoMtA8BGluAD2
 KfDg==
X-Gm-Message-State: AAQBX9ecn3/BylBAhJCkpWzxH/8IsNxqXR0lVq0dyOvQR5VHiDrivkMG
 rWwgaggQ1WjX3W9tGDoVgKYG9rkl913D5aW2Y5aimg==
X-Google-Smtp-Source: AKy350bO9mOX8qtAPRjIaVy1M/QFCCzMf9lzbVAJueqp3G07UxxxQ4LvHgK5p6EwWLFFS4PJtu4S7Cfr5JrU1gQThIw=
X-Received: by 2002:aca:df87:0:b0:384:2019:c201 with SMTP id
 w129-20020acadf87000000b003842019c201mr1706947oig.8.1681916977741; Wed, 19
 Apr 2023 08:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230417113219.1354078-1-suijingfeng@loongson.cn>
 <ZD5Vgx9Txaiz7Bun@phenom.ffwll.local>
 <139c9398-488d-df19-9ae2-2b4b47ef64f4@189.cn>
 <86a8b262-cbf2-b75f-9972-491f557edf74@189.cn>
In-Reply-To: <86a8b262-cbf2-b75f-9972-491f557edf74@189.cn>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 19 Apr 2023 17:09:26 +0200
Message-ID: <CAKMK7uE-azFT02Sp2FDfMGTc57eYJEn8iM8Wk1mt5ucPs1qM-w@mail.gmail.com>
Subject: Re: [PATCH v3] drm/fbdev-generic: prohibit potential out-of-bounds
 access
To: Sui Jingfeng <15330273260@189.cn>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, linux-fbdev@vger.kernel.org,
 Li Yi <liyi@loongson.cn>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 Apr 2023 at 20:16, Sui Jingfeng <15330273260@189.cn> wrote:
>
> Hi,
>
> On 2023/4/19 01:52, Sui Jingfeng wrote:
> > Hi,
> >
> > On 2023/4/18 16:32, Daniel Vetter wrote:
> >> On Mon, Apr 17, 2023 at 07:32:19PM +0800, Sui Jingfeng wrote:
> >>> The fbdev test of IGT may write after EOF, which lead to out-of-bound
> >>> access for the drm drivers using fbdev-generic. For example, on a x86
> >>> + aspeed bmc card platform, with a 1680x1050 resolution display,
> >>> running
> >>> fbdev test if IGT will cause the linux kernel hang with the following
> >>> call trace:
> >>>
> >>>    Oops: 0000 [#1] PREEMPT SMP PTI
> >>>    [IGT] fbdev: starting subtest eof
> >>>    Workqueue: events drm_fb_helper_damage_work [drm_kms_helper]
> >>>    [IGT] fbdev: starting subtest nullptr
> >>>
> >>>    RIP: 0010:memcpy_erms+0xa/0x20
> >>>    RSP: 0018:ffffa17d40167d98 EFLAGS: 00010246
> >>>    RAX: ffffa17d4eb7fa80 RBX: ffffa17d40e0aa80 RCX: 00000000000014c0
> >>>    RDX: 0000000000001a40 RSI: ffffa17d40e0b000 RDI: ffffa17d4eb80000
> >>>    RBP: ffffa17d40167e20 R08: 0000000000000000 R09: ffff89522ecff8c0
> >>>    R10: ffffa17d4e4c5000 R11: 0000000000000000 R12: ffffa17d4eb7fa80
> >>>    R13: 0000000000001a40 R14: 000000000000041a R15: ffffa17d40167e30
> >>>    FS:  0000000000000000(0000) GS:ffff895257380000(0000)
> >>> knlGS:0000000000000000
> >>>    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >>>    CR2: ffffa17d40e0b000 CR3: 00000001eaeca006 CR4: 00000000001706e0
> >>>    Call Trace:
> >>>     <TASK>
> >>>     ? drm_fbdev_generic_helper_fb_dirty+0x207/0x330 [drm_kms_helper]
> >>>     drm_fb_helper_damage_work+0x8f/0x170 [drm_kms_helper]
> >>>     process_one_work+0x21f/0x430
> >>>     worker_thread+0x4e/0x3c0
> >>>     ? __pfx_worker_thread+0x10/0x10
> >>>     kthread+0xf4/0x120
> >>>     ? __pfx_kthread+0x10/0x10
> >>>     ret_from_fork+0x2c/0x50
> >>>     </TASK>
> >>>    CR2: ffffa17d40e0b000
> >>>    ---[ end trace 0000000000000000 ]---
> >>>
> >>> The direct reason is that damage rectange computed by
> >>> drm_fb_helper_memory_range_to_clip() does not guaranteed to be
> >>> in-bound.
> >>> It is already results in workaround code populate to elsewhere. Another
> >>> reason is that exposing a larger buffer size than the actual needed
> >>> help
> >>> to trigger this bug intrinsic in drm_fb_helper_memory_range_to_clip().
> >>>
> >>> Others fbdev emulation solutions write to the GEM buffer directly, they
> >>> won't reproduce this bug because the .fb_dirty function callback do not
> >>> being hooked, so no chance is given to
> >>> drm_fb_helper_memory_range_to_clip()
> >>> to generate a out-of-bound when drm_fb_helper_sys_write() is called.
> >>>
> >>> This patch break the trigger condition of this bug by shrinking the
> >>> shadow
> >>> buffer size to sizes->surface_height * buffer->fb->pitches[0].
> >>>
> >>> Fixes: '8fbc9af55de0 ("drm/fbdev-generic: Set screen size to size of
> >>> GEM
> >>> buffer")'
> >>>
> >>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> >>> ---
> >>>   drivers/gpu/drm/drm_fbdev_generic.c | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c
> >>> b/drivers/gpu/drm/drm_fbdev_generic.c
> >>> index 8e5148bf40bb..b057cfbba938 100644
> >>> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> >>> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> >>> @@ -94,7 +94,7 @@ static int
> >>> drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper *fb_helper,
> >>>       fb_helper->buffer = buffer;
> >>>       fb_helper->fb = buffer->fb;
> >>>   -    screen_size = buffer->gem->size;
> >>> +    screen_size = sizes->surface_height * buffer->fb->pitches[0];
> >> So I read core some more and stumbled over drm_fb_helper_deferred_io().
> >> Which has all the code and comments about this, including limiting.
> >>
> >> I think it would be clearer if we fix the issue there, instead of
> >> passing
> >> limits around in obscure places that then again get broken?
> >
> > No, it is more obscure doing that way...
> >
> >
> > As the size of the shadow screen buffer will be exposed to userspace.
> >
> > The size 'helper->fb->height * helper->fb->pitches[0]' is a
> > exactly(best) fit,
> >
> > You are guaranteed to waste at lease one byte by increasing one byte,
> >
> > and can not store all pixels by decreasing one byte (In the case where
> > `helper->fb->pitches[0] = helper->fb->width * 4`).
> >
> > It implicitly tell the userspace do not go beyond that boundary.
> >
> > although userspace program can still choose to write  after EOF,
> >
> > But it is for test purpose, to test the kernel if it can return a
> > -EFBIG or not.
> >
> >> The thing is,
> >> Thomas both authored the limit checks in drm_fb_helper_deferred_io() and
> >> the patch which broken them again, so clearly this isn't very
> >> obvious. I'm
> >> thinking of something like this:
> >>
> >>
> >> diff --git a/drivers/gpu/drm/drm_fb_helper.c
> >> b/drivers/gpu/drm/drm_fb_helper.c
> >> index ef4eb8b12766..726dab67c359 100644
> >> --- a/drivers/gpu/drm/drm_fb_helper.c
> >> +++ b/drivers/gpu/drm/drm_fb_helper.c
> >> @@ -697,10 +697,7 @@ void drm_fb_helper_deferred_io(struct fb_info
> >> *info, struct list_head *pagerefli
> >>        * of the screen and account for non-existing scanlines. Hence,
> >>        * keep the covered memory area within the screen buffer.
> >>        */
> >> -    if (info->screen_size)
> >> -        total_size = info->screen_size;
> >> -    else
> >> -        total_size = info->fix.smem_len;
> >> +    total_size = helper->fb->height * helper->fb->pitches[0];
> >
> > This is just to mitigate the mistakes already has been made,
> >
> > because it  do not do a good splitting between the *clip* part and the
> > *damage update* part.
> >
> > An ideal clipping do not obscure its updating backend with a
> > out-of-bound damage rectangle.
> >
> > Why did the drm_fb_helper_memory_range_to_clip() can not do a good job
> > in all case
> >
> > to pass its backend a always meaningful damage rect ?
> >
> >>       max_off = min(max_off, total_size);
> >>         if (min_off < max_off) {
> >>
> >>
> >> I think that would make it utmost clear on what we're doing and why.
> >> Otherwise we're just going to re-create the same bug again, like we've
> >> done already :-)
> >
> > No, we create no bugs, we fix one.
> >
> > Thanks.
> >
> But honestly I do not have strong feel toward this, I just type what I'm
> understand without seeing you resend a V3.
>
> It's OK in overall,  I will help to test this tomorrow.  :-)

Apologies for making you jump around all the time and doing different
versions of the same bugfix :-/

I think this one here is ok to merge, I just thought when looking at
the history that we revert the exact patch without any other changes
or comments, and usually that means someone will come up with the same
cleanup idea again, and then we'll have a bug again. So maybe a
comment or a WARN_ON or something else would be good.

I guess we could also do your patch, but put a WARN_ON that the
computed total_size is never bigger than the drm_fb size into
drm_fb_helper_deferred_io()? That would also make sure that this bug
doesn't get resurrected again.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
