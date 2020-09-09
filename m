Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABAC2627E3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435616E9F2;
	Wed,  9 Sep 2020 07:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E096E991
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 06:32:00 +0000 (UTC)
Received: from mail-oi1-f200.google.com ([209.85.167.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <koba.ko@canonical.com>) id 1kFteA-0000w7-Lc
 for dri-devel@lists.freedesktop.org; Wed, 09 Sep 2020 06:31:58 +0000
Received: by mail-oi1-f200.google.com with SMTP id 6so532355oix.6
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 23:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tt9naxs3e2ZAHwC5wB+w1syKG9EDUzrC63aR5SbSofw=;
 b=jZAeTGFQp0TRkqCYhwefw9mQej/VILI5Nz9olwFikERf68Xf7IZFv5vIKSszcv4wbl
 +r5ln47OyYplDhbfMaFa546ez0VT3ZpppPTZYWXH3WY8fc3TFmLINeFL6misQ3EZbnKg
 8R0S2/NzxoYOrJdWtZ7bUvgfRymYn9oHXh5l7/hBx9FW0XXnofYZfd+hpqUCJtp2w6aW
 2OLmzYGLnzvbFsbCPqn+wroN4+V9cTnFxm7gL97lAYYOoDmvUUqvg70e4U7wDpTR2g65
 WWjQZ5aOLHrXb1N5g+h2PANQDxwwscRkEGMMfQIZcokbQszTjDIrDOm9b1q6/EIcCWt2
 sgCw==
X-Gm-Message-State: AOAM532xY3KUSFZXi5pB9tf+m6uBRQS8mJUJQLyAkeqhyCaX1+x2shNd
 9IiONRW+D/ngEiBeg0qKfMF5YWxzVnEPbn8u3NH1lC8MCjpxn1Tnny4kG3qQxfyc5bFmGzhj3vn
 Mb+2bA3ud1Libf/5iHeqZr1IZGlygtuAUWUwttmhsiQFv8wVvCg9uwyionCmVpQ==
X-Received: by 2002:a05:6830:20d8:: with SMTP id
 z24mr1940342otq.3.1599633117554; 
 Tue, 08 Sep 2020 23:31:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIgOfVj1Xg5MKBylPjHguycQ6vULKoi57GYsxKum8ZxbTrhGYO63dGWYCJKkz5ED1KgcVWPeVGQh57Xbg2PK4=
X-Received: by 2002:a05:6830:20d8:: with SMTP id
 z24mr1940322otq.3.1599633117150; 
 Tue, 08 Sep 2020 23:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200827053053.11271-1-koba.ko@canonical.com>
In-Reply-To: <20200827053053.11271-1-koba.ko@canonical.com>
From: Koba Ko <koba.ko@canonical.com>
Date: Wed, 9 Sep 2020 14:31:46 +0800
Message-ID: <CAJB-X+WPiUR8N5sLMS2UC-rPHj=TGJy2ezeBPjjeUXzbN5bfcg@mail.gmail.com>
Subject: Re: [PATCH] drm/dp: For MST hub, Get max_link_rate&max_lane from
 extended rx capability field if EXTENDED_RECEIVER_CAPABILITY_FILED_PRESENT is
 set.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, lyude@redhat.com
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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
Cc: Anthony Wong <anthony.wong@canonical.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 27, 2020 at 1:30 PM Koba Ko <koba.ko@canonical.com> wrote:
>
> Currently, DRM get the capability of the mst hub only from DP_DPCD_REV and
> get the slower speed even the mst hub can run in the faster speed.
>
> As per DP-1.3, First check DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT.
> If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 1, read the DP_DP13_DPCD_REV to
> get the faster capability.
> If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 0, read DP_DPCD_REV.
>
> Signed-off-by: Koba Ko <koba.ko@canonical.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 67dd72ea200e..3b84c6801281 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -3497,6 +3497,8 @@ static int drm_dp_get_vc_payload_bw(u8 dp_link_bw, u8  dp_link_count)
>  int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool mst_state)
>  {
>         int ret = 0;
> +       u8 dpcd_ext = 0;
> +       unsigned int dpcd_offset = 0;
>         struct drm_dp_mst_branch *mstb = NULL;
>
>         mutex_lock(&mgr->payload_lock);
> @@ -3510,9 +3512,15 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
>                 struct drm_dp_payload reset_pay;
>
>                 WARN_ON(mgr->mst_primary);
> +               drm_dp_dpcd_read(mgr->aux,
> +                                DP_TRAINING_AUX_RD_INTERVAL,
> +                                &dpcd_ext, sizeof(dpcd_ext));
> +
> +               dpcd_offset =
> +                       ((dpcd_ext & DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT) ?  DP_DP13_DPCD_REV : DP_DPCD_REV);
>
>                 /* get dpcd info */
> -               ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, mgr->dpcd, DP_RECEIVER_CAP_SIZE);
> +               ret = drm_dp_dpcd_read(mgr->aux, dpcd_offset, mgr->dpcd, DP_RECEIVER_CAP_SIZE);
>                 if (ret != DP_RECEIVER_CAP_SIZE) {
>                         DRM_DEBUG_KMS("failed to read DPCD\n");
>                         goto out_unlock;
> --
> 2.25.1
>
Add Lyude Paul
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
