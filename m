Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 966095339DD
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 11:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86CB10E531;
	Wed, 25 May 2022 09:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B38610E853
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 09:24:02 +0000 (UTC)
Date: Wed, 25 May 2022 09:23:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1653470639; x=1653729839;
 bh=m3F5sBCQhyflhZYHcGz1JQd+8m8sckgA6ZxKHEb7fhc=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=xM125CeVNXdnl8fWOM1tamfsLH1XRYoiwHSncQAdXC7xriTl4BUnHZfcxfQ2LhHEa
 GCG1hX7UkE9C0V//fex1nZIOzFyhWnd+jPg70sgEwdRsS4bav76vGaZZVjDDLZV8bc
 44CNJVXjDoMVyodiFnKjaG13mIOdsSAiuyvWEXjB6y9FRQi54bA0KyPjTSkB3uTSO8
 K9W+5hfjozs9b40G7+ohuQQgY6xQe8wCIMV12iWsGMvyJAG9Mx0k+N/x0ld74dPSeU
 Csuygq4ajZAqsm4n8s+8lDYguJtHoydofyYkvDIo8Y66n+KqX1djGBqfywBIPR2v48
 LS1iEgxDIjUPw==
To: =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: How should "max bpc" KMS property work?
Message-ID: <U2A3FifHdFH9yDVrigaioxCTNx60MgkND7jcyIeKP2S4Ghu-BmmRaODqBDp6K0Q-aPBjPcqa2zUGuJNkGmRWZyQx2FjRJe9dVtJhQG9ZNCk=@emersion.fr>
In-Reply-To: <80798931-dbe7-54d7-8e1a-aaebfc39780c@mailbox.org>
References: <20220426113502.224d0a90@eldfell> <YmgyArRaJCh6JkQh@intel.com>
 <57d16ed5-8bfc-ce29-9250-14e2de18710a@redhat.com>
 <20220523112246.056ddc99@eldfell>
 <CA+hFU4wTHR9kLrFY3XkbeROZgxWamiZ6yGYL4jH+wpe8MzLvMw@mail.gmail.com>
 <20220525102850.5a70e58f@eldfell>
 <80798931-dbe7-54d7-8e1a-aaebfc39780c@mailbox.org>
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

On Wednesday, May 25th, 2022 at 10:35, Michel D=C3=A4nzer <michel.daenzer@m=
ailbox.org> wrote:

> > Mind that "max bpc" is always in auto. It's only an upper limit, with
> > the assumption that the driver can choose less.
>
> It seems to me like the "max bpc" property is just kind of bad API,
> and trying to tweak it to cater to more use cases as we discover them
> will take us down a rabbit hole. It seems better to replace it with
> new properties which allow user space to determine the current
> effective bpc and to explicitly control it.

+1, this sounds much more robust, and allows better control by user-space.
User-space needs to have fallback logic for other state as well anyways.
If the combinatorial explosion is too much, we should think about optimizin=
g
the KMS implementation, or improve the uAPI.
