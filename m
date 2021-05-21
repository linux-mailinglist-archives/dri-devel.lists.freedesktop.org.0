Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0936638C72A
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 14:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0176E4E8;
	Fri, 21 May 2021 12:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002706E4FE
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 12:54:15 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id a4so21024044wrr.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 05:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FJZtfLgsMzPpeEGC1nWMm7W+KSm1MH2DLYlMQ7WHt1A=;
 b=sFGpdh1dbpP8JSKR1U5AOEieSm0E4tGRK55RIlKzhpUYYD3nZXIvDR2brLKqPzRu0u
 zIyVfraBuh1c5fIsX1HMBxFUVwKD2R3qnFutX1JtHyW0NlRGTH0uvf832I4g8nhP0T/a
 mwwiDfknsZS7vuFFEi2KwIiHPPS1XkXKy3DnGSkiBlVJybTzdOZFR5fgrpIqzn5vP+UJ
 /kAfrcH2cZLJ8QhLo3Wg5w2a8TqB6b28BhglC7vyL8r099YlZraIJYospyDMT/v3U0MH
 u/USku+abTJL2De2pHeCfruVuOdK4CBydA07Cv6yLoBnuDbtwx0km2WGWDWNiPW8kci0
 fl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FJZtfLgsMzPpeEGC1nWMm7W+KSm1MH2DLYlMQ7WHt1A=;
 b=sp8BEKyKQimyIyWRb7qWITzz7ctTlJXGbGuybiFy4JwPbKgKAWLBxcJ9q+K0/iapEb
 rLtENrBTorhFpqEevtOmVgynX9eySnNyI67mnqsAYkmoj0CMSrthRxB8e/eMmU7ouqaO
 LLEhK+Bzgxr4iYvad3OZKTMRgaCjI2RHjbmItMA3bFI/8hkIUoKv2cS9lOw3qc0QkHc7
 TWDa/3el3C/avDl9Bm5uPNe5DRndi5wRtn12JmRlYxxNs2GIy538MyTmH4ROF2BZ+ZDj
 fHMQ5l+NdR3eSk8JtUIQXInTuRK1mr2BK2HHux4VNeJCi86JdFc4b7rvw2rteMXXf4zO
 2Pzw==
X-Gm-Message-State: AOAM5332ECr4EChsN+15Ne186Nt8yEWHU69Yf27ggw+yMM9y5ZK6dqih
 0l7cVsbr5wnEsLgzuqqiFUc+AAuGwQXd940eTASv4A==
X-Google-Smtp-Source: ABdhPJwl27bN4Oz12Tnt6vIx/LxywSl8190UB/7R09nMwblbNvh85dxGlpNGkieI1QeXVqDFLBux5vHjGvOpKZOK43M=
X-Received: by 2002:a5d:570c:: with SMTP id a12mr9289625wrv.354.1621601654629; 
 Fri, 21 May 2021 05:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-4-daniel.vetter@ffwll.ch>
 <CAPj87rMBVRamT+VAVUaUnq3C1KFVqzABi99RKs=1_vyb4YWDnQ@mail.gmail.com>
 <d1ef10e8-b774-06e5-92ab-047c58e1ea41@amd.com>
In-Reply-To: <d1ef10e8-b774-06e5-92ab-047c58e1ea41@amd.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 21 May 2021 13:54:03 +0100
Message-ID: <CAPj87rOzV1mC=Nv2zfsYXrD4ARV7cmmJmkUCSwRSw1Ksy0k-aA@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 04/11] drm/panfrost: Fix implicit sync
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 May 2021 at 13:28, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
> Am 21.05.21 um 14:22 schrieb Daniel Stone:
> > Yeah, the 'second-generation Valhall' GPUs coming later this year /
> > early next year are starting to get pretty weird. Firmware-mediated
> > job scheduling out of multiple queues, userspace having direct access
> > to the queues and can do inter-queue synchronisation (at least I think
> > so), etc. For bonus points, synchronisation is based on $addr =3D $val
> > to signal and $addr =3D=3D $val to wait, with a separate fence primitiv=
e
> > as well.
>
> Well that sounds familiar :)

I laughed when I first saw it, because it was better than crying I guess.

If you're curious, the interface definitions are in the csf/ directory
in the 'Bifrost kernel driver' r30p0 download you can get from the Arm
developer site. Unfortunately the exact semantics aren't completely
clear.

> > Obviously Arm should be part of this conversation here, but I guess
> > we'll have to wait for a while yet to see how everything's shaken out
> > with this new gen, and hope that whatever's been designed upstream in
> > the meantime is actually vaguely compatible ...
>
> Yeah, going to keep you in CC when we start to code and review user fence=
s.

Awesome, thanks Christian. Appreciate it. :)

Cheers,
Daniel
