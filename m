Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B80433ECD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 20:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9F16E595;
	Tue, 19 Oct 2021 18:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7716E595
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 18:52:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0NQrDoHikOeq5XsOUFa2KGFK2KswKXBH6bdMVVMAWz/z07EPHVilz3QhGgk6WcboviYRPWOV37RJjRPlWiknAuOFNioa0k0/YEZA8Evw4ANNhXnS+IZWJBPOAAwhFp2sP1sNtisNkopgb86sbZuqqvKlyxgRnKi+7VuMEb9A4+p9fVHGIZywey2t6ZvJEreMMw+YCV/642qbhZBlM+NXjfkQDavc7KxyCVfueutbCr3eZtoZhvEVlQsB4gZTfeiWdzLnHV1Fxb1h2iQnZjDN1lQVZAMKFOxQFOKJaah1+/TwFulj5LW6tDDUZi77Dyygj9i/mHPy4tRhdhFY9ntkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIOzFf4sHYr5EGToT6HKN0FRvg0TbKxzBAf4hdu3NCQ=;
 b=bQp+xAzcHI1zyAT/5K1KVTeAuyIL1X7RmlGI+4I4sEVsrs1BNvGJ1EEJN0QsWkPbVSrNO8KH5w/yXMNawIn80gY/nBeD40iNyQjHf3y2L5lOQT225afxeXThHrZwXLlZ30R8xXmBe8k9iDhoJivJUpFSEZjfh/HeG2xq2cknQoGygm3eY6ebYpE19LXxkmwgxVbz3vWMGQ56lb+7Pwq2lO5AOaHybEcmKsCQlhp70fHqTbdiFORGTdsQ61P/FOQE0zoBWUR4tzC8VOkSomqeqYTuJSVQHGqXnthbpuE44+buI2kNtb8CbnUl/MxydsexX69yfbdpoiIrPT6JAKXlrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIOzFf4sHYr5EGToT6HKN0FRvg0TbKxzBAf4hdu3NCQ=;
 b=Fe2RZo3c32pUNyB5Q9nLpojco7TKcX93q0ZCqpnJa/GlO/69F6BjK8a07ZTZIuq0Nms2gW9a6YMyA9ed2v745vTNkpoB/T6PxlVYF7Ybk54HB7ftTR2nNqBE8AOobFqm+ULCo6uxIRwwDgjSPuEJ72Dh981RtB6Ifwx6tyZQ27W8EKN+YeibyIH7SuStUlx3i0LJVfWvfIeFfpv9XkYXT0Tvr0UKvakLG8scuoaO7sSC+1/KZJ0l3wrG3kmEk1IsZ7koWDPxmvq/mP3NfW6ReMMDQ8xu9SAdC7Vfrb4ngU3nAoDyVx3dyo2qYGldcW55KTIYUJ0oijLanOsf3mRF0g==
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none; linux.intel.com; dmarc=none action=none header.from=nvidia.com; 
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5364.namprd12.prod.outlook.com (2603:10b6:208:314::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 18:52:09 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4628.015; Tue, 19 Oct 2021
 18:52:09 +0000
Date: Tue, 19 Oct 2021 15:52:08 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>,
 Christian Koenig <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Dan Williams <dan.j.williams@intel.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Roland Scheidegger <sroland@vmware.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH] drm/ttm: Do not put non-struct page memory into PUD/PMDs
Message-ID: <20211019185208.GY2744544@nvidia.com>
References: <0-v1-69e7da97f81f+21c-ttm_pmd_jgg@nvidia.com>
 <616958c2-8dc2-e8f0-4421-eddc7e4f9d5e@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <616958c2-8dc2-e8f0-4421-eddc7e4f9d5e@linux.intel.com>
