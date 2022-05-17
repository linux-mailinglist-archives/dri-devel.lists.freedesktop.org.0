Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D780529B16
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 09:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA16112E3E;
	Tue, 17 May 2022 07:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCC4112E3B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 07:40:28 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id o80so11256016ybg.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 00:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tnwZrSLlP2BB5xIkW+a8cA8SwelHHc3AlZnDOhLB7fY=;
 b=fmYeJnWkAS9nTE9fMUFP6i5hntmsq7npf8EY7yzHx0UaacDLv3G/C8ZLxxRu965UYi
 6WrnZTUk4/ynjTBW5YIrg2CxkWG6wa601XaSoEUQ3QrjM8GbS5W52fncTYtYKO6FRFTV
 LU87alzVG0Eu+TfHcscqJZQPNGgGysP+BBugf2+pSvJBiYFlyOsxBSeLIA4t8s+c1sbR
 u/ERxPsYukBrWuD1IpGXhlM1RckHbkJ6X4i/tfkYEYv7lwNH+608AN65H83eGJ7QCbX7
 nFHY/rSz8iOCMxEUsGK3/JTjwrnW53FdPpzi4LkdJNK8VljZF2tMNuG0LvHO7XLO1oiy
 zROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tnwZrSLlP2BB5xIkW+a8cA8SwelHHc3AlZnDOhLB7fY=;
 b=uf7qGVrewhFm2QtHVRLUjUsDX/C3uy5XaXchr98CBTXFUeEUgiwOx3DJbLwMXrklLp
 wQzyixUElGvrxJcEfM3Vb7CFXIxo1dQfSSWWHfNADUJt58O5deIqkJOrZ6qpZh8kVcTR
 vw8kT1zu2PUWEErorIhND7uFINDi+DASYWLJqOzNxNskmDHayYOtoDllrl+aVBSY8wMA
 trCdKiTGoI4Z1bat0Qxwj5EnEBTHWfZ48HfZUxkj+ATssgQTKWnKObNlVXqow6exm4t6
 up5f5yJOV/9K+DFV7TgYQFUOVDsgvVTw2O+raF5kpVc5PQ/F0UscBbZMWZD4XtJGhjEX
 CgFw==
X-Gm-Message-State: AOAM530t4Je9iKc04Ki8OvSnHNQ62dW4gb+euarbt1QSDvH+bWLhVnAP
 +IKCPvEAfoXdClKi06ZBaP3cyKozTTyssVFauSV9PUsy
X-Google-Smtp-Source: ABdhPJx6n+IzK+xux+nTxf60oQGAo2eVyxguIm/g2TAQBS2ToTsNjN5emNpM63cZNsRUuItSxDuU11GYvan9T93ndzo=
X-Received: by 2002:a25:600b:0:b0:648:ef9b:172d with SMTP id
 u11-20020a25600b000000b00648ef9b172dmr21706811ybb.585.1652773227297; Tue, 17
 May 2022 00:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220411221536.283312-1-dmitry.osipenko@collabora.com>
 <a78343c8-2a6d-b223-4219-6b6b0a4fcb1f@arm.com>
In-Reply-To: <a78343c8-2a6d-b223-4219-6b6b0a4fcb1f@arm.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Tue, 17 May 2022 09:40:16 +0200
Message-ID: <CAK4VdL2hCEoshWZbCh5mkHuS6wYMiPFR3v4MWTnrEKM9zyv6Mw@mail.gmail.com>
Subject: Re: [PATCH v1] drm/scheduler: Don't kill jobs in interrupt context
To: Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 12:05 PM Steven Price <steven.price@arm.com> wrote:
>
> On 11/04/2022 23:15, Dmitry Osipenko wrote:
> > Interrupt context can't sleep. Drivers like Panfrost and MSM are taking
> > mutex when job is released, and thus, that code can sleep. This results
> > into "BUG: scheduling while atomic" if locks are contented while job is
> > freed. There is no good reason for releasing scheduler's jobs in IRQ
> > context, hence use normal context to fix the trouble.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 542cff7893a3 ("drm/sched: Avoid lockdep spalt on killing a processes")
> > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>
> Reviewed-by: Steven Price <steven.price@arm.com>

Is there something blocking this patch?
Mesa CI is still hitting the issue and I have been waiting for it to
be applied/backported to update CI with it.
Thanks

Erico
