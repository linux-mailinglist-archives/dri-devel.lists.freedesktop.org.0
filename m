Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B1ABD6602
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 23:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD3D10E157;
	Mon, 13 Oct 2025 21:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SzZZMr1P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012045.outbound.protection.outlook.com [52.101.53.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41C610E500
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 21:33:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YacswlqWhBC/tYcOptkTC2bE1FVuIc3nbNpmNyW4jXI12h67dTpMiabapDkG2hldCZ3743MpzXZNdMXQZj9ypbZYVTAV5Y1q3YKM3KvpPw2BDKpIASJs4RSqRu06/x57SyNXKbAIt8smqVzd37lF5wFpxxe5TyXvT18Qy+nwMj5syhW1qtnOLCQIMgs7bAq9aajT+sVlvu3Xx6k+/LEXmYbz8rqWVyqgjjL2dkNA1RXwLmThykwtCRgvDlbkLLDe1TRy6m5cMN4sT4qW4r4jt9CBpFywRtgqccuLhaCjXtOm0vsulKp5n2lXhfU1MlwVkEiqDw1v6FpKLmgjaqONaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lguWPV3Et/w9wBwLE3d0lE00H+Ddgn2ulZ9JL350jM=;
 b=ZLH1Y5EpBjIbVto+YbEDzYPN4H/JdugKRUskCW5CSAWQaWfNFrF/jc8uO1rrwrVSRUYVuHH2GntHgVqF65PLWJKPFOfm5Pn4OpQwSLIF7Be6abvN/P+2fLuqqTdT9seF5D6hH8cf0W7ARQLtVCKe9QpBm3tB4hHYj/JlkhMfCbxzTlGD4prWWdOrvHXxeFviHMt3d5GL9rV4LFJd4tpbsUe8p2fcHwAr50KtsRlhy3JuXfTzQpKph7vfRVR/JJ6l96o0YFciMcg1EpNJiDgD9vRjOu7wrNaoY7RM3UdI4YAeP2FDBoG1s/MqW/XRKMgujVtqAl+HITisEuEOx+GvXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lguWPV3Et/w9wBwLE3d0lE00H+Ddgn2ulZ9JL350jM=;
 b=SzZZMr1PS4+g8NSEYGm97n1hKeV7GpJRahENhcRiFbsyH/0wSrH42kNfgo79Mm4VGlvc3B6NfIdbCmxuw54RSMMjFe0F3mUrrVkfPMPA/tI3OAbmbeOzb69wsL7bBJHFHQ/Rk7hXV/0rLALo3hb4qxg8OTt+YbXI3CtNEaD8iAiPuHw9RLirfGgAL2FNXYjnBMIwXS7nkm0eKXs2xdRSzh1GfvN7NWRB8+0wZQnImO2W4qrYmn7dWO+7aeP+G4LIxUE70Gq3V5n58g2J7Gl5zqMioXbhreydhlgVrf+VVKSJP9ZprFtgJ0/B4+mhrKCupQ+IgD2VpbAhdxcFxP8/xQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CY5PR12MB6202.namprd12.prod.outlook.com (2603:10b6:930:25::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 21:33:53 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 21:33:53 +0000
Message-ID: <7213aa5c-7129-4a3f-acbf-ab922f0f6cac@nvidia.com>
Date: Tue, 14 Oct 2025 08:33:45 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [v7 11/16] mm/migrate_device: add THP splitting during migration
To: Zi Yan <ziy@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, akpm@linux-foundation.org,
 David Hildenbrand <david@redhat.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
 <20251001065707.920170-12-balbirs@nvidia.com>
 <FB8D8651-639F-4882-9868-7FA0A8B62397@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <FB8D8651-639F-4882-9868-7FA0A8B62397@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0065.namprd11.prod.outlook.com
 (2603:10b6:a03:80::42) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CY5PR12MB6202:EE_
X-MS-Office365-Filtering-Correlation-Id: a50615ae-a995-4931-4ba2-08de0aa034c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|10070799003|366016|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTZsd3I3RDhZTVY0U1g5elFILzlsWUlxTnc4RjhOb0haS0N2dzhLZWN5S1Zk?=
 =?utf-8?B?V3d4TFIwakNqYkZtOGlxZWd4UHhkTjYvMEZLL01oZUpIeDlOaTFlM0JPclhU?=
 =?utf-8?B?aW9OZHhRcXMzYTJmeUZRSjJjN1AxMU51cHlMQ2JpYU9xc2hXUElRUGM3eGhV?=
 =?utf-8?B?THg5YnROajlPNG90S2hmcVBkMmh0d1FaTWwvWEMvVlZTY3lsSzZaYkxuSmRZ?=
 =?utf-8?B?K3lZMGk5US9EUHhtSTVqaXVOdHQ5dG9sSDNpZ3YwUEgzUnRxd1hNM3lnSUtn?=
 =?utf-8?B?ZlRMdVMzZjVaclhxbEM3MnZWRTVRK0gyUVN4WXpobkdUQXZxcFZJeExBSUNm?=
 =?utf-8?B?ejByak1GMVN6azlKUEJMVHR6dTEyalA2UCtpMzBybnhDeU9jNzJPekk2T1BE?=
 =?utf-8?B?TFhPYXhvM2N5cVZGd1NMWlZVVnVkbFArV1A2cTc2SzZJclRmYlk0cXlETmFY?=
 =?utf-8?B?REh3NnNXbHZUTWNjcWppOVVaUEtPb0M5eFJRaDZUcm5IcnpnK1VmVHNaVjQ4?=
 =?utf-8?B?Um1uV202dmF5TUF0ckgxb2JCTFpJYTh4aDk1NkFiVi9YaXRVQkp6cGVRWXNH?=
 =?utf-8?B?bWJkdjE1RDRmV2R1Q1kzNWhqMitkbzMvanRGRmNsMlhQUHBObk1TQVh4eDls?=
 =?utf-8?B?d2l5UDhRbmp0KzBab1g1a0V4YmJsdFhhVHVGK0lkZzdYR0FzZU4zWXEwRExx?=
 =?utf-8?B?TmJ6bzBMNWxlQWQ3c3MwZ0xQYXJlMkJhNStzdmNRdE1XRGphanB3cy9aM08x?=
 =?utf-8?B?MHJPTHJGOHNXY2FRTlhRbUZMQ2JkYitYU0VRa0ludndBbXNOTmpqOHRRd3Nu?=
 =?utf-8?B?NDhjdTJDMWoxemRDWG1xNGxia3puMG01S3BaM3hySkcrZVdYMkgzVmFjSCtr?=
 =?utf-8?B?MFJIUmpMQ3lFSDVNMHdqbzdtVTlTTUxPMWJqdXNNYTNvUmRjQkV1SEVRaWFE?=
 =?utf-8?B?MkpKR2RWQkVEeThoVHhEN0hLenFOdVNJWHF6L0llNG1jaTNKVW9GMG85Tmxm?=
 =?utf-8?B?Y1dla0FIaUdHQ0E2TTZSa2pIazhxQjVLSUVzYU5GR1E3V0RpV01VdTNhKzJu?=
 =?utf-8?B?cktnRmt0eW9TYm1pSzdpenA3cHNzR1djYlNQcldaZzhRUzVTMUZWUmYzbTZ4?=
 =?utf-8?B?bkZFd0pNUXRzVGRyamlMT1JpTGNiRVU4d2JWU1JuNGZsYUpiR29rQW9TaWhP?=
 =?utf-8?B?MDQ1MUR0d2dJZnlMWWRjaDN0WmJRcWxYQmVqTUV2K3hIMHRaSSsvN05VQkdO?=
 =?utf-8?B?MmRoV0ozSGlRNlZZQ1VXcWJvMGM0M0hlUEN1Sncxai9GVDBuNTY5ajBETGhP?=
 =?utf-8?B?Vzd1YnlkME90YXZ0L3gwTzFXM3Jna2xQUklPUDFKQUFuaGtWc1BydEpnV00y?=
 =?utf-8?B?b2FxVzl2M0Z6bnF5NTV6S0kvUTV3UlZVMHR4aW5RY0FnSGx5TnY0VjVmeTM5?=
 =?utf-8?B?b2oyL0QzYzh1LzBDdHEvQVduMEVlbk1Md1RvN01ETWxLWTVSbEFzUk40ckRn?=
 =?utf-8?B?Zm9jTklCb21GT0hRMG1Bb003NTNWZW55L3lDKzQ4V0lQS2M1MmNnUXJZdWF4?=
 =?utf-8?B?d0N1ekR1TjJINmRLVmdzZ1VueTF6OFZTcTNFLzU1czRnaGxXcll0cTNEc29t?=
 =?utf-8?B?c3FOUnBmRzdiTFg1TUEyRWhHOUNsZTUyazRtRi8vUEFySi8vQ3ZLc21vYkdU?=
 =?utf-8?B?WWFSMEVqZVhyTitHbEtUTm05bzR3Z1k2V3U4RDlwejRCc3IrczA5QnY0TE1I?=
 =?utf-8?B?K3hKRFh5bS83Mlo1L2lXZGNaTFI2blBIVnpyQ1dSdjJrREtXK3ZRdlFzQTZB?=
 =?utf-8?B?QWc3V0FvUEE1SDFOTGhCbDRwODNmUmpwdmNGR3l3T2JKRC9POGc5ZjlpQ3dE?=
 =?utf-8?B?M3RBK0tGL0NUQXc4SW5uOGZEL1NzWnphRWd6OXhUTHlXSzJPbzBROHMvdTJV?=
 =?utf-8?Q?j02HZvDIjBTgqDBu8HUrdcCKaTB5HoK7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(10070799003)(366016)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekpab3dKVHdWc2x1a1czaFVvMmFBRGJGOUdkcmQ4SDBHYml6Q0VWdFpSSUxJ?=
 =?utf-8?B?Uk9uVUd5ZXZPOFFmYkhwSVp3VnVISUFERDVqNG1WYklZZGZwNGRVRDhLd1pR?=
 =?utf-8?B?Z00yVnFzY0s1ellpeEd1cHN1YmNQRWF2YU85dzZLbkpUWU1CcGFTYTl6MVVN?=
 =?utf-8?B?SDY0NmlHN2ZzYWs4djNZanpaQ3cvc1R3MGh5bWd5NThRSmxHL2xoSXpxODVW?=
 =?utf-8?B?TXNsZ0tPYll0aWQweFJpa1VPQ0IvV2VQVTM0ZEZlOHgvWm1VdWthT0hFRHZ4?=
 =?utf-8?B?N1pwMWk5dkc5UDdCWHE5VmRmOWYyYWI0c2c5Kzc4RldBMDBRM1AyeUpiUXlJ?=
 =?utf-8?B?WmZkdSsrT1BSSGNCMjN3TnlzZHRTYlVLQjRwVXZnMUZsRGlGR1N1di9OUDEz?=
 =?utf-8?B?Ujc2clNxbGtaWUk5Z3V2andtQUdNWG5jOXFtT0Nkd1pjc1VOS3BjY1pIV3p2?=
 =?utf-8?B?b3g1ZnRnaWI4aDZkcytSTHMvVWxPbjYzakxzQUU4T1c2dFFQQWFlU0RaWDJI?=
 =?utf-8?B?aVhhMnBNZFUvSXJFN1JGNWpRK2RqVWxiR2k3NS9ldzZRY1NGMldzY2hPQ0xM?=
 =?utf-8?B?M0o2ajRDRDNQVHBSdzJtOXZIUHNOR2FDOUwrK2VNRlBjR011Q21jbjRTTVBQ?=
 =?utf-8?B?M3FoM1k1UkY2c0t4UHZ5d0pJQTFUWVVBa2dhNWxTL2p5MGRoODI4NjFmbWJh?=
 =?utf-8?B?TWJIeFBTUVVRWXIxdGg5eTNHYXdJelFCOStCcDNpbWVFV0ZTRHlmeFZPNmJB?=
 =?utf-8?B?T1Q1OXk4Q2pWWksrblc3alBQN2VZQWtmQ2xzaTVDRndxWUgyME83NjZxQjFz?=
 =?utf-8?B?S3ZzR3lRZkhHTlVWMHJkdmR2YnBIc0pmemg4RFhhL1RjSm50WU03NWQ0WE5V?=
 =?utf-8?B?cWI5NlRCM2RsOS9YWHNsb3BUUnd4NTRGRmRaMElhK21vc1dPOTRXQWNlWktR?=
 =?utf-8?B?UFpUYWlQUDk0TUhleGhEaTUxZ1YxL0xjK2ZZaXVsUUpUTWZOVEhhNCtuR1dk?=
 =?utf-8?B?dDhkS0hCOUwyL3l6UVYyb2ZaUVBqSkJEaEY5dFZqNVdVSlRXVkc5aDAyMGhs?=
 =?utf-8?B?Q2g4RzBQZlloSWozbTI1djdEbVJ5TnBQVFN0djRSTGxGTTBqa0Zxc1ZJWkVt?=
 =?utf-8?B?eHFSQVRxRDE2Skpja1plUFFBY3I0QkNpd1czOFpBOE92Qnc4dnhydjhxb2da?=
 =?utf-8?B?ay9TUmIxUmRiTWJabmJBeURTemQ1aGNIOHF2Sm8reGhLcjdaK0daWVZDVlNr?=
 =?utf-8?B?TDFtTVRPdENqSzdnS1dWcXJnTlV1cVlwZzcxU2NQNU4vdVUrUkZIN2VOSElH?=
 =?utf-8?B?UXBUT2hUa2todi9wUmRzaFdkUmZtSDk5NWh5MU4xY0cyOTBiSXVvQk5wTnNO?=
 =?utf-8?B?enFoL01mWnV0YXFPanBCRHBRd1lHRlk1YUVZVmFxRm42U3FkS3VoQWJsYUMx?=
 =?utf-8?B?WVBPZzY0dGtidVdLUUUxb3FGczB2TXBBakREZjJ2SFdHOFQ5NmxUWFR3a2RB?=
 =?utf-8?B?WEN1ZXBYMFJLbmUzcXRnazZudC92NmdjcHJXUjlhM3ExVWxHdUJkVTlFditK?=
 =?utf-8?B?T3dhaHVoTlR3QTlPT2s2cTgwS1QydkRZY0hHeU8yaWhKWFF4MlNQWXBNOWxn?=
 =?utf-8?B?c1hISUsrZFJYZWR6L3JWZytpV2xQWVNqQXFrdDdhei9UYnh2b3BrN1g1NmZN?=
 =?utf-8?B?YzlhdG1EdmpoYmpNRFV6bStySnc3OTNXZlFsVmhjcE5BcmNiSEJpWW0xUmhF?=
 =?utf-8?B?SHhtRjdaL0FyMTNocUNEN3FDNmlLZUVXbXRKL0dJVVdZRXpHQ1hwK09lUjE4?=
 =?utf-8?B?UUJpbWJZWEl1RnB0T1ZxWDdPS04yUjB3K0ZEZEpveFRiNnlkMXBNQVBCOURm?=
 =?utf-8?B?M1h5aCtyWXFCK1ZiblVnL1VpK0pVL0ZQUXY3ZnFlK0luQjlZc0lVcGNHejJ3?=
 =?utf-8?B?VWJtc1IrYU5LMmd0cWFYNy9LZ0tKQ2c0VXpyQkgzbGVxOWo4c2VWMjJnQUdW?=
 =?utf-8?B?RnA5VmZSS0dQUXpVTUdMNThZUWN4UDV3TUdRbW44dW1nR04rOFRvV053a1Ra?=
 =?utf-8?B?bVNsUXJVWjFmYzdReHFxK0M2MjN0MERnZzBSSVovWU1iSUduQmVERVRvL1F0?=
 =?utf-8?B?RXprQlpoREsxa255ZVpuL3JpNCsrNlgrS05PNGFhS1F1cC9YK250TTZ4Y21a?=
 =?utf-8?Q?UjnqnWRaIPOyADkKvR+QfjAjaFNHcNEmFH6xO0bbttRr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a50615ae-a995-4931-4ba2-08de0aa034c1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 21:33:53.2812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwD+P7q6QC9YzE2Ac3iy7arVLrBs49C4TgySyXY4kYK019Fg9yM/OrLih1DgS8rj/tB0IeOJAlGw5V04+dMdAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6202
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

On 10/14/25 08:17, Zi Yan wrote:
> On 1 Oct 2025, at 2:57, Balbir Singh wrote:
> 
>> Implement migrate_vma_split_pages() to handle THP splitting during the
>> migration process when destination cannot allocate compound pages.
>>
>> This addresses the common scenario where migrate_vma_setup() succeeds with
>> MIGRATE_PFN_COMPOUND pages, but the destination device cannot allocate
>> large pages during the migration phase.
>>
>> Key changes:
>> - migrate_vma_split_pages(): Split already-isolated pages during migration
>> - Enhanced folio_split() and __split_unmapped_folio() with isolated
>>   parameter to avoid redundant unmap/remap operations
>>
>> This provides a fallback mechansim to ensure migration succeeds even when
>> large page allocation fails at the destination.
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
>>  include/linux/huge_mm.h | 11 +++++-
>>  lib/test_hmm.c          |  9 +++++
>>  mm/huge_memory.c        | 46 ++++++++++++----------
>>  mm/migrate_device.c     | 85 +++++++++++++++++++++++++++++++++++------
>>  4 files changed, 117 insertions(+), 34 deletions(-)
>>
>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>> index 2d669be7f1c8..a166be872628 100644
>> --- a/include/linux/huge_mm.h
>> +++ b/include/linux/huge_mm.h
>> @@ -365,8 +365,8 @@ unsigned long thp_get_unmapped_area_vmflags(struct file *filp, unsigned long add
>>  		vm_flags_t vm_flags);
>>
>>  bool can_split_folio(struct folio *folio, int caller_pins, int *pextra_pins);
>> -int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
>> -		unsigned int new_order);
>> +int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
>> +		unsigned int new_order, bool unmapped);
>>  int min_order_for_split(struct folio *folio);
>>  int split_folio_to_list(struct folio *folio, struct list_head *list);
>>  bool uniform_split_supported(struct folio *folio, unsigned int new_order,
>> @@ -375,6 +375,13 @@ bool non_uniform_split_supported(struct folio *folio, unsigned int new_order,
>>  		bool warns);
>>  int folio_split(struct folio *folio, unsigned int new_order, struct page *page,
>>  		struct list_head *list);
>> +
>> +static inline int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
>> +		unsigned int new_order)
>> +{
>> +	return __split_huge_page_to_list_to_order(page, list, new_order, false);
>> +}
>> +
>>  /*
>>   * try_folio_split - try to split a @folio at @page using non uniform split.
>>   * @folio: folio to be split
>> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
>> index 46fa9e200db8..df429670633e 100644
>> --- a/lib/test_hmm.c
>> +++ b/lib/test_hmm.c
>> @@ -1612,6 +1612,15 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
>>  	order = folio_order(page_folio(vmf->page));
>>  	nr = 1 << order;
>>
>> +	/*
>> +	 * When folios are partially mapped, we can't rely on the folio
>> +	 * order of vmf->page as the folio might not be fully split yet
>> +	 */
>> +	if (vmf->pte) {
>> +		order = 0;
>> +		nr = 1;
>> +	}
>> +
>>  	/*
>>  	 * Consider a per-cpu cache of src and dst pfns, but with
>>  	 * large number of cpus that might not scale well.
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 8c95a658b3ec..022b0729f826 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -3463,15 +3463,6 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
>>  		new_folio->mapping = folio->mapping;
>>  		new_folio->index = folio->index + i;
>>
>> -		/*
>> -		 * page->private should not be set in tail pages. Fix up and warn once
>> -		 * if private is unexpectedly set.
>> -		 */
>> -		if (unlikely(new_folio->private)) {
>> -			VM_WARN_ON_ONCE_PAGE(true, new_head);
>> -			new_folio->private = NULL;
>> -		}
>> -
>>  		if (folio_test_swapcache(folio))
>>  			new_folio->swap.val = folio->swap.val + i;
>>
>> @@ -3700,6 +3691,7 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
>>   * @lock_at: a page within @folio to be left locked to caller
>>   * @list: after-split folios will be put on it if non NULL
>>   * @uniform_split: perform uniform split or not (non-uniform split)
>> + * @unmapped: The pages are already unmapped, they are migration entries.
>>   *
>>   * It calls __split_unmapped_folio() to perform uniform and non-uniform split.
>>   * It is in charge of checking whether the split is supported or not and
>> @@ -3715,7 +3707,7 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
>>   */
>>  static int __folio_split(struct folio *folio, unsigned int new_order,
>>  		struct page *split_at, struct page *lock_at,
>> -		struct list_head *list, bool uniform_split)
>> +		struct list_head *list, bool uniform_split, bool unmapped)
>>  {
>>  	struct deferred_split *ds_queue = get_deferred_split_queue(folio);
>>  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
>> @@ -3765,13 +3757,15 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>  		 * is taken to serialise against parallel split or collapse
>>  		 * operations.
>>  		 */
>> -		anon_vma = folio_get_anon_vma(folio);
>> -		if (!anon_vma) {
>> -			ret = -EBUSY;
>> -			goto out;
>> +		if (!unmapped) {
>> +			anon_vma = folio_get_anon_vma(folio);
>> +			if (!anon_vma) {
>> +				ret = -EBUSY;
>> +				goto out;
>> +			}
>> +			anon_vma_lock_write(anon_vma);
>>  		}
>>  		mapping = NULL;
>> -		anon_vma_lock_write(anon_vma);
>>  	} else {
>>  		unsigned int min_order;
>>  		gfp_t gfp;
>> @@ -3838,7 +3832,8 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>  		goto out_unlock;
>>  	}
>>
>> -	unmap_folio(folio);
>> +	if (!unmapped)
>> +		unmap_folio(folio);
>>
>>  	/* block interrupt reentry in xa_lock and spinlock */
>>  	local_irq_disable();
>> @@ -3925,10 +3920,13 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>
>>  			next = folio_next(new_folio);
>>
>> +			zone_device_private_split_cb(folio, new_folio);
>> +
>>  			expected_refs = folio_expected_ref_count(new_folio) + 1;
>>  			folio_ref_unfreeze(new_folio, expected_refs);
>>
>> -			lru_add_split_folio(folio, new_folio, lruvec, list);
>> +			if (!unmapped)
>> +				lru_add_split_folio(folio, new_folio, lruvec, list);
>>
>>  			/*
>>  			 * Anonymous folio with swap cache.
>> @@ -3959,6 +3957,8 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>  			__filemap_remove_folio(new_folio, NULL);
>>  			folio_put_refs(new_folio, nr_pages);
>>  		}
>> +
>> +		zone_device_private_split_cb(folio, NULL);
>>  		/*
>>  		 * Unfreeze @folio only after all page cache entries, which
>>  		 * used to point to it, have been updated with new folios.
>> @@ -3982,6 +3982,9 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>
>>  	local_irq_enable();
>>
>> +	if (unmapped)
>> +		return ret;
>> +
>>  	if (nr_shmem_dropped)
>>  		shmem_uncharge(mapping->host, nr_shmem_dropped);
>>
>> @@ -4072,12 +4075,13 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>   * Returns -EINVAL when trying to split to an order that is incompatible
>>   * with the folio. Splitting to order 0 is compatible with all folios.
>>   */
>> -int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
>> -				     unsigned int new_order)
>> +int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
>> +				     unsigned int new_order, bool unmapped)
>>  {
>>  	struct folio *folio = page_folio(page);
>>
>> -	return __folio_split(folio, new_order, &folio->page, page, list, true);
>> +	return __folio_split(folio, new_order, &folio->page, page, list, true,
>> +				unmapped);
>>  }
>>
>>  /*
>> @@ -4106,7 +4110,7 @@ int folio_split(struct folio *folio, unsigned int new_order,
>>  		struct page *split_at, struct list_head *list)
>>  {
>>  	return __folio_split(folio, new_order, split_at, &folio->page, list,
>> -			false);
>> +			false, false);
>>  }
>>
>>  int min_order_for_split(struct folio *folio)
>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>> index 4156fd6190d2..fa42d2ebd024 100644
>> --- a/mm/migrate_device.c
>> +++ b/mm/migrate_device.c
>> @@ -306,6 +306,23 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>  			    pgmap->owner != migrate->pgmap_owner)
>>  				goto next;
>>
>> +			folio = page_folio(page);
>> +			if (folio_test_large(folio)) {
>> +				int ret;
>> +
>> +				pte_unmap_unlock(ptep, ptl);
>> +				ret = migrate_vma_split_folio(folio,
>> +							  migrate->fault_page);
>> +
>> +				if (ret) {
>> +					ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
>> +					goto next;
>> +				}
>> +
>> +				addr = start;
>> +				goto again;
>> +			}
>> +
>>  			mpfn = migrate_pfn(page_to_pfn(page)) |
>>  					MIGRATE_PFN_MIGRATE;
>>  			if (is_writable_device_private_entry(entry))
>> @@ -880,6 +897,29 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
>>  		src[i] &= ~MIGRATE_PFN_MIGRATE;
>>  	return 0;
>>  }
>> +
>> +static int migrate_vma_split_unmapped_folio(struct migrate_vma *migrate,
>> +					    unsigned long idx, unsigned long addr,
>> +					    struct folio *folio)
>> +{
>> +	unsigned long i;
>> +	unsigned long pfn;
>> +	unsigned long flags;
>> +	int ret = 0;
>> +
>> +	folio_get(folio);
>> +	split_huge_pmd_address(migrate->vma, addr, true);
>> +	ret = __split_huge_page_to_list_to_order(folio_page(folio, 0), NULL,
>> +							0, true);
> 
> Why not just call __split_unmapped_folio() here? Then, you do not need to add
> a new unmapped parameter in __folio_split().
> 
> 

The benefit comes from the ref count checks and freeze/unfreeze (common code) in
__folio_split() and also from the callbacks that are to be made to the drivers on
folio split. These paths are required for both mapped and unmapped folios.

Otherwise we'd have to replicate that logic and checks again for unmapped folios
and handle post split processing again.

[...]

Thanks,
Balbir
