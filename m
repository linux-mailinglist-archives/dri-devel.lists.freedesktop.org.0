Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D941ED7DE
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 23:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D20C89E43;
	Wed,  3 Jun 2020 21:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1016A89E43
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 21:14:18 +0000 (UTC)
IronPort-SDR: qGY2BAXFUruzsR5hNyb2SCK6kgbg4keDlzH93bHBbMRvXhTVlN3muNxWjcmtSPo6txjZ5ELptm
 muDXvwikvfHw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2020 14:14:17 -0700
IronPort-SDR: /+lphg5mhpEEZkBRitWFLPKo3DT2QNviSG1HWZMRFsCRphzo4Njn3WjwLxNQkn0kQpJrJnSBuZ
 Bg3bhJF0orwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,469,1583222400"; d="scan'208";a="294107077"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by fmsmga004.fm.intel.com with ESMTP; 03 Jun 2020 14:14:16 -0700
Date: Wed, 3 Jun 2020 14:14:16 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200603211416.GA1740285@iweiny-DESK2.sc.intel.com>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
 <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
 <20200519194215.GA71941@roeck-us.net>
 <20200520051315.GA3660833@iweiny-DESK2.sc.intel.com>
 <d86dba19-4f4b-061e-a2c7-4f037e9e2de2@roeck-us.net>
 <20200521174250.GB176262@iweiny-DESK2.sc.intel.com>
 <20200603135736.e7b5ded0082a81ae6d9067a0@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603135736.e7b5ded0082a81ae6d9067a0@linux-foundation.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
 Thomas Gleixner <tglx@linutronix.de>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 03, 2020 at 01:57:36PM -0700, Andrew Morton wrote:
> On Thu, 21 May 2020 10:42:50 -0700 Ira Weiny <ira.weiny@intel.com> wrote:
> 
> > > > 
> > > > Actually it occurs to me that the patch consolidating kmap_prot is odd for
> > > > sparc 32 bit...
> > > > 
> > > > Its a long shot but could you try reverting this patch?
> > > > 
> > > > 4ea7d2419e3f kmap: consolidate kmap_prot definitions
> > > > 
> > > 
> > > That is not easy to revert, unfortunately, due to several follow-up patches.
> > 
> > I have gotten your sparc tests to run and they all pass...
> > 
> > 08:10:34 > ../linux-build-test/rootfs/sparc/run-qemu-sparc.sh 
> > Build reference: v5.7-rc4-17-g852b6f2edc0f
> > 
> > Building sparc32:SPARCClassic:nosmp:scsi:hd ... running ......... passed
> > Building sparc32:SPARCbook:nosmp:scsi:cd ... running ......... passed
> > Building sparc32:LX:nosmp:noapc:scsi:hd ... running ......... passed
> > Building sparc32:SS-4:nosmp:initrd ... running ......... passed
> > Building sparc32:SS-5:nosmp:scsi:hd ... running ......... passed
> > Building sparc32:SS-10:nosmp:scsi:cd ... running ......... passed
> > Building sparc32:SS-20:nosmp:scsi:hd ... running ......... passed
> > Building sparc32:SS-600MP:nosmp:scsi:hd ... running ......... passed
> > Building sparc32:Voyager:nosmp:noapc:scsi:hd ... running ......... passed
> > Building sparc32:SS-4:smp:scsi:hd ... running ......... passed
> > Building sparc32:SS-5:smp:scsi:cd ... running ......... passed
> > Building sparc32:SS-10:smp:scsi:hd ... running ......... passed
> > Building sparc32:SS-20:smp:scsi:hd ... running ......... passed
> > Building sparc32:SS-600MP:smp:scsi:hd ... running ......... passed
> > Building sparc32:Voyager:smp:noapc:scsi:hd ... running ......... passed
> > 
> > Is there another test I need to run?
> 
> This all petered out, but as I understand it, this patchset still might
> have issues on various architectures.
> 
> Can folks please provide an update on the testing status?

I believe the tests were failing for Guenter due to another patch set...[1]

My tests with just this series are working.

From my understanding the other failures were unrelated.[2]

	<quote Mike Rapoport>
	I've checked the patch above on top of the mmots which already has
	Ira's patches and it booted fine. I've used sparc32_defconfig to build
	the kernel and qemu-system-sparc with default machine and CPU.
	</quote>

Mike, am I wrong?  Do you think the kmap() patches are still causing issues?

Ira

[1] https://lore.kernel.org/lkml/2807E5FD2F6FDA4886F6618EAC48510E92EAB1DE@CRSMSX101.amr.corp.intel.com/
[2] https://lore.kernel.org/lkml/20200520195110.GH1118872@kernel.org/

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
