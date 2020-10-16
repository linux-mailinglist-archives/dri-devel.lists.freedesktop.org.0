Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 199EF290809
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 17:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F031E6EE1A;
	Fri, 16 Oct 2020 15:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9943F6EE1E;
 Fri, 16 Oct 2020 15:13:42 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id j136so3346132wmj.2;
 Fri, 16 Oct 2020 08:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4caXpkclqb0kte1ui2rZGOT3gO9tw5QkWF6WaM5340U=;
 b=bw0C7RL0+fhKMO0EAe8XGEcHwb8wyybaCpfl8P7sGnfdkZI9j4tysI6uZ0YoR29/ha
 YOX4aILlakJ066q+xevlet5l+Z+N9q/nV7+KQ/NKKo3PoqCwvkqKc4MR4ryRAmfVyqTJ
 uz9QwYlBWj2ZUFkyZ/iB50AZoKJOmHEFk3aQyW2Q+ljkXeftI1rA7efNHa+FZThIiT4K
 wnmZSuOqxrB01w27tBcLSH/JQmZ6evhSO/vqsZliSKtLWCHF4Bm+V6PvS55UoVIl4rIy
 DKgs589sQo9GoZg5GOugVRSrxKtqGwZuZqZxIpdhnOn/1/ZjONqYyoPkPZqi0JtPd9tA
 H/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4caXpkclqb0kte1ui2rZGOT3gO9tw5QkWF6WaM5340U=;
 b=fVNrhFtloXn2J17XeteOapvppjIMectPweTNFwtiDpyiKtjb+SYkkDyez7enxOMzxi
 /oVhVT2QvBNXfUnC4W4zWa8IOs78D20i+6DvmNZ8lCTqB7OcSQz7LZcvOjGt5VoZ4Fzo
 ui55D059/cxzchRIGcncqb0Df8CbzFB4aZ9zpRaercKfSLP9NlYeU61gjJBLvhwRB/JD
 unq7s7Mv9its8ZE2LCGbcmssFvkKE6AtV+xUFsNK/XVMx00/bZdMTl8XCOFTlART4LCe
 2FehxXIk3054cEGei6QYjeBWtXAdDPCioVBNC3HL1ROQYB+85JEpuSDvyWq4bm9M4PzH
 qGaw==
X-Gm-Message-State: AOAM533LrG4gXuxCqTMqmOAClNSO/Ck+UX4V5EDFmsRHAikClMiTRMur
 ufF1s9p1tzqWo2Rd1mHxVjC8smtwELz+ZH27Kio=
X-Google-Smtp-Source: ABdhPJzr3VYyUdzLIDtBlIsdA+pEKl3QsosK5nMd+7onCOzT6+6p6L4hMZjIv11pJzsNcjZWS7NXyiKQkqyJvnToGuo=
X-Received: by 2002:a05:600c:2241:: with SMTP id
 a1mr4437272wmm.49.1602861212981; 
 Fri, 16 Oct 2020 08:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <1602857443-27317-1-git-send-email-mkrishn@codeaurora.org>
In-Reply-To: <1602857443-27317-1-git-send-email-mkrishn@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 16 Oct 2020 08:13:18 -0700
Message-ID: <CAF6AEGuc967Ooq+YJSej5nmyD9pqAYkN83odieOJ=4fRsdwdeA@mail.gmail.com>
Subject: Re: [v3] drm/msm: Fix race condition in msm driver with async layer
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

On Fri, Oct 16, 2020 at 7:11 AM Krishna Manikandan
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
> Changes in v3:
>         - Add wrapper functions to handle lock and unlock of
>           commit_lock for each crtc. (Rob Clark)
>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 37 ++++++++++++++++++++++++-------------
>  drivers/gpu/drm/msm/msm_kms.h    |  6 ++++--
>  2 files changed, 28 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 561bfa4..575e9af 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -55,16 +55,32 @@ static void vblank_put(struct msm_kms *kms, unsigned crtc_mask)
>         }
>  }
>
> +static void lock_crtcs(struct msm_kms *kms, unsigned int crtc_mask)
> +{
> +       struct drm_crtc *crtc;
> +
> +       for_each_crtc_mask(kms->dev, crtc, crtc_mask)
> +               mutex_lock(&kms->commit_lock[drm_crtc_index(crtc)]);
> +}
> +
> +static void unlock_crtcs(struct msm_kms *kms, unsigned int crtc_mask)
> +{
> +       struct drm_crtc *crtc;
> +
> +       for_each_crtc_mask(kms->dev, crtc, crtc_mask)
> +               mutex_unlock(&kms->commit_lock[drm_crtc_index(crtc)]);
> +}
> +
>  static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
>  {
>         unsigned crtc_mask = BIT(crtc_idx);
>
>         trace_msm_atomic_async_commit_start(crtc_mask);
>
> -       mutex_lock(&kms->commit_lock);
> +       lock_crtcs(kms, crtc_mask);
>
>         if (!(kms->pending_crtc_mask & crtc_mask)) {
> -               mutex_unlock(&kms->commit_lock);
> +               unlock_crtcs(kms, crtc_mask);
>                 goto out;
>         }
>
> @@ -79,7 +95,6 @@ static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
>          */
>         trace_msm_atomic_flush_commit(crtc_mask);
>         kms->funcs->flush_commit(kms, crtc_mask);
> -       mutex_unlock(&kms->commit_lock);
>
>         /*
>          * Wait for flush to complete:
> @@ -90,9 +105,8 @@ static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
>
>         vblank_put(kms, crtc_mask);
>
> -       mutex_lock(&kms->commit_lock);
>         kms->funcs->complete_commit(kms, crtc_mask);
> -       mutex_unlock(&kms->commit_lock);
> +       unlock_crtcs(kms, crtc_mask);
>         kms->funcs->disable_commit(kms);
>
>  out:
> @@ -189,12 +203,11 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>          * Ensure any previous (potentially async) commit has
>          * completed:
>          */
> +       lock_crtcs(kms, crtc_mask);
>         trace_msm_atomic_wait_flush_start(crtc_mask);
>         kms->funcs->wait_flush(kms, crtc_mask);
>         trace_msm_atomic_wait_flush_finish(crtc_mask);
>
> -       mutex_lock(&kms->commit_lock);
> -
>         /*
>          * Now that there is no in-progress flush, prepare the
>          * current update:
> @@ -232,8 +245,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>                 }
>
>                 kms->funcs->disable_commit(kms);
> -               mutex_unlock(&kms->commit_lock);
> -
> +               unlock_crtcs(kms, crtc_mask);
>                 /*
>                  * At this point, from drm core's perspective, we
>                  * are done with the atomic update, so we can just
> @@ -260,8 +272,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>          */
>         trace_msm_atomic_flush_commit(crtc_mask);
>         kms->funcs->flush_commit(kms, crtc_mask);
> -       mutex_unlock(&kms->commit_lock);
> -
> +       unlock_crtcs(kms, crtc_mask);
>         /*
>          * Wait for flush to complete:
>          */
> @@ -271,9 +282,9 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>
>         vblank_put(kms, crtc_mask);
>
> -       mutex_lock(&kms->commit_lock);
> +       lock_crtcs(kms, crtc_mask);
>         kms->funcs->complete_commit(kms, crtc_mask);
> -       mutex_unlock(&kms->commit_lock);
> +       unlock_crtcs(kms, crtc_mask);
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
