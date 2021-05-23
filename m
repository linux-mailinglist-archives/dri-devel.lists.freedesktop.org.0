Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9583638DD51
	for <lists+dri-devel@lfdr.de>; Sun, 23 May 2021 23:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A65C89C83;
	Sun, 23 May 2021 21:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9758389C83
 for <dri-devel@lists.freedesktop.org>; Sun, 23 May 2021 21:34:29 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id x7so6859258wrt.12
 for <dri-devel@lists.freedesktop.org>; Sun, 23 May 2021 14:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XSo53BkmTpukZoNK0tWrKhE5ExZG3ncWZ5pFWgOEMRM=;
 b=nb5a9I1zipxzhgnoR0Qk5XAxdFUZTOEX2bPa25hkDc3SX6F9Uxp+oA8PE7fP6qEYrD
 jQAgcekR6tpiOPKksVy0EYqPN0ZF+YSmfimIQsjNCVHaEO+K5ilDK+Qu2wDdUq3eWBOn
 Uov3Hj7tXcfH/FC6mqT8jQjEUV9w39fRJFKaahgAwvgoBlfPLDWCemfB9n5IJHPNqQVo
 gm0NU3rSUDx3t5lPZJqFGDW3XBD8jH7R6z9OinYSh80RZw5nZ/MoVvyZwCg1bIvcgWEG
 dzZy/TpT3tRK15GkoSvmf0zK43J3zSQz9djsq44OdLX6j0rft0Wk8uqFHMYse0ThRbYV
 o3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XSo53BkmTpukZoNK0tWrKhE5ExZG3ncWZ5pFWgOEMRM=;
 b=MQcwmLPMR5MN66FhRNL7QH27j3a6PZHOya0QxuSgR4L9aNBdzyeILf47yvK0UQ4FCW
 Q20Esfj+zURaNp2oXC4u0es0hx6ayWRf9NE31yNR3J5g8ZwervOqyAkr9Kmb7qdhjPnM
 lR3FFRcK2Zpc/qDskyr04XJt56WuISgacUGMK1GnyLYOlIf7KNSqtpLAky6ZRen7uCfA
 EW7/HD2HuGjeoL+63dsT+Pkz0eGQR89GEsoCL6wLybqnH3DsS2XUuBYaQ9f/eDaAV71t
 QIzseP9KKuLtkLG6k6JaszW4Fub4HwZeABwpbGxTOcoFPkK2104OY620ab13lkgG1st+
 ulSg==
X-Gm-Message-State: AOAM530TfqAmcg6bYPQ5J2gAWB7QuPLjV95zzOrfTeKRGzef4Xq9SyU9
 rfuew4JDO4rY5OBn8YMv53UzRGivwm7dPDqTivkKtg==
X-Google-Smtp-Source: ABdhPJx19iPdSlNToM38aIFsaRPI7VT86tuK9r/f+L/7d6fw/PNgZ2xi7zhd38rNwN4+79xXOVkvlNmXkH6hddOQIjA=
X-Received: by 2002:a05:6000:184a:: with SMTP id
 c10mr20228406wri.244.1621805668086; 
 Sun, 23 May 2021 14:34:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-5-jason@jlekstrand.net>
 <CAPj87rPW2xmOLKg6OgQST6QrH9u5-qmdRJrNDug+rWa=Uv6ZBQ@mail.gmail.com>
 <0a54d998-1c4b-724c-ec2d-a6c23aa35c21@amd.com>
In-Reply-To: <0a54d998-1c4b-724c-ec2d-a6c23aa35c21@amd.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sun, 23 May 2021 22:34:16 +0100
Message-ID: <CAPj87rOdE35n4yCe6U_384u0YR4oZ=zb9wKOH4PKEC4Ti5gUSg@mail.gmail.com>
Subject: Re: EPOLL for drm_syncfile (was Re: [PATCH 4/4] RFC: dma-buf: Add an
 API for importing sync files (v6))
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Sun, 23 May 2021 at 18:16, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
> Am 22.05.21 um 22:05 schrieb Daniel Stone:
> > Anyway, the problem with syncobj is that the ioctl to wait for a
> > sync_file to materialise for a given timeline point only allows us to
> > block with a timeout; this is a non-starter, because we need something
> > which fits into epoll. The most optimal case is returning a new
> > eventfd or similar which signals when a given timeline point becomes
> > available or signaled, but in extremis a syncobj FD becoming readable
> > when any activity which would change the result of any zero-timeout
> > wait on that syncobj is more or less workable.
>
> I think the tricky part is to epoll for a certain value.
>
> Not sure how eventfd is supposed to work, but IIRC we don't have the
> functionality to poll for a certain value/offset etc to become available.
>
> We could of course create a separate fd for each requested value to poll
> for thought, but that sounds like a bit much overhead to me.

Yeah, I understand the point; something like an eventfd is exactly
what you think, that we would have to materialise a new FD for it. On
the other hand, as soon as the sync point becomes available, the
winsys will want to immediately extract a sync_file from it, so I
don't think FD amplification is a big issue. If it looks like being a
problem in practice, we could look at providing a FD which starts off
inert, and only later becomes a sync_file after it polls readable, but
that sounds like something we really want to avoid if we can.

Cheers,
Daniel
