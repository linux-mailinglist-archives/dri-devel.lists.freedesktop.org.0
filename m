Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEC9969DDE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 14:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FA310E57F;
	Tue,  3 Sep 2024 12:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sFkMQFJK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4F710E57F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 12:40:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 61E3D5C5891;
 Tue,  3 Sep 2024 12:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67064C4CEC4;
 Tue,  3 Sep 2024 12:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725367223;
 bh=izkBs4bxUC1PwiJW7FvWem3hD4YQoDnnapyU6W/SLmA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=sFkMQFJKXWZyoZ2sX0aypDomqaQrB7h43pDn6kA5kPREXtQebHzyWOHjElggrc9rJ
 Fs+nGQEtNNvQSS68qdz/juC0wmjMx+hgKycTfpV4OR8rWmcFUO99sFZRklxK1g9IuY
 MvH3Kswf2+4TP0rHPtU3q2o8oi4dUrNlIBTPYCacLkMj4TRtQDv5P1+lsDaPETI2Xv
 QVGBjkAUUihlJ0oDTiobP8SJOQXSrX4x7hf5jNu7J784CamY24Sgw57E4YAT56NPTF
 W7n7Dn1CnlxXprZq4LoIVR9H0RePi2zQiy0iyTKLNFoqOV1RJ5Gjxo8DZ4kGanCpgr
 A6b81XnV+GmxA==
From: Robert Foss <rfoss@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marc Gonzalez <mgonzalez@freebox.fr>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240812-tdp158-v5-0-78684a84ec23@freebox.fr>
References: <20240812-tdp158-v5-0-78684a84ec23@freebox.fr>
Subject: Re: [PATCH v5 0/2] Basic support for TI TDP158
Message-Id: <172536721812.2552069.2889737892670833119.b4-ty@kernel.org>
Date: Tue, 03 Sep 2024 14:40:18 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
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

On Mon, 12 Aug 2024 16:51:00 +0200, Marc Gonzalez wrote:
> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
> 
> Like the TFP410, the TDP158 can be set up in 2 different ways:
> 1) hard-coding its configuration settings using pin-strapping resistors
> 2) placing it on an I2C bus, and defer set-up until run-time
> 
> The mode is selected by pin 8 = I2C_EN
> I2C_EN = 1 ==> I2C Control Mode
> I2C_EN = 0 ==> Pin Strap Mode
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: display: bridge: add TI TDP158
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/887665792b99
[2/2] drm/bridge: add support for TI TDP158
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a15710027afb



Rob


