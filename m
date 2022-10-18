Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3536E602CF2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 15:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A74882AF;
	Tue, 18 Oct 2022 13:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
 by gabe.freedesktop.org (Postfix) with ESMTP id C89DF10E21C;
 Tue, 18 Oct 2022 13:28:18 +0000 (UTC)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id DACAD92009D; Tue, 18 Oct 2022 15:28:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id D66BA92009C;
 Tue, 18 Oct 2022 14:28:17 +0100 (BST)
Date: Tue, 18 Oct 2022 14:28:17 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Build regressions/improvements in v6.1-rc1
In-Reply-To: <CAMuHMdVbo0wMaVVhe4f4tC9-TW2+DsOVAB77TtLdnsG=us8Q2A@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2210181349060.50489@angie.orcam.me.uk>
References: <20221017145157.1866351-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2210171653540.9136@ramsan.of.borg>
 <alpine.DEB.2.21.2210181126040.50489@angie.orcam.me.uk>
 <CAMuHMdVbo0wMaVVhe4f4tC9-TW2+DsOVAB77TtLdnsG=us8Q2A@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: D Scott Phillips <scott@os.amperecomputing.com>, linux-rdma@vger.kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, kvm-riscv@lists.infradead.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

> > > .> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/9abf2313adc1ca1b6180c508c25f22f9395cc780/ (all 149 configs)
> 
> > > >  + {standard input}: Error: branch to a symbol in another ISA mode: 1339 =>
> > > > 2616, 2621
> > >
> > > mips-gcc11/micro32r2_defconfig
> > > mips-gcc11/micro32r2el_defconfig
> >
> >  Where can these configs be obtained from?
> 
> By following the links in the URL above you removed while replying? ;-)
> 
> http://kisskb.ellerman.id.au/kisskb/buildresult/14818296/
> http://kisskb.ellerman.id.au/kisskb/buildresult/14818298/

 Thank you.

 The error message is due to the use of MT ASE code in a microMIPS 
compilation, specifically a handwritten machine instruction encoding via 
`.word' in `dmt' from <asm/mipsmtregs.h>.  A similar construct is made 
from `mftc0', but it isn't at a branch target, so no error is triggered.

 A `.insn' pseudo-op ought to precede such handwritten constructs to tell 
the assembler that what follows is really an instruction rather than data, 
which would then cause any preceding label to be correctly annotated.

 Now the MT ASE has been specified for the microMIPS ISA, but the machine 
instruction encodings are different, so merely adding `.insn' won't do any 
good.  Also we've never added support for the microMIPS MT ASE, and it's 
not clear to me if it's ever been used with real silicon.  Perhaps QEMU 
has it, but I suspect not.  Also no support has ever been added to 
binutils.

 So I think we want to just exclude the offending code from microMIPS 
configurations, perhaps by hardcoding `cpu_has_mipsmt' to 0 if 
CPU_MICROMIPS.

 On the other hand support for the MT ASE with the regular MIPS ISA has 
been added with binutils 2.17:

commit 61cc02671150a81ea68f25b8409b8ace18bda9ae
Author: Chao-ying Fu <fu@mips.com>
Date:   Tue Sep 6 18:46:57 2005 +0000

and according to Documentation/process/changes.rst we require version 2.23 
now.  So it looks to me like we want to discard the handwritten hacks and 
use proper assembly instruction mnemonics.  I do believe we did this for 
the DSP ASE already.

  Maciej
