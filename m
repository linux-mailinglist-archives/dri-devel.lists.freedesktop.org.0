Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 531736261F2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 20:32:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0D810E1BC;
	Fri, 11 Nov 2022 19:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 331 seconds by postgrey-1.36 at gabe;
 Fri, 11 Nov 2022 14:49:15 UTC
Received: from smtpout.efficios.com (smtpout.efficios.com [167.114.26.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A559D10E083
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 14:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
 s=smtpout1; t=1668177821;
 bh=EYvFyeYoIXdpRZUrDIt9Kwnd3gAkvdIgxw1lIXG8SKY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=l66N3oiBVl0WpLOT0hkLWrSBLQJsJSW4+ouPxFZH5QD5KKmXDB6CMjzwtM8VVLLpX
 a4mvKpJXJiuV9Qw3ANDqSRII+7K5waLtTRLYZ90oeO3HFXyKJpVusI8jz1TOHWpOiX
 dJRcqsFN0mN40E/3U0KhejsRReLLA8QsqIZLb9mPKd4oL95EyLfXlhHXXYFtuTieM/
 mQitMOSC/OQ89QyOELCnHdOHRibH9OXvgNxVpUIxiREjJL0PTMu3jrCYcnxgmXCUU+
 h1vYvH07RGr00OmtJNBP+zQXctnrrr738WJXcAPDjU36sTOHtCkNno5wnO/vjAKkO+
 R+/kME1qSOXkw==
Received: from [172.16.0.153] (192-222-180-24.qc.cable.ebox.net
 [192.222.180.24])
 by smtpout.efficios.com (Postfix) with ESMTPSA id 4N81fh5HFrzgt1;
 Fri, 11 Nov 2022 09:43:40 -0500 (EST)
Message-ID: <02cdf436-6942-89a7-98b2-bfa75ba5f301@efficios.com>
Date: Fri, 11 Nov 2022 09:43:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH printk v3 00/40] reduce console_lock scope
Content-Language: en-US
To: John Ogness <john.ogness@linutronix.de>, Petr Mladek <pmladek@suse.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <20221107141638.3790965-1-john.ogness@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 11 Nov 2022 19:32:07 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 kgdb-bugreport@lists.sourceforge.net, Lai Jiangshan <jiangshanlai@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Joel Fernandes <joel@joelfernandes.org>,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Tom Rix <trix@redhat.com>,
 Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 Aaron Tomlin <atomlin@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Paolo Abeni <pabeni@redhat.com>, Neeraj Upadhyay <quic_neeraju@quicinc.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-um@lists.infradead.org,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-11-07 09:15, John Ogness wrote:
[...]
> 
> The base commit for this series is from Paul McKenney's RCU tree
> and provides an NMI-safe SRCU implementation [1]. Without the
> NMI-safe SRCU implementation, this series is not less safe than
> mainline. But we will need the NMI-safe SRCU implementation for
> atomic consoles anyway, so we might as well get it in
> now. Especially since it _does_ increase the reliability for
> mainline in the panic path.

So, your email got me to review the SRCU nmi-safe series:

[1] https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/log/?h=srcunmisafe.2022.10.21a

Especially this commit:

https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/commit/?h=srcunmisafe.2022.10.21a&id=5d0f5953b60f5f7a278085b55ddc73e2932f4c33

I disagree with the overall approach taken there, which is to create
yet another SRCU flavor, this time with explicit "nmi-safe" read-locks.
This adds complexity to the kernel APIs and I think we can be clever
about this and make SRCU nmi-safe without requiring a whole new incompatible
API.

You can find the basic idea needed to achieve this in the libside RCU
user-space implementation. I needed to introduce a split-counter concept
to support rseq vs atomics to keep track of per-cpu grace period counters.
The "rseq" counter is the fast-path, but if rseq fails, the abort handler
uses the atomic counter instead.

https://github.com/compudj/side/blob/main/src/rcu.h#L23

struct side_rcu_percpu_count {
	uintptr_t begin;
	uintptr_t rseq_begin;
	uintptr_t end;
	uintptr_t rseq_end;
}  __attribute__((__aligned__(SIDE_CACHE_LINE_SIZE)));

The idea is to "split" each percpu counter into two counters, one for rseq,
and the other for atomics. When a grace period wants to observe the value of
a percpu counter, it simply sums the two counters:

https://github.com/compudj/side/blob/main/src/rcu.c#L112

The same idea can be applied to SRCU in the kernel: one counter for percpu ops,
and the other counter for nmi context, so basically:

srcu_read_lock()

if (likely(!in_nmi()))
   increment the percpu-ops lock counter
else
   increment the atomic lock counter

srcu_read_unlock()

if (likely(!in_nmi()))
   increment the percpu-ops unlock counter
else
   increment the atomic unlock counter

Then in the grace period sum the percpu-ops and the atomic values whenever
each counter value is read.

This would allow SRCU to be NMI-safe without requiring the callers to
explicitly state whether they need to be nmi-safe or not, and would only
take the overhead of the atomics in the NMI handlers rather than for all
users which happen to use SRCU read locks shared with nmi handlers.

Thoughts ?

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

