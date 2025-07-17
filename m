Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B80B09841
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 01:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E9610E8B4;
	Thu, 17 Jul 2025 23:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QalwuOgE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7162710E8B4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 23:40:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B0E59A57A28;
 Thu, 17 Jul 2025 23:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43832C4CEEB;
 Thu, 17 Jul 2025 23:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752795625;
 bh=SLWT0EwWugKFmXyWBecyX2YOOzE33RWcso9rWV+H+sc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=QalwuOgEJQSJY/yW6nKuzzLXbQZLPRKCvV0T1SXwb6GxQdFSJNxowxsAUFlBl4YRr
 z41IVtyibynhfAmmseTwhzaNDDBW9PDORLw3KO1OV8TCp6HnniX3uH9dYwrvGgNBJQ
 r0+7c/492WzE+HSMsGR7rmaHkz16QtCYVkK4rknt7z8O8e1B7+vGYlBL/XWeN0gUsU
 dpU31xZYKXnkJ83x4CT1gOJ4bk4JpvE7tR9YNWmQIDwE4TCiwLbJ14yAaI2OKm4wEY
 CxViozkMHDpsTqbEJnoOJJ2qzZ13FOxs4a7ZL5u4CLKcOTDgteW0psfSnEBVNAyvIr
 7CEZ8x2zJLPyg==
Date: Thu, 17 Jul 2025 18:40:24 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Hans de Goede <hansg@kernel.org>, Andi Kleen <ak@linux.intel.com>,
 David Airlie <airlied@redhat.com>,
 Ben Hutchings <ben@decadent.org.uk>, Joerg Roedel <joro@8bytes.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ahmed Salem <x0rw3ll@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v2] agp/amd64: Check AGP Capability before binding to
 unsupported devices
Message-ID: <20250717234024.GA2663372@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGvShrJJTj2ERdZr@wunner.de>
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

On Mon, Jul 07, 2025 at 03:58:30PM +0200, Lukas Wunner wrote:
> On Mon, Jul 07, 2025 at 02:53:32PM +0200, Hans de Goede wrote:
> > So I think we should move forward with Lukas' fix dor 6.16 and then
> > my patch to disable probing of unsupported devices by default can
> > be merged into linux-next .
> 
> Sounds good to me.
> 
> Dave is out all week and has not commented on this matter at all so far:
> 
> https://lore.kernel.org/r/CAPM=9tzrmRS9++MP_Y4ab95W71UxjFLzTd176Mok7akwdT2q+w@mail.gmail.com/
> 
> I assume Bjorn may not be comfortable applying my patch without an ack
> from Dave.  I am technically able to apply my own patch through drm-misc
> and I believe Hans' Reviewed-by is sufficient to allow me to do that.
> 
> I'd feel more comfortable having additional acks or Reviewed-by's though.
> I'm contemplating applying the patch to drm-misc by Wednesday evening,
> that would allow it to land in Linus' tree before v6.16-rc6.
> 
> If anyone has objections, needs more time to review or wants to apply
> the patch, please let me know.

Looks like this is now upstream:
https://git.kernel.org/linus/d88dfb756d55 ("agp/amd64: Check AGP Capability before binding to unsupported devices")

Seems OK to me, but I'm certainly not an AGP expert.

Bjorn
