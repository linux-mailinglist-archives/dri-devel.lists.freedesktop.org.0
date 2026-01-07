Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DFDD00442
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 23:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD31510E1BF;
	Wed,  7 Jan 2026 22:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="m5nZ2WiH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012011.outbound.protection.outlook.com
 [40.107.200.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD8010E1BF;
 Wed,  7 Jan 2026 22:03:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVHoqpAqOH3B3d2pzVLaRTUId/ZTGtdloqZwVK/S37g/3jhOJL8IuX6n/GGM1MwmwCgpig6Vw8MOIgI55cMXDTH+w/Wg6kI2pQCEmyi88qnosrXxlydreCc0kKfmj6soI7qD7i61taSAOLp9MP8H2VnURWyMAGRFp4FzCz6MZckis59V0PQh2g8LRc1WApdCFKJPloHMATmPv01IeRDkJfxVBQs3ytntuucYk1MTVK1adruxoU59kpql/n1P39LDg+SaSL6U4WqSETq0J6KWc5bP+eWcCR3vUdki8b1/B4p3xBLpCbW2Wa/1HBjhNt6zhYM0TY08XADvWcIDNIahhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Z8IOAJzIPPHuKqLdqJLRlTf7+E7hiWx0PCUaVT4Rg0=;
 b=Ac7ZigVlCJUxcANqdFr3FMt4EIpJ16QPS2SC8mzhH0CFoXvP+oq/ywPKhSa6/3d++4rQx2jHAtyiuCDN8rvJLzWT5H4xt8bA4thNZZIc4fq2oZFbOyLjVyQloFSjsdG1x6w9sFhZZ1Qavbl7lm1488k2Vic/32giXSUlKAtohHbnZBNloigtUW4EPTFGaH2DYBFN9rRd/7QTMWQnthXmXxICn8RFTdcCVKuXdlvW5iuyKLxeILjU7yUBy2nc/509iN/muXzHcn0Lo+J3rpyz411aUfIfpW39GEq9dUzk7Ifh0mCuwWpJxABJd13V7ZY+7iZGPsvA+mAvUV9qjWNPgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Z8IOAJzIPPHuKqLdqJLRlTf7+E7hiWx0PCUaVT4Rg0=;
 b=m5nZ2WiHTut8CNpSa2NGtR4H622q/J9jg4y00iGSZCtnmFEV/PLmCGrdrRrOK9uFLfbod29UeWkwO11s3I7YzMZs3D4OPnuDGVvdVZ9y1ivKidyAC7ttggYOegEsPUyF9McYYD6dcgPw0UPBUk1c6bw/RgMOzDbs2wD//aARBoMNfz5YUajs+UxtqsfS+bimsbOEjlvsEOPCZEj524wsWL8xJoM79Pfjga2lAOwEz1so8waSIgH2LMyrDizgMeUgywuan0YuVYIjapNIf6mKaYvuY/Q/3x60ZgxCNl2k2GO2J33MjfCa5gi0mtTmnrfWxRw+4SwZEDc9t9K25uT5Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB9222.namprd12.prod.outlook.com (2603:10b6:510:2ef::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.2; Wed, 7 Jan 2026 22:03:33 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 22:03:33 +0000
From: Zi Yan <ziy@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>,
 Balbir Singh <balbirs@nvidia.com>, Alistair Popple <apopple@nvidia.com>
Cc: Francois Dugast <francois.dugast@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 1/4] mm/migrate: Add migrate_device_split_page
Date: Wed, 07 Jan 2026 17:03:28 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <541B31AD-1472-4D32-A968-B92895CC6890@nvidia.com>
In-Reply-To: <aV7NBE3NS1wdsXBo@lstrano-desk.jf.intel.com>
References: <20251216201206.1660899-1-francois.dugast@intel.com>
 <20251216201206.1660899-2-francois.dugast@intel.com>
 <F4EAA470-C922-4066-A115-13D6D055C73A@nvidia.com>
 <95BD5D5B-C8EB-4EFA-A895-CFD660504485@nvidia.com>
 <aV7NBE3NS1wdsXBo@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR13CA0092.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::7) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB9222:EE_
