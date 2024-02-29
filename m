Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 886FC86D10B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 18:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4FC10E058;
	Thu, 29 Feb 2024 17:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j2i8Xfzk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1443D888D9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 17:45:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3ECB0612ED;
 Thu, 29 Feb 2024 17:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8812CC433F1;
 Thu, 29 Feb 2024 17:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709228705;
 bh=r46YDK3Axw+cBVddXAlXM7gpz+1Uk3YSMg9uwZliBas=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=j2i8Xfzkwu24kv9T/itHx2J8zwt0IqaZDa5JJoKmmrrPJ1VSWZUP9nFIujBp7qi7A
 Ucy1S6O+YGoWkH5sNSzLkEIWkPoDbT1gUsg9G7nvqy0b+i0gyHI4FN8/sMcNMiaibU
 mHFEmGVSE6DHMCyUObCBJW8pr1q8qyDF4ta8ZSRINsjehq1ZpRrSnhtexezeVakKM1
 gyIrxxfmxG3YzQW+HOrb9Ulqg2avUOW/Dox2h+N2T6XY/zTU+enoCL1AG39BLYpDH5
 uVMDf8f2CWmOt/bpFOWOF20TNqRm3/0CI3mYcZpoTA0Qb6HTR4vWXAg+TVdSBoGLYo
 Yxa83LMlOImsg==
From: Lee Jones <lee@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 amergnat@baylibre.com
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Fabien Parent <fparent@baylibre.com>
In-Reply-To: <20240226-audio-i350-v1-13-4fa1cea1667f@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-13-4fa1cea1667f@baylibre.com>
Subject: Re: (subset) [PATCH 13/18] mfd: mt6397-core: register mt6357 sound
 codec
Message-Id: <170922870128.1628445.8442233644486002127.b4-ty@kernel.org>
Date: Thu, 29 Feb 2024 17:45:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
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

On Mon, 26 Feb 2024 15:01:51 +0100, amergnat@baylibre.com wrote:
> Add MT6357 codec entry in the MFD driver.
> 
> 

Applied, thanks!

[13/18] mfd: mt6397-core: register mt6357 sound codec
        commit: 79d98102a31ab777b4a6632d799ab2bc63654cf8

--
Lee Jones [李琼斯]

