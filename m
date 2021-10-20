Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DE94353E4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 21:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6906E0FF;
	Wed, 20 Oct 2021 19:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FB66E0FF
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 19:37:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWHbJrBZ/uTtk+dm3FXe5K476t/pU/C4HuhmfgRdVtDwxhAIVp3PzeZl26/Ar6qS2u7mnQ9QUmLEPNBFEfUTjlsu9BeD5D5Xm45OWUj24K0POSd3ybO4u6mTsYMXkLX7oFLn+HElpdOhe3xMFRG8Wy5Ivz0rt7+OKfdJ5sQ07mYpc2ep4v3vFA36fMbYbOHOMjOfAoJjtIeFzkTQhUIha3ueDDr4B0ay+W3QFi0pgbeW4oIITghJzgCsPOzKDIUDcJ4kKH+ijcs08I10UTh8a/2aAzcckVmaeN5lhl4Iql5VP9FsL5GgSAuid68FIkIGatZQmiT0goxPLjDHt0de9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyZzdB7yH003DAxbAxc4Z+GnogTMFKalLlyuXEHTVWc=;
 b=LWgG+8JjsZ2XwwfOg8EuRuTpaqCe5Pab0OVd7ntUKWUtQ625CjVuzRsBWL5H7jotik2kWoU+cAVoW4+lEpCR9awJ/iV0wFWGVZ9zm3Ub0De+ianluJYcrXAXeBzeb2yxQxMclAxGyxna4wUZzPzmzlZiAFL7Y9LENPO094wr9fjIGMkMMhjdWdA+6XwECFRnECoC/DoLAF+qmGK+ccbwRzP1TjaUgFivXN586CnrPlg0Vf0wN4WeaP5ZY3ZewL9M+t6OTT3zr/SXsMil2HCQ54zh6gvnEYcos6cKmxQYKq8uEwNSsvnGMyhmgSBEw1qVonaKWODAQTomtRhUSnn8aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyZzdB7yH003DAxbAxc4Z+GnogTMFKalLlyuXEHTVWc=;
 b=DhsZrLx3cPipO9OX7UyDw4BLaFF0acpCL27OheJI+JDLiOiH9g7JPu4gmVyRVIxhs7MN0et7wqhMbxK1JsxpPQoFGRhDq7+H4u7JPmE7fhP2uwxJ8Tizy3lz/sMhyNECM1QWv9C7LaUTrTdOTrLdLPZSnncEx7ncpZI6T5ZfSinf00KgFrml8o6WKNXIuS5y5mkP6Ogx01D7+qKAkW4oBJD8m5YUGf0lMu4P3GwIPzXKAIxgdZb6dqSs9RKKdrw+m0jtbEyAwfwYvMlGTzigb9iZgSfhgKgY4JMKbbj3XoPgPlxe+9GLo1mXgXP/B4OHumPRkZ3iyBlEcgdxKx2dlw==
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5303.namprd12.prod.outlook.com (2603:10b6:208:317::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Wed, 20 Oct
 2021 19:37:03 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4628.016; Wed, 20 Oct 2021
 19:37:03 +0000
Date: Wed, 20 Oct 2021 16:37:02 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Roland Scheidegger <sroland@vmware.com>
Subject: Re: [PATCH v2] drm/ttm: Do not put non-struct page memory into
 PUD/PMDs
Message-ID: <20211020193702.GJ2744544@nvidia.com>
References: <0-v2-a44694790652+4ac-ttm_pmd_jgg@nvidia.com>
 <47182e81-39f2-1143-7654-fb31d171e4f3@linux.intel.com>
 <e88f42a3-7f04-25d9-5274-24a700df689f@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e88f42a3-7f04-25d9-5274-24a700df689f@amd.com>
X-ClientProxiedBy: BL1PR13CA0428.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::13) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0428.namprd13.prod.outlook.com (2603:10b6:208:2c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Wed, 20 Oct 2021 19:37:03 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mdHOY-0002lQ-A5; Wed, 20 Oct 2021 16:37:02 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c52fd0f5-33c8-479c-6e36-08d99400fdf8
X-MS-TrafficTypeDiagnostic: BL1PR12MB5303:
X-Microsoft-Antispam-PRVS: <BL1PR12MB530362D4FAC891F088B698D2C2BE9@BL1PR12MB5303.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9/AgepPbOBNXag58gUFw96/RPtRjPdldwGciId1pCYjaXAKBSeMPrjipxvE+VSac9Eh8aFQ6JjZZahQaD0KUuhFfaajaxAK84c3Kf3VDbMQRhlCq3dc4Hp0jLuYzNuMOFHGojaTJWtWcgxXlHpaOydkMr8a7ggrtLWKh/TTEkZHFfs8pWMHCfpet/g5jwdS5IG+aNmgFjDj1HHSgglUIMYJH0mtWhL9OXSpjcFYEU9/z4IlrQe4NZhfzEOeJxiGMmd1ptFKrvFrP9W4aWeBkk4WuuJxhP0p15H4bGpepCjql9DEkRhO9RgQEl1LwTuQ4jABXX0nx+zec9Of9kwDT7f1Kgr/vXPdfhVOINER4yqt3iaoMBfVaHek8m/CTaM9qtMTE9ZqizsVwbcdfxwCJQ2+2dYWLAPyYquUQLM0EmCxd2rYb/EHsR4nk4QsIMOJYhiM6guQd0Jh3pyQSF9V3IRvV/7HA1feSagneuAdPXP/nsf1jz3BNKKP8G+leL8HeHXCdxcWOaiE0Cur40RUt1M0WyO81eumLRw+ITv3019N5EpCiJ1GuR2wwpR6TiYMmjo6IR11ri/TKLbvntDArkzPSS28LszV6Uc7ZnGjhCM1Siqxa/COSQF8nc+T2ZIqfNSjZSv1MzT1BVllPWRi9OA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66574015)(508600001)(86362001)(186003)(9786002)(8936002)(8676002)(38100700002)(33656002)(5660300002)(83380400001)(2906002)(36756003)(6916009)(316002)(54906003)(2616005)(426003)(1076003)(66476007)(9746002)(66556008)(4326008)(66946007)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlNOdDNndG5kbEUyaDBmS3AzcVRWVk82TE56dExNVTg5VVZvZjZvdisrdXNi?=
 =?utf-8?B?Zy9RTUhwd3JoVVFJVHVVeTJoK2duSzlDelM4Yjd6NnhmSzdIZ01rZ05NdE5J?=
 =?utf-8?B?SG90V1dFZFJKTEhGZWdxNGRJcjJ3WGthRTQ4NHhZbWdZci9hcFBBVXhsU0or?=
 =?utf-8?B?Vm1ZS3YrZWNMNU1sWFBzSDVKOXlqTnFKUkZDMkdWY1UvR25GOElvY21QRytP?=
 =?utf-8?B?Qmo1aUJRZ0VTZXVaSzZJUi9aanhMVHE2WFkwRnd4ZDEwV1JGOWFPbGN5K2Vm?=
 =?utf-8?B?MzIrd3N5dkgxc1NNTThURndLbm5ZVGJ4TGNrbUFWeGNLaE5UMnluSDFwM1I5?=
 =?utf-8?B?NkRwUnp6RTJiSnVrSE5GdWtBajFvQm5RNStuSVlxWmthUWRLMXJHU1RHQnhw?=
 =?utf-8?B?ZzBYZUlqS1B6bzZJY1lOenRSMUtBUEc0d3NRdncvbTN6KzJVUVRuWVl5WE96?=
 =?utf-8?B?TGhJajJrTHlxQ29jZVc4Z1RHcDNRdmNZRVByOUVEZE9kVGh5ZisxaDFld0lk?=
 =?utf-8?B?SlR3TnhWTGFOc09aZllaaWpIOXc5NjZmQnZBck1jZS9kM0l2bUY3cTB1U09u?=
 =?utf-8?B?K0t2b0syODB5QTVFZ0RNMjl2Q0lOMUNkNEF6OGt2cURoQVFRRnFwNHZpTE5v?=
 =?utf-8?B?bXZkU3BYdHpTRUJSa2hrTENvTy9xQ01tdlB6d2g5ZnB3b1ZzR0JSUXhXTEhB?=
 =?utf-8?B?N2c1N0F0NTh5VVhmcG5XVmFLZEx4R2c1WDR5VldJWCs0YWlaRUdRSDZZU1k5?=
 =?utf-8?B?Z1VvYnd0cnJSZ1RuMEJVWHpPTXlrbXdPcFdlUTlkcEgyM0VHNFU4N0NtTWhC?=
 =?utf-8?B?bmV0OXQyU2FnTmMvcUsxc2NNa2xQZGhMZzJ1Rnpzais4cGUxWENxVjBFeUU3?=
 =?utf-8?B?T3FYSmxFSGd6TnZCb2Y4bEd4b0JSd3dqY0ZNakxPTjRvRllpT2FtTi9vbGwx?=
 =?utf-8?B?RVBHVGxhZGFEZ3hzSmxSK1BhcFN4UndhZnpuZXVtOVQ5azhaSkJTUGZ4YzlX?=
 =?utf-8?B?V1ZURk56bEU1UzJXWHlsbmczRzhoV29UMTBVaUQ5aElZUVRaRDhUdGRtSlp1?=
 =?utf-8?B?QXZzRUd5Szd6ZEpTdEVyc0MzNitXdGluS1piZVIxMnFXZVlEVStPd0thR1Y0?=
 =?utf-8?B?WFRzRTdRRFZ1VXlFRlBBeGdkcWZTZ0djajdjOFJNZG5aZ0VMaXFrcnkrSDZo?=
 =?utf-8?B?aDhkZ3A5KzA0RVM1SXZzNjFnbnFucHkyWDhKTytQdjhIMDBrSnl5cjBKZTZi?=
 =?utf-8?B?d3VIZHJPaks0dUFPUHdGT2p1U09rWVNxWWttYktRSDJuYXpGMVV0NXRTQ3Zv?=
 =?utf-8?B?UlpOVXk5RXM0NktxS3dyMnBKNEs5MjFBcDlBcExKaUs3RXVZVkV0elU4akhG?=
 =?utf-8?B?KzhhTXlsSDNZWmdQQzNoaTgxMFVqV0JOcE9UNHMyTnhjbHlIbFpVVmk2QVk4?=
 =?utf-8?B?SWZSY2pFQXdNUS9Ga3pONzZBcS9nZkVGNUR4ZnArTXpWRVkyTm53aDlYK3di?=
 =?utf-8?B?N0Rib0Z1b01BQk1tN2VrakY3TzhvV0NPZmU2aDNINTZJQkI5NWdPRVgxUnd6?=
 =?utf-8?B?d3MrWVRQUVJPd1hnOGJOY3JhbXhuRGVkL1AxS1UvMUhJSWtiTVZpUURBZG1l?=
 =?utf-8?B?YVMzRmhDZTF5VWtSblBoT2llTlQvQW1pZ212RVE5WE9PNVVXZlZEWDczTDl4?=
 =?utf-8?B?Q1pPY0VqSEdCa25XZkdFclZKTXo1VThVTW93emxsSndybkszODhOSUNuK3RY?=
 =?utf-8?B?WXdUa2dpVExOaDJBNVFOT1VNYjB0M21NbzFLb3Z4aFZDWFhmamhaSnJKbC80?=
 =?utf-8?B?ZU5xNlE4VGJ0NzJNbjdTQ3M4SUlvc0ZyQStzd0tCMzI3ZGhiOFNCZ3BEeDJD?=
 =?utf-8?B?SzVrbXpsNWxrRFRQY1ptZ2NaZmJJdG5hcWRVMjJSb0tUalptVDRSV0xiNy9i?=
 =?utf-8?Q?HrHj97F1jUM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c52fd0f5-33c8-479c-6e36-08d99400fdf8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 19:37:03.3414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jgg@nvidia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5303
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

