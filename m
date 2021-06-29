Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E003B797D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 22:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BB96E042;
	Tue, 29 Jun 2021 20:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61656E084
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 20:41:54 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 v6-20020a0568300906b0290464d9be9510so109668ott.12
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 13:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=G+rJt0C2Slb8d0ZfNqjQGxxap0txWSw7TQID7jmhkhA=;
 b=mVRdapNlPo1HO1UIHjT7z8yyfjnNO/EX3RIshPo2eOjrZ2A663ejNox8Ye0VcVg4JN
 XvC6WBo/o828ePCTyS7LXPjbqnTFmQwrYruwV1dCRHCsd9+LcK7hC3+YstZuiG3ruTAa
 TpOrW/4SPyteSuXHPz5ZbvGPPEu2/qz55Ha6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=G+rJt0C2Slb8d0ZfNqjQGxxap0txWSw7TQID7jmhkhA=;
 b=tSMNWcGWtmEPmkOeIW2DuHaV5WP2XyGafyG2bQr/6Tek7yb1MnGFQS2+6qLA98VFHu
 F7quMkih9Mdipt71SMqckv5JqMS6DmyOO5I1fdqdYXq6EPxPE3ZlwoREt8jqjzsxp4ve
 B8jOdXD7m+JTOMOSGbisnT12LC0Ei+D5XeORIAWl/7rsLYQXO36rvbT3KffbMu69Hdhr
 //YuOK+S6hz9sedfXLDIb/R2pVvzv4AIBYpxvUZSjUe0D2WJUnW+jQj7CbB6S+qs7L1Z
 1vedmh1RnFyY7UKzs+Z/GINS58FamBV2ak4p3039EuB++brumRMd4PsHk1C1ILslAy6J
 ZQHA==
X-Gm-Message-State: AOAM533dVGKC7pg2KjKmfOOztCeDbV0dwjLD+LeubwMTGN3HeBPcaR9q
 DhAszcV0Hdqz2lyKZAU001NcWUuZHSiI7KBYSLADUQ==
X-Google-Smtp-Source: ABdhPJx1TFgBKD9DcRhcjUnyrBLH010Bm78M/wrrOZ+J+cCVRwJkR63kAnvPTLiNwVCDc2nMUTp58bOkpkUx6NEVUQY=
X-Received: by 2002:a9d:2781:: with SMTP id c1mr6020558otb.34.1624999314141;
 Tue, 29 Jun 2021 13:41:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Jun 2021 13:41:53 -0700
MIME-Version: 1.0
In-Reply-To: <1624997336-2245-1-git-send-email-khsieh@codeaurora.org>
References: <1624997336-2245-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 29 Jun 2021 13:41:53 -0700
Message-ID: <CAE-0n50onDrop=67VvMWL2sbSJedxhKEX13PsiZNaokucSgLew@mail.gmail.com>
Subject: Re: [PATCH] drm/dp_mst: Fix return code on sideband message failure
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run,
 Lyude Paul <lyude@redhat.com>
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
Cc: rnayak@codeaurora.org, tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org, rsubbia@codeaurora.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Lyude, author of fixed commit. Please add relevant folks in the future.

Quoting Kuogee Hsieh (2021-06-29 13:08:56)
> From: Rajkumar Subbiah <rsubbia@codeaurora.org>
>
> The commit 2f015ec6eab69301fdcf54d397810d72362d7223 added some debug

Please write

Commit 2f015ec6eab6 ("drm/dp_mst: Add sideband down request tracing +
selftests") added some debug

> code for sideband message tracing. But it seems to have unintentionally
> changed the behavior on sideband message failure. It catches and returns
> failure only if DRM_UT_DP is enabled. Otherwise it ignores the error code
> and returns success. So on an MST unplug, the caller is unaware that the
> clear payload message failed and ends up waiting for 4 seconds for the
> response.
>
> This change fixes the issue by returning the proper error code.

$ git grep "This patch" -- Documentation/process

>
> Change-Id: I2887b7ca21355fe84a7968f7619d5e8199cbb0c6

Please replace with

Fixes: 2f015ec6eab6 ("drm/dp_mst: Add sideband down request tracing +
selftests")

> Signed-off-by: Rajkumar Subbiah <rsubbia@codeaurora.org>

Should be a Signed-off-by from Kuogee Hsieh here.

> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 1590144..8d97430 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -2887,11 +2887,13 @@ static int process_single_tx_qlock(struct drm_dp_mst_topology_mgr *mgr,
>         idx += tosend + 1;
>
>         ret = drm_dp_send_sideband_msg(mgr, up, chunk, idx);
> -       if (unlikely(ret) && drm_debug_enabled(DRM_UT_DP)) {
> -               struct drm_printer p = drm_debug_printer(DBG_PREFIX);
> +       if (unlikely(ret)) {
> +               if (drm_debug_enabled(DRM_UT_DP)) {
> +                       struct drm_printer p = drm_debug_printer(DBG_PREFIX);
>
> -               drm_printf(&p, "sideband msg failed to send\n");
> -               drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
> +                       drm_printf(&p, "sideband msg failed to send\n");
> +                       drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
> +               }
>                 return ret;
>         }
>

With the above fixed up

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
