Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0EFB23C4E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 01:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698AB10E186;
	Tue, 12 Aug 2025 23:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="o1nYV2A8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818C310E023
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 23:36:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjB+pg37JMBuaSEZF1fNL2yXnylvDS9okpzcW9cdWHjZHyTNfkEz/bBnl6cPei04ymNdQLAgyimAprvBBYXq9y7xxqdVStOxLSZgMFAFLC3ZKTzbu9LK1jI9QbZWrNEoKXA23nmNe1sP9TC1PLm40/yZgMz9a/aYU4jA3SCE3Pb5x412x3GM0GV+xd7vg1eQh/kwkmWya5Nv7y1qGl2HXYLLOsz6gCOeN5cU8IkOJXRduzYQyRO7Q6OeeRffiOzeKpeAJ/inSm0x+rZVMYX+WbsrrUqe8xWE722cpoaZ1DIim4MHZ4ylFhXv046jXrIWWQwjpuEd5NxyeiugIV/GSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1Zlm9R814xkGH12Ro/VlAu7DurfCdJAZ4+3RCtMg1A=;
 b=Trfjpuyty6ldUtUg/yonII8jv9dsVHBCCheoVeMrUEQIb4fd3oe49OxkN1e/3ndEJxmoZ6x4VPECxHDe4d95y4tIqU8cJR4vCpnkizvI58Zb2tgydem9/3PqZTZL2FVfIjOSnmncuPU8bZnABzEorKQnnuueQwQFzH/gD9O/YtRnJkMztpWsfsvl7yebWcVdQVZzGr4yGXBPSex5uxEkmxwclZB+PgQwdRncWxXvbqUHBysXSegryfsfrlqMB3nGp+degyxxvBzxnyLFOVrWy5HGu37uPA1DKD9skXhZK+wfxNLwUf6FV+azqfFfgfScYkEnMRko109rnPGpFx9FuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1Zlm9R814xkGH12Ro/VlAu7DurfCdJAZ4+3RCtMg1A=;
 b=o1nYV2A8Rfn9HdkOqZ0cNzGE1uX3solL+5/6HMfatGCqg+yXi/CipB/qb03wQX15Q0V73dlOCWGgTBvXwukuVHM5iAY45SDHLR+TQYXbWQu9xFWagkhIcZYj2VSnGjsj37jW+hoq1gxFiUgr+6zjcQGqYUWg5nH5Y/dNKAkJoS4OXHTOL+sEEovA/06K1pDx5XDNviW+EVtgpxdW4AzrA4Af/xPX64BQ9KeFgsb66KWsJo9oRojARsByT0p6np8o/2OsnwzpxTBXfYaTuFngu+R1N0MzOP1cg7HIxrTaK47hvbXCA4LAmuJigvYEmlJ2QbSCcVSSOrrt7Gd8ncMzIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH7PR12MB7843.namprd12.prod.outlook.com (2603:10b6:510:27e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 12 Aug
 2025 23:36:18 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 23:36:18 +0000
Message-ID: <9207451b-ebd1-46d5-b277-2adf3028f361@nvidia.com>
Date: Wed, 13 Aug 2025 09:36:10 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 03/11] mm/migrate_device: THP migration of zone device pages
To: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250812024036.690064-1-balbirs@nvidia.com>
 <20250812024036.690064-4-balbirs@nvidia.com>
 <81ca37d5-b1ff-46de-8dcc-b222af350c77@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <81ca37d5-b1ff-46de-8dcc-b222af350c77@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0030.namprd21.prod.outlook.com
 (2603:10b6:a03:114::40) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH7PR12MB7843:EE_
