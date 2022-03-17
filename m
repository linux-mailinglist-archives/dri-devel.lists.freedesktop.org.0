Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EC54DC3FC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 11:31:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48ABC10E672;
	Thu, 17 Mar 2022 10:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8941B10E672
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 10:31:49 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2e5ad7166f1so40312037b3.12
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 03:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+6rubepE5fHPh6eaHtS29OzoXOf/Is2/IKhJ3XCCu74=;
 b=c9tJVuG5fV8b0t6vN8KcsbxKW16PtXQhBnxDXLrNrN+wJ/bO1dbMBYzNW5tyeGqKt1
 pKS8KRz8GjqdCyJWTY4Qu3RRhi5m1gzPKXQS0y9551QuQUnDGORAupsscLlRXMpIDRtI
 hDPDaflLOg3AA8tgeRiyzSGPAni9aqJO/0J4t3uAfHzdy26+TdajhtFcqwl/4S0huiAg
 2x8Kw0/rChpayjBE+lha9S8t3gv+xWXe5p5LxnTs9MZQsydd/XkpzBMMnue9fvPuvE0I
 2lD88TdQUhciEuMkdp+5KJ9FNH/2s9iuYbA2W6S1gdw3hUd07xYdzsAUPJ1bT6muvccw
 frIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+6rubepE5fHPh6eaHtS29OzoXOf/Is2/IKhJ3XCCu74=;
 b=iT0mNXkMpgASMXCjfc+58i022i/KHr7oN683R8EIsfoBCtPD35rFpbY9yEnAsvTOyh
 Cxu26RZ7kq30w94pZzL4tS2OJKB3MFnt3VkC2D6pKUV3Sj/YAVgyDleXsUUIsOX9k08E
 w3DoVpKlLDI7C+KCJzHf9lfVT8VhqruR7Q4mYgPXMyFzze9Lk7zm90d1tX0jAKBjE0VO
 jTYjGWT0nsXfviEDS971Hoe10HZovbuHI1VIyV7+rnqWo5Gi3WtOe52hlg/e2+FjFDuy
 ukdmFRYdP5EC03OLCsLuJzmYeh+yLNk8ak33jw2yKKJsktl13vMIfDo3J3NGNbvN0bVN
 qDhg==
X-Gm-Message-State: AOAM531MEPPGCMbIvGW47qN7lyzhdg34IDIyrlX2uYSP74uUOtIdMbq1
 5F9us4YyeIuoUcbpA0y8gGQAAeFwQdJD22dBo/bXiA==
X-Google-Smtp-Source: ABdhPJwfTnded2WRRk7XkfsFR8fdNGlv99Lrq4XWK4lx+aeuze8/cx8IYsrAABNleBujFPMxZZCRr7IvWDPUxrMfaVQ=
X-Received: by 2002:a81:e503:0:b0:2db:6996:1f97 with SMTP id
 s3-20020a81e503000000b002db69961f97mr4875340ywl.423.1647513108644; Thu, 17
 Mar 2022 03:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <CAF6AEGtnXvo=-fKbgSRtAtZ80igqJM2bTKefiLPUsSohU9idNQ@mail.gmail.com>
 <4d768cc9-9a47-473c-b344-4ed34bcb5556@amd.com>
 <f291b94d-b981-5cfb-5422-ca4317d24eda@amd.com>
In-Reply-To: <f291b94d-b981-5cfb-5422-ca4317d24eda@amd.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 17 Mar 2022 10:31:37 +0000
Message-ID: <CAPj87rNUJzTtRSM62aq2ssLY0F673dpaFw2SGh8oMuf3yE6wBA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 17 Mar 2022 at 09:21, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
> Am 17.03.22 um 09:42 schrieb Sharma, Shashank:
> >> AFAIU you probably want to be passing around a `struct pid *`, and
> >> then somehow use pid_vnr() in the context of the process reading the
> >> event to get the numeric pid.  Otherwise things will not do what you
> >> expect if the process triggering the crash is in a different pid
> >> namespace from the compositor.
> >
> > I am not sure if it is a good idea to add the pid extraction
> > complexity in here, it is left upto the driver to extract this
> > information and pass it to the work queue. In case of AMDGPU, its
> > extracted from GPU VM. It would be then more flexible for the drivers
> > as well.
>
> Yeah, but that is just used for debugging.
>
> If we want to use the pid for housekeeping, like for a daemon which
> kills/restarts processes, we absolutely need that or otherwise won't be
> able to work with containers.

100% this.

Pushing back to the compositor is a red herring. The compositor is
just a service which tries to handle window management and input. If
you're looking to kill the offending process or whatever, then that
should go through the session manager - be it systemd or something
container-centric or whatever. At least that way it can deal with
cgroups at the same time, unlike the compositor which is not really
aware of what the thing on the other end of the socket is doing. This
ties in with the support they already have for things like coredump
analysis, and would also be useful for other devices.

Some environments combine compositor and session manager, and a lot of
them have them strongly related, but they're very definitely not the
same thing ...

Cheers,
Daniel
