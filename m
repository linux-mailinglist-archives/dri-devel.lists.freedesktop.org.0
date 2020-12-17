Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B32E32DD366
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 15:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10C06E3C1;
	Thu, 17 Dec 2020 14:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3A46E3C1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 14:58:45 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id 9so25316229oiq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 06:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qUVmPaYX1wW2ti+pEDx3otYgNlKnO51Pu8NKbTBHoAc=;
 b=ks5NrRu4kh74AmpU51ZDIaCXtatOXEFw2p5lvFFNznpm8Zp5TIVST0EZCUPLsd4Aal
 N5LFiQsKl8O09VRX+VCIxLup18hdOIK106/Qae/TWInEPMXH/RPe03gM7KL/i59yHADD
 cFZRe+gRo1UvfwsRIxZ7EAWMi7kLed5Yxikck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qUVmPaYX1wW2ti+pEDx3otYgNlKnO51Pu8NKbTBHoAc=;
 b=b9H2p0BGGQlPahJhKib65RNAO9/SG2PgAwSbpIvchITu5djVHKmPfTP3NlVoxTKwu4
 mWTLdvPeW86CuUp8VnFIdnNbeqLzOzuubfUiNoeb7JOyF5LVWF5vd1qcN2BWqWnCqO3e
 RT3h7JbIAzbxeJUXCTwtwJYKZ2hnogR6U3du1OIGWwZJGPcM/jzZciEH6T5UEoiMZAu3
 31wqtnYkPwkrlrI850CYmWewZuLM3tSE1Ff0hIoLu/OfoiBs5Q7j73UkiG1UhjwHT6k3
 vOoSwU8ECgCkQlFLGm2nESJ3PXvv0klSBJMKj4emCCWPzzdMHxVHlPixBk5d3X7stisC
 iWoA==
X-Gm-Message-State: AOAM530z1oudLes9DV3LHeXJQtEeWtt4F+LlYYLzv4mC5BPquXRCgM6g
 86lgyPkYt3lNycvwYg3nciR4sskudf/IFW4NogSAgg==
X-Google-Smtp-Source: ABdhPJzjnXrOMMxUIU5IgTErLF4lKFzSyLEDLIxDl0mKkahFF49j3WlEfRBGmj29SG6s+O9Xk4aA90kzLApvorJ1IWc=
X-Received: by 2002:aca:4e11:: with SMTP id c17mr4826959oib.14.1608217124940; 
 Thu, 17 Dec 2020 06:58:44 -0800 (PST)
MIME-Version: 1.0
References: <20201217144342.217005-1-maxime@cerno.tech>
In-Reply-To: <20201217144342.217005-1-maxime@cerno.tech>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 17 Dec 2020 15:58:33 +0100
Message-ID: <CAKMK7uH2ctsmg29t=SgCk+dv673_8EbgGqyuuProbhfasfzUgQ@mail.gmail.com>
Subject: Re: [PATCH] drm: Introduce a drm_crtc_commit_wait helper
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 17, 2020 at 3:43 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> There's currently four users of the same logic to wait for a commit to
> be flipped: three for the CRTCs, connectors and planes in
> drm_atomic_helper_wait_for_dependencies, and one in vc4.
>
> Let's consolidate this a bit to avoid any code duplication.
>
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I did ponder for a bit whether this is in a good spot or not, maybe a
drm_crtc_commit.[hc] would be neat but still feels a bit like
overkill. Maybe add a quick sentence to the struct drm_crtc_commit
pointing at this new function, like "See also drm_crtc_commit_wait()"?
-Daniel

