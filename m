Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD41628F5A6
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 17:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAAD96ED16;
	Thu, 15 Oct 2020 15:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75246ECF9;
 Thu, 15 Oct 2020 15:15:44 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t9so3912225wrq.11;
 Thu, 15 Oct 2020 08:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YIFgqJIvZsmeRtV2K8O58xOmfJpO6lYc6Fjxru8DXiQ=;
 b=QA9VcerBtrSSn6LTddkzx9rBBCDBJKMc2M0PPRxQHXiKZCxSAQkBWJEqzG88aphHwM
 NtBu9H6p+rIKe9PD/BEaH+l6XNAxeIYSok097kDm6TyYV5VQJdG7952JMcMVUiLHZI5z
 ODvDZoxdgxNNXH3QifA8fiVI8FmKLj/PIkGC1dHJxdegwrmB1y6GCqHKCeylY75PJ1uy
 OeHHdOuwfxCQ0oSVYDuwqDpXnT+RJX7fgV3SBhM9zZ98ERS8h8UBRVBCftEqEz9KhQQE
 +HI7TrHs4Oxci154R/+CSBwdagvYShJ+/hoXjMwOmSBV0sAaSxXM9JxukAQT/MLS+zrk
 rS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YIFgqJIvZsmeRtV2K8O58xOmfJpO6lYc6Fjxru8DXiQ=;
 b=q4zhkAG3qqaXlNoo+eiz0MEQUtH6Tncrxxby6epahhW1WboToA8PUSEcHdBgDND/9+
 Ub0TL+RgipLQBOkaTlp1s5Dwo+X7oP/fU3Gat+PWEGejRGjd0sScqazlI9Q8/cHCIwuE
 RjxRb66FUllZWPK4XSPnWss0azIvfTYd/qdV1Pjue114lS+IYuqKmsYqElRH1VSYjV6I
 3IF5CC0TwRZ/Coq02X+9Mg1cykx/yf9+MF1rhaXSilzmMNpWE23Ayl85RRNUWd1H/IY7
 +sQtdqwse3B2BTlvI7EvSas62/TxHXpRNstk6dsy0w+inagxGrixWzJUCppm8AJavVXO
 rtAg==
X-Gm-Message-State: AOAM531/cfe/y0yzNxSz67i5c7T3SbkBSDOcOJxQvQfz3lKpm73UiJV6
 +FdS/4aAJytjKFyy1ICaUCQ2ZvZdAhUqdIurd/PysMrONCL9EbXB
X-Google-Smtp-Source: ABdhPJzv0seZ4eeR8XIu7L9Q2J9C311t2z/alrYlN6Fe40zEkxrgTiVhUDea3rZfQ40QX3nJQ7eybie9w2iqnT+oIuE=
X-Received: by 2002:adf:bc0f:: with SMTP id s15mr4965982wrg.83.1602774943141; 
 Thu, 15 Oct 2020 08:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <1602753310-22105-1-git-send-email-mkrishn@codeaurora.org>
In-Reply-To: <1602753310-22105-1-git-send-email-mkrishn@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 15 Oct 2020 08:15:31 -0700
Message-ID: <CAF6AEGva6tqc3v5J62LhdZsb8mqKZ+NXFmaL-HwF355uct2d7g@mail.gmail.com>
Subject: Re: [v2] drm/msm: Fix race condition in msm driver with async layer
 updates
