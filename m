Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6433FADDDF7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 23:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B726910E174;
	Tue, 17 Jun 2025 21:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YmarUdqc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3572C10E174
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 21:31:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BE17743994;
 Tue, 17 Jun 2025 21:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEBBFC4CEF1;
 Tue, 17 Jun 2025 21:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750195902;
 bh=1YfwZW+S936XwdA8SGfJ1ZJvlipD9uTXygNO4srMawo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YmarUdqcOEke0FSqL0Xg4J8Lsf3Wt1uxrnUTrBql9tooIzqRSqrJXRb/RthUG96tM
 UhmIuCJamZ3RxGpHFDGNgVGHqRgU1HHltdd03/dUDd3yZXgKOp1z4NJsBzWdqKZRoT
 Nhpr9RanMRtnDUygTTyNdDrv/EZ+9j1PkN20sbSIICvlIom/jxXKO7Iy/l/5DOxHrK
 Bbs/ObfLHkXDYrqiBgMagOsKvqyvb6JzIr1I9Liskj/HU2yXXiA0ZapCnbVd5Mg2Kc
 jqYO7cFto/25mDOQtAHCbJcXHeN3ftaqa2xSE6M8SFyV/zeuKzmBhVcfLIJFp6Mr6z
 Mn6XCuVHjg8Yw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
 Lee Jones <lee@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Georgi Djakov <djakov@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Sibi Sankar <quic_sibis@quicinc.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 David Wronek <david@mainlining.org>, Jens Reidel <adrian@mainlining.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Danila Tikhonov <danila@jiaxyga.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 Connor Mitchell <c.dog29@hotmail.com>
Subject: Re: (subset) [PATCH 00/33] Add support for Qualcomm Snapdragon SM7150
 SoC and Google Pixel 4a
Date: Tue, 17 Jun 2025 16:31:26 -0500
Message-ID: <175019588888.714929.17490930593303808143.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422-sm7150-upstream-v1-0-bf9a9081631d@jiaxyga.com>
References: <20250422-sm7150-upstream-v1-0-bf9a9081631d@jiaxyga.com>
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


On Tue, 22 Apr 2025 23:17:01 +0300, Danila Tikhonov wrote:
> This patch series adds support for the Qualcomm Snapdragon 730/730G/732G
> (SM7150) platform along with the Google Pixel 4a (sunfish) device. Since
> the most critical drivers were submitted and applied in separate patch
> series, this series is largely composed of DT bindings and device‑trees.
> 
> To date, we’ve tested SM7150 support on the following eleven devices:
> - Google Pixel 4a (sunfish)
> - Samsung Galaxy A71 (a715f)
> - Lenovo Tab P11 Pro (j706f)
> - Xiaomi POCO X2 (phoenix)
> - Xiaomi POCO X3 (karna) / POCO X3 NFC (surya)
> - Xiaomi Redmi Note 10 Pro (sweet)
> - Xiaomi Redmi Note 12 Pro (sweet_k6a)
> - Xiaomi Mi 9T / Redmi K20 (davinci)
> - Xiaomi Mi Note 10 Lite (toco)
> - Xiaomi Mi Note 10 (CC9 Pro) & Mi Note 10 Pro (CC9 Pro Premium) (tucana)
> - Xiaomi Mi 11 Lite 4G (courbet)
> 
> [...]

Applied, thanks!

[01/33] dt-bindings: arm: cpus: Add Kryo 470 CPUs
        commit: 7b768d1235dbd98ef7268596995d86df31afce21

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
