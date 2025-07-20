Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F4CB0B847
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 23:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFECB10E057;
	Sun, 20 Jul 2025 21:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="M2AkHZ9n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2046.outbound.protection.outlook.com [40.107.96.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AB910E057;
 Sun, 20 Jul 2025 21:04:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOF6W1mykU5/AWgD4gMtp1RhWOLvbxTVILGzElnOh7kV7mvUvVTuwKci8wvarzuHxHcKIglLJziMVJ/0PvwboKqI5AvOnB8+ng8111S/yIb7UVB07C+KbtNpqUwpLA+Ur59dUj23/rOGXAYQcBlZSqc0QgDV26sZje45HBxNvJUIctZVfIBGOdf38SxFVp25lsCmpE59501EYF3KQYpVs8LseCmoa1RHvQoySts7eze3DvQ8Q45ANUDiTAspBPnuHFxlazBIclsMDVgcuJA4H6y530fXYT7QM1xcxqMQMINQivcCX7j53X04LlbnLQJh+t1igFjbz3Af3k7bx58pvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r86huXWr/+T0tGJbjUSpr+06GtjcZvEtQucS1auTzYI=;
 b=BFYPsyfGtlpLDbbLTqicgNtnezJ1rxCe/RVvT+R5AzK4rXtURpyWHgO/B7Fly2vTJQtbGiPTEGfyOcOygRCbEtk8/w/6I5gm5olANhf04/SLbV99jufXjpdQquFIfx6qGkaExRvDUDTLzrbdH8pGrG41YroU979T2iBN1j0A3oqwNhFKaFMZZfbUxuqlGSARuLxxiB6IfWDGkEHCbDeMfYtN8drkCrKY50s33cH4cNZ65ceXns/Y/NHT7bBKibdMrYqVg2E5FuGwkDxSNQhcZ6dbDb7CKd4AWaOvGgnK4MIV95DGt6q//Up+ErrOc+76HaMoZM+u6cMWkjHTJzrtQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r86huXWr/+T0tGJbjUSpr+06GtjcZvEtQucS1auTzYI=;
 b=M2AkHZ9nNingdieCfHbrtxTTRECCbuDcd7FhIiIxCLOmK/voV7tjr1Q0I0AIzQv76dFqXEla+kvknEf6iio7oCxMUgBjLPWIH5n9g6dmKgo58fxSFzqQaDY/31CaEah36tpPo7UNtWJ4/EcRFFnLz8KVKMptl6m53EZc23gLSqcBD+nEWDd2vBeRgqTmsyGWg+nWbyWzv3ER403IivTrITW+EknQtPCq+WTTt4wSTXKKpEo2hWeS6bcSNZkqZMVnpCGmPHFDBuWKyNGxi1sBfBJnpnnyD+P3omw2bwqEcFPEGb+khh6goZJGMr/a00IkYV3qVWLfsKJ802QwNXbyZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL1PR12MB5851.namprd12.prod.outlook.com (2603:10b6:208:396::13)
 by PH8PR12MB7136.namprd12.prod.outlook.com (2603:10b6:510:22b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Sun, 20 Jul
 2025 21:03:59 +0000
Received: from BL1PR12MB5851.namprd12.prod.outlook.com
 ([fe80::d4a:9ce3:c92e:e938]) by BL1PR12MB5851.namprd12.prod.outlook.com
 ([fe80::d4a:9ce3:c92e:e938%4]) with mapi id 15.20.8922.037; Sun, 20 Jul 2025
 21:03:57 +0000
Message-ID: <35ff6080-9cb8-43cf-b77a-9ef3afd2ae59@nvidia.com>
Date: Mon, 21 Jul 2025 00:03:51 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] *** GPU Direct RDMA (P2P DMA) for Device Private
 Pages ***
To: Leon Romanovsky <leon@kernel.org>
Cc: =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Michael Guralnik <michaelgur@nvidia.com>, Or Har-Toov <ohartoov@nvidia.com>,
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250718115112.3881129-1-ymaman@nvidia.com>
 <20250720103003.GH402218@unreal>
