Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2645AD7AF5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 21:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D26688735;
	Thu, 12 Jun 2025 19:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="jdBSKwBQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0C810E166
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 19:16:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1749755784; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EFH1gBrXRxnEbdwN8NuKJttxVfo8otLAVWOqMjccSlAJPieQGoreQOALJFOFSNWr7sTm1nnCQDuu/HsQkPOtQ/3OSYvQ4RyjyXBtSHjqSQpOvG+rol3y4CMkvAvX4S8y9ER4JY1+I1De1RTZCspz3nMo9hgIs9GEa29Bt5D3wzA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1749755784;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=sAz8u8Of8VgXN3BQQ00U/F57NlhrS7p1nuOTfYJkSLY=; 
 b=gx56POiNw+tPyzwOMUrXJdu8LXA3Wx0Fc7fpLgAxdL2NAvF06jUmFzQXXgdclEPvSot/sq5wjbKw4wosmJTvqvr3D2Ol7BcVPeIHRceQLb93o93NE842mu2MIU+ewqzhHXcOyn6sA+I1W7R4ndFqRO48pbEglbjFxLxjTpMHRfE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749755783; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=sAz8u8Of8VgXN3BQQ00U/F57NlhrS7p1nuOTfYJkSLY=;
 b=jdBSKwBQJwbK7Wgb1BeOkKDHoXCKiMSRe7vNwtqecSYRDrLuqn7O5OZawJAn+DCb
 1ShpLyDr//VBXzQCMKFW7XHKGS1I5U54aXGur+fPFzehkfen3wY4iloFKJZGU5HBeiY
 CPvZ+rLtAcn7WQvK9zh7a9yesjqizAMrfxYGbQiQ=
Received: by mx.zohomail.com with SMTPS id 1749755781436118.00228707547853;
 Thu, 12 Jun 2025 12:16:21 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Andrew Lunn <andrew@lunn.ch>
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
Subject: Re: [PATCH 15/20] net: stmmac: dwmac-rk: switch to HWORD_UPDATE macro
Date: Thu, 12 Jun 2025 21:16:09 +0200
Message-ID: <10689894.nUPlyArG6x@workhorse>
In-Reply-To: <5947475f-ef38-44cb-857e-0c7378023ccd@lunn.ch>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <20250612-byeword-update-v1-15-f4afb8f6313f@collabora.com>
 <5947475f-ef38-44cb-857e-0c7378023ccd@lunn.ch>
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

On Thursday, 12 June 2025 21:08:20 Central European Summer Time Andrew Lunn wrote:
> On Thu, Jun 12, 2025 at 08:56:17PM +0200, Nicolas Frattaroli wrote:
> > The era of hand-rolled HIWORD_UPDATE macros is over, at least for those
> > drivers that use constant masks.
> > 
> > Like many other Rockchip drivers, dwmac-rk has its own HIWORD_UPDATE
> > macro. Its semantics allow us to redefine it as a wrapper to the shared
> > bitfield.h HWORD_UPDATE macros though.
> > 
> > Replace the implementation of this driver's very own HIWORD_UPDATE macro
> > with an instance of HWORD_UPDATE from bitfield.h. This keeps the diff
> > easily reviewable, while giving us more compile-time error checking.
> > 
> > The related GRF_BIT macro is left alone for now; any attempt to rework
> > the code to not use its own solution here would likely end up harder to
> > review and less pretty for the time being.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> Please split this out into a patch for net-next.

I would be surprised if it didn't apply to net-next.

> Also, Russell King has just posted a number of patches for this driver,
> so you will probably want to wait for them to be merged, so you post
> something which will merged without any fuzz.

I would be surprised if an automatic merge did not produce correct code
here, as I specifically replaced the implementation of the macro with
an instance of the new macro and adjusted semantics on purpose. If it
compiles, it's correct.

Would you still prefer for me to re-send this patch based against
net-next once the new macro is merged and within net-next?

> 
> 	Andrew
> 

Best regards,
Nicolas Frattaroli