X-MS-Office365-Filtering-Correlation-Id: d4fff5f2-a35c-4ad1-9571-08ddd9f908e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUVScG5DVi9nVm5DMkJHT2lLdnNoT2ZOUHpoc3ZIakNkdExWV1QrQ2VaNTBm?=
 =?utf-8?B?SzdkdnF4R0NVL2p4VnYyaHR3Z0hvY09NeTBtaUpZZS9HVXlrNVQ2M0FuRFFv?=
 =?utf-8?B?bUt4b2JySkRSMnhuVTc4clJuRSs0MXduMEFEd0RPYkpUK0dvcWFjMUVJbXZ2?=
 =?utf-8?B?a00zOUQ2aEc4azBJc1RPT0hpVUFtREdVYnlYa3p1cCtVcVNRWUlYN3RHVk9L?=
 =?utf-8?B?SmJpcXZtS3I1SUk2cmJvZ3MvWXJMVnVtVDVpYm04RFhBWEZDWnpjSlJBTWJx?=
 =?utf-8?B?U1ExU2xXK2xsbjhUMUtTWFRjUnMrRVFaWHlpSkpGWTZNL2laNldJWjl6bklz?=
 =?utf-8?B?eWVPZDlZa2F1OFo0blphOGJuM1ZwRkRDM1Z4QVdkSGNXUFgrNEFuYTA2dmhS?=
 =?utf-8?B?bGhkVDlWQ21NSGdlaUlGbFFXOUJNcjhkU3BzdXNOTFlNSWhQRFJzRWgxZlA3?=
 =?utf-8?B?Y0QvQUNBUkdZMDVReC9CRzVDYWxvdzVjY1RiWHRxUHFMMXkwanhPYVhPZExl?=
 =?utf-8?B?czJtaFI5eVJReWovcmlteGl5K1Z1TzUzVGZ4U3hPaXdoRnRaS3ZHOVVjQTBT?=
 =?utf-8?B?L05rU1cvckpEMjlSc3ZZSmc1d1NZb0lFaGhHZFhuSUJyNlYzcnNScjN4WENY?=
 =?utf-8?B?Mno5VHViTmFyQmZYV05McEpjYzl6eXpnWWNaVDRwYVArbDJ3WVJGTEd5OW1L?=
 =?utf-8?B?ZmMrRkJiaTNwV00zYUszcTBRbnlhUXpneklzTmFIZXIzTTZUVmtmRVc4Z2Vk?=
 =?utf-8?B?bUVpRGhLRVBMeCtDZjJjUDJMTHRRZnZ2T0wzMWk1UWhsTlU3UmhBQU0rMkF5?=
 =?utf-8?B?UW5aQjNrV1NoSkl3bHpyMDl6d3ZOd3piM1ZBVTArRmtNOURaSjZSenNzazVM?=
 =?utf-8?B?U3Rtb3Znd3BxMkdIaXRlaWRwMCtTTGpBbWxvTUhhUEZLVEdObHJ2elVGV05Q?=
 =?utf-8?B?Vzg1bzBrVUtWUDBva0JrWTVlYVcweGV2NUxMM1p5aTYwNHRZaFZMcUl4WUw4?=
 =?utf-8?B?eVN5dHFBcEFTQk1zVVJ2bjNES3NPNU1HSEJJWWFQL0RCWTJmZDFMOHhyeVAy?=
 =?utf-8?B?SmdGZGM4YnNnY1hlNlFUZnk2SEZaWTJLcTVuRmJkemxUWEtWNG9CN0dPU2Fo?=
 =?utf-8?B?TVJ6RU10SVBsUEhGWGp6WTI4dDc0bWlkejdMRVRobUg4TzNmR3lwZ2RSbW1D?=
 =?utf-8?B?Q1N6a0h1WXVVVnI1RHBUWU1hTGN2VHhURGdSc21PdXpFUEpkckg3bUp2dngv?=
 =?utf-8?B?R1htQnFIWndGYlpDMG9IeE96WTdoNlBFdFZzaVcyQmxrSWorVWxoTVY2TlNl?=
 =?utf-8?B?Y3N0UTBHVXBvNUVKZ3N2YXJHR2RiSXRzZWdibXliRE8xUGVkQUppNmZZdUtX?=
 =?utf-8?B?RmlWcXBkS05DekdmczhuSGNtS05oVzU0Z1VGZmJPSTV2ckNKK08vbGxUR01k?=
 =?utf-8?B?a256cmFUMEorK1Vmak9SdURhZ1R4UnJCK2RSQUVkQklVY1o2VlpyUmtzOVZP?=
 =?utf-8?B?bmZRMGh2cWVhMGc2aXRZUGloN01kUlUvV2g3RVovaSszaU41Sy9mN2RhOEx6?=
 =?utf-8?B?d3RMSFpsZG5QcW16QzdRdm1SQUVMT0dhdEJoc2poN2Q0QWhnZmppTnZldUpG?=
 =?utf-8?B?THRzNVN6UVBGK3RPT3EzcFZob3ZaMFdpaUFTOXBDWkw3WjdzaGcrV281ZTdM?=
 =?utf-8?B?QUFIQW44NWNUOFpGaU9kTy95Y1RtTDBqTUs1SklDL0ZZR0k4NVkreWUwaXJv?=
 =?utf-8?B?eExLNnUrQVZpTmhMT250U0ZXQzJYcHVidk5zUzFJNVptU284K2pPemY3TERP?=
 =?utf-8?B?YklkR1JzanNJODJONGdneDRseUxPb1FMeU1uSXZWaFM5SnltS1l5R1NsK25T?=
 =?utf-8?B?TGI4N1NHSUpMdVdvdHRvbUVNOUJTNEl4K3BmUUtZRlRobnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3NoU08vL3FFNDArMCtWZytIVnVqenNScGRXYWp2SDN6b3VscUY3eTdaTm5w?=
 =?utf-8?B?aCs5dk9HQjN5Uy8yd05BSWxXZmt0SFNoMHhTMjFETkZhb0JucEY1ZTRvcHJa?=
 =?utf-8?B?cE5uOTNZTDNoVlJDNHA0R0syZk9JZ1BLN0xMZis1MDVHckdDdlEyR1Jxd1I3?=
 =?utf-8?B?WHppcUJSeVdzN0lSanJrUkE5Y1QxUTlIakdTemk4ckptWVpUYVdDSkF5TE11?=
 =?utf-8?B?QlpRUFFEeHBGNmlHTU9nVjYraHpDbGdPZkw5Szl1VDE1Qi8vbkcrOUYvY2Zt?=
 =?utf-8?B?SzJJeS94ekVBbmJtYkpzdjkwRHZnSGU3ZEprMGpxVk1PWHk1UnhxeUVXalpm?=
 =?utf-8?B?TVg3elJuR2lCUGFMd1Yyajk0cmZ0dk0rQTAzZktpTG1iRjZPTEtLdENkQjlh?=
 =?utf-8?B?blh0bHJSSmdKNHhOQkdqYk1vejJOQ25OT2djZlJTR3JWNWFUWEhGSTB3YStH?=
 =?utf-8?B?RURrRktWbEJWUzlVM0c0NHdOcFk4SFNIaEl5RVVsZHpwOExoUFpoaTlMV0s0?=
 =?utf-8?B?ZHJxVjZnWUZ5UG84eG5SVDUyY3BaUDlORjZMNGdKOXhpNG0vYVN4UVBXa2Rl?=
 =?utf-8?B?NUllSFRDWEt1RmJzazFVbmNzMVJucGVia3ZzZTZEQlBRbHdyS2txTUV2MnU5?=
 =?utf-8?B?Q0llLzROaWlNMnB2eHZhaGhSRDg1M3JYd2w3Wjlib05TVDhzV1dtaVByeHNw?=
 =?utf-8?B?dFF6d1QyQTE5THBKY1dZRmxsa1FlUFRCMTE1N3ViRlFid0FZZ1Q5U0NBQ3lo?=
 =?utf-8?B?UVNHVkFzdzROZnBxOGM5bjdsV2hqZjFVbTViMEZMLythSExEd0pFZkFzQmhI?=
 =?utf-8?B?ME5rZkg5SDlGWFh1WTNqRVloSEdWdE9MdWlDU2VHVkZMOHdoaTdyRm1IcXF2?=
 =?utf-8?B?Z1A4TjlRbDdrMUpGRjVzcDMwQ3U1Q0JDRVdKQXIzTGI4Y2hreDRHTzBKMU4v?=
 =?utf-8?B?ZEJqd1NQRXc1OFpzOTBScEd6VXVUL0QvUFJDKzEwZFJheVJYTG9wZEQ5R3pa?=
 =?utf-8?B?UnBnWjJraFNaRVZ5NTFraG1JdEhTdmRacEhNdWhCMU0rYnhOYit1Z3dKY3Jn?=
 =?utf-8?B?R3QwL1VBdGhuUnUyd1FlYm52UjVMbVYwRVptbUdFVElQZytjZDFTQllIYzJj?=
 =?utf-8?B?VERKeTRXVnYvcWtxNDcwdGpJNi9wYkYraG5LNzR4V2tlU0p3b2tjZFBVc1hC?=
 =?utf-8?B?U1d5K2pwVDNmY0NXWkw5WjVGMTg5aGFHQkUvUElQY1RobjBBTFY5Q3pBSUdj?=
 =?utf-8?B?TTBDb2JBM2Jqck10djRGWFExYmJvamN0a1VKNTJQcEsya0ljZmRPS3IrQ21m?=
 =?utf-8?B?ZU94OW9GZzRUc1lBSGYrZGZGUWpOaHpnY3lCaVRIYzRGYWVoVjRJdWtUUmlY?=
 =?utf-8?B?NGZjdlRXaDFTYkZJUlNuMzlSK1Y0WVIxVWR5RFdYOFNCMDdJRVRKbFUvbDBr?=
 =?utf-8?B?N2wrV3FVb2FpZExQUEJvMm9aV0FNeDgzS1BuV3RCS0paWUdwekpjOVBGajJj?=
 =?utf-8?B?SkhHTnNScGhTbUpNaW82elNNQkMyZWlRdUsvbUpKSFU0NTdnMlVCRlVld0or?=
 =?utf-8?B?MzVqZG5RWnFjYkNWRTlLU1JOUmJpekgyWE9YNEUrMzRvSmdBM0JmdlNsNHR5?=
 =?utf-8?B?S2FHMEtreStCcEdqK0g0Y3RnaWNNd3RlTlFUZDMzcUhaeThJYWRSTmJXKzE1?=
 =?utf-8?B?UC9wbmxkUHBvT0p5WnhZcHBJYVRZSmxKbEVjUzRBd1BLOVZsK3gzM2pzRmlZ?=
 =?utf-8?B?am9QaVBtQ1hDTjJyU3FncEdRNHUvSWl5WXNYMWx6MGNjRktIRjhSVDVNZ2ha?=
 =?utf-8?B?dEU2Njkvc2U4N0VJUW8wN2dVTGJxZTVraFppZGJ6ZFJIbWVGdm5oMGpZUUlB?=
 =?utf-8?B?aHpmM3VZMDE3L20ybFNiY05nVGlkbEozcUQ2M0k3ZnRzUVpVOW1xL0FyUFE3?=
 =?utf-8?B?ZjFOUHhzOTlhMXNiUkNFVis3M1oyZkhSNU1UdHQ2bTR6bXliVStPbDk3R2N0?=
 =?utf-8?B?V1VneUxLY2MvbUN0RGkvQkZZQWVrdEdDOE9NQjlJTmpRekRrYmVaUUJlYmxF?=
 =?utf-8?B?eEwyRDZnTmVib1pic0pQZm1aeVdubTZRVm0rVXhsWTBMWit6TG9SWEZHdGNC?=
 =?utf-8?Q?cbOWo7mQzWzx8/i5x7J0kzk1y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4fff5f2-a35c-4ad1-9571-08ddd9f908e4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 23:36:17.9940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rYyAxqNCD7txpXITd32JLV/41TFr257MYk6ci8hMn448AITWfmhW0PhL/erXuRF9eLXTkfdpXb962ZogKiaPLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7843
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