To: Krishna Manikandan <mkrishn@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 15, 2020 at 2:15 AM Krishna Manikandan
<mkrishn@codeaurora.org> wrote:
>
> When there are back to back commits with async cursor update,
> there is a case where second commit can program the DPU hw
> blocks while first didn't complete flushing config to HW.
>
> Synchronize the compositions such that second commit waits
> until first commit flushes the composition.
>
> This change also introduces per crtc commit lock, such that
> commits on different crtcs are not blocked by each other.
>
> Changes in v2:
>         - Use an array of mutexes in kms to handle commit
>           lock per crtc. (Rob Clark)
>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 32 +++++++++++++++++++-------------
>  drivers/gpu/drm/msm/msm_kms.h    |  6 ++++--
>  2 files changed, 23 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 561bfa4..f9bd472 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -61,10 +61,10 @@ static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
>
>         trace_msm_atomic_async_commit_start(crtc_mask);
>
> -       mutex_lock(&kms->commit_lock);
> +       mutex_lock(&kms->commit_lock[crtc_idx]);
>
>         if (!(kms->pending_crtc_mask & crtc_mask)) {
> -               mutex_unlock(&kms->commit_lock);
> +               mutex_unlock(&kms->commit_lock[crtc_idx]);
>                 goto out;
>         }
>
> @@ -79,7 +79,6 @@ static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
>          */
>         trace_msm_atomic_flush_commit(crtc_mask);
>         kms->funcs->flush_commit(kms, crtc_mask);
> -       mutex_unlock(&kms->commit_lock);
>
>         /*
>          * Wait for flush to complete:
> @@ -90,9 +89,8 @@ static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
>
>         vblank_put(kms, crtc_mask);
>
> -       mutex_lock(&kms->commit_lock);
>         kms->funcs->complete_commit(kms, crtc_mask);
> -       mutex_unlock(&kms->commit_lock);
> +       mutex_unlock(&kms->commit_lock[crtc_idx]);
>         kms->funcs->disable_commit(kms);
>
>  out:
> @@ -171,6 +169,16 @@ static unsigned get_crtc_mask(struct drm_atomic_state *state)
>         return mask;
>  }
>
> +static int get_crtc_id(struct msm_kms *kms, unsigned int crtc_mask)
> +{
> +       struct drm_crtc *crtc;
> +
> +       for_each_crtc_mask(kms->dev, crtc, crtc_mask)
> +               return drm_crtc_index(crtc);
> +
> +       return 0;
> +}

this is closer, but a commit could still touch multiple CRTCs, I think
what you should do is add a lock/unlock helper, similar to
vblank_get/put(), ie:

static void lock_crtcs(struct msm_kms *kms, unsigned crtc_mask)
{
  struct drm_crtc *crtc;

  for_each_crtc_mask(kms->dev, crtc, crtc_mask)
    mutex_lock(&kms->commit_lock[drm_crtc_index(crtc)]);
}

and use that everywhere

(Technically we only go down the async path if there is only a single
crtc, but no reason not to use the lock/unlock helpers in both cases)

BR,
-R

> +
>  void msm_atomic_commit_tail(struct drm_atomic_state *state)
>  {
>         struct drm_device *dev = state->dev;
> @@ -180,6 +188,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>         unsigned crtc_mask = get_crtc_mask(state);
>         bool async = kms->funcs->vsync_time &&
>                         can_do_async(state, &async_crtc);
> +       int crtc_idx = get_crtc_id(kms, crtc_mask);
>
>         trace_msm_atomic_commit_tail_start(async, crtc_mask);
>
> @@ -189,12 +198,11 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>          * Ensure any previous (potentially async) commit has
>          * completed:
>          */
> +       mutex_lock(&kms->commit_lock[crtc_idx]);
>         trace_msm_atomic_wait_flush_start(crtc_mask);
>         kms->funcs->wait_flush(kms, crtc_mask);
>         trace_msm_atomic_wait_flush_finish(crtc_mask);
>
> -       mutex_lock(&kms->commit_lock);
> -
>         /*
>          * Now that there is no in-progress flush, prepare the
>          * current update:
> @@ -232,8 +240,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>                 }
>
>                 kms->funcs->disable_commit(kms);
> -               mutex_unlock(&kms->commit_lock);
> -
> +               mutex_unlock(&kms->commit_lock[crtc_idx]);
>                 /*
>                  * At this point, from drm core's perspective, we
>                  * are done with the atomic update, so we can just
> @@ -260,8 +267,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>          */
>         trace_msm_atomic_flush_commit(crtc_mask);
>         kms->funcs->flush_commit(kms, crtc_mask);
> -       mutex_unlock(&kms->commit_lock);
> -
> +       mutex_unlock(&kms->commit_lock[crtc_idx]);
>         /*
>          * Wait for flush to complete:
>          */
> @@ -271,9 +277,9 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>
>         vblank_put(kms, crtc_mask);
>
> -       mutex_lock(&kms->commit_lock);
> +       mutex_lock(&kms->commit_lock[crtc_idx]);
>         kms->funcs->complete_commit(kms, crtc_mask);
> -       mutex_unlock(&kms->commit_lock);
> +       mutex_unlock(&kms->commit_lock[crtc_idx]);
>         kms->funcs->disable_commit(kms);
>
>         drm_atomic_helper_commit_hw_done(state);
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 1cbef6b..2049847 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -155,7 +155,7 @@ struct msm_kms {
>          * For async commit, where ->flush_commit() and later happens
>          * from the crtc's pending_timer close to end of the frame:
>          */
> -       struct mutex commit_lock;
> +       struct mutex commit_lock[MAX_CRTCS];
>         unsigned pending_crtc_mask;
>         struct msm_pending_timer pending_timers[MAX_CRTCS];
>  };
> @@ -165,7 +165,9 @@ static inline void msm_kms_init(struct msm_kms *kms,
>  {
>         unsigned i;
>
> -       mutex_init(&kms->commit_lock);
> +       for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++)
> +               mutex_init(&kms->commit_lock[i]);
> +
>         kms->funcs = funcs;
>
>         for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++)
> --
> 2.7.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
