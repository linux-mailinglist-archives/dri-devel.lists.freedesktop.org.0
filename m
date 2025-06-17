Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308B4ADDE2F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 23:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F250310E191;
	Tue, 17 Jun 2025 21:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BoDRcv46";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A328810E112
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 21:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750197006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fBKdNTag+8kHHBGbrlvR1RGtOCqp0CC7Lr8789j1j90=;
 b=BoDRcv46lkSSl7ihlC+APm9cSE7dlpN510TZEkGzC7RRfxvHBd+dgqNPRhdpiDmLxJqHOv
 Md3K6Lz/UWeifJhvICdRXjvJrxx61ilJQWhmDB2CrPuF1uZlgOPkC7ir/ViVXpqwcKx0vC
 2eOpzD98lSHnpGdNEbji6LjaWR9B2f8=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-U7wDpssZMAiNmAbNAdsxYQ-1; Tue, 17 Jun 2025 17:50:03 -0400
X-MC-Unique: U7wDpssZMAiNmAbNAdsxYQ-1
X-Mimecast-MFC-AGG-ID: U7wDpssZMAiNmAbNAdsxYQ_1750197002
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-875fff4d6afso36392639f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 14:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750197002; x=1750801802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fBKdNTag+8kHHBGbrlvR1RGtOCqp0CC7Lr8789j1j90=;
 b=NNWYDSytchWKXkb6+XadAiHGb9jCQLtQRJkAE9H3c3Z8XwlF0/nOymEUjBZS+Jrpbz
 Bk4Oe+652WPJFa+6oVNQjJwzvhZyxHNlJ91RrwCrFMZw0z2HvuhoiYPMkldKcfXPmZnQ
 Yd1Dj20h8XNi2j79v9Hb8yr5xK3CZeVjcxZYIdE+bznCV3BrpYXE4bQjXEwusDVMhbRJ
 n7j7sd2aK8LC2hSrnNlsiWdYN5s9VrW6S3M/mYGf7genSn7YiVrefaKWpUIDTeSaaIIC
 3gMhyEcTXZqsHkxaOrTMMUATjdSZFx5+rH+BsIho7OWuq6MukSwS1k1vfWfxuYn5xO0b
 aAjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7oKCbN9OKc/v8NC3VW2DKioG1xUPIxQ6jdVrmV1v5qGm74mbQ4hWtIKGR9zy2XysduW1T9qJ65Y8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywh0lIwsi7yb7EZNhg0xDNptEzeRCkSVBKlSIvlCWU63sidmXmV
 gMl1rOapxSV3ONLysLzclc++xw/cvFZbCkfc4aLoiUGZk8a+p2lqzEL4+hiWwcmck8YyzqOyjaR
 lz/ymFevMwxGXPjgDcxpVUwULDQ7KnqUZ/Lvg2OAj0kDP7t4J22FM53yQ1TPBN6SNbtXsaQ==
X-Gm-Gg: ASbGncv8QbIrq1GAz3t7FLmEq8tNQhAtP383wlC4HM+ZJ5lae2q75+u3+9ccjQPtUZG
 ESNoIuDma4d4lBxx8Wnn6GBBpW8Y9PToYy700Fd1BEeqswcVJypGu1BYfmBrgHEAYnlyHrLKtRi
 QlBn4gdYj3HtvGqAn1DA1/pTO4pniBzITFe0uGCpqwQtV7ermQfAnIPEQoXtz47B7z+XLOk+nZD
 VQXclMXm1L08ZC93ve8CwQLv13iRHzqjt21GIU3k03q62dZhTVezinUPZyHQr/djf4Zlm9t0dxP
 YLXJCKOkkNkZ1VXLKGY6pd3wIg==
X-Received: by 2002:a92:c267:0:b0:3dc:7ba2:7a2e with SMTP id
 e9e14a558f8ab-3de07cd4de3mr48365935ab.3.1750197002228; 
 Tue, 17 Jun 2025 14:50:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEw17zHi8Y9Wb/PhxrxSkYd31JRhlQUJWVwqBEfsj4LLkKjncc5bMw2gyst2ZndPGvwl0QioA==
