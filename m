Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E237814C6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 23:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDE510E578;
	Fri, 18 Aug 2023 21:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEAA10E086;
 Fri, 18 Aug 2023 21:32:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nbe/wt13/tATyUXmALcOpQQ6txreOHPIv0kljCiTr/YlFSKz0vzgvVEShfAkBj6R7L2XbL5aM85iZRkh7cY9N+stJcIjGD9KcOsZxO2cskXjU8CK+cmGOvIkpRr6ToefJSXeorRKWLiyHct5bbfilvPr7RxPm9vBQOJYpGw18ZPCTUE/vOs59zvREbdwUMvlRM48MlzBApJJnKUrucQcmNIYvXdBMS2xofKUl5zCrE/oGeW+I8n6Fw4eKBucSSjrpKW2P8JZ0IuK0NauExs6ZAtTTGOyNoJDchnbu8FoPqxcRUNFdVSyLZ958sfA8nZiUtTETaWJRoWgRmS2ehHvnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tBS6czHuBVubNVbJpgjRieZG4yMb9XzVyhGlakAS9w=;
 b=ViRTDAXf6zTbL6ef/5FVATDa5uM4v3dogXgYYDw8A3iR/0iClx4JqfZGE8LvwN4CTkccID+WqrzezHkHyR/SsrGRNJkZMPQY+0maNDnw7o45/AFU0jtFK641MtdrttXsUIQPV/kJY0XQ9n5gSoimXiYMUSQjTK9oG2yvYRtyLQny0B60ic30TK9cTq6SnVZaxPMVRr+L6HtBuUnmXcyiFcHjP4hElM8QR5eoAUS/omPJISbIWPFXBZDievxjF33LtLlXOO6WA/RvRumw+KH9zXReYpyrb9Q0/7vdW41X+SdPMoAfLSu2kcrh0oWD5Y4D7cbCWGtH90HYUchcwKSxVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tBS6czHuBVubNVbJpgjRieZG4yMb9XzVyhGlakAS9w=;
 b=UNdDK6066HlKcDL8oP5I3KusJVnHTnlqOalFv8Fc/XXCfGkCFg3VGJiWfCoYes2hPyTjAzExWPuo7svMrXJ2OZSKBs9b4A5FL+O+lC7Ko6lZx9E+SjeqME7rGXJlevkCWW7odEPKoxCPG9TLtCTpT4OyAUZOrnB01i0kelol8wuDtJYMOMKDa5zUGi4PHktQwe2sqFdDonAYSxyfjE/0y0lpP0O3kuw8tl2U25GbneUltrvFhFmO0DpFEaPMsieH2Ut03q909HuuUy/4douhOHcwuJTT9+w5quCK999l4Su3yeB2vbMtmEGzAXOSPA34xE1rjhWrqA653WDP3esnxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SN7PR12MB8027.namprd12.prod.outlook.com (2603:10b6:806:32a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 21:32:29 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 21:32:29 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Andy Gross <agross@kernel.org>, David Airlie <airlied@gmail.com>,
 alsa-devel@alsa-project.org, Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Frank Rowand <frowand.list@gmail.com>, iommu@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Kalle Valo <kvalo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-wireless@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Maxime Ripard <mripard@kernel.org>, Sinan Kaya <okaya@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>,
 Sean Paul <sean@poorly.run>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Will Deacon <will@kernel.org>,
 =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: [PATCH] iommu: Remove the device_lock_assert() from
 __iommu_probe_device()
Date: Fri, 18 Aug 2023 18:32:28 -0300
Message-ID: <0-v1-98d20e768c66+7-of_dma_lock_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::18) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SN7PR12MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: bd7a6ff3-fd2e-4a4b-2c5d-08dba0329f99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1y6fWsgksYpTjLofQDkp8dx4MAWt+4RQIgOmokZ2PlN4uvlfXgRBC/Usu8ntJ4yokJDXHsoPlp8VrccR1sSYvnRTfhr40oRmOEh1eqIXD+ybwJ/RhA7bGxgnYx0/cEUYxDIMe55Iw3WUVQ+nW6J+iZNWfmO3Tv2d0aA33/l2WLyFxyDOqXiHuKWqvM9+jqkOM9ikuFB9z10D+nCOC8+QSaN1HtW2A451CP+778ViWlSUhTEmOEHLw5K9THCVSZ+nbIoupF8GM0GsVuJqBZw4i80Zunp9MNc/mPrZZvfCVR07Th2qX/62YPI2FbzHkJ+O/Rp9CV1eh0hOmwZBKikXc1cKf6CuXjHw2F/FB/G94cDc1gA3RjpTD91nrgCbJ4qmUVci+/dljyIVDETeUpYj6WxeP0szg5M3zJo0EWVBrkQHg0II3fofMQt5DmjhMUcXWWV5ehkF14RsiJ3zuXOF0LH0Tllu6NZ61az2I6eLFk8ta49wwxnId4IjB55zL7zy9ep7YiVM4SgZd/zwcOvsIFusViWNQ9Jzoi19/R3ddIkawvK/km5objDrwEcLE8K77ct7rfoLOv3YZ3MUuLIloiCq4fFmbTWBTcj/HOfksxyKpW5FhSbK94NYcKGt1CHrnzStQGKVcK9q/t509DioNUnSbg437MaFqg3MeZahV6/Mq+2lWDvNYQ/veunZRYPb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(39860400002)(346002)(396003)(451199024)(1800799009)(186009)(36756003)(86362001)(1191002)(83380400001)(8676002)(8936002)(4326008)(30864003)(2906002)(41300700001)(26005)(6506007)(6486002)(6512007)(2616005)(7366002)(110136005)(5660300002)(7416002)(921005)(478600001)(54906003)(66556008)(966005)(38100700002)(316002)(7406005)(66946007)(66476007)(4216001)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ax/2b4IYHSL3VAPV0LMZYmg36xSCrp0fQXdTjhr/xV2I52nyJSdN8uX4DlMt?=
 =?us-ascii?Q?U5IIt47ExocS3qL2bF8CqLzkydI3cxVxzNP0hA+Hju8T9Qc5dXlqCKWrKtb3?=
 =?us-ascii?Q?gb7STLMRbvSi3+S/zWSpxYeodmatkvNAr48kM43X+ULocxkdUg5zDNOLzffb?=
 =?us-ascii?Q?sDurMEzELR7uN9aKj8ISRbWtDRNTZXsNwYuFCZdRareILtUqi3vldx7rlk6n?=
 =?us-ascii?Q?HbVEXFIbU1TJy/7ZAQJ6KvIVIbv3MtOF2sP4YTXuP1h/UHn168loDr8aRo1j?=
 =?us-ascii?Q?qrVJEyUbUB3o+dnbVM8fTrGYp2TH28qvOXk2/EnwZxF/CVKeR64ZYUWOHtft?=
 =?us-ascii?Q?ND/ysd9rp23JlaNSVZhD8/Dzs71a0DjGGH6RinSRTuWLRADjDEj+MrSyK3+7?=
 =?us-ascii?Q?DO0ADJqLaGBI6dH15smu0uXrKDobqQQ9NZ9Nb5Y7lJke3JtnzF2KzIUHgcjn?=
 =?us-ascii?Q?nOUxDfddbGKqdTds1B48B4mHl4P10ZKaMdURBNRiQF07uX67x76ioA4QOiQ1?=
 =?us-ascii?Q?zr0ILS5uyIRB2sldvZ6mVPMIu9CIBKZBagB6UmVuu+l+ION3uQjZloZqBxRP?=
 =?us-ascii?Q?bYlyVdCElc9DsfA+sDmzmUtzQ4aOMbVVXrVxzBv/A97poWqdF5587fw5rXAZ?=
 =?us-ascii?Q?bEulZZ+qo0CKKxJNc/35JrKneM0Kc1B3F3NOCMHVHCmhzoKL+k/1AmAHZOF2?=
 =?us-ascii?Q?8PsNrl2q1110sFYSqkJkuP13b+lEzo4zlDm6ZU92Gj3y/aTrzBl6J8D0CGx4?=
 =?us-ascii?Q?5ZqJEC9vfJRzTmeaQpTx4ue42SRej1IvetW98OjBjCJ5ZkKdyMyUPcshNkJ4?=
 =?us-ascii?Q?eFbPzLKxqWaDnJ/pUTISRGgPO8yJ1aV9QxprqRcLgiVSeBvBfpLY0TxOPQCB?=
 =?us-ascii?Q?Vax0LnomfP6+db4mf5CIxWJxzM5Zp58SONMJSGAvLKiK5CwqJ2/4qkGJfuo5?=
 =?us-ascii?Q?jkJoaUV8OleU7sIhh9a4C3kTr4EF/foi5Lh8+JOHzNEKlxqk4fEHFhhhszAg?=
 =?us-ascii?Q?1vT559LbPUBe8bg7YOsGdv73NF/LSrUTR6PxwUzXz8ruB6c+LnLcaIGSZFei?=
 =?us-ascii?Q?veS0cj0aqs0yi5yNF6u5fXbuc0eoZHnfQbR5Zbs751XSZXfoh1X1lzCuIsWw?=
 =?us-ascii?Q?vKmp4PeR7CE0WjGbOpqDjtRnwjjqb53w77OL/hFwEarHcVwAP1nkhZiOOPnL?=
 =?us-ascii?Q?AO/yTdTZncuWd0ASa82YkZG4sU3R0p7G7kEvbiJwSzG3bwBtRJev4Fsykd3f?=
 =?us-ascii?Q?LTaYj2J5XVAl+VTeiJkqjNSJVZnfFHkcdQ9MCFju6WhNRulFMz1cT8rY7NkL?=
 =?us-ascii?Q?lWHGcK6EBkWZsL5RHTj0mhOuVtaXLBy3YMXI0ipXRB/CT9y1/B6xDye+mZiV?=
 =?us-ascii?Q?LKpt00Ga4kAMZRRugs9bDdVNE7sL4xPE2PLTiJv2FZuc9PvhCyJRlhcf4EHf?=
 =?us-ascii?Q?g0YJ3rGM7Mb0djqwAlecOfPVlkrmRMOuHEmQRDF+tAcpetbqVz20qHLY+nSd?=
 =?us-ascii?Q?5qJe3jApSHdIYmnQ7bRA1Mfx+XAPbuO4mdbAWyZaMT5H9YT4ItRNMHNZqpxH?=
 =?us-ascii?Q?qHMBXm0TRIsFCnXRtW1Cz0LIoQWedmkqcgq0Uc/L?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd7a6ff3-fd2e-4a4b-2c5d-08dba0329f99
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 21:32:29.3846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IkLb43SAa3y9ifEiNail27LKAzDouE/UF9k+2U/2EckW45TqL6EfSh6iVPRG2tb5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8027
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
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <jroedel@suse.de>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It turns out several drivers are calling of_dma_configure() outside the
expected bus_type.dma_configure op. This ends up being mis-locked and
triggers a lockdep assertion, or instance:

  iommu_probe_device_locked+0xd4/0xe4
  of_iommu_configure+0x10c/0x200
  of_dma_configure_id+0x104/0x3b8
  a6xx_gmu_init+0x4c/0xccc [msm]
  a6xx_gpu_init+0x3ac/0x770 [msm]
  adreno_bind+0x174/0x2ac [msm]
  component_bind_all+0x118/0x24c
  msm_drm_bind+0x1e8/0x6c4 [msm]
  try_to_bring_up_aggregate_device+0x168/0x1d4
  __component_add+0xa8/0x170
  component_add+0x14/0x20
  dsi_dev_attach+0x20/0x2c [msm]
  dsi_host_attach+0x9c/0x144 [msm]
  devm_mipi_dsi_attach+0x34/0xb4
  lt9611uxc_attach_dsi.isra.0+0x84/0xfc [lontium_lt9611uxc]
  lt9611uxc_probe+0x5c8/0x68c [lontium_lt9611uxc]
  i2c_device_probe+0x14c/0x290
  really_probe+0x148/0x2b4
  __driver_probe_device+0x78/0x12c
  driver_probe_device+0x3c/0x160
  __device_attach_driver+0xb8/0x138
  bus_for_each_drv+0x84/0xe0
  __device_attach+0xa8/0x1b0
  device_initial_probe+0x14/0x20
  bus_probe_device+0xb0/0xb4
  deferred_probe_work_func+0x8c/0xc8
  process_one_work+0x1ec/0x53c
  worker_thread+0x298/0x408
  kthread+0x124/0x128
  ret_from_fork+0x10/0x20

