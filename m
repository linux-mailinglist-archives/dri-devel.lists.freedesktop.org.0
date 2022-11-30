Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 410EE63D984
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 16:34:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9573910E48C;
	Wed, 30 Nov 2022 15:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EFA10E48B
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 15:34:15 +0000 (UTC)
Date: Wed, 30 Nov 2022 15:34:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1669822452; x=1670081652;
 bh=eQRixGy4kw5VGm/wWLNEoHl82ETy9juVuvbg2not45E=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=i+lP3fuqLe22Ym+G+fT5cssaR6FMOdmr5I+BDccwLd1yGG9tM2KTnAsDhjxUbpCAw
 5RVW7MjdaGwDbR7ZlAUGrMJbGbcRQb7kqQqpfyki+yr908M0+cYCK0m9PUPeEy0u9L
 EwfnjN5rhMinpG9oS7Gln2T+QIxXkWSP/sq0PUtYuUDBjjNOpiOvzXRrqG1LOhHozC
 9AZRaUQxeb+xdVWaozmYW/i/JwheISEctQ7Z3z41IKk/UnyaScvhveU1yurd4B/P1l
 +17SM451vUE+oYq0w4GHJhojZPeB053I3s6PyHAB+jlfsQngJL7RCdHihpL+XtTnvj
 SuLrcPfUIaz1Q==
To: =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 0/2] drm: Add GPU reset sysfs
Message-ID: <9WiGqqLyo5VwAmb8qBPZAhUiq_ptdB-lNo5d6A42raXoJU8XPxojB_44bKkR8Tw82SdiiPz1lAKpe7HH9HlDA0fFpgcy6shNjTDxOfsadFE=@emersion.fr>
In-Reply-To: <2dbf222e-7694-ea5e-c35d-663011c16e84@igalia.com>
References: <20221125175203.52481-1-andrealmeid@igalia.com>
 <20221128112528.1206b1f5@eldfell>
 <584UdQAqoPr4vSxCTJg70LFQm--HpHH-EhnAo78lRAZ89OnrDkUeKlTnDGT_DMzDT3PeEtmXNsrqB6GuiV4TsZv3pBU8kFWjyPLWGrevIMw=@emersion.fr>
 <2dbf222e-7694-ea5e-c35d-663011c16e84@igalia.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?utf-8?Q?=27Marek_Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, amaranath.somalapuram@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 contactshashanksharma@gmail.com, christian.koenig@amd.com,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, November 30th, 2022 at 16:23, Andr=C3=A9 Almeida <andrealmeid=
@igalia.com> wrote:

> On 11/28/22 06:30, Simon Ser wrote:
>=20
> > The PID is racy, the user-space daemon could end up killing an
> > unrelated process=E2=80=A6 Is there any way we could use a pidfd instea=
d?
>=20
> Is the PID race condition something that really happens or rather
> something theoretical?

A PID race can happen in practice if many PIDs get spawned. On Linux
PIDs wrap around pretty quickly.

Note, even a sandboxed program inside its own PID namespace can trigger
the wrap-around.

> Anyway, I can't see how pidfd and uevent would work together. Since
> uevent it's kind of a broadcast and pidfd is an anon file, it wouldn't
> be possible to say to userspace which is the fd to be used giving that
> file descriptors are per process resources.

Yeah, I can see how this can be difficult to integrate with uevent.

> On the other hand, this interface could be converted to be an ioctl that
> userspace would block waiting for a reset notification, then the kernel
> could create a pidfd and give to the blocked process the right fd. We
> would probably need a queue to make sure no event is lost.

A blocking IOCTL wouldn't be very nice, you can't integrate that into
an event loop for instance=E2=80=A6
