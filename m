Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B74535ABB9
	for <lists+dri-devel@lfdr.de>; Sat, 10 Apr 2021 09:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4976E138;
	Sat, 10 Apr 2021 07:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 478 seconds by postgrey-1.36 at gabe;
 Fri, 09 Apr 2021 19:54:07 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1196EC4D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 19:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1617998042;
 bh=iNspAAUXd0TGc9idWuqJezj9FgSbVIrdnHkC34OI6ys=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=lSetH1gwqmCg68v7iB/efLBWbjH1kls/HStv218Q+fy7+fPmvFGEC00cT1soOpgPr
 Ar0ZQ7eWsrLEKTwjQeQlAjrDnjLIHResI9TKvQtfb5MJWXaU2z4sHRMdP2ciqQO7RC
 nxP6PvWEgEML0HkY0WcVCkOIOYILZleqOn8dfYsU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.181.63]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1My36N-1lmD5l41nT-00zVNp; Fri, 09
 Apr 2021 21:42:47 +0200
Subject: Re: [PATCH v2 1/1] kernel.h: Split out panic and oops helpers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Alexander Lobakin <alobakin@pm.me>, Wei Liu <wei.liu@kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Andrew Morton <akpm@linux-foundation.org>, Kees Cook
 <keescook@chromium.org>, Mike Rapoport <rppt@kernel.org>,
 Corey Minyard <cminyard@mvista.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Vasily Gorbik <gor@linux.ibm.com>, "Jason J. Herne" <jjherne@linux.ibm.com>,
 Joerg Roedel <jroedel@suse.de>, Michael Kelley <mikelley@microsoft.com>,
 Joe Perches <joe@perches.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Scott Branden <scott.branden@broadcom.com>, Olof Johansson <olof@lixom.net>,
 Mihai Carabas <mihai.carabas@oracle.com>, Wang Wenhu <wenhu.wang@vivo.com>,
 Marek Czerski <ma.czerski@gmail.com>, Hongbo Yao <yaohongbo@huawei.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Alexander Egorenkov <egorenar@linux.ibm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Vlastimil Babka <vbabka@suse.cz>, "Paul E. McKenney" <paulmck@kernel.org>,
 "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-hyperv@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-xtensa@linux-xtensa.org,
 openipmi-developer@lists.sourceforge.net, linux-clk@vger.kernel.org,
 linux-edac@vger.kernel.org, coresight@lists.linaro.org,
 linux-leds@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-arch@vger.kernel.org, kexec@lists.infradead.org, rcu@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <20210409100250.25922-1-andriy.shevchenko@linux.intel.com>
From: Helge Deller <deller@gmx.de>
Message-ID: <cef5d4ba-9d91-7249-3ba4-c7f1c89ab119@gmx.de>
Date: Fri, 9 Apr 2021 21:41:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210409100250.25922-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
X-Provags-ID: V03:K1:A9ZHNG4WxpUBFm/OLrSjy4wmvepyAKfJ/9J0GMwZPVvou+WL0jt
 juhLu46u1kS+URbP+8+Pw+p7oQ3JpIMBAMo3AEr85dJ6auKoY3YWnT5NDC8TMlGFgRljwyK
 +Z8x/lMp3a1Sj6G+ejcETzf/1wuAwQ3HVr+B/sOgfO9g9aKIA+KstHHg98r0RbXaN5gO1f1
 c2FCqtclGkoW83386bLAQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dQOnqeDxeEs=:L94yAUApPs7RyxJRmEeuZU
 42WEICImL4iuCR1/vD/3kgQ+UY9v+L5+pZA13h9cKBopFPKzIZg1n74SrkuRiGtR1pjaYEgVP
 gwN72yVhWhhLIf0tRtMFBIFXpJX+W9ecb5ErdwyscARQfVh3mncw/ioLeuTAD0PtsiFbJY5Go
 60YRmCLNAGRe8F4ZolS0Fd8k2Cwy37/w5HnZ0vgg+8nWgOJz+fDmCT8ZuBghgpBWN6Z//A6fr
 HxfGAHzoSi2g3jW68UOlaxpRTUi6U1HFWBxBHzj4nMN0645Cal5kSNBZaN0I6KxwGiFl3H5If
 +6mwGE6EzZ1OkkjzkEiCSbPR+N0JDjUkVITcCpjyLjzHAPAJPXIxv1dDn2FC+4XG7Epchns1F
 yrydNjgRPoF6uSbrwYjWXXv/ILH938FEJ48zhAP51y77u8d7CgPhYfGgJ2C4V1E/k4I7Ln8fY
 Ock0shNWPndD8rCOT+W6CUVXWkJdsttX4Y+d9xs/b7gH7PttXlnt0moNZB194zZWVqJSONuv+
 s21lF8mdoZCceDCRCe5eng+JOtkOGt1+n9M9QZhOozhhN0hAv3C4gFq6r06qZ1OFmuILB4g99
 ImVf8EtkPwJAQ7KfkduvhiOuSbd1Q1zZTW7rpwqvhluBQStFRkF9ag3vqIWLBsxuz9DkV55AW
 ZmRUUvnvb0kbPACsKzcIAYR0BQg8JluK2w5MFqO6iHfWXK+1cXyB5vUKIJO7iwVSp3Gd+lfwK
 2T94h0cQnWzbCgHw1VkLW+5aRk58tkqZn+JnkER8+0OzP25HZKdHmkpQPtPI+WkdSndnfZ4wB
 Ma2J1wfKEvgDt5t4teRaVvDEX3WxKmMrh9/4Azs4SO+IVzHs1IHGxvDvRKJTrahuC9Zw/JQ6w
 iSGbS46oZVTBt0k2oi2hyoNzaIr79I0fwVRxix7CGoGqWhEos6VnR1EKPjgi0KMUKHd72t5vZ
 aiZuyKJqQkDiDjGvd47FJ3RogwPTjnQFLAqzRovimSC4DQe4BsYeE++gdKqd3NsDc2MP1H13I
 3BKc2eb0qDBY8Fra+mPkUnkoH7dyyOXaGDF422RDqQoo9zxUtMfvHV/0gWSdjtWqaomm4MV9x
 HNsgdbm66djxvYa6YxJgXo/fMzAGAi2DMg3GWET55O4IPCKd3nVdXMFap4xUwmdLO5WeiSqtj
 Q20XVjcowscAd34tNcEYB9h+HjeLjVe+cALbys+IR/EQfxnFf7SUr9lQg+irWnTRwFIHY=
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
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Will Deacon <will@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Daniel Drake <dsd@laptop.org>,
 Jens Frederich <jfrederich@gmail.com>, Richard Weinberger <richard@nod.at>,
 x86@kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Jakub Kicinski <kuba@kernel.org>, Matt Turner <mattst88@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Mike Leach <mike.leach@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>,
 Robert Richter <rric@kernel.org>, Corey Minyard <minyard@acm.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Jeff Dike <jdike@addtoit.com>,
 Josh Triplett <josh@joshtriplett.org>, Alex Elder <elder@kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Richard Henderson <rth@twiddle.net>, Juergen Gross <jgross@suse.com>,
 Chris Zankel <chris@zankel.net>, Tony Luck <tony.luck@intel.com>,
 Jon Nettleton <jon.nettleton@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, James Morse <james.morse@arm.com>,
 Eric Biederman <ebiederm@xmission.com>, Leo Yan <leo.yan@linaro.org>,
 Borislav Petkov <bp@alien8.de>, "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/9/21 12:02 PM, Andy Shevchenko wrote:
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

Acked-by: Helge Deller <deller@gmx.de> # parisc

Helge
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