X-Received: by 2002:a92:c267:0:b0:3dc:7ba2:7a2e with SMTP id
 e9e14a558f8ab-3de07cd4de3mr48365855ab.3.1750197001760; 
 Tue, 17 Jun 2025 14:50:01 -0700 (PDT)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-50149bb529fsm2445872173.60.2025.06.17.14.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jun 2025 14:50:01 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:49:57 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Daniel Dadap <ddadap@nvidia.com>
Cc: Mario Limonciello <superm1@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Lukas Wunner
 <lukas@wunner.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Woodhouse <dwmw2@infradead.org>, Lu Baolu
 <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:INTEL IOMMU (VT-d)"
 <iommu@lists.linux.dev>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:VFIO DRIVER" <kvm@vger.kernel.org>,
 "open list:SOUND" <linux-sound@vger.kernel.org>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: Re: [PATCH v2 6/6] vgaarb: Look at all PCI display devices in VGA
 arbiter
Message-ID: <20250617154957.67144f0a.alex.williamson@redhat.com>
In-Reply-To: <aFHWejvqNpGv-3UI@ddadap-lakeline.nvidia.com>
References: <20250617175910.1640546-1-superm1@kernel.org>
 <20250617175910.1640546-7-superm1@kernel.org>
 <aFHABY5yTYrJ4OUw@ddadap-lakeline.nvidia.com>
 <d40a585f-6eca-45dd-aa9f-7dcda065c80a@kernel.org>
 <aFHWejvqNpGv-3UI@ddadap-lakeline.nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hHtMfd6_a7mOsb18FnNkMzD9pM3B6nK5AZSs_t2UHmw_1750197002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 17 Jun 2025 15:56:26 -0500
Daniel Dadap <ddadap@nvidia.com> wrote:

