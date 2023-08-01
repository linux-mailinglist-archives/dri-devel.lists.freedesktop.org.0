Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F6C76B4A6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 14:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8136F10E3E5;
	Tue,  1 Aug 2023 12:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A232010E34B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 12:23:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kovUfMKAqBwuxEJbU6IouN8jYp5BnAWWhmHQc4iSTOVYm2xokYt+K8NXrs3WFMYwm2DVHqyP5oYtrRK4SrFuj/yr/CJMNcaixaD3A6uscPR0cCEKDy9Ivh7qqdXm10e/mG6AOFnFJ8v8IL6rRhMyPalRcHo0DY6XNlk6sMbWpw0FqdNnHGya+5sPecLvqeoJzA135MYCwbdwMy8b9N+72uSy000YASAa4SC8UhBgupTkY6/afXiDLVaTbvsV2KMAgahFtkYoj5fFPLm5SlkfxbtEIfs0Gx2iqGfClzT8Wo5+ElWQ4/jkuQQJ7Ygsn7RI0AXmGmSjZZGYGb6oImkX2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W77SxE04VKgJ13bZKR4aVBzbc1fRhXyLkFDXtF/nt+g=;
 b=aZRrC/KfvO2+s1EO0vcpUEDfUlLRc/u38joTNPgsHb6cOME2lbfLEkfDOJDzgYv5QzxKvobubXteF88ET9tm3yrXMAfFcJpv+N0kYWa1tFI5CBD0GQaSJAVtxUEY4UlJcNYiEf5v+5Gu126Q+Fs0/GwkNFg4CcZiz00zKFT1d4QlOQ/+xgrro6YuzWIOcl1S5ZZLKCcAGgz94gFZc0PfCUtZXG/xiPB7HtDNnAm7Bqzyt8jLo7lP7sGrBvgijS9I+RrrY9MisZglyXGJ35Lx4dUYmCFQpnKCFCEClPPkn98R4oTtn0wy2Xegn7J4I4xPGVOk+Wq9vpnLCBFPdc0/WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W77SxE04VKgJ13bZKR4aVBzbc1fRhXyLkFDXtF/nt+g=;
 b=FuLm0RS9bSlnUUo58pKrBfR4x31PxZK6IPWHQqjYomyRY2I0+hsTA9d5Q25khWUAIGeI+TsqNWbc8W4moYTxYT5WYELMoDapBh8Qg+gxLjuxtJOQO4AAj3q3MaGSn5Ft6x2AY4gkjAnze5p+6VnLeHxYbv9T1SrkdxO3efrr8zFPDU+Fk1nDEquZ0OZIzXzLXshJ3cuc+dy3sFOx8OVyKZLuO0XTOy1k5pytCrAuMIgrjZcLMZJ6y2dFK7O0UIvFpsYGMFOK85oHK5q/raEvg8MJzmtL29zdQoGqfA8cwOBsE/627o+S0qEuaP4TDsHfwl+QwEM57V1c+W3yGkDqJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 12:23:16 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 12:23:16 +0000
Date: Tue, 1 Aug 2023 09:23:14 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Message-ID: <ZMj5MvQGk2PQiJn+@nvidia.com>
References: <ZL/B6yvO1bIkFRcF@nvidia.com>
 <CH3PR11MB7177FA18562FCED8A3171007F803A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMBSWxYnWLlzG3+6@nvidia.com>
 <IA0PR11MB71853E11B6C419DC0D043953F801A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMJbywGYN0QLh3vF@nvidia.com>
 <CH3PR11MB71779C83F8A0EC6C2F3F4B0CF807A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMbtsY4O3Ho3B69J@nvidia.com>
 <IA0PR11MB71857E9D6C3AD311CF698D13F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMj4Og063T6T/okI@nvidia.com>
 <d4bae5e4-ff92-bee9-d585-9f30e34ef646@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4bae5e4-ff92-bee9-d585-9f30e34ef646@redhat.com>
