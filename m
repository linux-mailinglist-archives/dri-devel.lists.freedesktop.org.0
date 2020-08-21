Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9DD24E284
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 23:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9726EC15;
	Fri, 21 Aug 2020 21:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE1E6EC0F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 21:17:30 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id a26so4084743ejc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 14:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Czkv47Mapytq1xHY+oPYH574MMmQySGYRJkgBW3lM+E=;
 b=GXn5QvE0B4fW4XfVmy6nF7VEmR25ramQstv7uYApzkRaODFrVdOXnM1zTZ6Wsmibwy
 dPfmTNTs899e7OIe+phFR2chos0Ft2tgG9zqM01uVVZPmE29arGNgsIzosvPzhSWUnGe
 J3wNyPfrnyhgIVWAU45//p0AhY4mBc6FUmzeNpTdQDSCbuWVi6ai4sl/4TKN7Bd6ypw8
 5lZeOIWb5H2+OaFKo947ypFBddehhnskfMBHe4gMQN+LdPUupi+433hVBX7NeDX/oBC5
 TgSqJ5flLj3v0348Ps+2DpHLbXs1TxDkDp2CaVgcTvVCd7lwN8q+51xsM4whGP0VMhL1
 x6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Czkv47Mapytq1xHY+oPYH574MMmQySGYRJkgBW3lM+E=;
 b=r2T90dpz/w/OO5EVLLyb+4y3WjLEbleTFlcUXUEhUh2//WvWY5JfGY/HMCf82sBBOz
 WFsttQOfDSTAOkSltTS3VdfHe+6mZZue0EzxYE/og9GEmUFL9CvQnhwtftS0c0uclkB8
 fZIa9tFkZyR0J/V+wkGpOm1FUVEJv8JqdtzdibP2lfsPGJaJtZtGQyZpSsQF4QlhK5P9
 iAyelntnB9oQLaf3rAggAtjfJs7z2Fe0wOL8DPRTmu/ISj32/T5JtHhy0LlCkIwJ9zIt
 ws2pKuVXTEq4z9U3L6TtLEPb+fsW45vRVSN7cimhbYtqFZoPPFGmzaKTZ9SgNIKHXDne
 ZdyA==
X-Gm-Message-State: AOAM533Uc+rZyhABdiLAMBkTSJYmyWcB6nNBXlEwOr831+fd6OgxZwjs
 TPqbyTRsFtVgJ6m3T5pjVxHvptsBFHW+RAcnZiU/oQ==
X-Google-Smtp-Source: ABdhPJw7R+XywZgNxGuYeGtmKWkV2KF0ClltQZXGVP6GBaNPhi5e1DOir94iWrkYJw3POQerQKgrC5Sthl/6YvvLxa0=
X-Received: by 2002:a17:907:10d9:: with SMTP id
 rv25mr4570332ejb.264.1598044649266; 
 Fri, 21 Aug 2020 14:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <159643094279.4062302.17779410714418721328.stgit@dwillia2-desk3.amr.corp.intel.com>
 <c59111f9-7c94-8b9e-2b8c-4cb96b9aa848@redhat.com>
 <CAPcyv4j8-5nWU5GPDBoFicwR84qM=hWRtd78DkcCg4PW-8i6Vg@mail.gmail.com>
 <6af3de0d-ffdc-8942-3922-ebaeef20dd63@redhat.com>
 <CAPcyv4h=oBnzmP2PHAFX6H2jsNq8zSUzQLYySj0Ke7FAqZwb0A@mail.gmail.com>
 <3dfde5e3-e1e2-2097-afa1-303042de5e07@redhat.com>
In-Reply-To: <3dfde5e3-e1e2-2097-afa1-303042de5e07@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 21 Aug 2020 14:17:18 -0700
Message-ID: <CAPcyv4gTJgZ0jM3oRM8Exs7MKwyNHF5yWNceAFrX7k8KfFcBig@mail.gmail.com>
Subject: Re: [PATCH v4 00/23] device-dax: Support sub-dividing soft-reserved
 ranges
To: David Hildenbrand <david@redhat.com>
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
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@ozlabs.org>, Linux MM <linux-mm@kvack.org>,
 Michael Ellerman <mpe@ellerman.id.au>, "H. Peter Anvin" <hpa@zytor.com>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Vishal Verma <vishal.l.verma@intel.com>, X86 ML <x86@kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Jeff Moyer <jmoyer@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Ira Weiny <ira.weiny@intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Jia He <justin.he@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wei Yang <richardw.yang@linux.intel.com>, Brice Goglin <Brice.Goglin@inria.fr>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 21, 2020 at 11:30 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 21.08.20 20:27, Dan Williams wrote:
> > On Fri, Aug 21, 2020 at 3:15 AM David Hildenbrand <david@redhat.com> wrote:
> >>
> >>>>
> >>>> 1. On x86-64, e820 indicates "soft-reserved" memory. This memory is not
> >>>> automatically used in the buddy during boot, but remains untouched
> >>>> (similar to pmem). But as it involves ACPI as well, it could also be
> >>>> used on arm64 (-e820), correct?
> >>>
> >>> Correct, arm64 also gets the EFI support for enumerating memory this
> >>> way. However, I would clarify that whether soft-reserved is given to
> >>> the buddy allocator by default or not is the kernel's policy choice,
> >>> "buddy-by-default" is ok and is what will happen anyways with older
> >>> kernels on platforms that enumerate a memory range this way.
> >>
> >> Is "soft-reserved" then the right terminology for that? It sounds very
> >> x86-64/e820 specific. Maybe a compressed for of "performance
> >> differentiated memory" might be a better fit to expose to user space, no?
> >
> > No. The EFI "Specific Purpose" bit is an attribute independent of
> > e820, it's x86-Linux that entangles those together. There is no
> > requirement for platform firmware to use that designation even for
> > drastic performance differentiation between ranges, and conversely
> > there is no requirement that memory *with* that designation has any
> > performance difference compared to the default memory pool. So it
> > really is a reservation policy about a memory range to keep out of the
> > buddy allocator by default.
>
> Okay, still "soft-reserved" is x86-64 specific, no?

There's nothing preventing other EFI archs, or a similar designation
in another firmware spec, picking up this policy.

>   (AFAIK,
> "soft-reserved" will be visible in /proc/iomem, or am I confusing
> stuff?)

No, you're correct.

> IOW, it "performance differentiated" is not universally
> applicable, maybe  "specific purpose memory" is ?

Those bikeshed colors don't seem an improvement to me.

"Soft-reserved" actually tells you something about the kernel policy
for the memory. The criticism of "specific purpose" that led to
calling it "soft-reserved" in Linux is the fact that "specific" is
undefined as far as the firmware knows, and "specific" may have
different applications based on the platform user. "Soft-reserved"
like "Reserved" tells you that a driver policy might be in play for
that memory.

Also note that the current color of the bikeshed has already shipped since v5.5:

   262b45ae3ab4 x86/efi: EFI soft reservation to E820 enumeration
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
