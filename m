Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4511DAC4D
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 09:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1736E58B;
	Wed, 20 May 2020 07:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7021489FA7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 16:54:24 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id x2so181494pfx.7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 09:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xmBBbLK3vjWE/EyjvUc68p3tw/EXGXu0OK+6vpkbzqQ=;
 b=US3KTRvNcsr1JQ3EhzPolHH5YLTbLmBZ8QACOxRX4DSdLWVJ77w+ufdLjru2exOJj5
 cGgDdNSpGJSLCToXHOYtummYRYMikc607MQTtZw3CIAeMX52xLfkzXJFnqV++/4JZPBX
 TkfA6bA2OQ/tBu0verEpOr/8yTMghh7JOJnq8blVosibdSwn9t4VGf6TTFO3jl9Ku+S6
 us7ewjcIE1yEdgRycst8zGi/M73AaWLcbuldE63QokhOzCU4Lv6vQlzl3U74bTRQpiDW
 76aVV76mP+yZNV5Arg3qVa0f6SZeHYOumZT/8SZvPzqHfkPYn2L9uFwTaop85+0WCxz9
 dP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=xmBBbLK3vjWE/EyjvUc68p3tw/EXGXu0OK+6vpkbzqQ=;
 b=sjrbk81zozwCuaz1t2sYSOiAMpTIpZjvMF4YjrQu2ocfYzuW/l6/1T6fJY9quWGVfm
 Ah6B0+dYc/q23trlw3nbHnobC3dJd3Ouqk+r4FGsdyhLG7xhL6cydEP4qp28HTBzd7dk
 cnqII8PhgUUMIAlR4HLDKcTTDGXRWpuT5VxGDD41G4uKIdi25OL3rBvxe8co/9BzYwsc
 WtX5ryu/ucoTiQZjNoIiFa1oBNODOB/XUkM64vv6u0QIHLRwKnUwwU5Hf3k0p5jS8pZD
 lKGd/MiL65zTPa2i5ZBmGl23ajqlqCn9sSSDvyaOvnwboIjQIuMfTbIwWjUCydc/l0Lj
 jyCw==
X-Gm-Message-State: AOAM532FeMkqLJeoB03DscH+OJ85rziP+Ev2le7D5WIpRk5WpQ3w4zJL
 P3VVA1ItEvcmWtT1rvzhPIo=
X-Google-Smtp-Source: ABdhPJyjXg6Tl4Trqy/ovTHZ7agsZDG2QZ23n+CG2Df9YrHRxk8WNFN4fKgw/J0SX04nl9fKvZEDwg==
X-Received: by 2002:aa7:9297:: with SMTP id j23mr36511pfa.15.1589907263910;
 Tue, 19 May 2020 09:54:23 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id go14sm111069pjb.42.2020.05.19.09.54.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 19 May 2020 09:54:23 -0700 (PDT)
Date: Tue, 19 May 2020 09:54:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: ira.weiny@intel.com
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200519165422.GA5838@roeck-us.net>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200518184843.3029640-1-ira.weiny@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 20 May 2020 07:34:33 +0000
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 18, 2020 at 11:48:43AM -0700, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> The kunmap_atomic clean up failed to remove one set of pagefault/preempt
> enables when vaddr is not in the fixmap.
> 
> Fixes: bee2128a09e6 ("arch/kunmap_atomic: consolidate duplicate code")
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

microblazeel works with this patch, as do the nosmp sparc32 boot tests,
but sparc32 boot tests with SMP enabled still fail with lots of messages
such as:

BUG: Bad page state in process swapper/0  pfn:006a1
page:f0933420 refcount:0 mapcount:1 mapping:(ptrval) index:0x1
flags: 0x0()
raw: 00000000 00000100 00000122 00000000 00000001 00000000 00000000 00000000
page dumped because: nonzero mapcount
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B             5.7.0-rc6-next-20200518-00002-gb178d2d56f29 #1
[f00e7ab8 :
bad_page+0xa8/0x108 ]
[f00e8b54 :
free_pcppages_bulk+0x154/0x52c ]
[f00ea024 :
free_unref_page+0x54/0x6c ]
[f00ed864 :
free_reserved_area+0x58/0xec ]
[f0527104 :
kernel_init+0x14/0x110 ]
[f000b77c :
ret_from_kernel_thread+0xc/0x38 ]
[00000000 :
0x0 ]

Code path leading to that message is different but always the same
from free_unref_page().

Still testing ppc images.

Guenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
