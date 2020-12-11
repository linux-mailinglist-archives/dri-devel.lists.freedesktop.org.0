Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1927C2D7DC2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 19:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7A86E423;
	Fri, 11 Dec 2020 18:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7796E423;
 Fri, 11 Dec 2020 18:12:24 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id c12so7462067pfo.10;
 Fri, 11 Dec 2020 10:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q/1zdMH3DpxGtZ8QgtITmolgonObU/7AjOPUuWKrWNo=;
 b=Pm8buLXst2LcV9x4pk4vIxyybuwSbvL97o6tQP/6i0ZC0zOJ6xhhPvOmmJHnVFkhgw
 sQfgcxJImHA+DnVZbZxb64zhatDbthp68cZ4iRaEqM/K8XSe9UZnfE94uYtkDbOOpabu
 L1rj/JPmJET4DAk/lcrawpEkrx9i3ul2i6qGlaQuFoK2UkPf+SMWdOeOPPS8QAdKSG2Q
 g24KIZVw1nm3kfJCayecl50J7bltlRshvQcWiGMUSmazoa8KfAW/iwqyejRvRxGzsh3A
 q/OBzRHzggVvK36H+lQNs9ICk+Z16dfzwLBUVGvlOwEUqmBMnCQtHV8wDQuwIxn+Jo8v
 0Yfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q/1zdMH3DpxGtZ8QgtITmolgonObU/7AjOPUuWKrWNo=;
 b=QunE3bD9NAcWsWXHmdDgkaczIo1HAEwO3DKSRpwq50Dz22w0zyzvRT+5oWJFLGDvD/
 3gYluqKMIOXwZWge8kMllBzbMa5EHfPJilFZcQURIYz7mCZ1KntLObu1ghncElLt7xg9
 C1FSoddi6WV1bcYF90/wbQU9U4+V0GTkx9GQtb372s0eheDh7PElxa/R8P+UtvGAzNZo
 yDaZLAgtkk9YpTBeU3IDJOgQxWkWvttmL7HXv9Mc46gjJsiFthKwT/GRUn90cUVzlTvN
 89XIlIZSKZrir1vJxtuEgx16FJgFByy7w2DFONVLvzIjskf2jpkO1AN1uZx4MMSnJ/Lr
 Z2UQ==
X-Gm-Message-State: AOAM5323rbtw0cRyveGTodJK3polgF+718Z+T/vsJcAJLFTVwUxwAnvY
 AR9K00eXhCFFyoIj9iPORFn8kdHSw3LztQkum0w=
X-Google-Smtp-Source: ABdhPJzPNFm8swDHOmLl35eT5h+YQB676NTtT2BWFgfALxfYZ8r2UnWa+iJwNQSLiKZOMQcPIak2nNSo7eC4Ue1vtXA=
X-Received: by 2002:a63:4002:: with SMTP id n2mr13054398pga.4.1607710343875;
 Fri, 11 Dec 2020 10:12:23 -0800 (PST)
MIME-Version: 1.0
References: <20201210192536.118432146@linutronix.de>
 <20201210194044.157283633@linutronix.de>
In-Reply-To: <20201210194044.157283633@linutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 11 Dec 2020 20:12:07 +0200
Message-ID: <CAHp75Veo9aQLCp9ZuCcoexPLHM=R_PEu6uhP_P2bSpsVzyUaNQ@mail.gmail.com>
Subject: Re: [patch 16/30] mfd: ab8500-debugfs: Remove the racy fiddling with
 irq_desc
To: Thomas Gleixner <tglx@linutronix.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 netdev <netdev@vger.kernel.org>, afzal mohammed <afzal.mohd.ma@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-s390@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, xen-devel@lists.xenproject.org,
 Leon Romanovsky <leon@kernel.org>,
 "open list:HFI1 DRIVER" <linux-rdma@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 linux-pci <linux-pci@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Wambui Karuga <wambui.karugax@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Juergen Gross <jgross@suse.com>, Will Deacon <will@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lee Jones <lee.jones@linaro.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Airlie <airlied@linux.ie>,
 linux-parisc@vger.kernel.org,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, LKML <linux-kernel@vger.kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, Saeed Mahameed <saeedm@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 10, 2020 at 9:57 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> First of all drivers have absolutely no business to dig into the internals
> of an irq descriptor. That's core code and subject to change. All of this
> information is readily available to /proc/interrupts in a safe and race
> free way.
>
> Remove the inspection code which is a blatant violation of subsystem
> boundaries and racy against concurrent modifications of the interrupt
> descriptor.
>
> Print the irq line instead so the information can be looked up in a sane
> way in /proc/interrupts.

...

> -               seq_printf(s, "%3i:  %6i %4i",
> +               seq_printf(s, "%3i:  %6i %4i %4i\n",

Seems different specifiers, I think the intention was something like
               seq_printf(s, "%3i:  %4i %6i %4i\n",

>                            line,
> +                          line + irq_first,
>                            num_interrupts[line],
>                            num_wake_interrupts[line]);


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
