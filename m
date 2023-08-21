Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1541D782986
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 14:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE6610E240;
	Mon, 21 Aug 2023 12:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4E010E240;
 Mon, 21 Aug 2023 12:51:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7BQAzKPrgxwRngTKBIFi4+8d4w3WY8Fz5oE+M3hYVFWGIRBA/V3H16gZJ1I3XzV+5LQNGrbsdLFsJfuVah0XJW0b3jnZm3A3+uNWbqIwuKSfhjCpcnpUwaCh2oIe+4mQhXyAWsi3YM0I6r0NVlSC+nRluk9aTfFNUPHtXoPWwJER+HIN/DX2/nLsA+CGB0PJQ4JbsDUP7vttA6rCX2KxVmUj6Z3W2RL72S+tuFPw8JxAITWlRsNYWBGIr3OQYnv/z5ApZPMPY4ao/9vxl8WvlR/EjMq5tfVdCkpxW4hEYgj8+rRZeeLysXp9L4puAqpqyleQ9Cgwclrbq1f7pfZZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNuaXDjHiLTHoXA1rCLSHzrfqpYj+Qp6ClJy4a+iF3s=;
 b=fPKVj7ZdDYd5jTcEmgPeyJL8kNeHtoS1Ecu+nuL1hEZTR46woWWTZ6vZjNl/snd+x/DkJMXi9+iCdr3oISzGmo2uKpH3QtY/raAGiRMlr5Ucq/B9S3tTN7kD69/GmqLgunc4Ek6cE6/0TE3LyiD7QD/sGFh92tLdDaEOQZAmPueQT+krR7hN9PQNJw9pYFmcV4mWRJ2C8SFOV2Sdk6DIqp8mZkmoomw3R5k9eT4TGGrNRp9JcpNa+FQbsmj74HxelPGWqt72Ly9SMZ4WrrIQWLp7HJ8I1AARpzSI1QXAkr0bY+LOqHbfzcAF1RoFZDDL+l03icr81tXDAG48Azk7kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNuaXDjHiLTHoXA1rCLSHzrfqpYj+Qp6ClJy4a+iF3s=;
 b=nEY/xqeRZOYs1fPi/IBTRm9Qwk13YtTo3/euHfWyYKYMFQ1xFwVXBspHrM3jKPl/3A8Iv9RutwCxq9TkW0SLjLgldeUFEH6+8Bcrf/kQnHunEkEV8LNrSs9HW8upkrxx5idkU8cat08jZQFmU5RJUsD6uB4rrxqgbTo1w2KWVim+QlPCqoT73M+SHofjLs1rOlxI77GZw9b90GSRqO97Lh5NOsC21dlKxq2/4UCDNyzs+FJwOxjkALkxMHUw/sGB7GAzUfJ+0fjon6vNUKugLroB+IJIuRot4818fKueVWYa9vYeG3igp64Bo9GdVF6hqBxReZQV9tMNm74HKcRQfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW4PR12MB6850.namprd12.prod.outlook.com (2603:10b6:303:1ed::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 12:51:14 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Mon, 21 Aug 2023
 12:51:14 +0000
Date: Mon, 21 Aug 2023 09:51:13 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu: Remove the device_lock_assert() from
 __iommu_probe_device()
Message-ID: <ZONdwclGOBaxxqtq@nvidia.com>
References: <0-v1-98d20e768c66+7-of_dma_lock_jgg@nvidia.com>
 <78114fd6-9b83-92ba-418f-6cc7bda9df9b@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78114fd6-9b83-92ba-418f-6cc7bda9df9b@arm.com>
X-ClientProxiedBy: BL1PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:208:256::19) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW4PR12MB6850:EE_
X-MS-Office365-Filtering-Correlation-Id: 22a4b79b-00ea-433c-9893-08dba2454dc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NmrlHYkggJ2nHAKVj3phCceisxZjgFBWKPZGEdbGXIrb/Dn6Jz1MTkbJ+UtrEms0c1T7E40uC6M3aKBda2ZxT7aRbwd9U7F/weLPJBD8ZQZ6JGVW80ofrYpNuUIGlIlQQ/OPWPE/gC77LxyW+Ylke5fYRpBv4wKQQGBWlw5284LxFT+I7HkfIAzrWteRCIRUYr8Ts2xTG3hbFFnWd1ijt6REYiN1J5xyrv/JUuOmNVAdINGN+t4CQNDe6+azMvzgDCmXKQM/0CSU/Yce/DdAwCwUqykOoeDUzgR1MbIJF/8NNGx0yCfXdFPc6B8lMSqOQk0LQH5bTuelBxa1ZsPVzfoFqqHYdHaQbStL6Q6oAOnSo9mRxAKZ7ZDK0HIqN1nCy6YnWl5FKAE4GrKgSpTYnEGxMQ6bc+ms3Qznv/tk37/0Rdm3KfdzQnStaXPIWcAo9ch8ZshT501iHBIGQyvSclxWYOzltSKXGrBc1qXAFj00K6nrsN0w9BH+jl8Mb4BnxXVf1vaFToVwlV8wvYwc0rfTa7N9qYr4S/U82NgJ/LZd4dySrUtuohdvQOreiAAi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(2906002)(7416002)(7366002)(7406005)(53546011)(38100700002)(6506007)(6486002)(83380400001)(5660300002)(26005)(86362001)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(54906003)(6916009)(66556008)(66476007)(66899024)(478600001)(36756003)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QyYxkkE3o5nnOsinGeWKraNyp7F/ly8111ZXt/Apzu/dIyuyU1VHdEpfZbe2?=
 =?us-ascii?Q?3AXfinDTVEGRcbzzxmbcHClfnkarHt5zhCEQUFh6AsdK5+FNy8fzIhXMW74p?=
 =?us-ascii?Q?0DWJINg79XKnutBQY7uRSHclHGpWzjQVxLWZwcfeXfmjotdKIpxiTUczpc+R?=
 =?us-ascii?Q?ewky8YThyjT/1FFKrullofYydPUR6RKAb34DpnhIlQX+kR8mdDfvcpEdGbJy?=
 =?us-ascii?Q?qKyQgXD3yFqP5icje6t0Gl0a7WV4SoHAbmoII8+/CsOUkhmYERrvEdCgSx8C?=
 =?us-ascii?Q?k9VrMUVFQsDt4GjLrY1xgpbu8KSviWQkIVhN6gjXKAKb5QCSXHxNIU7loBo0?=
 =?us-ascii?Q?+HYVmTZxJPF4yYZu5o5twgEy6m75ldrLHZx6tdAUiW0sCtSL0NP18+TT7CXB?=
 =?us-ascii?Q?dpVKv+6DuQZd14u4FdNTRIzygPFi7wTgGzeQkNWYtrjwyjYCc/hA9dcxdWe2?=
 =?us-ascii?Q?c8ALaRS/pm2KGUHVdBmAUAAgRv+u6U/kTVb6hyYw4N5E8ALFaC+Mvk3bMmGx?=
 =?us-ascii?Q?PpTWsHV+0+kM0kblTTGjYKfBqA4/ePG1cfozdhNibwJdqtAJE6GzaApydHjA?=
 =?us-ascii?Q?7rzkqxt2ZFSjbRKNk1ox1Gd6x01rTzbP05db/wXr8WFNo4PBi2DTzmkbkCtU?=
 =?us-ascii?Q?zCCGg9mEifgIyVyScNsjvpGUEW0EYOeoGzB6+YsH9e96Ls8EchDtj+/HV1WS?=
 =?us-ascii?Q?c9mbBMx/WauKwUe/hj0JN05o2KCtKe6aqWQGafg2c0X534dM2p0WHq26kyX0?=
 =?us-ascii?Q?LGZ5ph9xGWTCExNzrl6F+/ufk8e0t0E2CfrFKJC/x0rXpEOSuE21oF9J8XG9?=
 =?us-ascii?Q?7+2bQ5u8uPKu3R5zZSdyvhEV7oigUbDeaO1TMJ/7C8ZPae5v4MjQSmqlTtJK?=
 =?us-ascii?Q?jgn0tj9/LVu4m/0mKRI0bU5OBl0RW6i6+JoHT+vTHpnqD1zcsxv77Vh0j9nt?=
 =?us-ascii?Q?YQWhBf+JO2cQBV5xwIc3DIX5WnaM0AqTMO9FKixncc45zGqmQvt7vLK3+w5l?=
 =?us-ascii?Q?JPgZzcerqLPD8+T1bj7p0i2ns9y1kXSbzoD4VH5IHohSDfXczZf4ncg04jWD?=
 =?us-ascii?Q?nKS4GoZ1aOQr3qgU2dOmeHoifsUj/rbP+tSB+Tl0jO251srLVaHvXJBSGwN0?=
 =?us-ascii?Q?E1q2J4P+ueacY4o3uoUCgKlTqPFB1QlUeqtFEuysULd9E0ZdY0cFzzpB1rQ0?=
 =?us-ascii?Q?QhoAwYqkKiqtSA6qLzOH7WjMbugev7mzixBGH+ZiWGhIGzyIMfThd//gngZC?=
 =?us-ascii?Q?w9ZUILIMTuy/o5pQn3TEMIKRwMOpZxMaOwChcwkfAJCKoCFQiPdl5C5DMP75?=
 =?us-ascii?Q?AqZWHp9DI3QaDmm6oFsdsjhUVs9wtJ8Ys8cG1OQIwNJ6sj7pJ+i3nVc5UuCx?=
 =?us-ascii?Q?NDtoE4a/wrQiAg2NzhgsPHlUrPbiQYhck0rUPipUcNesIafZcZoDhm5D411p?=
 =?us-ascii?Q?Tb+ZcI8YD1aYmATgeMlTh+sTJF/HjIZoNmn2gA54QiyZTqVMj7CdZ38Vbmx1?=
 =?us-ascii?Q?DX7k5gnQJLXKuATibwv9Yvp2TDvjFQCrTQ+aBx5AL2m11beCroNgzox32An8?=
 =?us-ascii?Q?3DjhuSH+E3B8pFE6CxGtwnFrNWg7XRXv40FyPLtN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a4b79b-00ea-433c-9893-08dba2454dc7
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 12:51:14.7494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aDWV5dP5qf0J2bIIwmISU7r9iWwbX7ZHaYBaOMnqZq4awKkP8i1jm5Sof6FA5faL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6850
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
 Samuel Holland <samuel@sholland.org>, Joerg Roedel <joro@8bytes.org>,
 Takashi Iwai <tiwai@suse.com>, Sinan Kaya <okaya@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 iommu@lists.linux.dev, Andy Gross <agross@kernel.org>,
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
> On 2023-08-18 22:32, Jason Gunthorpe wrote:
> > It is subtle and was never documented or enforced, but there has always
> > been an assumption that of_dma_configure_id() is not concurrent. It makes
> > several calls into the iommu layer that require this, including
> > dev_iommu_get(). The majority of cases have been preventing concurrency
> > using the device_lock().
> > 
> > Thus the new lock debugging added exposes an existing problem in
> > drivers. On inspection this looks like a theoretical locking problem as
> > generally the cases are already assuming they are the exclusive (single
> > threaded) user of the target device.
> 
> Sorry to be blunt, but the only problem is that you've introduced an
> idealistic new locking scheme which failed to take into account how things
> currently actually work, and is broken and achieving nothing but causing
> problems.

