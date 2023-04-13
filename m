Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A218D6E0DDE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 14:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1AA10E34A;
	Thu, 13 Apr 2023 12:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E7610E34A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 12:58:44 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1879edfeff5so475844fac.4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 05:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681390723; x=1683982723;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rXjaBjti/iUKdry4pNZBLkaqpq0jQFzIVSNb+LjTSOQ=;
 b=GoxhB8EAWQLdu/H8D47oCGd/cfMPV2dy4XSBNDggUf5GV2RkgV107+ijoGDiV8RWD2
 7OzTimBVJWeMzkRFKh2OH7uSc5N87ODop70VIkkxcSeeMyb9S11wjdQdk1g+crnDytj+
 RwZ6adC+ZcMp2dMa/WQpTGY1Jn8+iwi30NQx2uZ9qC1G1UzNGlfhu5jq1sZNjg5jEGh1
 6yhDJnDms8pLt5wdhKvGXeZIYvj1bjDCYqjp6f2rPNrIeCA2ghNd4zRcaHXSDRfWMswJ
 13HHrdSLTJh3VeyZxN1sNrbTEFSZHizpoeqGhYyJYh3wgM11JL/DwuLkvmEkeSnaj+Tj
 GWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681390723; x=1683982723;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rXjaBjti/iUKdry4pNZBLkaqpq0jQFzIVSNb+LjTSOQ=;
 b=j+rYyZ+sIepT5NIe5kedP/69P6H05m90JCq7L7sSM89G7dQrWN2pazAwew76sFQErr
 dZpo2DK2KRvXeBEw6C95+jeJYNO5i4gIxE9tMf6PCwVoJ1zO/2dECESmypO8EHrYpmLz
 8Lt8MXfYODavg9TmvLGmz8XM7mTnjV0TMICy9jtWXPMn2IeXgpfhi4w1xXvFKC9FgBqk
 1yDXiULv/3/gLSVSsq/bPSEHTOb70fTkR1Ptp+PEtkgNKi8E3d/iYB6ARhsJIIrWUIBl
 u8oPoNCgEV8qtoKGQFklWXpp98pf33q2iz50cOrjp29fBtl2XKvRBJw02F94k8IW+Sye
 qQpA==
X-Gm-Message-State: AAQBX9enXQtUSVSZ8BMao1C+albU+467L/GIPXCoUsZWtv2FYFhYh7vw
 hiMsiKKT4e9oZRpRhuGahCI1KEW+z0fUTF+tWi8=
X-Google-Smtp-Source: AKy350Z1y9dM8iDVgqISOzZ8l/mDEHlY3dZL7T9/F8xpHHg9PmiemxUsmXcY7nQjhZqbl+/yA+iAn6qjSqRrUiZSI2Y=
X-Received: by 2002:a05:6870:390d:b0:184:2e38:c7af with SMTP id
 b13-20020a056870390d00b001842e38c7afmr1270788oap.3.1681390723671; Thu, 13 Apr
 2023 05:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230413111254.22458-1-jlayton@kernel.org>
 <87edooarpq.fsf@intel.com>
In-Reply-To: <87edooarpq.fsf@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 13 Apr 2023 08:58:32 -0400
Message-ID: <CADnq5_PVnYMSiKO77+cfg_V-tDKYkVJYN3qGNb1vhQO3QtXskA@mail.gmail.com>
Subject: Re: [PATCH] drm: make drm_dp_add_payload_part2 gracefully handle NULL
 state pointer
To: Jani Nikula <jani.nikula@linux.intel.com>, Wayne Lin <Wayne.Lin@amd.com>
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Wayne

On Thu, Apr 13, 2023 at 8:31=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Thu, 13 Apr 2023, Jeff Layton <jlayton@kernel.org> wrote:
> > I've been experiencing some intermittent crashes down in the display
> > driver code. The symptoms are ususally a line like this in dmesg:
> >
> >     amdgpu 0000:30:00.0: [drm] Failed to create MST payload for port 00=
0000006d3a3885: -5
> >
> > ...followed by an Oops due to a NULL pointer dereference.
> >
> > The real bug is probably in the caller of this function, which is
> > passing it a NULL state pointer, but this patch at least keeps my
> > machine from oopsing when this occurs.
>
> My fear is that papering over this makes the root cause harder to find.
>
> Cc: Harry, Alex
>
>
> BR,
> Jani.
>
>
> >
> > Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2184855
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gp=
u/drm/display/drm_dp_mst_topology.c
> > index 38dab76ae69e..87ad406c50f9 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -3404,7 +3404,8 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_to=
pology_mgr *mgr,
> >
> >       /* Skip failed payloads */
> >       if (payload->vc_start_slot =3D=3D -1) {
> > -             drm_dbg_kms(state->dev, "Part 1 of payload creation for %=
s failed, skipping part 2\n",
> > +             drm_dbg_kms(state ? state->dev : NULL,
> > +                         "Part 1 of payload creation for %s failed, sk=
ipping part 2\n",
> >                           payload->port->connector->name);
> >               return -EIO;
> >       }
>
> --
> Jani Nikula, Intel Open Source Graphics Center
