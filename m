Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EA978296E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 14:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CFD10E244;
	Mon, 21 Aug 2023 12:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FFF10E244;
 Mon, 21 Aug 2023 12:47:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUmLK/nmIMWHYgvdCuAf//JphfntRaXlUEjVbnjbHt/PUruU8tFzJhjoGbf2dsqtDCyueD47QuO7dq+obzHSmFeUdCwxDNfC81lSrQ5umnO+ahr73MdgancaVvxym4vsLDzIUk1dCy3gmBDub25NPcAAQxWnCb5U1yWqRFHNc38LHcyW7dRXOqIkli45lCWgLrsyoYLen1BC5qp1x990d740tAuakyxOVZpfff6lCuKKuBXwIZOIKXNMgoSksx5I9uVV8YFqU6dWYaDuXEavasPA5jo8nCSlwFjQBVcyq5D3DNzRiBSKiMMVxpkyjStVzsUp4HG3R2dbLQUZ/uIjWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5GsFyI5GJmuujrW0DUtJ8taZ70zjMgaQ0pdfSIUmQI=;
 b=MSmZsTn0suSrDgkHKmD4Nn3Vo+YNcMXsbx3uVMAOOc/dZc33r01kJO/m5WL3T1sl/ZmOjuPYoB2g6ymrhpxXlOUcn/PX5m5YfytBRCQX5ht9MKbUsZ/EyjEMikEX5QLQl516QTjefaVUbHPYmjfJtyI7gRqpTmjKqtiSvD/zV6LHIDxT+3NKxAQ28dKtgpY5270pbo9YsZMJmTJza6oHAnTZg0ZlT3DVm0DcNsH6vA23vmQ0haptQUbuozhn4xngHNmkL3hI2P4RybmtzarXKI997d3894g/zBb+sXF7lltQUuxFJbACy33FiworplFpApIa2Nt3tUQ2XbP6p6IhHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5GsFyI5GJmuujrW0DUtJ8taZ70zjMgaQ0pdfSIUmQI=;
 b=dKCEZ9XMExO+U64YpfZ899mI38wOmX1KZg5I0QsUt9dDR2XIz6fljoqIozNO88agt9bmrgdbuDiCM+jYlZyawimAu6zchOlUT1v3fX5uG6gnGBLXe6tfqJzJR0cj6q/jP8j6ZPGYMd24lT1Md1yO7M6Aei5iPG3NGTgYQx2MgOX2WddCi2juZ3GJpWBACTpeJDPZWRe3NPgeBs8/wXIYiKfS7S8cDMUZ3gqpkeZe81QXX9U8i4ALow4uQut7mFgdLDyL8bPyH6wOzZ0m9BSOxfAnrhL71iEOliogbmGbdeZFHZZVnt85RlMNFk29c4Sgvu5BoOmcU7A9BfOv6MxnwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS0PR12MB8341.namprd12.prod.outlook.com (2603:10b6:8:f8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 12:47:47 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Mon, 21 Aug 2023
 12:47:47 +0000
Date: Mon, 21 Aug 2023 09:47:46 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH] iommu: Remove the device_lock_assert() from
 __iommu_probe_device()
Message-ID: <ZONc8myQKuBceAMf@nvidia.com>
References: <0-v1-98d20e768c66+7-of_dma_lock_jgg@nvidia.com>
 <78114fd6-9b83-92ba-418f-6cc7bda9df9b@arm.com>
 <ZONYQyMSG17YMc_b@8bytes.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZONYQyMSG17YMc_b@8bytes.org>