It is subtle and was never documented or enforced, but there has always
been an assumption that of_dma_configure_id() is not concurrent. It makes
several calls into the iommu layer that require this, including
dev_iommu_get(). The majority of cases have been preventing concurrency
using the device_lock().

Thus the new lock debugging added exposes an existing problem in
drivers. On inspection this looks like a theoretical locking problem as
generally the cases are already assuming they are the exclusive (single
threaded) user of the target device.

Sadly, there are deeper technical problems with all of the places doing
this. There are several problemetic patterns:

1) Probe a driver on device A and then steal device B and use it as part
   of the driver operation.

   Since no driver was probed to device B it means we never called
   bus_type.dma_configure and thus the drivers hackily try to open code
   this.

   Unfortunately nothing prevents another driver from binding to device B
   and creating total chaos. eg vfio bind triggered by userspace

2) Probe a driver on device A and then create a new platform driver B for a
   fwnode that doesn't have one, then do #1

   This has the same essential problem as #1, the new device is never
   probed so the hack call to of_dma_configure() is needed to setup DMA,
   and we are at risk of something else trying to use the device.

3) Probe a driver on device A but the of_node was incorrect for DMA so fix
   it by figuring out the right node and calling of_dma_configure()

   This will blow up in the iommu code if the driver is unprobed because
   the bus_type now assumes that dma_configure and dma_cleanup are
   strictly paired. Since dma_configure will have done the wrong thing due
   to the missing of_node, dma_cleanup will be unpaired and
   iommu_device_unuse_default_domain() will blow up.

   Further the driver operating on device A will not be protected against
   changes to the iommu domain since it never called
   iommu_device_use_default_domain()

   At least this case will not throw a lockdep warning as probe
   is done under the device_lock already.

