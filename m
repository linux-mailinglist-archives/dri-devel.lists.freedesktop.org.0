Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA06271C09
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 09:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5946E1AA;
	Mon, 21 Sep 2020 07:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913D66E1EC;
 Sat, 19 Sep 2020 09:50:03 +0000 (UTC)
Message-Id: <20200919092615.879315697@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600509001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=H19N93lyCWKUFrJfknJveCBx/SKVmbFW8Yl82i7bCJA=;
 b=U6fqw0lOwRRvIGe/7IzbGf1Hqghw0ykyVeiK7gVdoSzy4eqGuEga+Id5p+KPktWpCVdzmK
 aV0Z4FPPg7rGCSmfQXi1uk2t8w2P29Uep6GMCn47Sn6S/JkyDkBodYAl//JRgWDPBzL2mU
 WcC0bRk2IQjTTMHKXJiFVz+5C0MTTLHH4a1alauXsy5v4plgP/T1tIfQZXGbV2jMc4rbfz
 Y3BE6uq25uZJkKeGmxAKWr9klMDY4mJbZgTnEgGGhqJ+FZWjm2MjP1C9JNxPwHqYoIC8Io
 nA1UXQDNDtnvjnQ/ivPlJLT+094/Nqjbl9461P5VTyE1ySxcWJb/J/q3UB0Ytg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600509001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=H19N93lyCWKUFrJfknJveCBx/SKVmbFW8Yl82i7bCJA=;
 b=YU/1SbOA+qMlJhFqk1C7pS2Lm8Q3mBHsYZZQkFTg+LuWwrYQJ/Kqfx66UoYa85NJCFtsm9
 MelcZbcHhGbfVZBA==
Date: Sat, 19 Sep 2020 11:17:52 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch RFC 01/15] mm/highmem: Un-EXPORT __kmap_atomic_idx()
References: <20200919091751.011116649@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 21 Sep 2020 07:34:44 +0000
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Segall <bsegall@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arch@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mel Gorman <mgorman@suse.de>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, linuxppc-dev@lists.ozlabs.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nothing in modules can use that.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 mm/highmem.c |    2 --
 1 file changed, 2 deletions(-)

--- a/mm/highmem.c
+++ b/mm/highmem.c
@@ -108,8 +108,6 @@ static inline wait_queue_head_t *get_pkm
 atomic_long_t _totalhigh_pages __read_mostly;
 EXPORT_SYMBOL(_totalhigh_pages);
 
-EXPORT_PER_CPU_SYMBOL(__kmap_atomic_idx);
-
 unsigned int nr_free_highpages (void)
 {
 	struct zone *zone;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