X-ClientProxiedBy: MN2PR14CA0023.namprd14.prod.outlook.com
 (2603:10b6:208:23e::28) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR14CA0023.namprd14.prod.outlook.com (2603:10b6:208:23e::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 18:52:09 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mcuDY-00H5HV-J7; Tue, 19 Oct 2021 15:52:08 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f06e757-19c1-4988-3b33-08d993318de2
X-MS-TrafficTypeDiagnostic: BL1PR12MB5364:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB53641AF03100E2CFF43F35E4C2BD9@BL1PR12MB5364.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W30kVy//1JYtprX0PFI3PzO4LCb2pFV1NHkf7onCMT6NyAezURQ8ifcB38tItFh+EDkJ4rsRM9E/VaX+b29a9SxL8r2SCGp54CyJI6klGXkE4gEVBsn1Gw/X5baBy8d/1PBqRSAiTYu+YZDgr1W/578hPkRlQBSBIE5fenJFLaVMaI1ZVmK5gDxw/z8LJDWUglSsSSEMoj0JNJG9RQ/nIJUDp9+Bg3o45r9WgUeLgGrDh2L4ZQXekWlXtV8f43iTTsBbM62PyoAscTvCCMLtzpcGab/kCYOAkduDZuEoHN0tj99e3dWSX0v0mT7mnq6bN1xrrXTEWKcjsFGenIiIFUkUCH3cJw2nJyPyeTCPaJa6uWpla3ifS3EyTJWCx8uc3qtOUEHvw2I9C4l6v1zHqRj93666hJOoYAcO1soG9nfDCArw2BkP1jFcHZUcoUxG2aaUPZyf6lImko+mVCKZmPEOEmiaIm5PSu9zE7K2DGrqjfAdbblF3dI/acorXDWnPCfNDGKyOxIeJVgby4DUiEKJHDV/RK2bwBV10Fv+JvDjKVoCo7ox2JeIb4rW7d/ubSuJnc42DVb9Cw7d1RgHKXXY4788x1GDw7amOU8lxwoZ0augn0yBRaxDGeXTEVg+IL5iN0eK9jO4PvAYPV5P5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(8676002)(53546011)(186003)(508600001)(1076003)(36756003)(83380400001)(33656002)(316002)(5660300002)(26005)(9746002)(2616005)(54906003)(8936002)(66556008)(9786002)(66946007)(66476007)(66574015)(2906002)(426003)(6916009)(86362001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckNzRzNxUlBlamw1blBsQ1lLMjJxNlBCbnc0Qy9VMnJGeUFDZmZmMDhtVjFz?=
 =?utf-8?B?ZXVmYjB0Q0d6NTVOZ2laV0JVNzIzMTlEV1pSL2tnckc5RWpENlB2cnZnYnQ2?=
 =?utf-8?B?UFNud1V4eWZENEJqR0RrbjRXYTFXQlVUODJXd2xFd3AxTDFwZGdOeHBEbU5F?=
 =?utf-8?B?aVhsRG9wUjhoZ0RGTkQrR2RCcVZEMkFRVFZOcURaRkxiVkdjek5ITlIwSVFH?=
 =?utf-8?B?NGhBOUpCei9JMm5DV1NWMm5NRitrUkJEYzJEcGpGcXNhaDNQeVp2RGJvR1hs?=
 =?utf-8?B?RGhIS2xZYndDcy9FTUJVeFhsY3lvNTdUUW40N0NBZWJHeG5rQjVmV2dwcjFB?=
 =?utf-8?B?R0E5MHJFL0h3TDNXWkZ2MG51T3owTWI5OXpWWkxDbVhkcGp2VFhldnVLMDRJ?=
 =?utf-8?B?bjN1Rmg2M21VdTF4RmQzMDhxeHV5cFc3YkE4bkl2REFsTzNqTW5QanJjbnEx?=
 =?utf-8?B?SW1CVEIzR1IzRmYwdlpUa1JGK0MzRmJvcDdncFpYNnBFeGJEUmI3KzJVNURY?=
 =?utf-8?B?UnBKa0s4Y3lCTEE4bGNQY2pkMWFqYXhwNWFwS3E2ZlF1YzVrcjhYSm5QcmZE?=
 =?utf-8?B?UEFvbzVKc3ZDSXRxLzg1UlJ3cUJ5T09jNnlMZktrMDJyVFdNeHRoL21sZkpr?=
 =?utf-8?B?MWtlcThGTGl1ZlV3bXZCZWxKbHBEcFJVRUxSN0RvQlloNGU5VjBSWmNYSTZR?=
 =?utf-8?B?RFhCNW5TbWlVZW04Zzg0MEdyeUxTT3c4RGxIRGN4MVFvRW1uU2hHejV6b3ln?=
 =?utf-8?B?a1ozSkNtRVoraE96WU1TQzRhMGJJY3N1djUrTTl5K2Rka0tJTGtlL2UySW9I?=
 =?utf-8?B?WHVGSWxHUnJmT0tjdDMrVnhZVnlUWWdsa2o2eXprdkt1Z29vU1lpNlZtQVRy?=
 =?utf-8?B?RTVuMWpRL0JiTE0wc1hSU1Vqc1dva1NSWStxd3pibFZCOXBZZmxXcFZramZK?=
 =?utf-8?B?MkcveFA0UnRxQnBtczNMY3V3bVQ5TUdWOU9SalJjYjdtWFBNRHEvdlVGaEk4?=
 =?utf-8?B?ZHdTenFuMEcyQzRZN0FkUkJwZWtoeWt4bDBIdUtoRXR3UEtwK2NrN2daamEw?=
 =?utf-8?B?Y0paTHArdkkvYjJENWZER1pURUNoY2ZhQkpPVUNaQTlDTWZVQ0ZYT3NCaEp5?=
 =?utf-8?B?YXVlcE1LeUNrc2FwNEtHWGh2K0x5KzRhdFdnZ2FWa29nU0tORWlaWEpnR1VM?=
 =?utf-8?B?N1RaRnVnSDJVOVZZM0xmQU5lcmgybHRzcTVQY00rSWJVSTVsaDZ2L2ttYzVj?=
 =?utf-8?B?clpDLzcwUDZaNWl2dUhkdmdXWUl2NldYTG42N2p6R3hWSWY4S1lYL2l3TTdP?=
 =?utf-8?B?SVMvRlpNTFFhL1kvNmNURmRQQVhBRHpFZUFTNmRiYi9wb2crWTdRT3Y3eUts?=
 =?utf-8?B?RE9SNWlZdk9RSW9UYWtYOE5WR0pUZXlaOVpHRWUvL1ZYUVJnZnJUTkF1ZHg1?=
 =?utf-8?B?Q1lZcXJTOUdwTHNPQkZ0ZThMVDFzRitkNHhxUlFvTlpjSmFDMjJ5dmNiQ0px?=
 =?utf-8?B?TVhrS1JNK1pMRnVLYlVza0FDNitQSnNBMkpUQVo4eVdCZ3RBclBoUnFBaEpN?=
 =?utf-8?B?UE5ER2NRbVZVWHA1NXJCQ0lQMGxSQWFIWE5MdGJhaVR4NHFMR01GdDFBTjJ6?=
 =?utf-8?B?Sk1vS3krRGVBdjdwZDlCN1VYbnZNRDNHWHo4WUFlVFJYUGUrQ2FmM2hkK1ho?=
 =?utf-8?B?L3oxQkNQMXB4TmFuTFB1Q09Yd3pMMUN3dGx6U2xxbXh6NVRwbjIyZFlQMTNw?=
 =?utf-8?B?RU1qTU1hOSs5NGd3a09JeUhySTA5cjZvajV0UTdoNVhFL3BaTDBPbHNtclRn?=
 =?utf-8?B?cUgxS3R1aE1US2hsRDdRdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f06e757-19c1-4988-3b33-08d993318de2
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 18:52:09.3476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jgg@nvidia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5364
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

On Tue, Oct 19, 2021 at 08:49:29PM +0200, Thomas Hellström wrote:
> Hi,
> 
> On 10/19/21 20:21, Jason Gunthorpe wrote:
> > PUD and PMD entries do not have a special bit.
> > 
> > get_user_pages_fast() considers any page that passed pmd_huge() as
> > usable:
> > 
> > 		if (unlikely(pmd_trans_huge(pmd) || pmd_huge(pmd) ||
> > 			     pmd_devmap(pmd))) {
> > 
> > And vmf_insert_pfn_pmd_prot() unconditionally sets
> > 
> > 	entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));
> > 
> > eg on x86 the page will be _PAGE_PRESENT | PAGE_PSE.
> > 
> > As such gup_huge_pmd() will try to deref a struct page:
> > 
> > 	head = try_grab_compound_head(pmd_page(orig), refs, flags);
> > 
> > and thus crash.
> > 
> > Prevent this by never using IO memory with vmf_insert_pfn_pud/pmd_prot().
> 
> Actually I think if fast gup will break even page backed memory since the
> backing drivers don't assume anybody else takes a refcount / pincount.
> Normal pages have PTE_SPECIAL and VM_PFNMAP to block that.

Erk, yes, that is even worse.

> (Side note I was recommended to introduce a PTE_HUGESPECIAL bit for
> this and basically had  a patch ready but got scared off when trying
> to handle 64-bit PTE atomic updates on x86-32)

Right, a PMD_SPECIAL bit is needed to make this work. 

> It might be that we (Intel) try to resurrect this code using
> PTE_HUGESPECIAL in the near future for i915, but until that, I think
> it's the safest option to disable it completely.

Okay, do you want a patch to just delete this function?

Jason
