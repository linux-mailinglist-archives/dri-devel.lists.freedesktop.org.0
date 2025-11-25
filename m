Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AC6C85250
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 14:18:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F9B10E401;
	Tue, 25 Nov 2025 13:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9EC10E3F6;
 Tue, 25 Nov 2025 13:18:53 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown
 [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id A8FED3F11B;
 Tue, 25 Nov 2025 14:18:46 +0100 (CET)
Message-ID: <7bd66c59-7101-4e79-9c45-8c3417a4284f@hogyros.de>
Date: Tue, 25 Nov 2025 22:18:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i915: Support Intel GPU porting on any non-x86 system.
To: zhangzhijie <zhangzhijie@bosc.ac.cn>, jani.nikula@linux.intel.com,
 jeff@jeffgeerling.com, wangran@bosc.ac.cn, zhangjian@bosc.ac.cn,
 daniel@ffwll.ch, rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, guoyaxing@bosc.ac.cn
References: <20251124065645.1920632-1-zhangzhijie@bosc.ac.cn>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <20251124065645.1920632-1-zhangzhijie@bosc.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi,

On 11/24/25 3:56 PM, zhangzhijie wrote:

 > inb/outb speccial wire not support on other ARCH.
 > Should detect whether arch platform support or not.

These platforms still have inb/outb definitions though that do 
something. https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1824 
has a few cases where this goes wrong.

There are also a few Intel chipsets that also allow MMIO accesses to VGA 
registers. Whether there is an intersection of chipsets that allow it, 
and chipsets where that is useful is another question though.

 >   	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);

This function really should check if inb/outb will address pdev after 
the function returns, and return an error if not, then the accesses here 
and in the power well code could be conditional on this, and it would be 
generic.

For this, the vgaarb code would need to check that the bridges on the 
way up have accepted the VGA forwarding bit (i.e. read back after 
writing it), and there probably should be a mechanism for the bridge 
between PCI(e) and the platform bus, so systems with multiple PCI(e) 
domains can also be handled.

E.g. on POWER, there are global variables "isa_io_base" and 
"pci_io_base", and it is assumed that these point to a place that 
generates IO accesses from MMIO, but this assumption is not actually 
verified, and I can pretty much guarantee that it's wrong if the PCIe 
bus in question is not even attached to the first socket.

Just checking that upstream bridges accept the VGA bit while vgaarb 
switches decoding over would solve all of my problems though, because 
the root bridge doesn't, so that would be a quick way of inhibiting 
these accesses. It might work for you too, just try setting the bit 
manually with setpci and check if it sticks.

    Simon