While it is tempting to just add a device_lock() around the few missing
places, this doesn't solve the above underlying problems with those
callers.

For this reason remove the locking assertion in the iommu code so that
theses driver problems continue to remain hidden.

Add a comment to all the problematic call sites to encourage fixing and
discourage future cut & paste expanding the problem.

Add documentation to of_dma_configure_id() explaining the locking.

Fixes: b19ca5922dff ("iommu: Do not attempt to re-lock the iommu device when probing")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/d090f196-a5c2-b188-31bf-e42553d8d251@samsung.com/
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/bcma/main.c                              |  4 ++++
 drivers/dma/qcom/hidma_mgmt.c                    |  4 ++++
 drivers/gpu/drm/etnaviv/etnaviv_drv.c            |  4 ++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c            |  8 ++++++++
 drivers/gpu/drm/sun4i/sun4i_backend.c            |  4 ++++
 drivers/gpu/drm/sun4i/sun8i_mixer.c              |  4 ++++
 drivers/gpu/drm/vc4/vc4_drv.c                    |  4 ++++
 drivers/gpu/host1x/bus.c                         |  4 ++++
 drivers/iommu/iommu.c                            | 12 ++++++++----
 drivers/media/platform/qcom/venus/firmware.c     |  4 ++++
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c |  4 ++++
 drivers/net/wireless/ath/ath10k/snoc.c           |  4 ++++
 drivers/net/wireless/ath/ath11k/ahb.c            |  4 ++++
 drivers/of/device.c                              |  3 +++
 sound/soc/bcm/bcm63xx-pcm-whistler.c             |  4 ++++
 15 files changed, 67 insertions(+), 4 deletions(-)

