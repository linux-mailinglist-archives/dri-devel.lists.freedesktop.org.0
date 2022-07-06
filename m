Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED1656914B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 19:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0058C11253A;
	Wed,  6 Jul 2022 17:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2089.outbound.protection.outlook.com [40.107.95.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8FD11A501;
 Wed,  6 Jul 2022 17:59:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajIgcnqe1j9HOzfvGhGVyN7F/ASjmNmd5UHbB4a12k0mJ1Fk83h6+Swiq4mwIxZKk06pVDVSd+5w6PIN0tgBTOOanS24CKLgWoO09aNp2rBpjFUunoqzEiRL40B2UAJgiaaiN5Es9Yg9B8ye671Blw3Wr2u+zZbKx1FQYvlEt8O/C/DH1IQ7rjpXa7HnRiaaj4dHhcsPQM4vZYNPKTdZMy79sA0/+/nvc4BwZaQlyGgNwBjOB1p0A8ZuQxPqHi4VLpX1DM74mV6oWThKWi2bcOCr7Qtza4/blCIH98o9BN2Qs9OchaAe67BXBOh6GVrrtx8Kt8Wn3xl6/9Q07tEW6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CSo6oRaFV2oWxuJRg31qZ2tSzmLLmyfOWUsf45Mms4=;
 b=V8aH/PUo1zIOOu+nwPu5nOLu5CpQNGGnGYQWmgJe+1SjblMQuGc7Je/HeTGIVH+d+h1YN3gMLmonen2Gm5eIwheu9Cc0Yxc0pJ6fL02h5cKJU/ltX9GZaURZWZbXzBsgjoDE0dNLRZEAUZD1rAuzM1aN6VKhGpSPW2mlQdDdwV8jYFPmK267rJ7fWKuGICLcvGlwrZQJyvKTbBtf6qCkc1SBHVeGNllxs9LoZIER7zaUWJ9KjWOTmQtIwYpXRO1DF63D358CWAOey7Tfm3n3I9PegP07bLGgw1fELUkzCdIA7yPoImO7Kx2x0AsmJh29vT9Kw9x9ew794mEbYdNAqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CSo6oRaFV2oWxuJRg31qZ2tSzmLLmyfOWUsf45Mms4=;
 b=LoOhhMr0DFh/c2kuvD2c2eIOiwiGwLWJBW4q+e6G6qRismPIpjqsr9Nw65U1SzQVlZSwwW1WYnWwLAdkLQ58P7lgeaNQq+CTYej055TXE+7lSDh1f7J60DorfZhJbQAdD6z5t3rtBmMs9dDSiLrLwRfdFEb8103sJ9KRIvWl6gGrFyqZL3kXaPaT4GxpMG2n8uobd4p19gCWHGO0yN/3XPfjlyyeSJUYlEfHcxkGUGD4Llw+NeMWShF+AE/AO+W9H+lLamoxKVYH6H5aOs1xQdOuiNS1UK5C5XGjLZv+Y3TEaMa8/299Qk9v2Eo8o6G5H6m8SlDFizLhoM2jmQ2r6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CY4PR12MB1350.namprd12.prod.outlook.com (2603:10b6:903:41::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 17:59:26 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 17:59:26 +0000
Date: Wed, 6 Jul 2022 14:59:25 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [RFT][PATCH v2 6/9] vfio/ccw: Change pa_pfn list to pa_iova list
Message-ID: <20220706175925.GN693670@nvidia.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-7-nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706062759.24946-7-nicolinc@nvidia.com>
X-ClientProxiedBy: MN2PR20CA0043.namprd20.prod.outlook.com
 (2603:10b6:208:235::12) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ae207dc-6778-4f1f-da82-08da5f794422
X-MS-TrafficTypeDiagnostic: CY4PR12MB1350:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vXJewF9nDYLeki2gwMEIzSAn+9X9AfOXTqecVqTdcBDVhKoJEUTGlfT1EBjhEuFF0B+UlEqRkoc8ZJxNpIdF39g8tNGG7k/o+H6x0Iqcy8U2NKCrI0hS7rp8VjDzMhbCVKXzd37gTruyYtNBhNN0eow0oyAOwb3dOPnbzh1aI1UEH556jLNgONg5JJylTiVSDu9UpAwNtHzJvAin0cxw/u4nJ2w6KH8ARTZ3RMBj8gcA/vhmjEU61PNqf77RXFnz5pb1HCIG+WeyQNQ0ysHEupO/d6RytOHj8rLkzl/oXKckwLbLRytuaBQUTdf68nuSxjS0XtHtYkxZXiEModE4sYPjAsFgJ9li9/nhW1mqCgVoA220cpllrKG5QEsD+lzufMcdVG1QOUeafGQ+y35r+XbNEFBof3/pReiWqFOk8MQrfD3nuvB3maHj0w25veibZIzlRw2+0YC0Lq4mcIJyKWyG2xbbNMbWcWqVKNfv2S/rYRD54VsquRcGkhp1aWTL51aPGtLnDNl1/kvjdiGJGH7MWJqdX+D78J/l96lDkzqxBUdiiA/icmkNO7L+yXxx8lj4fQ9KvSxtx9q0NF6NY4PmsS/HfBWp1em1vSrOuvdaAY0Uh9ACMR9cRprhi8JeZNrz1c5p7UQh3tbNQ7EOOdSUQy1hZgHF1h0BJI7WPp0CWrYrSGl7sKQBetebbMxsLb7ifD7vDSa2cL5Xe7zruXlCuO3D1CU5/ldvpNbxHA8/Y5dOzFr1DPHrUp+L/Ah9BbfWJTkg776x5FiKEy9Inh3qWSFvaSgmOuRNqcvmMkg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(38100700002)(2906002)(7416002)(5660300002)(6512007)(8936002)(33656002)(36756003)(4744005)(7406005)(6862004)(66476007)(1076003)(478600001)(6486002)(4326008)(8676002)(66946007)(83380400001)(6636002)(37006003)(26005)(86362001)(316002)(6506007)(186003)(41300700001)(2616005)(66556008)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BJcrjNyBoRhEdrddNjdGHSdlBVuGaV9W4uD0gJ5XlPFzsqIFB8BVB1Alw9rw?=
 =?us-ascii?Q?o0V1IRyCUjqClVMBigqZJgCtdJaKNTgDJVsm/wywxFRilMkJtGVs284pIMUo?=
 =?us-ascii?Q?sLZ1okUcD/z0V+ofaBb+IkqNplhf8QLFFHC49zT8kjW309CwqKKwMt5ojdFo?=
 =?us-ascii?Q?De4pFlaUNONWlFkaIRQQhQYtdwFBJUEaE5RCTVhic+rHN15oh+qrywdcCxaq?=
 =?us-ascii?Q?VDWUqO7ZJIf6ttmRYwAIdiRUriNMjokqTsWsLbvBxo2pLiI0MfUm4NlXBivS?=
 =?us-ascii?Q?QPEmU23KGYgxDXKxowdNQ4cO0XaOBJfEehEOKGd2GASvn6FrI/ungszYj/Oh?=
 =?us-ascii?Q?qi7umkIDGsuMyXz2ac+JL7f28SCnx8u44pycmv4zFBcIv/pzlBGis37lzMCr?=
 =?us-ascii?Q?YGOdStRwwgmlmxL0dLK+3T55+ZRy+lhWmBt19Y3x0heCwqVH5Bpo6cB0/mKY?=
 =?us-ascii?Q?xE+QVctPSj7F2gT9wMKtw259U3C5g86pAJ6Zz0F7j+7K/coAFI6rU0/r1tVl?=
 =?us-ascii?Q?f3ubo7h9rlsvGr8rBjV0/jcfamKn8nJdUz96mjzqGhLOg9bIB+hCoXXhFllt?=
 =?us-ascii?Q?jkzTJSUYi2CT5QpUFgOQZIEG5KuoRvqpYVeDrAU/a+uswYw67m2VO/gj4Ug3?=
 =?us-ascii?Q?yLYkMXu8lbQCRo5OAFSXPj28rNF2tdeH1vkocHeoIm3w/OQRYhaGAUez3hnO?=
 =?us-ascii?Q?Oibpk8Yb5urPCu6hvPInEe7xjxs3rulVFpnr63dGlUEg5vHua8jSFRtTLB8O?=
 =?us-ascii?Q?fRuoSIOf7bxAKA63XqT1kHa1k/X981DjchwjE9qeKYbqxTeSot95eT8DkWEo?=
 =?us-ascii?Q?7Cr6vAG3OMFnJgDTmeQV1uZDTmDifjy57HLCgahnZGw3zv2FD1iIUYCYfW7n?=
 =?us-ascii?Q?En2vSuNodkf0VPYWK0HqfwDJJXmfhvM8IpIcWZ/ehERJ5egoK1aEyxP9VzYr?=
 =?us-ascii?Q?bS1ng4jOaH97PQbXaHMWavyNx4pTC2ZZRzSUp5T+GlYDplDSWWO0LW5TJFB3?=
 =?us-ascii?Q?8eogQ5pHYeigbIs+kg7AalcqCv37EZVawrErNhQRjetPmuzoQ2742rzNm10K?=
 =?us-ascii?Q?FJVW2OoHpCc6a2/X6GIbbcV74rLeAcf7NoZDCrFZHeYabv06RMjlnbxMmrj0?=
 =?us-ascii?Q?o06SMBmWBV2V6LlOsMg+W17MKywvLhyeSadAeyTPYVtUG8mSPnB8UTeN/lTs?=
 =?us-ascii?Q?TD0qXYyxthupJjVWMlqwJ/gohnBteY9BLJf2ajFUuRUiE1TZqpDtcgrTTTq7?=
 =?us-ascii?Q?hTijRT9AgfEeZxatx46d3Vcl/lA3jX+8hxuBcru5aQ51VzgmISGgWugg/6ml?=
 =?us-ascii?Q?OfS9mZt7+FUDPKcCZh4cfVzkdkPpEeI/Ry34gE6x7+uXj8/qflZFZhikbrVK?=
 =?us-ascii?Q?YBFmX/GJCsXrGHHA+A/REg9kE5ZsXJ/oUn07YoXRZaHq9Jymjx/aVm+teqAL?=
 =?us-ascii?Q?RW/2RKHoWmYI4kh4Ty2SAwKWzaQvd3eOC0SbSztajlF0iYBOfnZFNyM47Dvl?=
 =?us-ascii?Q?cOXRK4C6/0F/xPbcpIUny0rClFogVLyPceBcsJjWMKJ2XL70/obHHh3brmwq?=
 =?us-ascii?Q?LmT8TgVpBwckbzVQFBZjkvtK4Xp/jvqC9Kpho7do?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae207dc-6778-4f1f-da82-08da5f794422
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 17:59:26.6256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LpKjLHTZWk8czMYJGiIl542fJ1PVNjYHvVhgu0tMHqJN93x7m/rWSXrIGy1dlaur
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1350
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
Cc: mjrosato@linux.ibm.com, linux-doc@vger.kernel.org, airlied@linux.ie,
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kwankhede@nvidia.com, vneethv@linux.ibm.com,
 agordeev@linux.ibm.com, hch@infradead.org, kvm@vger.kernel.org, corbet@lwn.net,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 intel-gfx@lists.freedesktop.org, zhi.a.wang@intel.com, jjherne@linux.ibm.com,
 farman@linux.ibm.com, jchrist@linux.ibm.com, gor@linux.ibm.com,
 linux-s390@vger.kernel.org, hca@linux.ibm.com, alex.williamson@redhat.com,
 freude@linux.ibm.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 tvrtko.ursulin@linux.intel.com, cohuck@redhat.com, oberpar@linux.ibm.com,
 svens@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 05, 2022 at 11:27:56PM -0700, Nicolin Chen wrote:
> The vfio_ccw_cp code maintains both iova and its PFN list because the
> vfio_pin/unpin_pages API wanted pfn list. Since vfio_pin/unpin_pages()
> now accept "iova", change to maintain only pa_iova list and rename all
> "pfn_array" strings to "page_array", so as to simplify the code.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/s390/cio/vfio_ccw_cp.c | 135 ++++++++++++++++-----------------
>  1 file changed, 64 insertions(+), 71 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
