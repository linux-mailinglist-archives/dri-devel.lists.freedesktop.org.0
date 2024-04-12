Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB808A3525
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 19:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A62E10E1C8;
	Fri, 12 Apr 2024 17:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=gaisler.com header.i=@gaisler.com header.b="Im0iVk8f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 474 seconds by postgrey-1.36 at gabe;
 Fri, 12 Apr 2024 17:51:44 UTC
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1C210E1C8;
 Fri, 12 Apr 2024 17:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp.simply.com (Simply.com) with ESMTP id 4VGP7R5WBkz680X;
 Fri, 12 Apr 2024 19:43:47 +0200 (CEST)
Received: from [10.10.15.20] (h-98-128-223-123.NA.cust.bahnhof.se
 [98.128.223.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by smtp.simply.com (Simply.com) with ESMTPSA id 4VGP7R12RYz67yx;
 Fri, 12 Apr 2024 19:43:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
 s=unoeuro; t=1712943827;
 bh=rz6jPUrsijT1INaAxqASzjJlCA1E00oo2UxdhuDoHkY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Im0iVk8feRxQgKlsQWaCXv3LUGHwDcqreNg4bxaJ3/IOrXfx2QiN1rnYBfEc+f2u5
 8MbqJsx4mJ8FaAweR4s/LxS3LCYE612Agy+eKqOKsD0gLkupmeXqyp8GmT5sJHqtiZ
 kRuaHnbzajuZP5Rptmhe/G5mAFIlHj5p1NxY+ApA=
Message-ID: <1b48be5f-bcc2-4cc0-8a23-85c472168082@gaisler.com>
Date: Fri, 12 Apr 2024 19:43:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Build regressions/improvements in v6.9-rc1
To: Sam Ravnborg <sam@ravnborg.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org
References: <CAHk-=wgOw_13JuuX4khpn4K+n09cRG3EBQWufAPBWoa0GLLQ0A@mail.gmail.com>
 <20240325200315.3896021-1-geert@linux-m68k.org>
 <8d78894-dd89-9f4d-52bb-1b873c50be9c@linux-m68k.org>
 <20240326181500.GA1501083@ravnborg.org>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20240326181500.GA1501083@ravnborg.org>
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

On 2024-03-26 19:15, Sam Ravnborg wrote:
> Hi all.
> 
>>   + error: arch/sparc/kernel/process_32.o: relocation truncated to fit: R_SPARC_WDISP22 against `.text':  => (.fixup+0xc), (.fixup+0x4)
>>   + error: arch/sparc/kernel/signal_32.o: relocation truncated to fit: R_SPARC_WDISP22 against `.text':  => (.fixup+0x18), (.fixup+0x8), (.fixup+0x0), (.fixup+0x20), (.fixup+0x10)
>>   + error: relocation truncated to fit: R_SPARC_WDISP22 against `.init.text':  => (.head.text+0x5100), (.head.text+0x5040)
>>   + error: relocation truncated to fit: R_SPARC_WDISP22 against symbol `leon_smp_cpu_startup' defined in .text section in arch/sparc/kernel/trampoline_32.o:  => (.init.text+0xa4)
> 
> Looks like something is too big for the available space here.
> Any hints how to dig into this would be nice.
> 
> Note: this is a sparc32 allmodconfig build

I have a patch for this. I'll clean it up and send it next week.

Cheers,
Andreas
