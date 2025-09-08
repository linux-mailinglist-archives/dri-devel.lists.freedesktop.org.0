Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6D6B4816C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 02:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FF810E00A;
	Mon,  8 Sep 2025 00:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HF5pTjWB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2066.outbound.protection.outlook.com [40.107.236.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA0610E00A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 00:05:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPgUSu3TEs5cUQcZIu83MVVk65U0HyYB2214YkHVBjULTlaWyK4ZSdJhPICX4KxRbtFHapfO4mxpQV6FU2S9rEF4qIJ+tslceCM0JFUqcpGOV0S8IR+BEsHZjhG5iF8KD2HmgYgOuPce9x5yv96g3yekCyWoMyPuApWo8AqJFlTUTuPZuGlESeqmt02h84c0HWOOKvOIe8vWMkILVpMyKOxnlPbIUi9yBXtLxfKdubxifoaxS9AuNWdadIOcDFLlmI/D+GkZ65NA4PC07YbCBYS4A13g4ZJcXRZ/nk7FuNyQhJZyIWkcuMK4gaNFubloCQU7mACV9K0i6FDcMoNihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KduL/eN4Rn7FkxByE0KR9hmXpLUKEReTcBKsnJBWJQ=;
 b=xDlDQVUw1SO5wAMXIbqVmUuKSBEHiNC2IxxoRL2WjS0zzZC6K2S72maPAf7Rj/5Afpse4fSuGxJyJQffGOv03Fat6Zs0gFXxN9KcBmKfIKw5dvbTIUar0KR1fRUEbUIKCwRDhlsGVuBrNgaiKiDeRa+b88rK4HC+EpJkDKSnoQSwlfd7kH08fIgZBvU2TuEucwdqQ2zTpllIcnl/nuQq4i4aWqNnPFeqUcHQAnWO3Gil/TAWh8R1M62X4G0Bezlihs+6CpFtzw5xLgByBbk47RRUSSYqFLFR9XfyiphRerOrMhjiSQ+zNjADqUOAf4kMZe3wVhyt9B8JvIHV39Vn4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KduL/eN4Rn7FkxByE0KR9hmXpLUKEReTcBKsnJBWJQ=;
 b=HF5pTjWBvCQaPvRVsLuV3QI6epL3ylQCx+eDb9wZP36zcQ0e+LYXCYCXzWBbsw+7T0gb/0vU9L9ajJlga0dJLic6zODbhVX2RgbDKUtOs+1y2LODhbXSQNoT778eiz2/NNVrgxbPedL3GfhmrcLnYklfL4Bs8gbVuTGMe5fzoBmQa1MX/SjzGNfm0IqyrHbLy+2235yJOl/RK9QKtfFLOtShYpsJQFZTXnxKXi/MYxkv3OTDK4OypzNOvN5CAaLt5AYsaPQUB7nF4+8WiTh4Bwri79fnMw2yrOCCpFEQsB3SUjFFqljPLuDb4Fsip2DgyqqyjTzx7/qLtcR6QoQJ9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS7PR12MB5887.namprd12.prod.outlook.com (2603:10b6:8:7a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.19; Mon, 8 Sep 2025 00:04:59 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 00:04:59 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [v5 01/15] mm/zone_device: support large zone device private folios
Date: Mon,  8 Sep 2025 10:04:34 +1000
Message-ID: <20250908000448.180088-2-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908000448.180088-1-balbirs@nvidia.com>
References: <20250908000448.180088-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:40::15) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS7PR12MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ccc3225-bb85-49df-1081-08ddee6b59da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3NwRGljdGJqQk8zaHdXaGo4V0JMRUVZS0tid2RrelNndmVGakJGWGhyYWJB?=
 =?utf-8?B?VFNHSlpsOEdBbWhvaXhwQ0V4WFBWRVRaWmM5WVdzTEUzbEFtRXJ1U2FvaGZa?=
 =?utf-8?B?dXVmTTRnYXZuVHdSMnRvdHVMVDlRcGh0NFQrSWNSWDh0ZGNXZE5HUXlla2h5?=
 =?utf-8?B?YkFpbm9EOU1ESmZBTXFVejlKNjd6NHdReXZ2djhpQlI0aEk3R2pHS2UwYU5X?=
 =?utf-8?B?WC9leGYrQlNYM1M0a055YmRocUNDU2VrY2Z2bEhhbWU5S1hqeEc4eTVVaG5B?=
 =?utf-8?B?QWhudmtlVEtEQ09nZWZyZGs4MlhnNmtRR0EzaGhpenB2Ui9EZ1RoaTdaTndK?=
 =?utf-8?B?bmFybDlVUnJ6N2EzK1NGMGY1c1o3Q3pDa3dPdXVkc2dWV29OMmhJVUxXSDhv?=
 =?utf-8?B?bHVhbjkvOVNiS3hPRVV6Znd0TS9acTl4cUhOS2JscjJ1RERHbk9kRlNKa1Jr?=
 =?utf-8?B?MXFiWEJOUXIzL2UrK0RFOG9laXlVaXV4U1NmYWZqblh6dTQ5ZW5hNjQveEpp?=
 =?utf-8?B?RHlhcGc2cm45L1RsaUo2R0NzY3BaUlJOSDFpR1NUN24rd2VDRjdDaUpGa3Nu?=
 =?utf-8?B?Z2VoMkM5T0tFNk5tdHpYS1AveUtEcS9wSDdMdGxFZVQzeHNHVUFDT3FuZnhR?=
 =?utf-8?B?TXdlZ1dOdHVTMEI0YThWTUI4MCtSTi9CNDFMbEpQOHZUU3VQK2VxZFpCSEYv?=
 =?utf-8?B?MGZpR1huU01rMitnMkY5YkhPT0F5Y1BJUnlPVmlBYldWcFhUK1MreVB5VFRO?=
 =?utf-8?B?aUw1SDVmVUJOVVJOQjU4YU9ZU0lyUkNRTUJvaXFFYmEzNXlHVlNBYWpKSmhG?=
 =?utf-8?B?Wis5T0FQYVpqbUFmQUdEYm1lUlpnVFA2WUQvK1VsaEZEZEZJbVlVT2p5Smls?=
 =?utf-8?B?NGdWZGVZN0dXck1DZDlYbVpBZ3VhTXE3ZnpieWduTjM1WnIxR0dBUXROVGVx?=
 =?utf-8?B?cGdFZkFPVXF0anVBeWVWRlpGeVZJTm5mcTJzZEpzQ1VLQW41RDJVZVpySi9u?=
 =?utf-8?B?QXFsSmE1N2t2dWFwQnhBWElKT25mRGx4STBSUTdiQ0ZwcnB4Z2VmQ25rdG5m?=
 =?utf-8?B?bkN3T2QvUmhrdENjeWhwdjBrRG01N3ZaNW9IeW55K0NBeWtMV0UweDZZNEw4?=
 =?utf-8?B?N1paTE4zY09BbG9vWkxlWFFHN0lwczBzeUg5dXYzVktrOFowM3FFVmwzMHBM?=
 =?utf-8?B?YVhkK0w4anN3NFdFNFFqUFBrck1nYks4dlg3am83NjdMME02bUM2aTVuZHNG?=
 =?utf-8?B?QUlWbm5maWIxODF1VmJmSzFYT1VWRU9LNnd0VTAzQ2xZZW05L0hnTGF2TzdZ?=
 =?utf-8?B?cG1DR01DWGpHYTd2YVZhYlN5WTgxU2lrRzlYT2U5ZHlrSkRZZ2IrU3VCUWFi?=
 =?utf-8?B?ajUvR0xIUXhzKzd4aVlEZW5CSm1LdElSREp6a1NydGVZM3Vua2RmbUcvMERF?=
 =?utf-8?B?b242NXRaMjd0UmRxREc1SitFMitvTXhZUnJnS0pwbGY3RGRLTkpJM1JIRWg3?=
 =?utf-8?B?RVNlRHFZckhoYUkwQlhMSWltSU9hYnlDaWI0d2RzckZYMFRBTUh5V29Eallt?=
 =?utf-8?B?SC9mSDgvZHR3TnJ2RFZJMEZVZkpoTnpIRThPaWFMa2xJRVp6ZUlxU0xiWDhS?=
 =?utf-8?B?YjQ0YkpYM28zbU9IZmJHK2xoR3RlRVBTd0NlL2tXRDhZSjdoeEg3MTVDdmQw?=
 =?utf-8?B?dHozeXFVV0toY2N1MHFxMG92WmkvRDhYMFNOTVVXaFJ4aTZYdlNvVi82T05I?=
 =?utf-8?B?Y0pGRVFQWU5RMjgvR1MyYm9yMTVySXJwTnZwcDgramh0MGxjd3dUSlJhcE9t?=
 =?utf-8?B?d1hRc25rTlVnWHlOKzkwc1grMTQzakdtWTdhMk1TTVJiNFpKRkJWYlErTmNZ?=
 =?utf-8?B?c0pWcWhlZ1QvSjFqTjBLQjNwcjBDSmgzWmdLUVBKUHZuQVB1ZHpHc1hJSHFw?=
 =?utf-8?Q?c6wL2gDFOGA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czBsMjlwdU1tVWtzRTRmd3AyNXBqcjhNV2pVMVVQY1pVTmRNQ2p4RVdxNXl2?=
 =?utf-8?B?dDhZdmNOT3R2OW9Dd2Q2SS9ZaURjdkJxQXZCQ0J2NEEwa0F1eDYySnI5d2o5?=
 =?utf-8?B?ZE91bllYdmFXQjJCcDdLaWNpV0xvNXppbGYvZk95YWV0WWJ6NU1FMW0vaEhO?=
 =?utf-8?B?NllNU3Z2VXhRaUUvWDZBVW5haHlocjN6TEUvQWVUQk50czZBMWh4azRzL3Qr?=
 =?utf-8?B?Zlo1NjRlNVVIUEx6VUJ2S3dyeTFvQ1lDclJETGhKUXl1bGlrbVJIczZydmhi?=
 =?utf-8?B?VHNENW9yNENUMVJuMUdZOXBkRmRyemx1ZDcvWW8rT0RKeHc4WUlPWGRsdmdC?=
 =?utf-8?B?dWlvS0ZaYVQrRTMxUXlpc0ZlZDRMRGpLZ3VPZ1BHQU43ckJ1YXlzWmdVaVMy?=
 =?utf-8?B?RGMxdWMxNzRhOGlURVBxV255QjFIZ1kxKy91dm5GQVUvaTlyK0VlZXFzenZ4?=
 =?utf-8?B?YVJsNitWdW1JSnVVOW8zRkc4M1lsdUVwQW9yWVVkSGE1eW5iTXlBS2JzNXQw?=
 =?utf-8?B?UUo1RlNtR0szRzgzYTVvWVVxQVV5M1pGMVZDVkJRaHZiNWd4aWNWb0RUS0Nq?=
 =?utf-8?B?WGYxcWVxQ0g0cnkxYnZIQVZRV3FoZ0ZLY1hXNUJ0YXlTQ3p6Y21SbWpjam5X?=
 =?utf-8?B?T2dhMk9qSStteDE0NTRIVjdDeTJheExQNTVxQ0tnQ0VMYSsrZE9LaWRsL1hv?=
 =?utf-8?B?S3dlYUNlbkUrVlVDcEhjUURDdWR0OGQ4S1BJQ2VYYmJhVUhtTm1JUTM0Y05T?=
 =?utf-8?B?S3FJNmdHa0JLaCtTY2wraGc4SHpIdzJtdGpVRTI3c3N1TzgxNk5WMnhFZCt4?=
 =?utf-8?B?SFRIZ2Vnc1RmMVRqbUdHZnVsK2pGSnl6WXpVcUUwSS9LMDUrOUVkbi9WK2Ft?=
 =?utf-8?B?Ny93NG5ZZ3Q4U2RwVjBrdVprRlA2Wmh1MGZESnJRcGg1Y3lKblh0RzZDQUJi?=
 =?utf-8?B?MWZuazUzdW9zY0JBb1ZiVnFjZTZaVlNkYk43NjY2a1ErKzFuOHlYL1FYRmRk?=
 =?utf-8?B?OGJKbXFnNlk2QUdKdHJWT0dEYkEyYXh5WjIxS0IyRGhJSUJRdXFhUUVRYStG?=
 =?utf-8?B?V2JQVkNyQWdDRElueG5kSE1lZ3ZuZWJpdjdHeVFhQ3Y5ZGRMeUFuTzhGaC9H?=
 =?utf-8?B?cXlvKzFJOXZ0a0JsdVc4eFd4SVAyZURqeHNURndVbUV4SW93Y0xVMk9sSWdi?=
 =?utf-8?B?TkFYblUzaGx4MXBNdnk5ZWV3K2ZKZkZ6MDQ4bmUwN1VWWVRnTWt1SkdHNWFs?=
 =?utf-8?B?TkZjTi92bmtCZ0NIUmZqMVQ2L3paL1YvMEpZd1NYWWhHMHg2bUJxNDJMZTdp?=
 =?utf-8?B?SWJHOVNrRk1CaHl6eGdRbjRob1I5dEVMd1BLL2ZIaS83a253bUJGWWxOVE9B?=
 =?utf-8?B?bjF3Wm5zTFJQVGZnNUFFR3B1MVZpOGZXZmZ3ODNudnhCL1IvRmpha3M4SG9D?=
 =?utf-8?B?S0pMWUV4K0hLWksrWEoraEZoanBwRUVBQzUyMEp1NyswSWlmMjlDYTIyaEp3?=
 =?utf-8?B?RzZ3UEdsV1YvS1VJbkg1clpNVHVpMFZJMnNJTDRVRmhyU0xLdG9hM2FyazUy?=
 =?utf-8?B?R2orRUdPVlZuNWtnMkxjS1RENU53Skp1OFhuV2lCUnd4NTZ3WHdlU0h1T3Jh?=
 =?utf-8?B?RCs5VC9SN3UyOTRoMjhPTVh6ZFpWK0FUSTRKczcwcTJoOWlDcktkK3N6UTlZ?=
 =?utf-8?B?ZDZMS3NCTGt1ZmEzTnVJSEF1NDBIZ09KYXZmUER4eGpDVW11TFlvWEU4Y01W?=
 =?utf-8?B?QWc3MXVWbldSaGxZbCsveHpJMHU3UUs2bVYydmgxQXRPZU5nU0FINytlUVJ1?=
 =?utf-8?B?NDdPTmU3WEtTZWYxT2VFTkdSdXlUZWJVR2xwN1V4R25GQ1N5ejR2Y01HU1Q2?=
 =?utf-8?B?elVIbTVsOVNwcG1XZUE3T3lNa3BZalc4VkczbkpHSHFGWS85Q3o2TzJIVUJ2?=
 =?utf-8?B?ZU1IQWRwRGFPNEpZKzJqRWJrUlRHVkdGbEJWWUpQdlNRaXpEZXJrMkl4Z1Jl?=
 =?utf-8?B?U09xdmNQR3hlWFBTbW5rWlB0cUpkeTZUM0x2RERIb1BrOTNITUd4eXNhajBI?=
 =?utf-8?B?WnhtOUplOUU0UXVqbDNObWZvaTcyeGsxa0JUenQ4cHJHVDNxdGFSQkpJQTND?=
 =?utf-8?Q?qz/dMvasKZEkYFz2JC8xO/sRJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ccc3225-bb85-49df-1081-08ddee6b59da
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 00:04:59.5923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3MweW6blOOzgcPIGHGXfnE70qOsrqbAkmHfM2hCh91FlsYL/06SxzcRQfT9g5tumcMwI/bwGkJKKS6pXh9D5zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5887
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

Add routines to support allocation of large order zone device folios
and helper functions for zone device folios, to check if a folio is
device private and helpers for setting zone device data.

When large folios are used, the existing page_free() callback in
pgmap is called when the folio is freed, this is true for both
PAGE_SIZE and higher order pages.

Zone device private large folios do not support deferred split and
scan like normal THP folios.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Mika Penttilä <mpenttil@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 include/linux/memremap.h | 10 +++++++++-
 mm/memremap.c            | 38 +++++++++++++++++++++++++-------------
 mm/rmap.c                |  6 +++++-
 3 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index e5951ba12a28..9c20327c2be5 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -206,7 +206,7 @@ static inline bool is_fsdax_page(const struct page *page)
 }
 
 #ifdef CONFIG_ZONE_DEVICE
