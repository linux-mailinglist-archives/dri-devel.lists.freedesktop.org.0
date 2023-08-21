Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2D678293A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 14:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7F310E23D;
	Mon, 21 Aug 2023 12:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 464 seconds by postgrey-1.36 at gabe;
 Mon, 21 Aug 2023 12:35:35 UTC
Received: from mail.8bytes.org (mail.8bytes.org
 [IPv6:2a01:238:42d9:3f00:e505:6202:4f0c:f051])
 by gabe.freedesktop.org (Postfix) with ESMTP id 00E0210E23D;
 Mon, 21 Aug 2023 12:35:35 +0000 (UTC)
Received: from 8bytes.org (pd9fe95be.dip0.t-ipconnect.de [217.254.149.190])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPSA id 14D6D28194F;
 Mon, 21 Aug 2023 14:27:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1692620870;
 bh=FixGPDbY1JGUzoXJGnGCpBH8LX7vfPyc85NTwmVIvZk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1GNfM2qXUHu69LlGLcBH8KY7o7o7XmY+SCrGkW/UUIs2KGTpDHXZZbMpPGz6QSYZs
 UPnFUxDcsVEY3pjS1DruthDw9f83ySojUQCSB+rWg+GUD0/AhHwU/y7CvGp4ChZNfv
 PF0U1t4Yrw0S3cKVt3Z1VBJMi6C4Yubn+JBgQ0h8akaCgHt2/SoukE6zqp52PyQtal
 mSBFlaAtIaUSfX6biqD/5UJPh1qGAUoCalqefQ1b2bqiPcVjHwugqG0e+YrG5Eef+K
 UDBnBPokoAbTS28F+RA/gZgu4I/tGuWG+hC4PlSSGwOqv9iwEYEE1WLsVZflD78r+Z
 CJt+ubMPFXzmw==
Date: Mon, 21 Aug 2023 14:27:47 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu: Remove the device_lock_assert() from
 __iommu_probe_device()
Message-ID: <ZONYQyMSG17YMc_b@8bytes.org>
References: <0-v1-98d20e768c66+7-of_dma_lock_jgg@nvidia.com>
 <78114fd6-9b83-92ba-418f-6cc7bda9df9b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78114fd6-9b83-92ba-418f-6cc7bda9df9b@arm.com>
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
Cc: alsa-devel@alsa-project.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Emma Anholt <emma@anholt.net>, Kevin Tian <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>, ath10k@lists.infradead.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Samuel Holland <samuel@sholland.org>, Takashi Iwai <tiwai@suse.com>,
 Sinan Kaya <okaya@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, iommu@lists.linux.dev,
 Andy Gross <agross@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, ath11k@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Joerg Roedel <jroedel@suse.de>,
 Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 etnaviv@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dmaengine@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Jeff Johnson <quic_jjohnson@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 linux-wireless@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-sunxi@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 21, 2023 at 12:06:40PM +0100, Robin Murphy wrote:
> The solution is to drop those locking patches entirely and rethink the whole
> thing.

Agreed, that was exactly what I thought when looking at this patch.

I dropped the original 10 patches and the 4 fixes on-top from the IOMMU
tree. This needs more investigation and adaption of the actual API users
before it can be reconsidered.

Regards,

	Joerg

