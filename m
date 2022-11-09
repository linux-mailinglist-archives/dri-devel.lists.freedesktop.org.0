Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA42622CC4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 14:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18D210E5BF;
	Wed,  9 Nov 2022 13:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 442CF10E5BF
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 13:49:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCB121FB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 05:49:55 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5BB1E3F73D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 05:49:49 -0800 (PST)
Date: Wed, 9 Nov 2022 13:49:38 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v4 0/4] drm/arm/hdlcd: use drm managed
 resources
Message-ID: <Y2uv8srKToS9WW5s@e110455-lin.cambridge.arm.com>
References: <20221026153431.72033-1-dakr@redhat.com>
 <Y2VX9Egvh91/u9es@e110455-lin.cambridge.arm.com>
 <c05f7e24-ab3e-f1e8-f553-381755cd5c40@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c05f7e24-ab3e-f1e8-f553-381755cd5c40@redhat.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 08, 2022 at 08:57:55PM +0100, Danilo Krummrich wrote:
> Hi Liviu,

Hi,

> 
> > The only issue that I'm seeing that is not critical is that at reboot/shutdown time
> > I'm getting an "Unexpected global fault, this could be serious" from the smmu:
> > 
> > [ 6893.467910] arm-smmu 7fb30000.iommu: disabling translation
> > [ 6893.473550] ohci-platform 7ffb0000.usb: Removing from iommu group 1
> > [ 6893.479909] ehci-platform 7ffc0000.usb: Removing from iommu group 1
> > [ 6893.486931] arm-smmu 7fb10000.iommu: disabling translation
> > [ 6893.492521] hdlcd 7ff50000.hdlcd: Removing from iommu group 3
> > [ 6893.492650] arm-smmu 7fb10000.iommu: Unexpected global fault, this could be serious
> > [ 6893.505959] arm-smmu 7fb10000.iommu:         GFSR 0x80000001, GFSYNR0 0x00000000, GFSYNR1 0x00000000, GFSYNR2 0x00000000
> > [ 6893.516511] arm-smmu 7fb00000.iommu: disabling translation
> > [ 6893.522195] dma-pl330 7ff00000.dma-controller: Removing from iommu group 2
> > [ 6893.529607] arm-smmu 2b500000.iommu: disabling translation
> > [ 6893.535221] pcieport 0000:00:00.0: Removing from iommu group 0
> > [ 6893.541135] pci 0000:01:00.0: Removing from iommu group 0
> > [ 6893.546604] pcieport 0000:02:01.0: Removing from iommu group 0
> > [ 6893.552511] pcieport 0000:02:02.0: Removing from iommu group 0
> > [ 6893.558418] pcieport 0000:02:03.0: Removing from iommu group 0
> > [ 6893.564329] pcieport 0000:02:0c.0: Removing from iommu group 0
> > [ 6893.570393] pcieport 0000:02:10.0: Removing from iommu group 0
> > [ 6893.576314] pcieport 0000:02:1f.0: Removing from iommu group 0
> > [ 6893.582214] sata_sil24 0000:03:00.0: Removing from iommu group 0
> > [ 6893.588270] sky2 0000:08:00.0: Removing from iommu group 0
> > [ 6893.594616] reboot: Power down
> > 
> > 
> > The reboot/shutdown succeeds, so I'm not too worried about it for now, but hope that
> > this is something you'll keep in mind in the later series when you do drm_dev_unplug().
> 
> Yes, I'd expect this to be related to the missing protection of platform
> device bound resources.
> 
> > 
> > With that, for the whole series:
> > 
> > Acked-by: Liviu Dudau <liviu.dudau@arm.com>
> > 
> > Thanks for the patience and going through the series iterations with me.
> > 
> > I can pull this series into drm-misc-next on Monday if you don't have any other plans.
> Thanks, I saw you already applied the series.
> 
> Have you had a look on the same series for malidp?

Yes, I've looked at the code and it looks reasonable, I just wanted to run it once
through the minimum of tests that I use, which involves switching some FPGA images
around. Hope to do that today or tomorrow.

Best regards,
Liviu

> 
> - Danilo
> 
> > 
> > Best regards,
> > Liviu
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
