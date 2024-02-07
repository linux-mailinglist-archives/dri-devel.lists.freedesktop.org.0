Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 302AB84CB02
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 14:05:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A36113244;
	Wed,  7 Feb 2024 13:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JM1ORoPO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F6A113244
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 13:05:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZ1pfEHVQqtPJ6rEJqG1MMc/8kMd2LMeQI8od9HJX9w2FJAbgQjXZeZPnlYJQL+j272ibHmCm17zkWjx+m6gTV27Gy2vWpBncETSYhBNxRP1ySct0tOX7Xk3DCgCEkLjF6kBRkUnzbmAdQNzWU10K2QexH0jPwcPyaNO11WkOO/MD0UtaoKSxhzBJk1ixs8FtSX1nKR7hoIdBFbBJUH6pO4cpAjvmtESNn/qgmhQ8YdT+8Xab8nVsP7eWPCOkVsr40e7teKRUkLaECqjPeT5lAJXmwfurb5xoMTrzbVdLyJkzA1Tum+gmBgv54mJ5SbIjXWFU+n/dM/Z/UaF3pMFXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQk5WxfSZam0H04DLfTPnYYKdMrgt+GK9LurTEhA+S0=;
 b=Ybzd0ciuPGV9aL7eUPJgkkka95mpNNHK8DYmtYydx5tDt1mumFg9R9dfWIV22fLlHmO6Auw83MJ4A591xODAG4UTMkVOCu/XCxrD1TRCptFOcg7Iq4GXquUj70MweOn3Bly9KuDeldlrmH+2Zp0yKhN2rKL7veQpCOmmTH2PWSMQCN0l2cNMnTdwNYfrSNQHkNJqMfIasnXGYytQ0onBNupDUPV1vhlj2P7yE294/3YWAMCHBNqapiZBnpEHHxeMfqKJ/HaMurVPguKatrTfOrrQJ63Xlq6DuRwc+BWnUMQKAHzkZ2JZLKuKSNqFMWgk/XFnu/xf+ZLuzl5jkRvwnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQk5WxfSZam0H04DLfTPnYYKdMrgt+GK9LurTEhA+S0=;
 b=JM1ORoPOXoA1zscd33p2owuHOK9hryLqVgJXFWWRCvL4+jd189Yxlk2tiu9hAJ99My3uKuDzMcwZIvdMQRj2UmjyjfZw8gfw5mE31wLJCopWudrzz9K/wdRuJnJqP3KjF+1tw/ifgm2jgIGVNWmEj6KZnO2x36978K3W6R4mDOTccs55mSv8lQicaucozpzxcsm3cGZ+cwBvj4hsWyOf/ibyNzbUnZN0s1OQGIJNACrDr/BZfLf7R0ShZixydViQKEzHRTOAPhxQgRSa7KX1JtIqobICldxsUIljHp+arQnQRHXQSPrLv1aTrf71CEKcmRINxQbVd6FMMo2SnjMMDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH0PR12MB8049.namprd12.prod.outlook.com (2603:10b6:510:28f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.17; Wed, 7 Feb
 2024 13:05:35 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7270.012; Wed, 7 Feb 2024
 13:05:34 +0000
Date: Wed, 7 Feb 2024 09:05:32 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 iommu@lists.linux.dev, Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, patches@lists.linux.dev
Subject: Re: [PATCH] drm/tegra: Remove of_dma_configure() from
 host1x_device_add()
Message-ID: <20240207130532.GA1833900@nvidia.com>
References: <0-v1-c76c50cd425e+15298-host1x_no_iommu_conf_jgg@nvidia.com>
 <583b9145-cbbe-4a03-8120-e2a66a6093c7@nvidia.com>
 <20240131153312.GM1455070@nvidia.com>
 <a1597113-3ec9-445c-90d1-62df97406fb2@nvidia.com>
 <20240201200212.GQ1455070@nvidia.com>
 <96bc6d37-1000-4651-9a26-a8446dd64803@nvidia.com>
 <20240202143518.GS1455070@nvidia.com>
 <361dcaf5-352e-4162-a952-c690783a2251@nvidia.com>
 <20240202161540.GU1455070@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202161540.GU1455070@nvidia.com>
X-ClientProxiedBy: DS7PR06CA0012.namprd06.prod.outlook.com
 (2603:10b6:8:2a::22) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH0PR12MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: 96ef72e1-d99a-4eaa-20b8-08dc27dd7862
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /HcrIdeFRtmDEWTPgkFTih2dM1a6TRUF4dEzaOpEvMWkShPz7ztMBm1pQGpWLyGm6p1NHjAS+s51m7dN7M+euTNdcxvMb6FL2W+3JaA/wyaBEszXhnmPrQRAFTdtiBKpoV6BjWUB0ssFxtbgd05dOpCE8l2SwLaaw4pFy1SSXP26eNYfngHG88CraiCpkl+/NICeXdixhIO1l93IriA+mYb5NFFPzNgOh+ujqnryWEM/ain4ghxLe1b6FndC1O3URr9pPZqmol/i3LFiS/BEEqmTejeNy8r5eoH9h7/iFc/gJczoPiGd06xm5XWd60yIjw6FtnahuNFD9qBclMylIY8WxQ/0kyKYeRQF3TYzPq9R12y1s63oQmk+BDRrJ3WD10mBCTpXimGuB9nGNGJZnT6ttVa6Uy2jA+XzYkuEtL9IgKb5oFBJZKF9kj03SkNleYbpsBguUMEuQP7UjmqQ+WnpBio0XzL21DoTO+oGhswxb7JZIcr6FMQkdPXEgioirgAVEzv3g9xglDrbehR5Quk2sC/YgYF0CCP927/VijN8YKmZuRfrGObToTUx5lwZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(396003)(136003)(366004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(66899024)(2616005)(6512007)(1076003)(36756003)(6506007)(478600001)(41300700001)(38100700002)(86362001)(26005)(83380400001)(33656002)(6486002)(8676002)(6862004)(4326008)(8936002)(2906002)(5660300002)(37006003)(66946007)(66556008)(66476007)(54906003)(6636002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3tkpBnwOZ+BjUiAvGHw3yZtcmbzc1OKHcslEyvJvsK9ZBLlIsIgmeFUhgGao?=
 =?us-ascii?Q?3RpiulTvgcphJURYMaPVQcsV56sNCQ2VPI2Qc3zBBBdfBAI9p/7/9x6vPxYX?=
 =?us-ascii?Q?XHIDBNKrYJPrACGYK6Ux+Cs9PuaR2A330qfuVPNtX7eRbE1XsB02P7o+RwDL?=
 =?us-ascii?Q?ZNM5qoHrvfXQlYyUG0qtTg4m6OY2aa4dxEgk6rLQrsDQlv/0QdKB5X/HgjmW?=
 =?us-ascii?Q?2hgB6XDLHZKKDYO9vsufxDdMK9rhmxBvlS9AmdSWc/3fBIxwUpMNXrtdmxBw?=
 =?us-ascii?Q?3vwDIY+4BAhDCtrl6B6DLV+LU7moWQfAKuWHZy5AijkAZxao/jv4fPQUoFZ+?=
 =?us-ascii?Q?0b7tJNVIxhUpogCpxqaxsIhfHscPaa8CDQuTefD9S2GNAKDvRRDO1tEZSeOK?=
 =?us-ascii?Q?hZvzcekjxiI4e7+rNlVeKya18IlXrRlmGKiyn8gtVY3mrddEn76AKcVO69bT?=
 =?us-ascii?Q?m9LBHq+zXxWSU+bEIrYaeMHr3zrsvBy0F8C0n01Nl/5NEfzRNesirvbp6X8v?=
 =?us-ascii?Q?7k9ZO3j9s904q9vywL8O/hG4vggDzZLyiscY0uElqtNsKDig5yNsdk2npPZ/?=
 =?us-ascii?Q?a5IsHB2G+XKmqiLy3q8CdaYNgAMsSPb5cFb+RZJBH4I+q5rCj9o/X22CU2Rw?=
 =?us-ascii?Q?V+7o+YUZpIwpVPaiO2YPTKVtc5U9wSYDg4iNZYM0LAc1HTA6vk5hohJzJnTr?=
 =?us-ascii?Q?JyJ8Nb2OVfAn2qIPlwdEOX1vNd4t7l0OheabBgJgOh7/zVHJ6yPsahJ5AHBF?=
 =?us-ascii?Q?4lSW+vcT1Qf4oLzibpnX3qmkKjM69y+/vbc5IwO+jANGRFo0lPXKDsEPpeeY?=
 =?us-ascii?Q?q+rc9rib90AxyUN/GQYoVCJk6Dh0gavOddXWTJUsxBG27L+AWkiHEuXo2rPp?=
 =?us-ascii?Q?8vR4CNrj/5BYI/h8eiDE7wRhYSRay/oyy7ZCdpvVosdLBzc1U9ePzSPmC1YT?=
 =?us-ascii?Q?5QrId4mY/u8ALvou1WBLcfo8nY3qCw+PH2Jv1lgRT/zMTytczLO+oMkNDDwJ?=
 =?us-ascii?Q?BpPkLnSw26isW82ydoUWiFEw4YCRch1r4gKWpUYNpr47KUJ/Jk9PLjnRSxmu?=
 =?us-ascii?Q?JXNa0CWxeac72ULoxYi3w6WDvgYkXbCrv0G7CBnas8207iKykchZ5i/X9LvX?=
 =?us-ascii?Q?dDA8WrknTj3InHFRpiCR95ZDmMA73HZywHK9+b7JG6GpREaL8ojcSahj5cRR?=
 =?us-ascii?Q?FzjTZUUwEKuYodxW2+FOJ+0Y20LxBL6EpCD9eXWMg2/o3bEBh7nvEoRVLwwN?=
 =?us-ascii?Q?A5TBjDCdzl17oRGSQ+273tMR3vGnOXOc60H7q+ZrfYzFhY34tBzyAKXQ4T01?=
 =?us-ascii?Q?PUwtQSIFOKfbU5tYWUCG5n2qLBQBe42bEkqcGYqFlMBxsjj/eUQrS5maf7/q?=
 =?us-ascii?Q?hJzJX0El7H6i8KSyvK387OG5Qe73toYbc2GTBUzb2f3rO1B7C3YgLilj44uF?=
 =?us-ascii?Q?20vdu0KGYda/QTGz/NeFyQnGP+Eg9C0ZEi0ETCwJ7jD4ExPNVGKHzgMFCPUx?=
 =?us-ascii?Q?OotA0KdGQ3sB5iRBy8o7OEx1ITpHcUXLRvy8bnONHLHdamKbyi9iY/rmyoh/?=
 =?us-ascii?Q?AHdj5N8DF+QCebTX68d40dpIquH/hU5g5fmn+NqS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ef72e1-d99a-4eaa-20b8-08dc27dd7862
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 13:05:34.3294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gioTwllKi0Geja197wZd12K2oSL7weQgCaY4OqZAMDsVzBdhln2aww/hR39CtyeS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8049
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

On Fri, Feb 02, 2024 at 12:15:40PM -0400, Jason Gunthorpe wrote:

> > Yes looks like a race of some sort. Adding a bit of debug also makes the
> > issue go away so difficult to see what is happening.
> 
> I'm wondering if it is racing with iommu driver probing? I looked but
> didn't notice anything obviously wrong there that would cause this
> though.

Oh there is at least one racy thing here..

The of_xlate hackjob is out of order and is racy if you have multiple instances:

struct tegra_smmu *tegra_smmu_probe(struct device *dev,
				    const struct tegra_smmu_soc *soc,
				    struct tegra_mc *mc)
{
	/*
	 * This is a bit of a hack. Ideally we'd want to simply return this
	 * value. However iommu_device_register() will attempt to add
	 * all devices to the IOMMU before we get that far. In order
	 * not to rely on global variables to track the IOMMU instance, we
	 * set it here so that it can be looked up from the .probe_device()
	 * callback via the IOMMU device's .drvdata field.
	 */
	mc->smmu = smmu;
         ^^^^^^^^^^^^^
           After this of_xlate and probe_device will succeed

        [...]
       	err = iommu_device_sysfs_add(&smmu->iommu, dev, NULL, dev_name(dev));               
	err = iommu_device_register(&smmu->iommu, &tegra_smmu_ops, dev);
        ^^^^^^^^^
        But the iommu instance is not fully initialized yet.

So:

static int tegra_smmu_of_xlate(struct device *dev,
			       struct of_phandle_args *args)
{
	struct platform_device *iommu_pdev = of_find_device_by_node(args->np);
	struct tegra_mc *mc = platform_get_drvdata(iommu_pdev);

	dev_iommu_priv_set(dev, mc->smmu);
                            ^^^^^^^^^^^^
                             Gets the partially initialized iommu
			     instance


static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
{
	smmu = dev_iommu_priv_get(dev);
	if (!smmu)
		return ERR_PTR(-ENODEV);
               ^^^^^^^^^^^^^
                  Allows the driver to bind to a partially setup instance

ie if you have multiple instances of tegra-smmu and you manage to do
concurrent probe where the iommu instance is probing concurrently with
the failing device_add flow then you can a situation like you have
described where the sysfs is not fully setup.

Is this making sense to you? Add a sleep after the mc->smmu store and
confirm with printing?

I think this is all an insane design. I fixed this race and removed
all this hackery in my fwspec removal series. There the iommu instance
only ever comes out of the locked list that iommu_device_register()
populates and drivers have a safe and simple flow.

Maybe just moving the store to mc->smmu later would improve it? I
didn't look closely..

Jason
