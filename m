Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3EDD0BE38
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 19:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B509E10E92B;
	Fri,  9 Jan 2026 18:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cnt6TTxR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011002.outbound.protection.outlook.com [52.101.52.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C70110E928;
 Fri,  9 Jan 2026 18:41:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WctNivmxJqp6crXicpFNRMVB2Mm3qyj26FUbELODYTdvz9XwswkAms+jSVyZnOx3sJ0w9+lRTwiG+5j2nlKLo9NOXMtqVFuWGcvZJv2EbvAP0Rd/IVUS6XeIPxM7pJjAGmDNMPx0f1X8jpWBnAl3ZJqYsXrH7cgX8yoyRmkP+3Dg70AsSYfbTBdr8lRzaDfPESGkwbf+IB0XIJJZFAe634yiSq1cZJQCXwnMpryl0xpZMSbRtgKZJ61BGmXV/eDtMNEnkDyJ9Fq92/F9LUodnyWRJ4oAh1JZmghZlsEUht1JSujFHbBLV43FLZl2hIWhdWxRKqvHbZF7O1b4x6+NLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kG77P1vMszYeGZSp0bwgoWNIVo4yAMnVoHPVI479Pck=;
 b=OWVEMEwjKFjOmuX03svNOEaOBU3i0kM4HJYMkK4jh38O/j+AwcCeeQ0kEbl1X7zQn2L4ULCjaYAjnqzuCBiH+fOrufcx9SxRXm7q/ElcFJrk9hSfyHpnaOZgVPG20PXz4gpQtaMqT8Q31Pr8Z61gRchcJ8T46HDGljoCsvQVMDNv4TnuB8QS8ngpLJoB2qavXA5vthyZvVWOQnAu86NsLqs+79sKLIkG+WDfNPHlYBwBiaqLda/vteiKNec/yu3cf66G53kvmXHbMRuq+iWXTyPfB3E+8tFxDmAnn+hZpyDjczGhvhxr/ERRI66uCGkmP5wSAoSPuMQKNuqpQwN4wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kG77P1vMszYeGZSp0bwgoWNIVo4yAMnVoHPVI479Pck=;
 b=Cnt6TTxR9CdkSKL4U7vUqsyNRgNoZg1zLdBuhcnFCxWn4tSMQUqcbC/6KwGzTNqtxwi+Sc8iZjvi+aL+Cefre/vkHd+sgiIP9/ER+GHiVdAGiEoCROjlFiG7N2mwpiU6WqVgVw0kI/dDz+c2RyMRkTSf4k9TUVk71WeLcqu0G4gjAhV41cz5MpnowgL9G8BoqykiUOHyKd4WsDSpSD5xSMm9FJJr8FgE2iGTfwY2iEtB0okpoC4XVLEba57rOlm494GaWe7+fdUVeQQsTRXVvtdUsvQp3hwBFy6zxKZku9xa8XFEp0Mz8KQQ/pDSJkT//tLQoU3iEM7fU/sIsfM3Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 18:41:10 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9499.002; Fri, 9 Jan 2026
 18:41:10 +0000
From: Zi Yan <ziy@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 Francois Dugast <francois.dugast@intel.com>
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>, Balbir Singh <balbirs@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 1/7] mm: Add folio_split_unref helper
Date: Fri, 09 Jan 2026 13:41:04 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <DEC8782F-CA9B-4F90-818F-FCDED4504D5E@nvidia.com>
In-Reply-To: <20260109103741.533c1b807f3ccf9a6f0264de@linux-foundation.org>
References: <20260109085605.443316-1-francois.dugast@intel.com>
 <20260109085605.443316-2-francois.dugast@intel.com>
 <59fb1669-2908-4cab-b3c0-b97479da3fb9@kernel.org>
 <20260109103741.533c1b807f3ccf9a6f0264de@linux-foundation.org>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR06CA0072.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::49) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MN2PR12MB4255:EE_
