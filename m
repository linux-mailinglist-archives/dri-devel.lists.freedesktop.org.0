Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4354A758A09
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 02:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DD110E3E5;
	Wed, 19 Jul 2023 00:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1908210E3E5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 00:24:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FhMY6YQ7fqWjqbNu+KRD+aCDYRRSD0C6zFUPt0TUcfK1NO1Z25XHKqK2PMOGXVL9Vd0FTzm/zShnBAVb/veKUQ3+0URAks7vXJBj//FHYkt1jst2Fpqn4B5gIvsOvHAJv/Dsmuxc9Y23XAHrl4XtlB6IRDGyRGaKOOMt5rrPdtLoKudxJ9viWuly72pELahTU6a7b9dXa/WpL/Nqa2eLdYSltRy3unEl5twRjoOyHfRzuz24WREK/lNRo5LqsObHpmV3dELBOxNI4D2kSdmlVWyx7IbXEIIDPY2FtlnzndFPtiVfQTP1dY+swedb8xIRbQhMjxPm6B+uYtRVw+uCgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SklQmk3TV+INSEzR43+Em8I5plb0lSw6pPGM+N4nvbI=;
 b=UbIWFEwlde/5gkdN3aIpLkNuONxvLxjsEg/c9BRAeOtGnj5h4T1Rx/thAaq3UP4ccykDxaTHYAQRT8pdcG6RmhB7QEgboDHrxsef/NpwV4r0N3PSFKjsPj/OJS9Du19neo1B0Fkpw4IwGsXM57YuV4yqN2M/JwJhFfOucRoEzrNwbmA622NJHMxwQjR8ScirAfk/AM5Ssu3hscls8OFIR98WOE0VZ9LbKDb7ujaAryjIBMSPMqkJbFSaa9fzBgBbcqxEC+kc0uYvEnRuy9aS+p3ryCMcLm6doxI3RJEpOaXAIBjxQI6KxaikeCLdhMHk9DgXxGspwJXMRDTm6bbnSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SklQmk3TV+INSEzR43+Em8I5plb0lSw6pPGM+N4nvbI=;
 b=TEaYk4ExMhANqT7VvFgoqvyjlAF+Q016bJtU527jfH/4sfXWtcTzI7PL8sUgjHJzfo1h3MuFXXKdragheHcnO12oLugz158ctVtzSbzPOda48l/pJ2oMvmHYxd4vHE1xxOBjUO9AORujE/F7rNaHssCW7rTrG6cdStMDnfO8O5q1VnwSpPMDun1lf12JXldt3Dss/hxfRi17H1Pye5mDlZwGXyUyGdXa4nw5LhGaDvuL9tpVLTFlxEoMK7LD55yOsbB7hpLJu1u9XeppTkEoKDn00Uq/2yODGrT02TCGve4AdiBmRikO+RrEkzOtMnkI+QETH41fMXqnGwr3LYM5VQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB7377.namprd12.prod.outlook.com (2603:10b6:510:20c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 00:24:39 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 00:24:39 +0000
Date: Tue, 18 Jul 2023 21:24:36 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Message-ID: <ZLctRBcOySnJh3rs@nvidia.com>
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-2-vivek.kasireddy@intel.com>
 <ZLaxfmrVo7sygM3d@nvidia.com>
 <IA0PR11MB71852354956EA85210AE5350F839A@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB71852354956EA85210AE5350F839A@IA0PR11MB7185.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR06CA0006.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::19) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: d78975e9-efae-4b79-76cd-08db87ee89e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ygWAG90uZ6EqGfy3jG59zYlXjSol6t9h3edzy6gQ0YyS8OSWV7Nl1suJKHim/vp2Pgqj/SOID9ttwP5WqCl8zPxdywm7pbBkgBuoBipHiIzGIGxNMGJeKmStu81MrF+PXQkaxy3evaAI5O/amaqOKzHeUKDfCk0LDOFoC6a1+T9nn/9KpXxtJzw0kC8HC9Y9Mkw/VZ86aA0/kexi3y0eUys3ypD520iSjseZuRZ3p18UKq912Qp56OwOcZkKZlpvjTmphb0WQIS7Wj7NF70AJB/ET/+ixnalabVnkZmIvtYDWhjd5xPzl8Ma4wN9G56DT3VaYnEIbTnBs2wLaFHk8z1bCPYkkro+jfzZH9EmecGEMRrq9p11OV1LnPaoh5XN3Dvj2BjzGOvuMDSOwTPxaiDECe4c6sjDo4x4pHWE+QpQVVLzA+CjnAqc7LgsMz2vjN3x1f/CVYj33aMFmfWCS+dIngYXw9e/ngkIih+DQRZtuJG4y756lo2Xb6qfyepUhsdER/5VjqDWiwdkLEAWPat6uIQ6TmckZnen5xv2N42hoaz0kX31clXZHlcOAkk3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199021)(478600001)(6486002)(6666004)(54906003)(6506007)(26005)(15650500001)(6512007)(2906002)(38100700002)(41300700001)(6916009)(4326008)(5660300002)(7416002)(8936002)(8676002)(316002)(66946007)(66476007)(66556008)(86362001)(36756003)(2616005)(83380400001)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cVHlJ4XwPf064oF/00KSEcLpDR7UJd5vBl03+pbgz8q0RA11g4Suu2Eai/JK?=
 =?us-ascii?Q?JYfgN/RzW+fyRtoHqH6vScCGpkKfMhDBiDE4INP01065mI74WpKuc5riPclg?=
 =?us-ascii?Q?Sk0UQllw5TmOt7NMoS0PIzNAsHYJLRK15vMB7+DuAhGM9Pvi8BFfYMYIxNQU?=
 =?us-ascii?Q?eNa5MAyz+7+KIN46g8Y6GqB6D2BYnDKx4P073eBnHS13C0UDYgxbdh6tqM+W?=
 =?us-ascii?Q?FRXhhg3eEHbZDn08lcyQS/8yF0TzDgImo8JYuoS/0i8OSBATEQMhs9Qakd5t?=
 =?us-ascii?Q?NumVLTqOAFR1gqOcCN3sItLuEELJxjJVl58pa0vTDNkOjqDpxuw0vNtRwxM7?=
 =?us-ascii?Q?fQ0zhGCMEF/xFAC9TckEI6g4VJPqhF1PTWhiPxUb3yuENAdmqrnVEeXxw4Qz?=
 =?us-ascii?Q?aw8RyKRRXmD08RCx/6Brw/ifj7FOg8NGDFXllaC3XrEv5cAAr47qVdKLQNVi?=
 =?us-ascii?Q?NwMJNhHiTmyx1mXcWyR9fXT15QDlL0MWkDvY1JrkPy9R5wtpjCmpSyAr/dOa?=
 =?us-ascii?Q?KeIaluala+lzqZzaDzK5yQdVml8qjuYfI3nwCkcdsTjKJ5MVPbOP2z3vr8jJ?=
 =?us-ascii?Q?Qazb/twn3HbjabGkycW8xCBCc5Gxdka1CVl1tUDeWc4YC0pagNSDx/OBwacw?=
 =?us-ascii?Q?L57X4bveznbxcaOR4OoUUia7mw9F7MVz0zge8HtTrSXp+K7XVkGp5BHp1G94?=
 =?us-ascii?Q?lKBH/PeCcHdW/cKO33+ip1hkriqWJT4S/E3EOJk8nhk17uwoqgTGkv6fD63E?=
 =?us-ascii?Q?ZpF3byV8e1oSxF4Oks8Ob8YFyLguY8fWR9ErrrvFQ4i1UcuPztlPchJMbbzq?=
 =?us-ascii?Q?7qMmNsl/y8Y0yxN4YcXSFDrehtAgNGG8zue0DdTa8Ggjw642C54C9R+9j/G4?=
 =?us-ascii?Q?HRa7+fMDxaSoupB0oCi+sylMoRDMVjX8t/2zbRi5xEqt5kDtuBdt+9XPrvwa?=
 =?us-ascii?Q?f48WZ3qwkFTw9qMdP7HBeDb+neiuvhQVeCFZ3wrlSvdT3Ktzz3GsM1dP2NKK?=
 =?us-ascii?Q?A8wzqm3ZA521cLhwqlyp0biuLracjplnlw/uYrmWEVspUtKoMyp61vRGNgxK?=
 =?us-ascii?Q?sGDRmOXy9B/KxIQJx2ebeRQt5/V4WIv9fByEEOC///l4YTE5/IQejxa+PMax?=
 =?us-ascii?Q?96FRYDc3AWeEzouePV7EpgvfLWp5T6Q+5HHbeEMny17FSQ0D4Jsba1fALMt9?=
 =?us-ascii?Q?dvK/r5nOT2ISW6udjs3r4ZPaNqQwJvEFUNh1N90RjvDlaaFpk3+F7W8E69Yo?=
 =?us-ascii?Q?0Mt0La7JMq3kLlzkNgomppcNeDYRqhVIiXLsVWWaeK2NM8vLVJHqYlskELFf?=
 =?us-ascii?Q?rh2V1uasZAKdz2zZOJBhSxeIxoNGHedmjGJ9OG7ATCa/IV5A2yCcIpBsNKqa?=
 =?us-ascii?Q?pkq9NIY8qx8QAVc51DJC+pDYFLthDLNV9zfEr6IIc4mQJg7tfqGiZ28sikYs?=
 =?us-ascii?Q?I5mjtkztZrAylTTSHSIh0JWN240Ga/S02KqF0wNrh9h97/UoLGRKUepLpsNq?=
 =?us-ascii?Q?wtkrO0pyj55pL2AA88EfIk+mlu5hrJqsXdGuPpgi2DO1kHxmxI5TC0TC1z4/?=
 =?us-ascii?Q?s8Mbwnd1hWOPFDmWQwFSsCeYdXlNHhv5ruLfkCT9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d78975e9-efae-4b79-76cd-08db87ee89e3
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 00:24:39.0186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+ayR91a9Q1aSDu0AF4WWBUMGernZbGcm9erHsqWHO9maTG5FuJ/7r43lH6xjmcH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7377
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 12:05:29AM +0000, Kasireddy, Vivek wrote:

> > If there is no change to the PTEs then it is hard to see why this
> > would be part of a mmu_notifier.
> IIUC, the PTEs do get changed but only when a new page is faulted in.
> For shmem, it looks like the PTEs are updated in handle_pte_fault()
> after shmem_fault() gets called and for hugetlbfs, this seems to
> happen in hugetlb_fault().

That sounds about right

> Instead of introducing a new notifier, I did think about reusing
> (or overloading) .change_pte() but I did not fully understand the impact
> it would have on KVM, the only user of .change_pte().

Yes, change_pte will be called, I think, but under various locks. Why
would you need to change it?

What you are doing here doesn't make any sense within the design of
mmu_notifiers, eg:

> @ -2164,8 +2165,12 @@ static vm_fault_t shmem_fault(struct vm_fault *vmf)
>  				  gfp, vma, vmf, &ret);
>  	if (err)
>  		return vmf_error(err);
> -	if (folio)
> +	if (folio) {
>  		vmf->page = folio_file_page(folio, vmf->pgoff);
> +		if (ret == VM_FAULT_LOCKED)
> +			mmu_notifier_update_mapping(vma->vm_mm, vmf->address,
> +						    page_to_pfn(vmf->page));
> +	}
>  	return ret;

Hasn't even updated the PTEs yet, but it is invoking a callback??

Jason
