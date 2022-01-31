Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 500464A3DAB
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 07:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36FA10E1E7;
	Mon, 31 Jan 2022 06:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2046.outbound.protection.outlook.com [40.107.95.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6ED10E1E7;
 Mon, 31 Jan 2022 06:32:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvVvXSGe1qDwwi4cpkR2oNbLmtvBwqr6BP2iu3Wy/IeeRyXBJPwzIKHaWYyuhe/nx4Os/JxNM6sGQrBcTGACpaTIXddG5sM8hmmCVBx3nHH1TUaPyIjf+HWAcpcGnCYZgwzUy9qnLVBK3Jnbrgvtmod3Z9/lSPUouQRiqW1eeJstzQuO1HwHZN9gfWtzbTLnGWTSl3krixs4Ar91wJRkYglsSdmiZ3ZOLneg3nbEwk7+8JEq6TbW8NJ/FuGwt3e12HHNiUM7SRjUEFnZMmiG/Xj8EJL6B4Jy5CGHWoHe37YiSBMhWDv+4Kf4iM60EBTVR3xlT2wOx5DauDEZS6EKkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XF1tQEnt7Y+Wzg/b2wgNlDuGIXR9GwjBxX2hjzQN5u0=;
 b=eYMQ8asDzK8XMp23tX/YThG+Bsn3tx2rRV2v6G1yjaZiLga2PrLgv/L4JQryvSDS54j0huA+WCRPL9wylqe3yE56I2mHwomnrXQDY55uJaO0SdHwhx3YZ59ZNcTOUSjrQHAaAjGHWUAzU1fxFpNTLp5ezek1hbg2LTSV22D3h0joBNQsdiJJwcCskRP8Ik+LDSWypELzziLSf2On83D3oQWX7PtWOuxIhT5Isvbhc746+VNauIyHJYBIPnd1L1I3HsPQalEcRqdJCnMO9UeBuV79B5sGTuoSGRm/XnGEytWpmZIyX5V0jEvMGC1ZkHey/wefkhw0p32OTPeIiyYSyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XF1tQEnt7Y+Wzg/b2wgNlDuGIXR9GwjBxX2hjzQN5u0=;
 b=Ux6NmGP5qf9vgSppOlaq9fc/g+gq6GYnMpoFYjo4odz22TZkW9y0Guv1GBGfYXwTMIcHYoUbdpDWwgElmzeMD98/wl2DYvh3tZJxx+GlDHH2qWJwDfNdhwiU3OP8BiSqKRmMf8uj2+qxDLTAuDobImq5UbhFTewhFB9pKF8caNcSZoTB38OatbW/idHXOcu2I7Zdr+VJjZn5OGpH5eOPodlqDoRR90CcPp5dGhsVyAAMlVENfUh4pvXY7PrD/VLIS2Gcl758s42l832d4tYuuPOFqkkMrBHIdqzlbrMrkvkk50EkPcGHP8h1dtJawYxY3RbTxplv5bXbkoN6PiAPFA==
Received: from MW4PR04CA0261.namprd04.prod.outlook.com (2603:10b6:303:88::26)
 by DM6PR12MB4634.namprd12.prod.outlook.com (2603:10b6:5:165::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Mon, 31 Jan
 2022 06:32:44 +0000
Received: from CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::56) by MW4PR04CA0261.outlook.office365.com
 (2603:10b6:303:88::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Mon, 31 Jan 2022 06:32:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 CO1NAM11FT009.mail.protection.outlook.com (10.13.175.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4930.15 via Frontend Transport; Mon, 31 Jan 2022 06:32:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Mon, 31 Jan 2022 06:32:42 +0000
Received: from nvdebian.localnet (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Sun, 30 Jan 2022
 22:32:39 -0800
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v5 02/10] mm: add device coherent vma selection for memory
 migration
Date: Mon, 31 Jan 2022 17:32:09 +1100
Message-ID: <1761055.EOaAWAZ9kn@nvdebian>
In-Reply-To: <20220128200825.8623-3-alex.sierra@amd.com>
References: <20220128200825.8623-1-alex.sierra@amd.com>
 <20220128200825.8623-3-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: drhqmail202.nvidia.com (10.126.190.181) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 428c4fc8-8571-4807-f705-08d9e4837d0b
X-MS-TrafficTypeDiagnostic: DM6PR12MB4634:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB46346FF5B38114C79CD567BDDF259@DM6PR12MB4634.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hJ1PUShyShlk0fTp1g6E9VvXoeCpImw9IfsEelKsS1vDeIyljNzz+JYQCM6/VZBNoXKg3aqRVk75OSlViqBNNr+GYk1HR1bN1ltaGAn1vtqaT7XiKk6JeTTl3YOo8Yzy9TSv57UBuyKNgR+zrA4/jEZXlIFhyWh624BEWWCrU2ib1/mA6EPOHMSLKMA8uqZA4IVr/+kKRrMkcZJfugf8kBiJR1vF6k3M3iD3qTY1D3Xx5R949yqKLlHZRpk5LH2I4B+ZJ6OD9XjHnVCATaogoJYEOFlkgp3eP6yi4D90VV5OIWkLyFH+DIZCt73hqbeHJLdaPVRxxQC+oq0TQzFwBH9DlWFJtO9oROls6YBqVlyg5Wj+0y8TZhcbnJiKUybBYbmPyJz7htAaNBoxLunlJX5+y3lB3OXDpkL4KTQKANUtLl+ZQ0zXfAytVyFbSzeRG5OjbFEekt350tME5LPwn2vTfKdrHjPo8BUWsULQtrH6tu78+hUP7LdTSOPxaAThPd+OSL9AVmTiaAiGnH43DqihISC9RPMn6Nzh+zRB0ZEVftU0UZ7OnJIjOV+cUlE5tHSKFV8UVpyDqStPGzE5wuFr4H2A5kSaewf3rSveKoIhHS8ZspxhQCoC2IeQDMqG8hLMt0VfGTuNKSFFQgwyUANw4Hc7kebdVHjFYsFOtNmzrIkRn4DXIQ7pXBmRnilkA3/6K2qROG/XzS+WrEZ8kpzv+WoK7CxD/i36uqe7n2P6dCs8ybduBTZL9AVnlPMK
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(356005)(4326008)(2906002)(9576002)(6666004)(81166007)(9686003)(7416002)(8676002)(5660300002)(8936002)(33716001)(82310400004)(86362001)(70206006)(508600001)(40460700003)(110136005)(47076005)(36860700001)(54906003)(16526019)(70586007)(186003)(26005)(426003)(336012)(316002)(39026012)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 06:32:43.8327 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 428c4fc8-8571-4807-f705-08d9e4837d0b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4634
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
Cc: amd-gfx@lists.freedesktop.org, willy@infradead.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Saturday, 29 January 2022 7:08:17 AM AEDT Alex Sierra wrote:

[...]

>  struct migrate_vma {
> diff --git a/mm/migrate.c b/mm/migrate.c
> index cd137aedcfe5..d3cc3589e1e8 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -2264,7 +2264,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  			if (is_writable_device_private_entry(entry))
>  				mpfn |= MIGRATE_PFN_WRITE;
>  		} else {
> -			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
> +			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM) &&
> +			    !(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_COHERENT))
>  				goto next;
>  			pfn = pte_pfn(pte);
>  			if (is_zero_pfn(pfn)) {

Sorry, but I still don't think this is quite right.

When specifying MIGRATE_VMA_SELECT_DEVICE_COHERENT we are looking for pages to
migrate from the device back to system memory. But as currently written I think
this can also select the zero pfn when MIGRATE_VMA_SELECT_DEVICE_COHERENT is
specified. As far as I know that can never point to device memory so migration
of a zero pfn should be also be skipped in that case.

We should only migrate the zero pfn if MIGRATE_VMA_SELECT_SYSTEM is specified.

> @@ -2273,6 +2274,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  				goto next;
>  			}
>  			page = vm_normal_page(migrate->vma, addr, pte);
> +			if (page && !is_zone_device_page(page) &&
> +			    !(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
> +				goto next;
> +			if (page && is_device_coherent_page(page) &&
> +			    (!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_COHERENT) ||
> +			     page->pgmap->owner != migrate->pgmap_owner))
> +				goto next;
>  			mpfn = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
>  			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
>  		}
> 




