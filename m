Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DE51DAC55
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 09:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB3D6E5B0;
	Wed, 20 May 2020 07:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA926E0D5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 19:42:17 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id a5so132134pjh.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 12:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1PbPu9MDpsX7CWlzIANvDidpxlS/QMPqApRlwiiHNw8=;
 b=Azzo19mxTglIY2DWsdeqvJCJvbRFWfMvCqe910K+bLoZcz9A0rEclUKyMtzUQpeHzC
 onlWdkJh3IcWILK4c2hRtOtl7mRzAbiyLlEcJdxmOebPU1v944BfCUyeskdH4MaSANGB
 mG1De8kuL8xqrOY6I9z2/irGnDdt+dXuW+nblD5+Bi7nB5W52s0/6ICGfZDepT9Noian
 auesxCt7/j2cCzmSLOIHL82Wa50HphpyDMpe82o3c9PeVBitNH+3VinlNYT9yXfWiYMK
 CoPZr98AYh6qGXAhrwf3fwANeJXKXy93GRy48lcmGQT0TIdmPLv0mxuhYKT+dVSO6mfx
 T51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=1PbPu9MDpsX7CWlzIANvDidpxlS/QMPqApRlwiiHNw8=;
 b=FLrdUifqVIBxjM9sLBy/OGKAekWs2GwCJp2iQVPdGO9eYJ6WPgokVz7cz8YnXxQPws
 D7q/jH7TOUcalpr//lxlhuLzWQsyA7K7VdplOqYmrU7RCk+ePCaKbCDiEJAfwloEhmrD
 jMBn+qMN+VqNpW1Nab1BOFH3JcS1hsbKn5/GpVw9TQZM9b0HDPZb6tTK5hy1SUGLj8HA
 M8H8jijdWxbdFYPGBnxPScD74tYqcHpQSO3IqOeYXIIxCj7fHa1KcLIwX17Fsu0+AcVs
 whrnjbJeYwr268Ehxn5RL7imAy7rpTulLlvwsxsFZzThVAnCTWA3+XvoI6kykVRCTtA2
 vvlw==
X-Gm-Message-State: AOAM531ErcolqVhrV6sFGqOWWlOkS/5y4/C6HreddcEjvoJRMegvSn+x
 ysFe1n5nleJW7D4yVMQZHWw=
X-Google-Smtp-Source: ABdhPJyHaPx1l/c1P1VXN2zRGyOacWb0vDLgVVmiFhoO/p9Se1Yt0uzr0GEQ80rPSqJdr43xSsWcZA==
X-Received: by 2002:a17:90a:4811:: with SMTP id
 a17mr1198137pjh.130.1589917337613; 
 Tue, 19 May 2020 12:42:17 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id x5sm234038pfq.196.2020.05.19.12.42.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 19 May 2020 12:42:16 -0700 (PDT)
Date: Tue, 19 May 2020 12:42:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200519194215.GA71941@roeck-us.net>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
 <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
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

On Tue, May 19, 2020 at 11:40:32AM -0700, Ira Weiny wrote:
> On Tue, May 19, 2020 at 09:54:22AM -0700, Guenter Roeck wrote:
> > On Mon, May 18, 2020 at 11:48:43AM -0700, ira.weiny@intel.com wrote:
> > > From: Ira Weiny <ira.weiny@intel.com>
> > > 
> > > The kunmap_atomic clean up failed to remove one set of pagefault/preempt
> > > enables when vaddr is not in the fixmap.
> > > 
> > > Fixes: bee2128a09e6 ("arch/kunmap_atomic: consolidate duplicate code")
> > > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > 
> > microblazeel works with this patch,
> 
> Awesome...  Andrew in my rush yesterday I should have put a reported by on the
> patch for Guenter as well.
> 
> Sorry about that Guenter,

No worries.

> Ira
> 
> > as do the nosmp sparc32 boot tests,
> > but sparc32 boot tests with SMP enabled still fail with lots of messages
> > such as:
> > 
> > BUG: Bad page state in process swapper/0  pfn:006a1
> > page:f0933420 refcount:0 mapcount:1 mapping:(ptrval) index:0x1
> > flags: 0x0()
> > raw: 00000000 00000100 00000122 00000000 00000001 00000000 00000000 00000000
> > page dumped because: nonzero mapcount
> > Modules linked in:
> > CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B             5.7.0-rc6-next-20200518-00002-gb178d2d56f29 #1
> > [f00e7ab8 :
> > bad_page+0xa8/0x108 ]
> > [f00e8b54 :
> > free_pcppages_bulk+0x154/0x52c ]
> > [f00ea024 :
> > free_unref_page+0x54/0x6c ]
> > [f00ed864 :
> > free_reserved_area+0x58/0xec ]
> > [f0527104 :
> > kernel_init+0x14/0x110 ]
> > [f000b77c :
> > ret_from_kernel_thread+0xc/0x38 ]
> > [00000000 :
> > 0x0 ]
> > 
> > Code path leading to that message is different but always the same
> > from free_unref_page().
> > 
> > Still testing ppc images.
> > 

ppc image tests are passing with this patch.

Guenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
