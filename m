Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D4A9E81CB
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 20:19:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7835D10E090;
	Sat,  7 Dec 2024 19:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gwdg.de header.i=@gwdg.de header.b="Q9ysbR4g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx-2023-1.gwdg.de (mx-2023-1.gwdg.de [134.76.10.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8819610E090;
 Sat,  7 Dec 2024 19:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gwdg.de;
 s=2023-rsa; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VLI5o7E+8tShU1ACGPkmXzIpglBiWJLz22UUIAyJ6QA=; b=Q9ysbR4gICj/btwoBP2fH+9/Cd
 gmWGKtblikgC46fJ9BqDsZpBMPUpBm3WcTgySgJ5/oXtkXw+kdmDi9yj9dIgaDymLeegTONA1SSFV
 /O0aZSvLpHhXzKtGlgVeuIHNMvtJHQ1maoNQEvSg0aDGg3zzNq8vmDDAl7toC6KZgdEtbyJt0mPAr
 mtbEoNf30WRN4j1CYvI5WO7oALtWMtB8EoC0zQxX4NKJqDL9vzG3+n2SZyH/R4W0FZXFtwKZsbMOI
 ZrKSUe92mKsIU3IHx4iO29B0m4SR+W+bmuIUTjouN+ZhAHKEbWSGG58syyH6VDD0B5GrnN1CSS+FF
 ueiRNJDw==;
Received: from xmailer.gwdg.de ([134.76.10.29]:41724)
 by mailer.gwdg.de with esmtp (GWDG Mailer)
 (envelope-from <muecker@gwdg.de>) id 1tK0L5-004PI2-2n;
 Sat, 07 Dec 2024 20:19:39 +0100
Received: from mbx19-fmz-06.um.gwdg.de ([10.108.142.65] helo=email.gwdg.de)
 by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (GWDG Mailer) (envelope-from <muecker@gwdg.de>) id 1tK0L5-0002tl-2T;
 Sat, 07 Dec 2024 20:19:39 +0100
Received: from [192.168.0.221] (10.250.9.200) by MBX19-FMZ-06.um.gwdg.de
 (10.108.142.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.14; Sat, 7 Dec
 2024 20:19:38 +0100
Message-ID: <0a2996a7c63930b9d9a8d3792358dd9e494e27c1.camel@gwdg.de>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
From: Martin Uecker <muecker@gwdg.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: David Laight <David.Laight@aculab.com>, Vincent Mailhol
 <mailhol.vincent@wanadoo.fr>, Luc Van Oostenryck
 <luc.vanoostenryck@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, Rikard Falkeborn
 <rikard.falkeborn@gmail.com>, "linux-sparse@vger.kernel.org"
 <linux-sparse@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "llvm@lists.linux.dev"
 <llvm@lists.linux.dev>, "linux-hardening@vger.kernel.org"
 <linux-hardening@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "coresight@lists.linaro.org"
 <coresight@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Date: Sat, 7 Dec 2024 20:19:37 +0100
In-Reply-To: <CAHk-=wjpVXEjX16PP=-hi4CgLqEGJ_U-WvKWq+J3C+FW-hSSfg@mail.gmail.com>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
 <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
 <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de>
 <344b4cf41a474377b3d2cbf6302de703@AcuMS.aculab.com>
 <9a0c041b6143ba07c2b3e524572fccd841f5374b.camel@gwdg.de>
 <CAHk-=wjpVXEjX16PP=-hi4CgLqEGJ_U-WvKWq+J3C+FW-hSSfg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: MBX19-FMZ-05.um.gwdg.de (10.108.142.64) To
 MBX19-FMZ-06.um.gwdg.de (10.108.142.65)
X-EndpointSecurity-0xde81-EV: v:7.9.17.458, d:out, a:y, w:t, t:9, sv:1733572982,
 ts:1733599179
X-Virus-Scanned: (clean) by clamav
X-Spam-Level: -
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

Am Samstag, dem 07.12.2024 um 10:26 -0800 schrieb Linus Torvalds:
> On Sat, 7 Dec 2024 at 05:07, Martin Uecker <muecker@gwdg.de> wrote:
> >=20
> > VLA use *less* stack than a fixed size arrays with fixed bound.
>=20
> Not really. You end up with tons of problems, not the least of which
> is how to actually analyze the stack size. It also gets *very* nasty
> to have code that declares the VLA size using an argument that is then
> checked afterwards - and if you have a strong preference for
> "declarations before code", you end up with *horrific* issues.
>=20
> And even if you are super-careful, and you solved the analysis
> problem, in practice VLAs will cause huge stack issues simply due to
> code generation issues.  The compiler will end up doing extra
> alignment and extra frame handling and saving, to the point where any
> advantages the VLA would bring is completely dwarfed by all the
> disadvantages.

But that all seem solvable issues on the compiler side.  If you=C2=A0
said the maximum stack size for arrays we tolerate is X,
then a compiler could=C2=A0tell you if=C2=A0

a) this is not guaranteed in a specific situation (-Wvla-larher-than)
and=C2=A0
b) transform the array automatically to fixed size array
of size X *or* something smaller when it can show this.

Because now you do the exact same thing manually while losing
precise bounds checking.

Martin

>=20
> We went through this. We are so *much* better off without VLAs that
> it's not even funny.
>=20
> Now when the compiler says "your stack size is big", you just look
> "Oh, that struct should be allocated with kmalloc, not on the stack".
> Boom. Done.
>=20
>             Linus

