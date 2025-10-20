Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C71BF1B03
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 16:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5042510E448;
	Mon, 20 Oct 2025 14:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="NzY5dq89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509D510E448
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=i8BZGV6LoY0cbaBAewzBP0aJU2+0DxPqRrB/6tkm8lU=; b=NzY5dq89U6ZP9rpEsgSVEV6Anf
 QvslpO7jPJB4lHymKfAJ9Romcr6e/+yosrm/YrbUB/Si+yTEYsJpyKTAqgwmoDvDxKOeR3dXyicWe
 AwebwP9mUYRWd1Ndf2Ffi3rO+O6CKnJydRlbMIuPJdS/D0VnjZw7xhBfqmHspAmoPTikIzbZN5ABx
 qVmLHap+PkuacRB62r1m4cin+nDCjRKGAPCrw8o/C9ClIo+h9yWTCYdaTw1q8tCLl9epMhZhZ0Uc3
 ykrNyWMaTt4vJ7Z8k3srVMMqeqz/M+2OzFQ+rk8JAmb0rEy9bKBmN1ufIBaG7xz39LFqtHiJziUOY
 y8S7BZrQ==;
Received: from [212.111.240.218] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vAqR6-0001wu-R7; Mon, 20 Oct 2025 16:00:32 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Daniel Stone <daniel@fooishbar.org>
Cc: dri-devel@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>,
 andy.yan@rock-chips.com, hjc@rock-chips.com,
 cristian.ciocaltea@collabora.com, kernel@collabora.com
Subject: Re: [PATCH 06/13] drm/rockchip: Switch impossible format conditional
 to WARN_ON
Date: Mon, 20 Oct 2025 16:00:32 +0200
Message-ID: <1938027.tdWV9SEqCh@phil>
In-Reply-To: <CAPj87rM=Zvg9HbJ71FCmbGXAe32R0B1yLwRwyS0ztEy6=aww_w@mail.gmail.com>
References: <20251015110042.41273-1-daniels@collabora.com>
 <6535426.R56niFO833@phil>
 <CAPj87rM=Zvg9HbJ71FCmbGXAe32R0B1yLwRwyS0ztEy6=aww_w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, 20. Oktober 2025, 15:47:16 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Daniel Stone:
> Hi,
>=20
> On Mon, 20 Oct 2025 at 14:25, Heiko Stuebner <heiko@sntech.de> wrote:
> > Am Montag, 20. Oktober 2025, 15:10:31 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Heiko Stuebner:
> > > Am Mittwoch, 15. Oktober 2025, 13:00:35 Mitteleurop=C3=A4ische Sommer=
zeit schrieb Daniel Stone:
> > > >     format =3D vop2_convert_format(fb->format->format);
> > > > -   if (format < 0)
> > > > -           return format;
> > > > +   /* We shouldn't be able to create a fb for an unsupported forma=
t */
> > > > +   WARN_ON(format < 0);
> > >
> > > What happened to Greg's
> > > "But don't add new WARN() calls please, just properly clean up and ha=
ndle
> > > the error." [0]
> > >
> > > Also, switching to WARN_ON would then continue the atomic_check funct=
ion
> > > where it currently does exit with a real error code?
> >
> > So while I can live with WARN_ON as something that should never ever
> > happen
>=20
> Right, I'm following the clarifications from jgg and Kees in that
> thread, namely that WARN_ON is being used for 'how on earth did this
> happen, the code is somehow completely broken' situations that
> userspace should never be able to trigger under any circumstances.
>=20
> > I still think atomic_check should follow its function and report
> > the error upwards like:
> >
> > if (WARN_ON(format < 0))
> >   return format;
>=20
> Happy to do this if you prefer.

I do :-) .

In the same line as the rest of your series does get rid of strange
clutches that try to work around impossible situations, if the format
thing is wrong, we should not continue, but fail the check function,
as we did before.


Heiko


