Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90956273C73
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED8F6E7E6;
	Tue, 22 Sep 2020 07:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6852E6E03C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 07:37:46 +0000 (UTC)
Received: from mail-oo1-f69.google.com ([209.85.161.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <koba.ko@canonical.com>) id 1kKcrw-0006Gs-RF
 for dri-devel@lists.freedesktop.org; Tue, 22 Sep 2020 07:37:44 +0000
Received: by mail-oo1-f69.google.com with SMTP id p6so8206430ooo.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 00:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KdoGIl1yU6ytmBIfhkEKpDjTjVXRjNQ+L3QzfJwexIY=;
 b=jZyqjSyNG0P2vYFvm3jlrUmP0cDVWzlwavgLEBgkwYQ+nQ7+nQEUAa0OX4v665Bxx3
 moWSMZnYtPJ/tdh3GrXDsnSvy4A3YimMbmIuhSexLbjIYUgPGSKeSY2Vr/O5cz3zi6cT
 gqzLsFKSFC9KS/NqSzwGeq+JeyE9pM0nBpCQmPBI+Y1zMcfZHh0Z+7GQHcBboxGT0V7V
 tJi+iEktqvwRDhRAWd6lUx3IsJ9+qnZLpdm7E+9Aruug1UyL6SGySjG3URfdntaMBz21
 ztP8Yh+8AX4TO/fwe+zMxAZqeiswRZjgynxxH3y3JjRaWdejgk79I0lt8GDWBpbw+NLw
 wWAQ==
X-Gm-Message-State: AOAM532YtCW7SY+R124y+E8mBhp3Sb/4xER7TX9Iy/B4NciAj5nQsuS2
 KwRth8GDCRdZ7p+1l/5ZoMxrYOsbCUu6ROqj0Eo3PgSzjP24en+cWi6awNyoL6F9Nd3V8wIvjEN
 FLb5jnPOQ5PlRGHV3pmDeSQttYJSweoFeuDuWdsjERUomzPI9wLaNQbKesjLkmw==
X-Received: by 2002:aca:603:: with SMTP id 3mr1880709oig.49.1600760263785;
 Tue, 22 Sep 2020 00:37:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDowMCJZmD1z8PQlqQGJLpOU6i5dqO2/P4MprMH+CP5yRJLk0CxFmkY7hPwXWFWcEySoIoM9DTtDGhS+tkrH8=
X-Received: by 2002:aca:603:: with SMTP id 3mr1880697oig.49.1600760263461;
 Tue, 22 Sep 2020 00:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200911034431.29059-1-koba.ko@canonical.com>
 <5f99b65c8a092df343c68249f2bce62e4cd0abff.camel@redhat.com>
In-Reply-To: <5f99b65c8a092df343c68249f2bce62e4cd0abff.camel@redhat.com>
From: Koba Ko <koba.ko@canonical.com>
Date: Tue, 22 Sep 2020 15:37:32 +0800
Message-ID: <CAJB-X+W4uUpcBH6mD-oZASCMjJ2LALQ0LAX_2aCZy5STQpEquQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/dp_mst: Retrieve extended DPCD caps for topology
 manager
To: Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:35 +0000
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

On Tue, Sep 22, 2020 at 2:11 AM Lyude Paul <lyude@redhat.com> wrote:
>
> Hi, sorry I lost track of this until just now. Comments down below:
>
Sorry, the wrong base. I will modify it based on v2 and will send  v4.
> On Fri, 2020-09-11 at 11:44 +0800, Koba Ko wrote:
> > As per DP-1.3, First check DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT.
> > If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 1, read the DP_DP13_DPCD_REV to
> > get the faster capability.
> > If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 0, read DP_DPCD_REV.
> >
> > Signed-off-by: Koba Ko <koba.ko@canonical.com>
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > ---
> > Changelog:
> > 1. Adjust the commit message.
> > 2. use drm_dbg_kms instead and print the return code.
> > ---
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 14 +++-----------
> >  1 file changed, 3 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index 7753c718ddf9..63f8809b9aa4 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -3671,8 +3671,6 @@ EXPORT_SYMBOL(drm_dp_read_mst_cap);
> >  int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr,
> > bool mst_state)
> >  {
> >       int ret = 0;
> > -     u8 dpcd_ext = 0;
> > -     unsigned int dpcd_offset = 0;
> >       struct drm_dp_mst_branch *mstb = NULL;
> >
> >       mutex_lock(&mgr->payload_lock);
> > @@ -3686,17 +3684,11 @@ int drm_dp_mst_topology_mgr_set_mst(struct
> > drm_dp_mst_topology_mgr *mgr, bool ms
> >               struct drm_dp_payload reset_pay;
> >
> >               WARN_ON(mgr->mst_primary);
> > -             drm_dp_dpcd_read(mgr->aux,
> > -                              DP_TRAINING_AUX_RD_INTERVAL,
> > -                              &dpcd_ext, sizeof(dpcd_ext));
> > -
> > -             dpcd_offset =
> > -                     ((dpcd_ext & DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT)
> > ?  DP_DP13_DPCD_REV : DP_DPCD_REV);
>
>
> Uh, are you sure you formatted this patch correctly? None of these hunks are present upstream, this looks like it's a diff for the previous version of this patch that you sent out
> >
> >               /* get dpcd info */
> > -             ret = drm_dp_dpcd_read(mgr->aux, dpcd_offset, mgr->dpcd,
> > DP_RECEIVER_CAP_SIZE);
> > -             if (ret != DP_RECEIVER_CAP_SIZE) {
> > -                     DRM_DEBUG_KMS("failed to read DPCD\n");
> > +             ret = drm_dp_read_dpcd_caps(mgr->aux, mgr->dpcd);
> > +             if (ret < 0) {
> > +                     drm_dbg_kms(mgr->dev, "failed to read DPCD, ret %d\n",
> > ret);
> >                       goto out_unlock;
> >               }
> >
> --
> Cheers,
>         Lyude Paul (she/her)
>         Software Engineer at Red Hat
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
