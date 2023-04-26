Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D816EF4C2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 14:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E690810E0C1;
	Wed, 26 Apr 2023 12:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC5710E0C1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 12:53:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E6BF163664;
 Wed, 26 Apr 2023 12:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A4AC433D2;
 Wed, 26 Apr 2023 12:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1682513635;
 bh=rnR2gHMom5cZ9EE0QbaWG0mAQc/4BfAqxA6wiBHOddQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0O5fefgIhXFVwx4bd/JHCnR2BWedmFunEuhy57jrlZSyAl3OzSBYYcehg0kqdST72
 LDrHPOnCB314Vs0VFJJIEkS9b2AQwIuZKkVcvVjIisDaelGAgM9+dQ/hD/hIewmiWV
 KBROROmgExlXq2SJmL+iWP6rJn4hf+8RDIC0tFSM=
Date: Wed, 26 Apr 2023 14:53:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Subject: Re: [PATCH v2 0/7] Allow dynamic allocation of software IO TLB
 bounce buffers
Message-ID: <2023042630-amends-speech-7db2@gregkh>
References: <cover.1681898595.git.petr.tesarik.ext@huawei.com>
 <20230426141520.0caf4386@meshulam.tesarici.cz>
 <2023042617-wobble-enlighten-9361@gregkh>
 <20230426144439.5674f8bc@meshulam.tesarici.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230426144439.5674f8bc@meshulam.tesarici.cz>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Muchun Song <muchun.song@linux.dev>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Kim Phillips <kim.phillips@amd.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Jonathan Corbet <corbet@lwn.net>,
 Will Deacon <will@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 Borislav Petkov <bp@suse.de>, Won Chung <wonchung@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Paul E. McKenney" <paulmck@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 Zhen Lei <thunder.leizhen@huawei.com>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Petr Tesarik <petr.tesarik.ext@huawei.com>, Kees Cook <keescook@chromium.org>,
 Ondrej Zary <linux@zary.sk>, Petr Tesarik <petrtesarik@huaweicloud.com>,
 Randy Dunlap <rdunlap@infradead.org>, Roberto Sassu <roberto.sassu@huawei.com>,
 open list <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 26, 2023 at 02:44:39PM +0200, Petr Tesařík wrote:
> Hi Greg,
> 
> On Wed, 26 Apr 2023 14:26:36 +0200
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > On Wed, Apr 26, 2023 at 02:15:20PM +0200, Petr Tesařík wrote:
> > > Hi,
> > > 
> > > On Wed, 19 Apr 2023 12:03:52 +0200
> > > Petr Tesarik <petrtesarik@huaweicloud.com> wrote:
> > >   
> > > > From: Petr Tesarik <petr.tesarik.ext@huawei.com>
> > > > 
> > > > The goal of my work is to provide more flexibility in the sizing of
> > > > SWIOTLB.
> > > > 
> > > > The software IO TLB was designed with these assumptions:
> > > > 
> > > > 1. It would not be used much, especially on 64-bit systems.
> > > > 2. A small fixed memory area (64 MiB by default) is sufficient to
> > > >    handle the few cases which require a bounce buffer.
> > > > 3. 64 MiB is little enough that it has no impact on the rest of the
> > > >    system.
> > > > 
> > > > First, if SEV is active, all DMA must be done through shared
> > > > unencrypted pages, and SWIOTLB is used to make this happen without
> > > > changing device drivers. The software IO TLB size is increased to
> > > > 6% of total memory in sev_setup_arch(), but that is more of an
> > > > approximation. The actual requirements may vary depending on the
> > > > amount of I/O and which drivers are used. These factors may not be
> > > > know at boot time, i.e. when SWIOTLB is allocated.
> > > > 
> > > > Second, other colleagues have noticed that they can reliably get
> > > > rid of occasional OOM kills on an Arm embedded device by reducing
> > > > the SWIOTLB size. This can be achieved with a kernel parameter, but
> > > > determining the right value puts additional burden on pre-release
> > > > testing, which could be avoided if SWIOTLB is allocated small and
> > > > grows only when necessary.  
> > > 
> > > Now that merging into 6.4 has begun, what about this patch series? I'm
> > > eager to get some feedback (positive or negative) and respin the next
> > > version.  
> > 
> > It's the merge window, we can't add new things that haven't been in
> > linux-next already.
> 
> This is understood. I'm not asking for immediate inclusion.
> 
> >   Please resubmit it after -rc1 is out.
> 
> If you can believe that rebasing to -rc1 will be enough, then I will
> also try to believe I'm lucky. ;-)
> 
> The kind of feedback I really want to get is e.g. about the extra
> per-device DMA-specific fields. If they cannot be added to struct
> device, then I'd rather start discussing an interim solution, because
> getting all existing DMA fields out of that struct will take a lot of
> time...

I thought the goal was to get them out of the device and into the bus
instead right?  Or was it the other way around?  I can't remember
anymore, sorry...

greg k-h
