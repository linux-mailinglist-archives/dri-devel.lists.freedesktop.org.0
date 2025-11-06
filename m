Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC14C38F2F
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 04:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9A510E004;
	Thu,  6 Nov 2025 03:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FDD10E004;
 Thu,  6 Nov 2025 03:16:29 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown
 [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 6549C3F11A;
 Thu,  6 Nov 2025 04:16:27 +0100 (CET)
Message-ID: <c9594cc3-031b-43cc-9268-85c32f98ba49@hogyros.de>
Date: Thu, 6 Nov 2025 12:16:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: dri-devel@lists.freedesktop.org,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 linux-pci@vger.kernel.org
From: Simon Richter <Simon.Richter@hogyros.de>
Subject: Unreachable cards in vgaarb
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

I have a card whose VGA registers are not actually reachable, for 
multiple reasons:

1. the system in question has multiple PCI domains
2. the system in question does not support IO access
3. one of the bridges involved does not support VGA register forwarding

Obviously, the "works for me" solution would be to teach vgaarb to check 
if the VGA bit actually got set in the bridge control register (because 
apparently, that is how a bridge indicates missing support), and return 
an error. I plan to do that, but that doesn't solve the others.

The specific actual problem I'm trying to solve here is that there is a 
workaround in the i915 and xe drivers that pokes the VGA register space 
on the same card after changing power states, and this falls over on my 
system. Skipping this is safe if we can guarantee that vgacon will not 
generate accesses later, so I think having vgaarb recognize that the 
card is unreachable and returning an error is sufficient here.

I have no idea whether this will break other systems though -- can we 
reasonably assume that any PCI or PCIe bridge that is capable of 
forwarding VGA accesses will proudly display the VGA bit set in the 
bridge control register, or is a quirk needed here?

For multiple PCI domains, I have no clue how to determine where accesses 
end up. My feeling is that it's supposed to be "all of them, mediated by 
VGA bits on root bridges", but I don't know if this is actually true. Is 
anyone actually building machines with a CPU architecture that has a 
separate IO range, and multiple PCI domains?

For "no IO access", it is even more complex -- it appears that the 
approach on POWER is to define inb/outb as MMIO, offset from a global 
variable that points at a PCI range, which means this access will only 
show up in one of the PCI(e) controllers.

What is unclear to me is

1. whether there is supposed to be a mechanism to generate IO accesses 
from those,
2. whether this range should be excluded from MMIO to not accidentally 
create conflicts
3. whether vgaarb needs to adjust this variable too
4. if this variable should instead be maintained by vgaarb
5. if we should have dedicated vga_inb/vga_outb macros or if we can 
assume that any inb/outb on machines that don't have an IO range will be 
VGA accesses anyway
6. whether it is interesting to create special handling for cards that 
have VGA registers at the beginning of their non-prefetchable MMIO range 
(AFAIK, some Intel cards do, and you can address them either via IO or 
via MMIO to their non-prefetchable mapping).
7. whether this affects more than two users.

    Simon
