Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E8D8B3CCC
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 18:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2466F10F16B;
	Fri, 26 Apr 2024 16:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=gaisler.com header.i=@gaisler.com header.b="Qip71L1C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8256F10F16B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 16:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp.simply.com (Simply.com) with ESMTP id 4VQysF4BZqz681r;
 Fri, 26 Apr 2024 18:31:13 +0200 (CEST)
Received: from [10.10.15.10] (h-98-128-223-123.NA.cust.bahnhof.se
 [98.128.223.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by smtp.simply.com (Simply.com) with ESMTPSA id 4VQysD6C6Lz681M;
 Fri, 26 Apr 2024 18:31:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
 s=unoeuro; t=1714149073;
 bh=7dZ7krTYAZxq8cPoPdHSIbY+K7yXIIJx3qWxQhJ/RRk=;
 h=Date:From:Subject:To:References:In-Reply-To;
 b=Qip71L1CB2hsoOlwuKmcv17dZwZJcIodp8s9eiGLiE2SdJKEkPWTctJVORe6CHLyw
 w1vgSpFi5Etpn/M8S373xPLJoB8krfHcRZKzkUxQEs9wK1YY2FZkFjRYS1WsI7YWxh
 vepEI2N+D2i5R7QMzj66NgwXNxt6h05IqlTiooW4=
Message-ID: <7749e9f4-2540-4618-8689-b6bb757f9cd0@gaisler.com>
Date: Fri, 26 Apr 2024 18:31:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andreas Larsson <andreas@gaisler.com>
Subject: Re: [PATCH v2 00/28] sparc32: sunset sun4m and sun4d
To: Sam Ravnborg <sam@ravnborg.org>, "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Helge Deller <deller@gmx.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Kjetil Oftedal <oftedal@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sound@vger.kernel.org
References: <20240309-sunset-v2-0-f09912574d2c@ravnborg.org>
 <20240423180216.GA906720@ravnborg.org>
Content-Language: en-US
In-Reply-To: <20240423180216.GA906720@ravnborg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 2024-04-23 20:02, Sam Ravnborg wrote:
> Please let me know if you expect me to rebase this on for-next.
> I have not yet tried if there are merge conflicts but can take a look in
> a some days if required.

My local testing branch for this patchset rebased with trivial fixups,
so no immediate rebase and resubmission is needed. I do run into some
strange problems on SMP with this patchset plus your CAS patchset, that
I do not get when I rebase the Linux patches from our kernel release
that has my CAS patchset. With no CAS at all these things fails even
worse, so do I need one or the other for these tests.

I will need to dig deeper into figuring out the problems seems to be due
to something in any of your two patchsets in themselves or if it is
something else. I do need some additional fixes from our kernel release
for SMP to work properly, so it could also be that there is something
with my combination of your patches and my patches adapted on top of
yours.

There are also some needed fixes for LEON that relies upon code removed
in this patchset. Maybe the best solution for that would be if I submit
those and you then rebase upon them.

> That is assuming you agree with the sunset of the sun platforms...

I do agree with the idea in general, but being busy with other things I
have had little time to dig into this lately.

Thanks,
Andreas