On Wed, Oct 20, 2021 at 08:41:24AM +0200, Christian König wrote:

> > I think the patch subject needs updating to reflect that we're disabling
> > PUD/PMDs completely.
> > With that fixed,

Everyone is OK with this?

drm/ttm: remove ttm_bo_vm_insert_huge()

The huge page functionality in TTM does not work safely because PUD and
PMD entries do not have a special bit.

get_user_pages_fast() considers any page that passed pmd_huge() as
usable:

	if (unlikely(pmd_trans_huge(pmd) || pmd_huge(pmd) ||
		     pmd_devmap(pmd))) {

And vmf_insert_pfn_pmd_prot() unconditionally sets

	entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));

eg on x86 the page will be _PAGE_PRESENT | PAGE_PSE.

As such gup_huge_pmd() will try to deref a struct page:

	head = try_grab_compound_head(pmd_page(orig), refs, flags);

and thus crash.

So, iomem cannot be installed using vmf_insert_pfn_pud/pmd_prot().

Thomas further notices that the drivers are not expecting the struct page
to be used by anything - in particular the refcount incr above will cause
them to malfunction. This means even the struct page memory cannot be
used.

Therefore everything about this is not able to fully work correctly
considering GUP_fast. Delete it entirely. It can return someday along with
a proper PMD/PUD_SPECIAL bit in the page table itself to gate GUP_fast.

Fixes: 314b6580adc5 ("drm/ttm, drm/vmwgfx: Support huge TTM pagefaults")
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Thomas Hellström <thomas.helllstrom@linux.intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
