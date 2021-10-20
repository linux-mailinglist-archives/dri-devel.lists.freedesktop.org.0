Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58034434D20
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 16:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E5856E2E1;
	Wed, 20 Oct 2021 14:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96906E2E1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 14:10:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DwxwiRPwAmEgCeOMZIXS7PjO7ie3hICpKGR/OPKRIgHAVSWX3xiYEo9xw8w1jr60B2dcR1xAcB9l+3JQaiOchxW9oQIFfBYVTZKNCXjspCvCF0H1ubg5vg1M5jo1PKwi1vxbzk0r/oAJ+lnF12SReyUX6WGlbI8tSf6jF9Hqgvh7H9/cdcpjaD0PouWO9YjyHyDjRKOcssqqdKs8duyA9JRpRDne7sxN9QmhLSOe4v5gSJCKZdTL/pBKBXclCL5FWilR84HT8tF2O/hpr+NoKVmR8n7xITfhKjJDuVCkDk8u9OIy7/R+Ul1w/N7YCGThjiDG3HtrGz7mKd70or6P+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4N0gUk6PzeklfmQIPL6lf2tPvD7jAAIWPWtzuG8c9o=;
 b=GbweAZFIsyqWlorBw0Y3T4mnWFVw2KY8YbsMGrTg9lpRSpvR/IsEwXeBa6fS23OteM3As9fdXfhmtKq3HP1lwS+PeddBdOYGn66yeT8D9caLD6AlM4DnwzJfIrP9KIp0TQ5eHHgwChXMlKSgtnqsXMHOTMbOiiMgbHB5hZ5C1QMR1rur4qOr4sTfiGXtkiQLSve/LqD/hVRB4dnSkRaMtXyomyr3XLbQjdvqUM5zIX4SxyxnTuuSwHGggGgby+slqA9e2iMXobvSH+rcd8jWpyPChOsKxU4lNtfjQo2ZVlz2daA2sIVGIW9QJAI/mJk+q3BM1T2YZYTTyBTG3mDClg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4N0gUk6PzeklfmQIPL6lf2tPvD7jAAIWPWtzuG8c9o=;
 b=OOlb5kaZircGvYoH3lav4Y2CLcCbis5aJax5H4nEkfwLRe+GNHvRc8cqu1NqSFjcQ/pOgdu6WXwm5TThRPEv9tmIMaGaTEpqzPbxTOmitGaW7MeLc6ycGhLwemgNLWs0qTIJwZ1falaYeWT+uN7uFib7F7Irj1exZSElKCDdiBtz8zPQLXULNtEEBQClaUTDkojp+MZL4ohnY0iAoH3/vLBzoxvb4R7ScPeif6V4DL8I3aqMH/hZ4z6gC87FBhGgFZLyAl5ec1Mqb15W+itkZAF675adXl74wovzWbJ3nu/JahlFuBbKxB/jpz4ttbdDL53zLAeD69CEsq161n6hPQ==
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none; linux.intel.com; dmarc=none action=none header.from=nvidia.com; 
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5048.namprd12.prod.outlook.com (2603:10b6:208:30a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Wed, 20 Oct
 2021 14:09:59 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4628.016; Wed, 20 Oct 2021
 14:09:59 +0000
Date: Wed, 20 Oct 2021 11:09:58 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>,
 Christian Koenig <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Dan Williams <dan.j.williams@intel.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Roland Scheidegger <sroland@vmware.com>
Subject: Re: [PATCH v2] drm/ttm: Do not put non-struct page memory into
 PUD/PMDs
Message-ID: <20211020140958.GE2744544@nvidia.com>
References: <0-v2-a44694790652+4ac-ttm_pmd_jgg@nvidia.com>
 <47182e81-39f2-1143-7654-fb31d171e4f3@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47182e81-39f2-1143-7654-fb31d171e4f3@linux.intel.com>
X-ClientProxiedBy: BL1PR13CA0220.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::15) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0220.namprd13.prod.outlook.com (2603:10b6:208:2bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.10 via Frontend
 Transport; Wed, 20 Oct 2021 14:09:59 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mdCI2-00HXBs-Cu; Wed, 20 Oct 2021 11:09:58 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a402efcd-34fc-439d-e93c-08d993d34d2b
X-MS-TrafficTypeDiagnostic: BL1PR12MB5048:
X-Microsoft-Antispam-PRVS: <BL1PR12MB50489445574C440F2D3B0231C2BE9@BL1PR12MB5048.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q8zRFrSzBypjHXKNuUIJ4Gl6fdP69nYb5IG+D87Hqqhniw7HWSNyMbOdxkcSNdy26Ocj0mAhE+Dln9EIuyfnt4eDjRSFcGA2RLhnnmtDvPbzBbYf49ua5jGIvjEWhnn0ww+UCKGHt6xVFXc8SS2GOGxI5mpMp38PT8MyhkpbX7IVyQSHfM1/YqkijUzfFiCFOfNKxNpQ71EDVVcRzWMWAKH96yVZBp8TPPeJG4NWMq/efbCVECHs5HFO9U0IaSLbbouJAqZSj0vhYa8TUpS95IiwdqMU7QTSfsNPjDJc3V0kak3LaoacCTU27PnT5myu8BjCj+UfPkM0SleiuR6DY1944jya+B5nap6GxRZiPEJvXk5QXU87O4b2aL76BG9by11QbwUOfJyZGV8ThhXSwTv5HvvN1R/7bQItdGuMLyfe4mkvVrfrT7gfRN+DxMQKgxcjs0eZiHMoWpdCmRImwtaqDk5H/5sBCpASIOV9IAJfYqK8WNanetH/2nU1j5Da0IOkC1mYEHPY2dAQaAt0A07HM/E0vKfKzLkiFLsZGR8/dJJ7CIUEglqHPw0EkEFl7PiNGGQYPAj5K+29DthdUOcNhMKSH0+mcM8fk3ecCoLi1lW1CtmqpDbVJwYeVBUVBixyb5jqjazOOTpeNb2COQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(86362001)(186003)(9786002)(8936002)(4744005)(8676002)(38100700002)(33656002)(5660300002)(2906002)(36756003)(316002)(54906003)(6916009)(426003)(2616005)(1076003)(9746002)(66476007)(4326008)(66946007)(66556008)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ulg1S1ZJZ092MGtwc043ZzZJREsxVlRkLzNjaGI1V1FKRHdRcEZjTDIwbGpm?=
 =?utf-8?B?YnRVSTV3bTFtUkhGRjExOGdpNDlRTjQwZUVzTTUyTUFQMUJOTUg5dHd5ZHZ0?=
 =?utf-8?B?aklvME9aYm9aSy82cTJpcEtDYldBOW0yczZMN3NqRjh0dFQ5eDZkOHUvejN2?=
 =?utf-8?B?V2VZVFRrUXhqb0RxdXVXQlZPVy9PNzVHZFJBaUpEeGRZTTJ1ckR3NUlLNEpQ?=
 =?utf-8?B?SFJPa0ExejhyZWFSMCtMTGVhSUttVi9ORnNWNUlMRzBuOHB4aCs2dkVjWWdX?=
 =?utf-8?B?RWMzbE1BT3dYN04xYzFzWTd0S2xmMlRFMXliaUxmWHBKcTVYalc0RndDWDJ6?=
 =?utf-8?B?UHZKVWFNeEJOeWNZQzdIMjJLU1BWb0ZzV1lkUytjMU13Ylh0UU4zb1U2OE1w?=
 =?utf-8?B?bGthMHcrQlZrT0dwV2I1NXlmVytkYmhKZDEvSmtnMXFBK01pRy9uQ2E3a1gx?=
 =?utf-8?B?L210eEVTRm8xaUwzUDRTc0pDT2plYTNkY01na2FCRGN1VHRXSVpRRXR5MGpa?=
 =?utf-8?B?S0MramJ4RGJrZXZOVEE3SVVIaWJzb0paNHExZjMvSlRJUm8zazVuY1BhbG1a?=
 =?utf-8?B?ck9Ub1VSd2U4aUljUzRlclBMZzZIRXFCN1VYZkdNaFM2VVNSOGZDVjE2QlpE?=
 =?utf-8?B?SCtTM05MbU1GZHBXTThWZVhqUnVMbzZqcDRKUXh0TE1JaHNuWFJCbTI0ZytG?=
 =?utf-8?B?TzFjdnpXUC9Ta2RvTlc2eHFDUFRMYjFNMzl5QmRvUW5UY2x0QUZERHZpdHJt?=
 =?utf-8?B?ZE5zdGtrRXRsK3p0bWR3T1pJY1FrY1BjNXlxcTdXaDhmZ0I3RHJhNnB5MHhS?=
 =?utf-8?B?ZGpIUnNsNTNpNUVSTjZGc2VhamxyaFQ4OEhySTlkRlhQNlA2NUNlYlkrKzFC?=
 =?utf-8?B?YnBUbUdYVXI5N1o3R0I4NFA0YW5HRFFKVElvanNsVE9uYXQzOHlTYVpIRStm?=
 =?utf-8?B?T3dqbmtoNUt1enB4VkJVeTIrLzBtckpkU1FkRHNhckZ5TWdKVVpoaFphUmI2?=
 =?utf-8?B?YWcwVWVYamtCNmlOTnFUdWZRYjNGNFVONnV1Z2VVbDMvMG02UHg5d1pZdVhF?=
 =?utf-8?B?VExCaHF0NnU1elliSHNKQ0xZOXc2eFFGWTBsdWJ1eGlpdm43by9uM1JXaVVP?=
 =?utf-8?B?cjZia09abXdDUEkwR2FOdGZzUzRiT0JoUk1ISGRWMUJOQkRaeVR3cnVvYlNN?=
 =?utf-8?B?WFZtZFRjVGpQa01FWHFDMWdmS2JXWnBYS0dNOGxBQUlFZlIvelZXUHB0anBG?=
 =?utf-8?B?dVB1aGYvYXU3bW0reFd5UElrN0YySWppaHR6OVhEMnZEZGZub1JmdWVQNHJ3?=
 =?utf-8?B?Y2U3NWd0K2QrNWIvZHk2TUV4VTM0TEpVZEV2OXhXUzJGTnoyeEtXSmZFVWJB?=
 =?utf-8?B?SWdwY2hIbC9iNVhTd1ZNMVZvREVZbGNpWW5IYmJqUGlmSlRiNWVrcXN6dys4?=
 =?utf-8?B?cWtFczFKY0VoMFN5WXNhM0dLYXlOVy9acUJOMXVIR255WnEycFMzRDlSemo3?=
 =?utf-8?B?RTlJRXRpc3liQWgzWStxVkhtM1pXZ0R2Ym5BN2xSMm5OWWRXQUZCZjQzc3pH?=
 =?utf-8?B?Z0dvMUlFU1YxMkFsbGhaMmcrQ21UQ2dZWVloTnRSREIwSnJTUUpWNEowS0FJ?=
 =?utf-8?B?dWxnNnlwdzV3Q3V6ZkNVUzdaOEhkaHorNHRvbTFBZzBRZmppcmpDRE83b2tz?=
 =?utf-8?B?WUdNZ25hTktjNzRIWDB4Nm9oQ1FENXVzSTZFeWlEcmpydzJsWVFja1F0VnlE?=
 =?utf-8?B?K0xCMGR3LzJmSUNGd1VCWGlqdHQwN2dDeUxlM0VKWmcyb3JVK05PZEo3VUZw?=
 =?utf-8?B?L1NLamRpQytNdEdSeElVUU1CaENCeFRBdzZFZ1p0cHZmTUJzZUthUGNheGxJ?=
 =?utf-8?B?STZHTTRNSHBrUVJKNXBNbXNjOUZ1WUpCemhjdWVNTXJBSWhjdm4rdmFZTzVz?=
 =?utf-8?Q?mfTtZ1OfktY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a402efcd-34fc-439d-e93c-08d993d34d2b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 14:09:59.4449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jgg@nvidia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5048
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

On Wed, Oct 20, 2021 at 08:34:33AM +0200, Thomas Hellström wrote:

> Follow up question: If we resurrect this in the proper way (and in that case
> only for x86_64) is there something we need to pay particular attention to
> WRT the ZONE_DEVICE refcounting fixing you mention above?

Similar to PTE it should be completely separated from ZONE_DEVICE.

Seeing the special bit set at any level should trigger all page table
walkers to never try to get a struct page.

Today some of the page table walkers are trying to do this with
vma_is_special(), all of those should end up being the Pxx_SPECIAL
test instead.

Jason
