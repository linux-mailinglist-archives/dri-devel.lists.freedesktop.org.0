Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DF5CEF3F5
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 20:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889E310E086;
	Fri,  2 Jan 2026 19:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XwOIPmre";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDCD10E086
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 19:55:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8338D6013B;
 Fri,  2 Jan 2026 19:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E8DCC116B1;
 Fri,  2 Jan 2026 19:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767383725;
 bh=fdzRTxYd/8fmC6E2ix6d2vlYTiXxFbzTh9K6C3MRL4U=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=XwOIPmre24NB2/ps9S9LNtzPJQYlhHhk0YSog0nBIedNk7YdYpBMSu3/4rnT8jOs/
 9Fn1NUJBv8SeRVGjT9PqvQLI0kmpo00xnNr4cuJ196IIMgTCv8P0kxAKtqD6NFsBsH
 Cwxmp87efdurqu/UXOXGmwB/naLJAknRsK+UEjrVZYV7wgZ7GAEH00jF8XX0LthptV
 eTUcpqme2knOvYsTtVfYH0A+oodCsoxOi44SZXF/QI1Ue2BsKXVCCQMlArxaCM4HSo
 Gf808ynrS7rZ1pt6e8cIC7IYMcRex5qXgBp7a5O5VG7PQdMk1Bo3ieFJqg4vVkqiR2
 IIwOnLBL4M0DQ==
Message-ID: <633a3a65-4f13-4a4a-9e6b-92301ea81b47@kernel.org>
Date: Fri, 2 Jan 2026 20:55:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] video/logo: allow custom boot logo and simplify logic
From: Vincent Mailhol <mailhol@kernel.org>
To: Markus Reichelt <ml@mareichelt.com>
Cc: Helge Deller <deller@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org
References: <20251230-custom-logo-v1-0-4736374569ee@kernel.org>
 <20260102163053.GE26548@pc21.mareichelt.com>
 <71446537-a2a0-4051-8e4d-20256bf17824@kernel.org>
Content-Language: en-US
Autocrypt: addr=mailhol@kernel.org; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 JFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbEBrZXJuZWwub3JnPsKZBBMWCgBBFiEE7Y9wBXTm
 fyDldOjiq1/riG27mcIFAmdfB/kCGwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcC
 F4AACgkQq1/riG27mcKBHgEAygbvORJOfMHGlq5lQhZkDnaUXbpZhxirxkAHwTypHr4A/joI
 2wLjgTCm5I2Z3zB8hqJu+OeFPXZFWGTuk0e2wT4JzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrb
 YZzu0JG5w8gxE6EtQe6LmxKMqP6EyR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDl
 dOjiq1/riG27mcIFAmceMvMCGwwFCQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8V
 zsZwr/S44HCzcz5+jkxnVVQ5LZ4BANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <71446537-a2a0-4051-8e4d-20256bf17824@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 02/01/2026 at 18:18, Vincent Mailhol wrote:
> On 02/01/2026 at 17:30, Markus Reichelt wrote:

(...)

>> Haven't tested your patch series cos stuff just works for me.
>> Looking forward to feedback from all those logo nerds out there.
> 
> Looking forward for your Tested-by tag!

D'oh, I misread your message. When my brain parsed your text, I read it as:

  Haven't tested your patch series cos work stuff…

As if you were too busy with your work to test it now.


Yours sincerely,
Vincent Mailhol

