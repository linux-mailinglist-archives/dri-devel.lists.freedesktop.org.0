Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BA56EF43F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 14:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994C010E2CE;
	Wed, 26 Apr 2023 12:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D21710E2CE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 12:26:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 00F5C62F13;
 Wed, 26 Apr 2023 12:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C57C433EF;
 Wed, 26 Apr 2023 12:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1682511999;
 bh=cdI2zaKgoeVH8+lh7QkDEcGOwMPtzMzzDqC1Ob1nKds=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qnOqm7ybgwu+DC68iZtWPjdOTym6MH7XxTN2/p31qzx99QWiUJFxjFpek/am/RsjL
 J78JpEkD/lO49If6n8utrPfZrNtelum+LW9DYynU1hPJC7QnHXYzPZdECqdd0aVD7D
 VlWhKvBu7PcmbTjDYaHQSB/lz1VE7E3fYaXez6xA=
Date: Wed, 26 Apr 2023 14:26:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Subject: Re: [PATCH v2 0/7] Allow dynamic allocation of software IO TLB
 bounce buffers
Message-ID: <2023042617-wobble-enlighten-9361@gregkh>
References: <cover.1681898595.git.petr.tesarik.ext@huawei.com>
 <20230426141520.0caf4386@meshulam.tesarici.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230426141520.0caf4386@meshulam.tesarici.cz>
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

On Wed, Apr 26, 2023 at 02:15:20PM +0200, Petr Tesařík wrote:
> Hi,
> 
> On Wed, 19 Apr 2023 12:03:52 +0200
> Petr Tesarik <petrtesarik@huaweicloud.com> wrote:
> 
> > From: Petr Tesarik <petr.tesarik.ext@huawei.com>
> > 
> > The goal of my work is to provide more flexibility in the sizing of
> > SWIOTLB.
> > 
> > The software IO TLB was designed with these assumptions:
> > 
> > 1. It would not be used much, especially on 64-bit systems.
> > 2. A small fixed memory area (64 MiB by default) is sufficient to
> >    handle the few cases which require a bounce buffer.
> > 3. 64 MiB is little enough that it has no impact on the rest of the
> >    system.
> > 
> > First, if SEV is active, all DMA must be done through shared
> > unencrypted pages, and SWIOTLB is used to make this happen without
> > changing device drivers. The software IO TLB size is increased to
> > 6% of total memory in sev_setup_arch(), but that is more of an
> > approximation. The actual requirements may vary depending on the
> > amount of I/O and which drivers are used. These factors may not be
> > know at boot time, i.e. when SWIOTLB is allocated.
> > 
> > Second, other colleagues have noticed that they can reliably get
> > rid of occasional OOM kills on an Arm embedded device by reducing
> > the SWIOTLB size. This can be achieved with a kernel parameter, but
> > determining the right value puts additional burden on pre-release
> > testing, which could be avoided if SWIOTLB is allocated small and
> > grows only when necessary.
> 
> Now that merging into 6.4 has begun, what about this patch series? I'm
> eager to get some feedback (positive or negative) and respin the next
> version.

It's the merge window, we can't add new things that haven't been in
linux-next already.   Please resubmit it after -rc1 is out.

thanks,

greg k-h