> On Tue, Jun 17, 2025 at 03:15:35PM -0500, Mario Limonciello wrote:
> > 
> > 
> > On 6/17/25 2:20 PM, Daniel Dadap wrote:  
> > > On Tue, Jun 17, 2025 at 12:59:10PM -0500, Mario Limonciello wrote:  
> > > > From: Mario Limonciello <mario.limonciello@amd.com>
> > > > 
> > > > On a mobile system with an AMD integrated GPU + NVIDIA discrete GPU the
> > > > AMD GPU is not being selected by some desktop environments for any
> > > > rendering tasks. This is because neither GPU is being treated as
> > > > "boot_vga" but that is what some environments use to select a GPU [1].
> > > > 
> > > > The VGA arbiter driver only looks at devices that report as PCI display
> > > > VGA class devices. Neither GPU on the system is a PCI display VGA class
> > > > device:
> > > > 
> > > > c5:00.0 3D controller: NVIDIA Corporation Device 2db9 (rev a1)
> > > > c6:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] Device 150e (rev d1)
> > > > 
> > > > If the GPUs were looked at the vga_is_firmware_default() function actually
> > > > does do a good job at recognizing the case from the device used for the
> > > > firmware framebuffer.
> > > > 
> > > > Modify the VGA arbiter code and matching sysfs file entries to examine all
> > > > PCI display class devices. The existing logic stays the same.
> > > > 
> > > > This will cause all GPUs to gain a `boot_vga` file, but the correct device
> > > > (AMD GPU in this case) will now show `1` and the incorrect device shows `0`.
> > > > Userspace then picks the right device as well.
> > > > 
> > > > Link: https://github.com/robherring/libpciaccess/commit/b2838fb61c3542f107014b285cbda097acae1e12 [1]
> > > > Suggested-by: Daniel Dadap <ddadap@nvidia.com>
> > > > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > > > ---
> > > >   drivers/pci/pci-sysfs.c | 2 +-
> > > >   drivers/pci/vgaarb.c    | 8 ++++----
> > > >   2 files changed, 5 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> > > > index 268c69daa4d57..c314ee1b3f9ac 100644
> > > > --- a/drivers/pci/pci-sysfs.c
> > > > +++ b/drivers/pci/pci-sysfs.c
> > > > @@ -1707,7 +1707,7 @@ static umode_t pci_dev_attrs_are_visible(struct kobject *kobj,
> > > >   	struct device *dev = kobj_to_dev(kobj);
> > > >   	struct pci_dev *pdev = to_pci_dev(dev);
> > > > -	if (a == &dev_attr_boot_vga.attr && pci_is_vga(pdev))
> > > > +	if (a == &dev_attr_boot_vga.attr && pci_is_display(pdev))
> > > >   		return a->mode;  
> > > 
> > > I can't help but worry about userspace clients that might be checking for
> > > the presence of the boot_vga sysfs file but don't check its contents.  
> > 
> > Wouldn't those clients "already" be broken by such an assumption?
> > We know today that there are systems with two VGA devices in them too.
> >  
> 
> Yes, for systems with multiple VGA devices, which is an uncommon case. I
> think that on systems with one VGA device and one 3D device, which is
> probably the most common case, this change might break such clients.

FWIW, this is exactly the opposite of what I'd expect is the common
case.  IME, an integrated GPU and discrete GPU, or multiple discrete
GPUs are all VGA devices.

> > I'd think those should have both GPUs exporting a file and one having a 0
> > the other 1.  
> 
> Yeah, agreed. I'd consider it a userspace bug if the client only tests for
> the presence of the file but doesn't look at its contents, but it's still
> preferable not to break (hypothetical, buggy) clients unnecessarily. One
> could make a philosophical argument that "boot_vga" should really mean VGA
> subclass, as the name implies, but even so I think that, in lieu of a new
> interface to report what the desktop environments are actually trying to
> test for (which nobody uses yet because it doesn't exist), exposing the
> boot_vga file for a non-VGA GPU in the special case of there being zero
> VGA GPUs on the system is a reasonable and practical compromise to allow
> existing code to work on the zero-VGA systems.
> 
> I think it ultimately comes down to a semantic argument about what "VGA"
> is really supposed to mean here. There's the real, honest-to-goodness VGA
> interface with INT 10h and VBE, and then there's the common de facto sort
> of shorthand convention (commonly but not universally followed) where VGA
> means it can drive displays and 3D means it can't. It used to be the case
> (at least on x86) that display controllers which could drive real display
> hardware were always VGA-compatible, and display controllers were not VGA
> compatible could never drive real display hardware, which I think is how
> that convention originated, but on UEFI systems with no CSM support, it's
> not necessarily true any more. However, there's so much existing software
> out there that conflates VGA-ness with display-ness that some controllers
> with no actual VGA support get listed with the VGA controller subclass to
> avoid breaking such software.
> 
> If you go by the language of the definitions for the subclasses of PCI
> base class 03h, it seems pretty clear that the VGA subclass is supposed
> to mean actually compatible with real honest-to-goodness VGA. So those
> non-VGA devices that pretend to be VGA for software compatibility aren't
> following the spec. I'd be willing to wager that the system in question
> is being accurate when it says that it has no VGA controllers. It is
> arguably a userspace bug that these desktop environments are testing for
> "VGA" when they really probably mean something else, but it will probably
> take some time to hunt down everything that's relying on boot_vga for
> possibly wrong reasons, and I think the pragmatic option is to lie about
> it until we have a better way to test for whatever the desktops really
> want to know, and that better way is widely used. But it would be nice to
> limit the lying to cases where it unbreaks things if we can.

I don't know if you have wiggle room with boot_vga specifically, I
generally take it at face value that it's a VGA device and imo seems
inconsistent to suggest otherwise.  I do note however that there's
really no philosophical discussion related to the VGA arbiter, it is
managing devices and routing among them according to the strict PCI
definition of VGA.

Elsewhere in the kernel we can see that vga_default_device() is being
used for strictly VGA related things, the VGA shadow ROM and legacy VGA
resource aperture resolution for instance.  It's unfortunate that the
x86 video_is_primary_device() relies on it, but that seems like a
growing pain of introducing non-VGA displays on a largely legacy
encumbered architecture and should be addressed.

Note that it should probably be considered whether VGA_ARB_MAX_GPUS
needs a new default value if all display adapters were to be included.
Thanks,

Alex