That's pretty dramatic. I would have prefered this series have some
more testing before Joerg took it, but this is certainly not
"achieving nothing but causing problems". Introducing a real scheme
for how locking is supposed to work here is going to cause some
strain.  We've had a long period where the lack of any locking rules
has yielded a big mess held together with hope and dreams.

Of course there will be crazy stuff. If these 13 drivers are the only
problem then we've done pretty well.

And at the end we get *actual rules about how locking works* Wow!
Certainly not nothing.

What I want to hear from you is a concrete reason why device_lock() is
the *wrong* lock here. I can't think of any reason why we can't obtain
the device_lock in all the places that want to probe the iommu driver.

Nor, can I see a reason why it would be a bad choice of lock after all
the dma_configure logic is reworked someday.

> When their sole purpose was to improve the locking and make it
> easier to reason about, and now the latest "fix" is now to remove
> one of the assertions which forms the fundamental basis for that
> reasoning, then the point has clearly been lost.

I do not want to remove the assertion, I think the assertion should
stay so people running debug kernels on these drivers can get warnings
about the existing problems in these drivers.

It is removed mostly because we are at rc7, otherwise I'd play wack a
mole adding the device_lock and a nasty comment to the drivers. We can
tackle that in the next cycle and put the assertion back.

> All we've done is churned a dodgy and incomplete locking scheme into

Well, at least we agree what we have today is not great.

> And on the subject of idealism, the fact is that doing IOMMU configuration
> based on driver probe via bus->dma_configure is *fundamentally wrong* and
> breaking a bunch of other IOMMU API assumptions, so it is not a robust
> foundation to build anything upon in the first place. 

So now that Joerg has dropped it - what is your big idea to make the
locking actually work right?

Jason
