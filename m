Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AC2C0CF80
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 11:32:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0517010E43A;
	Mon, 27 Oct 2025 10:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cUlf6EhE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBAA10E43A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 10:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761561163;
 bh=gdPtlidxvZyz9Nniqj8cOl/Lyejm3Rd2LqnFZSPG48s=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cUlf6EhEat9DXL6eCcIQBXLfnTrbkhtVPUlrEbdKDS3mX2uMhnTvNvuCBBNuC9rlq
 5GwWRJpB8swlbSLHkGXo2e3HqO3BhKOcpBCih/LI+7s3oiKOPSKQyHUujySB4M77Lg
 bY5esmAt6vT0gJrViChJ2NsafwzIgsFhmlw2B3AQVjvhOflqhspcP0RyDPxKda3Teb
 dJCnoZsNtn1Nkb1YN3DAHhcwn484OOVE8NwSSNN8E3bKHPbljmIo+iCG2pS/Co2MGB
 Ea3PYrsuN3P8S3OlWy4SKFRVZU1CquMnQ+ARZbXbhdLMk1saig+n5DAISDR0vX4OLD
 SlrkzlyepE36g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8B58817E1276;
 Mon, 27 Oct 2025 11:32:42 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20251021-mt8365-enable-gpu-v2-0-17e05cff2c86@collabora.com>
References: <20251021-mt8365-enable-gpu-v2-0-17e05cff2c86@collabora.com>
Subject: Re: (subset) [PATCH v2 0/3] Add Mali GPU support for Mediatek
 MT8365 SoC
Message-Id: <176156116250.18248.16538083521320273627.b4-ty@collabora.com>
Date: Mon, 27 Oct 2025 11:32:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

On Tue, 21 Oct 2025 09:30:50 +0200, Louis-Alexis Eyraud wrote:
> This patchset adds the support of the ARM Mali G52 MC1 GPU (Bifrost),
> integrated to the Mediatek MT8365 SoC, and its enablement to the
> Mediatek Genio 350-EVK board.
> 
> I've tested this patchset on a Mediatek Genio 350-EVK board,
> with a kernel based on linux-next (tag: next-20251021).
> 
> [...]

Applied to v6.18-next/dts64, thanks!

[2/3] arm64: dts: mediatek: mt8365: Add GPU support
      commit: 499af66b8f421a1f1612ff84c81a47ca569654b8
[3/3] arm64: dts: mediatek: mt8365-evk: Enable GPU support
      commit: c8dd72788f52d3fde091c0d6249c45b9467b69f6

Cheers,
Angelo


