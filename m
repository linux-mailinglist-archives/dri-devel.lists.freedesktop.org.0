Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EFE7E6D9D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 16:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A3C10E8D3;
	Thu,  9 Nov 2023 15:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D9710E05F;
 Thu,  9 Nov 2023 15:40:52 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6ce2eaf7c2bso573747a34.0; 
 Thu, 09 Nov 2023 07:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699544451; x=1700149251; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6tJ1Dsj0sBlosFzA+sYRVfNMl8UsSGIcTKFZYaCY0JM=;
 b=NpeKzcakQBfxcG0Lkb30Ztrf8fx8kET+87PKJwVpXW6V0M4XkyLIecPTtHx1/bfCen
 Rv9uaoGWU+6a2XzcUSSsVFMAKhO6P62A9zV046gmsqzfGctw0wtsYUHFcBJYl47CWC4b
 kQxQ6gFziqLpVKuCIr89goS7i0JGW5jnLjga+E9E9cjv6EVVwc6hhEF0+tU0g34U5l+7
 tgzioddX0nRYbqSvKy5fROsiHUKL4n5NOQYGifdvBU3NOnCIU3SHN5v9KcNzqRvw3Gh1
 CAYddfqM3irCcCas9zdcvss6tCgzWsQw42noRbjlhTR39HqqJFMapoHJuFSOalmbJzMm
 fX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699544451; x=1700149251;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6tJ1Dsj0sBlosFzA+sYRVfNMl8UsSGIcTKFZYaCY0JM=;
 b=K7W2VMQiOq4ou1O7fxosrdk9p9+dysZIZWsQuW2I3Ek5CM0LBZ0qG37mKV23mMh0dy
 ZvhjhlujBzpPhNDv7fCJMeTCfMEv0he8cxsm3LYjqfasmqsQLmGa3UOzNhpNN5sY63/v
 mJNAJTm5dnKWNV8ZDzMWF7qyEe80XCBVO1pmoYB22Y2JW1nK4XrqQlcK1A+lGUj5XftD
 TWDSr2RlXi2YqevVs5fpk0vS2N2mlJj0l+HbMxce5SVh8jObWyt2mwlaXYvkYXOdIWJy
 stSpATPuf/uHcQgj7v9ATcqxU7h9rYxZEzdV2rvt4reKhxWBzJOiOVfJqVl+lyn93RTt
 QcVQ==
X-Gm-Message-State: AOJu0YyvwcaQay1A42HHi23tuxcftfAi0yKqr3FMRL91o7RI5RmRyaV2
 dChTjFS+ViZmxfNNIByPtn7tjvIw/BegDrCRJAU=
X-Google-Smtp-Source: AGHT+IHGb5T1Tjsn2NDbFSsu++9csRaaO97POdLeDCVVirsyx83kvphtEll/o76pdM1pmmV6U7zau4teA/GgQfxY/S0=
X-Received: by 2002:a05:6870:f602:b0:1e9:9bec:c01d with SMTP id
 ek2-20020a056870f60200b001e99becc01dmr5837083oab.6.1699544451085; Thu, 09 Nov
 2023 07:40:51 -0800 (PST)
MIME-Version: 1.0
References: <20231108065436.13969-1-jose.pekkarinen@foxhound.fi>
 <2023110835-magnolia-prune-02d0@gregkh>
 <1b20f2e4ddc0b0e94aa9a1f9c76ff75c@foxhound.fi>
 <2023110916-tinfoil-concur-77d8@gregkh>
 <ee757d648a601ba3530e0eeb1c5d178e@foxhound.fi>
In-Reply-To: <ee757d648a601ba3530e0eeb1c5d178e@foxhound.fi>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 Nov 2023 10:40:39 -0500
Message-ID: <CADnq5_PGyR=6iyFNrmjcimFc+y7ietqVybV89z3zqUcxbkJSNA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: replace 1-element arrays with flexible-array
 members
To: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
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
Cc: Greg KH <gregkh@linuxfoundation.org>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, skhan@linuxfoundation.org,
 alexander.deucher@amd.com, evan.quan@amd.com, christian.koenig@amd.com,
 linux-kernel-mentees@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 9, 2023 at 7:14=E2=80=AFAM Jos=C3=A9 Pekkarinen
<jose.pekkarinen@foxhound.fi> wrote:
>
> On 2023-11-09 11:06, Greg KH wrote:
> > On Thu, Nov 09, 2023 at 10:43:50AM +0200, Jos=C3=A9 Pekkarinen wrote:
> >> On 2023-11-08 09:29, Greg KH wrote:
> >> > On Wed, Nov 08, 2023 at 08:54:35AM +0200, Jos=C3=A9 Pekkarinen wrote=
:
> >> > > The following case seems to be safe to be replaced with a flexible
> >> > > array
> >> > > to clean up the added coccinelle warning. This patch will just do =
it.
> >> > >
> >> > > drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h:76:38-63:
> >> > > WARNING use flexible-array member instead (https://www.kernel.org/=
doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> >> > >
> >> > > Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@foxhound.fi>
> >> > > ---
> >> > >  drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h | 2 +-
> >> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> > >
> >> > > diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
> >> > > b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
> >> > > index c7b61222d258..1ce4087005f0 100644
> >> > > --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
> >> > > +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
> >> > > @@ -73,7 +73,7 @@ struct smu8_register_index_data_pair {
> >> > >
> >> > >  struct smu8_ih_meta_data {
> >> > >          uint32_t command;
> >> > > -        struct smu8_register_index_data_pair register_index_value=
_pair[1];
> >> > > +        struct smu8_register_index_data_pair register_index_value=
_pair[];
> >> >
> >> > Did you just change this structure size without any need to change a=
ny
> >> > code as well?  How was this tested?
> >>
> >>     I didn't find any use of that struct member, if I missed
> >> something here, please let me know and I'll happily address any
> >> needed further work.
> >
> > I don't think this is even a variable array.  It's just a one element
> > one, which is fine, don't be confused by the coccinelle "warning" here,
> > it's fired many false-positives and you need to verify this properly
> > with the driver authors first before changing anything.
>
>       My apologies to you, and anybody that feels the same, it is not my
> intention to bother with mistaken patches, I just assume that this patch
> or any other from me, will go to review process, where it should be fine
> if the patch is right, wrong, need further work, or further testing
> either
> from my side or anybody else, and at the end of the day I need to do
> patches if I want to find my mentorship patches, and graduate.
>
> > In short, you just changed the size of this structure, are you _sure_
> > you can do that?  And yes, it doesn't look like this field is used, but
> > the structure is, so be careful.
>
>      I don't know, let check it out together and see where this goes.

I think it may have been used with the SMU firmware.  I'll need to
check with that team to determine if this was meant to be a variable
sized array or not.

Alex
