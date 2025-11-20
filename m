Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9C0C744F0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 14:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8354F10E0E0;
	Thu, 20 Nov 2025 13:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JW74XdIr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010054.outbound.protection.outlook.com [52.101.61.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4840110E0E0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 13:42:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXTz15SdFTyxdLzfFfDGJRVbqpeb2OYlPuAv/uKXtkrBjGIQEVZ/nuFGp6HXlhmYuF3zdySUNIB/PAanlDX7RH+kTUXQhIDZCXJfNo1dwItNM0993HSQUGL8ZJ7e96fpyKZuEZCtEjrfMQD0Xdy/E0ZJq/1zxunqyVTIteXokeqaukY98oF0byqDGvF5jNWfamI5xGyN1LQoocsP7LTZJP7MDL2Kp117N729b0gRlVVeh5TcuAL0/9Fu0C3nGpbp02JUl14G6atgmvOBxMBdSPN5gop7d0nISQtvFVjnx3BQGaonLP94dIWBfHWZwWpDRgoM9jqwxoXOVcgLs9QKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4YmhKuAv5Q7ZdObXubb8Dfl5S65V3O8FKK24Uy0zp4=;
 b=HRJduRs2cN61gne3vGz/tgsY8iYCgVbJJQjrqjXXblVhnKcOfbPOX8ruY+m0q2lU3Gc7HcKD9GGgwrCCsaoDzveYoIW4HBVIARSAn/1lKy5CD3l/4qTKs8wBzMwdtHVIC7DCzdTdOUMHP2jwX23OENJ/tOW/5gjfyZcFp+K4CtCddpi1vr3z7o9WLjkA5xlt1htrUi9lkp9S9QIYNFCCAHn75x+TzZ116DYTMccWL2h8lfStsxr4tu85fZ2r45DebNgYRo6b31m5BRRwZBQuenQejulNt+Mno4c3KELlUJM8zlp4iJpBvEBdWVh/EGtoZQ/JEcBYJx9HuLqPBQNelA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4YmhKuAv5Q7ZdObXubb8Dfl5S65V3O8FKK24Uy0zp4=;
 b=JW74XdIrvd5Vq6sP7iD7GFPoCwTUnqryjg/nzblb9bBizMRFUGoRfCHPqgL+AKwmAU64W+FecHtLOe+/rD0VCtL+3XoE+aV6bTnQyasNs8JONHT3WzvwS21S7pbx79oEGdNpjvAvVDeZd3e1n4z91f/UzsHy7c3Y/RyBwHYZrI5ZYwdnCS2J9wz203tY6/zQJNjfajoLBK7+XRvgXJ430mNIGmawG3VPvbQosovnUqxxonoFUZt0cUzjSuPcFRmG32wG7qBX0qsDWKSwztsM3Vf3wgl8vQUi4I8YKJ8pN+gF+rzpkGxAAuoCcYIoKQI/MC3wj6CdqFl5ypPbBe5WFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SA1PR12MB6773.namprd12.prod.outlook.com (2603:10b6:806:258::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 13:42:41 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 13:42:41 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Cc: Balbir Singh <balbirs@nvidia.com>,
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
Subject: [PATCH v2] fixup: mm/huge_memory.c: introduce folio_split_unmapped
Date: Fri, 21 Nov 2025 00:42:32 +1100
Message-ID: <20251120134232.3588203-1-balbirs@nvidia.com>
X-Mailer: git-send-email 2.51.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY6PR01CA0040.ausprd01.prod.outlook.com
 (2603:10c6:10:e9::9) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SA1PR12MB6773:EE_
X-MS-Office365-Filtering-Correlation-Id: 61791de3-7af6-4b34-ea05-08de283aad10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ym1yOWkrWUw2R2hEa1h3VXFrWlVmTXhiWmZKZVZyOXdIRElHY0dvVFVQaXgz?=
 =?utf-8?B?L2ZzdjNzblNJem1ZTmgrekhDR0RjMlFoOHNXWTE4QVpBZ2I3UDMwZ1I4Sk9u?=
 =?utf-8?B?ZEdLR3Q5TWJ5bTBVUTVnNHVjb0dLL2JqQzFwcW1KSmlXdGJIVzl4ZEpDZW1C?=
 =?utf-8?B?ZnY1aXZCTm1qbUp1N0p5Q2RFaFE0djlHdW1zVHo4UkpBc0Z2UkFmLzNjVFUv?=
 =?utf-8?B?UHE0eHhJN1pYdTdhaGMzZEdVUkxhS1dqMlVwbHRsT2JKWnZVc2RlY21GRmtl?=
 =?utf-8?B?R2kzTE1sMTdERmMzVWJEbjNGUkV3aWFTQkRaV0dZRm5DNVFHakZLNXVaQ1dZ?=
 =?utf-8?B?VllaK3M3STZHVWdDbWFSOHZFQ0RGczh4Tzh3T3h5Wmo1eTQ1T2I4Q1dVcVc5?=
 =?utf-8?B?bWVMa2hWQmExQ3pFRkd5dUF5NWs0bzRXYjY3UkpXajJoWGVKRHNMNC9IbXk0?=
 =?utf-8?B?VVAwSm1WSThyamljQkdBVTh4T0FXYVhJTHpiNGJiZXdhdWJlOUxteHFvYkRz?=
 =?utf-8?B?Ung3UldYZERuYUdNUUt1cC91dGR0TEFSUjFLejh1UUI0cTMwN2NaMGhQdXJ6?=
 =?utf-8?B?YTdmQWpwb0pKSnc1OG9vNXVwdmZyTlg3cU1sN0grU3J0cWxxWW1QQU5Qa3Aw?=
 =?utf-8?B?WHZKNXhUVEhsaXNZRWk0bmlHeHRJK2VVK2d1djA4aDEwVXJYeDVOZGV4ZHNo?=
 =?utf-8?B?OFpHNCtGL1ZRUU5WRnFnQTlNaHVGNWZudU50cW1QQlJuUDNmUTI2UFVHd0VP?=
 =?utf-8?B?cWIzL2ZBbTFKY0k5aEVTYWZ6QmcwQXpDM1JUQkY3dy9OcDJ1a1hoRW1hbGo3?=
 =?utf-8?B?ZUtRL2tNbkF5anYzeTlISlBoUG9LL2g0dG9kUGM5cjNNRjhRZXl4TFZHNXR2?=
 =?utf-8?B?V25XYVNVclZ6NW14Y0dMdDlwV3BoNWppRWEra1VNRWl3VWFFRXEySXJySS9s?=
 =?utf-8?B?ZC9SdmtPMExpMFBwd2VzQWVCeEh6QnVrYm5iNFUxbGM5R1BQbUNBRXJzb2Nh?=
 =?utf-8?B?aGk1bDVVYXFXUmlHZSt5OE8vcU5lKzByVDdDUzVPOEducWNHY0JtWnhUbmVz?=
 =?utf-8?B?WEZmZVQ2NDFvWElzVldud21aQS9vUE9iekI1dmhzenozUVdKZlVJVXp2SHho?=
 =?utf-8?B?SEo3WHFRUXVRWmFCdXQyQ3pRcStLVzRJWGRRTU15RERpbWRrNTFjNzMwYkdV?=
 =?utf-8?B?ZWh6aEdFNmVHakVIcmltM3FOVHluRjVCMXRKZDUyRVdvVDdtQmZJeWhEQmFM?=
 =?utf-8?B?SGdzWUZyNGxtL0VEMkMyUnpwcXpnM2FZOUhDQWVDNC9VRFJJaDlCU1pGV3dN?=
 =?utf-8?B?NnAwZko4UDBNb2xzWmhjYXg2Q1Y5OXN1NWczdlVCbjRvMVFPNG5VeENPUEhr?=
 =?utf-8?B?MVhHTGp4YmMwSmp3U2owMDRCREswM3ltU3V4VlVWSnpYWUZncmxkbE5rVHpt?=
 =?utf-8?B?eDM1cDN5UWpVa0RyREN3R2ZMbHRsQ1Y3RUh5T2hqdjNXcGxqc3oxV1dBTWRF?=
 =?utf-8?B?Ly9TclhNWWtVZEtnSW9NaE1uYkRVaml1a3VTNmNKZEVURGZMWUxXemRIZjZ4?=
 =?utf-8?B?ZysvTitkT09OS05aaUNBNkFIc3ZFWnFaWkRzQWFuMEtzL3ZqZzdPcDVMR0t5?=
 =?utf-8?B?VE1lZGdySkMzd1laWDcrNzBGMkQvZXY0YTRzSGU2QTJxQ3AvMG1FVnUrMG1V?=
 =?utf-8?B?YXk2d0dFVlpoQmt1VTd2R1JQTEE2U1VGM2RLUVpValVGa0JwK1pTdzVrdnBI?=
 =?utf-8?B?U1Mvd1dvVzF2ZUhCN25KSXc5T2ZaL1pYcWo1WkdXT3F3Wk8yRk5sNEpkdVNW?=
 =?utf-8?B?QVpvOU8xWDJpZEhXaFYzQndxdWNDSmlxZkFGV0xxamtOcmVvbnRLLzNPdWx0?=
 =?utf-8?B?MFhKUU5pWTJnN1V1bS8vd0hiU1B3ZDl0dUlpUWhZanNNdGIxMEVqMnprS3hX?=
 =?utf-8?Q?OqTrWCrsVnxrvWzZ5nSfK9gu2BRcyeIR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STZWbkx4czR0UFBjWmFqdEg0SUtnTDBsVlV0WTJqdUl6RmhnTHlNaWU4Q0hx?=
 =?utf-8?B?eE9lQk52U2pqU3N6M3RRR0J4ZHJJdTVLYkNEb0JFSEJ4anArL2s3RDYzdWZO?=
 =?utf-8?B?VFUzVktHVGtUNTFzQkd0TWh3NzlVREZNTzdhM1IvU0RyUnVPVUZqMTRUb3VI?=
 =?utf-8?B?c3hQbm82VmY0c3BXRUc5cVVCZk1TRGRpWkFEblVSWTVHRWVwcjEvL1hOSHNu?=
 =?utf-8?B?elkrdkd5aUhNMk8zMUdmcmsxTk9tRS9qOHNEVnJHUTFBVFVObDhBNDRYdmtQ?=
 =?utf-8?B?Kysrb3c3OGIzY1hOVHNiS0RyeFF5eHdXSm5XcUlhRHc1c0t5OGhHdzBEc0RV?=
 =?utf-8?B?K1VLd1FoQk56NjZqdW5MTlhLZGN5OWp0cmpNUklmeDlOWlBybERiOXJWZEQv?=
 =?utf-8?B?TkpDUW9laWthYkJXc0tUT1dHcktQcGFXRkFlbnNJYXluMlQ0cjJBYkFaSXFk?=
 =?utf-8?B?QkUrK3pmSE9pN2J3Tm9IVUs5Smx1TTRBOFRKN3pGdjVqKzlXZDN1MnBwYjA4?=
 =?utf-8?B?RDNlNXozR0VlbEh4VG1mTUVJeHJsd2QrQnlWN3V6ZzZQSGNveGxsNFZ1ZEdR?=
 =?utf-8?B?RndlV3drVjltNGxNeTdHT3htNU93TW1FamlmUWprdmw1L1RFYlZ0QmZmelpR?=
 =?utf-8?B?Smk5RHVzc2hSbXkvUGJINlJkYnF5R1cyS3plZmhOTHJOU2xGUlJNdVZzL1lW?=
 =?utf-8?B?UURLaWl1V3F1UWxoM25kVXlkMnVCRFZBelFUM1g5Y1lHMjQ3YUJnSGpRcGl5?=
 =?utf-8?B?dHJxa2IvdXN0eVIzYVV2UHJzcUV5bnZmRFoydnU2bzdmTzNHK3ZiYkU2TjNh?=
 =?utf-8?B?SERWd21NbHdTRGlRNTNGT2JYYk15bG1vNHBIalRTcm5uTmJPZU9wRDFkL3Rr?=
 =?utf-8?B?R0tCV2NvcTlTSGtqNUpZRExjYjJBWWhTYnFYc0xwRlIzK1RBT0NUTGszeHhD?=
 =?utf-8?B?bDV0dVdkakZHb1BTaDZDdnFISGJPVTErNFloWXQrNmc3VDFFTFdpNVByL0kx?=
 =?utf-8?B?M1A3ajZscGtYTWRveUJDTER6eGxWMGVGRGQ3QkZZMlByV2hMd21KVENEd1VT?=
 =?utf-8?B?NVdWdm1Mb3JQNzNDU0xORm1LZTdhMEVOeTJVZUkyOU1oZ0dJYmwrcTFSSDNM?=
 =?utf-8?B?bndHR1BWMmVmN3oraUEvblFmRUxReDU5T0poZktSNHNJcDJxTkFSa2YwTnUy?=
 =?utf-8?B?NlA0OGVCTU1oUC9OaEtBUVNlUEpEY0pxOFB4QXFXK2VDdXBqYWJFd0xUZzNv?=
 =?utf-8?B?V3l1VWxiWTFQcGtib1g4WUFvWVZpVXRaRElwVEVhVUFnbUhYbDhyMXYvNnYv?=
 =?utf-8?B?U0JVb2lNNFBFTUxscnh1TDZQVUIvRXZXTmsvVGZtaDlveWxHNnNTQ1RkcW1L?=
 =?utf-8?B?VlRaNER0endJUnRueGo3bTFTa3JMSWl4WHJuNlNEM29aQkROMDBJWEwvNjA0?=
 =?utf-8?B?UjVzaXFyOVRBMDU3aE9wWENyMzhOU2RDdUcwMVBTeDAzUmJQaEc5QlZISjZM?=
 =?utf-8?B?Ly9FTzdrUEVUVi9iT2xyODR1Z056MXlJRE42d0wwa3pNUXdhenBoVDRSalNF?=
 =?utf-8?B?YzNCM1ZCWnp2ZXd3VVNwTDZLYU5aT0hoSVh1VFNLL1RJV3lKT0FTQnF4RTZy?=
 =?utf-8?B?VmUzU1luU0RhRjgwUnhJVnZPRmJ5T0p5bGo4djJNMDduSmtrcU1XUU00RzVN?=
 =?utf-8?B?NVFvRTJYQzBOUXJOTUpFZ3RuSWdzSG0ybVdudmQ5aFZ0UnhmQkMzWDZjV1U0?=
 =?utf-8?B?WmgwQU5UWTdIZ3RQTG1WNEpRd1lUeFBJTmtwWmhlVWV5d1JDd0NQeEk4RjRm?=
 =?utf-8?B?clVaUmIyNHlmcVBSc3gvVHZNM3dmeGZweVBvWlQrbEFqZlRub3loMTNIZXpq?=
 =?utf-8?B?UEtvVWxBMHlubmczZVBnOXh4cCtXK3JtRWFmUFNCK2JkY1prSm1xTXltS2Ft?=
 =?utf-8?B?TEhDWllNTlI5MWdTbTQzSlZjb0FoSE8wS0pDSThhQjhIbDduaHhScDA2Z3hC?=
 =?utf-8?B?eWJlVTdiMlhrY2Z1Wk91UmtacitkcTkrNTZZYUswQkRMM1dTSnV0TGFtdnBR?=
 =?utf-8?B?aStsdzRTR1J2ODArWmZvSWc3dDBCRWpIclpYS2p0eWhBRE5ZckJDYjUyZCtT?=
 =?utf-8?B?MmI0ZmVVS08rdEc1d3l2bGNvOGp3bGtwdUdrMk1vc0NmbVJKRWFQNWcwYWg1?=
 =?utf-8?B?bmc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61791de3-7af6-4b34-ea05-08de283aad10
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 13:42:41.1628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wtj4AuajiqvB8HtUdStVjQqAe4oQ4TcJtdryEat4dBPcdX5dmLUNE87oCb6GRJMZ8xd6g/FoLSeIznbcDjX6Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6773
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

Code refactoring of __folio_split() via helper
__folio_freeze_and_split_unmapped() caused a regression with clang-20
with CONFIG_SHMEM=n, the compiler was not able to optimize away the
call to shmem_uncharge() due to changes in nr_shmem_dropped.
Fix this by adding a stub function for shmem_uncharge when
CONFIG_SHMEM is not defined.

smatch also complained about parameter end being used without
initialization, which is a false positive, but keep the tool happy
by sending in initialized parameters. end is initialized to 0.
smatch still complains about mapping being NULL and nr_shmem_dropped
may not be 0, but that is not true prior to or after the changes.

Add detailed documentation comments for folio_split_unmapped()

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

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
This fixup should be squashed into the patch "mm/huge_memory.c:
introduce folio_split_unmapped" in mm/mm-unstable

 include/linux/shmem_fs.h |  6 +++++-
 mm/huge_memory.c         | 30 +++++++++++++++++++++---------
 2 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
index 5b368f9549d6..7a412dd6eb4f 100644
--- a/include/linux/shmem_fs.h
+++ b/include/linux/shmem_fs.h
@@ -136,11 +136,16 @@ static inline bool shmem_hpage_pmd_enabled(void)
 
 #ifdef CONFIG_SHMEM
 extern unsigned long shmem_swap_usage(struct vm_area_struct *vma);
+extern void shmem_uncharge(struct inode *inode, long pages);
 #else
 static inline unsigned long shmem_swap_usage(struct vm_area_struct *vma)
 {
 	return 0;
 }
+
+static void shmem_uncharge(struct inode *inode, long pages)
+{
+}
 #endif
 extern unsigned long shmem_partial_swap_usage(struct address_space *mapping,
 						pgoff_t start, pgoff_t end);
@@ -194,7 +199,6 @@ static inline pgoff_t shmem_fallocend(struct inode *inode, pgoff_t eof)
 }
 
 extern bool shmem_charge(struct inode *inode, long pages);
-extern void shmem_uncharge(struct inode *inode, long pages);
 
 #ifdef CONFIG_USERFAULTFD
 #ifdef CONFIG_SHMEM
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 78a31a476ad3..18c12876f5e8 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3751,6 +3751,7 @@ static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int n
 	int ret = 0;
 	struct deferred_split *ds_queue;
 
+	VM_WARN_ON_ONCE(!mapping && end);
 	/* Prevent deferred_split_scan() touching ->_refcount */
 	ds_queue = folio_split_queue_lock(folio);
 	if (folio_ref_freeze(folio, 1 + extra_pins)) {
@@ -3919,7 +3920,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 	int nr_shmem_dropped = 0;
 	int remap_flags = 0;
 	int extra_pins, ret;
-	pgoff_t end;
+	pgoff_t end = 0;
 	bool is_hzp;
 
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
@@ -4092,16 +4093,27 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 	return ret;
 }
 
-/*
- * This function is a helper for splitting folios that have already been unmapped.
- * The use case is that the device or the CPU can refuse to migrate THP pages in
- * the middle of migration, due to allocation issues on either side
+/**
+ * folio_split_unmapped() - split a large anon folio that is already unmapped
+ * @folio: folio to split
+ * @new_order: the order of folios after split
+ *
+ * This function is a helper for splitting folios that have already been
+ * unmapped. The use case is that the device or the CPU can refuse to migrate
+ * THP pages in the middle of migration, due to allocation issues on either
+ * side.
+ *
+ * anon_vma_lock is not required to be held, mmap_read_lock() or
+ * mmap_write_lock() should be held. @folio is expected to be locked by the
+ * caller. device-private and non device-private folios are supported along
+ * with folios that are in the swapcache. @folio should also be unmapped and
+ * isolated from LRU (if applicable)
  *
- * The high level code is copied from __folio_split, since the pages are anonymous
- * and are already isolated from the LRU, the code has been simplified to not
- * burden __folio_split with unmapped sprinkled into the code.
+ * Upon return, the folio is not remapped, split folios are not added to LRU,
+ * free_folio_and_swap_cache() is not called, and new folios remain locked.
  *
- * None of the split folios are unlocked
+ * Return: 0 on success, -EAGAIN if the folio cannot be split (e.g., due to
+ *         insufficient reference count or extra pins).
  */
 int folio_split_unmapped(struct folio *folio, unsigned int new_order)
 {
-- 
2.51.1