> ---
>  drivers/gpu/drm/drm_atomic.c        | 39 ++++++++++++++++++
>  drivers/gpu/drm/drm_atomic_helper.c | 61 +++++------------------------
>  drivers/gpu/drm/vc4/vc4_kms.c       | 17 ++------
>  include/drm/drm_atomic.h            |  2 +
>  4 files changed, 54 insertions(+), 65 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index b2d20eb6c807..e2ab6564535c 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -52,6 +52,45 @@ void __drm_crtc_commit_free(struct kref *kref)
>  }
>  EXPORT_SYMBOL(__drm_crtc_commit_free);
>
> +/**
> + * drm_crtc_commit_wait - Waits for a commit to complete
> + * @commit: &drm_crtc_commit to wait for
> + *
> + * Waits for a given &drm_crtc_commit to be programmed into the
> + * hardware and flipped to.
> + *
> + * Returns:
> + *
> + * 0 on success, a negative error code otherwise.
> + */
> +int drm_crtc_commit_wait(struct drm_crtc_commit *commit)
> +{
> +       unsigned long timeout = 10 * HZ;
> +       int ret;
> +
> +       if (!commit)
> +               return 0;
> +
> +       ret = wait_for_completion_timeout(&commit->hw_done, timeout);
> +       if (!ret) {
> +               DRM_ERROR("hw_done timed out\n");
> +               return -ETIMEDOUT;
> +       }
> +
> +       /*
> +        * Currently no support for overwriting flips, hence
> +        * stall for previous one to execute completely.
> +        */
> +       ret = wait_for_completion_timeout(&commit->flip_done, timeout);
> +       if (!ret) {
> +               DRM_ERROR("flip_done timed out\n");
> +               return -ETIMEDOUT;
> +       }
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(drm_crtc_commit_wait);
> +
>  /**
>   * drm_atomic_state_default_release -
>   * release memory initialized by drm_atomic_state_init
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index a84dc427cf82..9fa3f97223a1 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -2202,70 +2202,27 @@ void drm_atomic_helper_wait_for_dependencies(struct drm_atomic_state *old_state)
>         struct drm_plane_state *old_plane_state;
>         struct drm_connector *conn;
>         struct drm_connector_state *old_conn_state;
> -       struct drm_crtc_commit *commit;
>         int i;
>         long ret;
>
>         for_each_old_crtc_in_state(old_state, crtc, old_crtc_state, i) {
> -               commit = old_crtc_state->commit;
> -
> -               if (!commit)
> -                       continue;
> -
> -               ret = wait_for_completion_timeout(&commit->hw_done,
> -                                                 10*HZ);
> -               if (ret == 0)
> -                       DRM_ERROR("[CRTC:%d:%s] hw_done timed out\n",
> -                                 crtc->base.id, crtc->name);
> -
> -               /* Currently no support for overwriting flips, hence
> -                * stall for previous one to execute completely. */
> -               ret = wait_for_completion_timeout(&commit->flip_done,
> -                                                 10*HZ);
> -               if (ret == 0)
> -                       DRM_ERROR("[CRTC:%d:%s] flip_done timed out\n",
> +               ret = drm_crtc_commit_wait(old_crtc_state->commit);
> +               if (ret)
> +                       DRM_ERROR("[CRTC:%d:%s] commit wait timed out\n",
>                                   crtc->base.id, crtc->name);
>         }
>
>         for_each_old_connector_in_state(old_state, conn, old_conn_state, i) {
> -               commit = old_conn_state->commit;
> -
> -               if (!commit)
> -                       continue;
> -
> -               ret = wait_for_completion_timeout(&commit->hw_done,
> -                                                 10*HZ);
> -               if (ret == 0)
> -                       DRM_ERROR("[CONNECTOR:%d:%s] hw_done timed out\n",
> -                                 conn->base.id, conn->name);
> -
> -               /* Currently no support for overwriting flips, hence
> -                * stall for previous one to execute completely. */
> -               ret = wait_for_completion_timeout(&commit->flip_done,
> -                                                 10*HZ);
> -               if (ret == 0)
> -                       DRM_ERROR("[CONNECTOR:%d:%s] flip_done timed out\n",
> +               ret = drm_crtc_commit_wait(old_conn_state->commit);
> +               if (ret)
> +                       DRM_ERROR("[CONNECTOR:%d:%s] commit wait timed out\n",
>                                   conn->base.id, conn->name);
>         }
>
>         for_each_old_plane_in_state(old_state, plane, old_plane_state, i) {
> -               commit = old_plane_state->commit;
> -
> -               if (!commit)
> -                       continue;
> -
> -               ret = wait_for_completion_timeout(&commit->hw_done,
> -                                                 10*HZ);
> -               if (ret == 0)
> -                       DRM_ERROR("[PLANE:%d:%s] hw_done timed out\n",
> -                                 plane->base.id, plane->name);
> -
> -               /* Currently no support for overwriting flips, hence
> -                * stall for previous one to execute completely. */
> -               ret = wait_for_completion_timeout(&commit->flip_done,
> -                                                 10*HZ);
> -               if (ret == 0)
> -                       DRM_ERROR("[PLANE:%d:%s] flip_done timed out\n",
> +               ret = drm_crtc_commit_wait(old_plane_state->commit);
> +               if (ret)
> +                       DRM_ERROR("[PLANE:%d:%s] commit wait timed out\n",
>                                   plane->base.id, plane->name);
>         }
>  }
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index f09254c2497d..bb5529a7a9c2 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -363,9 +363,8 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
>         for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
>                 struct vc4_crtc_state *vc4_crtc_state =
>                         to_vc4_crtc_state(old_crtc_state);
> -               struct drm_crtc_commit *commit;
>                 unsigned int channel = vc4_crtc_state->assigned_channel;
> -               unsigned long done;
> +               int ret;
>
>                 if (channel == VC4_HVS_CHANNEL_DISABLED)
>                         continue;
> @@ -373,17 +372,9 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
>                 if (!old_hvs_state->fifo_state[channel].in_use)
>                         continue;
>
> -               commit = old_hvs_state->fifo_state[i].pending_commit;
> -               if (!commit)
> -                       continue;
> -
> -               done = wait_for_completion_timeout(&commit->hw_done, 10 * HZ);
> -               if (!done)
> -                       drm_err(dev, "Timed out waiting for hw_done\n");
> -
> -               done = wait_for_completion_timeout(&commit->flip_done, 10 * HZ);
> -               if (!done)
> -                       drm_err(dev, "Timed out waiting for flip_done\n");
> +               ret = drm_crtc_commit_wait(old_hvs_state->fifo_state[i].pending_commit);
> +               if (ret)
> +                       drm_err(dev, "Timed out waiting for commit\n");
>         }
>
>         drm_atomic_helper_commit_modeset_disables(dev, state);
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index ce7023e9115d..79ef992c433d 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -436,6 +436,8 @@ static inline void drm_crtc_commit_put(struct drm_crtc_commit *commit)
>         kref_put(&commit->ref, __drm_crtc_commit_free);
>  }
>
> +int drm_crtc_commit_wait(struct drm_crtc_commit *commit);
> +
>  struct drm_atomic_state * __must_check
>  drm_atomic_state_alloc(struct drm_device *dev);
>  void drm_atomic_state_clear(struct drm_atomic_state *state);
> --
> 2.29.2
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
