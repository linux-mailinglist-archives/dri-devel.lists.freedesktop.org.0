Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 044FC75ABDE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 12:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1DB10E59D;
	Thu, 20 Jul 2023 10:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 573 seconds by postgrey-1.36 at gabe;
 Wed, 19 Jul 2023 18:26:17 UTC
Received: from out-36.mta1.migadu.com (out-36.mta1.migadu.com [95.215.58.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E534310E086
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 18:26:17 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1689790601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=37wHIIYI9DhPyoRy35JYAgFolie7lX9w1NPQmmBEsM4=;
 b=PV5S9nHt8mTA6K8/5qUDw/bcUbR8RiNWFpNSnHQe9JdX1CaR0Dvj+7SBu0Q5iBPXaxqtFm
 iwdN5iP5FeGMekbLIlp6Exeb7WUcRbKSKgKgx80wWUn+wGiT7usswbg59Kcl46cjcUCf+2
 bE8CMdDSaEO0jeBMYmXsA6m7Ks3QsIY=
Date: Wed, 19 Jul 2023 18:16:36 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Konstantin Ryabitsev" <konstantin.ryabitsev@linux.dev>
Message-ID: <847159ff6d0c01cef2e6308848ea49a732248e42@linux.dev>
TLS-Required: No
Subject: Re: [PATCH 3/3] drm/scheduler: Clean up jobs when the scheduler is
 torn down.
To: "Luben Tuikov" <luben.tuikov@amd.com>, "Asahi Lina" <lina@asahilina.net>, 
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Sumit
 Semwal" <sumit.semwal@linaro.org>, "=?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?="
 <christian.koenig@amd.com>
In-Reply-To: <41efcbe5-e230-270f-53bb-90c703e9d3ad@amd.com>
References: <41efcbe5-e230-270f-53bb-90c703e9d3ad@amd.com>
 <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-3-c567249709f7@asahilina.net>
 <9343165f-2533-f363-4942-719ee9b7d2a4@amd.com>
 <99f9003f-d959-fff3-361a-25b2f47efc88@asahilina.net>
 <49a33f61-91b5-22ee-78b5-c7dd7c0d4a46@amd.com>
 <4587c699-5a59-d465-01f4-1bc2fbef7a12@asahilina.net>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Thu, 20 Jul 2023 10:23:05 +0000
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
Cc: asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Faith Ekstrand <faith.ekstrand@collabora.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

July 18, 2023 at 1:14 AM, "Luben Tuikov" <luben.tuikov@amd.com> wrote:
> > > Not sure about other drivers--they can speak for themselves and the=
 CC list
> > >  should include them--please use "dim add-missing-cc" and make sure
> > >  that the Git commit description contains the Cc tags--then git sen=
d-email
> > >  will populate the SMTP CC. Feel free to add more Cc tags on top of=
 that.
> >=20=20
>=20>  I use `b4 prep -c` which I think does the same thing? I just ran i=
t=20
>=20>  again and it only added 'linaro-mm-sig@lists.linaro.org', not sure=
 why=20
>=20>  that one wasn't there. Am I missing anything else?
>=20
>=20Not sure about "b4 prep -c"--using "git send-email" instead, but what=
 is
> important is to add the Cc: tags as part of the commit message. A "git =
log" of
> drm-misc-next shows the proper format. Then maintainers add Link:
> tag to the correct email thread, which is usually completely automated
> by "dim" or by "git am", or both.

It's useful to note here that this is not standard practice across the en=
tirety of the Linux tree. In general, Cc: trailers are added to individua=
l commits when get_maintainer.pl wouldn't otherwise include someone in th=
e recipient list. The "dim" tool mentioned here is specific to the DRM su=
bsystem (the "d" stands for "DRM"). Since both tools work on git series, =
you can use it alongside b4.

DRM folks, if get_maintainer.pl isn't finding someone who should be inclu=
ded on a series of patches, should the MAINTAINERS file be updated to mak=
e it easier to submit valid patches without needing to know of "dim"?

Regards,
-K
