Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DBC7FE047
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 20:26:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC2E10E378;
	Wed, 29 Nov 2023 19:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6B210E65E;
 Wed, 29 Nov 2023 19:26:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPngBYLIfJOMmj1JEZ9anFgmA8XfohgsJFsG9dJqkZGvFTfuQG8EJmBl1SBGNWaZf7ou96bDgjBO0VAxv/yti8tAKhTYttg0MAs0qiABC3h+945H7mPIppb3kc/nFO+TiIiWV7vOQhovTfwY4/xmGlmRV9H3c/kz5aTyEEsQE8S89R1LqR/MoO6R3abWkeZF4/re3a1QW4Wr8D44onbG6wNKcQwf+Lg+wmj/74LDm3Z2f2c+VD770+oXCcMurQilJ3qINEoinTRSR63070ipKQvW30KcjjMZQ1w1ARjm2Yd9zISQzNlgXKvQ3xY70ZrZLYTiWezKY2SXhV0cgfdS+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCEOJM6r+XvWrMfoFRBxwenF80/v0lWdRUy5zPbPphs=;
 b=kctR6ppXdGWj3Fz3qAUPnouXa5iU0I7D4K1D+OmjLxw9EYps2JG/8lLQNrPcrpaPmoz2et8+9R9tk0fo834AuiFDBmb9aPLuLICn48vaJQ6CpwK1syZ0VzwTchp94Aq3otK6AMeEIbYcR/0UtDkD6vk6I3FXwJwFINgZem8sigGhH9FT22lctRNsp/NtekowI/Y8Dd/0TrKw+igdcXZPX/GPexUA84RkNVnLLPKZu/IqHqjIn2L8X+xdwc7LX6Y4R8Qwkfsrt2Y6mFF3n664g/h185A/EOFsmlcM1OdAj2O9LfrUkta3EwL5PJSMNwnR12+iI5cWpkeAbN7YG0NfTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCEOJM6r+XvWrMfoFRBxwenF80/v0lWdRUy5zPbPphs=;
 b=mW10LyMfl3p9lAsXkCq2SYhk2rVDJehSMnpez8LXC9bedFRN62t/DL4CwmbtzOtgd5Z1JeVMxCklzaAK0hG3xuq97IffNmbNBwrI7uqeov9+tANzing9981WsSElUW2JhE9MByKzMwYXQVcdL6YbFDPHb/+tGq29Eeg74MmrujZrt+kO+eyMpLP7rXJNwaV2L2Q+WYPSiEFsLQk2lOWDkqNock1zVbbVrC6qaubnv/zXnxhpMTV6fVOrqvPvRJ7s1kJ02J+OBiLKRiYuM51UXhVnar758yZKKsWaMqwRj0QF6Xd8hjaP+sE1jn98H9wspCVdvQR9X3lDU11bvumB/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB9104.namprd12.prod.outlook.com (2603:10b6:510:2f3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 19:26:05 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 19:26:04 +0000
Date: Wed, 29 Nov 2023 15:26:03 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 08/10] iommu/tegra: Use tegra_dev_iommu_get_stream_id()
 in the remaining places
Message-ID: <20231129192603.GA1387263@nvidia.com>
References: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <8-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <ZWdlcboM4Xzs38NI@orome.fritz.box>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWdlcboM4Xzs38NI@orome.fritz.box>
X-ClientProxiedBy: SN4PR0501CA0109.namprd05.prod.outlook.com
 (2603:10b6:803:42::26) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB9104:EE_
