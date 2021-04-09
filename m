Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 082BE35ABB4
	for <lists+dri-devel@lfdr.de>; Sat, 10 Apr 2021 09:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724096E12A;
	Sat, 10 Apr 2021 07:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B2A6E4C4
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 16:54:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61F31610C7;
 Fri,  9 Apr 2021 16:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617987256;
 bh=6BYqCREsMTupMhpQBxMglMi1SSUzmui8owN4hO2d6qQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ImcCiNXIad0jJkWNwrcKmGLeU6qiMldElVeD59ysCeBvEqoyI5hehOIrI3rWIHlft
 cDqnlvcpFEkhKWi++6IMBtV5qLt87546HVteu5Zu6eNBrs4AT3LtR7iPhCcG6RsGQb
 qUDXIDrIpdb9PSdd/k7E7Z9eh7nR6D2hGyn4ZSxjp+5igu0Kmrpvr4wH+YbV/Un2dr
 ZHqAC8yRHQj8beubuUt83Qi/IKMYXnEx92gXWQVAg16tHnu7C80lYCKEIWMIbDj4Uq
 R0x394o/Cvdf+b4qDJ3rffi+spWoRNcln6puhxuHvFpWqRBplbPavSU5wtvy84X2y7
 gJd8v1VQnkSPw==
MIME-Version: 1.0
In-Reply-To: <20210409100250.25922-1-andriy.shevchenko@linux.intel.com>
References: <20210409100250.25922-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] kernel.h: Split out panic and oops helpers
From: Stephen Boyd <sboyd@kernel.org>
To: Alexander Egorenkov <egorenar@linux.ibm.com>,
	Alexander Lobakin <alobakin@pm.me>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Christian Brauner <christian.brauner@ubuntu.com>,
	Corey Minyard <cminyard@mvista.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Hongbo Yao <yaohongbo@huawei.com>,
	Jason J.Herne <jjherne@linux.ibm.com>, Joe Perches <joe@perches.com>,
	Joerg Roedel <jroedel@suse.de>, Kees Cook <keescook@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Marek Czerski <ma.czerski@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michael Kelley <mikelley@microsoft.com>,
	Mihai Carabas <mihai.carabas@oracle.com>,
	Mike Rapoport <rppt@kernel.org>, Olof Johansson <olof@lixom.net>,
	Paul E.McKenney <paulmck@kernel.org>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Scott Branden <scott.branden@broadcom.com>,
	Steven Rostedt (VMware) <rostedt@goodmis.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	Vlastimil Babka <vbabka@suse.cz>, Wang Wenhu <wenhu.wang@vivo.com>,
	Wei Liu <wei.liu@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
	coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
	kexec@lists.infradead.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-edac@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-remoteproc@v, ger.kernel.org@freedesktop.org,
	linux-s390@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org,
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
Date: Fri, 09 Apr 2021 09:54:15 -0700
Message-ID: <161798725520.3790633.11854722005020364662@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Sat, 10 Apr 2021 07:40:18 +0000
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
Cc: , Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
	Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
	Joel Fernandes <joel@joelfernandes.org>, et@freedesktop.org,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Will Deacon <will@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Daniel Drake <dsd@laptop.org>, Jens Frederich <jfrederich@gmail.com>,
	Chris Zankel <chris@zankel.n>, Richard Weinberger <richard@nod.at>,
	Helge Deller <deller@gmx.de>, x86@kernel.org,
	Mike Rapoport <rppt@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jakub Kicinski <kuba@kernel.org>, Matt Turner <mattst88@gmail.com>,
	Iurii Zaikin <yzaikin@google.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Mike Leach <mike.leach@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>,
	Robert Richter <rric@kernel.org>, Corey Minyard <minyard@acm.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Jeff Dike <jdike@addtoit.com>, Josh Triplett <josh@joshtriplett.org>,
	Alex Elder <elder@kernel.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Richard Henderson <rth@twiddle.net>, Juergen Gross <jgross@suse.com>,
	Tony Luck <tony.luck@intel.com>,
	Jon Nettleton <jon.nettleton@gmail.com>,
	Sebastian Reichel <sre@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Lui s Chamberlain <mcgrof@kernel.org>,
	James Morse <james.morse@arm.com>,
	Eric Biederman <ebiederm@xmission.com>, Leo Yan <leo.yan@linaro.org>,
	Borislav Petkov <bp@alien8.de>,
	"David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Andy Shevchenko (2021-04-09 03:02:50)
> kernel.h is being used as a dump for all kinds of stuff for a long time.
> Here is the attempt to start cleaning it up by splitting out panic and
> oops helpers.
> 
> There are several purposes of doing this:
> - dropping dependency in bug.h
> - dropping a loop by moving out panic_notifier.h
> - unload kernel.h from something which has its own domain
> 
> At the same time convert users tree-wide to use new headers, although
> for the time being include new header back to kernel.h to avoid twisted
> indirected includes for existing users.
> 
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

>  drivers/clk/analogbits/wrpll-cln28hpc.c       |  4 +

Acked-by: Stephen Boyd <sboyd@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
