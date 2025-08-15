Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288E9B28D72
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 13:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E6E10E0CC;
	Sat, 16 Aug 2025 11:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MI5rG9F4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F0110E036;
 Fri, 15 Aug 2025 23:21:04 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-76e2eb6ce24so2417846b3a.3; 
 Fri, 15 Aug 2025 16:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755300064; x=1755904864; darn=lists.freedesktop.org;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=njADXc20sh/OCU5iT2CRpP+DigdW8OrQiBCgtQJIZO8=;
 b=MI5rG9F4r8CrbQCEmN5TIyF216o7yHkg/cPgP54F9nMR7beceCWcElyWK1cDn6XYXM
 qFdGB/3hOgjXlPRScKJZ11LhaMZLNq2cNyeXxwx1FccVvaD4yf5YJJsfsh8ykTX5yeq6
 kINIrwq3CDz4WQtqiivBEOu0nWh141AO1w/IQOaYcfdihwmluvXgEeaT+t52zGhv4e3b
 qafi2A+/FnrVEmk8hsD6vpeYn8PAxKM9KIhB4QQvmoUVcOM5F5jrV17mtC4O+uvJptex
 TigdZeb6W70sT5ycXnpbd9pe9cmM434ERu1E5e5uVRKUnY7uE/Md5SRHYayZrcnM6k9f
 Y0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755300064; x=1755904864;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=njADXc20sh/OCU5iT2CRpP+DigdW8OrQiBCgtQJIZO8=;
 b=C20mypRoAhSkaNTZ6hb3+mMDb7ppk6Lhct2bkubRPf36EIJMm/Z+KO5brwUaTgEyD4
 xtamn1byjihWvVbIY2AbBgR7OugnzU1NyG/b6bCubaYfcRCCdLpDiwnlGOdITPoDwPZy
 VROinL2BdOjTgS99OGur3k3CZIWl613+6gNK7yMWm3xjKnesROsD2XMDC8UG7GUFy1Rc
 k6xCVy6geiYKozrUU0wuL8ljcGhi/53D5jQf0jypPX/O/GvNj1T90OBYOLo4zmhWIHFI
 +0lmkSpjtn5+2O0Rc2P5d/TO8VOi5MDbC+XimvsbVHgxYbsvKYSHok6Rea1kj1TyvjmX
 AKoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPoQiKlKPefTo+Ysa2ck0pjuy8vcUOcSZOG4lpB1Gs6UH6UKS9P2kXMJlD4vjqiFADkgRDhIrRIfc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5INXoAMtS0Bw9Aji9gV/3+tvLcVN10Wfb1aYL+oZndGY0yWRN
 5IQHpKNmFua7RT/Az/JuVOGVz9TnnT8WuaQf0usJRGEmFOeeZWFYTSX2
X-Gm-Gg: ASbGncvOiVYwXoajv8HSL3WCHtUqHpiWJeB0fWCSuI1jiBjos21t01/dGDSyNsmRKCw
 Oh05T24JCYbdCzolmHTrG62Z60mUndXtdJ5E6i14+oq4arlrcpjs/i9IbcqLVqaOyAPgLqIhiSc
 Ug5MO3MTfS4BnIA4d65FGDRUJilyPQ1jdtRS7Mr3Tgxd+VMuby+i8gQwElklYU5Y7ZgYWF2ZpJy
 AmKeBjs3jPI+gcAzfvzAWtM6UdNmoQwtesqWEmH8D2IVUavyG0EC80KNIcPksXX2IiB7heFJpUF
 gFr19J02IVW0XkGZKUCyfmTPGmTWgKXHtoJsfd06mkf+x3lFVAVo4c1vfQdeVnlMorVAAHfFt93
 rK4C1EIzsUMDD/Rew/iuWxGmtTFrqtV4ktpBvgM5m7l0tLoXanegJlA==
