Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E56359F97
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 15:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E1D6EC1D;
	Fri,  9 Apr 2021 13:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BF66E49A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 11:49:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8AF2561005;
 Fri,  9 Apr 2021 11:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617968966;
 bh=wSgw8vqxkTcKSyPgvD8ke8joz3MElmiOLTRjt10EyxQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r257Sg1OggCxGJg5bCTag7NFuCUtM6bBbQPGssOeudpQTueqANF9k8caCST6j+GGs
 mhq+777ZkQwKVhOaru41hweVqSWj04b/XsU8h7+ydnyEF2kONVWjrmWmJI81FX2inh
 1I5q5flBzM6rB5dvZupRSAfvTfk2iRV4KJ8C1mZTY2vPCzbW73c/T7i/07hy3SI8DF
 8mRhhs2yT0V+iCISJxvGjQqPD7ppY2j6k1JTxquPWqltBrBwD9Eqf+usc+F86rClEv
 1sWx6Xv2N6pfdBPoJd3B8urT8gi+vY7QJWCh4h6thPfMXLecWCPm/VUEaLlVYX5ru+
 /QWkr+ISokV9Q==
Received: by earth.universe (Postfix, from userid 1000)
 id 877D23C0C96; Fri,  9 Apr 2021 13:49:24 +0200 (CEST)
Date: Fri, 9 Apr 2021 13:49:24 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] kernel.h: Split out panic and oops helpers
Message-ID: <20210409114924.6dpefx26px7aeuaj@earth.universe>
References: <20210409100250.25922-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20210409100250.25922-1-andriy.shevchenko@linux.intel.com>
X-Mailman-Approved-At: Fri, 09 Apr 2021 13:12:15 +0000
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
Cc: Corey Minyard <cminyard@mvista.com>, dri-devel@lists.freedesktop.org,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-clk@vger.kernel.org,
 linux-arch@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jens Frederich <jfrederich@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Catalin Marinas <catalin.marinas@arm.com>, xen-devel@lists.xenproject.org,
 Matt Turner <mattst88@gmail.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 linux-pm@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
 linux-um@lists.infradead.org, Daniel Drake <dsd@laptop.org>,
 Mihai Carabas <mihai.carabas@oracle.com>, Thomas Gleixner <tglx@linutronix.de>,
 Richard Henderson <rth@twiddle.net>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, Joe Perches <joe@perches.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Czerski <ma.czerski@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Jon Nettleton <jon.nettleton@gmail.com>,
 Alexander Egorenkov <egorenar@linux.ibm.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Christian Brauner <christian.brauner@ubuntu.com>, linux-s390@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Corey Minyard <minyard@acm.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Iurii Zaikin <yzaikin@google.com>, linux-xtensa@linux-xtensa.org,
 Joerg Roedel <jroedel@suse.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Scott Branden <scott.branden@broadcom.com>, coresight@lists.linaro.org,
 linux-fsdevel@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Tony Luck <tony.luck@intel.com>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Dinh Nguyen <dinguyen@kernel.org>, James Morse <james.morse@arm.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-hyperv@vger.kernel.org,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Joel Fernandes <joel@joelfernandes.org>, Will Deacon <will@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-staging@lists.linux.dev,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 bcm-kernel-feedback-list@broadcom.com, Juergen Gross <jgross@suse.com>,
 Robert Richter <rric@kernel.org>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Haiyang Zhang <haiyangz@microsoft.com>,
 Josh Triplett <josh@joshtriplett.org>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>, rcu@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, linux-fbdev@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 Michael Kelley <mikelley@microsoft.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Hongbo Yao <yaohongbo@huawei.com>, linux-alpha@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>,
 Alexander Lobakin <alobakin@pm.me>, linux-remoteproc@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-leds@vger.kernel.org,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Wang Wenhu <wenhu.wang@vivo.com>,
 Jeff Dike <jdike@addtoit.com>, Mike Leach <mike.leach@linaro.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-edac@vger.kernel.org, "Jason J. Herne" <jjherne@linux.ibm.com>,
 netdev@vger.kernel.org, kexec@lists.infradead.org, linux-mips@vger.kernel.org,
 Leo Yan <leo.yan@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: multipart/mixed; boundary="===============1065772213=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1065772213==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c2qg5eip4k7clkwy"
Content-Disposition: inline


--c2qg5eip4k7clkwy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 09, 2021 at 01:02:50PM +0300, Andy Shevchenko wrote:
> kernel.h is being used as a dump for all kinds of stuff for a long time.
> Here is the attempt to start cleaning it up by splitting out panic and
> oops helpers.
>=20
> There are several purposes of doing this:
> - dropping dependency in bug.h
> - dropping a loop by moving out panic_notifier.h
> - unload kernel.h from something which has its own domain
>=20
> At the same time convert users tree-wide to use new headers, although
> for the time being include new header back to kernel.h to avoid twisted
> indirected includes for existing users.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> Acked-by: Corey Minyard <cminyard@mvista.com>
> Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Kees Cook <keescook@chromium.org>
> Acked-by: Wei Liu <wei.liu@kernel.org>
> Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
> v2:
>  - fixed all errors with allmodconfig on x86_64 (Andrew)
>  - checked with allyesconfig on x86_64
>  - additionally grepped source code for panic notifier list usage
>    and converted all users
>  - elaborated commit message (Luis)
>  - collected given tags (incl. Andrew's SoB, see below)
>=20
> I added Andrew's SoB since part of the fixes I took from him. Andrew,
> feel free to amend or tell me how you want me to do.
>=20
> [...]
>  drivers/power/reset/ltc2952-poweroff.c        |  1 +
> [...]

Acked-by: Sebastian Reichel <sre@kernel.org>

-- Sebastian

--c2qg5eip4k7clkwy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmBwPzkACgkQ2O7X88g7
+poVqw//cO5+glgFxA2CU4t3EHFTzSR2pExNCOensIzn/2YcvKlq6RBiaVlO87al
zfq//z42WEWWRFkl4NeyjJx6ueQGo5Hk7qQiPRQhgt55UiQsizdAFXK4u97lVQ68
7V2xDT3MlQ/vc+LG3vZBcSGMIoupHDqbYU2kF8xlBhdwuF1lr44NDxRTRsVErgor
hlvEGYmwSTIg8aEkLt6Da/elDscG08MDU+vv6KLaSiruCN+RtgZGin9gv3Xu+KUi
PhPU9ZOAfi6duIQdKmdXiAZ8Vlp/43yzeo80t/XUyiEy7Yq+qtsP6YXHlSWlPJnV
Zz3ifkmNn7YFWd+iOeTe3oTfVIAtg4w/uX184urC+t242MBSeqEkHt7/1TJR2UAx
8s9NtSaCLUPuFLPO9s8t6nP4kQ4HN3BoxMvgessqguLZtSg3n1Z4+ZE8veoYHQD3
Vwz58nFLYkMxRB/pFq6dkXv6uPXTbreYkWuUFsDIao2+FVDkMp81DqE86K2li2d6
/B6jSmObDmG/aryJn+hoHhCEJSfLnaszENAc0toFvCGYU9D5Com1A74gdztMgOvf
CB4G04azFTgeTjX5JB6r7KXrcZ08bzspk/lo5H9fx+SLki6gFb88zNqBOLcnMM0d
FZFNMmZ543wUtAsJSxqObtKeAcjitPcaURrh6sWiRuJkndGtmNY=
=QA06
-----END PGP SIGNATURE-----

--c2qg5eip4k7clkwy--

--===============1065772213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1065772213==--