Content-Language: en-US
From: Yonatan Maman <ymaman@nvidia.com>
In-Reply-To: <20250720103003.GH402218@unreal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0030.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::16) To BL1PR12MB5851.namprd12.prod.outlook.com
 (2603:10b6:208:396::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5851:EE_|PH8PR12MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: e9bb4e34-c1c4-4097-5c17-08ddc7d0f190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHpBdCtEeTdRZTBESjQxSzhpeVlYNUFOWStTTktBWEk5TGVZQmRENnBKTXZZ?=
 =?utf-8?B?TmpCOW1udUtzSHNSUEF5dk9JQVk1ZklMZEVnNU8vVlNvMk5LMjUreGk3bWxk?=
 =?utf-8?B?cW0wY0k1bmZsM0c5cVdKQWQxZ2tWNTlMcDFwTHRJSmJMZUswTlBaMWR1ZWwy?=
 =?utf-8?B?c1lCL20xOTd2WlBWdFd0cTkzSXp0eEthYXJZWkdHSFFNaDlpVDc0Zkt3QW5m?=
 =?utf-8?B?U2EyMHoyejg5ZEdtazVaby9mbzhwZEEyWDFJMmZCeDJtUWhjdldVMEdLYXdB?=
 =?utf-8?B?RmF4Sy9XSHNWZUtiTFgxNFBaUzZ4K3FueEhmcnc2SzdVdXUxQk1FRHU4VjNi?=
 =?utf-8?B?OTZiYWJCdGhZNTRDOVlnbng1TXhIUDVldXRvVWtjZC9yUXd5QzhnSGliZkZP?=
 =?utf-8?B?aFlwbkNnNG9jS2xNR0wyamFTZHl6M0VBSGtoYjNSMFhRb2JrRHJIZ0Q4NkpZ?=
 =?utf-8?B?UzU5cUd4bVkrK2pJOXd0L0pTUnZpMUxsWVU2cFJqZDBuRHo4bGpmdGdKaXZ2?=
 =?utf-8?B?UVQ0SUlPVy82VUlwblNHSmNqVkQvby9zdEZOc1pWNTk1N3czTW5paVh5R2Vw?=
 =?utf-8?B?NUdzMk9icmZqVDJjUmJhdGltc1hBUXFTbkE0bmZ0SFdjNGNqTHRMQUora1lH?=
 =?utf-8?B?TDc4NEVQRVh2aHNMM3pDYWV5QzZscnQ4QnVUYlFmYVcrQ0EvK0haQitXM1J4?=
 =?utf-8?B?WDRPei9HNTJOckoxWllBVlY2SEY0VCtyV0ZsU0ZaZ0ZDUG12OWx5eG1nUUZD?=
 =?utf-8?B?U2pFdSswZVM4V1VOTUtwQ25SNWREQ0hhM3Mrd2RSMXZteUZTaitYQjBLK3pM?=
 =?utf-8?B?WFY2bEE3VWEwWWttWklaY2FzU2Vkc2d5VkFYZnQ3UTZCeWtRL2NXVzBCSlQz?=
 =?utf-8?B?Z2llZzVoZHBMb3dteDl6QTRLMGFiSUpiVjBhcmQyMkRCb1RRcTdKN29Yc3c5?=
 =?utf-8?B?RG42UTVBdVp5dE8rUmwycWNVUk5xZDMzQ3lybU91NmV3U094TGZ0MUYydWNT?=
 =?utf-8?B?NXBKL1lVZ0JTNTMzbjcreXRhMWJiTDY2K2FRQXBVZ2tTRWpNdDZTS05Fdms1?=
 =?utf-8?B?S3VCQk1Wd1BFbUV3c3d2VUZVK0RtS3BKay9IQ3RKQXQzcGczL1ROOHR3N29t?=
 =?utf-8?B?eVJmNjViemJNS3ZZN200RHJWS2lBeUp6R0Q0NG9CRkRab1JqdXVab3lidWFw?=
 =?utf-8?B?UWZlTHNwOGJJd3ZKa2RiYk5USUhlRTY4SmNyeUR2Y1lWNXpqNU5pbDdTbzR6?=
 =?utf-8?B?MUlaclpPdTd5VWIwMjJ0NmJQbzIyQm0zUmQ4RERsYzkwaWtlK0ppTnozdU9i?=
 =?utf-8?B?NElGeDVTb1pMMUMreFQxSlp6alNreW9uZnZhbGJNSUZrbWQ1aGpmQ1h1OEQy?=
 =?utf-8?B?MDhqRGFhWWZCV3Vvc3RJQ3IxR2RPeEJsSHRHaUU4SmRDT3lLMG5rM3Y2dkpH?=
 =?utf-8?B?R2VCMWVwT0JJM0RFK2xjTGdTRUQxMGgyYkYvT1JaQlhlOGxBYkFOL2V1YU13?=
 =?utf-8?B?bWRWaE5pS2VCelQvUjYrcGFFNXpuRnNWVXRkUzQvbkJaQ0hoZFlMdVVHTDU4?=
 =?utf-8?B?MEE2MVorUHg1QjQxZFkwMjdBYURYQVA4ZFhxQmwvMEFKK0hucjRHZWZOR3d4?=
 =?utf-8?B?RlRyRWNkZDcwT3VOOUwyTFpaK3p4eHF5YWV6Mno0OWpwOFZYblFtQjMvUGhP?=
 =?utf-8?B?di95a01Dcjd0TnJXRk1vWGllS1RBT0Z2djkxcmsyNXB4d2dHcE56QjA0QTJa?=
 =?utf-8?B?T1p6UzR0YlpGMGxhQVpUTHFqN2xqbVRaZGRaTzZMSG8wZHNmTzRMVU1uSHg2?=
 =?utf-8?B?czJJbTJUdncwak0xMXlwcXNjL3NUcFBWU1QxVXI1SVdYNmlrVTBxa1lzVnJ3?=
 =?utf-8?B?SGl0cHdYMGZZaFRoa1JVOU5lZjhrWmRpOUJoR0o2b3crV2NoZW92eXFobUZV?=
 =?utf-8?Q?dCtssmufkwM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5851.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFZXZXRHVGYzdmdLSnpZdDhjVTk5eXlFSU5MWHFsWHdxUFlDbnFMU1lEcVd1?=
 =?utf-8?B?UTdIVkVSWUZpUStucnpZZGN3VUVTa3F2SWlQSjRGQzFscXpNbzM2dmw5Sndt?=
 =?utf-8?B?eHFKbE12YnhEMmVVUm5yRzE5YkMzWXBPVWhaMVdER2xiN1p2ZFdDZkw2SzJM?=
 =?utf-8?B?MXh3MGZ6M3dNc0VvRzA4SkRmRTh5dTFWb1FlemFjTGUyVW1mVWNPaXduQ1FR?=
 =?utf-8?B?VUJmeGxSMFluMGthY2RJaHphM1FYT1pZK3ZvcWc4c3E1Yk1xZjRMQ3pYME1D?=
 =?utf-8?B?Ukh0TGRvc2tWdmtJMWRFaytSUHZXWjM0aXBISFA4YnQ2eTM4NWFWTnRsZEhv?=
 =?utf-8?B?U3l0akVyeTF6WjliV1ozMVVLbFJlMGdxQjBhbUdhZDMyYTVwQ0lZMEZUMUF5?=
 =?utf-8?B?QzJVTzYxUUlpTU9RcHB2Qk5lYlJzcEs3NkpDc1RLUFhlUHhvTzZxajNMOU9i?=
 =?utf-8?B?SDZUeVNxekJxbG1zMFdnOGRvSWVnQXk1U1ZGWmlPWXk3TVc1MkUyZ29wT1Rs?=
 =?utf-8?B?TEtReUJCNUp3ejNtdFJHb0VSdGlsc2E0Qk1GNW92cVlOTzRFbHFkS1NsUGZk?=
 =?utf-8?B?UFQxSzk5Uy8wOU54WUo4TDNYVnV3MzA1bUZiZVJyTmtVU0Roamw3dDlHUmdV?=
 =?utf-8?B?aWd2SVpnQmJxWjBRQkxBekljQ0JnMkp3ZFJnVTQ1ak16QjlENWcvUG8zUlhB?=
 =?utf-8?B?R21nRkRLT0YzSlo2QmJlVXdhZVdRMVNIK2xKeXd4U042WGQ0WThyUUxQbkE2?=
 =?utf-8?B?ZmtBNW1yU2wrdmhsSU5aVUtJbnY1cGx2QlRnY1RiM1FrL1JEUEUrelZnUStU?=
 =?utf-8?B?YTNyOHI2KzJ2bDZtSXBWeHA3K1lvK1g0OE5sZ3VrUmptM0h6dGNxR1VLY09x?=
 =?utf-8?B?RXBYUXc2VEtsR2pmam01emR4SXJhZ1g3a0h5S0dWL1RvMUFGczBpTU9RNUsr?=
 =?utf-8?B?R2NRZzRMY2gwLzhLcVRPcHA3eHVwY0pTalROSTRRNXB6V0Q3NldkWHI5VHhJ?=
 =?utf-8?B?cms2c2pVdVJPbktteXdWNm9qSnlia3dQdHJjRXZ3c3I0YlhldlVUSjhaZnBi?=
 =?utf-8?B?elFINUIwdzllb2gxRG16N2FzMk5VNjRiclNvTG1VYUlhVHprQWhsTHFHWFhR?=
 =?utf-8?B?Q2FZaDZmTTFyRFplYnYvTGFySUpQYmdKTExWVVl3MitqMGxReFl4dmsxOGpw?=
 =?utf-8?B?d3RwODlqRXhudmY2dW9wTUU3ZWNoTzhoZ0FraXEwVGNhM1lsY1hENTJ6cHg0?=
 =?utf-8?B?YkFUOURRdGZ3OVNzYmY4L01nTllsdnNRRnBTZ3M2eVJXUVg4WXhoZ3VZL1J5?=
 =?utf-8?B?RGduLzVSaWpBTW5FckVacTdqZ3o3UHVKRWd3YWtySytxVXJPUCtvQXNheThW?=
 =?utf-8?B?QlorU0wwUnJHRmNncEFMdnVQbHNJdWxBazY3NnhjL3FXNEtORU9RMkJhbUNI?=
 =?utf-8?B?TklkWDQ0M0h6dHJpUGhzcXpHay80UDBvbElqaWZrbm1GZnBVeloxcWI0R1RR?=
 =?utf-8?B?Ym5vYTFpUnhDWTRQdmpXeTlxZHF2dHc4di9UaWFBL09BdWpLYXh6WEtvN3Jt?=
 =?utf-8?B?T082ckc1R1ZDQWJlMXQ3NDc1ZVlUTDJkR09aY1NGcWIvSVM3eXRBMU9RdEJp?=
 =?utf-8?B?Qzg5b2t2MEt6anYwUmUwUjhZM3JsQzlIdnN2aXhBVmVVaXdId3ZSVVE3cVI3?=
 =?utf-8?B?TEZaLzBIMkdJWjduZ3BWMzVGQWVsRVhOODg2UmgyTEtPb3VyRlZnYXJTK0NO?=
 =?utf-8?B?SFMvZFhRNGhUQUhLUTNIN1pkS0NrWi9zeE9qVU9DSHJGSVBuUUU2T2QrS2ln?=
 =?utf-8?B?cFNESFZpdk1XWWRrY1YvRDByNDhvd2xpK2U5TUF1bzNxU3lkTmczRnNGRzdK?=
 =?utf-8?B?emp6WkR1R2Jtayt5ajNkcXd6aGhrSWlreTA4V3BlenJzRjU3aVI1RVgrV1Vl?=
 =?utf-8?B?ZUhUVHJ3TEFML0ZKaWc0UW5DVmNXMFpQTUNLMGY1TlMwbHJta1hWSVVaaC9m?=
 =?utf-8?B?bWc5TVBValZsRTRKR0VTcUQyMkF3RFVpakZPN25jbHc3d21UTkVtakpFL1Vu?=
 =?utf-8?B?aXBFSU9HUUdXWGZ4WkR3aXVIMDhxK1E5THhmbytzMUlOeTVWejI4UTdBOG1P?=
 =?utf-8?B?M2duWlpWVUJ3U1M2T2FmaU9CVmpUMjBUNHlXL0FQbFkxNmJZTjB5aW9vVEhV?=
 =?utf-8?Q?YClcGJcdZRY4Oj+ycC8H75MRQz0VJOmAonPuuHSDZdMD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9bb4e34-c1c4-4097-5c17-08ddc7d0f190
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5851.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2025 21:03:57.8758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4bNIUVAWR6nEFgCbO7vgmzjcM5pgJDAQNQ59+wl+C3nl7Zchnb2JzcoublqPHxQgdM/izMdc/+tJVrLSLAPmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7136
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



On 20/07/2025 13:30, Leon Romanovsky wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Fri, Jul 18, 2025 at 02:51:07PM +0300, Yonatan Maman wrote:
>> From: Yonatan Maman <Ymaman@Nvidia.com>
>>
>> This patch series aims to enable Peer-to-Peer (P2P) DMA access in
>> GPU-centric applications that utilize RDMA and private device pages. This
>> enhancement reduces data transfer overhead by allowing the GPU to directly
>> expose device private page data to devices such as NICs, eliminating the
>> need to traverse system RAM, which is the native method for exposing
>> device private page data.
>>
>> To fully support Peer-to-Peer for device private pages, the following
>> changes are proposed:
>>
>> `Memory Management (MM)`
>>   * Leverage struct pagemap_ops to support P2P page operations: This
>> modification ensures that the GPU can directly map device private pages
>> for P2P DMA.
>>   * Utilize hmm_range_fault to support P2P connections for device private
>> pages (instead of Page fault)
>>
>> `IB Drivers`
>> Add TRY_P2P_REQ flag for the hmm_range_fault call: This flag indicates the
>> need for P2P mapping, enabling IB drivers to efficiently handle P2P DMA
>> requests.
>>
>> `Nouveau driver`
>> Add support for the Nouveau p2p_page callback function: This update
>> integrates P2P DMA support into the Nouveau driver, allowing it to handle
>> P2P page operations seamlessly.
>>
>> `MLX5 Driver`
>> Utilize NIC Address Translation Service (ATS) for ODP memory, to optimize
>> DMA P2P for private device pages. Also, when P2P DMA mapping fails due to
>> inaccessible bridges, the system falls back to standard DMA, which uses host
>> memory, for the affected PFNs
> 
> I'm probably missing something very important, but why can't you always
> perform p2p if two devices support it? It is strange that IB and not HMM
> has a fallback mode.
> 
> Thanks
>

P2P mapping can fail even when both devices support it, due to PCIe 
bridge limitations or IOMMU restrictions that block direct P2P access. 
The fallback is in IB rather than HMM because HMM only manages memory 
pages - it doesn't do DMA mapping. The IB driver does the actual DMA 
operations, so it knows when P2P mapping fails and can fall back to 
copying through system memory.
In fact, hmm_range_fault doesn't have information about the destination 
device that will perform the DMA mapping.
>>
>> Previous version:
>> https://lore.kernel.org/linux-mm/20241201103659.420677-1-ymaman@nvidia.com/
>> https://lore.kernel.org/linux-mm/20241015152348.3055360-1-ymaman@nvidia.com/
>>
>> Yonatan Maman (5):
>>    mm/hmm: HMM API to enable P2P DMA for device private pages
>>    nouveau/dmem: HMM P2P DMA for private dev pages
>>    IB/core: P2P DMA for device private pages
>>    RDMA/mlx5: Enable P2P DMA with fallback mechanism
>>    RDMA/mlx5: Enabling ATS for ODP memory
>>
>>   drivers/gpu/drm/nouveau/nouveau_dmem.c | 110 +++++++++++++++++++++++++
>>   drivers/infiniband/core/umem_odp.c     |   4 +
>>   drivers/infiniband/hw/mlx5/mlx5_ib.h   |   6 +-
>>   drivers/infiniband/hw/mlx5/odp.c       |  24 +++++-
>>   include/linux/hmm.h                    |   3 +-
>>   include/linux/memremap.h               |   8 ++
>>   mm/hmm.c                               |  57 ++++++++++---
>>   7 files changed, 195 insertions(+), 17 deletions(-)
>>
>> --
>> 2.34.1
>>