This is my suggestion to the issue, I don't like removing the locking
assertion but if we can't have debug kernels reporting existing bugs then this
would be the next best option.

I've CC'd all the driver owners, if people have better explanations for what
their drivers are doing please share :)

diff --git a/drivers/bcma/main.c b/drivers/bcma/main.c
index 7061d3ee836a15..4df97000d7e0a7 100644
--- a/drivers/bcma/main.c
+++ b/drivers/bcma/main.c
@@ -208,6 +208,10 @@ static void bcma_of_fill_device(struct device *parent,
 
 	core->irq = bcma_of_get_irq(parent, core, 0);
 
+	/*
+	 * FIXME: of_dma_configure() should not be called outside
+	 * bus_type.dma_configure
+	 */
 	of_dma_configure(&core->dev, node, false);
 }
 
diff --git a/drivers/dma/qcom/hidma_mgmt.c b/drivers/dma/qcom/hidma_mgmt.c
index 05e96b31d87169..2efd97747d37b3 100644
--- a/drivers/dma/qcom/hidma_mgmt.c
+++ b/drivers/dma/qcom/hidma_mgmt.c
@@ -390,6 +390,10 @@ static int __init hidma_mgmt_of_populate_channels(struct device_node *np)
 			goto out;
 		}
 		new_pdev->dev.of_node = child;
