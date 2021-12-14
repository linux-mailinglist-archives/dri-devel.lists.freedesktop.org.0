Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A729D474836
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 17:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DC810E5AF;
	Tue, 14 Dec 2021 16:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAA510E5AE;
 Tue, 14 Dec 2021 16:34:41 +0000 (UTC)
Date: Tue, 14 Dec 2021 16:34:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1639499678;
 bh=NcGZ1y9KpapF6MmfajVE3Ye80xHC5l2T2OHzUMpujYg=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=Ge5gvQuctu7HqkMhTqRCyxnBw+pnt+gTBnsUdJJqw0U5+WkKYr+51qNa3wmFT0U59
 pHH/lx1sPNW3IdGWGtwbleFyFipv8ErxyOLPNa8R4ig2kmvKRRDv6IYIGwWhO4psgP
 QnOS8+1tpvRqOggH/06fgdbLQ+7Lvj5fODiOXf4hEJrddNHNEhGyLKw6YOvGeC9JGV
 8VnjWkDvsQQit2y+NnWUBQH3oo5n8KvC4u5PlLJKPtRSsTr/OIuvgkZxwMq1jNX8xD
 52ouyBqWIXQv3VRBOI/Yr7oMLY7PEL5GIGXbsKpmUWg/j6rNVG9mybcQUsLAvhdNGx
 NHHSIZn7aZQlw==
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Empty IN_FORMATS in sun4i-drm
Message-ID: <MCCOIoUO_vL9v836xOv401aEkEwLKqNlb2g6tfxFP6qhgExfJGi0PoyIyTVwdRpZhHYT2QZlc6_bhLBYDWVDZGKYvrt5-USC8FfVwXZGLWo=@emersion.fr>
In-Reply-To: <Ybiu8jZEyRii44Dw@luna>
References: <Ybiu8jZEyRii44Dw@luna>
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
Cc: Chen-Yu Tsai <wens@csie.org>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, December 14th, 2021 at 15:49, Emmanuel Gil Peyrot <linkmauve@li=
nkmauve.fr> wrote:

> This makes me think the kernel should populate IN_FORMATS with at least
> the same formats as the format list when supported, or stop advertising
> this property altogether.

Yup. This is a bug in the driver.

> Other compositors (such as phoc) still run file, probably because they
> use the format list exclusively, without consideration for modifiers.

phoc is based on wlroots, which falls back to its modifier-less codepath wh=
en
a driver is missing IN_FORMATS (or if it's empty). But it does support
modifier-aware buffer allocation as well.

> Besides fixing this driver, would it make sense to also make Weston
> ignore an empty IN_FORMATS and fall back to the format list?

I'd rather not, because this makes it more difficult to find buggy drivers.
