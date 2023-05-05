Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 785606F850C
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 16:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAE310E034;
	Fri,  5 May 2023 14:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E64C10E034
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 14:50:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VwHCVuGhKzqTdWQqgbFj5QBnhcoUEkUWvY2wSKBKjXD0xIUyR8VzYTeLaX9QMBE3SJgjiznqoOa37gWlRYsr5iBuTsDAkw+zmHGR5ZU/rW+Rgo9DpAGMcM6sFf8lVaAbUQpn7fiIyl48RiHFLoeKf/e/2H5kvLYV4GNYawCI/GBrq1+Nx4i0MY5SWalJ0rlKtkAnvQ3aNZv9yTpDyUJH9ce0NpzcpKyY0RPZYJfHMhrl38a1C4FiK7Nr9b7ZVOywZRHunuVjHhaZyRAp77Dfoftm0REiPdMWBgZ1w1fSglUSSC4/CAWpoaG1sKnkJw7OE6rLBG7s5kMLEBhzNCwYZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StB404ipoKvQFQnnQRUfSUpCAqVpr9cKy6yQLiMs0MM=;
 b=BYCnw8p3jcI3eRUOEXaE2VbTJ23qOiovhQFs8fWku3ZUJHYxGb1KUZ4VDX89xw42VDBR02UaOt/nmH5b59OkCNMobNA826nnP8kaPuKo9Ka4QcJR0QciEiC3lu7YW+orA9uwfERbuiSyYNr43zD3IvTZHv/PUadt8R5gjGozRwQddSKWS/XzY+gXl/fyv4RYvWrbETkef9kAloG01hTut5Tuc9kehuVOJQ/nJtHrtFWg+/+l58QwG9vvkTgzcvU56vXiKCjFWAi+y4v5DLEvZNHEplXLI9ditEyCSPGfNRMVUw6/3ZfCCbVTK+5oNg3ZmGev04gFrxGJqYld9hO2lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StB404ipoKvQFQnnQRUfSUpCAqVpr9cKy6yQLiMs0MM=;
 b=W45vXgMWDPoiwkw3ytztDieciY+8j16bO/ItmtjrnQCCH/R0Dww8KLWLfNVY68JBHpSHPrEcz2TZ17f+flXKU+TnS3w5o4Zo57wZbc9OP5Fo9e/A/DqSXJn8snTq/E0dK2tBs5ygsq9N52Zt3H80jFXok5VggGGRCD65hoUQhCfg4iClW5ETgeUzENY3Ciw3T/+kt0WAPLjz5DCPmlYnkFk25eYDUs2TfeOs62KpBD9Ur4z1o3DgqThXu1liyz02JbcieFt7H5fxIaqVbd/1E3xzs7w0Eqg30EWjTnfZ5RwdGWhi0B5sRBGiW/dizRS2w7hFN35XSTf3w1AKFnvqdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5093.namprd12.prod.outlook.com (2603:10b6:208:309::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 14:50:02 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 14:50:02 +0000
Date: Fri, 5 May 2023 11:50:00 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/3] iommu/dma: Clean up Kconfig
Message-ID: <ZFUXmH9vndGZFuPr@nvidia.com>
References: <cover.1660668998.git.robin.murphy@arm.com>
 <2e33c8bc2b1bb478157b7964bfed976cb7466139.1660668998.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e33c8bc2b1bb478157b7964bfed976cb7466139.1660668998.git.robin.murphy@arm.com>
X-ClientProxiedBy: MN2PR20CA0054.namprd20.prod.outlook.com
 (2603:10b6:208:235::23) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5093:EE_
