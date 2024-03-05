Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59238711CD
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 01:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A45310E046;
	Tue,  5 Mar 2024 00:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="L5LihVMM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B5D10E046
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 00:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1709599159;
 bh=O0yyXFEBHAkyNtI5CjiaTsfcPSXS8959gJlNgVluFYY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=L5LihVMMitiNLxNXu2uwdvAv5G9pLC5oUdBu+pvYJDZ313YT8SyKPN20bPRxW4GVj
 /utTJNIIqFYG2T9xXeKGzbECdqAlQXpV2INu3W3M9K2sEDjHtJCC1xTQxcw4aDTaUn
 LeLem1wU+SnumutF4cSN6xEfhO8L2iISNF0BZGTmWmYublljLePl9zrN0qM0U1nZQY
 3zjHR+/kCU+tdM61C06/119pJz9yBVmYSF9NBTYGjOuNdoKnV/LeRDgn1n1Zd5ym6S
 p4UmssY0/676QfbmJFkFp9KgmxO9w5mXW8AsUMO1oGPCthyKjrjzBikVQdMtXrFtK4
 E/5H0SV/AJJQw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TpcBt73J0z4wcv;
 Tue,  5 Mar 2024 11:39:18 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jani Nikula <jani.nikula@intel.com>, linuxppc-dev@lists.ozlabs.org
Cc: dri-devel@lists.freedesktop.org, lkft-triage@lists.linaro.org,
 linux-kernel@vger.kernel.org, Naresh
 Kamboju <naresh.kamboju@linaro.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] powerpc: include linux/backlight.h from asm/backlight.h
In-Reply-To: <87bk7u5n9h.fsf@intel.com>
References: <CA+G9fYsAk5TbqqxFC2W4oHLGA0CbTHMxbeq8QayFXTU75YiueA@mail.gmail.com>
 <20240304095512.742348-1-jani.nikula@intel.com> <87bk7u5n9h.fsf@intel.com>
Date: Tue, 05 Mar 2024 11:39:18 +1100
Message-ID: <87cys9pl55.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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

Jani Nikula <jani.nikula@intel.com> writes:
> On Mon, 04 Mar 2024, Jani Nikula <jani.nikula@intel.com> wrote:
>> Removal of the backlight include from fb.h uncovered an implicit
>> dependency in powerpc asm/backlight.h. Add the explicit include.
>>
>> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>> Closes: https://lore.kernel.org/r/CA+G9fYsAk5TbqqxFC2W4oHLGA0CbTHMxbeq8QayFXTU75YiueA@mail.gmail.com
>> Fixes: 11b4eedfc87d ("fbdev: Do not include <linux/backlight.h> in header")
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Helge Deller <deller@gmx.de>
>> Cc: linux-fbdev@vger.kernel.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>
>> ---
>>
>> Not even compile tested!
>
> Naresh, please try this patch!
>
> Michael, if this is fine by you, ack to merge via the drm subsystem
> along with the regressing commit?

I prefer Thomas' patch, but I'm fine with either to go in via drm.

cheers