X-MS-Office365-Filtering-Correlation-Id: b2650459-0233-4253-d666-08de4e38994a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVA4NlpOYlpZYmxHQ2RWQWxKYjM4WS9CQ1kyd1lKZklrR2FOOUx4MHpYQTlZ?=
 =?utf-8?B?ei9OYXRnNEppQ01QRFZDTllvYnVEN3lRbjJiSzJSSHgvRU9PU2RHVGVSYys3?=
 =?utf-8?B?b0lMeURUaTYrRFo2Wmt5OFR2NE9pb3FBUmtpWnFxeVljQ0RHMytDd2I3MHYv?=
 =?utf-8?B?VlBJVml5ZFovWEN1TTNxVUJsRTVNbDVlcyt0eDRMZmxUMnRIbENXWkJmV3cw?=
 =?utf-8?B?QUVWMDZlQlFnWnVzSFdzcjE2bEk1VGpVY09oVDVIUnRwQ2N6QWZhdG1hamVY?=
 =?utf-8?B?R3JleTlEUXNtSkdvVy92Ui90ek5nQXhZc2ZKeWNjV3U1NWlmbjhERWV0K1M3?=
 =?utf-8?B?aHM0M2p2L0ozQVFUaGpYdkVmdHZEOVd6OVFBNGNYY0FIdW5yVE1FcjRwQTh3?=
 =?utf-8?B?MjVLaGVWTUY5TGFabEZwTVRJMkhtUWVxajlDcmhqaTR3NDdIMzNLNGxyTjIr?=
 =?utf-8?B?L1FYam0rZlNhcTdlU1ZkRm1DNTIxcmZ1cEorVkRoWWdhKzJETDBzeXNTMTY1?=
 =?utf-8?B?cGw2d04yODRoU2xTL2V3UVJhdlpGOVEzVUJBeDRJc2I1YTh4aXlXczVLZmZJ?=
 =?utf-8?B?MnBkY2VtaXl6UDJGTFJHQ2tDblNsaXE1a3Y1dTJIMW5YSHdGTk14Wnc3aWJ3?=
 =?utf-8?B?dlQySnUvQzFteVdXb0IvV0FBZm5aWlkxYVJNZnpudnRuRjFLVHBxT3orQU5i?=
 =?utf-8?B?MHJUcTJCb0h5eUZyclFpb3JVaGlkUVRrYTUxaFI2ZmJ3RS8zMFUwUkxSREJH?=
 =?utf-8?B?L2pKWmRKdm11cGZ3QXFIdTF6VFYzZklvc2R2Um03VFVTSXpFTGF2bkpVTFRW?=
 =?utf-8?B?UWdsbm04cUpLdWxvVEZZV3BscGRKeXNYUHhxQ1I0aDllRzVDYTlEYkpWQ3ZB?=
 =?utf-8?B?aGtWTGN2WGE1bm03b1J2NHNiQUNFYStIbkE5T0hpc1puQnZWeWRJcWNTbjVK?=
 =?utf-8?B?bWdBSW8yaFEwQlVLcW5pZHdjcXliVmkvbkRuSnI2UkJ6TFFhcGZ2dFFocksw?=
 =?utf-8?B?ZGM0Z0hUOHVHTFErNEV0TkN6WU45RElzUFNRWmluSUZTekpsRVNmWE5vZWpO?=
 =?utf-8?B?Y1oxclBlS21iR1lmd2tKdUo1TmsvaUFNTlNyRVl4eEJHWlBjNGNZbFhxb0t5?=
 =?utf-8?B?L2JqVWRmVlhmWk9pWm5KdkM4d1JaNDJTUFJSbjVYZDFyMWpmd0xwcW8vYkdv?=
 =?utf-8?B?ajZqc2RpazB2cWdiRktWRVlJMy9wYTEzQys3S1BhWHNYM1VYRU9RN2ttNHNa?=
 =?utf-8?B?MlFURXBXbE94MEZIUFp0NGNuSFRocWw0c3J1Z1ZtV01vakQ0cnpoUG5vMmEr?=
 =?utf-8?B?NTd1NWlpN3lobjMwbmF0K3hjZnZweHl2TWVBU3RZY2VGN2dHb0ZFbzNhYWt0?=
 =?utf-8?B?QlV5aElLVlZTMTFJVjRtTXQwNXhZa2p2Rkx6eFhYYjUvMXh6d3Y4Um5VTFcz?=
 =?utf-8?B?TmNCemNTQWpzaGlTMm1oVFJwVTNQbWtGZjQrMUhvQjh4MTcrbzBaY253NXkx?=
 =?utf-8?B?NDJPYnE5VHNEbmowOUdTSDlmNFhUTGpMVWdGd1RRZ2hibUdGM1J4ekVlREk1?=
 =?utf-8?B?R3d2SHI0WVBOQm9mNmhuWnBVWUk2WkdTSHpTeW4wRmdYbitEWmxzbkRseGxO?=
 =?utf-8?B?a05NNGw2S25UZ2JpMXVtMmtIRW5sVWIweWJZb053NDRNUTl2M1JJTnlic3Bt?=
 =?utf-8?B?RERWVHpiU1JWdDQwbE4vcTZWZC9UdlkwOXBsc0xEYjZTNnBLSWU3VFc2MzhP?=
 =?utf-8?B?d01xZENWcmNEMmpINTRyZDBnVTdBa1UwWVdmTmtoSFZzWDdoVFBzeGo5ZDlr?=
 =?utf-8?B?aklYcEJnSDVwbk9kME5vZjR1c1FYVlRNTHZyRGd6WjRXTmt1ai9ONVNiTFEx?=
 =?utf-8?B?VmRSc3daTW82c3pzQ0YwUzBud2Y4eW9ZdjJGRGtwRkJMNU9aZVphRGdmNHVw?=
 =?utf-8?Q?w7L8zqIRe3/sTTaLXzxoafRnNsPoO2hJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Skc5amptYlhFZTh2Mzh1S0diQWp1VTVTbFcwY3JIMkUwNzI0bm8ybDZ4V2F4?=
 =?utf-8?B?SWg3NEtjK1lXYm85ekRYMDRPRWd4ekNQUXRmOFA5aXZ1ZmY1R3FqcEIwOG5W?=
 =?utf-8?B?R0JTUGt2MzN0SFI2cUVWekxqbUdKZXE1VXI4dnZkRTlrYmdrRHRNTFZ0U0ho?=
 =?utf-8?B?T29McW45Z1F3VTh4NUNmYWttZnNjZkpZaURLTkg4L25sbXY5MVluRGgrN1lC?=
 =?utf-8?B?K0QyUmczT3JOdDJCdzFBb1JQTEQzWjVGcGI5eFZ3S0kvYjZOM2VXdDFSd3hp?=
 =?utf-8?B?OFFmQ0NkN0Z0ZlVOTXFyUElDWjVmMjI3d094by9MTHcwaERXcCtacTFIVGlY?=
 =?utf-8?B?MWxYU1FOc2JGTGRzZnNQcHVzUDhyVGRzY2ZySVIwOHpGemFNZDMzcXduVzIw?=
 =?utf-8?B?aGtmbEJwd0c0aFRBaFJKOXB6dnJxMHZjN1RNWTV6eGZTWGJvWHk0R3pycFFi?=
 =?utf-8?B?S01jcTBWbjJqS1BoM2wzbFVleHFWMEtnazNpRG9BU0t6Y0NQeDgrOEU0QlJD?=
 =?utf-8?B?d013VzVSY2FmUGp4SWhLR3dKQ1lZZXNTaDVWeklxUFVxM1FQRDNpOWd1cEVm?=
 =?utf-8?B?Z2I4UXM0Q0xlQUcrMW5SMzBlWTIvclZWRWQ0R0VDcTh6dW9iT1c0dnpEM3pI?=
 =?utf-8?B?Sy9RUUZ5Mjd0TXdxckkvcjFGTWhQWW5PNU01dUQ1am9Cb1Nma1Y5ZWpLcS9a?=
 =?utf-8?B?Tk40ZVlkL3o3cmdLM09Kc3laRnh1d3lnYmxtMUU5YjVLbTNnREU5eXh5V2xS?=
 =?utf-8?B?RE16bndhcUJNMnZVMWV0T2ZtZTdhdkUxbEtNRHFXWERGT3ZXak5IV2hHK3RK?=
 =?utf-8?B?THMza0NpT004OUg2TGJYTXltTXl4UWpiUGRVMS9VTkxwRkpCUjZwcWNLU0Fw?=
 =?utf-8?B?eDIyN01ld2Zia0pISVhHY2x1RktZWDNhZnBzYkY0alVVejA1Q0FoVXZkSGNn?=
 =?utf-8?B?N0JNSjJKOWVWUENjbXd2bUMvcExrWUtUakFiWUpTWnVNekpxSVlzTjZTMFNm?=
 =?utf-8?B?SFp2cW1ib0hnVVl6MUdVSWRWTTR0aVdTRnJnb3pYWFRES29HZ0phTGErTkNL?=
 =?utf-8?B?ZHd2U2N4cmNveFNBSndHcDJpelptNG16T3lzK1JncG01aEtSaFdXNVUreFpE?=
 =?utf-8?B?MUgvdXhINWVEdk1YYXd1Y0VRNXFQb0FUeWhKc2ZncGVyOUkxOEExbVdEYW5Z?=
 =?utf-8?B?VmVCNHJya3l2Q2hjbFRZK2p2YUpjKzhGUk5OdUVWZVd1TUhRSzl6U3R2RGhn?=
 =?utf-8?B?djZyaENsTThhM0J4d2sxVWgreWwzTHZYditGZEpiT0JuUVdPOUdyU0g2Z3Fa?=
 =?utf-8?B?Y2VieGlraWxqWEMzN0hVdlJNSjl3d1g4SVFRZ0k5L3B1Umo1U0wvMVRJdWdJ?=
 =?utf-8?B?VWJKazF5K2ozdzJyUm1vK01nODk3eWtSN1MvNHp3RG5DQ3JjS1lmQ0NQaStw?=
 =?utf-8?B?RlBTbUtCd3lwU3NaTHo3N3JFSW1vNGtLbS9YR3dObDVHa0ptYU1pMnF3cElt?=
 =?utf-8?B?anFJeUtHOHYvZjR3ZHJOTU5OMklhY2tnZnptYUZqNVlTNjMwam5ERWZjaTQr?=
 =?utf-8?B?eWFxZGk4YVQrK25iMFhSbzlzcU1OemNjTkhyS3A2M080WWlXZmpzYnNGVlVV?=
 =?utf-8?B?MnpROXNneGtLcVNlMzY3WXZIWUkrdlp3bzlEOUUwdEJJZGtia0VRZzJXNGtG?=
 =?utf-8?B?a3JGZTBMNXpUMk03VTlzUmxKNnpwbkdwQkNUV3VoYTFuM1lpV1BXdU5oQ25P?=
 =?utf-8?B?ZGZOTHlrNWJ1NmdXRDBVL0xEb0xQbisyLzIyam1jWTBMaUhJWVA4RjhNWnZS?=
 =?utf-8?B?RzVZRHI5YU1JT2w3eElodGRaamhiakE3eTR2ekZWdEhrREY5clFsTlFwZDFK?=
 =?utf-8?B?WVVNTE1WYitwenNmNjlEWjVXWUtEUDU2dHNySERuRk5vZ01QVlBWVnUvZ2hw?=
 =?utf-8?B?eVZjZExBbGZ6NC9DNnJ3enhMazMwWnEvRG14b2MvL1Y4Zyt2RzJqUVZwUVJm?=
 =?utf-8?B?U0M1R2dKWGNmeStUSDhnTkszTkhHc0pxOVkvb3dvS09Ucjh2S01FUWtWcndH?=
 =?utf-8?B?WFRuT0pPc3FzNmtFaSsyckpVcnBMNm4vQlBjQm9McEFGcUd2elAyc283QVNG?=
 =?utf-8?B?dncyQ3VzRkxGbEQzR2MxSmRrR2oxbXQyWGZVbU1IbGRndjJPWUI4K0QvWHBj?=
 =?utf-8?B?ZU11Y2dqVjI2ZjAvWkRCcFdvWllLelVSRm9WWjFLby9wTjhEbG16NkVmR3VJ?=
 =?utf-8?B?czhxQ3lIWDZTdWtjTzhBbWNsRUpuM3JBN25UQWZNbjJaU2lrRU9mSGVCSHdo?=
 =?utf-8?B?NmlPK1NJdDlNNk1jckZaWTVCdXh4c1NWeTcyM0dvbzFGVzJmT040QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2650459-0233-4253-d666-08de4e38994a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 22:03:33.1267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nooNT8RuqP/HFfMO1C3QCiPLorNerlACWzDbW4s8mg3k+wsHv03ZJtakki4wooAz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9222
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

