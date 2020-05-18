Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5474C1D9097
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 09:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D626E527;
	Tue, 19 May 2020 07:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D3A6E25A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 16:11:34 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id x10so4415460plr.4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 09:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PZweTdyCTeKAMxoHO6mO1oUT3tSSWyHLqvLyIKGeBVY=;
 b=GET0otAdKNcL69ksN3IiyWVrfDMA5oTmg2ORXQXg1dxMLmeJHGcqKUPueDZ892Waqk
 LiahGzxVvAOb6eviKgbVMqpqH2xTB2Jmjekr265F2YTq8WGVTbTdHDJqMl0wXrOFGznR
 /ndT2roEGwCQ/iQPRVIOevzp+C4dHL7DUiGmL/Du2l5bOwMSnizD6OXLURl/+Bmh0CrV
 cSMqAO24vnPf3FXPRoGy9nntgG7zwj7eHXcOGf/gUHHXIQkUmuqSD2TACIHoLCzpICsI
 E//FSD44Fk7xhaRAKeOGCz7JAFGzEWqiq8lgebRBy1KrqTyGOmYukDswhUiC3e2tvmjo
 Hr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=PZweTdyCTeKAMxoHO6mO1oUT3tSSWyHLqvLyIKGeBVY=;
 b=awU0/teUSU2Hbqazk3uyjC0i+bNEW8jhm2d7RVgLC4ThVpg7D/kLKZZOO9qZOdjJis
 MjFRX7zxgSdmm/D9ggon8MUeuLpzFVKdrkethIwq7pGulEPyiNpS38Ojv01tGwIe5lsW
 5cVsWhoQ+E8IDEmJq3+Gxp7cxr2KEtXK1U9oP4ws0BR+K0AsqJgSjrS0m0pjnIw+LFqK
 leHl1adBR8pxpGxgQ4bWUPd0wHC+cbpoZ/i1yPNwbH9CJzhWkUvTdzSgSH5CMwqm6ySv
 lIidKr1m3N8100RXN2UyQVmB94/K6hVy7+3EMqW2BDCgsvAslGCpn9PElPV/xYHp3fqY
 pSPQ==
X-Gm-Message-State: AOAM5333BBV7vBCsMIo5eA1uiZ6wFblpdRong2e40uBstA6eg2UBp9n+
 8y5jud0orRBlJ/OgqyFG2Vc=
X-Google-Smtp-Source: ABdhPJyiyoD11kFujK6YPCyAvn3cJt1s0JbqDvxe/z4TQ6/BdwXltCUrMAiNJwcIIoiI8qiWwb2Mbg==
X-Received: by 2002:a17:902:228:: with SMTP id
 37mr17432610plc.105.1589818294182; 
 Mon, 18 May 2020 09:11:34 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id k3sm13299pjc.38.2020.05.18.09.11.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 May 2020 09:11:33 -0700 (PDT)
Date: Mon, 18 May 2020 09:11:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH V3 07/15] arch/kunmap_atomic: Consolidate duplicate code
Message-ID: <20200518161132.GB66689@roeck-us.net>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
 <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200516223306.GA161252@roeck-us.net>
 <20200518034938.GA3023182@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200518034938.GA3023182@iweiny-DESK2.sc.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 19 May 2020 07:00:27 +0000
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

On Sun, May 17, 2020 at 08:49:39PM -0700, Ira Weiny wrote:

[ ... ]

> > 
> > ---
> > # bad: [bdecf38f228bcca73b31ada98b5b7ba1215eb9c9] Add linux-next specific files for 20200515
> > # good: [2ef96a5bb12be62ef75b5828c0aab838ebb29cb8] Linux 5.7-rc5
> > git bisect start 'HEAD' 'v5.7-rc5'
> > # good: [3674d7aa7a8e61d993886c2fb7c896c5ef85e988] Merge remote-tracking branch 'crypto/master'
> > git bisect good 3674d7aa7a8e61d993886c2fb7c896c5ef85e988
> > # good: [87f6f21783522e6d62127cf33ae5e95f50874beb] Merge remote-tracking branch 'spi/for-next'
> > git bisect good 87f6f21783522e6d62127cf33ae5e95f50874beb
> > # good: [5c428e8277d5d97c85126387d4e00aa5adde4400] Merge remote-tracking branch 'staging/staging-next'
> > git bisect good 5c428e8277d5d97c85126387d4e00aa5adde4400
> > # good: [f68de67ed934e7bdef4799fd7777c86f33f14982] Merge remote-tracking branch 'hyperv/hyperv-next'
> > git bisect good f68de67ed934e7bdef4799fd7777c86f33f14982
> > # bad: [54acd2dc52b069da59639eea0d0c92726f32fb01] mm/memblock: fix a typo in comment "implict"->"implicit"
> > git bisect bad 54acd2dc52b069da59639eea0d0c92726f32fb01
> > # good: [784a17aa58a529b84f7cc50f351ed4acf3bd11f3] mm: remove the pgprot argument to __vmalloc
> > git bisect good 784a17aa58a529b84f7cc50f351ed4acf3bd11f3
> > # good: [6cd8137ff37e9a37aee2d2a8889c8beb8eab192f] khugepaged: replace the usage of system(3) in the test
> > git bisect good 6cd8137ff37e9a37aee2d2a8889c8beb8eab192f
> > # bad: [6987da379826ed01b8a1cf046b67cc8cc10117cc] sparc: remove unnecessary includes
> > git bisect bad 6987da379826ed01b8a1cf046b67cc8cc10117cc
> > # good: [bc17b545388f64c09e83e367898e28f60277c584] mm/hugetlb: define a generic fallback for is_hugepage_only_range()
> > git bisect good bc17b545388f64c09e83e367898e28f60277c584
> > # bad: [9b5aa5b43f957f03a1f4a9aff5f7924e2ebbc011] arch-kmap_atomic-consolidate-duplicate-code-checkpatch-fixes
> > git bisect bad 9b5aa5b43f957f03a1f4a9aff5f7924e2ebbc011
> > # good: [0941a38ff0790c1004270f952067a5918a4ba32d] arch/kmap: remove redundant arch specific kmaps
> > git bisect good 0941a38ff0790c1004270f952067a5918a4ba32d
> > # good: [56e635a64c2cbfa815c851af10e0f811e809977b] arch-kunmap-remove-duplicate-kunmap-implementations-fix
> > git bisect good 56e635a64c2cbfa815c851af10e0f811e809977b
> > # bad: [60f96b2233c790d4f1c49317643051f1670bcb29] arch/kmap_atomic: consolidate duplicate code
> > git bisect bad 60f96b2233c790d4f1c49317643051f1670bcb29
> > # good: [7b3708dc3bf72a647243064fe7ddf9a76248ddfd] {x86,powerpc,microblaze}/kmap: move preempt disable
> > git bisect good 7b3708dc3bf72a647243064fe7ddf9a76248ddfd
> > # first bad commit: [60f96b2233c790d4f1c49317643051f1670bcb29] arch/kmap_atomic: consolidate duplicate code
> 
> I'm confused by this.  This points to an earlier commit being bad?
> 

Yes, you are correct. I was looking up the wrong commit; it had a similar
subject line. Sorry for the confusion.

Guenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
