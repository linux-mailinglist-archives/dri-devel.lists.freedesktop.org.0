Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B9835ABB3
	for <lists+dri-devel@lfdr.de>; Sat, 10 Apr 2021 09:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA236E122;
	Sat, 10 Apr 2021 07:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251EB6E4C4
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 16:59:20 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id t140so4355759pgb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 09:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+9xha/pXNeFBGiuagKWknyCqPbUKuPA8GXpvrC9Jx0I=;
 b=FOj3t1wF4kryEG/pn+BJQO+EcZk0rPv5JyC0+HzlgYnApBMm4JaNpW6v4GYVS8QdRq
 Z3T41JZn1vzYjigGtNW5Wt0XhJ95zoBoqnX+IsIq+einaugp0oDelp7Tpwnl78Awpk/x
 1IP9Ornp9wd0IyRGNdih6GLFUu/WGMejHjUV1eYMYjsH0gmTRoDdjAp2N9ELrfADioLN
 o5wz+PRYkl9nn7gcyURu/EN2g9IsfPT42tyrmpbmg4ao7eYp46bzNQ8UzpwNt87FEW9G
 L6OZOR9WvLVK4JE8Ua/S1J1NcdwObgnxIm0toVXC4HLIDMKxdh2asO2ydVW79C/Yg6Bm
 QsMg==
X-Gm-Message-State: AOAM532hVJegPA+DdtRbkN8UBDe815107FeE9/AbxE7kcdYnmom9yRa0
 bwdlD5REVP9KJWh8R8oVnXg=
X-Google-Smtp-Source: ABdhPJw6kXgrPuw8A7YDvuzOsmJlxLxKBkWC3Ar3os6uxRVSPlCkaHeQd8atCkDOR792q4QQZ8VNRA==
X-Received: by 2002:a65:40c7:: with SMTP id u7mr14223236pgp.29.1617987559416; 
 Fri, 09 Apr 2021 09:59:19 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id i22sm73788pfq.170.2021.04.09.09.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 09:59:18 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 6D85340256; Fri,  9 Apr 2021 16:59:17 +0000 (UTC)
Date: Fri, 9 Apr 2021 16:59:17 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] kernel.h: Split out panic and oops helpers
Message-ID: <20210409165917.GH4332@42.do-not-panic.com>
References: <20210409100250.25922-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210409100250.25922-1-andriy.shevchenko@linux.intel.com>
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
 Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
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
 Hongbo Yao <yaohongbo@huawei.com>, Sebastian Reichel <sre@kernel.org>,
 linux-alpha@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Mike Rapoport <rppt@kernel.org>, Alexander Lobakin <alobakin@pm.me>,
 linux-remoteproc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-leds@vger.kernel.org, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 09, 2021 at 01:02:50PM +0300, Andy Shevchenko wrote:
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

Acked-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