On 7 Jan 2026, at 16:15, Matthew Brost wrote:

> On Wed, Jan 07, 2026 at 03:38:35PM -0500, Zi Yan wrote:
>> On 7 Jan 2026, at 15:20, Zi Yan wrote:
>>
>>> +THP folks
>>
>> +willy, since he commented in another thread.
>>
>>>
>>> On 16 Dec 2025, at 15:10, Francois Dugast wrote:
>>>
>>>> From: Matthew Brost <matthew.brost@intel.com>
>>>>
>>>> Introduce migrate_device_split_page() to split a device page into
>>>> lower-order pages. Used when a folio allocated as higher-order is free=
d
>>>> and later reallocated at a smaller order by the driver memory manager.
>>>>
>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>> Cc: Balbir Singh <balbirs@nvidia.com>
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Cc: linux-mm@kvack.org
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>>> ---
>>>>  include/linux/huge_mm.h |  3 +++
>>>>  include/linux/migrate.h |  1 +
>>>>  mm/huge_memory.c        |  6 ++---
>>>>  mm/migrate_device.c     | 49 ++++++++++++++++++++++++++++++++++++++++=
+
>>>>  4 files changed, 56 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>>>> index a4d9f964dfde..6ad8f359bc0d 100644
>>>> --- a/include/linux/huge_mm.h
>>>> +++ b/include/linux/huge_mm.h
>>>> @@ -374,6 +374,9 @@ int __split_huge_page_to_list_to_order(struct page=
 *page, struct list_head *list
>>>>  int folio_split_unmapped(struct folio *folio, unsigned int new_order)=
;
>>>>  unsigned int min_order_for_split(struct folio *folio);
>>>>  int split_folio_to_list(struct folio *folio, struct list_head *list);
>>>> +int __split_unmapped_folio(struct folio *folio, int new_order,
>>>> +			   struct page *split_at, struct xa_state *xas,
>>>> +			   struct address_space *mapping, enum split_type split_type);
>>>>  int folio_check_splittable(struct folio *folio, unsigned int new_orde=
r,
>>>>  			   enum split_type split_type);
>>>>  int folio_split(struct folio *folio, unsigned int new_order, struct p=
age *page,
>>>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>>>> index 26ca00c325d9..ec65e4fd5f88 100644
>>>> --- a/include/linux/migrate.h
>>>> +++ b/include/linux/migrate.h
>>>> @@ -192,6 +192,7 @@ void migrate_device_pages(unsigned long *src_pfns,=
 unsigned long *dst_pfns,
>>>>  			unsigned long npages);
>>>>  void migrate_device_finalize(unsigned long *src_pfns,
>>>>  			unsigned long *dst_pfns, unsigned long npages);
>>>> +int migrate_device_split_page(struct page *page);
>>>>
>>>>  #endif /* CONFIG_MIGRATION */
>>>>
>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>>> index 40cf59301c21..7ded35a3ecec 100644
>>>> --- a/mm/huge_memory.c
>>>> +++ b/mm/huge_memory.c
>>>> @@ -3621,9 +3621,9 @@ static void __split_folio_to_order(struct folio =
*folio, int old_order,
>>>>   * Return: 0 - successful, <0 - failed (if -ENOMEM is returned, @foli=
o might be
>>>>   * split but not to @new_order, the caller needs to check)
>>>>   */
>>>> -static int __split_unmapped_folio(struct folio *folio, int new_order,
>>>> -		struct page *split_at, struct xa_state *xas,
>>>> -		struct address_space *mapping, enum split_type split_type)
>>>> +int __split_unmapped_folio(struct folio *folio, int new_order,
>>>> +			   struct page *split_at, struct xa_state *xas,
>>>> +			   struct address_space *mapping, enum split_type split_type)
>>>>  {
>>>>  	const bool is_anon =3D folio_test_anon(folio);
>>>>  	int old_order =3D folio_order(folio);
>>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>>> index 23379663b1e1..eb0f0e938947 100644
>>>> --- a/mm/migrate_device.c
>>>> +++ b/mm/migrate_device.c
>>>> @@ -775,6 +775,49 @@ int migrate_vma_setup(struct migrate_vma *args)
>>>>  EXPORT_SYMBOL(migrate_vma_setup);
>>>>
>>>>  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>>>> +/**
>>>> + * migrate_device_split_page() - Split device page
>>>> + * @page: Device page to split
>>>> + *
>>>> + * Splits a device page into smaller pages. Typically called when rea=
llocating a
>>>> + * folio to a smaller size. Inherently racy=E2=80=94only safe if the =
caller ensures
>>>> + * mutual exclusion within the page's folio (i.e., no other threads a=
re using
>>>> + * pages within the folio). Expected to be called a free device page =
and
>>>> + * restores all split out pages to a free state.
>>>> + */
>>
>> Do you mind explaining why __split_unmapped_folio() is needed for a free=
 device
>> page? A free page is not supposed to be a large folio, at least from a c=
ore
>> MM point of view. __split_unmapped_folio() is intended to work on large =
folios
>> (or compound pages), even if the input folio has refcount =3D=3D 0 (beca=
use it is
>> frozen).
>>
>
> Well, then maybe this is a bug in core MM where the freed page is still
> a THP. Let me explain the scenario and why this is needed from my POV.
>
> Our VRAM allocator in Xe (and several other DRM drivers) is DRM buddy.
> This is a shared pool between traditional DRM GEMs (buffer objects) and
> SVM allocations (pages). It doesn=E2=80=99t have any view of the page bac=
king=E2=80=94it
> basically just hands back a pointer to VRAM space that we allocate from.
> From that, if it=E2=80=99s an SVM allocation, we can derive the device pa=
ges.
>
> What I see happening is: a 2M buddy allocation occurs, we make the
> backing device pages a large folio, and sometime later the folio
> refcount goes to zero and we free the buddy allocation. Later, the buddy
> allocation is reused for a smaller allocation (e.g., 4K or 64K), but the
> backing pages are still a large folio. Here is where we need to split

I agree with you that it might be a bug in free_zone_device_folio() based
on my understanding. Since zone_device_page_init() calls prep_compound_page=
()
for >0 orders, but free_zone_device_folio() never reverse the process.

Balbir and Alistair might be able to help here.

I cherry picked the code from __free_frozen_pages() to reverse the process.
Can you give it a try to see if it solve the above issue? Thanks.

From 3aa03baa39b7e62ea079e826de6ed5aab3061e46 Mon Sep 17 00:00:00 2001
From: Zi Yan <ziy@nvidia.com>
Date: Wed, 7 Jan 2026 16:49:52 -0500
Subject: [PATCH] mm/memremap: free device private folio fix
Content-Type: text/plain; charset=3D"utf-8"

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 mm/memremap.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/mm/memremap.c b/mm/memremap.c
index 63c6ab4fdf08..483666ff7271 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -475,6 +475,21 @@ void free_zone_device_folio(struct folio *folio)
 		pgmap->ops->folio_free(folio);
 		break;
 	}
+
+	if (nr > 1) {
+		struct page *head =3D folio_page(folio, 0);
+
+		head[1].flags.f &=3D ~PAGE_FLAGS_SECOND;
+#ifdef NR_PAGES_IN_LARGE_FOLIO
+		folio->_nr_pages =3D 0;
+#endif
+		for (i =3D 1; i < nr; i++) {
+			(head + i)->mapping =3D NULL;
+			clear_compound_head(head + i);
+		}
+		folio->mapping =3D NULL;
+		head->flags.f &=3D ~PAGE_FLAGS_CHECK_AT_PREP;
+	}
 }

 void zone_device_page_init(struct page *page, unsigned int order)
--=20
2.51.0



> the folio into 4K pages so we can properly migrate the pages via the
> migrate_vma_* calls. Also note: if you call zone_device_page_init with
> an order of zero on a large device folio, that also blows up.
>
> Open to other ideas here for how to handle this scenario.
>
>>>> +int migrate_device_split_page(struct page *page)
>>>> +{
>>>> +	struct folio *folio =3D page_folio(page);
>>>> +	struct dev_pagemap *pgmap =3D folio->pgmap;
>>>> +	struct page *unlock_page =3D folio_page(folio, 0);
>>>> +	unsigned int order =3D folio_order(folio), i;
>>>> +	int ret =3D 0;
>>>> +
>>>> +	VM_BUG_ON_FOLIO(!order, folio);
>>>> +	VM_BUG_ON_FOLIO(!folio_is_device_private(folio), folio);
>>>> +	VM_BUG_ON_FOLIO(folio_ref_count(folio), folio);
>>
>> Please use VM_WARN_ON_FOLIO() instead to catch errors. There is no need =
to crash
>> the kernel
>>
>
> Sure.
>
>>>> +
>>>> +	folio_lock(folio);
>>>> +
>>>> +	ret =3D __split_unmapped_folio(folio, 0, page, NULL, NULL, SPLIT_TYP=
E_UNIFORM);
>>>> +	if (ret) {
>>>> +	       /*
>>>> +		* We can't fail here unless the caller doesn't know what they
>>>> +		* are doing.
>>>> +		*/
>>>> +		VM_BUG_ON_FOLIO(ret, folio);
>>
>> Same here.
>>
>
> Will do.
>
> Matt
>
>>>> +
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	for (i =3D 0; i < 0x1 << order; ++i, ++unlock_page) {
>>>> +		page_folio(unlock_page)->pgmap =3D pgmap;
>>>> +		folio_unlock(page_folio(unlock_page));
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>  /**
>>>>   * migrate_vma_insert_huge_pmd_page: Insert a huge folio into @migrat=
e->vma->vm_mm
>>>>   * at @addr. folio is already allocated as a part of the migration pr=
ocess with
>>>> @@ -927,6 +970,11 @@ static int migrate_vma_split_unmapped_folio(struc=
t migrate_vma *migrate,
>>>>  	return ret;
>>>>  }
>>>>  #else /* !CONFIG_ARCH_ENABLE_THP_MIGRATION */
>>>> +int migrate_device_split_page(struct page *page)
>>>> +{
>>>> +	return 0;
>>>> +}
>>>> +
>>>>  static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migra=
te,
>>>>  					 unsigned long addr,
>>>>  					 struct page *page,
>>>> @@ -943,6 +991,7 @@ static int migrate_vma_split_unmapped_folio(struct=
 migrate_vma *migrate,
>>>>  	return 0;
>>>>  }
>>>>  #endif
>>>> +EXPORT_SYMBOL(migrate_device_split_page);
>>>>
>>>>  static unsigned long migrate_vma_nr_pages(unsigned long *src)
>>>>  {
>>>> --=20
>>>> 2.43.0
>>>
>>>
>>> Best Regards,
>>> Yan, Zi
>>
>>
>> Best Regards,
>> Yan, Zi


Best Regards,
Yan, Zi
