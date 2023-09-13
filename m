Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4351979F26F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 21:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E522710E1D8;
	Wed, 13 Sep 2023 19:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B127D10E1AA;
 Wed, 13 Sep 2023 19:54:32 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1d577c89a4fso123511fac.1; 
 Wed, 13 Sep 2023 12:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694634872; x=1695239672; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=osCTzI9cCYtzIuEZzi5z7ouWZ4LnqWzf0G6j+lNBEFY=;
 b=ot3BFl7XOfmZgb5JRc7307hg4zS/9a92qOtpYdcyP8eV/Hyhl8GJhAPCHqGatp5GOo
 GpzFzQotN9V3Cqfum9ceP0ru6b8F0rd5MpB8r4/bSAOmfeu9Qa/3z525QnDer7bTTeZV
 9txWYeyLEdfMvQ5rn0JSUrjZ5rd8oEKZqVyZAfnZJXBHZ2mYRYDebV3/jaO0jWYjFl/J
 yXiIpu6EXMIuJoj8xAmSHPFcVdHR2maPDkEJ1F03Glrtkfq44+i7AfLCP3pmhlfqIzd/
 SYF2k+P6/rBbnzTB5XdTMXrT3HQUKbPrm+K6HJOAyVleuy5LpYmUETFf9CSKKGNfHlBW
 Qtaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694634872; x=1695239672;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=osCTzI9cCYtzIuEZzi5z7ouWZ4LnqWzf0G6j+lNBEFY=;
 b=SCeJhHzbFg5oZ32ZndyHlhaFq/uQO7QYR/cb2esUyUcJubOye+8slOy3z8Mv0y9Fb7
 yixIc2fmEEq2ErkXGGubWtcT/b0UxzJKOFCFDvgmsqebMKp0RFdWXDExArkcrxGI2vWH
 JynStombG52Io4La5h0FVBt14/1MeiKiQ7YKcb0GOXruHtpoeWVI5Z+Qhu3FFAWQdC7Z
 Fy8fBmMKi1Wv4a+3JTLvk7OdTQiJRJ3tH/LQsIQJ5sDgVaE/oM5uWpis+xgp2fnNhu+o
 B+vfwt6cxpem3HPJmE+LlUIGvKxDTFmAlJDvVP92lHqOoOhx4HVbe6OL+6stPOpuQlG3
 KZAQ==
X-Gm-Message-State: AOJu0YzhsnDB9cyi0LI8HJxRg4Q/tl5Jn+SgAr1uqmPxNrn/0O2uQlzS
 8gB/c7oA8aJwv09qZswgA49joptVMHyp6swNpWg=
X-Google-Smtp-Source: AGHT+IFFiUKtj1CKnJq+Xei7nO7sjezhHA1Rs/tOdwnA4vpSxnZp2+wnMMXaGbu10QoLVHeTKAyYF6kNYzEuEmIMAoU=
X-Received: by 2002:a05:6870:65a5:b0:1bf:4f42:de91 with SMTP id
 fp37-20020a05687065a500b001bf4f42de91mr3748284oab.33.1694634871879; Wed, 13
 Sep 2023 12:54:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230913-fix-wuninitialized-dm_helpers_dp_mst_send_payload_allocation-v1-1-2d1b0a3ef16c@kernel.org>
 <b11cce07-7e13-49b5-aed3-88517356281b@amd.com>
In-Reply-To: <b11cce07-7e13-49b5-aed3-88517356281b@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 13 Sep 2023 15:54:20 -0400
Message-ID: <CADnq5_MsHwC94F_2SdyUM39FRoeVZMNa-8quxB4TVOVqM05=zQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix -Wuninitialized in
 dm_helpers_dp_mst_send_payload_allocation()
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
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
Cc: ndesaulniers@google.com, llvm@lists.linux.dev, sunpeng.li@amd.com,
 trix@redhat.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 patches@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, dri-devel@lists.freedesktop.org,
 Wayne.Lin@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 13, 2023 at 12:17=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@amd.c=
om> wrote:
>
>
> On 9/13/23 12:10, Nathan Chancellor wrote:
> > When building with clang, there is a warning (or error when
> > CONFIG_WERROR is set):
> >
> >    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:=
368:21: error: variable 'old_payload' is uninitialized when used here [-Wer=
ror,-Wuninitialized]
> >      368 |                                                  new_payload=
, old_payload);
> >          |                                                             =
  ^~~~~~~~~~~
> >    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:=
344:61: note: initialize the variable 'old_payload' to silence this warning
> >      344 |         struct drm_dp_mst_atomic_payload *new_payload, *old_=
payload;
> >          |                                                             =
       ^
> >          |                                                             =
        =3D NULL
> >    1 error generated.
> >
> > This variable is not required outside of this function so allocate
> > old_payload on the stack and pass it by reference to
> > dm_helpers_construct_old_payload(), resolving the warning.
> >
> > Closes: https://github.com/ClangBuiltLinux/linux/issues/1931
> > Fixes: 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload allocation=
/removement")
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>
> Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>
> Hm, seems like this was pushed through drm-misc-next and as such our CI
> didn't get a chance to test it.

Can you push this to drm-misc?  That is where Wayne's patches landed.
If not, I can push it.

Alex


>
>
> > ---
> >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > index 9ad509279b0a..c4c35f6844f4 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > @@ -341,7 +341,7 @@ bool dm_helpers_dp_mst_send_payload_allocation(
> >       struct amdgpu_dm_connector *aconnector;
> >       struct drm_dp_mst_topology_state *mst_state;
> >       struct drm_dp_mst_topology_mgr *mst_mgr;
> > -     struct drm_dp_mst_atomic_payload *new_payload, *old_payload;
> > +     struct drm_dp_mst_atomic_payload *new_payload, old_payload;
> >       enum mst_progress_status set_flag =3D MST_ALLOCATE_NEW_PAYLOAD;
> >       enum mst_progress_status clr_flag =3D MST_CLEAR_ALLOCATED_PAYLOAD=
;
> >       int ret =3D 0;
> > @@ -365,8 +365,8 @@ bool dm_helpers_dp_mst_send_payload_allocation(
> >               ret =3D drm_dp_add_payload_part2(mst_mgr, mst_state->base=
.state, new_payload);
> >       } else {
> >               dm_helpers_construct_old_payload(stream->link, mst_state-=
>pbn_div,
> > -                                              new_payload, old_payload=
);
> > -             drm_dp_remove_payload_part2(mst_mgr, mst_state, old_paylo=
ad, new_payload);
> > +                                              new_payload, &old_payloa=
d);
> > +             drm_dp_remove_payload_part2(mst_mgr, mst_state, &old_payl=
oad, new_payload);
> >       }
> >
> >       if (ret) {
> >
> > ---
> > base-commit: 8569c31545385195bdb0c021124e68336e91c693
> > change-id: 20230913-fix-wuninitialized-dm_helpers_dp_mst_send_payload_a=
llocation-c37b33aaad18
> >
> > Best regards,
> --
> Hamza
>