+		/*
+		 * FIXME: of_dma_configure() should not be called outside
+		 * bus_type.dma_configure
+		 */
 		of_dma_configure(&new_pdev->dev, child, true);
 		/*
 		 * It is assumed that calling of_msi_configure is safe on
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 31a7f59ccb49ee..22729c66e39a65 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -635,6 +635,10 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 	 * device as the GPU we found. This assumes that all Vivante
 	 * GPUs in the system share the same DMA constraints.
 	 */
+	/*
+	 * FIXME: of_dma_configure() should not be called outside
+	 * bus_type.dma_configure
+	 */
 	if (first_node)
 		of_dma_configure(&pdev->dev, first_node, true);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 5deb79924897af..509bd8b7ec12ae 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1492,6 +1492,10 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
 	gmu->dev = &pdev->dev;
 
+	/*
+	 * FIXME: of_dma_configure() should not be called outside
+	 * bus_type.dma_configure
+	 */
 	of_dma_configure(gmu->dev, node, true);
 
 	pm_runtime_enable(gmu->dev);
@@ -1556,6 +1560,10 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
 	gmu->dev = &pdev->dev;
 
+	/*
+	 * FIXME: of_dma_configure() should not be called outside
+	 * bus_type.dma_configure
+	 */
 	of_dma_configure(gmu->dev, node, true);
 
 	/* Fow now, don't do anything fancy until we get our feet under us */
diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index b11dbd50d73e98..30cbefb6799e51 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -800,6 +800,10 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
 		 * for us, and DRM doesn't do per-device allocation either, so
 		 * we would need to fix DRM first...
 		 */
+		/*
+		 * FIXME: of_dma_configure() should not be called outside
+		 * bus_type.dma_configure
+		 */
 		ret = of_dma_configure(drm->dev, dev->of_node, true);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 11d5244a5aa5fc..e26bea207599d3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -399,6 +399,10 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 		 * DRM doesn't do per-device allocation either, so we
 		 * would need to fix DRM first...
 		 */
+		/*
+		 * FIXME: of_dma_configure() should not be called outside
+		 * bus_type.dma_configure
+		 */
 		ret = of_dma_configure(drm->dev, dev->of_node, true);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 823395c23cc308..82496d8fb50f84 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -305,6 +305,10 @@ static int vc4_drm_bind(struct device *dev)
 	node = of_find_matching_node_and_match(NULL, vc4_dma_range_matches,
 					       NULL);
 	if (node) {
+		/*
+		 * FIXME: of_dma_configure() should not be called outside
+		 * bus_type.dma_configure
+		 */
 		ret = of_dma_configure(dev, node, true);
 		of_node_put(node);
 
diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 4d16a3396c4abf..5c7ef738a7d7d7 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -475,6 +475,10 @@ static int host1x_device_add(struct host1x *host1x,
 	device->dev.bus = &host1x_bus_type;
 	device->dev.parent = host1x->dev;
 
+	/*
+	 * FIXME: of_dma_configure() should not be called outside
+	 * bus_type.dma_configure
+	 */
 	of_dma_configure(&device->dev, host1x->dev->of_node, true);
 
 	device->dev.dma_parms = &device->dma_parms;
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 18162049bd2294..eb623a611f571d 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -458,8 +458,15 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 	 * Allow __iommu_probe_device() to be safely called in parallel,
 	 * both dev->iommu_group and the initial setup of dev->iommu are
 	 * protected this way.
+	 *
+	 * We cannot have the assertion yet because of a number of drivers
+	 * improperly calling of_dma_configure() and expecting to attach
+	 * the iommu outside the bus_type.dma_configure callback. This messes
+	 * up our ownership tracking, does not exclude other drivers from
+	 * binding an operating the device, and is technically mislocked.
+	 *
+	 * device_lock_assert(dev);
 	 */
-	device_lock_assert(dev);
 
 	if (!ops)
 		return -ENODEV;
@@ -527,8 +534,6 @@ int iommu_probe_device_locked(struct device *dev)
 	const struct iommu_ops *ops;
 	int ret;
 
-	device_lock_assert(dev);
-
 	ret = __iommu_probe_device(dev, NULL);
 	if (ret)
 		return ret;
@@ -1202,7 +1207,6 @@ void iommu_group_remove_device(struct device *dev)
 		__iommu_group_remove_device(dev);
 	}
 	device_unlock(dev);
-
 }
 EXPORT_SYMBOL_GPL(iommu_group_remove_device);
 
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index cfb11c551167ce..f70360c5534d64 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -296,6 +296,10 @@ int venus_firmware_init(struct venus_core *core)
 
 	pdev->dev.of_node = np;
 
