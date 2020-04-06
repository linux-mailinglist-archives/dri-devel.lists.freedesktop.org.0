Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B518D19FE59
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 21:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70ED6E48D;
	Mon,  6 Apr 2020 19:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924FA6E48D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 19:46:07 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id x16so675514ilp.12
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 12:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1pqdM4albOPOy3AZvC52W1X+oMJ+ayp+9lG6bAjF590=;
 b=EJZ4+f8FXWMH9z7TXBeHek+lsf+bw3y0S6R+vNG8yqluQyLJU9UHQc1j6V2FdbQozw
 NWWwLzOsKgIzPavdkMoe6B/0uHbk4InVuIhtu5Ij3bTCPw4DxD+435BQHbB9WS/6nOwL
 Ytft9w2UTujVbdkvuyXCXR9z+1LAszxrsZ2Y64wwLs1IO2HE05aW63dxyn8Bg7My2/7E
 BPHKrzR0ZqG+R4mpOFUINLUx/Y/CXhVcyO6We88jUiYLK+LO5fHRp8KajrQoISnM05Dw
 eMPbKWtHv5IjaDFpybeSf4zKR+uMk79mhaO3sSdXsOc7Y9PXWlRY9MyKXO0JB/H6g1si
 SJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1pqdM4albOPOy3AZvC52W1X+oMJ+ayp+9lG6bAjF590=;
 b=WS1cd3IUqdumzMIUYig3sQhD/PGv1W8Fz9vYCaK2bCGW8yHUCI7E7kQr4z3D8sik8J
 zOTWquI7RFK0Ige9R6O/PpVULCn8cMV5puKUm9ugatiMk9AG1K8o7OnOSYulCcXMbJBq
 kE0+7YPb1vE4H2vndWaY9epltHujYFgeZvpAJvFD8BpBPFau06idd6DEBftMIl7Dxq9B
 uycvoL5pElliPVBqeErnxAPmjo9IY/TyiSLsqgHFiMccoyzs3jf9P9IWTcaFWMAeSiFD
 zGYI0mEOzi0LbdV4TXB4uV3CKOFyu5FGnUwkejP0zTI92d5UtJZlo6eeksBvwg8XLkyM
 B86A==
X-Gm-Message-State: AGi0PuZ9km7SC7v7lNC+mua8Uqqnmwkhzugz4dm2BZ2O/nEzQcNhHff5
 K5pH87UBVOaK38+bVk3zZLjJlccjqPrhqROtCPrYgw==
X-Google-Smtp-Source: APiQypIzxUc9lo8BfgwCF7ePRKNh7UGZuyaMOHCzkUQNYY3Os8wHIXONk+oHbmhLDFH2B5S1ofvx8r8osaKrZ9Rz8mw=
X-Received: by 2002:a92:1dd9:: with SMTP id g86mr1095904ile.2.1586202367018;
 Mon, 06 Apr 2020 12:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200406193352.1245985-1-lyude@redhat.com>
In-Reply-To: <20200406193352.1245985-1-lyude@redhat.com>
From: Sean Paul <sean@poorly.run>
Date: Mon, 6 Apr 2020 15:45:31 -0400
Message-ID: <CAMavQK+tFSVx068FKnxD0X6TMWnf_TKPHy4ZmR=CD8kGtk5A_w@mail.gmail.com>
Subject: Re: [PATCH] drm/dp_mst: Fix NULL deref in drm_dp_get_one_sb_msg()
To: Lyude Paul <lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Wayne Lin <Wayne.Lin@amd.com>,
 Wayne Lin <waynelin@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 6, 2020 at 3:34 PM Lyude Paul <lyude@redhat.com> wrote:
>
> While we don't need this function to store an mstb anywhere for UP
> requests since we process them asynchronously, we do need to make sure
> that we don't try to write to **mstb for UP requests otherwise we'll
> cause a NULL pointer deref:
>
>     RIP: 0010:drm_dp_get_one_sb_msg+0x4b/0x460 [drm_kms_helper]
>     Call Trace:
>      ? vprintk_emit+0x16a/0x230
>      ? drm_dp_mst_hpd_irq+0x133/0x1010 [drm_kms_helper]
>      drm_dp_mst_hpd_irq+0x133/0x1010 [drm_kms_helper]
>      ? __drm_dbg+0x87/0x90 [drm]
>      ? intel_dp_hpd_pulse+0x24b/0x400 [i915]
>      intel_dp_hpd_pulse+0x24b/0x400 [i915]
>      i915_digport_work_func+0xd6/0x160 [i915]
>      process_one_work+0x1a9/0x370
>      worker_thread+0x4d/0x3a0
>      kthread+0xf9/0x130
>      ? process_one_work+0x370/0x370
>      ? kthread_park+0x90/0x90
>      ret_from_fork+0x35/0x40
>
> So, fix this.

Ugggh, what a fail! I found this in Feb and posted the patch in
20200218171522.GF253734@art_vandelay. I had to migrate my workstation
due to WFH order and didn't apply the patch before pushing. Messy
messy messy.

Thanks for fixing!

Reviewed-by: Sean Paul <sean@poorly.run>

>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: fbc821c4a506 ("drm/mst: Support simultaneous down replies")
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Wayne Lin <waynelin@amd.com>
> Cc: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 1ff49547b2e8..8751278b3941 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -3703,7 +3703,8 @@ static bool drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up,
>         int basereg = up ? DP_SIDEBAND_MSG_UP_REQ_BASE :
>                            DP_SIDEBAND_MSG_DOWN_REP_BASE;
>
> -       *mstb = NULL;
> +       if (!up)
> +               *mstb = NULL;
>         *seqno = -1;
>
>         len = min(mgr->max_dpcd_transaction_bytes, 16);
> --
> 2.25.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
