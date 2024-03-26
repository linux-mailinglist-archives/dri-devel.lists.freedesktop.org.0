Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8B788C6DA
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 16:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDEC10EBBA;
	Tue, 26 Mar 2024 15:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R9H3froV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9F910EBFB
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 15:28:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4DE84CE1843;
 Tue, 26 Mar 2024 15:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B18C433B1;
 Tue, 26 Mar 2024 15:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711466878;
 bh=hRH8KwD0yeb6Ii/FGemUiqr+aQmrUQOnUFhl/QaNG9o=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=R9H3froV73QGMdXLc9BBRgXfXoWKxlqMl7mfPzkiV0Xotb+lR0OyS567kcVd2m/01
 LInj8GTpsyRNN9SSVSTS6Lu3uLl2pGzZ7tAaBlgd7FKSj/5E1kuOSmiZ1sMVeENSLM
 xC3kaP05IWC150YFK8BFnXYQv9W+B0928djHny3OBZ+24C3+glAUY2nff0owN2kgoJ
 BG2o0V5bsX+KC9E7DnYDUK0aN50eMP/r2nNOzydUOmr0OEevwfIxqnVNe4F6PufLjR
 xYJ4VHNDO7zKjJl7kFfXKdw5ZsK4z1va7FkozBAMAkJpHb14C9yHr5nhY65b2BypjN
 jDxpj16VqKVtQ==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20240312-xilinx-dp-audio-v1-0-696c79facbb9@ideasonboard.com>
References: <20240312-xilinx-dp-audio-v1-0-696c79facbb9@ideasonboard.com>
Subject: Re: (subset) [PATCH 0/4] drm: xlnx: zynqmp: Add DP audio support
Message-Id: <171146687400.132239.7354638412011978940.b4-ty@kernel.org>
Date: Tue, 26 Mar 2024 15:27:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
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

On Tue, 12 Mar 2024 11:41:01 +0200, Tomi Valkeinen wrote:
> Add DisplayPort audio support for Xilinx ZynqMP platforms.
> 
> This depends on patch adding cyclic DMA mode for DPDMA driver:
> 
> https://lore.kernel.org/all/20240228042124.3074044-3-vishal.sagar@amd.com/
> 
> If that patch is missing, starting an audio playback will fail with an
> ASoC error.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dmaengine_pcm: Allow passing component name via config
      commit: cee28113db17f0de58df0eaea4e2756c404ee01f

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