X-MS-Office365-Filtering-Correlation-Id: fc7b608f-ebbb-4e5c-4a78-08de4faea86d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nLdj0NQeqQZySzki0jyZjBXTEn7mHcx17FtWcWTYsi1t5kJELC/tBi7I70zv?=
 =?us-ascii?Q?w8oJlXMnGFCOqSluPJbnGRENLo9Bqmfx0K41hYt1p5HQ7w7ndLWuGPF10MpO?=
 =?us-ascii?Q?VwiKv65pC6CsLb5h08C5of1nMAZR6tn+zYlb8raGK16uEqwom3Kaav4GjkVc?=
 =?us-ascii?Q?NZPXVSFImwFt+QPSs4xvEom7gXsvItCyQDjPAUtPpjCm5pU8KdQje2CPqjJg?=
 =?us-ascii?Q?JSPfUlVaSlUwp/bYFoKjfYRFgdUK4ulYxDFoBKbpl38wuwZa2J+cBbWU7RCj?=
 =?us-ascii?Q?jHbjoL5HBBCXeviRUnxmElLVGZhWgh1UHyw5e327ebK85Ozf53svRypAByuZ?=
 =?us-ascii?Q?PyVm/ypoV5mnYcn9dyJyAstEsxan4SGl9Eb1TYFbhnZVK0dK206EV08a7NGi?=
 =?us-ascii?Q?3hubNN6uj93lYrUrvwQj2YjM29BvOvZZOi984S7zRAXWVAwcdjlJ91ZGQAPi?=
 =?us-ascii?Q?HPZF2K9h642UCmKStn2SEsZNjJMrfawZr2It4hhOq0Daz64mTWFLX5LRGs1Z?=
 =?us-ascii?Q?sgXqFCBDem0ue9mEjypGFRhvTjdkRiu//Srhcr8o2MYlV4OfA8IDAuDZcZL7?=
 =?us-ascii?Q?B0fJaeQVTglibmY/HEO7nytAlRvjXGQrw3TTdrq46HqueOOjAX326nxIuRfo?=
 =?us-ascii?Q?MovieRm+LLUMlgsmf7b1LHUA4/K2G/3tZ6F0tm8GYyAoT1b+rhl/0tdWqYDx?=
 =?us-ascii?Q?z360ODSO4GI30yCBXciWF2mXKLS6fh/4OkU7k1S2BYrLle+vc+ySqknTXNdv?=
 =?us-ascii?Q?WeOtw9U1r52PWIL45rxRaWBQkOLG9ay7twlQbT+SfcaU2Pk37jOzMSsSy7i0?=
 =?us-ascii?Q?9bdZRtc5yCDa5CdtD2cau+RN6gJbpTkSjLSTv5DoWaSombixmswWLNE8W3G8?=
 =?us-ascii?Q?MBFi86zALjxMCcPTg0qJlfrVs9imesXdlXChSyZQieCcUZBa65uxgwsYw/2y?=
 =?us-ascii?Q?0ZKqXrqHFanHpFgv/YGJ6K9sm+m67zPIW4Xo5zEtMOOVFqmF8V7Yd2wufA7X?=
 =?us-ascii?Q?zuztn3WPyPhfRxuxpa3vjPtZJTqupN5GkFx3GRQVQ53/iQJUaLM11db9eIA/?=
 =?us-ascii?Q?vJj0uMLvY04VM7cGkesHwBYlLzudDEbgrkYZstwgc2yFpbcSpGsvgm/bYCho?=
 =?us-ascii?Q?ZAHcNVf3/0iYIXi8MaF7RDh+N47pp3VW9CurxEWaCppuy99Ea0FlychW415q?=
 =?us-ascii?Q?dApy2+VXgF7juzY79mTz05+yvZl8GJ7IDfMTavXIvo62Qt/tPbxjjE0OEt29?=
 =?us-ascii?Q?+vPRQaN9/VfjQHDfTpZkr8fSjtVXHOlG3vsXofVymVMD8G1QDd7Z9ROPhM4T?=
 =?us-ascii?Q?uXn9Tdfy2nS36uIxArBg8WOss43ZfZ5EiSXSzbCPeR0QMnWlPynBKWesbBQj?=
 =?us-ascii?Q?xcnb3TRFC6SVrr54bKmK86vvYYKv1C2k9rwZ4HOF4slaQ1L47EL5OCt2uy2m?=
 =?us-ascii?Q?QObuXs9RuwhbWcl4ctark3skCBw+Aw1uj6mm+d23pzKUpyfS2Qc7Rg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iGmiVbX1QexAhIeyr3o+c7s1/j5h1knHxAq7Owv+xlD/9G1qT1L3ATX33+We?=
 =?us-ascii?Q?U0V8Fs7sUeWRWOwWj1CV40wrIU8417DQ815jh/4ARafDVzVL2yBpjL0IMBO0?=
 =?us-ascii?Q?vF3LNgEEyO4ksy3mpImwXNIL74onW5H2G9F0iDEw8c8ilGcNP2PUMUb46wuT?=
 =?us-ascii?Q?I/igNDchlHeoNp6MIGHSYG/zFiFyU6RHC/l9ReUHUozj7iF0xXk0AF2V8z1z?=
 =?us-ascii?Q?gHkilvDR2lK4BY0SNKEojYOOEkmPgnWelRMZt+EG/Lagmc8hzFz/IX8TJqn5?=
 =?us-ascii?Q?DlQGABm08JtV8VnlBHufFbKAHKNyg0Z7Kz1qexAXsZj5IYPgQDoZjA+BFlWK?=
 =?us-ascii?Q?sGEhKjgNjQywINlJEaNn+zbw35PkGpA5briGhu6QsvFiCBLD+rIWDEwKG21z?=
 =?us-ascii?Q?Z77EuQPPHb4Xe2NtYqvZkUQI9RpmLcucTnRsA8WmqTtGq6oPCLELGNNHnVDC?=
 =?us-ascii?Q?wLUTekZAOCtvMG4mzJfW8ot6HEt3IIXLlnvuSTltjLPd4GHUzxqjBCR0blrg?=
 =?us-ascii?Q?SAohsgENx+2GFoj1CRLgoT3FU62sRrYriAbYvLlhJAKEAXqynHJAUyN61WMC?=
 =?us-ascii?Q?MTlm5L+FdWtE+5mpUV9Vvg6h2Am0BNLLEjRPPvAwKFaZYPD1p0kysApvfPUM?=
 =?us-ascii?Q?WqwvtEby4lGpIuYJ9GDbjsuflDGUzGo7lqUPwCd5xY6UMtOxcVzKYOF8WHWT?=
 =?us-ascii?Q?PxclWP4sUQJyeGyxz8N5ACzPYyytO9Z++z+rmI5rkmzI8jhVqh+DxQ2+8nLZ?=
 =?us-ascii?Q?0TOr7xKlnD6RxLVbcwdl0R4nN0SkIbg576L2aaEoDibIJtEKMSeBw2Vg672Q?=
 =?us-ascii?Q?eHwQcLHILugCSkilFHCL+XItQwU5z+1gzrBWH2pYocb1BKzjuwrjXmYqjcon?=
 =?us-ascii?Q?SwGkWUFch4rvoIJmyctamimXzKS0jOrOdMirXa19Z9FhHLSi88Efmf77Mr7D?=
 =?us-ascii?Q?7oXzkxjJmpYIsArhv6uR+AnLUfQeDA0Z85dZSMiu9Xqj1o4x1nXzkKF25lMh?=
 =?us-ascii?Q?XcuidsD42avDb6fVZWO28SoJbSwySq3rFaIW16AvDV+mlnhg7izeis5okAzy?=
 =?us-ascii?Q?OJhdtF9je6hYPwSbX32ZOFZQZl+U1GzhKjN7ZGVE1Efq00J9OCMMIRpUHymr?=
 =?us-ascii?Q?5P9ygc3y2pVgtJGPnlPe2LKgl/He6dKoCFB2Pd0qYVk2Sqe/ZXg8s/Wh5qzB?=
 =?us-ascii?Q?f4UApYeH8N7hDl7aZkWeBnvM5Hy8r2JAUEUOMDcXn5h4/Exf5mJYNZwrLWzj?=
 =?us-ascii?Q?6OISDnRRAFkEw0EKTDIKBn5zXocVE1tTcjo2SJZDpLLCucq4aoQ/y/x8mkrl?=
 =?us-ascii?Q?hcyjwWQcBV3ZQ/FPVoO1SRpAuwcbvm+eTshYz0Ptj2B0QPL+sKCrBVj5fv1Y?=
 =?us-ascii?Q?B+6EpqSQoWr5Fwpo46iejT6kUUTPnKoaiFrvlfZKVvU5KQ7v+K7yw5Melk2q?=
 =?us-ascii?Q?nr7dpSeuCIgbhB/cAx4LJ8ivGir6cW9eKELLENpGQSUFiSXdZ6GUEnwzOWcA?=
 =?us-ascii?Q?Tv4UQuKha+PttnYlus7YES5QbfJQ7cGA1th6tP4NCKLqCFEW+EBBPcok0OJ+?=
 =?us-ascii?Q?r6s6mBl4vfZ64bhZSCeEnfxVgEOIebQTrYlSZAjRbJc0TNsbGs72rIKXjhzb?=
 =?us-ascii?Q?Shl70RLxyIFnRkcpvCR4o637xDoVKx/vOrJWGDKJ0o/rd7IHzzAodKlRkk3z?=
 =?us-ascii?Q?Txp0yOLjmRAYuSKyaZL64BNJv76jaf+J8ArFbPrUADU8k/V56WqiUpd3tw7N?=
 =?us-ascii?Q?UZP9iXLdbw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7b608f-ebbb-4e5c-4a78-08de4faea86d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:41:10.3284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pS3Xb2MQSfr2+C+LRDj6INY8ZZYkrEaNkH2oOIr9qKoF8PhY5Z+TMVCTELFk7mxh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
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

On 9 Jan 2026, at 13:37, Andrew Morton wrote:

> On Fri, 9 Jan 2026 14:19:16 +0100 "David Hildenbrand (Red Hat)" <david@=
kernel.org> wrote:
>
>> I'm not CCed on the other patches in the series or the cover letter, s=
o
>> I don't see the context.
>
> Both linux-mm and I received a random subset of this series.  Something=

> went wrong.

Apparently, the whole series[1] was sent to intel-xe and dri-devel lists
and only mm part was sent to linux-mm and related people.

Hi Francois,

Do you mind CCing linux-mm and MM people in the whole series next time?

Thanks.

[1] https://lore.kernel.org/all/20260109085605.443316-1-francois.dugast@i=
ntel.com/

Best Regards,
Yan, Zi
