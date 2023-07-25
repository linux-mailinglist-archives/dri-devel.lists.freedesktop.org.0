Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C828D7624C9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 23:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C617310E1A7;
	Tue, 25 Jul 2023 21:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0F610E1BB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 21:49:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EF66961909;
 Tue, 25 Jul 2023 21:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E68EC433C8;
 Tue, 25 Jul 2023 21:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690321770;
 bh=wvQn3+vfatEE94wZppEmqQCo2ZDZzADNKAHxArXYbSU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=dw0O1jwfdcV80JDUixD/4nRJSXX4YLfrhuGxPJa9nZqH9t+z6UEj7NN4pRrMW4Iv7
 mjuaWYuta9YHhVQWIShdc/lTRNU2W4e4Bg3zoND+Wi2ZXiwdklh8jgm5Fuhxufplq2
 W/zGiPx7WlHT40tloHpIWfkyHSeESwNBbZNSci0Lpb5oWvAYE1YNIqzAJWnil0lYrS
 lMi/wvHtNQwuXU/2bxwaU0pmSosoSHH3FzsbFpHyAYxk1TrGv/inMpZ2dkh2wSYJLq
 i54xcrt+bhRWI9MwqcAzwxMcvCLq2GOih2S3T0IfCQH9Sta23DWT1ea2QVFUfpmWuc
 eJjcPF9Rcqbag==
Date: Tue, 25 Jul 2023 16:49:28 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: suijingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH 2/6] PCI/VGA: Deal with PCI VGA compatible devices only
Message-ID: <20230725214928.GA666846@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee44ec4e-df97-c327-b83b-fe56eb2c120b@loongson.cn>
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
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 22, 2023 at 04:11:07PM +0800, suijingfeng wrote:
> ...
> In the future, we may want to expand VGAARB to deal all PCI display class
> devices, with another patch.
> 
> if (pdev->class >> 16 == PCI_BASE_CLASS_DISPLAY)
> 
>          // accept
> 
> else
> 
>       // return immediately.
> 
> 
> Then, we will have a more good chance to clarify the programmer interface.

I would prefer not to expand vgaarb to deal with all display devices
unless they actually need the legacy resources like [pci 0xa0000-0xbffff].

But maybe the consumer of these interfaces relies on vgaarb even for
devices that don't need those resources?  If so, please mention
examples of where they depend on vgaarb.

I expect the vgaarb interfaces are used by things that need to emulate
the option ROM to initialize the device.  If the device has a
programming interface other than 0000 0000b, the option ROM should not
be using the [pci 0xa0000-0xbffff] resource, so vgaarb should not be
needed.

Bjorn
