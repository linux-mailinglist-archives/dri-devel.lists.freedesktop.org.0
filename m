Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C062D9411
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:18:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADFA6E087;
	Mon, 14 Dec 2020 08:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165F56ECDB;
 Fri, 11 Dec 2020 22:07:25 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607724443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uE5KR5qlfz+ztx9s8pbRCB1Be+kxvrwztlDzBEoJCeU=;
 b=upIVkJhj5g1RmAalIreFExmj0QWc7xxC7dfgYyTKQ7/s1CPaLrvswCn2cis9a5ELIHv+rz
 IPyhjuoIqfAMI+60hoe1U1U27IhweRJLvNYpN7cTAqQ0o0KlM2VdD+/ibGw4UCrbJtLWLY
 inuTJUAvrZhdYHuTfLNeogwgdoyl5SGN/dy3kNNRxVqcfza2kw+U/H2LlJBjtaANpZFTIZ
 ptr78MOU90DKS42tb76OuG8X418bmY7SaqmPbyqibyrcTnWO7/ljKjMmuQI0HfaTAZd7Ho
 gSP1o6so90u917yflugfQ7VOzMuRufMAcgTvFJSwBRyBFBjjIC3oXcfJ628ySQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607724443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uE5KR5qlfz+ztx9s8pbRCB1Be+kxvrwztlDzBEoJCeU=;
 b=6l4EGHeIGgEoz1BM8xIprj71LYQ/8TNyn+KsbwNoVJfPjiraGOnwYmma/niMdHbbcB5BbA
 SooB9xEZT4EUdpBw==
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [patch 03/30] genirq: Move irq_set_lockdep_class() to core
In-Reply-To: <87h7osgifc.fsf@nanos.tec.linutronix.de>
References: <20201210192536.118432146@linutronix.de>
 <20201210194042.860029489@linutronix.de>
 <CAHp75Vc-2OjE2uwvNRiyLMQ8GSN3P7SehKD-yf229_7ocaktiw@mail.gmail.com>
 <87h7osgifc.fsf@nanos.tec.linutronix.de>
Date: Fri, 11 Dec 2020 23:07:22 +0100
Message-ID: <87360cgfol.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 14 Dec 2020 08:17:41 +0000
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
 Chris Wilson <chris@chris-wilson.co.uk>, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>,
 Saeed Mahameed <saeedm@nvidia.com>, netdev <netdev@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 linux-s390@vger.kernel.org, afzal mohammed <afzal.mohd.ma@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, xen-devel@lists.xenproject.org,
 Leon Romanovsky <leon@kernel.org>, "open
 list:HFI1 DRIVER" <linux-rdma@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 linux-pci <linux-pci@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Wambui Karuga <wambui.karugax@gmail.com>,
 Allen Hubbe <allenbh@gmail.com>, Juergen Gross <jgross@suse.com>,
 David Airlie <airlied@linux.ie>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lee Jones <lee.jones@linaro.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-parisc@vger.kernel.org,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, LKML <linux-kernel@vger.kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 11 2020 at 22:08, Thomas Gleixner wrote:

> On Fri, Dec 11 2020 at 19:53, Andy Shevchenko wrote:
>
>> On Thu, Dec 10, 2020 at 10:14 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>>>
>>> irq_set_lockdep_class() is used from modules and requires irq_to_desc() to
>>> be exported. Move it into the core code which lifts another requirement for
>>> the export.
>>
>> ...
>>
>>> +       if (IS_ENABLED(CONFIG_LOCKDEP))
>>> +               __irq_set_lockdep_class(irq, lock_class, request_class);
>
> You are right. Let me fix that.

No. I have to correct myself. You're wrong.

The inline is evaluated in the compilation units which include that
header and because the function declaration is unconditional it is
happy.

Now the optimizer stage makes the whole thing a NOOP if CONFIG_LOCKDEP=n
and thereby drops the reference to the function which makes it not
required for linking.

So in the file where the function is implemented:

#ifdef CONFIG_LOCKDEP
void __irq_set_lockdep_class(....)
{
}
#endif

The whole block is either discarded because CONFIG_LOCKDEP is not
defined or compile if it is defined which makes it available for the
linker.

And in the latter case the optimizer keeps the call in the inline (it
optimizes the condition away because it's always true).

So in both cases the compiler and the linker are happy and everything
works as expected.

It would fail if the header file had the following:

#ifdef CONFIG_LOCKDEP
void __irq_set_lockdep_class(....);
#endif

Because then it would complain about the missing function prototype when
it evaluates the inline.

Thanks,

        tglx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
