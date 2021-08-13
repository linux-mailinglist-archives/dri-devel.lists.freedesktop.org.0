Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3587C3EB974
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 17:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DC489310;
	Fri, 13 Aug 2021 15:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D956E870
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 15:48:54 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id c24so20575118lfi.11
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 08:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fb6jfu2/G4QkMlWGyBK3jfNAWXGH0CC9y/nA9LWGHy4=;
 b=G1iP+a4vaGH0IxTicJ5t0yaOy79VZWEKMGhnfii16ScskORME/xmg99izKimPk8QN3
 jwWajxi/HE54sb9WmLtoetCvhtG/9X06SEu8v5M2vvten+zs9CqSznHR8cLFQ+hxFOjY
 jyba1aWlcKCH2x91LlNbD0rZDE7mTxariNtso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fb6jfu2/G4QkMlWGyBK3jfNAWXGH0CC9y/nA9LWGHy4=;
 b=mMnXjdWg7d2vrnknqXt4skt6uIIvvIE3rVwHEgEY2p+rvfLahEO+NzcLbXlAFIad9l
 sccCjmQpa4wJCyg4fi80Wh/4RfOmlz5satwfKNeDION1BNvVWct+C8aDtbptyuEtU5JM
 21ULPKvhBX6Zyj6g/yCdM3aFfFZgQ1Lxllc8SErFPKPwmRVYd4ZHzA4xShTuiz+I3qic
 bS6Uv+1jqlnnL38+7H/EY2rvi3NRvPyHAAJrj1jWPmAh/5j3/6JdaVjDmht2zckoxKY2
 W8jvUEG5YAluR0jTMxNOoF45+Ft7mQ4H4OSnd8QvVyc4GX0JqLCwWYTnyeT1Cw0R8jci
 Di5A==
X-Gm-Message-State: AOAM531aGdi/qAPRzm8aESgxT+FejJyBULX0cFNS2r7XWDks18gcmxzV
 5Zlz+2bZ+UfmYHVfx6p9CwXaYiOqAOqMOajyP94GQg==
X-Google-Smtp-Source: ABdhPJxExrRr2JJWFnNf/8fWix4b0kkItNPl4sspptOXrBc8VLA9pDO0SLjB79iURWNtRS9gGwb5VdyBfx4fvTQ26CY=
X-Received: by 2002:a05:6512:398e:: with SMTP id
 j14mr2140007lfu.573.1628869733082; 
 Fri, 13 Aug 2021 08:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210811175525.2125964-1-markyacoub@chromium.org>
 <20210812194917.1703356-1-markyacoub@chromium.org>
 <4ab4548f-34fc-27cb-928e-af2b8ab78b1b@daenzer.net>
In-Reply-To: <4ab4548f-34fc-27cb-928e-af2b8ab78b1b@daenzer.net>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Fri, 13 Aug 2021 11:48:42 -0400
Message-ID: <CAJUqKUp6zrioRy4aK_ySM+1EMWfZqX1P-_u2RGsGB9PCBXLSAQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm: Copy drm_wait_vblank to user before returning
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, 
 abhinavk@codeaurora.org, Rob Clark <robdclark@chromium.org>, airlied@linux.ie, 
 Mark Yacoub <markyacoub@google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for your review Michel!
@MAINTAINER, could you please strip the Change-Id when applying.
Thanks!

On Fri, Aug 13, 2021 at 3:33 AM Michel D=C3=A4nzer <michel@daenzer.net> wro=
te:
>
> On 2021-08-12 9:49 p.m., Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@google.com>
> >
> > [Why]
> > Userspace should get back a copy of drm_wait_vblank that's been modifie=
d
> > even when drm_wait_vblank_ioctl returns a failure.
> >
> > Rationale:
> > drm_wait_vblank_ioctl modifies the request and expects the user to read
> > it back. When the type is RELATIVE, it modifies it to ABSOLUTE and upda=
tes
> > the sequence to become current_vblank_count + sequence (which was
> > RELATIVE), but now it became ABSOLUTE.
> > drmWaitVBlank (in libdrm) expects this to be the case as it modifies
> > the request to be Absolute so it expects the sequence to would have bee=
n
> > updated.
> >
> > The change is in compat_drm_wait_vblank, which is called by
> > drm_compat_ioctl. This change of copying the data back regardless of th=
e
> > return number makes it en par with drm_ioctl, which always copies the
> > data before returning.
> >
> > [How]
> > Return from the function after everything has been copied to user.
> >
> > Fixes: IGT:kms_flip::modeset-vs-vblank-race-interruptible
> > Tested on ChromeOS Trogdor(msm)
> >
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > Change-Id: I98da279a5f1329c66a9d1e06b88d40b247b51313
>
> With the Gerrit Change-Id removed,
>
> Reviewed-by: Michel D=C3=A4nzer <mdaenzer@redhat.com>
>
>
> --
> Earthling Michel D=C3=A4nzer               |               https://redhat=
.com
> Libre software enthusiast             |             Mesa and X developer
