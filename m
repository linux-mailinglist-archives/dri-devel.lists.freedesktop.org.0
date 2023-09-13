Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5919279F3AB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 23:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72ADC10E10D;
	Wed, 13 Sep 2023 21:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF1610E10D;
 Wed, 13 Sep 2023 21:18:01 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-52a39a1c4d5so233849a12.3; 
 Wed, 13 Sep 2023 14:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694639879; x=1695244679; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EF449AIlL6XYD426YEW6S8zbtOg73mCSG4ZzOl+W5Oo=;
 b=ib/Qvk1UM4Rl4rbS2b2oTgzsMVwIhfJstZP9x6D5uq68SX6uOvl6CjdsEhqX89KkXv
 CTfoL9lYNW7n+2h0qTfeqv4vLi7gX/WQLrFBXki8W6mGTyId3SGoLR/JqLy1pyN38cD1
 ISeFfusBxAyRBT0veSeK+5vpLvF3xlorun+B9gY77AcLjV4UcnpWKqRK+rDXyEjuY+UQ
 RayEmNziPvUmb1cK6ju4nTlBtg/1lr46jXpITjnhpsFGE2ZQlF8mN5ZDfdmdNUyRd3A1
 e/8o6gXDIWCGNfQ3ErqSiZCeEsvPB0uTRB/95lIQ3EHU2hp4RtHVXh9twJ9Ci4zWHGy6
 SEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694639879; x=1695244679;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EF449AIlL6XYD426YEW6S8zbtOg73mCSG4ZzOl+W5Oo=;
 b=T3TVRJoOf8Dlx4xtIdQka92RarbdwYHWg4aUBlnBX6I10OHh2CuilSjThgj3LAi0hu
 9Q6tNdA8Rl/k2WzTR4nHZGF91Kt22NuyWzfObc8vaAE6YtvIOsiBVKZtmBJ5JGLVdm3N
 8NJI4HCLVp9myq4xknA6s5CRLWxQRmrbubX1BQLWMhEc3FXoRf5EDuZBwFeQAsSm2Dcc
 ACbBSxrQmKjxIGGKKqscctSmp7ok1SCGnUaRBk78cqD7HOpM1PzwucMct0slK6MI9v9s
 KU7vn+g9v3QK7eb/qKOh52OWeMYuAlg/rHGV/HYJysyxTLUgWhPqt1Qsb8GfcsOt34Hr
 gpXw==
X-Gm-Message-State: AOJu0Yx/bEY+mm542BwDmwYOSfRud53jA40TQIYIUpQ4x3WVJl3BP8In
 j0qwb0LMK7xF2lz/msanOXl3FlSrgLXHidcCDKM=
X-Google-Smtp-Source: AGHT+IETKy2hamoh5trTYjKH/mUZmeqeeIJzKFwxuCLL0meTkX20nzuzsF+vhZWUBzg2AV4JJHmDU2yE4G+n1Li3IIU=
X-Received: by 2002:aa7:c459:0:b0:523:bfec:4913 with SMTP id
 n25-20020aa7c459000000b00523bfec4913mr3340114edr.0.1694639879272; Wed, 13 Sep
 2023 14:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230913-fix-wuninitialized-dm_helpers_dp_mst_send_payload_allocation-v1-1-2d1b0a3ef16c@kernel.org>
 <b11cce07-7e13-49b5-aed3-88517356281b@amd.com>
 <CADnq5_MsHwC94F_2SdyUM39FRoeVZMNa-8quxB4TVOVqM05=zQ@mail.gmail.com>
 <b1396feb-9bd5-4aa4-97b1-9d743fffe5ef@amd.com>
 <CADnq5_NZ6Bv5zyNxJc13Bb4bPmHTTDPEWqtV_VFt5y1gzsgGzQ@mail.gmail.com>
 <327f018f-c810-4e99-8003-f0dfa9f7d156@amd.com>
In-Reply-To: <327f018f-c810-4e99-8003-f0dfa9f7d156@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 13 Sep 2023 17:17:45 -0400
Message-ID: <CADnq5_Oo9Qm+CHe3tdkN7fQ=ZMw5wZNssk3rxDRSPK8F9DxBDw@mail.gmail.com>
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

On Wed, Sep 13, 2023 at 4:46=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@amd.co=
m> wrote:
>
> On 9/13/23 16:03, Alex Deucher wrote:
> > On Wed, Sep 13, 2023 at 3:57=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@am=
d.com> wrote:
> >>
> >>
> >> On 9/13/23 15:54, Alex Deucher wrote:
> >>> On Wed, Sep 13, 2023 at 12:17=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz=
@amd.com> wrote:
> >>>>
> >>>>
> >>>> On 9/13/23 12:10, Nathan Chancellor wrote:
> >>>>> When building with clang, there is a warning (or error when
> >>>>> CONFIG_WERROR is set):
> >>>>>
> >>>>>      drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_help=
ers.c:368:21: error: variable 'old_payload' is uninitialized when used here=
 [-Werror,-Wuninitialized]
