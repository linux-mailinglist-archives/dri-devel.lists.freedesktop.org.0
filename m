Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB98B5F0EFD
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 17:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F72310ED60;
	Fri, 30 Sep 2022 15:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1998810ED5E;
 Fri, 30 Sep 2022 15:37:08 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id 10so7468132lfy.5;
 Fri, 30 Sep 2022 08:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date;
 bh=xHA6yjSDnlUKmhAAm+/NkiOEJECwwsljnyj0Tr5kTMg=;
 b=QiGgE06+RyoCdlUmQCnZpayta9xx+Qfnz6gcAAdHbJQ9cj8GkxR7HCnzFboDrKw2Sy
 2kS4kd33v/oIIzYPAPb3CyR2rB2J14jjQwSYfC0TPYtz221TKo+44v/Bhu2UJixUBvG5
 ltz8Jh0NPFH/1FP4qDS9AI9G8+S0YdR8UdgWkaa68g0lh5eqEOfe/gRTk/q3jtNm0sXL
 DL87pzi2XE4WDlORzNbbz4z6yGrjK48LjMEapFRhO5W2Z+SMhrFXlcS/5hDNuIJaU6di
 xc/PgnpZW4S+TVa4ynrB6jnJMMLjEEZNPgd/5UJjAdXCbWt9JjaOdhT+5OJae5899LLc
 iUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date;
 bh=xHA6yjSDnlUKmhAAm+/NkiOEJECwwsljnyj0Tr5kTMg=;
 b=tm59Oua7+BVPq96izUuW4jEIHNz3zKuEmpfvpVDO63cbTsN8M9puE9LvsDYwpB/YYB
 nhNCyNq2aRg0eJLaEvIEEmrP0qnDl4OgC7z0b6fYUKz7vdXfD7eI6N00gbcCUkEtsmTe
 qrL7cMHbLhWJQ+zyNB/pB4QWnYwhTtN+nRg2d4XYC8GUF/4eC3yGhP/2g0IjUcawzw0S
 fYl6/BeMCtoJ7pU4SQPXz5RHUyl1uYCwHqn9kUFB9+cK5TpP6R5fDgNQl0nex7Pf8BDy
 U84rH4XdddKieoYM48oBU4D4E5sZfRbSC8du5A7RqAGX5kTaYUM+xM//jZvwPBJq2/P2
 46+w==
X-Gm-Message-State: ACrzQf3npnmN4+AW/jLLWn6IFQihJr59bwZstmKI3fbQCrK0hujkNbKr
 YTraRlusHZir+eByaJVV6eE=
X-Google-Smtp-Source: AMsMyM5lPPWqtBjFAwl9uWSIpF+cvjWIxv7wpbd3IrAeRhhdrKlxDI9KTkSHNm+Vgd5fJOZ42fJdfw==
X-Received: by 2002:a05:6512:370c:b0:49f:c4fb:8706 with SMTP id
 z12-20020a056512370c00b0049fc4fb8706mr3637748lfr.635.1664552226329; 
 Fri, 30 Sep 2022 08:37:06 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 q7-20020a0565123a8700b0048aef1abb08sm316410lfu.297.2022.09.30.08.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 08:37:06 -0700 (PDT)
Date: Fri, 30 Sep 2022 18:37:00 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: KMS atomic state sets, full vs. minimal (Re: [PATCH v3 0/6] Add
 support for atomic async page-flips)
Message-ID: <20220930183700.6cf64900@eldfell>
In-Reply-To: <YzcGw9myJotLRTVl@intel.com>
References: <20220929184307.258331-1-contact@emersion.fr>
 <Yzb0uNjB5FpjCIjq@intel.com> <Yzb6203nHF8fVH/W@intel.com>
 <YzcGw9myJotLRTVl@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T1hLgOzt2hE1JJTqqfx/6Yb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: andrealmeid@igalia.com, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, mwen@igalia.com,
 amd-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 alexander.deucher@amd.com, hwentlan@amd.com, nicholas.kazlauskas@amd.com,
 joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/T1hLgOzt2hE1JJTqqfx/6Yb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 30 Sep 2022 18:09:55 +0300
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> That would actively discourage people from even attempting the
> "just dump all the state into the ioctl" approach with async flips
> since even the props whose value isn't even changing would be rejected.

About that.

To me it looks like just a classic case of broken communication.

The kernel developers assume that of course userspace will minimize the
state set to only those properties that change, because...?

Userspace developers think that of course the kernel will optimize the
state set into minimal changes, because the kernel actually has the
authoritative knowledge of what the current state is, and the driver
actually knows which properties are costly and need to be optimized and
which ones don't matter. It has never even occurred to me that the
kernel would not compare next state to current state.

No-one ever documented any expectations, did they?


Thanks,
pq

--Sig_/T1hLgOzt2hE1JJTqqfx/6Yb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmM3DRwACgkQI1/ltBGq
qqflGA/+PFqtfhRFLCw87GGx+SNFRVQLLF975O0Zi3YnMfvmTh4ER4bfxasLoB+i
KdEKxfDZflcisTrV306Gr9sc+sfvyyj5iXBWY1VEoX8wID3qh5lMW8ByE8ffgFpE
pfGtTDs0Dfw2YoAfudnti92zlD7vdaaSkfOLeL/39/l0MyDVbKGfLJ2jha7WXsgc
sknageMgRC1Agra5vAin222V05Xd0UpbBdb6cLkG7kfntdSzNYcJqpDSVfyNLw5u
LkJvHaJtDK0KhLL+GYWxBkblQ4ykrQ60E4ZEnv/+rjhpGACEew96WJbLtj8ICVxg
YT8o+ZBVWu3/PWJH9HZndL3uPBqpNcyYtOEfd5oPIz30Ow2vPy0w8TIf+vAjpBUw
i3pI6SyWr/gPmnHS7xCIiUrDChxURblD68x8WCv8ynUVBh/agCTZGzHizIwGgyQ3
QiVlYJRqpKtrB6hdXOgoqC5jjItz+USXaw7+vuerYXpqkJfYhEgYmHuBp8WR98+x
Pt16NGemdBUZ1DwrgctyvqDnFjPGOaiBVuYKle2UpNgsrRwdW5COE43ctceJUJoy
NmS368bGoVF3Puh2673E33DG1APZQoIkBNjgQVFI2WZGhFL6NqNicG2GFQaBDukv
IljNu5pp92fTpoCzcPo9CDhPEKt2bAnZ6CH4Bb4zobx7SHD0Qsw=
=jhbY
-----END PGP SIGNATURE-----

--Sig_/T1hLgOzt2hE1JJTqqfx/6Yb--
