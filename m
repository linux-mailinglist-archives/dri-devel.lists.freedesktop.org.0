Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A06C7403746
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 11:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7596E092;
	Wed,  8 Sep 2021 09:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACFE6E092
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 09:51:59 +0000 (UTC)
Date: Wed, 08 Sep 2021 09:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1631094717;
 bh=d5Zj+TGr90JTh8WefhezMhEyKUxvWV0cTRKb7jZ+YWc=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=k8m2yeLzQ9Vbq7LMls9Btf4MVkm72ZmakdW0zId+DGirD34qJgImkgsMP9ku7bfPl
 R5/Ta9P1KfJ+emrv017PfSqTAVC6JU89uKJBMUy8DOwu2gMdz4E5Cgxz9rWYqVXsJH
 rmkaDVKkoPMqT7r0/yE+340XYHFap0v2ekuJI7u/rudzAiT5hN4eWGviA93buvcPKN
 ZPldyrD5+1xvikE4bY4Hp8LASyO9aX1oqC5mSKAS4PwPMwD9WkxNo46zfoaDI370r1
 osxzalEuOIj0z1e5ZQrklmvfJXKhYrNiw9tv/YPaUFntDpRqBYfEXlb7lz7v0HpafA
 /m1e623pqhMqA==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Cc: Dennis Filder <d.filder@web.de>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>
Subject: Re: Handling DRM master transitions cooperatively
Message-ID: <jSyTJ5Ev5ZkQFBv0Ar_6MALQ4Vj1e5lvB9gXrWcYkilCvhQ_Zo-9zpuPti5L0h1flBJuc4N_ayBmoqTbfqiSaUMwk3b08EgQ1DYKTHMYQsI=@emersion.fr>
In-Reply-To: <20210907155214.285b3561@eldfell>
References: <YTJypepF1Hpc2YYT@reader> <20210907130746.7b667dac@eldfell>
 <Kh2hM9odvPcbqNUxhSEwQbnUCLt6nyrAzGhxnQ0JO1CcAzI6y31enf8_AmgAynFxWo3E1QUlW1m8UvKPDAq0gFLQi2CF1b3FFNMRfiUzOAI=@emersion.fr>
 <20210907155214.285b3561@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> On Tue, 07 Sep 2021 10:19:03 +0000
> Simon Ser <contact@emersion.fr> wrote:
>
> > FWIW, I've just hit a case where a compositor leaves a "rotation" KMS
> > prop set behind, then Xorg tries to startup and fails because it doesn'=
t
> > reset this prop. So none of this is theoretical.
> >
> > I still think a "reset all KMS props to an arbitrary default value" fla=
g
> > in drmModeAtomicCommit is the best way forward. I'm not sure a user-spa=
ce
> > protocol would help too much.
>
> Hi Simon,
>
> for the "reset KMS state" problem, sure. Thanks for confirming the
> problem, too.
>
> The hand-off problem does need userspace protocol though, so that the
> two parties can negotiate what part of KMS state can be inherited by
> the receiver and who will do the animation from the first to the second
> state in case you want to avoid abrupt changes. It would also be useful
> for a cross-fade as a perhaps more flexible way than the current "leak
> an FB, let the next KMS client scrape it via ioctls and copy it so it
> can be textured from".

The KMS state can be limited to single FB on primary plane covering the who=
le
CRTC, no scaling, no other property set than FB_ID/CRTC_*/SRC_*.

Is it useful to make the previous client perform the animation? I don't rea=
lly
understand the use-case here.

> Userspace protocol is also useful for starting the next KMS client
> first and handing off only later once it's actually running. I'm not
> sure if that is already possible with the session switching stuff, but
> I have a feeling it might be fragile or miss pieces like the next KMS
> client signalling ready before actually switching to it.

Hm, right. I'm not 100% clear if it's possible for the next client to set
everything up while the VT is not active.

It would help to make logind/seatd give a non-master DRM FD when VT-switche=
d
away. Not sure they do it atm.
