Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7EECEF0C7
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 18:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749DB10E150;
	Fri,  2 Jan 2026 17:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ueHS8s1p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF1410E150
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 17:18:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F3FF540BA0;
 Fri,  2 Jan 2026 17:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15CB4C116B1;
 Fri,  2 Jan 2026 17:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767374330;
 bh=1E9We0nFmU1toA5DlV2iSCVX1FuJwtMdFE0FQXgkHFg=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=ueHS8s1pt/vb3iEbtNDP9TnLQLRTfGB64gzgTnM2jjTHNz5l4vPQmbyoY1j/3WePq
 xnCKnFNmcEn0/kviWN2ECPRW8EO8J9BCAvTM1FtSHBFeyMlUuG4+IyPVbRpOgg+k/m
 3hrNU2ptyEQT9y4yZ2QKmFQLjcJcgNXIXWP/sKDLESgdKKum4lM9rHC9bq4j3GqJBM
 B+RSulfPtQBgS9aiZEVjRrCCZ7kbJhrPC5GLaqYMUdY64Yi/IVzp5nIioXjQBmomgd
 +AqVypTgS4iuqCAlzhAkCQvmvCq7iSAyjGXsnxSrlqQX2wkRCtnjdlEleZRO3JoFAG
 kyOOxiKsMNEPA==
Message-ID: <71446537-a2a0-4051-8e4d-20256bf17824@kernel.org>
Date: Fri, 2 Jan 2026 18:18:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] video/logo: allow custom boot logo and simplify logic
To: Markus Reichelt <ml@mareichelt.com>
References: <20251230-custom-logo-v1-0-4736374569ee@kernel.org>
 <20260102163053.GE26548@pc21.mareichelt.com>
From: Vincent Mailhol <mailhol@kernel.org>
Content-Language: en-US
Cc: Helge Deller <deller@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org
Autocrypt: addr=mailhol@kernel.org; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 JFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbEBrZXJuZWwub3JnPsKZBBMWCgBBFiEE7Y9wBXTm
 fyDldOjiq1/riG27mcIFAmdfB/kCGwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcC
 F4AACgkQq1/riG27mcKBHgEAygbvORJOfMHGlq5lQhZkDnaUXbpZhxirxkAHwTypHr4A/joI
 2wLjgTCm5I2Z3zB8hqJu+OeFPXZFWGTuk0e2wT4JzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrb
 YZzu0JG5w8gxE6EtQe6LmxKMqP6EyR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDl
 dOjiq1/riG27mcIFAmceMvMCGwwFCQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8V
 zsZwr/S44HCzcz5+jkxnVVQ5LZ4BANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <20260102163053.GE26548@pc21.mareichelt.com>
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

On 02/01/2026 at 17:30, Markus Reichelt wrote:
> * Vincent Mailhol <mailhol@kernel.org> wrote:
> 
>> This series allows the user to replace the default kernel boot logo by
>> a custom one directly in the kernel configuration. This makes it
>> easier to customise the boot logo without the need to modify the
>> sources and allows such customisation to remain persistent after
>> applying the configuration to another version of the kernel.
> 
> Hah! What I have been doing for so many moons is to just cp my own logo
> 'logo_linux_clut224.ppm' -> 'drivers/video/logo/logo_linux_clut224.ppm'
> for each custom kernel build - that works like a charm.
> Maybe... I'm too pragmatic? It's that famous 'kill bill' logo from ages
> ago, 224 colors PPM

I was doing the same! I then started a rework a couple years ago to
implement this idea.. At that time, I was less experienced and did not
fully understood Kbuild. The result worked but was ugly and stayed in my
local tree.

This winter holidays, I had a bit of free time, revisited my old idea,
and this time, found something I thought was worth upstreaming. Thus
this series.

> Haven't tested your patch series cos stuff just works for me.
> Looking forward to feedback from all those logo nerds out there.

Looking forward for your Tested-by tag!


Yours sincerely,
Vincent Mailhol

