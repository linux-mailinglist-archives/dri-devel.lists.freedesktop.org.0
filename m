Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14791414D01
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 17:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502716EC23;
	Wed, 22 Sep 2021 15:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518F96EC23
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 15:29:45 +0000 (UTC)
Date: Wed, 22 Sep 2021 15:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1632324579;
 bh=Mwz1fQ7g/xFdXMagDqCF7sae7aTrfY8keJ/VcPSnbEM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=aOgdzbcAyjOjyqga13wXEfDhWE0omxZw7yITRW9Cx7/qDc0b7q1qncNPewIEgv6MO
 D/8P6ES2nofrR418US6NeFNEpgWglLFHIXHe6g63UPSZhyQUMeukEqnrtkvMWRW10I
 7ZXpryuD9haarIP8cDEdYVHMtrWI0YkrBNt+t1uZJAorzMpNWHLLAmwGsTedo8lXAs
 AM24ENBfAsCZx7RnwWXTMmwxsRbbqEZO64kWhzizomvyaG6ROUZzKaVsykktbcWi+5
 llR2V+fTULmZEfXGuJ+K2I/Ofvgk8b/Fk5Ho0Kbih3PGR/eCQ3zySJAXf5D3e4AsSC
 B9B0CE4WjNquA==
To: "Hoosier, Matt" <Matt.Hoosier@garmin.com>
From: Simon Ser <contact@emersion.fr>
Cc: "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: Multiple DRI card detection in compositor systemd units
Message-ID: <xiT2GOL-X7GZiZUihjkIOFEbbS3vuVQrvogRKQjVdONfi07OwXydRhIUWU_elgmh0Ug9mAUONLEDC-bQe69fsOcd7Iq31R8T_Ai5KGhOnzE=@emersion.fr>
In-Reply-To: <19277F1C-6CF5-4C19-9492-4A03F951764B@garmin.com>
References: <19277F1C-6CF5-4C19-9492-4A03F951764B@garmin.com>
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

Maybe try creating multiple physical seats with logind, and start each
compositor on its own seat? A physical seat is a collection of devices like
DRM nodes and evdev device files.

Also udev creates files in /dev/dri/by-path/, these should be stable across
reboots. `udevadm settle` before a compositor start-up can wait for udev to
finish its job.

Out of curiosity, can you explain your use-case? Why do you need to start
multiple compositors, each on its own GPU?
