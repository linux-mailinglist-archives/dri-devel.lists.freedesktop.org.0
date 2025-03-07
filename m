Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B506A55E0D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 04:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C2E10E900;
	Fri,  7 Mar 2025 03:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.b="sGqJJ5Zi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BD210E900
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 03:09:14 +0000 (UTC)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 527388dS027163
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 6 Mar 2025 19:08:09 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 527388dS027163
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2025021701; t=1741316897;
 bh=SFgD9M+p5d4igshN6SMPc//iuzRVz2Eb/CCPvhQeQ4k=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=sGqJJ5ZiwQOefUeCTR61k1c1/2TpGWbrT4NEZVyWsBZiOfJ2/maPRM1og0k0XCX0F
 Ld9+eSu4xqDd+X+2qrgg7JjXoRBSSgs0lHVrfqkS0e4U4hcPmsGy5xSjZrm2c7Bevm
 P+0eFqVIMHPc1WjLrMn1MEEByE/9797DZwHHF0UTXNq820Vzgy2pkrWelyCfG+lCsx
 nB/AlVPUMY5B1hNLKjeBElqWXXgIcmEcq9Gwt93UJnzVfHFNvMcV/dXcWdGN56w6Rm
 KhOBkFgfo1x8Y55sRT52V0jFp1STtD7Fc+xR7U3FcWfuLN1A4EAU7/MZBEz8Gsc1SK
 DnEX3ZKMPW6zA==
Date: Thu, 06 Mar 2025 19:08:06 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org
CC: alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
User-Agent: K-9 Mail for Android
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
Message-ID: <4732F6F6-1D41-4E3F-BE24-E54489BC699C@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On March 6, 2025 8:25:25 AM PST, Kuan-Wei Chiu <visitorckw@gmail=2Ecom> wro=
te:
>Several parts of the kernel contain redundant implementations of parity
>calculations for 16/32/64-bit values=2E Introduces generic
>parity16/32/64() helpers in bitops=2Eh, providing a standardized
>and optimized implementation=2E=20
>
>Subsequent patches refactor various kernel components to replace
>open-coded parity calculations with the new helpers, reducing code
>duplication and improving maintainability=2E
>
>Co-developed-by: Yu-Chun Lin <eleanor15x@gmail=2Ecom>
>Signed-off-by: Yu-Chun Lin <eleanor15x@gmail=2Ecom>
>Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail=2Ecom>
>---
>In v3, I use parityXX() instead of the parity() macro since the
>parity() macro may generate suboptimal code and requires special hacks
>to make GCC happy=2E If anyone still prefers a single parity() macro,
>please let me know=2E
>
>Additionally, I changed parityXX() << y users to !!parityXX() << y
>because, unlike C++, C does not guarantee that true casts to int as 1=2E
>
>Changes in v3:
>- Avoid using __builtin_parity=2E
>- Change return type to bool=2E
>- Drop parity() macro=2E
>- Change parityXX() << y to !!parityXX() << y=2E
>
>
>Changes in v2:
>- Provide fallback functions for __builtin_parity() when the compiler
>  decides not to inline it
>- Use __builtin_parity() when no architecture-specific implementation
>  is available
>- Optimize for constant folding when val is a compile-time constant
>- Add a generic parity() macro
>- Drop the x86 bootflag conversion patch since it has been merged into
>  the tip tree
>
>v1: https://lore=2Ekernel=2Eorg/lkml/20250223164217=2E2139331-1-visitorck=
w@gmail=2Ecom/
>v2: https://lore=2Ekernel=2Eorg/lkml/20250301142409=2E2513835-1-visitorck=
w@gmail=2Ecom/
>
>Kuan-Wei Chiu (16):
>  bitops: Change parity8() return type to bool
>  bitops: Add parity16(), parity32(), and parity64() helpers
>  media: media/test_drivers: Replace open-coded parity calculation with
>    parity8()
>  media: pci: cx18-av-vbi: Replace open-coded parity calculation with
>    parity8()
>  media: saa7115: Replace open-coded parity calculation with parity8()
>  serial: max3100: Replace open-coded parity calculation with parity8()
>  lib/bch: Replace open-coded parity calculation with parity32()
>  Input: joystick - Replace open-coded parity calculation with
>    parity32()
>  net: ethernet: oa_tc6: Replace open-coded parity calculation with
>    parity32()
>  wifi: brcm80211: Replace open-coded parity calculation with parity32()
>  drm/bridge: dw-hdmi: Replace open-coded parity calculation with
>    parity32()
>  mtd: ssfdc: Replace open-coded parity calculation with parity32()
>  fsi: i2cr: Replace open-coded parity calculation with parity32()
>  fsi: i2cr: Replace open-coded parity calculation with parity64()
>  Input: joystick - Replace open-coded parity calculation with
>    parity64()
>  nfp: bpf: Replace open-coded parity calculation with parity64()
>
> drivers/fsi/fsi-master-i2cr=2Ec                 | 18 ++-----
> =2E=2E=2E/drm/bridge/synopsys/dw-hdmi-ahb-audio=2Ec   |  8 +--
> drivers/input/joystick/grip_mp=2Ec              | 17 +-----
> drivers/input/joystick/sidewinder=2Ec           | 24 ++-------
> drivers/media/i2c/saa7115=2Ec                   | 12 +----
> drivers/media/pci/cx18/cx18-av-vbi=2Ec          | 12 +----
> =2E=2E=2E/media/test-drivers/vivid/vivid-vbi-gen=2Ec  |  8 +--
> drivers/mtd/ssfdc=2Ec                           | 20 ++-----
> drivers/net/ethernet/netronome/nfp/nfp_asm=2Ec  |  7 +--
> drivers/net/ethernet/oa_tc6=2Ec                 | 19 ++-----
> =2E=2E=2E/broadcom/brcm80211/brcmsmac/dma=2Ec         | 16 +-----
> drivers/tty/serial/max3100=2Ec                  |  3 +-
> include/linux/bitops=2Eh                        | 52 +++++++++++++++++--
> lib/bch=2Ec                                     | 14 +----
> 14 files changed, 77 insertions(+), 153 deletions(-)
>

(int)true most definitely is guaranteed to be 1=2E
