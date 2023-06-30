Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6601744178
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 19:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD4B10E4D3;
	Fri, 30 Jun 2023 17:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA20410E4D2;
 Fri, 30 Jun 2023 17:41:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 38043617C5;
 Fri, 30 Jun 2023 17:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45920C433C0;
 Fri, 30 Jun 2023 17:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688146918;
 bh=oBuH5pzv1m4U165eHXlxwEABZcjqI8yl/lnDYOcl6ZI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=A7CbpXg3brFiPOI2ytxu8IpWxHI3M+/swPov9cHayuiqO9cMATSG6c4ez6MFGNO0z
 Ru8EowGY/rqrRQIZwEhDZTnk+iduM52sCwhkWlTTCl8+a5J9Km01kl5HI3fQzFq2Lq
 wOjgPd6RxDUg7m4ocetVdyjL+MealrAsXh9h9PMnDDoFqivVT/qQoq3c/TGjtjiqN/
 eHYBXPGgPFhstAo0o8ix5t3xiMpkLqrACIll6PSfK9pdsSXGZRuCxFRzU8s+FYzCAc
 zL43+fczW0etE3m5c1GVglsbsvMe5lL55YAga1mOHJkaKrmOGii/a/rGs1ilq7P74h
 ZnlgoVz7lUrlg==
Date: Fri, 30 Jun 2023 12:41:56 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: suijingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH v7 6/8] PCI/VGA: Introduce is_boot_device function
 callback to vga_client_register
Message-ID: <20230630174156.GA487980@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c81fbe3-308a-4c5e-0150-32006253b3ea@loongson.cn>
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Chai,
 Thomas" <YiPeng.Chai@amd.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>, "Gao, Likun" <Likun.Gao@amd.com>,
 Yi Liu <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "15330273260@189.cn" <15330273260@189.cn>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Kevin Tian <kevin.tian@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 "Zhang, Bokun" <Bokun.Zhang@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Abhishek Sahu <abhsahu@nvidia.com>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 30, 2023 at 10:14:11AM +0800, suijingfeng wrote:
> On 2023/6/30 01:44, Limonciello, Mario wrote:
> > > On 2023/6/29 23:54, Bjorn Helgaas wrote:
> > > > On Thu, Jun 22, 2023 at 01:08:15PM +0800, Sui Jingfeng wrote:

> > > > 4) Right now we're in the middle of the v6.5 merge window, so new
> > > >      content, e.g., this series, is too late for v6.5.  Most
> > > >      maintainers, including me, wait to merge new content until the
> > > >      merge window closes and a new -rc1 is tagged.  This merge window
> > > >      should close on July 9, and people will start merging content for
> > > >      v6.6, typically based on v6.5-rc1.
> > > 
> > > Would you will merge all of the patches in this series (e.g. including
> > > the patch for drm/amdgpu(7/8) and drm/radeon(8/8)) ?
> > > 
> > > Or just part of them?

The bulk of this series is drivers/pci changes, so typically I would
merge all the patches after getting Acked-by tags from the other
subsystems (DRM and VFIO).

> Is it possible to merge the PCI/VGA part as fast as possible,
> especially the PATCH-0006 PCI/VGA: Introduce is_boot_device function
> callback to vga_client_register

We're in the middle of the v6.5 merge window, so it's too late to add
things to v6.5-rc1.  The most likely path for new material like this
would be to queue it for v6.6, which means I would merge it after
v6.5-rc1 is tagged (that tag will probably happen on July 9).

It would then be in -next until the v6.6 merge window opens (likely in
September), when it would be merged into Linus' tree.

If the series fixes a regression or other major defect, it's
*possible* to merge things earlier, so they appear in v6.5.  But this
series doesn't seem to fall in that category, so I think v6.6 is a
more realistic target.

Merging for v6.6 would include both the PCI parts and the DRM parts at
the same time, so hopefully that addresses your dependency concerns.

I suggest that you wait until v6.5-rc1, rebase your patches so they
apply cleanly on that tag, collect all the Reviewed-by and Acked-by
tags, include them in your commit logs, and then repost them.

Bjorn
