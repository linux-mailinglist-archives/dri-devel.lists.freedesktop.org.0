Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 587616F01EC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 09:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6766810EAD0;
	Thu, 27 Apr 2023 07:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1754 seconds by postgrey-1.36 at gabe;
 Wed, 26 Apr 2023 12:44:44 UTC
Received: from bee.tesarici.cz (bee.tesarici.cz [IPv6:2a03:3b40:fe:2d4::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD9010E0BE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 12:44:44 +0000 (UTC)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id CA0C9165337;
 Wed, 26 Apr 2023 14:44:40 +0200 (CEST)
Authentication-Results: mail.tesarici.cz;
 dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
 t=1682513081; bh=TUvWyN8jrQgQ7QsrJmJ6ZjN4uMqDIuUrXKhGCfiOkT4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W9ZadZpoOR/aiQ3ArOSxYlCe4i81AoAJ2X36fC/6cYva7r6B6NKzsh7xS8FB1MZCA
 ghC5/ZaJl5If6DnpEnLvxseVebYHoee5ytSORNXCiH4AvSGmzfow6fTL5xG21KGXKr
 3MBq6vh3NSBopuWhUDcbCWpJNFjf9JcqlWLT+Gz6oy7HG/11IwZTrJNDomATw8u7a2
 gDdYRuHACnfzoQ5c99yHxDV8QCfKWZFD+7KKEK1eGLWUbdaJuSXF+KBMAqFghkrW/D
 s7GKjvo14gtjI37/6t8zfyh9wWDL7tHklrNDb2N8mrGVRNlAbxkS84kZ1lvFwVMR7h
 /O8vY9/sPtH3g==
Date: Wed, 26 Apr 2023 14:44:39 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 0/7] Allow dynamic allocation of software IO TLB
 bounce buffers
Message-ID: <20230426144439.5674f8bc@meshulam.tesarici.cz>
In-Reply-To: <2023042617-wobble-enlighten-9361@gregkh>
References: <cover.1681898595.git.petr.tesarik.ext@huawei.com>
 <20230426141520.0caf4386@meshulam.tesarici.cz>
 <2023042617-wobble-enlighten-9361@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 27 Apr 2023 07:38:49 +0000
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
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:DMA
 MAPPING HELPERS" <iommu@lists.linux.dev>, Borislav Petkov <bp@suse.de>,
 Won Chung <wonchung@google.com>, Thomas Zimmermann <tzimmermann@suse.de>,
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

Hi Greg,

On Wed, 26 Apr 2023 14:26:36 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Wed, Apr 26, 2023 at 02:15:20PM +0200, Petr Tesa=C5=99=C3=ADk wrote:
> > Hi,
> >=20
> > On Wed, 19 Apr 2023 12:03:52 +0200
> > Petr Tesarik <petrtesarik@huaweicloud.com> wrote:
> >  =20
> > > From: Petr Tesarik <petr.tesarik.ext@huawei.com>
> > >=20
> > > The goal of my work is to provide more flexibility in the sizing of
> > > SWIOTLB.
> > >=20
> > > The software IO TLB was designed with these assumptions:
> > >=20
> > > 1. It would not be used much, especially on 64-bit systems.
> > > 2. A small fixed memory area (64 MiB by default) is sufficient to
> > >    handle the few cases which require a bounce buffer.
> > > 3. 64 MiB is little enough that it has no impact on the rest of the
> > >    system.
> > >=20
> > > First, if SEV is active, all DMA must be done through shared
> > > unencrypted pages, and SWIOTLB is used to make this happen without
> > > changing device drivers. The software IO TLB size is increased to
> > > 6% of total memory in sev_setup_arch(), but that is more of an
> > > approximation. The actual requirements may vary depending on the
> > > amount of I/O and which drivers are used. These factors may not be
> > > know at boot time, i.e. when SWIOTLB is allocated.
> > >=20
> > > Second, other colleagues have noticed that they can reliably get
> > > rid of occasional OOM kills on an Arm embedded device by reducing
> > > the SWIOTLB size. This can be achieved with a kernel parameter, but
> > > determining the right value puts additional burden on pre-release
> > > testing, which could be avoided if SWIOTLB is allocated small and
> > > grows only when necessary. =20
> >=20
> > Now that merging into 6.4 has begun, what about this patch series? I'm
> > eager to get some feedback (positive or negative) and respin the next
> > version. =20
>=20
> It's the merge window, we can't add new things that haven't been in
> linux-next already.

This is understood. I'm not asking for immediate inclusion.

>   Please resubmit it after -rc1 is out.

If you can believe that rebasing to -rc1 will be enough, then I will
also try to believe I'm lucky. ;-)

The kind of feedback I really want to get is e.g. about the extra
per-device DMA-specific fields. If they cannot be added to struct
device, then I'd rather start discussing an interim solution, because
getting all existing DMA fields out of that struct will take a lot of
time...

Thanks,
Petr T