-void zone_device_page_init(struct page *page);
+void zone_device_folio_init(struct folio *folio, unsigned int order);
 void *memremap_pages(struct dev_pagemap *pgmap, int nid);
 void memunmap_pages(struct dev_pagemap *pgmap);
 void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
@@ -215,6 +215,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn);
 bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
 
 unsigned long memremap_compat_align(void);
+
+static inline void zone_device_page_init(struct page *page)
+{
+	struct folio *folio = page_folio(page);
+
+	zone_device_folio_init(folio, 0);
+}
+
 #else
 static inline void *devm_memremap_pages(struct device *dev,
 		struct dev_pagemap *pgmap)
diff --git a/mm/memremap.c b/mm/memremap.c
index 46cb1b0b6f72..66f9186b5500 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -416,20 +416,19 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
 void free_zone_device_folio(struct folio *folio)
 {
 	struct dev_pagemap *pgmap = folio->pgmap;
+	unsigned long nr = folio_nr_pages(folio);
+	int i;
 
 	if (WARN_ON_ONCE(!pgmap))
 		return;
 
 	mem_cgroup_uncharge(folio);
 
-	/*
-	 * Note: we don't expect anonymous compound pages yet. Once supported
-	 * and we could PTE-map them similar to THP, we'd have to clear
-	 * PG_anon_exclusive on all tail pages.
-	 */
 	if (folio_test_anon(folio)) {
-		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
-		__ClearPageAnonExclusive(folio_page(folio, 0));
+		for (i = 0; i < nr; i++)
+			__ClearPageAnonExclusive(folio_page(folio, i));
+	} else {
+		VM_WARN_ON_ONCE(folio_test_large(folio));
 	}
 
 	/*
@@ -453,11 +452,15 @@ void free_zone_device_folio(struct folio *folio)
 
 	switch (pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
+		percpu_ref_put_many(&folio->pgmap->ref, nr);
+		pgmap->ops->page_free(&folio->page);
+		folio->page.mapping = NULL;
+		break;
 	case MEMORY_DEVICE_COHERENT:
 		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
 			break;
-		pgmap->ops->page_free(folio_page(folio, 0));
-		put_dev_pagemap(pgmap);
+		pgmap->ops->page_free(&folio->page);
+		percpu_ref_put(&folio->pgmap->ref);
 		break;
 
 	case MEMORY_DEVICE_GENERIC:
@@ -480,14 +483,23 @@ void free_zone_device_folio(struct folio *folio)
 	}
 }
 
-void zone_device_page_init(struct page *page)
+void zone_device_folio_init(struct folio *folio, unsigned int order)
 {
+	struct page *page = folio_page(folio, 0);
+
+	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
+
 	/*
 	 * Drivers shouldn't be allocating pages after calling
 	 * memunmap_pages().
 	 */
-	WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
-	set_page_count(page, 1);
+	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
+	folio_set_count(folio, 1);
 	lock_page(page);
+
+	if (order > 1) {
+		prep_compound_page(page, order);
+		folio_set_large_rmappable(folio);
+	}
 }
-EXPORT_SYMBOL_GPL(zone_device_page_init);
+EXPORT_SYMBOL_GPL(zone_device_folio_init);
diff --git a/mm/rmap.c b/mm/rmap.c
index 34333ae3bd80..236ceff5b276 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1769,9 +1769,13 @@ static __always_inline void __folio_remove_rmap(struct folio *folio,
 	 * the folio is unmapped and at least one page is still mapped.
 	 *
 	 * Check partially_mapped first to ensure it is a large folio.
+	 *
+	 * Device private folios do not support deferred splitting and
+	 * shrinker based scanning of the folios to free.
 	 */
 	if (partially_mapped && folio_test_anon(folio) &&
-	    !folio_test_partially_mapped(folio))
+	    !folio_test_partially_mapped(folio) &&
+		!folio_is_device_private(folio))
 		deferred_split_folio(folio, true);
 
 	__folio_mod_stat(folio, -nr, -nr_pmdmapped);
-- 
2.50.1