X-ClientProxiedBy: MN2PR20CA0065.namprd20.prod.outlook.com
 (2603:10b6:208:235::34) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS0PR12MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: b5aa5770-4f00-429f-1466-08dba244d248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CGF8zel1taRlADL03+zpPzjaQXOoChnNhkSfrWMPOxDtKVuRhd1RtIocUOvCPW0Gnki0Zd+tURdQvBZVGt0wNmYeANR0Dl9BsHNm0MuklqaYI7UgyWMrVuXVahDUyb/dLkHEaB3JY05fqnvntop1/MZezqfTCTXwDBn5pfHgb/BZiC0OxI52/LO1g/1m5IpHsXr+ozrH1ZVwOtApgVV7z9w/cxNhKGNjGqYU8WdcpCDOwyDLvSsvCP16l3faRlGWF2iUjE7Xy3UDkc51q7QxjszqJ/zqZ+jaQmUUWubEi4hsOzVENB/7vLRgoZdiy10wrRt+AaXjN0/6xnXCVqO/E3+3qU6wPfSNOBT2ivoJzNQaCQC6WPPdQZC8/TdfzhHpe4+eNrs4+AjZ5JAe/DPJny1rmxB4d3pM8J43srXWKTRrTTgqVf8Yn0VPzs+pMw4Nc4yfG8lD1ITlWbP36BLClxuMqJr8eKCDPJhcMFMWE1RJjM6Y3TSqMyu6qWKmeUbVEkozxUYwUOdCvg/us5AuGhGh23Hk7tCZbvTAiqOJcTrGhyArKozypA2/lbXvgSm0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(2906002)(4744005)(7416002)(7366002)(7406005)(38100700002)(6506007)(6486002)(83380400001)(5660300002)(26005)(86362001)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(54906003)(6916009)(66556008)(66476007)(478600001)(36756003)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W8ahnWSFdLqj3/2FrxKcJRUBtTV+iTAW5m9zZr18g1KUns9xgwW1e1A5VRVT?=
 =?us-ascii?Q?x5fUDGPYJGgEIfOsaVqqIr86tfLoBzzZqzGASpypPIiRzafvbnD/FEdeOeTe?=
 =?us-ascii?Q?JF+GMm9rz2elCO8lJ59TRStXeS9IPTlbGX7xVj/XfgIevhoTSYNHsM/+jUKx?=
 =?us-ascii?Q?eIVkGRnQEf4QmqbqomeTDhQswcTCM+BLyAh8NmV5E0WLQYHR7djpdesjHkAU?=
 =?us-ascii?Q?WaTNsUIM5nHZFwrF6uTBwkSHCSBRbcYmggFh7rstw6KXfpiK49VB8lNlr3TZ?=
 =?us-ascii?Q?dLUFd1SmmCDmLaGiWmwCwD2p+J43Jilg8OdczFx9q/KudByJa2Gut+6MnctP?=
 =?us-ascii?Q?T2H9epO9edOn7s9/zltqsVuT1JsxnZK24Om7nbPeHnPxdrEzWumPai/BkO/f?=
 =?us-ascii?Q?eMtjhcUs9XPznRIjl2AJzDGxm19sih5EZQ5JCmCUtoSiqaZIp5CLo7cnaUWV?=
 =?us-ascii?Q?s++B2KVmww2Bv5MOYVBg8UyajVfwEbx0/b/QZ3vwJeudZQ/fS5y1Wmov+wmN?=
 =?us-ascii?Q?9q0aABLaRFeSmeEBmR0l+KltrJOsZ/cdum8d8BOm2dOX5TZhhyqdL1lQEuRx?=
 =?us-ascii?Q?POAv1guAfwEOV+gWe4wR7MjeApPEnqKohodtHAPuzkTWm1mQXnIpvgXtNsPA?=
 =?us-ascii?Q?t2wAz9HxRbAbyXXao2GcoeNgVJK+xVvjhjity/mdyNC117ZWrSMBYaEGyePb?=
 =?us-ascii?Q?sPIybVXSTlT9iDelE07U85c7KrkOvgliv2kM77fj1hg8k3DMCVQyKmnzY/yo?=
 =?us-ascii?Q?yv8pQMoRzdU4wemAZ0i4Aw4Lrszr8aoWOMY0hG/Xf1wr5OXDITzXOmKmoWOZ?=
 =?us-ascii?Q?Od0/Y81XTXYJ7cSKedn6sUbTGz8VfX4UMNG8tlSkqgcKBkNdXbRI9rFn1g0j?=
 =?us-ascii?Q?jXx8gSpWXqNGIcvfA6SSnN7G7NOGevMxF3WD45wvzZXieW6p1y2NUCWaDixM?=
 =?us-ascii?Q?48IhP2fpqvDRUx79zZrBFchLf58wZzqZ8dm2qMdrLJczD/0RRhgs1VVvULhM?=
 =?us-ascii?Q?TUBI3CdojgxxLLfoxAyYr+ZACZtlNRRcZV/bGUdEQaTjEmmhtf4nLGhrhjEY?=
 =?us-ascii?Q?K9uue4dEJH7k5CDiSdOAFkidpTi6uRLfvdO+cTYfEf9m1IOxmPvaL993uVlb?=
 =?us-ascii?Q?QMueK6OzFgvxV2rNJe5Dsee1lXWVXMcf6/YR8wQTio+3KtAOKz7MKR0UZYXp?=
 =?us-ascii?Q?2cvrb3KJflAzdxivD470bJZg+X7UFoJttkoy5fI2SHTlovYc3uAE2skmZZ3v?=
 =?us-ascii?Q?xi4yKDuKYej1mgiS+tac97uvgpRFL6CBWcT7DYkJ9URRLiA/GZAYLB1h4BzO?=
 =?us-ascii?Q?KfBYpzgGUUSBoEDw7r6GnLnZHq1ntP8DKmEYYei3xNk120DtHRRfEqR9RsQq?=
 =?us-ascii?Q?PZIbhgG5+6m5utQBP87o6Cxdj7haMxTJ+xcdaL2C9AB4JgEAGNI6m2AveaUX?=
 =?us-ascii?Q?dKwXWOH7HG2HWgS9sIdHTgBpbH38Lh9ud21yvoyFv9jedabbDJBdHU9Ibtmp?=
 =?us-ascii?Q?bO6MPmfKFv3pnh68MlcT95ORcuJp4nhCWlDGFQL/jDmQeLdR/sVKxHq6xDP1?=
 =?us-ascii?Q?PwzaOa8VVCG2HmRQOwKw1ROZY93Duo6WOvWAtJw7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5aa5770-4f00-429f-1466-08dba244d248
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 12:47:47.5545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j9LDXsRLWNFEJxLIhFjHq/MXAkLThR3n/3J7GHPZ13/ftt9AIhg4pymIazkmRRfo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8341
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
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>, ath10k@lists.infradead.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Samuel Holland <samuel@sholland.org>, Takashi Iwai <tiwai@suse.com>,
 Sinan Kaya <okaya@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, iommu@lists.linux.dev,
 Andy Gross <agross@kernel.org>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, ath11k@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Joerg Roedel <jroedel@suse.de>,
 Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 etnaviv@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dmaengine@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org,
 Bjorn Andersson <andersson@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 linux-wireless@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-sunxi@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 21, 2023 at 02:27:47PM +0200, Joerg Roedel wrote:
> On Mon, Aug 21, 2023 at 12:06:40PM +0100, Robin Murphy wrote:
> > The solution is to drop those locking patches entirely and rethink the whole
> > thing.
> 
> Agreed, that was exactly what I thought when looking at this patch.
> 
> I dropped the original 10 patches and the 4 fixes on-top from the IOMMU
> tree. This needs more investigation and adaption of the actual API users
> before it can be reconsidered.

Why did you drop the whole series? The group changes are fine

Jason
