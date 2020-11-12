Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 566412B1764
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 09:38:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E18E6E48E;
	Fri, 13 Nov 2020 08:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 371 seconds by postgrey-1.36 at gabe;
 Thu, 12 Nov 2020 11:13:44 UTC
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6C56E0D9;
 Thu, 12 Nov 2020 11:13:44 +0000 (UTC)
Date: Thu, 12 Nov 2020 12:07:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1605179252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GScfsa8nOXUlNCCC/0bnPZszGImDlkAqoVu5Twbqets=;
 b=zZ3ortjpGyVdT6l5Epo+oXEihOo3YsbgeWmCO4SNBn297T52hhepV9lm5suD/944+Sz1gu
 BkYylnk8pMKlYkb4csofMkEGSrhcQcyIn5AL1i1pw3/utYozF/zdo6+bRfmnph5PP7xve1
 PpOVvXxebOQE5U3JtIzNhA0Fc1104xhNai+afx4A4y2O3Fs5x58WbqWTdn5gkAWgcM/duh
 sMgxr+wPIZY9f8FrD3RrbmLqGk62lK9VfUOJuVBmyG+rJup0NYxJRRrKBRd/enHEx2zhIx
 UfbLWY8NE5CqXAlPHU3T/T5B/66csi1W6K2Uz4Y5UeWB8lzg0bfoVIlYejlz5w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1605179252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GScfsa8nOXUlNCCC/0bnPZszGImDlkAqoVu5Twbqets=;
 b=IHlNPa7GPp5Ilh/x3NSZBuxoBCag1CyU3lSY94fXEHyvLJqz7JXMYGP0aqsiN8HGB3WFr5
 ZFMQ/3qvo+nJiyAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [patch V3 10/37] ARM: highmem: Switch to generic kmap atomic
Message-ID: <20201112110729.vx4xebavy6gpzuef@linutronix.de>
References: <20201103092712.714480842@linutronix.de>
 <20201103095857.582196476@linutronix.de>
 <CGME20201112081036eucas1p14e135a370d3bccab311727fd2e89f4df@eucas1p1.samsung.com>
 <c07bae0c-68dd-2693-948f-00e8a50f3053@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c07bae0c-68dd-2693-948f-00e8a50f3053@samsung.com>
X-Mailman-Approved-At: Fri, 13 Nov 2020 08:38:02 +0000
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
Cc: linux-aio@kvack.org, Peter Zijlstra <peterz@infradead.org>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, sparclinux@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Paul McKenney <paulmck@kernel.org>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Mel Gorman <mgorman@suse.de>, Dave Airlie <airlied@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-mips@vger.kernel.org,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Christian Koenig <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-12 09:10:34 [+0100], Marek Szyprowski wrote:
> I can do more tests to help fixing this issue. Just let me know what to do.

-> https://lkml.kernel.org/r/87y2j6n8mj.fsf@nanos.tec.linutronix.de

Sebastian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