> >>>>>        368 |                                                  new_p=
ayload, old_payload);
> >>>>>            |                                                       =
        ^~~~~~~~~~~
> >>>>>      drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_help=
ers.c:344:61: note: initialize the variable 'old_payload' to silence this w=
arning
> >>>>>        344 |         struct drm_dp_mst_atomic_payload *new_payload,=
 *old_payload;
> >>>>>            |                                                       =
             ^
> >>>>>            |                                                       =
              =3D NULL
> >>>>>      1 error generated.
> >>>>>
> >>>>> This variable is not required outside of this function so allocate
> >>>>> old_payload on the stack and pass it by reference to
> >>>>> dm_helpers_construct_old_payload(), resolving the warning.
> >>>>>
> >>>>> Closes: https://github.com/ClangBuiltLinux/linux/issues/1931
> >>>>> Fixes: 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload alloca=
tion/removement")
> >>>>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> >>>>
> >>>> Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> >>>>
> >>>> Hm, seems like this was pushed through drm-misc-next and as such our=
 CI
> >>>> didn't get a chance to test it.
> >>>
> >>> Can you push this to drm-misc?  That is where Wayne's patches landed.
> >>> If not, I can push it.
> >>
> >> No need, I cherry-picked Wayne's patches to amd-staging-drm-next and
> >> applied Nathan's fix.
> >
> > Yes, but we can only have patches go upstream via one tree.  Wayne's
> > patches are in drm-misc, so that is where the fix should be.  It's
> > fine to have them in amd-staging-drm-next for testing purposes, but I
> > won't be upstreaming them via the amdgpu -next tree since they are
> > already in drm-misc.
>
> In that case can you push it to drm-misc?

Pushed.  Thanks!

Alex


Alex

>
> >
> > Alex
> >
> >>
> >>>
> >>> Alex
> >>>
> >>>
> >>>>
> >>>>
> >>>>> ---
> >>>>>     drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 6 +=
++---
> >>>>>     1 file changed, 3 insertions(+), 3 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helper=
s.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> >>>>> index 9ad509279b0a..c4c35f6844f4 100644
> >>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> >>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> >>>>> @@ -341,7 +341,7 @@ bool dm_helpers_dp_mst_send_payload_allocation(
> >>>>>         struct amdgpu_dm_connector *aconnector;
> >>>>>         struct drm_dp_mst_topology_state *mst_state;
> >>>>>         struct drm_dp_mst_topology_mgr *mst_mgr;
> >>>>> -     struct drm_dp_mst_atomic_payload *new_payload, *old_payload;
> >>>>> +     struct drm_dp_mst_atomic_payload *new_payload, old_payload;
> >>>>>         enum mst_progress_status set_flag =3D MST_ALLOCATE_NEW_PAYL=
OAD;
> >>>>>         enum mst_progress_status clr_flag =3D MST_CLEAR_ALLOCATED_P=
AYLOAD;
> >>>>>         int ret =3D 0;
> >>>>> @@ -365,8 +365,8 @@ bool dm_helpers_dp_mst_send_payload_allocation(
> >>>>>                 ret =3D drm_dp_add_payload_part2(mst_mgr, mst_state=
->base.state, new_payload);
> >>>>>         } else {
> >>>>>                 dm_helpers_construct_old_payload(stream->link, mst_=
state->pbn_div,
> >>>>> -                                              new_payload, old_pay=
load);
> >>>>> -             drm_dp_remove_payload_part2(mst_mgr, mst_state, old_p=
ayload, new_payload);
> >>>>> +                                              new_payload, &old_pa=
yload);
> >>>>> +             drm_dp_remove_payload_part2(mst_mgr, mst_state, &old_=
payload, new_payload);
> >>>>>         }
> >>>>>
> >>>>>         if (ret) {
> >>>>>
> >>>>> ---
> >>>>> base-commit: 8569c31545385195bdb0c021124e68336e91c693
> >>>>> change-id: 20230913-fix-wuninitialized-dm_helpers_dp_mst_send_paylo=
ad_allocation-c37b33aaad18
> >>>>>
> >>>>> Best regards,
> >>>> --
> >>>> Hamza
> >>>>
> >> --
> >> Hamza
> >>
> --
> Hamza
>
