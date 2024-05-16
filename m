Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1042B8C71C6
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 09:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437B910E5B0;
	Thu, 16 May 2024 07:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="IGAZBS1y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AB110E5B0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 07:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1715842836; x=1716102036;
 bh=leylzAvFIkYOhbcV7jem/Mh2/ncqrFvUUBxajYae3KI=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=IGAZBS1ywHjG+Qgfei0nIbaiB88Bj8RWeijm4CgpCI+BXXoT0Jqpr6jswQEfiY7IX
 MVCr7iqpB0qwoeJi50pQUg+3U41aIt4dfFCARDTLqbw+JWPR+3yPE9J/koviw4SpOF
 hnti8NZzSUk+LYyYz2U729onxAw4A5vJkCW4EPoGjHBk1JdWakj3I16Rq+2EN4N3t+
 oDrKFRBJ1Zv8bt/9uhGCOhE5nsG+4VRisMznQadNpDZjRygyAmVy8H2xQKe4Xm1oVE
 61QhmxqvrKlXpX4uoZwJ3WnQrLtOA1TxdwNL4IdMWozxVJyEAEEUIw4LkxKh4/Qjcr
 ZAi7jKUmPdUcQ==
Date: Thu, 16 May 2024 07:00:31 +0000
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Simon Ser <contact@emersion.fr>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Maxime Ripard <mripard@redhat.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Milan Zamazal <mzamazal@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <ttHZ6_mxyApQbVuEg7V20i3gCZ0nCr26aymroG2zxHv3CMRAA6RqZsUxNY3eBiYjycfb1r1WQdyMTwJO_I38FsJQMHA_Zdiqbbjs_YJWKr8=@emersion.fr>
In-Reply-To: <20240514204223.GN32013@pendragon.ideasonboard.com>
References: <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
 <Zjpmu_Xj6BPdkDPa@phenom.ffwll.local>
 <20240507183613.GB20390@pendragon.ideasonboard.com>
 <4f59a9d78662831123cc7e560218fa422e1c5eca.camel@collabora.com>
 <Zjs5eM-rRoh6WYYu@phenom.ffwll.local>
 <20240513-heretic-didactic-newt-1d6daf@penduick>
 <20240513083417.GA18630@pendragon.ideasonboard.com>
 <c4db22ad94696ed22282bf8dad15088d94ade5d6.camel@collabora.com>
 <20240514204223.GN32013@pendragon.ideasonboard.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 0685ead30ccf82fc3e353c2ffb3045b08edb5c59
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, May 14th, 2024 at 22:42, Laurent Pinchart <laurent.pinchart@ide=
asonboard.com> wrote:

> My experience on Arm platforms is that the KMS drivers offer allocation
> for scanout buffers, not render buffers, and mostly using the dumb
> allocator API. If the KMS device can scan out YUV natively, YUV buffer
> allocation should be supported. Am I missing something here ?

Note that dumb buffers are only intended for simple software-rendering
use-cases. Anything more complicated (e.g. involving GPU rendering)
should use another mechanism.