+	/*
+	 * FIXME: of_dma_configure() should not be called outside
+	 * bus_type.dma_configure
+	 */
 	ret = of_dma_configure(&pdev->dev, np, true);
 	if (ret) {
 		dev_err(core->dev, "dma configure fail\n");
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index e30e54935d79a9..40fa7b62545d7a 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -1114,6 +1114,10 @@ static struct device *s5p_mfc_alloc_memdev(struct device *dev,
 	 * to be treated as valid DMA masters we need a bit of a hack to force
 	 * them to inherit the MFC node's DMA configuration.
 	 */
+	/*
+	 * FIXME: of_dma_configure() should not be called outside
+	 * bus_type.dma_configure
+	 */
 	of_dma_configure(child, dev->of_node, true);
 
 	if (device_add(child) == 0) {
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 26214c00cd0d7b..977e5c6186b131 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1614,6 +1614,10 @@ static int ath10k_fw_init(struct ath10k *ar)
 
 	pdev->dev.of_node = node;
 
+	/*
+	 * FIXME: of_dma_configure() should not be called outside
+	 * bus_type.dma_configure
+	 */
 	ret = of_dma_configure(&pdev->dev, node, true);
 	if (ret) {
 		ath10k_err(ar, "dma configure fail: %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 139da578831a44..a4d2a89ab96de0 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1012,6 +1012,10 @@ static int ath11k_ahb_fw_resources_init(struct ath11k_base *ab)
 		return PTR_ERR(pdev);
 	}
 
+	/*
+	 * FIXME: of_dma_configure() should not be called outside
+	 * bus_type.dma_configure
+	 */
 	ret = of_dma_configure(&pdev->dev, node, true);
 	if (ret) {
 		ath11k_err(ab, "dma configure fail: %d\n", ret);
diff --git a/drivers/of/device.c b/drivers/of/device.c
index 0f00f1b8070829..bc6f62ebcbd040 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -108,6 +108,9 @@ of_dma_set_restricted_buffer(struct device *dev, struct device_node *np)
  * If platform code needs to use its own special DMA configuration, it
  * can use a platform bus notifier and handle BUS_NOTIFY_ADD_DEVICE events
  * to fix up DMA configuration.
+ *
+ * This function should only be called from the bus_type.dma_configure callback
+ * and the driver_lock(dev) must be held.
  */
 int of_dma_configure_id(struct device *dev, struct device_node *np,
 			bool force_dma, const u32 *id)
diff --git a/sound/soc/bcm/bcm63xx-pcm-whistler.c b/sound/soc/bcm/bcm63xx-pcm-whistler.c
index 2c600b017524f3..d8e0520ca61155 100644
--- a/sound/soc/bcm/bcm63xx-pcm-whistler.c
+++ b/sound/soc/bcm/bcm63xx-pcm-whistler.c
@@ -354,6 +354,10 @@ static int bcm63xx_soc_pcm_new(struct snd_soc_component *component,
 
 	i2s_priv = dev_get_drvdata(asoc_rtd_to_cpu(rtd, 0)->dev);
 
+	/*
+	 * FIXME: of_dma_configure() should not be called outside
+	 * bus_type.dma_configure
+	 */
 	of_dma_configure(pcm->card->dev, pcm->card->dev->of_node, 1);
 
 	ret = dma_coerce_mask_and_coherent(pcm->card->dev, DMA_BIT_MASK(32));

base-commit: 1bba4f1c0b4f2429e16da231a246ab4b99cc633c
-- 
2.41.0