X-Google-Smtp-Source: AGHT+IHQwblCtiW4OKod+oWI/UOjOgD4r99npyAbPInRuLkjKDCabLumlShODzC25BJStPQwRrNB5g==
X-Received: by 2002:a05:6a21:9992:b0:23d:781f:1516 with SMTP id
 adf61e73a8af0-240d2ecc63dmr7194836637.22.1755300063861; 
 Fri, 15 Aug 2025 16:21:03 -0700 (PDT)
Received: from localhost (syn-047-229-141-083.res.spectrum.com.
 [47.229.141.83]) by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-b472d74d477sm2195395a12.30.2025.08.15.16.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 16:21:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 Aug 2025 16:21:02 -0700
Message-Id: <DC3DXWOJ6E18.HVR7WZZCRV6F@gmail.com>
Subject: Re: [RFC PATCH] drm/amdgpu: Enable async flip for cursor planes
From: "Christopher Snowhill" <kode54@gmail.com>
To: "Alex Deucher" <alexdeucher@gmail.com>, "Christopher Snowhill"
 <chris@kode54.net>, "Wentland, Harry" <Harry.Wentland@amd.com>, "Leo
 (Sunpeng) Li" <Sunpeng.Li@amd.com>
Cc: <amd-gfx@lists.freedesktop.org>, "Alex Deucher"
 <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250619125507.54384-1-kode54@gmail.com>
 <DARA1U86AS72.QOIEVZWCFPYC@kode54.net>
 <DATUOZZD8316.2INSL3KL5RA80@kode54.net>
 <DATV4CAOHVGV.1UJ803EX21II6@gmail.com>
 <DATYCMWH1X28.NE3M8KJ3SPV9@kode54.net>
 <CADnq5_OjUp+YpXSdvWrYN+6ofFfyES9Jvwkswf3JmTTMGL=MVQ@mail.gmail.com>
 <CADnq5_MdosN34TH=L3Zv1K2_Lroa8Y69JK1wy_zbBFRDT-Q=4Q@mail.gmail.com>
In-Reply-To: <CADnq5_MdosN34TH=L3Zv1K2_Lroa8Y69JK1wy_zbBFRDT-Q=4Q@mail.gmail.com>
X-Mailman-Approved-At: Sat, 16 Aug 2025 11:40:59 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This may be a more appropriate patch:

https://lore.kernel.org/amd-gfx/20250723150413.18445-1-xaver.hugl@kde.org/

On Fri Aug 15, 2025 at 6:17 AM PDT, Alex Deucher wrote:
> @Wentland, Harry
> , @Leo (Sunpeng) Li Can you guys take a look?  This patch fixes a regress=
ion.
>
> Thanks,
>
> Alex
>
> On Mon, Jun 23, 2025 at 11:33=E2=80=AFAM Alex Deucher <alexdeucher@gmail.=
com> wrote:
>>
>> + Harry, Leo
>>
>> On Mon, Jun 23, 2025 at 9:38=E2=80=AFAM Christopher Snowhill <chris@kode=
54.net> wrote:
>> >
>> > On Mon Jun 23, 2025 at 4:06 AM PDT, Christopher Snowhill wrote:
>> > > On Mon Jun 23, 2025 at 3:46 AM PDT, Christopher Snowhill wrote:
>> > >> On Fri Jun 20, 2025 at 3:10 AM PDT, Christopher Snowhill wrote:
>> > >>> Here's another alternative change, which may be more thorough. It =
does
>> > >>> seem to fix the issue, at least. The issue does indeed appear to b=
e
>> > >>> no-op plane changes sent to the cursor plane.
>> > >>>
>> > >>> If anyone wants to propose style changes, and suggest a proper com=
mit
>> > >>> message, if this is indeed a welcome fix for the problem, please l=
et me
>> > >>> know.
>> > >>>
>> > >>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/d=
rm_atomic_uapi.c
>> > >>> index c2726af6698e..b741939698e8 100644
>> > >>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> > >>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> > >>> @@ -1087,17 +1087,22 @@ int drm_atomic_set_property(struct drm_ato=
mic_state *state,
>> > >>>                     }
>> > >>>
>> > >>>                     /* ask the driver if this non-primary plane is=
 supported */
