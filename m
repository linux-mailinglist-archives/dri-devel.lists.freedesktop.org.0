Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 776736D3153
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 16:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E397E10E0FD;
	Sat,  1 Apr 2023 14:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DDC10E0FD
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Apr 2023 14:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1680359504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hMrbsGp2VbSuKBP42mT23UvlOXpqHOgBiKJ7nTY4v2c=;
 b=GrRe12vSlJYlfUja0UIhZA/bhg+HyUD+h3ORFit2lWeN8k0evumUNlAmn/of32pQZkb8Iq
 OFFx6AUYaqh4qspAh+JrJ++/6jOjfefooPQ+0c+1fXJ+ftGKRMGaA4Ly24MPkHBZRk0V7j
 szECRpOr+X05RzncynymXdY1baUJAiU=
Message-ID: <425c1b8ea20002c6344a574cd094b4c715c67ba6.camel@crapouillou.net>
Subject: Re: [PATCH v2 0/3] usb: gadget: functionfs: DMABUF import interface
From: Paul Cercueil <paul@crapouillou.net>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Date: Sat, 01 Apr 2023 16:31:42 +0200
In-Reply-To: <c6ce737d-25cc-7f22-7c0f-c0ba1420e57d@collabora.com>
References: <20230322092118.9213-1-paul@crapouillou.net>
 <c6ce737d-25cc-7f22-7c0f-c0ba1420e57d@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: michael.hennerich@analog.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nuno.sa@analog.com, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

Le vendredi 31 mars 2023 =C3=A0 11:40 +0200, Andrzej Pietrasiewicz a =C3=A9=
crit=C2=A0:
> Hi Paul,
>=20
> W dniu 22.03.2023 o=C2=A010:21, Paul Cercueil pisze:
> > Hi,
> >=20
> > This small patchset adds three new IOCTLs that can be used to
> > attach,
> > detach, or transfer from/to a DMABUF object.
> >=20
> > Changes since v1:
> > - patch [2/3] is new. I had to reuse a piece of code that was
> > already
> > =C2=A0=C2=A0 duplicated in the driver, so I factorized the code.
> > - Make ffs_dma_resv_lock() static
> > - Add MODULE_IMPORT_NS(DMA_BUF);
> > - The attach/detach functions are now performed without locking the
> > =C2=A0=C2=A0 eps_lock spinlock. The transfer function starts with the
> > spinlock
> > =C2=A0=C2=A0 unlocked, then locks it before allocating and queueing the=
 USB
> > =C2=A0=C2=A0 transfer.
> >=20
>=20
> Can you share an example use case for these new features?
> Is there a userspace that excercises the new ioctls?

We use it at Analog Devices to share buffers between the IIO subsystem
and the USB stack, which makes it possible to stream data samples
between a host computer and high-speed transceivers as fast as
possible, in a zero-copy fashion.

This will be used by Libiio:
https://github.com/analogdevicesinc/libiio/pull/928/commits/dd348137ce37153=
2fd952a2b249cfd96afaef7d1

The code that uses these IOCTLs is not yet merged to the "master"
branch, but will be as soon as this patchset is accepted.

Cheers,
-Paul
