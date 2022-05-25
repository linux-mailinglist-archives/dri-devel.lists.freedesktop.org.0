Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C845336A0
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 08:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E008C112593;
	Wed, 25 May 2022 06:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C417112593
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 06:04:53 +0000 (UTC)
Date: Wed, 25 May 2022 06:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1653458690; x=1653717890;
 bh=i2oRRiL4k8cJ36ktZc4v3UFoeXMEqnM45DxYrLgOJ34=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=We7gIXw1/IIGARRPsZw8Lp7sWhoeNVvdNV3fn6dSjn8CN/IYrl+8u6KuQNgkgCSQh
 Cose/vMkdpMBADBSrCB3Gry2l0O/hNJbboVXo/v8WHfj6FuRDRtaEpRCcqpfseEG9W
 rjMXuJoaGBd7UrsDW3FX92If7Q5vppYg+pt9WjDrpMtpNwwtMfRGjYeUgkZnrrNSM8
 L279aS/EK1nPjRuRRPubgq6XIxrevmiBNwPNxHl3HlkE8ZwJLZz64RcyPBK3GYMprg
 KBonWloHwJj+WOivClxWZs6WnQ36IzUCjbtVjiZFfz6si8V8W1U8L7qLnnJWRrAfnv
 xploUWzdL6AaQ==
To: Alex Deucher <alexdeucher@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: How should "max bpc" KMS property work?
Message-ID: <Y40sjQZk7WCHYqiIgIMlwqwdc329-6OzQvtggcXybRTILpeNyk7rwWg4nVr5yxQFg4V6N9LPv6jXaoLehWDUx5LXu9r72dW8MJMh6mBbFHg=@emersion.fr>
In-Reply-To: <CADnq5_N9gLzLnmPa4K9+40wTfgyC5TN4sZsuaK6+011DAgMPPA@mail.gmail.com>
References: <20220426113502.224d0a90@eldfell> <YmgyArRaJCh6JkQh@intel.com>
 <57d16ed5-8bfc-ce29-9250-14e2de18710a@redhat.com>
 <20220523112246.056ddc99@eldfell>
 <CA+hFU4wTHR9kLrFY3XkbeROZgxWamiZ6yGYL4jH+wpe8MzLvMw@mail.gmail.com>
 <d9c4b940-4a16-cd6f-2672-752a2678c32c@redhat.com>
 <Yoz9GisEO9M4KRPB@intel.com>
 <CADnq5_N9gLzLnmPa4K9+40wTfgyC5TN4sZsuaK6+011DAgMPPA@mail.gmail.com>
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 =?utf-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, May 25th, 2022 at 00:03, Alex Deucher <alexdeucher@gmail.com>=
 wrote:

> > Why would anyone want to run at 8bpc when they have a panel with
> > higher color depth? So I think someone is going to be doing that
> > modeset eventually anyway.
>
> We used to do something similar, but then got piles of bug reports
> about the displays running at 30Hz rather than 60 so we changed it to
> 8. It's hard to say what a user will prefer.

"max bpc" is a maximum, ie. it shouldn't make a modeset fail, the kernel
should automatically reduce the bpc if the link bandwidth is insufficient.
So that sounds like there's an amdgpu bug here?