On 8/12/25 15:35, Mika Penttilä wrote:
> Hi,
> 
> On 8/12/25 05:40, Balbir Singh wrote:
> 
>> MIGRATE_VMA_SELECT_COMPOUND will be used to select THP pages during
>> migrate_vma_setup() and MIGRATE_PFN_COMPOUND will make migrating
>> device pages as compound pages during device pfn migration.
>>
>> migrate_device code paths go through the collect, setup
>> and finalize phases of migration.
>>
>> The entries in src and dst arrays passed to these functions still
>> remain at a PAGE_SIZE granularity. When a compound page is passed,
>> the first entry has the PFN along with MIGRATE_PFN_COMPOUND
>> and other flags set (MIGRATE_PFN_MIGRATE, MIGRATE_PFN_VALID), the
>> remaining entries (HPAGE_PMD_NR - 1) are filled with 0's. This
>> representation allows for the compound page to be split into smaller
>> page sizes.
>>
>> migrate_vma_collect_hole(), migrate_vma_collect_pmd() are now THP
>> page aware. Two new helper functions migrate_vma_collect_huge_pmd()
>> and migrate_vma_insert_huge_pmd_page() have been added.
>>
>> migrate_vma_collect_huge_pmd() can collect THP pages, but if for
>> some reason this fails, there is fallback support to split the folio
>> and migrate it.
>>
>> migrate_vma_insert_huge_pmd_page() closely follows the logic of
>> migrate_vma_insert_page()
>>
>> Support for splitting pages as needed for migration will follow in
>> later patches in this series.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Zi Yan <ziy@nvidia.com>
>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>> Cc: Rakie Kim <rakie.kim@sk.com>
>> Cc: Byungchul Park <byungchul@sk.com>
>> Cc: Gregory Price <gourry@gourry.net>
>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>> Cc: Alistair Popple <apopple@nvidia.com>
>> Cc: Oscar Salvador <osalvador@suse.de>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>> Cc: Nico Pache <npache@redhat.com>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Dev Jain <dev.jain@arm.com>
>> Cc: Barry Song <baohua@kernel.org>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>> Cc: Mika Penttilä <mpenttil@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> ---
>>  include/linux/migrate.h |   2 +
>>  mm/migrate_device.c     | 457 ++++++++++++++++++++++++++++++++++------
>>  2 files changed, 396 insertions(+), 63 deletions(-)
>>
>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>> index acadd41e0b5c..d9cef0819f91 100644
>> --- a/include/linux/migrate.h
>> +++ b/include/linux/migrate.h
>> @@ -129,6 +129,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
>>  #define MIGRATE_PFN_VALID	(1UL << 0)
>>  #define MIGRATE_PFN_MIGRATE	(1UL << 1)
>>  #define MIGRATE_PFN_WRITE	(1UL << 3)
>> +#define MIGRATE_PFN_COMPOUND	(1UL << 4)
>>  #define MIGRATE_PFN_SHIFT	6
>>  
>>  static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
>> @@ -147,6 +148,7 @@ enum migrate_vma_direction {
>>  	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
>>  	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
>>  	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
>> +	MIGRATE_VMA_SELECT_COMPOUND = 1 << 3,
>>  };
>>  
>>  struct migrate_vma {
>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>> index 0ed337f94fcd..6621bba62710 100644
>> --- a/mm/migrate_device.c
>> +++ b/mm/migrate_device.c
>> @@ -14,6 +14,7 @@
>>  #include <linux/pagewalk.h>
>>  #include <linux/rmap.h>
>>  #include <linux/swapops.h>
>> +#include <asm/pgalloc.h>
>>  #include <asm/tlbflush.h>
>>  #include "internal.h"
>>  
>> @@ -44,6 +45,23 @@ static int migrate_vma_collect_hole(unsigned long start,
>>  	if (!vma_is_anonymous(walk->vma))
>>  		return migrate_vma_collect_skip(start, end, walk);
>>  
>> +	if (thp_migration_supported() &&
>> +		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
>> +		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
>> +		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
>> +		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE |
>> +						MIGRATE_PFN_COMPOUND;
>> +		migrate->dst[migrate->npages] = 0;
>> +		migrate->npages++;
>> +		migrate->cpages++;
>> +
>> +		/*
>> +		 * Collect the remaining entries as holes, in case we
>> +		 * need to split later
>> +		 */
>> +		return migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
>> +	}
>> +
>>  	for (addr = start; addr < end; addr += PAGE_SIZE) {
>>  		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE;
>>  		migrate->dst[migrate->npages] = 0;
>> @@ -54,57 +72,151 @@ static int migrate_vma_collect_hole(unsigned long start,
>>  	return 0;
>>  }
>>  
>> -static int migrate_vma_collect_pmd(pmd_t *pmdp,
>> -				   unsigned long start,
>> -				   unsigned long end,
>> -				   struct mm_walk *walk)
>> +/**
>> + * migrate_vma_collect_huge_pmd - collect THP pages without splitting the
>> + * folio for device private pages.
>> + * @pmdp: pointer to pmd entry
>> + * @start: start address of the range for migration
>> + * @end: end address of the range for migration
>> + * @walk: mm_walk callback structure
>> + *
>> + * Collect the huge pmd entry at @pmdp for migration and set the
>> + * MIGRATE_PFN_COMPOUND flag in the migrate src entry to indicate that
>> + * migration will occur at HPAGE_PMD granularity
>> + */
>> +static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
>> +					unsigned long end, struct mm_walk *walk,
>> +					struct folio *fault_folio)
>>  {
>> +	struct mm_struct *mm = walk->mm;
>> +	struct folio *folio;
>>  	struct migrate_vma *migrate = walk->private;
>> -	struct folio *fault_folio = migrate->fault_page ?
>> -		page_folio(migrate->fault_page) : NULL;
>> -	struct vm_area_struct *vma = walk->vma;
>> -	struct mm_struct *mm = vma->vm_mm;
>> -	unsigned long addr = start, unmapped = 0;
>>  	spinlock_t *ptl;
>> -	pte_t *ptep;
>> +	swp_entry_t entry;
>> +	int ret;
>> +	unsigned long write = 0;
>>  
>> -again:
>> -	if (pmd_none(*pmdp))
>> +	ptl = pmd_lock(mm, pmdp);
>> +	if (pmd_none(*pmdp)) {
>> +		spin_unlock(ptl);
>>  		return migrate_vma_collect_hole(start, end, -1, walk);
>> +	}
>>  
>>  	if (pmd_trans_huge(*pmdp)) {
>> -		struct folio *folio;
>> -
>> -		ptl = pmd_lock(mm, pmdp);
>> -		if (unlikely(!pmd_trans_huge(*pmdp))) {
>> +		if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
>>  			spin_unlock(ptl);
>> -			goto again;
>> +			return migrate_vma_collect_skip(start, end, walk);
>>  		}
>>  
>>  		folio = pmd_folio(*pmdp);
>>  		if (is_huge_zero_folio(folio)) {
>>  			spin_unlock(ptl);
>> -			split_huge_pmd(vma, pmdp, addr);
>> -		} else {
>> -			int ret;
>> +			return migrate_vma_collect_hole(start, end, -1, walk);
>> +		}
>> +		if (pmd_write(*pmdp))
>> +			write = MIGRATE_PFN_WRITE;
>> +	} else if (!pmd_present(*pmdp)) {
>> +		entry = pmd_to_swp_entry(*pmdp);
>> +		folio = pfn_swap_entry_folio(entry);
>> +
>> +		if (!is_device_private_entry(entry) ||
>> +			!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
>> +			(folio->pgmap->owner != migrate->pgmap_owner)) {
>> +			spin_unlock(ptl);
>> +			return migrate_vma_collect_skip(start, end, walk);
>> +		}
>>  
>> -			folio_get(folio);
>> +		if (is_migration_entry(entry)) {
>> +			migration_entry_wait_on_locked(entry, ptl);
>>  			spin_unlock(ptl);
>> -			/* FIXME: we don't expect THP for fault_folio */
>> -			if (WARN_ON_ONCE(fault_folio == folio))
>> -				return migrate_vma_collect_skip(start, end,
>> -								walk);
>> -			if (unlikely(!folio_trylock(folio)))
>> -				return migrate_vma_collect_skip(start, end,
>> -								walk);
>> -			ret = split_folio(folio);
>> -			if (fault_folio != folio)
>> -				folio_unlock(folio);
>> -			folio_put(folio);
>> -			if (ret)
>> -				return migrate_vma_collect_skip(start, end,
>> -								walk);
>> +			return -EAGAIN;
>>  		}
>> +
>> +		if (is_writable_device_private_entry(entry))
>> +			write = MIGRATE_PFN_WRITE;
>> +	} else {
>> +		spin_unlock(ptl);
>> +		return -EAGAIN;
>> +	}
>> +
>> +	folio_get(folio);
>> +	if (folio != fault_folio && unlikely(!folio_trylock(folio))) {
>> +		spin_unlock(ptl);
>> +		folio_put(folio);
>> +		return migrate_vma_collect_skip(start, end, walk);
>> +	}
>> +
>> +	if (thp_migration_supported() &&
>> +		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
>> +		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
>> +		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
>> +
>> +		struct page_vma_mapped_walk pvmw = {
>> +			.ptl = ptl,
>> +			.address = start,
>> +			.pmd = pmdp,
>> +			.vma = walk->vma,
>> +		};
>> +
>> +		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
>> +
>> +		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
>> +						| MIGRATE_PFN_MIGRATE
>> +						| MIGRATE_PFN_COMPOUND;
>> +		migrate->dst[migrate->npages++] = 0;
>> +		migrate->cpages++;
>> +		ret = set_pmd_migration_entry(&pvmw, folio_page(folio, 0));
>> +		if (ret) {
>> +			migrate->npages--;
>> +			migrate->cpages--;
>> +			migrate->src[migrate->npages] = 0;
>> +			migrate->dst[migrate->npages] = 0;
>> +			goto fallback;
>> +		}
>> +		migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
>> +		spin_unlock(ptl);
>> +		return 0;
>> +	}
>> +
>> +fallback:
>> +	spin_unlock(ptl);
>> +	if (!folio_test_large(folio))
>> +		goto done;
>> +	ret = split_folio(folio);
>> +	if (fault_folio != folio)
>> +		folio_unlock(folio);
>> +	folio_put(folio);
>> +	if (ret)
>> +		return migrate_vma_collect_skip(start, end, walk);
>> +	if (pmd_none(pmdp_get_lockless(pmdp)))
>> +		return migrate_vma_collect_hole(start, end, -1, walk);
>> +
>> +done:
>> +	return -ENOENT;
>> +}
>> +
>> +static int migrate_vma_collect_pmd(pmd_t *pmdp,
>> +				   unsigned long start,
>> +				   unsigned long end,
>> +				   struct mm_walk *walk)
>> +{
>> +	struct migrate_vma *migrate = walk->private;
>> +	struct vm_area_struct *vma = walk->vma;
>> +	struct mm_struct *mm = vma->vm_mm;
>> +	unsigned long addr = start, unmapped = 0;
>> +	spinlock_t *ptl;
>> +	struct folio *fault_folio = migrate->fault_page ?
>> +		page_folio(migrate->fault_page) : NULL;
>> +	pte_t *ptep;
>> +
>> +again:
>> +	if (pmd_trans_huge(*pmdp) || !pmd_present(*pmdp)) {
>> +		int ret = migrate_vma_collect_huge_pmd(pmdp, start, end, walk, fault_folio);
>> +
>> +		if (ret == -EAGAIN)
>> +			goto again;
>> +		if (ret == 0)
>> +			return 0;
>>  	}
>>  
>>  	ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
>> @@ -222,8 +334,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>  			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
>>  		}
>>  
>> -		/* FIXME support THP */
>> -		if (!page || !page->mapping || PageTransCompound(page)) {
>> +		if (!page || !page->mapping) {
>>  			mpfn = 0;
>>  			goto next;
>>  		}
>> @@ -394,14 +505,6 @@ static bool migrate_vma_check_page(struct page *page, struct page *fault_page)
>>  	 */
>>  	int extra = 1 + (page == fault_page);
>>  
>> -	/*
>> -	 * FIXME support THP (transparent huge page), it is bit more complex to
>> -	 * check them than regular pages, because they can be mapped with a pmd
>> -	 * or with a pte (split pte mapping).
>> -	 */
>> -	if (folio_test_large(folio))
>> -		return false;
>> -
> 
> You cannot remove this check unless support normal mTHP folios migrate to device, 
> which I think this series doesn't do, but maybe should?
> 

mTHP needs to be a follow up series, there are comments in the cover letter. I had an
assert earlier to prevent other folio sizes, but I've removed it and the interface
to drivers does not allow for mTHP device private folios.

Balbir
