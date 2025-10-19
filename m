Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E76FEBEEE49
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 00:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3828310E22A;
	Sun, 19 Oct 2025 22:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GKcg+RN9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010033.outbound.protection.outlook.com [52.101.46.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB51D10E0B8
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 22:49:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+y4OFwVdTbY4TRS1SFCzzcf2KibuFISiIAIrcVBIdldAmVNLjR3CT3NphzNJ+sEjqqJ85QU37QAmGqk4n0BHSb/BLpk8vEJQv3+bBQqDST/7S+6ji3CSAcWQz6n12NKh5CPbE2J4cCSINgKnOnSiRRI+Dt2yvu4K3KOyfnuoStdFmYbC73B0LrM1JY326XZlizpZ4hLeZbaJwKW/wxQdehn48K1x8gFkQUWwAPB1iWl1A36FAY+d12Bw7iC0X8UMGW5q/aOVivEgRZa4TG2L3IJvDJQr2b0xuPDALlPDTEKyPFZgMeOZbHO38kaPVg7vCRVpqUfCiFeaiOMPQXx+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06qcUTEQ96xqQv9mVftepa729wBQs/pS8+JQeL/tc+U=;
 b=NfBMqZ/q6EXsxkDPdxymKfK0TEwApZOB89wMmbACxLUaeBJxYDj3RkKor1sCNnEFHMognacBmR6EUJOaptKfhxepw7iuGAz0IBGgzPl++u2FZRiuqjd2RyKt5EFdnd3RMxWArSD1xJqWOC+1+X74L3XxzEjk2vltzPrZrraZfA4rdmqMbL1HQC/g7uuXM/Zw1FJ+HJUFdojIxdMs88PnOcB4D/D7g2EraZOIyDPEvhYYocA3RO/1AbxNLfp51+O/gmBSrXZop+q22/b1q7bTMERbn6YsTNrq2MI2FFTf2eRvLXQCwAHE5gfGkNLArpIEmJyZiiOAgElxhQtfSnFp8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06qcUTEQ96xqQv9mVftepa729wBQs/pS8+JQeL/tc+U=;
 b=GKcg+RN92rVpP3O7mq7lJod8iQW/VoYc+C5nAbfpI8hfmeGVl5uM6+QD+EjYxUpSyueK+iBnju5Psp7GAVI8v0ZbOiWnATNJ73hZHszu+DQq4Okp1VWZtlvflrXWF59n1/UH/ll/UjhuucAL7K+4RZp1sUHtPl360dP781Scu+fcE0ynCgki3VsquMWw6BBsyvqsGckh/aSDJ3hNm/JIe6rOiH3CqgxfZOW8Tel6iCdQIiO3Dg46mqnzbwQFCyjUZrSk8zmpBhdM9kQ5L2MeBLQ8G6UaABs/My3xEGiZqSLajuvGA/lJc7M3B4PJg6j2vbN75kmyqZDvhREmT/HCVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by MW6PR12MB8865.namprd12.prod.outlook.com (2603:10b6:303:23b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Sun, 19 Oct
 2025 22:49:11 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9228.015; Sun, 19 Oct 2025
 22:49:11 +0000
Message-ID: <62073ca1-5bb6-49e8-b8d4-447c5e0e582e@nvidia.com>
Date: Mon, 20 Oct 2025 09:49:03 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [v7 11/16] mm/migrate_device: add THP splitting during migration
To: Wei Yang <richard.weiyang@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, akpm@linux-foundation.org,
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
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
 <20251001065707.920170-12-balbirs@nvidia.com>
 <20251019081954.luz3mp5ghdhii3vr@master>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20251019081954.luz3mp5ghdhii3vr@master>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0031.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::44) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|MW6PR12MB8865:EE_
X-MS-Office365-Filtering-Correlation-Id: 320762a8-22a3-4ce5-0be3-08de0f61b82c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|7416014|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDhtcXVvT3lnMi80MEFCTWJGM1U3QTlEbDNFRFFWbmpNWlpTa252MUp2K3F4?=
 =?utf-8?B?WTBlMXE1a1dMdUhpWjdsOXVZcFYyNmIreEhmc3cwblYwN2UrUXhwdjJRSEc3?=
 =?utf-8?B?ZXZINGdTQXJSWUJrNzlIMktMcVdCd09kWnBkaitNNGl1ME53ejA5eko5bFdG?=
 =?utf-8?B?akQyck45dG9aMFlNMjhWb0RlemhUcUN1dkFvYlJJNHg2bUVLck5aSFdITXlo?=
 =?utf-8?B?eElzTmhYbE16VmhDaDdPMnlya0hxN01qdDhpV3ZxQkM0bDRNajlIWmlUemVu?=
 =?utf-8?B?S0RHUFZRSUpuQlE0WnpqWWFTcy9QbmNEVmNheUtFUkdvd0E2em1ydE1jM0Rr?=
 =?utf-8?B?ZEQ3ME1PSWV1NzcyRmJpcXlZSGNRckVNNklMZXdrK3JRUEVWbWVoSkRPcGZO?=
 =?utf-8?B?UHpoS0FjcjE2SXFaQjR0RVU4NVZPUnJ5YWVnT2hoeEFqUDhWbjNVMmRZZUEr?=
 =?utf-8?B?WnVET1J1RWwxa0lzbVh4a1VsaHpTaWFBYks3bmtZcm1IajFaVTVUamxYVC92?=
 =?utf-8?B?SnNLMDV1M0w1YmttUEJWOG8xbjZGZXJrR0xuMHlxbW5qb3VHRmFhc1IrY3lH?=
 =?utf-8?B?NU5wc0p4czJmT1dCeVZKQUt6NXZlcDNKMEtwQllDemsvZlpBeC9ORVp2ZDYy?=
 =?utf-8?B?Q1VUaUJob2VDbFpYRWhWZVpEaXNpbk4yN2NGTHQ1WkNaVmk3d2VPRXNVMkts?=
 =?utf-8?B?WEtUZ2M0MVZPS1NVbDdrTHhhd3RiaEZXUXBzSDNhYVJER1RmTUlMVmg2cERj?=
 =?utf-8?B?b1J4bkJRTnV2UDFhbzNneHluUEpIamdrRVR6OVQ0Vnl3UVBTSWlXdTRqNzE0?=
 =?utf-8?B?S1hKeEZhQXAvNlNnek9ZMUJrVVVucjFkSHBNRGZYaVIyTUw0dHBuZ2ZSdEdy?=
 =?utf-8?B?bnhkcnkrNmxqVHdIaWhaTzlKT0pLSldBQS9tSnJCaEFnTlJTM0p3Uk1RaXFs?=
 =?utf-8?B?RnhaYi9QamVxa016eTkxa1FvbjlSeVBwaS96aGpQT3NBSEVnNTFnenNHZWpF?=
 =?utf-8?B?NldZMEFPUzMxL21pc3lvaG5KYTlXNzJjcmFoMXY5bUJzQkxwMkpuK1pnY0tP?=
 =?utf-8?B?QlV0eStTcUNJVzBkelNoRWhPRW1WaFhISzFBNmFjWitpc2YrbkxWVEFodi8w?=
 =?utf-8?B?WDBwbXZlSWVFc3AzVDdBemZtY2VtU2JkakdOc1pqVGZqdHZDTjlsSW1xSlJQ?=
 =?utf-8?B?MGhCYVNmMEhsUVlCQnRuMFJ6eUtUQnRPT0RITDBrWXJORzNET0VxcFVlU004?=
 =?utf-8?B?d2NDdkx4Q2t2ZnJoT3dBS2I3V3RUYkJKUW15c0JyWVprL2l3U044U1dFcHNY?=
 =?utf-8?B?WjY3VjNqLzc3SXRHTlFyRWlQbVFOU3FIbjZqNEIzRitmRjFpRTZ3Y1l5TlNR?=
 =?utf-8?B?RkJyK281RWF1WHp1enlKNXN1OG9IS3N0elBOVXRodU90a1JkcXBFd2RkNUw5?=
 =?utf-8?B?VXUydko0Vi9HYkpxRzlkK3IzTi9VYzBiQlpiS2prVTUzQW9RSXZUVlZGb2Zv?=
 =?utf-8?B?MDZBRU9lYmE2RFdiQVdicGJUQ3AzbEZleDg3aU9DTGlNeUVlYUkrK1R6Q3p0?=
 =?utf-8?B?MThGaFpBK3lKUVNnMVpSaFhRTVd1V1YrUi9xMTNNbEZIdktZNkg2bk10RFZa?=
 =?utf-8?B?ZUVMTmR1Z045enJtWVJldkx5cmJYa2JIYmpyTkFUditmTmRXS1dIanB2MjA2?=
 =?utf-8?B?b3QrS2h3NUFtc2UwUXhFdGZzQi9KNUNXc2hjYWlvWXpubHhGWDllaE1yL0xD?=
 =?utf-8?B?OURtTElXSHJZb1hPdWdqTVgwMjJ5S1pPS3hBVXZkVGpXL3k3YzdpUkg0eU9G?=
 =?utf-8?B?VnR3ekhWNk9ocVRqVTV3eWcwRmhURG9ZbUhLSXhXTWlKNjVmK2twQ3VuR01U?=
 =?utf-8?B?bEcraXpOamVMUnNsRHFQSUJQcUlkYjVXYmp5bXBha0swQ0FERlJXeTcycEFV?=
 =?utf-8?Q?uLt6JiJQ6X1pzmx7YqceRKr9J2g3uRC4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(7416014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFkya2d4dWtYa0xHSGJIb09qcWJYOVZKUGN2eGF0VEtQOGppVXNlVkhxNDdQ?=
 =?utf-8?B?VnFFeFpYNGRmWkRhSnZkTGFtMmVyVnBXMTJLczhsMy9KVjJGZTc4dE1VdFNG?=
 =?utf-8?B?UFFKZ3RUZnp6WllWbzR6TnhiUGREK2s1aXB1V0VQaDBXZlJsZFI4eEtXRzYy?=
 =?utf-8?B?RHNqTnlHa3JpWFpRNGFJOEZVUXJJWFIxWnJYZXgweHl1N1ZUVW56RWJvTmRz?=
 =?utf-8?B?bS9Edm90c2pud09IaVdZN1ZLUURvTzZFWmhYNW5SbU1JclBjaTViQ1hrdXNZ?=
 =?utf-8?B?VUc5QjJGUG9hZHFnZVEwUVF3TW9iZnBuck1OeVc3b1NPNHV6SCt0Mk1KN1l2?=
 =?utf-8?B?UVVxU1kzVmREUlpwWG1qTW1tdStNejVUMlM4VjFHdzUzOUlaNEJ6elNYM2Vr?=
 =?utf-8?B?TlV3ZjJFUStZcnJZekd5ZldvRVREcGdQUjczdE01ZHR2OVRNc0U0RHlwcmhM?=
 =?utf-8?B?bGoxSkRLNW0vaFlkc1FOdHR4R2sxb3VDNXZ4ZHJMeGlJQjhCbTJQZVdFNlpP?=
 =?utf-8?B?V21vUjBRRUt0ODFVSUdZZUdwWXdTWHhXQ2p6akRGejJvQVdXVjY0ckRXMEh6?=
 =?utf-8?B?UU9nb2ZvdWF3c29hWnFNMmx2ZXVmTUtOZk14akFLT2xOQXRwL09zVzFuampp?=
 =?utf-8?B?SmNMb2p0cGZieTRaRnJRMXN0WG9WMkg0NGg3c1lDYVdZVzA1ZUpRR3M0T1Bw?=
 =?utf-8?B?VkdvUXpGc2NyZzJrRVpvb0xtcXBtVGZlRm1seXBheUU3NlMzTGpBMVVycngw?=
 =?utf-8?B?ckF5ci9xUFFtWldqNlBjeXNCQlpIVWlUbEpWSEN2YitheUtUdUk3SVZHU3h1?=
 =?utf-8?B?bnpnRWtDT0ZzOERiSC9MQytmVXE4YW1zRjBzRW5GUW14cElsVVEvTEdnYXFX?=
 =?utf-8?B?VWpSWlkxblpTNW13OThXUW9oTjRaZjBidThIYUhYYW51cEk3NFV3WGc0dDBM?=
 =?utf-8?B?RDJ1N29ndmR3VjltOHhIc1JGdmVCa0hNQ1hPWkZDeHlCRnhtOEVVdXhLN0ds?=
 =?utf-8?B?ZERUcENWb3B0emJvaENRWlMwNkxBakdPR2JkVTNQVjF1NmE0b0NNdTZoZWVF?=
 =?utf-8?B?bThEa0U3ZTBLb1ozbWhLWHV6RCtaRGJ0aHFFVkhjQ0ZCWHFaWW9DelJPU1VT?=
 =?utf-8?B?QjcxL3dqZUt0b1VZZmpNcUNMT3pDK0sxbVpyQjZIV2R6RTgvdEFMY2NZMjJn?=
 =?utf-8?B?bWRnMFFCOHlzQis1U3NNSGg2UFlJVm0xSnhHKzI3b0trcjVWREtoQWZVTzZE?=
 =?utf-8?B?dnRIZHhkR3IzazNoVCtSUmdmVUM0YThZNlMveXgyVWtLeVhKL1JXM25SRHlL?=
 =?utf-8?B?VXI2UTBHS2ptRFVwQVVHb0lRWDVwakFOeVdFVlZ5MEg0UE5lbHArQWpHM3NW?=
 =?utf-8?B?emRtRmVFV3ZXeXdIVzdBSElwc01KZlNOVUphb0U1YUpkbEFFWHBSQVZMT2Ew?=
 =?utf-8?B?NzB4L21GaHZoZWloNGxld2FjcVhmblA0SW9kYUhiQ2g5NzlHUjhaVDF5WVFn?=
 =?utf-8?B?RktCV2RodUJPUXdFWGZ0c2UrZ3ljalo3OWxFWXV0a0NkRUJnRGNmUGVuei8v?=
 =?utf-8?B?Sm03Y3VEM2c1cjlxcmtBQTE3aWlMWllhd2lObEp1Q1luMmQ3YnduMXg3Umxt?=
 =?utf-8?B?Rmd3Z1FnNzJZQ2c4R09oV0w1VHkyeHBBaFRLMFIwRmVQY2NxbUI3NjhqTUJV?=
 =?utf-8?B?eGp3T3k1eXVTdU9VZjlDaDl6K0JlUWRZYWtMQmhvcURrTDlBS0syaU1uY3RZ?=
 =?utf-8?B?MDdVMUtoYlBmUTlhSWZCdUcvY3ltZUhpejNnRVhoK3BRY2lTWEdBTDI3RExm?=
 =?utf-8?B?UStIcnptSlV4RC8yY2lycjgzSzJZbHRGYkRCUUlldXRndng3L0FzeFhOTHlV?=
 =?utf-8?B?MU90eXJRVzhINkRNRDRHY21jeEpOWjN0a0ZqT2kyMjduVFJXM2dPVXRodVU0?=
 =?utf-8?B?cklzNDdMMTdZWUJ2QkVrQlpMRVVBRDVlZVhaQXdFdUgxdG5wY0E2RFlzSC80?=
 =?utf-8?B?NFNoeTFocE1US0o1dXJ6aXZlMXN4ZTdjN3lNa1VhN0FWOE5aV0dxaWppSWFI?=
 =?utf-8?B?cnlkWFI4T2oxek44dlFYRVJRWGpwczdvUmZRbkpHNytnNlBISUpOYW8vNlFU?=
 =?utf-8?B?ZTdzc0llbzUyTm1HRmU4Q211RzZwL0Jhd1N4YlNPZ0RPZ0w1VUpPVXQrYWFN?=
 =?utf-8?Q?+d3cevrKTfsSgdsipixHLDZ0lTilFuWWeiv1tf78foyJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 320762a8-22a3-4ce5-0be3-08de0f61b82c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2025 22:49:11.1319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6W9lys8Y54PGe3uI65VkzPALiruupAM8G0AwALKgp/h3sFrGWKQd2t9DxvlpEYBKAAkWqZyMFNbNs6ogmghIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8865
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

On 10/19/25 19:19, Wei Yang wrote:
> On Wed, Oct 01, 2025 at 04:57:02PM +1000, Balbir Singh wrote:
> [...]
>> static int __folio_split(struct folio *folio, unsigned int new_order,
>> 		struct page *split_at, struct page *lock_at,
>> -		struct list_head *list, bool uniform_split)
>> +		struct list_head *list, bool uniform_split, bool unmapped)
>> {
>> 	struct deferred_split *ds_queue = get_deferred_split_queue(folio);
>> 	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
>> @@ -3765,13 +3757,15 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>> 		 * is taken to serialise against parallel split or collapse
>> 		 * operations.
>> 		 */
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
>> 		}
>> 		mapping = NULL;
>> -		anon_vma_lock_write(anon_vma);
>> 	} else {
>> 		unsigned int min_order;
>> 		gfp_t gfp;
>> @@ -3838,7 +3832,8 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>> 		goto out_unlock;
>> 	}
>>
>> -	unmap_folio(folio);
>> +	if (!unmapped)
>> +		unmap_folio(folio);
>>
>> 	/* block interrupt reentry in xa_lock and spinlock */
>> 	local_irq_disable();
>> @@ -3925,10 +3920,13 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>
>> 			next = folio_next(new_folio);
>>
>> +			zone_device_private_split_cb(folio, new_folio);
>> +
>> 			expected_refs = folio_expected_ref_count(new_folio) + 1;
>> 			folio_ref_unfreeze(new_folio, expected_refs);
>>
>> -			lru_add_split_folio(folio, new_folio, lruvec, list);
>> +			if (!unmapped)
>> +				lru_add_split_folio(folio, new_folio, lruvec, list);
>>
>> 			/*
>> 			 * Anonymous folio with swap cache.
>> @@ -3959,6 +3957,8 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>> 			__filemap_remove_folio(new_folio, NULL);
>> 			folio_put_refs(new_folio, nr_pages);
>> 		}
>> +
>> +		zone_device_private_split_cb(folio, NULL);
>> 		/*
>> 		 * Unfreeze @folio only after all page cache entries, which
>> 		 * used to point to it, have been updated with new folios.
>> @@ -3982,6 +3982,9 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>
>> 	local_irq_enable();
>>
>> +	if (unmapped)
>> +		return ret;
> 
> As the comment of __folio_split() and __split_huge_page_to_list_to_order()
> mentioned:
> 
>   * The large folio must be locked
>   * After splitting, the after-split folio containing @lock_at remains locked
> 
> But here we seems to change the prerequisites.
> 
> Hmm.. I am not sure this is correct.
> 

The code is correct, but you are right in that the documentation needs to be updated.
When "unmapped", we do want to leave the folios locked after the split.

Balbir
