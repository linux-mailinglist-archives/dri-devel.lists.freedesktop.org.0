Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 428DDC21232
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 17:22:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493E910E292;
	Thu, 30 Oct 2025 16:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sM2BrH/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6328B10E292
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:22:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0A552418BC;
 Thu, 30 Oct 2025 16:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D9C5C4CEF1;
 Thu, 30 Oct 2025 16:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761841359;
 bh=qeejJw/Ci04guqvtvub4+S+ZoFbZ8/admEO2nb7xcKk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sM2BrH/9fLau66Kv3195fiOQB6MxtyPXRXtOIYVMdU5A17KL7QC2Qai+2RmKFruY/
 uTxFhGlUjTeb7BdmOXNCSNp9kWr7zSRhWCbaRPS008DM8bOn8Za3RY6SbVy5EAlYXo
 NHFmhjj4Wnxex9UrXdb7nEma4PZD9b2kNGKvqUITnEp5ODjFDs3Pb0AQHXbeKZLZds
 /Y9UaXi51BAeTwg93p/Q1UJQZ3YdLY6yHAduDN2woYqCSIY6v0ABaXPu9cSDqw7Z2E
 VnlNC1IvIV20+NKAkAo/2CVcajJ5k02bGlPpLU8Ss/jKqZvwMywdaosN1nNbFViAk9
 xgX2bZxesoVqg==
From: Bjorn Andersson <andersson@kernel.org>
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Daniel Thompson <danielt@kernel.org>,
 Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 threeway@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: (subset) [PATCH v5 0/4] leds: privacy-led support for devicetree
Date: Thu, 30 Oct 2025 11:25:33 -0500
Message-ID: <176184154198.475875.6266114626536757346.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Wed, 10 Sep 2025 14:01:07 +0200, Aleksandrs Vinarskis wrote:
> Re-spin of RFC patch from ~2.5 years ago [1]. v4l2 controls for privacy
> LEDs has landed, but the DT part was left out. Introduce missing
> dt-bindings, and commonize 'leds' parameter. Finally, add a patch to
> enable privacy-led on Lenovo Thinkpad x13s.
> 
> With recent inflow of arm64-power laptops (Snapdragon X1E/X1P) which
> mostly use MIPI cameras, this feature becomes more desired. Original
> rebased patch is still working as expected (with respective DT changes)
> on Dell XPS 9345.
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: sc8280xp-x13s: enable camera privacy indicator
      commit: b54c412b511c8bc8e71fd09a766bd95528d94840

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
