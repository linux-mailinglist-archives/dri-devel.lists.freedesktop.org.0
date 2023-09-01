Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ABC790313
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 23:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C962310E1C4;
	Fri,  1 Sep 2023 21:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C9A10E1CB
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 21:14:10 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2bd0a5a5abbso40112731fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 14:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693602849; x=1694207649;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cJtqGU4cc4Ge9UOEzXJZRxF5YcKTHQn7jqtstZ/lce0=;
 b=iXuLb2oOFJK6X0WZ0gxXkqRG/RjrsPqY++bdwaSBnAT0JFLDmoVvRwpOVRHNnq7hxI
 gBILnRxP6e0HNuUwa54Ww0qdJcss5An3jD2h8/+2pSdWDEccNz9yeYKkHI23NeJr4U3L
 MOfB4J0Wo0wJcy2waeuB1tlIxuv6gJwDDA8M0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693602849; x=1694207649;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cJtqGU4cc4Ge9UOEzXJZRxF5YcKTHQn7jqtstZ/lce0=;
 b=EdFMmmWE6IF9uZS6gufaA5OJAh46Gi5hCovg12AErAg8h6wqTJ5ld7wPwaLlcwmM7q
 EaWzuGa/RxH2/iDZ+3qaUaGM25CBKmvcpZdbi6J9ZddoAjBgm5Kbuj+yaH8NUDDp+LrS
 EGa+7/E3hsJ09jAYrDYWrq+iZGVFBgcxNoeIQ4U7JgYhnvd2edQh5QL/vYZGWC1JF+7z
 5Z6oha1FY4/AxE+zdOhw27EU6cPtwc7Vd/oIRvBylEOI9LkMy4+f5Z14qDs7rAFyVPcm
 RNU6S/ATC65XDYWGZ0qPtgPwFb33W1g72G9gw4ldjarnPSfL8BoV7Yr8MR/WG4QbJ1YP
 01Eg==
X-Gm-Message-State: AOJu0YxLwo6wxnZRDRDBPpesbgn8ucJJxH7phcCSR0yVyXm4GP1OWbNI
 hm09stvV3st+mr5qUepo2FgSBno3XZmDW3y+pJkeQg==
X-Google-Smtp-Source: AGHT+IH90min5DveQz/5E+2JTuSY1DYgvEbfXPZKEl3pzzZ4KD2nAC7EaR2cLme4gJbthWu9PIz6qHburQlD/igoN3U=
X-Received: by 2002:a2e:8506:0:b0:2b9:d7b7:36d4 with SMTP id
 j6-20020a2e8506000000b002b9d7b736d4mr2450757lji.16.1693602848495; Fri, 01 Sep
 2023 14:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230824205335.500163-1-gildekel@chromium.org>
 <20230824205335.500163-6-gildekel@chromium.org> <ZPIzl/a60uD4FTRI@intel.com>
