Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 557FB437CFF
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 21:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EAC16E81B;
	Fri, 22 Oct 2021 19:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8B66E5D1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 19:00:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMi4GBCzyOTlCu8E4cB+hJtPj2sYf2xuICPbQkSusRKj1/vH0KfpxE92XkkcK0DJIlCmeAchevJ3mImQGW3E0xaDlJQCcI63oOI/QDa2rxXaoqIfqzJP3hAJa4uG1kGjned1uHMP3HS8bOUMGw1oO+R3bqyuDEyCdr9IpZ0F0h8qvkCdrNQWQLzjNnS2WH4bUSJGIDNTXvChuBsQUHM5etGSZeRzYNxXDnSVvT3LTqBPADuGtr3NzT7YB7nOmgJJbxJd8mA8YT9Dhx7KIgtlw1UHRANlLiKbDAijAJ11y0G5anWohp0RO+qwi1ZQEg1HPcMDeIDud5ku9nkWwDPBJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+Fp3yz+pNp8WcSHT/pfh3a2DitgmnmElcBqw/IlVc4=;
 b=XSQXxksmdecU/pG0wVZy0QcxQmPEug4JV+Pss/JWC3T3NsfkjNd1Zxs3PTE3LQjNpES9xYPnytdHzx1MyIBPKEy2AQVysRLrBMo3LhsTQ3ZArdElJyzFu8cU1CJzop34yQdjOlr+FhOTvi9sBtIBtez+XaWmzzGdkQPrDNZy76jSMp3pSunjbZbpkYjWXykDmL98r2UI1/o7uSujJd0GkZMupJiViSZGE5om9Byae5ov752OYsacHU11E2XRSm1En183AFRwTB5n3pL1hAMhU8ilf28cjikOlBuXUWpuvVbYB8VLwGEyuobIHzeTiBx2XS3WnSN0lmDw5806JOJuCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+Fp3yz+pNp8WcSHT/pfh3a2DitgmnmElcBqw/IlVc4=;
 b=hRB97InmkI9IZvSi3Y/sp0ntWtCHOp3WNihZotK9kqXZt87A7RWOcEfSMizRi2jR8ajCkPi6MA4nrWB09Pg53ngP/t9jEMv1/p/lbLTezDCpZEgfqJ135B3epKiTEjlmd3H1GRJqzbCQWG1fmzpBfz8fAECNRYRUyn4l9dEUSmiYLMyHX/eLpuZCG+21q2wghqvjVhJ23RvC+W28EewBzk4wTb0Xl6RB9zWWaBGmPN9FWmbpyhe6Qc1FSR9u30vxW/xWLqWe527nOGRz/JgeqPKpB23Wp31pK4H5sZYrW1T89ea2GdFYfoZdKzcSYEhAKBgb1KMOnBK33Ls4fLj8JA==
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5221.namprd12.prod.outlook.com (2603:10b6:208:30b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 19:00:33 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 19:00:33 +0000
Date: Fri, 22 Oct 2021 16:00:32 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Christian Koenig <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Roland Scheidegger <sroland@vmware.com>
Subject: Re: [PATCH v2] drm/ttm: Do not put non-struct page memory into
 PUD/PMDs
Message-ID: <20211022190032.GP2744544@nvidia.com>
References: <0-v2-a44694790652+4ac-ttm_pmd_jgg@nvidia.com>
 <47182e81-39f2-1143-7654-fb31d171e4f3@linux.intel.com>
 <20211020140958.GE2744544@nvidia.com>
 <YXFRrvQCho36OTHE@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YXFRrvQCho36OTHE@phenom.ffwll.local>
X-ClientProxiedBy: MN2PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:208:236::22) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR05CA0053.namprd05.prod.outlook.com (2603:10b6:208:236::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Fri, 22 Oct 2021 19:00:33 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mdzmK-000hvo-Ap; Fri, 22 Oct 2021 16:00:32 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a466ae5e-9261-4cd3-ecef-08d9958e3978
X-MS-TrafficTypeDiagnostic: BL1PR12MB5221:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5221E4EB1E266B6AD6EAA3B8C2809@BL1PR12MB5221.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HL5gJEcd6EU7TI+36zjQW34O3tAd4fofxz+p8AJ3rfUTSx0AUcRF3UGE6F4zrHsxNOYHTaGw/RH+fp4/y1zZi0qQ3JAHabMnx+qpKng/4pXcTBdw26ecATpTl11IvXHJP/FdXbVIUL3u2QQLew2ZosbUYnVcgHH965+ZvUxJMSpbi4DxEjAjb7QAZjpo+gS3nru3/oeEuy8oAgwseLrEw4iw4TsMFQLfF+jXN/5atq26DwTpxRsN9IpOU4z4ZZnYhCviXCZ8MczRuM9Ei0DjA9/exgt3L+p4g+fIX9jNB/8f1bp9JxNENDUZR1xSaGzN90M7CLacxSw+FHt0RUM5ID1QkX2y5Vn67ngzdCbA89YZqEi28EPrpQ1oAeNNGQFdj/nFgYoqQ/cH39TsI73IQH5cWm+STWmVKbJf/e/Pp/S1JYBK2utF8snVkmugET1UV3pwu7n19o3HmZ9NM59EPDr40qfshpMWuCoTH42YYRYuJZYAp1WqiquBnCYkSFCz2HETgYsW+gf1U585R8mBmqhV0huvuwXRTivOe9TafI3OOz9KQS+KUgPQ0a5uVUbjCtZAiWOsFda/dFnkPCchCvF3Qt40t6aKixXoW3HhTkDPzHpl2StSITVm5mFdQvhcU88sOUwqJnFTnV+bENycaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(66556008)(66476007)(36756003)(66946007)(316002)(426003)(26005)(33656002)(4326008)(2906002)(2616005)(86362001)(38100700002)(6916009)(8676002)(508600001)(54906003)(9786002)(5660300002)(8936002)(186003)(66574015)(9746002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXpKTnJZclEyVTNCRHZUZUNPUEdXTXkvY0FxOE9IdGpOYjAzbkQrcW5nTFBV?=
 =?utf-8?B?UU5sRkt3Tm9wcTVnTVdhVkFLeW54cEVMeEgzSzRseURKdnpBNnVka3JQYklF?=
 =?utf-8?B?cnE4ZW5McGJhVFVqWFZGcEtQbFZYME5GcVArUlNQNjFHZWZDRFI4RXFmRG9X?=
 =?utf-8?B?T1dKSDhhRlNwdS9yNkV0dW1Da0YxTEJKbHhnTmNNMlZIZkF1bmRwVlhQTXly?=
 =?utf-8?B?STkvcnV3ZCtnQXZtYU51OFVtM0MraHhsQTZGcmJ1WlBqSFoyNzg5V3BJZzVn?=
 =?utf-8?B?MGl6OHErZHJkN3ZJSXdDb1RrZzRoRmlEc3F2Y2lJZHBTUEcvYVROaDlSZm85?=
 =?utf-8?B?eGpVaCtHbDFveEZWNm8ybE45dHEzdVF1dEJyREhkZzZVQWpyNzZ2Sm1UY09L?=
 =?utf-8?B?KzNtSWdjSlY1TTJuRnExM1J1SkEwaXU3WDhWbEU5N2Y3Z1RBcDBUMWtkU21q?=
 =?utf-8?B?YnJzVG1IYy9wR3ZPcWJWMWNPK2pndFhDVnBvcVc3Y0t4QW5uV0RFTFltMC9O?=
 =?utf-8?B?SFptM2cwdXVBOHFWb1A4UndtaS9TbkZPYWw2UGIxRjRjYVNpbTh6U3hKaFNk?=
 =?utf-8?B?K2lHSG1PUmQ2UnI0a2ZNY2tHbnpDeHgwTkpNVUlubzR5ZGNjL2E3ek83TjVY?=
 =?utf-8?B?dmwzbmE0ZlAycE9ZbG5tVndNYjlTeVhtUEo4Z292ZXV4dFF5bVB3NlBmOThX?=
 =?utf-8?B?TGRPUm9TcFhNUHBCcGxHaEtVQlJOcnpiczYxL2VrNVo2ejBwVGJJTm0zcGkz?=
 =?utf-8?B?VXUrUWJZYkxtd0lTVzJtOWZva2pTaXRxNDRrcURMWXYycXV1WUR5Y3N3Skx0?=
 =?utf-8?B?MTJZQkx0U2JjQ2tJc3NtVzRXLzNYcHlzaEpWSDBoUjV3SUJKQlVwYzF3N1dX?=
 =?utf-8?B?dlFJamNMUEpSWnZic0hxemhDZ2gyUWthL0QxUnVZbjJ6Qm5QelJvZXI3MmtJ?=
 =?utf-8?B?cTNjbzZ6QXZMRlZxR1MwVDJ0VnFBTE03TFlwZXErUno3dWdGSi9PMHdkVlg2?=
 =?utf-8?B?UXMzMzVxUTR2TDk1OFdEYVcrM21Felc5QVVBN2NLNVd6OU10NzF0b1JwazNI?=
 =?utf-8?B?dWJtd1V6L29nYWZQOXNtUE5KaWQ3NWxsNmc5NUtpS0owZDFUb0tPZmYzRVM1?=
 =?utf-8?B?V0RxYldob2ozUnVmVXJlSnpvVGdNekg4aWtVREpkcGR1dElXYjhtSWhxU3or?=
 =?utf-8?B?d0EyZFZTVWZJNTgwWjY5WFY3UEJIUlpxK0lMdi9sNGFaUWFyZ2x1Y3FFZGh6?=
 =?utf-8?B?TUdCUHhLRTUwd3Uxak1IZ0VueTY2UkpYQm9xY05KTVRPUkxUbFZCT2d2MElO?=
 =?utf-8?B?N3g3aDUyVENzZ2dKbzNUczBhOGoxcHVyOUFsbVA0M1k4cEhrY0NTYXNOZTFJ?=
 =?utf-8?B?SUJPWVg2MUdVN2lXVVZWR3pzdmxFNmc3Mm4wRVprMEc0bUlMdHRWYlJQd0Vv?=
 =?utf-8?B?cnJqZGorSVF2SldiQ0JwTS96QXJEb1d5d1ZqdWFLc3hmSnNtRXhRY28xYkNC?=
 =?utf-8?B?RGpiTEorcVprd3kxeVJyUUVKanZKRzJYNm1qeTRGR1licHBXeW03WHVVYjNj?=
 =?utf-8?B?VTkvMHIvRGVXQ2dJL0RFWEN3VXBLdjJoUEpEVmI2Zmc2WFFnOWRFQ2RTb3pX?=
 =?utf-8?B?SGtNQ0lhd2xiS1MwMXdoSW5TUTRqL0VUWmV1Vng1bEVzbkZTYVFTSjlxaDY2?=
 =?utf-8?B?OU5CRkpHbG9DNDRCc3dRekNDcVY3Y2t4dlFRRk1maHJpVkRKZkVLQUxYejZL?=
 =?utf-8?B?M0JDTU9NRllGeXBsUDVQSDJWeFIyKzBPbzk2WnJ6UGs3NDB5Z1hBb1NKSHV2?=
 =?utf-8?B?ZkRUNU9WWmxQQnh5anpGSVNockF5dWZTWnNoQ3VZWkUzRklpUUZHOVdRaFJE?=
 =?utf-8?B?ZmJLOUQ0bGVZWHU2d3dMRk1UZjZrRnBQa1kzbDBHUFlLdkxYL1d6TnRyV1o2?=
 =?utf-8?Q?PbmGCqeVMAE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a466ae5e-9261-4cd3-ecef-08d9958e3978
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 19:00:33.3529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jgg@nvidia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5221
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

On Thu, Oct 21, 2021 at 01:40:30PM +0200, Daniel Vetter wrote:
> On Wed, Oct 20, 2021 at 11:09:58AM -0300, Jason Gunthorpe wrote:
> > On Wed, Oct 20, 2021 at 08:34:33AM +0200, Thomas Hellström wrote:
> > 
> > > Follow up question: If we resurrect this in the proper way (and in that case
> > > only for x86_64) is there something we need to pay particular attention to
> > > WRT the ZONE_DEVICE refcounting fixing you mention above?
> > 
> > Similar to PTE it should be completely separated from ZONE_DEVICE.
> > 
> > Seeing the special bit set at any level should trigger all page table
> > walkers to never try to get a struct page.
> > 
> > Today some of the page table walkers are trying to do this with
> > vma_is_special(), all of those should end up being the Pxx_SPECIAL
> > test instead.
> 
> My understanding is that vma_is_special is for platforms which don't have
> pte_special, and hence can't do gup_fast. At least I was assuming this is
> why vma_is_special is a thing, and why some architectures cannot do
> gup_fast.

AFAIK that is what vm_normal_page() is for as the rules for MIXED are
complicated 

Once the semi-bogus usages in the PUD/PMD page table walkers are
removed the only remaining users are in arch code around vdso, and I
haven't tried to figure that out..

Jason