>> > >>> -                   if (plane->type !=3D DRM_PLANE_TYPE_PRIMARY) {
>> > >>> -                           ret =3D -EINVAL;
>> > >>> +                   else if (plane->type !=3D DRM_PLANE_TYPE_PRIMA=
RY) {
>> > >>> +                           ret =3D drm_atomic_plane_get_property(=
plane, plane_state,
>> > >>> +                                                               pr=
op, &old_val);
>> > >>> +
>> > >>> +                           if (ret || old_val !=3D prop_value) {
>> > >>> +                                   ret =3D -EINVAL;
>> > >>>
>> > >>> -                           if (plane_funcs && plane_funcs->atomic=
_async_check)
>> > >>> -                                   ret =3D plane_funcs->atomic_as=
ync_check(plane, state, true);
>> > >>> +                                   if (plane_funcs && plane_funcs=
->atomic_async_check)
>> > >>> +                                           ret =3D plane_funcs->a=
tomic_async_check(plane, state, true);
>> > >>>
>> > >>> -                           if (ret) {
>> > >>> -                                   drm_dbg_atomic(prop->dev,
>> > >>> -                                                  "[PLANE:%d:%s] =
does not support async flips\n",
>> > >>> -                                                  obj->id, plane-=
>name);
>> > >>> -                                   break;
>> > >>> +                                   if (ret) {
>> > >>> +                                           drm_dbg_atomic(prop->d=
ev,
>> > >>> +                                                          "[PLANE=
:%d:%s] does not support async flips\n",
>> > >>> +                                                          obj->id=
, plane->name);
>> > >>> +                                           break;
>> > >>> +                                   }
>> > >>>                             }
>> > >>>                     }
>> > >>>             }
>> > >>
>> > >> Upon further testing and reflection, I have come to the conclusion =
that
>> > >> this is indeed best handled by a kernel fix, rather than breaking u=
ser
>> > >> space.
>> > >>
>> > >> I attempted to work around this in wlroots, adjusting 0.18, 0.19, a=
nd
>> > >> 0.20 git with similar patches. First I attempted to stash all the
>> > >> written properties for the atomic code, storing an initial value of=
 all
>> > >> 0xFE so it was always likely to write the first time, and only sett=
ing a
>> > >> property if it changed from the last commit.
>> > >>
>> > >> This resulted in whole commits breaking for one or both framebuffer=
s
>> > >> until I ctrl-alt-fx switched to a tty and back again, and this woul=
d
>> > >> work again temporarily.
>> > >>
>> > >> So I went back to the drawing board and only withheld seemingly
>> > >> duplicate plane properties. This "worked", until I attempted to pla=
y a
>> > >> game, and then it started glitching spectacularly, and not updating=
 at
>> > >> all if the game was doing direct scanout and vrr.
>> > >>
>> > >> Clearly this is wrong.
>> > >>
>> > >> The wlroots library queues up properties for each commit. On every
>> > >> commit where the cursor is disabled, it queues up both fb_id=3D0 an=
d
>> > >> crtc_id=3D0. Every commit. Is this wrong? Should it only be queuein=
g up
>> > >> the disablement properties once? It also queues up the full plane a=
nd
>> > >> hotspot properties when enabled, even if the cursor doesn't change
>> > >> position or appearance.
>> > >
>> > > Probably should have CC'd the drm misc maintainers when I started po=
king
>> > > drm misc instead of amdgpu. Pity there isn't a list for that...
>> >
>> > I am a dumbass, I didn't notice get_maintainer.pl. Added more people,
>> > and the correct list. Not sure if I should remove amd-gfx, since this
>> > affects them, somewhat...
>> >
>> > However, the intention of this thread was to seek commentary on the
>> > situation as it is.

