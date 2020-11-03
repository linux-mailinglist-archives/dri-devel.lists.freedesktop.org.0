Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC462A5F83
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2AD6F38C;
	Wed,  4 Nov 2020 08:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0110A6EC2D;
 Tue,  3 Nov 2020 10:33:27 +0000 (UTC)
Message-Id: <20201103095856.870272797@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=mHGaObavEXdpklPpAdB/Vc9tQphwJ4HtjtNI7fLm1v8=;
 b=IBayNHLC8hDXJPq5spbDcH2wKyiWbuyexwHwfVt89VcAakRhxfizYqbQCAAKER9L/0L/m1
 Kn6tmBkR3xWZrx6tJ/BA5rsYN4HGNPFD48Ua4frK3vrnlVg9aLM4m5aIJw9ym5mSbN61k5
 EHHJS0+GcvKD5mXRHapBzJaiaTtrRGQL9/oIkA+EXvVydTfP9WAjd4wBDbJghjylU6Hl+v
 cbUiIXxIilBIpfO0gAqBvTDU+ZaYnr+9b9dZHzEpb1hZtXN8oqnkWtU4heJMQKd9pbhu3F
 Udw+2wxDQStY2AooCfpVR6WbhoIEGNiJw2A//IRPpAYo18WAjI/Kj422cg4K+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=mHGaObavEXdpklPpAdB/Vc9tQphwJ4HtjtNI7fLm1v8=;
 b=ZQ5pkdX4DsEbSRpww8iUtueplpi1akZRVpDjtrypi3SvuIOi8H/SrYDmUdCkGKxD3wiqTh
 yikxYY0p6mIHukBQ==
Date: Tue, 03 Nov 2020 10:27:15 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 03/37] fs: Remove asm/kmap_types.h includes
References: <20201103092712.714480842@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 04 Nov 2020 08:22:13 +0000
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-aio@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Ben Segall <bsegall@google.com>, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, Paul Mackerras <paulus@samba.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Paul McKenney <paulmck@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Mel Gorman <mgorman@suse.de>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, linux-snps-arc@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, Josef Bacik <josef@toxicpanda.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org,
 David Sterba <dsterba@suse.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Chris Mason <clm@fb.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Christian Koenig <christian.koenig@amd.com>, Benjamin LaHaise <bcrl@kvack.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 linux-btrfs@vger.kernel.org, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Historical leftovers from the time where kmap() had fixed slots.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Benjamin LaHaise <bcrl@kvack.org>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-aio@kvack.org
Cc: Chris Mason <clm@fb.com>
Cc: Josef Bacik <josef@toxicpanda.com>
Cc: David Sterba <dsterba@suse.com>
Cc: linux-btrfs@vger.kernel.org
---
 fs/aio.c         |    1 -
 fs/btrfs/ctree.h |    1 -
 2 files changed, 2 deletions(-)

--- a/fs/aio.c
+++ b/fs/aio.c
@@ -43,7 +43,6 @@
 #include <linux/mount.h>
 #include <linux/pseudo_fs.h>
 
-#include <asm/kmap_types.h>
 #include <linux/uaccess.h>
 #include <linux/nospec.h>
 
--- a/fs/btrfs/ctree.h
+++ b/fs/btrfs/ctree.h
@@ -17,7 +17,6 @@
 #include <linux/wait.h>
 #include <linux/slab.h>
 #include <trace/events/btrfs.h>
-#include <asm/kmap_types.h>
 #include <asm/unaligned.h>
 #include <linux/pagemap.h>
 #include <linux/btrfs.h>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
