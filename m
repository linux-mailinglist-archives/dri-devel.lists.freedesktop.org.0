Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B4871FFAA
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 12:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C41410E010;
	Fri,  2 Jun 2023 10:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5768410E656
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 10:45:20 +0000 (UTC)
Date: Fri, 02 Jun 2023 10:45:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1685702717; x=1685961917;
 bh=UZrv35WvyMyOdPGbSzJYYmRhMaXO4XwcYUvxcV38CH8=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=upxKgIWHwF8RiQagV8PcmMLUm5qa8P8tNFhlJ3XHkFq0QyVvsg8ibQ755GZESUBPw
 Ji9+2n/3zi7ma992QZBmrJpm7hFVkc9lNpd4J6xkO/CuQBqgMb/gt+GyCFomN7B19/
 jwkNaV9PyJxwIJNAyxBIQL5d6vxc1gxi/uU0qF6z+UdU9JuIOd0e4fU4qCncX3+r93
 WyE4GNwclJNLB9JZlSIZSYAJSAYskVKTrioHb4Gg8kULg6cTw1Otjzm3XotkQ70pKq
 PgHgf+IPboX7kR/UQWEEBtdVGKHjyaG0wbNSTjjyPl3BHgqFJlFZWULBZ0Cq+Tp589
 Hf4N0uzWY3OTg==
To: =?utf-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
From: Simon Ser <contact@emersion.fr>
Subject: Re: How to fetch the implicit sync fence for a GPU buffer?
Message-ID: <9Nky3Gm6DCOze6RVKWRzTmgkGhW9KjI3odqDiMMqLCWPWWl4Hl985MFVO1R4xMMrlP-QvYpch6EIHe_C--uPLe471TpVtBns39psMV95zbU=@emersion.fr>
In-Reply-To: <47893a27-27bc-2cfc-7ff1-9049248811f1@daenzer.net>
References: <SN6PR04MB5184576F8660D04D62AEE5C8EC49A@SN6PR04MB5184.namprd04.prod.outlook.com>
 <47893a27-27bc-2cfc-7ff1-9049248811f1@daenzer.net>
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
Cc: "Hoosier, Matt" <Matt.Hoosier@garmin.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "'wayland-devel@lists.freedesktop.org'" <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, June 2nd, 2023 at 12:29, Michel D=C3=A4nzer <michel@daenzer.net>=
 wrote:

> > I=E2=80=99m wondering whether there=E2=80=99s an API -- maybe something=
 analogous to drmPrimeHandleToFD() =E2=80=93 that allows userspace to fetch=
 a waitable fence fd for a dmabuf?
>=20
> A dma-buf fd itself can serve this purpose; it polls as readable when the=
 GPU has finished drawing to the buffer.

If you _really_ need a sync_file FD, you can extract it via
DMA_BUF_IOCTL_EXPORT_SYNC_FILE. This is a somewhat recent kernel uAPI.