X-ClientProxiedBy: BYAPR05CA0081.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::22) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BY5PR12MB4212:EE_
X-MS-Office365-Filtering-Correlation-Id: 2051577a-ec0c-4f12-fd8e-08db928a1559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3nztHz+6YoaoQqCi6alXSr6mnkGa5C9Ss1EDAfAf7/baZ1HN7CpMkxUnhYMxWjB1/tsJIEHSQtkwtodN6hXRD9DhEuZz1rrFT85qI265dbhB/JEXpCIOqDtn+vpEuv9A5uO/sSytT834LksBUncS1i3+ZiK4CidbubCZdrnnZ6pNuHefTfqG/aoJql9S19AOsEa59jH95br2w0ja6RYbFU/83Ejexhq5XJNZ3tiI7eg2DbLet4ktQPaERe3LLPJmOMTW6ZxSIUwUCyedu8fL5tLFNSAwjSV0pqYneT88hxN9bNW3+YRlHqHbbXdOzu0RjvEuefG47WRysmfjT5WDejWoEXVvH5DamTuhrj5CR6tXgHWgOqk+adgos1RcKAruMT2uZ24TeA/PNzUL7lJaAsh7PVnTrAejQESELbu/V6j500qjpmnzSJ5+m06WxcVj5LDlY/LlYd13/kiAbIAo+KbL+Eys4lt3Ln/Pc3nUwvuwjQHtC04JW3zUFspxoIGD0uBVslxNp4yYrczQksrS8HhOeb2vUU73H1bErUc+uL4VMPO1z/0MstsjaP/cl1HZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199021)(7416002)(38100700002)(6506007)(5660300002)(53546011)(4326008)(6916009)(66946007)(66556008)(66476007)(54906003)(6512007)(478600001)(2906002)(2616005)(8936002)(8676002)(6486002)(41300700001)(36756003)(186003)(316002)(86362001)(26005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ne+7xKLuAMT3oAGuS7gRu3yYBOgiMlWYU26D747r2CT03adOcKlOs6rCroPk?=
 =?us-ascii?Q?C/FP74Ebm+rz0VWL/JRExdvU9Odka68iF0suQw+2jtyAE15I1aEaTYWoJ+Ea?=
 =?us-ascii?Q?F/TTJLtHCxtkQ/mP4GBGJ6cCDdHCPouLmYXAXQuMbmqVnCvQyLHUkSIZ2/2a?=
 =?us-ascii?Q?G5PSL90IISV0QlOLDuRYGv+mfpdWlKBrDvhUzu8tYrJKfujPaMPbvMO307Yn?=
 =?us-ascii?Q?6G9EAu7Ki5HtZdSsXSRwmHTuPOcm/JAPBrr+/H4zU+GQWZX51EOrDJWiMrUo?=
 =?us-ascii?Q?z/mK4IxDgKyubPNiZyG+/wPs+iCbFeIZg+BZKw+Ooz51L6V2SzDBiimyjfxS?=
 =?us-ascii?Q?ef2YbLwStY9UVv0+x6DORcqY8gc2x2T408VlIyxynLw+mpZ/DR1YmXk2miw6?=
 =?us-ascii?Q?Ef3jRwoo2gWfmmEF0dqOcwNMiwgrWwxi54TvSleVgbp+3IYBtdUpS5bTRR9M?=
 =?us-ascii?Q?rjYej1x+X0fNsiJZ8Z5PKyWiZkvYa4M3wNVEQ3oLD+/n+3aFkkvhwhcgHGN3?=
 =?us-ascii?Q?iL4+DxgaMZyFBCOoNudWWTJBRazyaxV90fHCMQhP6bORPPfaU6rv/lbapDUY?=
 =?us-ascii?Q?5PkbMmJC4+fr8QYav+5EIYAdikxyc+7v+4yUHEsFbsqsK3UwJomYKdB4JSu7?=
 =?us-ascii?Q?63Oqc9b/RA8gDfjusbgbRqeIwKIpsyU8HQNbYZXDYZMe9CEhGdBpcpkcXjCT?=
 =?us-ascii?Q?BWgmyxPbxP/NF9LGYDCRiLXTnVwqglSANM6DKc+qjYKs1q+dHFcxWiIwX7/2?=
 =?us-ascii?Q?TmBX6lAefvQOHXHBnMI/DscVj5RRZoif6NiVjpVUoP2bo+hniA6UM0AspIlU?=
 =?us-ascii?Q?Jz91oL0Xu6kqIsYJI6S4DUA7VaN6uRs50JTB9TKpqVOb94SwHmqSPj/WeFt4?=
 =?us-ascii?Q?+5UfnfxmrHzHjlc6NFn/tUdRAxJMBGwYhBnEgq3jnMoiAO59x8LXn355y91j?=
 =?us-ascii?Q?i0qhHRcogVtLTsEhCLPUhS5+ThHUsW30Act/my0F/g+cNF0g9PBJ+neQ4wIw?=
 =?us-ascii?Q?s9Zbcp5ckwWJxH1VeZnT1AH+XYCp0huvQbENwdeBtqn5oFovjcgBnQmnYnN7?=
 =?us-ascii?Q?gbOpq/m2KLtHFPZgJrInrS9giEJtAZUkthmQhnrCbkvE3KIVto/6kSEfnR3e?=
 =?us-ascii?Q?zP7Ztkb1pAhIMPgpgX47SHyDchNDkdZeVNEI2cemcOm5YZK8PO/qwPJyLd+j?=
 =?us-ascii?Q?IVgELy9DBIi5nJP3XDOeHGUxzGyYEQDUxbi9+6ZCFJ/aCsVGBOpBE8XLsaZY?=
 =?us-ascii?Q?hWezEcTVX/X5VlHW7VEU64pcTfgjhFscbvClgHBo0brgGLVrQzw3Pi1SUTix?=
 =?us-ascii?Q?MXf4+AZ145sxAyu+g3Kt6uv1uviwEuj8STJt9ictal1cj+3ak0TxF/BEtZoV?=
 =?us-ascii?Q?Ae/8tMNTl+4jw4p0gjvMn4dxBvHGrqIbgdM0SI8JkLj31+XJqK0zmEGZWucx?=
 =?us-ascii?Q?Vv72fR83w7Dh7P1SG2vL0ncSYf7/WFTY3XlDMb2HJd8rmyib/CcTeNryM+Hj?=
 =?us-ascii?Q?0Ye1VJ+Ahf3mPvBT1ed5XkcSi6NLBIQgYHWQPDJDa6+vWfOMqUdlrdm3rGBm?=
 =?us-ascii?Q?5zUpITqPey/H5nzzs2wFBfaqCSnGPo5PaqqT7MSq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2051577a-ec0c-4f12-fd8e-08db928a1559
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 12:23:16.5621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2rCPVEudh8ZUwWzDlV2N49a9DkoJCa791uKhJPj5+ueHblZRZa/RI25HUTYgI7D5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4212
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Alistair Popple <apopple@nvidia.com>,
 Hugh Dickins <hughd@google.com>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 01, 2023 at 02:22:12PM +0200, David Hildenbrand wrote:
> On 01.08.23 14:19, Jason Gunthorpe wrote:
> > On Tue, Aug 01, 2023 at 05:32:38AM +0000, Kasireddy, Vivek wrote:
> > 
> > > > You get another invalidate because the memfd removes the zero pages
> > > > that hmm_range_fault installed in the PTEs before replacing them with
> > > > actual writable pages. Then you do the move, and another
> > > > hmm_range_fault, and basically the whole thing over again. Except this
> > > > time instead of returning zero pages it returns actual writable
> > > > page.
> > 
> > > Ok, when I tested earlier (by registering an invalidate callback) but without
> > > hmm_range_fault(), I did not find this additional invalidate getting triggered.
> > > Let me try with hmm_range_fault() and see if everything works as expected.
> > > Thank you for your help.
> > 
> > If you do not get an invalidate then there is a pretty serious bug in
> > the mm that needs fixing.
> > 
> > Anything hmm_range_fault() returns must be invalidated if the
> > underying CPU mapping changes for any reasons. Since hmm_range_fault()
> > will populate zero pages when reading from a hole in a memfd, it must
> > also get an invalidation when the zero pages are changed into writable
> > pages.
> 
> Can you point me at the code that returns that (shared) zero page?

It calls handle_mm_fault() - shouldn't that do it? Same as if the CPU
read faulted the page?

Jason 