X-MS-Office365-Filtering-Correlation-Id: 70233aa9-8375-422a-77c6-08db4d78017d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /pQC/nviKjCL0YwYjNFQu67EzB5mbJrqLoxFH3EPXBN9+oC/oTc3e2g+ixmsObLAjg4TqgzTToqbneE+fFuQCCrlCfg0lBcJ9tzxBPhSzksYmz5wi7SVyzWYZhLhgJ6KXX7HpSDi3Kg5trOElTO/96odI4tVgIeoyPHr8L96VRJSjsg6TED9tkfLAYJtU++OmyqgWMEEnWimZDE+CLwAzsrUtOXA6xKrLn4G20trNR7sT6Swe/OFeC/nyurMtg8yhAwEm5peU57DvrcYLpGIZ+SZZlMpGUAC/J+C1usfMh5vKPGET/1RVp6UijWNOR8GCZoiGeK+otHRHeiOqvQAJNX2adaR2Wd262Ct2wBJzSPJBkEsUsqUYTzUV1qBbMbQqQ6MR3BbZIPbSOommsHkAEvtwjOvfzLtLGnSnlnS+8MRYiDcsRFo/mrDgaEeVxAfzWurURlDkOWY0XkPGKE4j0UcuJdax5LTEFcLqC/1GOeWjZR62AM7goGrq8ylSS+csV0rhSj9pAb5Tp5AKw7AZNg7+s2wXGc5zjbO9hyzyp/rT7DgxWFtu+ILvu9F2LKD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199021)(4326008)(66946007)(66556008)(66476007)(6916009)(478600001)(6486002)(316002)(86362001)(36756003)(83380400001)(2616005)(6512007)(6506007)(26005)(5660300002)(8676002)(8936002)(7416002)(2906002)(41300700001)(186003)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KqXejIFUoiMbnXCxxsieP8/yBgZQ7XVPWsSz3i1aJv88j3VPrnmOF/0SM82C?=
 =?us-ascii?Q?Z0d/T2kI9InyMqj80AuKnbi5CSSe+wPZAnFHYwfd/6a1K5fXAvugbllFFGkm?=
 =?us-ascii?Q?cv4O4MAOPyAyV13MOgidKfVgXmyUC3PWNQOOt+oWQbs5s1f1TrJz9BcrrUo4?=
 =?us-ascii?Q?xaK9c8hpwx162a/cOD5UkU0tfAOf2kzy03hJfUJDqZUgFPb0U/BS3rhTKA9E?=
 =?us-ascii?Q?xLVl3XXtRR54gUUZqLhCxSi4asSJnc41qWBRReNn4NYSNxSmtzBDgeFDH93F?=
 =?us-ascii?Q?92f+T6F3aFa3QCAVajoskdgMQxhUfnKDw4k26fZd9lnZPwKRCqsDgcf4IjVG?=
 =?us-ascii?Q?Po4th1dVpwQnjERdMPF2+lakkMCDWcdg5dd+xuuzfbdJdmAqtJxCRerwogqV?=
 =?us-ascii?Q?DcJW4uB1CE/+yNfS4y2ESlGtzjVh1TDbVxVqNAyELkHLeiuNjhyylfhjTdTo?=
 =?us-ascii?Q?yfSrQbU/HEhRQlA++G5lhGc6BzJ3JSsuOafvdljKw7zGS44WlkbZtg8er9JZ?=
 =?us-ascii?Q?pF5axM7wmqgylZogADSYvMObqig0JJE9F7/ZEKPgOcEV1MxCQoBVovdHN/Ot?=
 =?us-ascii?Q?+zWGmUIhCIISAWfcr5ajfNUGy6wVQDkORAFQHi6i3XPGiCo4wzHq12Ias0eH?=
 =?us-ascii?Q?MVWaDsqZamxtHv0NRECaDfia+nwRPVABOE+L9zoONbhyqxCswa1VljdVUXcz?=
 =?us-ascii?Q?P/CfQ8YPxTEJTlUoOQ3u3D6UVKnD4wJ79clQTOJ3O2e0USVktP+m44oVuePi?=
 =?us-ascii?Q?UXi1FFB1TwBbUt0UbPcNv8j+K22WiTqc452kM5RL6mpplGWZPXenb8at36Vo?=
 =?us-ascii?Q?UZc1DWt7pm450ZqSycfaIizpjM9Q7wl5+ErcSd1C3MXww2C+MJK+6HlOqpva?=
 =?us-ascii?Q?ap49Qh/fqesURvyFkFc6QSEA2XeASGmCDa6c2KV2USWrDCfxrSCx6h1WfciZ?=
 =?us-ascii?Q?CDtCxXx7T0WH95rJ7BHWhuUm2g7m2e1lRXhZl8Gmy24wGqAdf8mLnZMKiFEj?=
 =?us-ascii?Q?Dut8sSPqu7GmnVOd26m+xj6uJBmYfAPE3G+bpHNsk+Nou4nKREajzknU7lpP?=
 =?us-ascii?Q?IXTHu7WE63Vcuee3CS1dQtwoBP7TYBYym61noc44lWZXosXsZFNpsVl8Xh9t?=
 =?us-ascii?Q?LyAEn8IqAZUfYpxN2zAUmJwurfl6SxsSPKGOS8lbTCBskpW1AwASJcN+bQCx?=
 =?us-ascii?Q?ux69LIoxdNFX0t7Pg8wTj3nR60xTBMBhjoOIz1ImYB2hTTwXSI64+4Oh3EOR?=
 =?us-ascii?Q?yL1UudI6CK3DZ13bm4xeVVwLrjkrJuDrjttIHOzf/haMXob/kcDNvZyGtjDN?=
 =?us-ascii?Q?tIyFEFqIGrvKhq8vuhUCq5zK9BrCym3Q6Bh0C/HGiZzOiG5Lez0S9FiDnN0j?=
 =?us-ascii?Q?slqExbmIQBupWe2TrU6ZE7piQugnaEiJDkrqTRWA2eATabLxmOVYyXl6TlKF?=
 =?us-ascii?Q?cBnS8pDImbtOI/BHMF7jJzXKVB0ui3Ou1vKVzRk7Pv+DHP6dghuZm+BDMWF9?=
 =?us-ascii?Q?PTtZXq6Y88YtuTgAoPs6ZX1gpM78l3a8cHjV5GqWWFwCidsk3dJi8jz22n4g?=
 =?us-ascii?Q?m7bA1Pnhd2TSAF6FFC5QMvpNwqV92ibUOcebroEv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70233aa9-8375-422a-77c6-08db4d78017d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 14:50:02.1643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jkIa8VkhUz2NobbGxMlyNV+nRiFVBCmTnloB/5YTUXlbaoKGEuXYzfeEiv23wbFb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5093
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
Cc: jean-philippe@linaro.org, kvm@vger.kernel.org, iommu@lists.linux.dev,
 catalin.marinas@arm.com, joro@8bytes.org, cohuck@redhat.com,
 sw0312.kim@samsung.com, alex.williamson@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, kyungmin.park@samsung.com, maz@kernel.org,
 tglx@linutronix.de, will@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 16, 2022 at 06:28:03PM +0100, Robin Murphy wrote:
> Although iommu-dma is a per-architecture chonce, that is currently
> implemented in a rather haphazard way. Selecting from the arch Kconfig
> was the original logical approach, but is complicated by having to
> manage dependencies; conversely, selecting from drivers ends up hiding
> the architecture dependency *too* well. Instead, let's just have it
> enable itself automatically when IOMMU API support is enabled for the
> relevant architectures. It can't get much clearer than that.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  arch/arm64/Kconfig          | 1 -
>  drivers/iommu/Kconfig       | 3 +--
>  drivers/iommu/amd/Kconfig   | 1 -
>  drivers/iommu/intel/Kconfig | 1 -
>  4 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 571cc234d0b3..59af600445c2 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -209,7 +209,6 @@ config ARM64
>  	select HAVE_KPROBES
>  	select HAVE_KRETPROBES
>  	select HAVE_GENERIC_VDSO
> -	select IOMMU_DMA if IOMMU_SUPPORT
>  	select IRQ_DOMAIN
>  	select IRQ_FORCED_THREADING
>  	select KASAN_VMALLOC if KASAN
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 5c5cb5bee8b6..1d99c2d984fb 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -137,7 +137,7 @@ config OF_IOMMU
>  
>  # IOMMU-agnostic DMA-mapping layer
>  config IOMMU_DMA
> -	bool
> +	def_bool ARM64 || IA64 || X86

Robin, do you remember why you added IA64 here? What is the Itanimum
IOMMU driver?

Thanks,
Jason
