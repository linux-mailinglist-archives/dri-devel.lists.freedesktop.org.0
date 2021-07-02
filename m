Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEB43BA473
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 21:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03266E1E8;
	Fri,  2 Jul 2021 19:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FD46E1E8
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 19:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625255445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=29SPvxPVQ0+aj9h4WhYrD9uwRhZ/3csk1qtrjUjwTJI=;
 b=PgTqf4GXXmHiyu/i1wnn10Jiuc9fpwH1IxRJXQVTGt5u8fhJw67wql1bQfjYiC+yivB3Mq
 7xhTrIOo3hHVJwTCKnGWBZAYh72HTGiLHaJV7MizD089hdqSOBnnFzwHRfpTx1C/nc2Mzm
 NJoo164n8T46P0xG6VP5jXMQL+hYa4I=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-cApMtsirMkmY_TqvLkrOkw-1; Fri, 02 Jul 2021 15:50:44 -0400
X-MC-Unique: cApMtsirMkmY_TqvLkrOkw-1
Received: by mail-qv1-f69.google.com with SMTP id
 k4-20020ad442040000b02902961c39935cso6970764qvp.8
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 12:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=29SPvxPVQ0+aj9h4WhYrD9uwRhZ/3csk1qtrjUjwTJI=;
 b=ilXSZ3e1qM34Y7i8AS/WImxt7pexmy+GfeKStHCz+6P+6QOtguyhtzn60DazMIEb2U
 oBbP1AkucejYbhl3Tlzf8nypXnMVg3FKSOomCh7oRtklvU+PWDidfK8aNbcobc6XJPhE
 +eI4Dg/YPpvCctxVwVRvPD3UlvKDGY6/hZn4s/dVumW4xNbGggZqMatML5pV5sSquq3C
 lZvRuMlvn+Rat+twY/YokjYf9WJYVha0WpZw012s0i4fpqIRv2P8GOgHVdOjeJQ8gK6G
 JVXTyLPRe9NfDKCyu4OMSfPBh2Fn8LkoHRdfG0+Npoa/1+db5syiEyFOiKIggjIVW8Og
 L+EQ==
X-Gm-Message-State: AOAM531lH0s0XARb11lDa6+4KI9o7Ue0SlCvEbUL24Ge56qPA6wjcBaV
 ACe8mVv1THwZN72qkqinn2wOqTEbGFDdWfqMHyWZPD7JV78rJFxgrIo71GGg8T1VRmg3DUyg6lk
 hrKToxX7pW5jAwbi8zkfrY+nWVeGA
X-Received: by 2002:ad4:5f8c:: with SMTP id jp12mr1086890qvb.37.1625255443926; 
 Fri, 02 Jul 2021 12:50:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxW/pFCKi5bwD15NnkBDOU0SdiHCeccT+EjQeuAb2xh34kiNOtKwHCq9x9h32qHxSz6gWx7IA==
X-Received: by 2002:ad4:5f8c:: with SMTP id jp12mr1086857qvb.37.1625255443708; 
 Fri, 02 Jul 2021 12:50:43 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id k8sm1853417qkj.46.2021.07.02.12.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 12:50:43 -0700 (PDT)
Message-ID: <ecd705dad88c4ea1331edc269f136aca4a5e63d5.camel@redhat.com>
Subject: Re: [PATCH v2] drm/dp_mst: Fix return code on sideband message failure
From: Lyude Paul <lyude@redhat.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
 sean@poorly.run,  swboyd@chromium.org
Date: Fri, 02 Jul 2021 15:50:42 -0400
In-Reply-To: <1625008068-16458-1-git-send-email-khsieh@codeaurora.org>
References: <1625008068-16458-1-git-send-email-khsieh@codeaurora.org>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

JFYI: will try to take a look at this at the start of next week

On Tue, 2021-06-29 at 16:07 -0700, Kuogee Hsieh wrote:
> From: Rajkumar Subbiah <rsubbia@codeaurora.org>
> 
> Commit 2f015ec6eab6 ("drm/dp_mst: Add sideband down request tracing +
> selftests") added some debug code for sideband message tracing. But
> it seems to have unintentionally changed the behavior on sideband message
> failure. It catches and returns failure only if DRM_UT_DP is enabled.
> Otherwise it ignores the error code and returns success. So on an MST
> unplug, the caller is unaware that the clear payload message failed and
> ends up waiting for 4 seconds for the response. Fixes the issue by
> returning the proper error code.
> 
> Changes in V2:
> -- Revise commit text as review comment
> -- add Fixes text
> 
> Fixes: 2f015ec6eab6 ("drm/dp_mst: Add sideband down request tracing +
> selftests")
> 
> Signed-off-by: Rajkumar Subbiah <rsubbia@codeaurora.org>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 1590144..8d97430 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -2887,11 +2887,13 @@ static int process_single_tx_qlock(struct
> drm_dp_mst_topology_mgr *mgr,
>         idx += tosend + 1;
>  
>         ret = drm_dp_send_sideband_msg(mgr, up, chunk, idx);
> -       if (unlikely(ret) && drm_debug_enabled(DRM_UT_DP)) {
> -               struct drm_printer p = drm_debug_printer(DBG_PREFIX);
> +       if (unlikely(ret)) {
> +               if (drm_debug_enabled(DRM_UT_DP)) {
> +                       struct drm_printer p =
> drm_debug_printer(DBG_PREFIX);
>  
> -               drm_printf(&p, "sideband msg failed to send\n");
> -               drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
> +                       drm_printf(&p, "sideband msg failed to send\n");
> +                       drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
> +               }
>                 return ret;
>         }
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

