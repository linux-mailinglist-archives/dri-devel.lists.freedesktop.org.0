Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8D46E5BA0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 10:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B7A10E6E4;
	Tue, 18 Apr 2023 08:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CA110E6E4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 08:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1681805303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8DTc/oRJhMEBa33wB3TaMgkNKc15dOmlHK8alGfdcJk=;
 b=i2y5XYqQS4KdTNNlpdITBztyfUED78n/aM0a3L19IR0dztlNgHD4h8kG3hHLJb6PE4BHyh
 BHoN5d/SlAU8cwhrU+rUiz49RLxT/CSXxujr6Onaz2R1d5d35D14IgL/OTfA4/HlL3/KGZ
 wp5ZiCeGY69eCgNlIg3o3Qf0vNWzzVk=
Message-ID: <1f63ffced9ed18309401af9a885310e1715b6538.camel@crapouillou.net>
Subject: Re: [PATCH v3 03/11] iio: buffer-dma: Get rid of outgoing queue
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <jic23@kernel.org>
Date: Tue, 18 Apr 2023 10:08:21 +0200
In-Reply-To: <20230416152422.477ecf67@jic23-huawei>
References: <20230403154800.215924-1-paul@crapouillou.net>
 <20230403154800.215924-4-paul@crapouillou.net>
 <20230416152422.477ecf67@jic23-huawei>
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Vinod Koul <vkoul@kernel.org>,
 Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>, dmaengine@vger.kernel.org,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

Le dimanche 16 avril 2023 =C3=A0 15:24 +0100, Jonathan Cameron a =C3=A9crit=
=C2=A0:
> On Mon,=C2=A0 3 Apr 2023 17:47:52 +0200
> Paul Cercueil <paul@crapouillou.net> wrote:
>=20
> > The buffer-dma code was using two queues, incoming and outgoing, to
> > manage the state of the blocks in use.
> >=20
> > While this totally works, it adds some complexity to the code,
> > especially since the code only manages 2 blocks. It is much easier
> > to
> > just check each block's state manually, and keep a counter for the
> > next
> > block to dequeue.
> >=20
> > Since the new DMABUF based API wouldn't use the outgoing queue
> > anyway,
> > getting rid of it now makes the upcoming changes simpler.
> >=20
> > With this change, the IIO_BLOCK_STATE_DEQUEUED is now useless, and
> > can
> > be removed.
> >=20
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> >=20
> > ---
> > v2: - Only remove the outgoing queue, and keep the incoming queue,
> > as we
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 want the buffer to start streaming data =
as soon as it is
> > enabled.
> > =C2=A0=C2=A0=C2=A0 - Remove IIO_BLOCK_STATE_DEQUEUED, since it is now f=
unctionally
> > the
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 same as IIO_BLOCK_STATE_DONE.
>=20
> I'm not that familiar with this code, but with my understanding this
> makes
> sense.=C2=A0=C2=A0 I think it is independent of the earlier patches and i=
s a
> useful
> change in it's own right.=C2=A0 As such, does it make sense to pick this
> up
> ahead of the rest of the series? I'm assuming that discussion on the
> rest will take a while.=C2=A0 No great rush as too late for the coming
> merge
> window anyway.

Actually, you can pick patches 3 to 6 (when all have been acked). They
add write support for buffer-dma implementations; which is a dependency
for the rest of the patchset, but they can live on their own.

Cheers,
-Paul
