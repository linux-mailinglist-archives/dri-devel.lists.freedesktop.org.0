Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 814AE72A092
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 18:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C4C10E144;
	Fri,  9 Jun 2023 16:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846B810E144;
 Fri,  9 Jun 2023 16:48:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 58DA1659F6;
 Fri,  9 Jun 2023 16:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7117EC433EF;
 Fri,  9 Jun 2023 16:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686329331;
 bh=wj6ps6y4ft6WvpJQrBdcLusOhuloDy4bHnascQVlTT0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=O4xMnvyru9ylkQLSbinraMlwoqqoCRzqiohujByEGtJFDGMM2+bIqDUl5eHnyQxXo
 rY6Jt+s9J9b2BJMm3LdqlppNkZafwg1ABQk0do5vWtrwv0HjpULglS2SDN2D6aMymp
 CWxzgfiCmay+hbv7MVTWZ0mdVEp8uqGYXaqtxKSQkL5P7BHI2KgvO4BKLhYRuItyUe
 b1MGXu2c7L7tT5+p5OajerVERb9IENBTZBVZNst9tkM+K3jNo95v+iyFA8Z0Q9QZCe
 4IkGGUvPbx+9E+dUiQyq/RGdROHaFJmb7Ilr8VJ8sFWFpVVNEi3FletAovP7YIwJSa
 +jJM45seUVXUw==
Date: Fri, 9 Jun 2023 11:48:50 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [Intel-gfx] [PATCH v3 4/4] PCI/VGA: introduce is_boot_device
 function callback to vga_client_register
Message-ID: <20230609164850.GA1251187@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d2ba099-9817-13be-c85b-997211443119@loongson.cn>
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
Cc: Pan Xinhui <Xinhui.Pan@amd.com>, kvm@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Yi Liu <yi.l.liu@intel.com>,
 Karol Herbst <kherbst@redhat.com>, amd-gfx@lists.freedesktop.org,
 Sui Jingfeng <15330273260@189.cn>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ben Skeggs <bskeggs@redhat.com>, linux-pci@vger.kernel.org,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Kevin Tian <kevin.tian@intel.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Bokun Zhang <Bokun.Zhang@amd.com>,
 intel-gfx@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 loongson-kernel@lists.loongnix.cn,
 Alex Williamson <alex.williamson@redhat.com>,
 Abhishek Sahu <abhsahu@nvidia.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Li Yi <liyi@loongson.cn>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 linux-kernel@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 09, 2023 at 10:27:39AM +0800, Sui Jingfeng wrote:
> On 2023/6/9 03:19, Bjorn Helgaas wrote:
> > On Thu, Jun 08, 2023 at 07:43:22PM +0800, Sui Jingfeng wrote:
> > > From: Sui Jingfeng <suijingfeng@loongson.cn>
> > > 
> > > The vga_is_firmware_default() function is arch-dependent, which doesn't
> > > sound right. At least, it also works on the Mips and LoongArch platforms.
> > > Tested with the drm/amdgpu and drm/radeon drivers. However, it's difficult
> > > to enumerate all arch-driver combinations. I'm wrong if there is only one
> > > exception.
> > > 
> > > With the observation that device drivers typically have better knowledge
> > > about which PCI bar contains the firmware framebuffer, which could avoid
> > > the need to iterate all of the PCI BARs.
> > > 
> > > But as a PCI function at pci/vgaarb.c, vga_is_firmware_default() is
> > > probably not suitable to make such an optimization for a specific device.
> > > 
> > > There are PCI display controllers that don't have a dedicated VRAM bar,
> > > this function will lose its effectiveness in such a case. Luckily, the
> > > device driver can provide an accurate workaround.
> > > 
> > > Therefore, this patch introduces a callback that allows the device driver
> > > to tell the VGAARB if the device is the default boot device. This patch
> > > only intends to introduce the mechanism, while the implementation is left
> > > to the device driver authors. Also honor the comment: "Clients have two
> > > callback mechanisms they can use"
> > s/bar/BAR/ (several)
> > 
> > Nothing here uses the callback.  I don't want to merge this until we
> > have a user.
> 
> This is chicken and egg question.
> 
> If you could help get this merge first, I will show you the first user.
> 
> > I'm not sure why the device driver should know whether its device is
> > the default boot device.
> 
> It's not that the device driver should know,
> 
> but it's about that the device driver has the right to override.
> 
> Device driver may have better approach to identify the default boot
> device.

The way we usually handle this is to include the new callback in the
same series as the first user of it.  That has two benefits:
(1) everybody can review the whole picture and possibly suggest
different approaches, and (2) when we merge the infrastructure,
we also merge a user of it at the same time, so the whole thing can be
tested and we don't end up with unused code.

Bjorn
