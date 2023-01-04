Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2E065CBDA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 03:22:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D8110E428;
	Wed,  4 Jan 2023 02:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546B310E428
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 02:22:16 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 187-20020a4a09c4000000b004d8f3cb09f5so4382553ooa.6
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jan 2023 18:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=USbqMiDmIEwRKLrmqkLTqavH8POHar398awR2fZW8DQ=;
 b=JI9qjHq0uJ8ewGmezcJmRtZujL7tBDg0TMrTG/lvhB4GiW1S+zeZxFdG0TLcduPvqN
 r1pLo1tFX9m6ZGdL8Sk/PLaGRSQNb+8JlrlhaOj3E6Ng7ixZRq42vrnrBOAaKtVIF8bE
 7fJaykcD8CziKLwyUyYPX4rPOTtAj8FTtw0PgR8tyy9PAkQInm1KP4weTAlyyr6dgDSE
 0okN6C4qp1By50Zzl8p8PYT4E2rNUbeDwQuWoAWVjBgnnJ/2fpkR2ZWxPmgvrUNlWwT4
 4wmCI1NJMLkEnsFHd6uyQ4tL1hLsDK9yz5qUdX/cAWOKxypMjV6ANoR4DgWJhTMdanKc
 32XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=USbqMiDmIEwRKLrmqkLTqavH8POHar398awR2fZW8DQ=;
 b=4vXL/inWTcKi4kmfhdBQW3zTM5xSfjn8Is/CZavUcSnIvuRYpThSGS6GbHxDssyZhk
 Ia9+nRAmYC4lO/ZdNZ7m7dfU8OaVRbmejiUeyJnvOpa+UA7RAiwJ3NN7PdTE2CYiPJNV
 iHXJiowpMQ5hf+oTTxBOFjsdp1a2zBDuN6Taycox1234/025AjqUzrOddr7/KSSlHgh8
 BBhWXrpCU552r8zVYI6tNOQq+JOhWmecBYHL4oTl5aon763n25XiMMb7MFkIxwijtObD
 Evj1QdJxRyl9V5le30kTtshnHSGwaE0K15Y/SvUmmEjIJejToG5hjy77cY3cvT2MOtjx
 iDTQ==
X-Gm-Message-State: AFqh2kpHpCJBOwbTk0ehSU3HrZx8L8kZ4M3fVd7ZEuTuyfzUPd8gGJAu
 2Mn24CM78cVtVchV2fzXLguvjxOfveExT78dzsk=
X-Google-Smtp-Source: AMrXdXsJaduqeTDJLDTvOC14svA0chpL144twCreyym1pBMKzNHmNoT+8MhfmL6l/hEz0SvY0UTxmru+7Ogsuy+z7nU=
X-Received: by 2002:a4a:bd06:0:b0:4a3:9f7a:adce with SMTP id
 n6-20020a4abd06000000b004a39f7aadcemr1948808oop.80.1672798935388; Tue, 03 Jan
 2023 18:22:15 -0800 (PST)
MIME-Version: 1.0
References: <20230103125322.855089-1-mcanal@igalia.com>
 <CAF6AEGt5g6+z3=LmTuP27pvbKYrL0YdLpDJCQmV=VHE6FeJ+Kg@mail.gmail.com>
 <8d5deb15-e412-180f-585d-f57d193ae658@igalia.com>
In-Reply-To: <8d5deb15-e412-180f-585d-f57d193ae658@igalia.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 3 Jan 2023 18:22:01 -0800
Message-ID: <CAF6AEGs+GP2MCbD=wW+ords=MPFBcV4ncag-5KBfO=2KWg3G0Q@mail.gmail.com>
Subject: Re: [PATCH] drm/gem: Check for valid formats
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 3, 2023 at 5:11 PM Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>
> On 1/3/23 19:46, Rob Clark wrote:
> > drive-by thought/concern, what are the odds that there is some wayland
> > compositor out there that creates an fb for every window surface, even
> > if it later decides to composite on the GPU because the display does
> > not support the format?  It seems like there is a non-zero chance of
> > breaking userspace..
> >
>
> As Simon pointed out, drivers like i915 and AMDGPU already reject IOCTLs
> with invalid parameters, as you can see on [1] and [2], so this patch
> would make the behavior more consistent between the drivers. That said,
> I don't believe that this patch would break userspace, as userspace
> already needs to handle with the existing drivers.

ok, maybe this won't be a problem then

BR,
-R

> [1] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/i915/d=
isplay/intel_fb.c#n1917
> [2] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/amd/am=
dgpu/amdgpu_display.c#n1124
>
> Best Regards,
> - Ma=C3=ADra Canal
>
> > BR,
> > -R
> >
>
