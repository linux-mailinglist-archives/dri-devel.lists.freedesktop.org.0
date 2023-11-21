Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1E77F2928
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 10:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA52510E254;
	Tue, 21 Nov 2023 09:45:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C255310E254
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 09:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1700559918; x=1701164718; i=spasswolf@web.de;
 bh=ckkW8kIjbtD6f1ibf/ufl8uiYZoDorVDinEq2NM2VjM=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:
 References;
 b=ZMglV6e+m5JxDH1/FPK2/0PBrvUk6FBedo7hJgP0EOUBPvceGsyEkibyq5RGe5yJ
 VPS+glPyoiF/UmqGcvObXO5ieeuhj/o6FOZ5G8VJrTTjzisPT2XGpwVIcL1wkhVNr
 xBx9N1dB+pMK3GQWG+OrKfa4FMDSYTmWW5dbVRrS5XPW+jW6JCe9Zp5DVbiLFVKs0
 DyOO0mI4P9MZisypWOd84PB8XbhNY8jyr7RSm/tbVW44tUA2QQ8uV6EjAqBsvG0h6
 DCkgOhAvVrnTJT/wUu9bU2JC2rdZDkmmK/43IFLzkWIPeQ9vrYygSEWAcxUNvVCyQ
 7gC5SPUoJgGeNheEmA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([84.119.92.193]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MxHYK-1rGPzR3bp2-00xWpF; Tue, 21
 Nov 2023 10:45:17 +0100
Message-ID: <3a0597d7ecd7778d43f3732b0adc408ca5e85e75.camel@web.de>
Subject: Re: drm scheduler redesign causes deadlocks [extended repost]
From: Bert Karwatzki <spasswolf@web.de>
To: Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org
Date: Tue, 21 Nov 2023 10:45:15 +0100
In-Reply-To: <87bkbno3z5.fsf@intel.com>
References: <36bece178ff5dc705065e53d1e5e41f6db6d87e4.camel@web.de>
 <87bkbno3z5.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.50.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zzTcODw3mGdvos95F/AGy+Bf+BiLumwUWt1qBTZf50R5e+0OxVl
 sSm9j3QTDYPoVAKfHOb2Nvg/4uATdxFzVXb/I4k44nMEiAoN/pjbMyY4gXQNtcX2+Ge3cPq
 XxHRjZN1fivuVjSyCmoyWlYn1dDR4loifbiLbz9X6+hz+9UE0Pgpl0djeRB9XRiJFiVILb9
 xAOOJj7iLKlqVW+bcnvWQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lMzt4Kh+ioI=;CHsAj4qx9IlKek6bfixrnMkvtMR
 lNxieLggJEyVjRvRA65M3L1OxagmU4xKPeNrCJK4kpwMz/6Ek17HeNKMQzcKaEDBbOEcXu1+T
 FjSgGbjHeU4uePI9FiEizM/vKK81/Ea68x1stJbhB7Ze3cg59PjLNcwkHVqD7aJq6f38ihvxh
 7qYudxITYISI/dXdxgrtDsqnWjGUet6B1na3Z79W2YjfbvnN7Hn/NC8s81+CQAQFzBYF13MTR
 4YUffE848BKcwIbeBwyVOBoM7cI6o/OIv/i7pApnbUiBmAfuaIG2aAEj3ctDHhxC4towC2jmT
 dUaSbPp1XNTuX3nTF5m6KN6+qcnPNQYgIY2eAxfOnj2wUFkV5X6hBxmxYQwFg5o4OqMIdq8v+
 LIqvvuHDXAYGXQVdI+odwCepGH5RMpr6RvTK5+kgcS/XvR44T46tlAr96Ba5rl8EyPMZvLDm9
 5TshuvRw7r0dlc0tJV9rEczDrAttqL6cdm3Gs87lC34LNddYMwVEB3IKbuLKiBBxH0IQpELNJ
 KoNRak/jwLGfAS0ILRsIXaRdK6LWuFnon1GwHGwOSXvU25wTx6mXAlAa8GszP9KnFkxVB1XxH
 H/fEQD3/QZkI26iZTF+I57BOJsUpeasWcjNNnNCWeiygj+XThg61t2Cusx/iOXHEYkSiPGWDx
 +bKIKbd1UMJixKknEQmsqSXBcUGj4RsF4TnDyulhsH1zwLQ+Y7yemZvWU4xlbN8ZuyKU/5hxP
 eNZTaMDpOsnXhEKQzfbQ4xMnK+k84B9k0kE3jdQFWJJqrze4wQboh5S8qZHYknsIdZFIpSLYi
 12IDUT/OTRgyA6BHeUFJw0s6CyGQH7Q2zmH8+NVUXkxgyhWX8t5r2atv/YGOjbBZh0n1cp0JQ
 txwtK9zyBSbkoeadpmIUNTDiOOP1Nhney2xkPMR9PTAqi+Bt1vmARaO4LBnsAyQ0RQ9vzA8sl
 yACc9w==
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
Cc: Matthew Brost <matthew.brost@intel.com>, Luben Tuikov <ltuikov89@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, dem 21.11.2023 um 11:22 +0200 schrieb Jani Nikula:
> On Tue, 21 Nov 2023, Bert Karwatzki <spasswolf@web.de> wrote:
> > As this simple patch fixes the problem
>
> Please use git send-email to send patches. Evolution botched up the
> whitespace here.
>
> BR,
> Jani.
>
>

Noted (actually not the first time evolution has done this). But I'm not
resending the patches here because they are not meant as actual fixes, the=
y only
serve to illustrate the problem, the cause of which is not known, yet.

Bert Karwatzki