X-MS-Office365-Filtering-Correlation-Id: 450f25c9-f8bb-4b4a-a3ba-08dbf1110760
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kml3tOxUKByyMYMKjHOmjxnAf+/gOuuwq5Z346QBScvllEoCYi2SYycwqjD2bmo0JfkPMJQp0KwS1mXxODEEeE+4wfeN31GaS5snt1awWRwKkDr+Ojfe4bCO57Letm7VS/tjgsdVf/o/IyUXjyRbIZseQ4HhJI8kGUztKHRHM1pgMpS5IgGQHPgDrLtIUWbrIS9UkH2e5FqT5PlxYusnWemOq1/+xVkChTPXv42Ys73Z0FhxhrFeavoi8REqOdUy7RUjDV1I2upml+CVUvQY4u8NvPgLGLnCQz3BxkjZ5Kg5dgAqybJnj/3Gzt9XQGDyasioHbVrRO1d6Bldw9kt03HGn67V9X8vnlmV6ro1Ne1/RIg2YkLPFgwtFYI+Ef0+Oq/USRugNIGBdMnV7oFivMPxWj3SFP3jpVgiT7h2tadcvtFZcvhXjqH36SBVaq9CXQL+BdG6HLMVK6iiUMozAwbDSBamzxOrWUjHlw4rvb3MGOSMUGiu1uSU3dZu10ipIfdlHjPn7pZHNjvRRlJuBOefF/kES29pkJacH0rvdB5Z4o782H4a2M4gtShHReeZmN97EY332t+jHKi7X5Cne951OOk8Z0O/LtrB39OX2Jm9Etb5aRI69wwy+8MKXIB7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(39860400002)(136003)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(5660300002)(2906002)(8936002)(8676002)(4326008)(7366002)(7406005)(7416002)(41300700001)(202311291699002)(316002)(6916009)(66556008)(54906003)(66946007)(66476007)(86362001)(1076003)(2616005)(478600001)(36756003)(6512007)(83380400001)(6506007)(26005)(33656002)(38100700002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oCUIZHsjahC5JloA1Q9ynCPrhqjiYrctnOM4OsExXwdty32uQd4TAh9d8F1V?=
 =?us-ascii?Q?CnZ3MHk8Ka68Ab2ppqe6OpYn3QM8JrGeCHNVUwFG0DFWUKBt6SsB+pmAmnIJ?=
 =?us-ascii?Q?VXCfetQ+8htCUkORGSv8JS/3KA0ucMxEvGWZcIKkRxU7ClDvWROsJyD9G5ea?=
 =?us-ascii?Q?o/DYUWDOy5kBXbhaYus1SUnddEGbBRIuCIZ/qmdk26Eik/Zch4IgnGBT8r5R?=
 =?us-ascii?Q?/MGIrKJIxqwOHfZUqAGBqQy0+hIDO5vFxnrJkKihLp1JwpvtO3Hu4Xg8Kwu2?=
 =?us-ascii?Q?6VmujoM+b2yYBFWj0hhtg8RwvgjB3QQyBCU61KBP21vqjkra7dPjuMwptHHW?=
 =?us-ascii?Q?HJgFXSkIcxnYhp+6Yu24pVF6RGDga3ml33FUsJfS4mIYMeMcer0tQelMZzaL?=
 =?us-ascii?Q?AUhJ8JV6qGwmnar5fcO9rI0u4uWX9ZVprj0bkL8iBCsL/xiS9uJnafqYB2zz?=
 =?us-ascii?Q?PyHLy1wFBm78YJX17a8hW/eeK/uZNYHzd1XD83Vk9sTXpF/oOaoljSIng2Ry?=
 =?us-ascii?Q?+IIi7ecbf8BnbaDGvXZQ6WfwmFaTPTt5aD8R3IOFyGc7LRzjCt5GLfKh6wNm?=
 =?us-ascii?Q?cMy9E5uZGQyWQBS7554aXo/dj1tEzE6qKxPzFXXRTQe3ceblMtUg3hX7AjYZ?=
 =?us-ascii?Q?32a2jwFn5KXXT4bmGLH5bX3/6NQOHiTldFj9b9c6ZQMwEL2Sc7EU3LPDb7U2?=
 =?us-ascii?Q?3DdxrJURGBH6+1EAUIf4aqWoLuKtd1kiEwOMRJ5DUN8W1aXN1Gmis9+vMaPy?=
 =?us-ascii?Q?nABttKX2HvwGge6Ta8w50UnIrzliwgu+S0pqB5lSOhyqf/TBKIbNmnqHSu1g?=
 =?us-ascii?Q?rRwfDDiWWD47RCicAS+sCPpEYHnleFYSiKxLx4Enbdz/NBhYJAdis13y9ew+?=
 =?us-ascii?Q?k/ro9RD8Ysv7mPlPHOCycryxvTI1kiUT3p0HAx/6K62HRTMGo1lthkKBQPhm?=
 =?us-ascii?Q?6LqgQpe9rAfUcl/lrBbpy7ZVUsDB+hZLdIv8zggxqC2V4bpe5QGrCVYnx28d?=
 =?us-ascii?Q?Ws3Kyno1FyDFMj8Zwgxm7wLzFo+Yri6rAWZMaFNd9MijrVukteC+wccjcy01?=
 =?us-ascii?Q?b0TmfMQggIrdxy55TSKk/QTSxVnLyDYrVfbx2Uda4Owimt1jumQTtDVXG2VU?=
 =?us-ascii?Q?0/5IrTqWBwamHeivEhsnWP3fj3QSr7FgXPYI+noogSkJywAjMFERxVysfGGS?=
 =?us-ascii?Q?qkXNVjKusL4SWVupTBJ93yliRZI4udDlOKaUxjo6J9OLiikK4ZN+zmwr+AKg?=
 =?us-ascii?Q?KwZgtlYksl2t3vFANZOoteXa73tRWg8dLllYynTM+gbTk2AQ/CU9FfQO0fdu?=
 =?us-ascii?Q?5nzhR/AOMWTQDZ5nCb2AW3nOdYEfsQqxT7UpWYficRNFuBlSPph+D1uKofQz?=
 =?us-ascii?Q?fV/ri0yaF5JW6zRW8f3lwhxIUMPETXqdIzkQrLerc6Kx+VIWhgvTPvfE9y8S?=
 =?us-ascii?Q?9ijlsQbNA8yIIb83i8oaAIqw3eRcXgrEg+5sqdO60oQlEZuswbRvp+I19HnL?=
 =?us-ascii?Q?pX3jWV3cdka5CY3hDanO6OKkdSfXA34xTK3Qoikz8iZexWAfmLE0y10A9ZxH?=
 =?us-ascii?Q?XG7UrQloRR3pYXiswA4XTq0QHnCGkPKgR9BW2wQq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 450f25c9-f8bb-4b4a-a3ba-08dbf1110760
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 19:26:04.4798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j40MoGI9vgBO6YGWnhciTVERoQiP4Byhom55WAYSOj9yHuosD3BYYu5jJ/YbEew9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9104
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
Cc: linux-hyperv@vger.kernel.org, Karol Herbst <kherbst@redhat.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Jerry Snitselaar <jsnitsel@redhat.com>, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Laxman Dewangan <ldewangan@nvidia.com>,
 Hanjun Guo <guohanjun@huawei.com>, linux-riscv@lists.infradead.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, Frank Rowand <frowand.list@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Wei Liu <wei.liu@kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>,
 Jon Hunter <jonathanh@nvidia.com>, linux-acpi@vger.kernel.org,
 iommu@lists.linux.dev, Danilo Krummrich <dakr@redhat.com>,
 nouveau@lists.freedesktop.org, linux-snps-arc@lists.infradead.org,
 Len Brown <lenb@kernel.org>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Will Deacon <will@kernel.org>, Sven Peter <sven@svenpeter.dev>,
 Haiyang Zhang <haiyangz@microsoft.com>, Vineet Gupta <vgupta@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Robin Murphy <robin.murphy@arm.com>, Hector Martin <marcan@marcan.st>,
 linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, asahi@lists.linux.dev,
 Sudeep Holla <sudeep.holla@arm.com>, dmaengine@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 05:23:13PM +0100, Thierry Reding wrote:
> > diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
> > index 533f85a4b2bdb7..3e4fbe94dd666e 100644
> > --- a/drivers/memory/tegra/tegra186.c
> > +++ b/drivers/memory/tegra/tegra186.c
> > @@ -111,21 +111,21 @@ static void tegra186_mc_client_sid_override(struct tegra_mc *mc,
> >  static int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
> >  {
> >  #if IS_ENABLED(CONFIG_IOMMU_API)
> > -	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> >  	struct of_phandle_args args;
> >  	unsigned int i, index = 0;
> > +	u32 sid;
> >  
> > +	WARN_ON(!tegra_dev_iommu_get_stream_id(dev, &sid));
> 
> I know the code previously didn't check for any errors, but we may want
> to do so now. If tegra_dev_iommu_get_stream_id() ever fails we may end
> up writing some undefined value into the override register.

My assumption was it never fails otherwise this probably already
doesn't work?

> I'm also unsure if WARN_ON() is appropriate here. I vaguely recall that
> ->probe_device() was called for all devices on the bus and not all of
> them may have been associated with the IOMMU. Not all of them may in
> fact access memory in the first place.

So you are thinkin that of_parse_phandle_with_args() is a NOP
sometimes so it will tolerate the failure?

Seems like the best thing to do is just continue to ignore it then?

> Perhaps I'm misremembering and the IOMMU core now takes care of only
> calling this when fwspec is indeed valid?

Can't advise, I have no idea what tegra_mc_ops is for :)

Jason