In-Reply-To: <ZPIzl/a60uD4FTRI@intel.com>
From: Gil Dekel <gildekel@chromium.org>
Date: Fri, 1 Sep 2023 17:13:57 -0400
Message-ID: <CAOD+-Q49q=WJCMDCiP0gZzRTK9-n2zxeYZF_9FeSEH9UvCLdoA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v4 5/6] drm/i915/dp_link_training: Set all
 downstream MST ports to BAD before retrying
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: intel-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 1, 2023 at 2:55=E2=80=AFPM Rodrigo Vivi <rodrigo.vivi@intel.com=
> wrote:
>
> On Thu, Aug 24, 2023 at 04:50:20PM -0400, Gil Dekel wrote:
> > Before sending a uevent to userspace in order to trigger a corrective
> > modeset, we change the failing connector's link-status to BAD. However,
> > the downstream MST branch ports are left in their original GOOD state.
> >
> > This patch utilizes the drm helper function
> > drm_dp_set_mst_topology_link_status() to rectify this and set all
> > downstream MST connectors' link-status to BAD before emitting the ueven=
t
> > to userspace.
> >
> > Signed-off-by: Gil Dekel <gildekel@chromium.org>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/=
i915/display/intel_dp.c
> > index 42353b1ac487..e8b10f59e141 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -5995,16 +5995,20 @@ static void intel_dp_modeset_retry_work_fn(stru=
ct work_struct *work)
> >       struct intel_dp *intel_dp =3D
> >               container_of(work, typeof(*intel_dp), modeset_retry_work)=
;
> >       struct drm_connector *connector =3D &intel_dp->attached_connector=
->base;
> > -     drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s]\n", connector->bas=
e.id,
> > -                 connector->name);
> >
> > -     /* Grab the locks before changing connector property*/
> > -     mutex_lock(&connector->dev->mode_config.mutex);
> > -     /* Set connector link status to BAD and send a Uevent to notify
> > -      * userspace to do a modeset.
> > +     /* Set the connector's (and possibly all its downstream MST ports=
') link
> > +      * status to BAD.
> >        */
> > +     mutex_lock(&connector->dev->mode_config.mutex);
> > +     drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] link status %d -> =
%d\n",
> > +                 connector->base.id, connector->name,
> > +                 connector->state->link_status, DRM_MODE_LINK_STATUS_B=
AD);
> >       drm_connector_set_link_status_property(connector,
> >                                              DRM_MODE_LINK_STATUS_BAD);
> > +     if (intel_dp->is_mst) {
> > +             drm_dp_set_mst_topology_link_status(&intel_dp->mst_mgr,
> > +                                                 DRM_MODE_LINK_STATUS_=
BAD);
>
> Something is weird with the locking here.
> I noticed that on patch 3 this new function also gets the same
> mutex_lock(&connector->dev->mode_config.mutex);
>
> Since you didn't reach the deadlock, I'm clearly missing something
> on the flow. But regardless of what I could be missing, I believe
> this is totally not future proof and we will for sure hit dead-lock
> cases.
>
You are not wrong.

Something must have been wrong in my workflow, as I was positive I
tested the code with this lock, but I must remember wrong. I tried
testing my current code and it immediately locked, as you expected.
So thank you for catching this.

Lyude's original patch didn't include drm_dp_set_mst_topology_link_status()
as an exposed drm helper function, so when I adjusted it for this series, I
decided to add locks similar to how her other function using
drm_dp_set_mst_topology_link_status() did. However, I failed to use the
right lock, which is:
drm_modeset_lock(&connector->dev->mode_config.connection_mutex, NULL);
drm_modeset_unlock(&connector->dev->mode_config.connection_mutex);
This is similar to how drm_connector_set_link_status_property() locks
before writing to link_status.

I made sure to test my code with the above locks, and it runs well. Here's
an instrumented log excerpt for failing link-training with an MST hub
(I hacked the driver to always fail non eDP connectors and print the
raw pointer addresses of the drm_device and mutex right before locking):
[   43.466329] i915 0000:00:02.0: [drm] *ERROR* Link Training
Unsuccessful via gildekel HACK - (not eDP)
[   43.594950] i915 0000:00:02.0: [drm] *ERROR* Link Training
Unsuccessful via gildekel HACK - (not eDP)
[   43.594979] i915 0000:00:02.0: [drm] *ERROR* Link Training Unsuccessful
[   43.595023] i915 0000:00:02.0: [drm] *ERROR* [CONNECTOR:273:DP-3]:
[   43.595028] i915 0000:00:02.0: [drm] *ERROR*
connector->dev=3D00000000d4850450
[   43.595033] i915 0000:00:02.0: [drm] *ERROR*
connector->dev->mode_config.mutex=3D00000000aac3fe45
[   44.771091] i915 0000:00:02.0: [drm] *ERROR*
[MST-CONNECTOR:300:DP-5]:
[   44.771108] i915 0000:00:02.0: [drm] *ERROR*
connector->dev=3D000000003fb97435
[   44.771115] i915 0000:00:02.0: [drm] *ERROR*
&connector->dev->mode_config.connection_mutex=3D000000009aece20e
[   44.771127] i915 0000:00:02.0: [drm] *ERROR*
[MST-CONNECTOR:303:DP-6]:
[   44.771132] i915 0000:00:02.0: [drm] *ERROR*
connector->dev=3D0000000075236b75
[   44.771137] i915 0000:00:02.0: [drm] *ERROR*
&connector->dev->mode_config.connection_mutex=3D000000009aece20e

Also, I was under the assumption that all connectors in an MST topology
should reference the same drm_device object, but it seems like that's
not the case. Is my assumption wrong?

> > +     }
> >       mutex_unlock(&connector->dev->mode_config.mutex);
> >       /* Send Hotplug uevent so userspace can reprobe */
> >       drm_kms_helper_connector_hotplug_event(connector);
> > --
> > Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics


Thanks for your time and comments!
--
Best,
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics
