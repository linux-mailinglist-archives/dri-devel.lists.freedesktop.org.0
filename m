Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8848711C3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 01:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49353112788;
	Tue,  5 Mar 2024 00:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="iJv1f3GZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B66D112788
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 00:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1709598961;
 bh=UwML5y2vhoh9QVMv6PqKer0cXI4igOD78GFrAVLk9MQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=iJv1f3GZr/p7GDoeFB+pZsZ364q4CQlAYiYSxfEmvNfLB4Gw87GIqIHKh1R2F30M4
 sqrsDwyT4MupBNrTX8NAR3sFWHtL5Epk3gpkrUCFmPyzkYJA9CmJTksaa6beXbKS3z
 Fl+DMzFLxQvFY2e4YJiMAhvd+ktC1IRpxKDv7kEz8tGIEwnKgLAAQHe3p7I0EhVFJZ
 oArdiEhn/cJgn1NJA80cXbRqq45qv46aRzQXIQnig00yVq0uN25Mi/tRTdRAQCu59f
 KzabnInMntq+4BH18bdbKU2zMH2CdW9MFl+FZgYR5PKhEcqZ4eDGbpzjoxi22F/urg
 YvK4SFNifvE2g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tpc743tdBz4wc7;
 Tue,  5 Mar 2024 11:36:00 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jani Nikula <jani.nikula@intel.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, Helge
 Deller <deller@gmx.de>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "lkft-triage@lists.linaro.org"
 <lkft-triage@lists.linaro.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Naresh Kamboju
 <naresh.kamboju@linaro.org>
Subject: Re: [PATCH] powerpc: include linux/backlight.h from asm/backlight.h
In-Reply-To: <e5a0e44d-d2b9-49f0-9a08-fb7d9254266c@csgroup.eu>
References: <CA+G9fYsAk5TbqqxFC2W4oHLGA0CbTHMxbeq8QayFXTU75YiueA@mail.gmail.com>
 <20240304095512.742348-1-jani.nikula@intel.com>
 <eed9bb0f-486f-47f3-b4b5-c07adda4a1c7@suse.de>
 <e5a0e44d-d2b9-49f0-9a08-fb7d9254266c@csgroup.eu>
Date: Tue, 05 Mar 2024 11:36:00 +1100
Message-ID: <87frx5plan.fsf@mail.lhotse>
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

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 04/03/2024 =C3=A0 11:32, Thomas Zimmermann a =C3=A9crit=C2=A0:
>> Hi
>>=20
>> Am 04.03.24 um 10:55 schrieb Jani Nikula:
>>> Removal of the backlight include from fb.h uncovered an implicit
>>> dependency in powerpc asm/backlight.h. Add the explicit include.
>>>
>>> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>>> Closes:=20
>>> https://lore.kernel.org/r/CA+G9fYsAk5TbqqxFC2W4oHLGA0CbTHMxbeq8QayFXTU7=
5YiueA@mail.gmail.com
>>> Fixes: 11b4eedfc87d ("fbdev: Do not include <linux/backlight.h> in=20
>>> header")
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Helge Deller <deller@gmx.de>
>>> Cc: linux-fbdev@vger.kernel.org
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>>
>>> ---
>>>
>>> Not even compile tested!
>>=20
>> That's one of the cases that's hard to catch unless you get the config=20
>> right.
>>=20
>>> ---
>>> =C2=A0 arch/powerpc/include/asm/backlight.h | 1 +
>>> =C2=A0 1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/powerpc/include/asm/backlight.h=20
>>> b/arch/powerpc/include/asm/backlight.h
>>> index 1b5eab62ed04..275d5bb9aa04 100644
>>> --- a/arch/powerpc/include/asm/backlight.h
>>> +++ b/arch/powerpc/include/asm/backlight.h
>>> @@ -10,6 +10,7 @@
>>> =C2=A0 #define __ASM_POWERPC_BACKLIGHT_H
>>> =C2=A0 #ifdef __KERNEL__
>>> +#include <linux/backlight.h>
>>=20
>> Thanks, but I think this should go directly into chipsfb.c. I would have=
=20
>> provided a patch already, if our mail server didn't have issues this=20
>> morning. Let me try again.
>
> asm/backlight.h needs it for struct backlight_device
>
> At least if you don't want to include linux/backlight.h in=20
> asm/backlight.h, then you need a forward declaration of struct=20
> backlight_device;

It's preferable for asm headers not to include linux headers (to avoid
loops), so a forward declaration would be better IMHO.

cheers
