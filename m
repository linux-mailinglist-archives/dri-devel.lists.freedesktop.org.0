Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C3F221FE7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 11:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A7B6EC3B;
	Thu, 16 Jul 2020 09:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from v6.sk (v6.sk [167.172.42.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99656E575
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 07:30:18 +0000 (UTC)
Received: from localhost (v6.sk [IPv6:::1])
 by v6.sk (Postfix) with ESMTP id 8175060D19;
 Wed, 15 Jul 2020 07:30:15 +0000 (UTC)
Date: Wed, 15 Jul 2020 09:30:10 +0200
From: Lubomir Rintel <lkundrak@v3.sk>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v3 0/6] Generic USB Display driver
Message-ID: <20200715073010.GA41046@demiurge.local>
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200709163235.360054-1-lkundrak@v3.sk>
 <1280ec51-7528-b993-3110-f6c28e98832c@tronnes.org>
 <20200714174008.16272.qmail@stuge.se>
 <befd06f1-d0cc-ab26-3ec1-5da3f3ab3f37@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <befd06f1-d0cc-ab26-3ec1-5da3f3ab3f37@tronnes.org>
X-Mailman-Approved-At: Thu, 16 Jul 2020 09:42:42 +0000
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
Cc: balbi@kernel.org, linux-usb@vger.kernel.org, Peter Stuge <peter@stuge.se>,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 14, 2020 at 09:03:14PM +0200, Noralf Tr=F8nnes wrote:
> =

> =

> Den 14.07.2020 19.40, skrev Peter Stuge:
> > Hi Noralf,
> > =

> > Noralf Tr=F8nnes wrote:
> >> I would like to keep the SET_BUFFER request since it will serve as a
> >> syncing point between the host and the device. I'm no USB expert but I
> >> assume that a bulk transfer can fail halfway through and result in the
> >> next update starting where the previous one failed and thus writing
> >> beyond the end of the display buffer.
> > =

> > Transfers either succeed completely (possibly after many retries),
> > time out (after zero or more transfered bytes) or fail catastrophically
> > (e.g. from device disconnect).
> > =

> > In all cases, the driver on the host knows/has available how many bytes
> > were successfully transfered.
> > =

> =

> I was thinking about the device, that it could get out of sync. Let's
> say the host sends a 1k framebuffer and half of it gets transferred and
> the rest fails for some reason. Lubomir's MCU implementation has an
> endpoint max size of 64 bytes and a callback is called for each packet.

Note that 64 bytes was chosen totally arbitrarily, without any thought.
Perhaps the full frame of 1024 bytes would work just fine. I'm not
familiar with USB at all.

> If the 1k transfer fails at some point, will the device be able to
> detect this and know that the next time the rx callback is called that
> this is the start of a new framebuffer update?
> =

> Noralf.

Lubo
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
