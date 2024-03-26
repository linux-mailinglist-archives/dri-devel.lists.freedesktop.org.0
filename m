Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 004FD88CBD2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 19:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDBA10E29B;
	Tue, 26 Mar 2024 18:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="nyeOTCdX";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="rL+ukD2Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod3-cph3.one.com
 (mailrelay5-1.pub.mailoutpod3-cph3.one.com [46.30.211.244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7828C10E33F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 18:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=8cfX7j0cZTLxYnTUI6w58EoQmIDSw6kaORCfZyfLSls=;
 b=nyeOTCdXkrX+AnYb2SH2o8UNaN7MEL/eLOuR/HxjUcCojfmUxEf1IYSvFe57aGwCXPRpwJnc2eKvF
 IgVer08UY4ywfd6yHdwNmVKKsRplrooqtKDG3xkplHga149okVZxGGy9GInR2g3HT1EKFlEQgQiI6/
 UskNZ+kb3sCMlzUq7OWUJ8PNQG9121mKwNR04NB58zJFOYpyjgEF4Bal4nwnL9WKEfF5dYXjMgU4fa
 ufj3SWJcgNd/3HKna6TzqZNQOCM8nFm4hnfFS26/dBKYNRmJso1M4n6mF9Sl0icrUSk6rEE+NCUHfW
 Ff2IMnIPUeikUZZpj8PhtuY9h0mersw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=8cfX7j0cZTLxYnTUI6w58EoQmIDSw6kaORCfZyfLSls=;
 b=rL+ukD2QXe4F+m5MLDkbUa/qyyilhQ/TiMT4rGWt3HqeijcmTmhKSIz4EVkcvr5PlEK0+Oj/0biOq
 Ngc23tKDA==
X-HalOne-ID: c19233ce-eb9c-11ee-bd8a-9fce02cdf4bb
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id c19233ce-eb9c-11ee-bd8a-9fce02cdf4bb;
 Tue, 26 Mar 2024 18:15:01 +0000 (UTC)
Date: Tue, 26 Mar 2024 19:15:00 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.9-rc1
Message-ID: <20240326181500.GA1501083@ravnborg.org>
References: <CAHk-=wgOw_13JuuX4khpn4K+n09cRG3EBQWufAPBWoa0GLLQ0A@mail.gmail.com>
 <20240325200315.3896021-1-geert@linux-m68k.org>
 <8d78894-dd89-9f4d-52bb-1b873c50be9c@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d78894-dd89-9f4d-52bb-1b873c50be9c@linux-m68k.org>
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

Hi all.

>   + error: arch/sparc/kernel/process_32.o: relocation truncated to fit: R_SPARC_WDISP22 against `.text':  => (.fixup+0xc), (.fixup+0x4)
>   + error: arch/sparc/kernel/signal_32.o: relocation truncated to fit: R_SPARC_WDISP22 against `.text':  => (.fixup+0x18), (.fixup+0x8), (.fixup+0x0), (.fixup+0x20), (.fixup+0x10)
>   + error: relocation truncated to fit: R_SPARC_WDISP22 against `.init.text':  => (.head.text+0x5100), (.head.text+0x5040)
>   + error: relocation truncated to fit: R_SPARC_WDISP22 against symbol `leon_smp_cpu_startup' defined in .text section in arch/sparc/kernel/trampoline_32.o:  => (.init.text+0xa4)

Looks like something is too big for the available space here.
Any hints how to dig into this would be nice.

Note: this is a sparc32 allmodconfig build

	Sam
