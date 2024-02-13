Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AFD8533A7
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 15:54:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCA710E561;
	Tue, 13 Feb 2024 14:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=gaisler.com header.i=@gaisler.com header.b="fxRUG6+y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 524 seconds by postgrey-1.36 at gabe;
 Tue, 13 Feb 2024 14:54:05 UTC
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9605F10E561;
 Tue, 13 Feb 2024 14:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp.simply.com (Simply.com) with ESMTP id 4TZ3yd4Dj4z681k;
 Tue, 13 Feb 2024 15:45:13 +0100 (CET)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se
 [98.128.223.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by smtp.simply.com (Simply.com) with ESMTPSA id 4TZ3yH6LD4z67wS;
 Tue, 13 Feb 2024 15:44:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
 s=unoeuro; t=1707835513;
 bh=v6NrxM1eJN7Z7yzkWSBTKUltm5dbJ2HTXi9hG2LMSTA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=fxRUG6+yBSU+BFXn6+rebuuiiuqqWopqe29Vz2GaIf78w+V69ZIB+Af31iKeLr62p
 qpQdz7sWHzQ58CP3tqsZon5MfZ78+Sms5m4nebpjjUITGZQ1A2ZnKMsF4BxSh1OMBa
 S898RixpmWtD3+3XqXRY4JGgZ7I8bBk64Oy1wp1k=
Message-ID: <4582ff28-a443-4b0f-ba92-f48c414e2248@gaisler.com>
Date: Tue, 13 Feb 2024 15:44:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Build regressions/improvements in v6.8-rc1
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 mpi3mr-linuxdrv.pdl@broadcom.com, linux-scsi@vger.kernel.org,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-hardening@vger.kernel.org, qat-linux@intel.com,
 linux-crypto@vger.kernel.org,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 Netdev <netdev@vger.kernel.org>
References: <CAHk-=wiB4iHTtfZKiy5pC24uOjun4fbj4kSX0=ZnGsOXadMf6g@mail.gmail.com>
 <20240123111235.3097079-1-geert@linux-m68k.org>
 <d03e90ca-8485-4d1b-5ec1-c3398e0e8da@linux-m68k.org>
 <0229fa60-2d87-4b1c-b9f0-6f04c6e4dbdd@app.fastmail.com>
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <0229fa60-2d87-4b1c-b9f0-6f04c6e4dbdd@app.fastmail.com>
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

On 2024-01-23 15:21, Arnd Bergmann wrote:
>>>  + /kisskb/src/arch/sparc/include/asm/floppy_64.h: error: no previous prototype for 'sparc_floppy_irq' [-Werror=missing-prototypes]:  => 200:13
>>>  + /kisskb/src/arch/sparc/include/asm/floppy_64.h: error: no previous prototype for 'sun_pci_fd_dma_callback' [-Werror=missing-prototypes]:  => 437:6
>>
>> sparc64-gcc{5,11,12,13}/sparc64-allmodconfig
> 
> Andrew Morton did a patch for the sparc warnings, and Andreas Larsson
> is joining as a maintainer, so hopefully he can pick that up soon.
Which patch do you refer to here? I can not seem to find a patch fixing
these ones in particular on lore.kernel.org.

Thanks,
Andreas

