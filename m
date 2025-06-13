Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FF3AD8BA7
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 14:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FC810E15C;
	Fri, 13 Jun 2025 12:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="iYPe6hd7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7480E10E15C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 12:08:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1749816504; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HxsUUIkbJLHor7xQVOxFnKjQL2tcvAU/8U7uOGAT8YJ5SzkaPujbsMSqqr80mMJL7/C6qPJ5R72AJZZz4V+WGvRuhbDD8RcEdYVp0T3jFCWzPUWFNNQ68W3mkdPx/uRz9Q8CO9KUVnMiuh0wlCTVhHSoXI4LkoQwVLhFcDXTcHE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1749816504;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=oC6j4XXPtFnpNI59vFPxucp8Atnh3iWQ7iCtDWJTvGo=; 
 b=A1ATiiZZKeXR51mKcGYEcu+ievsJrJBhXTLF5fKN6m6uGlmf+gN+qSW/4BgN2DXa3+ihmm5IDJ0LMQYccMcRuItr2vNHq1tFXK2h6DApxhwbIV2hxsLhxWB7MZeQnM9wPRrdMCbbUDX2/hY046rowLcFe6wBngVN1Vd+mah2Cyc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749816504; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=oC6j4XXPtFnpNI59vFPxucp8Atnh3iWQ7iCtDWJTvGo=;
 b=iYPe6hd7lzD5NmEuVNlPJNUR1sBcQMTEzgFULW5ZE1tzhGuUUZmsrhquSUKDA+Cs
 I90mwM0EoNm4PSiTntzA6phjzUyTdMpluFlcfHK8TNliE3+1AYflsiylQRbXHpwn2NL
 nJ0riWRwAIxWd/I6yzJxEXtQHSBfMYaBpXVI3PVg=
Received: by mx.zohomail.com with SMTPS id 1749816501559794.9356716993168;
 Fri, 13 Jun 2025 05:08:21 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 17/20] PCI: dw-rockchip: switch to HWORD_UPDATE macro
Date: Fri, 13 Jun 2025 14:08:08 +0200
Message-ID: <12129790.nUPlyArG6x@workhorse>
In-Reply-To: <aEvzMnxgsjfryCOo@ryzen>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <20250612-byeword-update-v1-17-f4afb8f6313f@collabora.com>
 <aEvzMnxgsjfryCOo@ryzen>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hello,

On Friday, 13 June 2025 11:45:22 Central European Summer Time Niklas Cassel wrote:
> Hello Nicolas,
> 
> On Thu, Jun 12, 2025 at 08:56:19PM +0200, Nicolas Frattaroli wrote:
> > 
> > PCIE_CLIENT_RC_MODE/PCIE_CLIENT_EP_MODE was another field that wasn't
> > super clear on what the bit field modification actually is. As far as I
> > can tell, switching to RC mode doesn't actually write the correct value
> > to the field if any of its bits have been set previously, as it only
> > updates one bit of a 4 bit field.
> > 
> > Replace it by actually writing the full values to the field, using the
> > new HWORD_UPDATE macro, which grants us the benefit of better
> > compile-time error checking.
> 
> The current code looks like this:
> #define  PCIE_CLIENT_RC_MODE            HIWORD_UPDATE_BIT(0x40)
> #define  PCIE_CLIENT_EP_MODE            HIWORD_UPDATE(0xf0, 0x0)
> 
> The device_type field is defined like this:
> 4'h0: PCI Express endpoint
> 4'h1: Legacy PCI Express endpoint
> 4'h4: Root port of PCI Express root complex
> 
> The reset value of the device_type field is 0x0 (EP mode).
> 
> So switching between RC mode / EP mode should be fine.
> 
> But I agree, theoretically there could be a bug if e.g. bootloader
> has set the device_type to 0x1 (Legacy EP).
> 
> So if you want, you could send a patch:
> -#define  PCIE_CLIENT_RC_MODE            HIWORD_UPDATE_BIT(0x40)
> +#define  PCIE_CLIENT_RC_MODE            HIWORD_UPDATE(0xf0, 0x40)
> 
> With:
> Fixes: 0e898eb8df4e ("PCI: rockchip-dwc: Add Rockchip RK356X host controller driver")
> 
> But I also think that your current patch is fine as-is.
> 
> I do however think that you can drop this line:
> +#define  PCIE_CLIENT_MODE_LEGACY       0x1U
> 
> Since the define is never used.

Will do

> 
> 
> Also, is there any point in adding the U suffix?
> 
> Usually you see UL or ULL suffix, when that is needed, but there actually
> seems to be extremely few hits of simply U suffix:
> $ git grep 0x1U | grep -v UL

Sort of. Literals without the U suffix are considered signed iirc, and
operating with them and then left-shifting the result can run into issues
if you shift their bits into the sign bit. In the patch at [1] I needed to
quell a compiler warning about signed long overflows with a U suffix. This
should only ever really be a problem for anything that gets shifted up to
bit index 31 I believe, and maybe there's a better way to handle this in
the macro itself with an explicit cast to unsigned, but explicit casts
give me the ick. I'm also open to changing it to an UL, which will have
the same effect, and has more precedent.

> 
> 
> Kind regards,
> Niklas
> 

Best Regards,
Nicolas Frattaroli

Link: https://lore.kernel.org/all/20250612-byeword-update-v1-7-f4afb8f6313f@collabora.com/ [1]


