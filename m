Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4ACBD66AA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 23:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F2C10E500;
	Mon, 13 Oct 2025 21:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qWCAlHlS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013051.outbound.protection.outlook.com
 [40.93.196.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C9010E4F9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 21:56:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEAnKtoFa9OVVPW5tkABOXVtKWhD9/EDVYKMWhlDRHXzuIKnJIpVKLBMTkmKrdkyICYzoknWx2nZKzVhI78QNLpP4X0/fibxFzFc/cn8Tc7Nt2u6/MhxNZ5CdKnceqj4mbjJGXYqD7MfdeAKZHMEiZmnj7eS4Ti/EJxbEqv7b/X0ef2fsxO2eGB7lB1jI6OwlJYvxjcFpwOWUXNpdIsvH1ZkkFN8lYOfmYhIEzqKBtZlcnXyqVwFg9HFVlBHFD9LfyH+orPFb9P3DxobMxjbCPyuMwodVjQS7jJWVW/Ni63HupKXWTgG2ZBtcuwy4PFxLyxXwXgjv3z7nSms2Vicyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2d/t4ZcyQg7aPsLUAuoKc3XeYI4dE/V3ap+uU9byaP0=;
 b=iShFAWi65LX0y4QFbIk12LGiox3WfIAmOVInOsxnqS8XwDECzqT+N5D2Jj0eoI5kz8zjPbBwpL5shnzjU0/b0lWuaA7sS3g6AyMN/560eGPcWYXcnQQOzmb5XHONrzSP7g8n/5/gZOcQgzXlHJP+qLzHwDhMt07KiH4r4ibvtXAUmU5L8Ktp9QkZVka6NL8GXSh4Uf/sb2QucPHPt+x2CTgnxz89+hqBmZ39UZT6cJ19Vkvs8s2A42AxUgSEdm4BPR4EDh2rmUHLdg6N4H2K2EGq6qIKIIBp5+LA2P1A7Gf3UsNnQZnujRVQK4Kx39blhCJezdu9rPPBAwITNiPEsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2d/t4ZcyQg7aPsLUAuoKc3XeYI4dE/V3ap+uU9byaP0=;
 b=qWCAlHlStiOpsqvnHjPdCqeARCqiZobkDS0nZ4m2M26cfO5bi4hWaTilwLFSMKYa3xHkms/1B8HLK/cfy4ZL2IHaNgZEBBydMY5pD5Vl5H+Utl5T8igmQB13puODdaCtJUbYoTz1saHekk8TqlIQQQmxA4l+RKTHgWQ3Wgs1Rh+WWH4+VVLMmhdfnHOoks+dUDMzKuAXRnfZmfApjRUStczsQyu7LTAx/xC/n/yOeqysanAG03ExJDsEFbphi5C0fkZ/OISUD2gAoPZkKFQbSBn1UJIU/e4hlYkPGnQH69d3K85/owVSHWysiftGByfuAC95afvt6o+Xaj5cJmcU4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH1PR12MB9646.namprd12.prod.outlook.com (2603:10b6:610:2af::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.12; Mon, 13 Oct 2025 21:56:00 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 21:56:00 +0000
From: Zi Yan <ziy@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, akpm@linux-foundation.org,
 David Hildenbrand <david@redhat.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?utf-8?q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [v7 11/16] mm/migrate_device: add THP splitting during migration
Date: Mon, 13 Oct 2025 17:55:57 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <D2A4B724-E5EF-46D3-9D3F-EBAD9B22371E@nvidia.com>
In-Reply-To: <7213aa5c-7129-4a3f-acbf-ab922f0f6cac@nvidia.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
 <20251001065707.920170-12-balbirs@nvidia.com>
 <FB8D8651-639F-4882-9868-7FA0A8B62397@nvidia.com>
 <7213aa5c-7129-4a3f-acbf-ab922f0f6cac@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN0P222CA0027.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::35) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH1PR12MB9646:EE_
X-MS-Office365-Filtering-Correlation-Id: e589e262-9a28-4618-88d2-08de0aa34bff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3l1bVZPQkMvRGs2OWpHODNOdUVkMDg5ZXU2Qy9ia3I5eUNDZ1I4Z2czNSts?=
 =?utf-8?B?NjlRcXFYRVJaMi8yU3B6NG8xenVIUVhRN2ZBY0kzUzRsQ0FSa3FvVUJhRVBu?=
 =?utf-8?B?NDRHdWl0SVFSMHVRU3JPdi9SamxxWmZGcHhQcC9BSlRwK252cU1UT2xZSEM2?=
 =?utf-8?B?MVpaVHJ3Qlpya2RkTG1HWlFLK1FsZk9vOXNrejhnOHg0ME56TWp2T2dSUndP?=
 =?utf-8?B?NEVUZG5vaGJMbC94a0NzejRaODUrZjV3ZFdOZ1kzdXB4WG56c0dERDBSdnFa?=
 =?utf-8?B?R2VpZm5IMWJyOFZtUGFmc0NFdCs3WjVZdFFGcGlqNitTY3c4VktGQ25DaWQy?=
 =?utf-8?B?dzJoYzlMTEFCdDZ6a0ZEMU5NTVBlTVZFZEYxK05zbzZnUTh0TTFsVEJYS3BV?=
 =?utf-8?B?Q2RMSGVWMnNMQzdTVFlGOWMvZ0xqbnN0MmE3Y1Z2NmdCdHFlZ2RvcjJpcms1?=
 =?utf-8?B?VUdkdWRPUzVqRnoycmcxYXVpSVEyQkZsMmE1REpxV3hkYzlkWmVBM1dtbExJ?=
 =?utf-8?B?cVhUeEdHUTRWbTFweWxJWHl6RldpdWRNK1k2YUoxK01acWlaSlN4VDl3Yyto?=
 =?utf-8?B?aXdjRytPdHNxN1E3WXVPZ21TbWtXelBTdWl3TkNKanZwUExicm9sQlkrd0Za?=
 =?utf-8?B?VnVxN3VKWmVQVlZITTYyakVwQ3dsdmhRc3o4dlNjUWxlZmtFNHRBNG4zRmJa?=
 =?utf-8?B?eDRHMHFJZDE4OWk1b0x4Q3crbGN0ZllOWTZCdmhnN1ZDdHlSRVVzTkF3MVR5?=
 =?utf-8?B?WUlmc0pRYmUrdHBhSFluczMzRjc0TlY1OUNaeFJiOUJmanUwNUdEeWNIZXhl?=
 =?utf-8?B?WlczQXdQZmpjdEpMOHlsSTFHRTMvZHAydkRYT2tCbUJOZVhJZ2U0SmNuR1ZV?=
 =?utf-8?B?T05DeVA1TGExRlpWeEg1aHRGaWxBeUpZdmZuY3BjbGZaNEVKRGZOMmpQcFQv?=
 =?utf-8?B?ZWZrSkVqbmN3SDdidHJKQjNIZjB6ME0xT0FWM3VRSHp0NkplTUhINlIrQjRh?=
 =?utf-8?B?ODltNklENnVZWktxbllPTmxObnMwSW8yWTUxT2daRlZFWnJ5QkRjaEJ3SXlt?=
 =?utf-8?B?SGtoWmdIa3hKZVlUczc5YjJJSjFTeXdHbjJ0WnhYTjBpVXhWazh2MlZ5TzFp?=
 =?utf-8?B?NVhzM01CdTJCQ0M3akpuSTgvN1ZQeUhWaFZpeE1sSS9rOGcrcTExZzFlWndp?=
 =?utf-8?B?NEg5SDZXR05ad3FYWDVNS0kyUW9zWUlwc1NzWVNPSkhnREg0My9sL0hmdEhT?=
 =?utf-8?B?Y3lFQ2FTT0NUTkNidEQrell0aVVBcWRwM3kzMkJPRHRBWTRaM1U0V2hJZTNr?=
 =?utf-8?B?aitiK05nbjAxTEpLeGZnd3ZrNWxvQlY5ZXhLellBdkJIcG1PWnlyN0lVVVVV?=
 =?utf-8?B?N2JGcWlEUjZwSlFKeEZkV1d2TEdHV3J1NzYwRy9NRmF0Q3RESlpvdUtlU1lI?=
 =?utf-8?B?TU93R0dWY244MlU0b2NpblRHV2cwanQ4bklvQTNocWpwQTNPK09ZR0twKy9Y?=
 =?utf-8?B?TkZUaU1XR2R5alJ2b3VheE5aMWlPUFk2QjV3RVlXZ1FlR2Nyb0RRL2hhR3pv?=
 =?utf-8?B?R2lkRkhGZXhTV1YyY05TVGFjRDFjdGVMU3JYcTUrNlV1V3RiQkhBcnp0UFVI?=
 =?utf-8?B?SVZPTDhFZzd2ZGIvSEFjU3FUSTF5L3ZOeDN3MjFHM3dqNHA4ZDQrODY4dENK?=
 =?utf-8?B?bllGREd1YVYwckpONC9FT3JGK0Jra1BMTm96Mm50OHZHaVI2TDRDMkJCcXls?=
 =?utf-8?B?d1lwUSsvSWEzOTlCNy92N2FFQ3ovYkRUeXlVeERkaFZoV1lhcXRrV3YvN3lI?=
 =?utf-8?B?b3JrSlQ4OFh0RFl3bWp6MkhMNkpJclhKQTRTRnczY01RdnNXUFJSdWNPMWhW?=
 =?utf-8?B?a0lDTnVQcHdldXFscmFhYWdwWFRER01sR0ZWVWRlbDNaQndGTWU2ZzVPVUF0?=
 =?utf-8?Q?UIlEUjA4abdnMk3GJaxUNQ6uCi+ou5ax?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2svT1B3TU5oNmszZWFyU0RCWlBZcm1ESlpBTmlNWWlPOE0zNTEzNzFubTYw?=
 =?utf-8?B?empURzZ6bVZuNXFXT0kveGxkWDZHWDVQRTZRVWNDNUJBQ1dlSzBkNmVTMWhU?=
 =?utf-8?B?eUFRVkxESGhVSWxXMVFFL2xoR3B4V3lhdE1rNlhxb3Z2c2JqcG9GUjA5WnYz?=
 =?utf-8?B?VGZ1d1EyRjhQamsxV1lsYnBqTk9RWUp2YjFIeG9USXBMYTVna0pIVDJRTjhx?=
 =?utf-8?B?TzM3RzlHelNNbTh3MmV2N0NoS0xTQkxhSmpERkhVNXMxOGU2RzRKTFVJa25V?=
 =?utf-8?B?RVQ2bk9tYVdmQkFMK0VSR29TS0lrTEh0amo4M0F6TnBLZGxJak5KWGh1UUJo?=
 =?utf-8?B?azRFS09ta3ordVVRem9ERW5lZDZtZTJpdmpKV1ZyMEF3cThMaEIzZXRpNXVz?=
 =?utf-8?B?YXJLemdxYVpyb0hUMnJKQWdSRzZpWkhDUVcrY2hmSHh1T1FETGJoc2dLbGV1?=
 =?utf-8?B?RnlONW95MThUeWlUZXZwS0RRRlRSM3YrYlh2amhnSFB2YTdXcmI5UTE4cmhB?=
 =?utf-8?B?TzBxdHg1b1VhK3NUYUVmWHk3WC9ZSndHT3E3YzdTTWZDM09EWUZVU3lqY3hY?=
 =?utf-8?B?cnB3MmFiaFVpcGQ2QTA0d0xMaGtBUUxHRkREeTFTaEJDYnBPZVpsM1gwcHFp?=
 =?utf-8?B?dGJTdVg2c0gzR01LQ3pvV0dKZHVyVWVoZlNseU1mNlVkemE2RXFtT01KL3VX?=
 =?utf-8?B?TTV4TCtzNEx1Vk5VRjVXMWt1d2JWanFnT2QrODM3WXFlNklSemxmSnNoclpS?=
 =?utf-8?B?NVRGQUkyYTNidTRKVDMwcUh4OVVmT2RVME9WUTFHVnFyYVVJVVlXN25BeGJJ?=
 =?utf-8?B?ZVd2VTJ2VXdLZW1KcEVYWUFKVkU2MnBsSER2cU9iN0xOSi8vUTkzUktwclY2?=
 =?utf-8?B?b0IyV1lJcUhMOTVtc0NJeHBJWmxlajVHb0pReE9NQkdJMG5Uamtwb2dZRllk?=
 =?utf-8?B?ODlHbW9rYlpNVFBiNzg0Z0s2QlBzSHB4ZGZEbW9XSTNocHdTaUdwUTJKalNE?=
 =?utf-8?B?bVYyZEJLOUtqVXR2bUdsUDZOdDVlOG1NRnZTNjdadldxQ2pNQVNoaVZ6RXVB?=
 =?utf-8?B?QXNkaXVnOUdxSTQxbUhKK1JEek1qVjhUS2pLZzRvQ1R1ZFMrZktXbVNSM0N4?=
 =?utf-8?B?NnZ4SXVrcEROUUgyWFJ1bzlBbjQ5NDE3dlZPMUUvRmRVd2NLZ3YyNEZXVllw?=
 =?utf-8?B?YUJaY1BrbGJ5Z091UURkc0tuREx3TXBlMlREaEV2ZUNzREdpTVplWVlrNlox?=
 =?utf-8?B?NDNZTDlydWx1YlYrbnRnUndJN2tETHhHYmJjVTh5VjZXUVRmNEE3Nll2VmI5?=
 =?utf-8?B?b1l1SnVEUE14WGVhamZsaHNXakZLNUNobEZ4ait3OGZUcjRSdDlRM2NtMVI0?=
 =?utf-8?B?dVg1djVSbEY3cDhuZ2VKbzNPaGZpUGJuYWJCNjhicVV4L2czUEduWFRrdFN2?=
 =?utf-8?B?bHNlQ2RiRE44NVZ5WjJ0eXZaSElYb0lkOEFWd0w1ZUtraXVHYis4cHFGTlUz?=
 =?utf-8?B?R3ZraDJOR2ZYcUVaRDRQWGwxUzhlR2wrWnhmZlBKMWU1STdSN0RMN2VWZ2lT?=
 =?utf-8?B?eHg0MnNJQmJJc0s0cFlET2RRUFkvU1F5Njc5bjhhN2FSa3FacEdoVGtCOXdH?=
 =?utf-8?B?TWVuajV4MlBFdHczVVJWQ0pGTUFpd0ZSeTBwalloSFJJQ0Nnb3V5VFlaeTFN?=
 =?utf-8?B?TUZ5WXZ5UFRPMEhyaVNzRUYvSFI0QmhIdU1xdmhVMDNEb29oRFhGVmFicy9Z?=
 =?utf-8?B?QVRpa3VmUHNta01OWnNjMGZVSGJ2VWZxV3BTNWNhTmdMdWxBMTlsdlIxeTlF?=
 =?utf-8?B?aHExQW1laDRhUjEvVU9JNGNMS3JEMkgvV2dRSFhrdjNkdTIzaE9ZcmFTbGNh?=
 =?utf-8?B?RitWK0FLdWJPZFZWRHB4NVloelZ5Q2FzTno2WFhGMFBhaXgrbWJ1emhUWERy?=
 =?utf-8?B?V0JCemMrVjMyVUtPcjIvQi80ZklwZEo2VG8vaUpwNytUUm1rSTNkL2hhZEJD?=
 =?utf-8?B?cDAzdlg1K1YzVUp4bEUzK3ZwaDhYRUZQYmlBY0Y4VmxXSkU5djE5VCtpcmM1?=
 =?utf-8?B?NnR5Q2Foa0RGSkgwekFFZ1ZSSTNDbGYwZHRaSkZmL09MdG4wTTF4bm4xc3Vq?=
 =?utf-8?Q?XN7g8jU3ZaX8GA7edLvHc+YCx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e589e262-9a28-4618-88d2-08de0aa34bff
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 21:56:00.6659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WblQmufr4iY3n1yP4VytOFJD3SgzHlyFFyivd2UqWQ0FF4MN+av9BurtWwnS8TB4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9646
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

On 13 Oct 2025, at 17:33, Balbir Singh wrote:

> On 10/14/25 08:17, Zi Yan wrote:
>> On 1 Oct 2025, at 2:57, Balbir Singh wrote:
>>
>>> Implement migrate_vma_split_pages() to handle THP splitting during the
>>> migration process when destination cannot allocate compound pages.
>>>
>>> This addresses the common scenario where migrate_vma_setup() succeeds w=
ith
>>> MIGRATE_PFN_COMPOUND pages, but the destination device cannot allocate
>>> large pages during the migration phase.
>>>
>>> Key changes:
>>> - migrate_vma_split_pages(): Split already-isolated pages during migrat=
ion
>>> - Enhanced folio_split() and __split_unmapped_folio() with isolated
>>>   parameter to avoid redundant unmap/remap operations
>>>
>>> This provides a fallback mechansim to ensure migration succeeds even wh=
en
>>> large page allocation fails at the destination.
>>>
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Cc: David Hildenbrand <david@redhat.com>
>>> Cc: Zi Yan <ziy@nvidia.com>
>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>> Cc: Byungchul Park <byungchul@sk.com>
>>> Cc: Gregory Price <gourry@gourry.net>
>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>> Cc: Alistair Popple <apopple@nvidia.com>
>>> Cc: Oscar Salvador <osalvador@suse.de>
>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>> Cc: Nico Pache <npache@redhat.com>
>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>> Cc: Dev Jain <dev.jain@arm.com>
>>> Cc: Barry Song <baohua@kernel.org>
>>> Cc: Lyude Paul <lyude@redhat.com>
>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Simona Vetter <simona@ffwll.ch>
>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>> Cc: Mika Penttil=C3=A4 <mpenttil@redhat.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>
>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>> ---
>>>  include/linux/huge_mm.h | 11 +++++-
>>>  lib/test_hmm.c          |  9 +++++
>>>  mm/huge_memory.c        | 46 ++++++++++++----------
>>>  mm/migrate_device.c     | 85 +++++++++++++++++++++++++++++++++++------
>>>  4 files changed, 117 insertions(+), 34 deletions(-)
>>>
>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>>> index 2d669be7f1c8..a166be872628 100644
>>> --- a/include/linux/huge_mm.h
>>> +++ b/include/linux/huge_mm.h
>>> @@ -365,8 +365,8 @@ unsigned long thp_get_unmapped_area_vmflags(struct =
file *filp, unsigned long add
>>>  		vm_flags_t vm_flags);
>>>
>>>  bool can_split_folio(struct folio *folio, int caller_pins, int *pextra=
_pins);
>>> -int split_huge_page_to_list_to_order(struct page *page, struct list_he=
ad *list,
>>> -		unsigned int new_order);
>>> +int __split_huge_page_to_list_to_order(struct page *page, struct list_=
head *list,
>>> +		unsigned int new_order, bool unmapped);
>>>  int min_order_for_split(struct folio *folio);
>>>  int split_folio_to_list(struct folio *folio, struct list_head *list);
>>>  bool uniform_split_supported(struct folio *folio, unsigned int new_ord=
er,
>>> @@ -375,6 +375,13 @@ bool non_uniform_split_supported(struct folio *fol=
io, unsigned int new_order,
>>>  		bool warns);
>>>  int folio_split(struct folio *folio, unsigned int new_order, struct pa=
ge *page,
>>>  		struct list_head *list);
>>> +
>>> +static inline int split_huge_page_to_list_to_order(struct page *page, =
struct list_head *list,
>>> +		unsigned int new_order)
>>> +{
>>> +	return __split_huge_page_to_list_to_order(page, list, new_order, fals=
e);
>>> +}
>>> +
>>>  /*
>>>   * try_folio_split - try to split a @folio at @page using non uniform =
split.
>>>   * @folio: folio to be split
>>> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
>>> index 46fa9e200db8..df429670633e 100644
>>> --- a/lib/test_hmm.c
>>> +++ b/lib/test_hmm.c
>>> @@ -1612,6 +1612,15 @@ static vm_fault_t dmirror_devmem_fault(struct vm=
_fault *vmf)
>>>  	order =3D folio_order(page_folio(vmf->page));
>>>  	nr =3D 1 << order;
>>>
>>> +	/*
>>> +	 * When folios are partially mapped, we can't rely on the folio
>>> +	 * order of vmf->page as the folio might not be fully split yet
>>> +	 */
>>> +	if (vmf->pte) {
>>> +		order =3D 0;
>>> +		nr =3D 1;
>>> +	}
>>> +
>>>  	/*
>>>  	 * Consider a per-cpu cache of src and dst pfns, but with
>>>  	 * large number of cpus that might not scale well.
>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>> index 8c95a658b3ec..022b0729f826 100644
>>> --- a/mm/huge_memory.c
>>> +++ b/mm/huge_memory.c
>>> @@ -3463,15 +3463,6 @@ static void __split_folio_to_order(struct folio =
*folio, int old_order,
>>>  		new_folio->mapping =3D folio->mapping;
>>>  		new_folio->index =3D folio->index + i;
>>>
>>> -		/*
>>> -		 * page->private should not be set in tail pages. Fix up and warn on=
ce
>>> -		 * if private is unexpectedly set.
>>> -		 */
>>> -		if (unlikely(new_folio->private)) {
>>> -			VM_WARN_ON_ONCE_PAGE(true, new_head);
>>> -			new_folio->private =3D NULL;
>>> -		}
>>> -
>>>  		if (folio_test_swapcache(folio))
>>>  			new_folio->swap.val =3D folio->swap.val + i;
>>>
>>> @@ -3700,6 +3691,7 @@ bool uniform_split_supported(struct folio *folio,=
 unsigned int new_order,
>>>   * @lock_at: a page within @folio to be left locked to caller
>>>   * @list: after-split folios will be put on it if non NULL
>>>   * @uniform_split: perform uniform split or not (non-uniform split)
>>> + * @unmapped: The pages are already unmapped, they are migration entri=
es.
>>>   *
>>>   * It calls __split_unmapped_folio() to perform uniform and non-unifor=
m split.
>>>   * It is in charge of checking whether the split is supported or not a=
nd
>>> @@ -3715,7 +3707,7 @@ bool uniform_split_supported(struct folio *folio,=
 unsigned int new_order,
>>>   */
>>>  static int __folio_split(struct folio *folio, unsigned int new_order,
>>>  		struct page *split_at, struct page *lock_at,
>>> -		struct list_head *list, bool uniform_split)
>>> +		struct list_head *list, bool uniform_split, bool unmapped)
>>>  {
>>>  	struct deferred_split *ds_queue =3D get_deferred_split_queue(folio);
>>>  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
>>> @@ -3765,13 +3757,15 @@ static int __folio_split(struct folio *folio, u=
nsigned int new_order,
>>>  		 * is taken to serialise against parallel split or collapse
>>>  		 * operations.
>>>  		 */
>>> -		anon_vma =3D folio_get_anon_vma(folio);
>>> -		if (!anon_vma) {
>>> -			ret =3D -EBUSY;
>>> -			goto out;
>>> +		if (!unmapped) {
>>> +			anon_vma =3D folio_get_anon_vma(folio);
>>> +			if (!anon_vma) {
>>> +				ret =3D -EBUSY;
>>> +				goto out;
>>> +			}
>>> +			anon_vma_lock_write(anon_vma);
>>>  		}
>>>  		mapping =3D NULL;
>>> -		anon_vma_lock_write(anon_vma);
>>>  	} else {
>>>  		unsigned int min_order;
>>>  		gfp_t gfp;
>>> @@ -3838,7 +3832,8 @@ static int __folio_split(struct folio *folio, uns=
igned int new_order,
>>>  		goto out_unlock;
>>>  	}
>>>
>>> -	unmap_folio(folio);
>>> +	if (!unmapped)
>>> +		unmap_folio(folio);
>>>
>>>  	/* block interrupt reentry in xa_lock and spinlock */
>>>  	local_irq_disable();
>>> @@ -3925,10 +3920,13 @@ static int __folio_split(struct folio *folio, u=
nsigned int new_order,
>>>
>>>  			next =3D folio_next(new_folio);
>>>
>>> +			zone_device_private_split_cb(folio, new_folio);
>>> +
>>>  			expected_refs =3D folio_expected_ref_count(new_folio) + 1;
>>>  			folio_ref_unfreeze(new_folio, expected_refs);
>>>
>>> -			lru_add_split_folio(folio, new_folio, lruvec, list);
>>> +			if (!unmapped)
>>> +				lru_add_split_folio(folio, new_folio, lruvec, list);
>>>
>>>  			/*
>>>  			 * Anonymous folio with swap cache.
>>> @@ -3959,6 +3957,8 @@ static int __folio_split(struct folio *folio, uns=
igned int new_order,
>>>  			__filemap_remove_folio(new_folio, NULL);
>>>  			folio_put_refs(new_folio, nr_pages);
>>>  		}
>>> +
>>> +		zone_device_private_split_cb(folio, NULL);
>>>  		/*
>>>  		 * Unfreeze @folio only after all page cache entries, which
>>>  		 * used to point to it, have been updated with new folios.
>>> @@ -3982,6 +3982,9 @@ static int __folio_split(struct folio *folio, uns=
igned int new_order,
>>>
>>>  	local_irq_enable();
>>>
>>> +	if (unmapped)
>>> +		return ret;
>>> +
>>>  	if (nr_shmem_dropped)
>>>  		shmem_uncharge(mapping->host, nr_shmem_dropped);
>>>
>>> @@ -4072,12 +4075,13 @@ static int __folio_split(struct folio *folio, u=
nsigned int new_order,
>>>   * Returns -EINVAL when trying to split to an order that is incompatib=
le
>>>   * with the folio. Splitting to order 0 is compatible with all folios.
>>>   */
>>> -int split_huge_page_to_list_to_order(struct page *page, struct list_he=
ad *list,
>>> -				     unsigned int new_order)
>>> +int __split_huge_page_to_list_to_order(struct page *page, struct list_=
head *list,
>>> +				     unsigned int new_order, bool unmapped)
>>>  {
>>>  	struct folio *folio =3D page_folio(page);
>>>
>>> -	return __folio_split(folio, new_order, &folio->page, page, list, true=
);
>>> +	return __folio_split(folio, new_order, &folio->page, page, list, true=
,
>>> +				unmapped);
>>>  }
>>>
>>>  /*
>>> @@ -4106,7 +4110,7 @@ int folio_split(struct folio *folio, unsigned int=
 new_order,
>>>  		struct page *split_at, struct list_head *list)
>>>  {
>>>  	return __folio_split(folio, new_order, split_at, &folio->page, list,
>>> -			false);
>>> +			false, false);
>>>  }
>>>
>>>  int min_order_for_split(struct folio *folio)
>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>> index 4156fd6190d2..fa42d2ebd024 100644
>>> --- a/mm/migrate_device.c
>>> +++ b/mm/migrate_device.c
>>> @@ -306,6 +306,23 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>  			    pgmap->owner !=3D migrate->pgmap_owner)
>>>  				goto next;
>>>
>>> +			folio =3D page_folio(page);
>>> +			if (folio_test_large(folio)) {
>>> +				int ret;
>>> +
>>> +				pte_unmap_unlock(ptep, ptl);
>>> +				ret =3D migrate_vma_split_folio(folio,
>>> +							  migrate->fault_page);
>>> +
>>> +				if (ret) {
>>> +					ptep =3D pte_offset_map_lock(mm, pmdp, addr, &ptl);
>>> +					goto next;
>>> +				}
>>> +
>>> +				addr =3D start;
>>> +				goto again;
>>> +			}
>>> +
>>>  			mpfn =3D migrate_pfn(page_to_pfn(page)) |
>>>  					MIGRATE_PFN_MIGRATE;
>>>  			if (is_writable_device_private_entry(entry))
>>> @@ -880,6 +897,29 @@ static int migrate_vma_insert_huge_pmd_page(struct=
 migrate_vma *migrate,
>>>  		src[i] &=3D ~MIGRATE_PFN_MIGRATE;
>>>  	return 0;
>>>  }
>>> +
>>> +static int migrate_vma_split_unmapped_folio(struct migrate_vma *migrat=
e,
>>> +					    unsigned long idx, unsigned long addr,
>>> +					    struct folio *folio)
>>> +{
>>> +	unsigned long i;
>>> +	unsigned long pfn;
>>> +	unsigned long flags;
>>> +	int ret =3D 0;
>>> +
>>> +	folio_get(folio);
>>> +	split_huge_pmd_address(migrate->vma, addr, true);
>>> +	ret =3D __split_huge_page_to_list_to_order(folio_page(folio, 0), NULL=
,
>>> +							0, true);
>>
>> Why not just call __split_unmapped_folio() here? Then, you do not need t=
o add
>> a new unmapped parameter in __folio_split().
>>
>>
>
> The benefit comes from the ref count checks and freeze/unfreeze (common c=
ode) in
> __folio_split() and also from the callbacks that are to be made to the dr=
ivers on
> folio split. These paths are required for both mapped and unmapped folios=
.
>
> Otherwise we'd have to replicate that logic and checks again for unmapped=
 folios
> and handle post split processing again.

Replicating freeze/unfreeze code would be much better than adding unmapped =
parameter
and new path in __folio_split(). When it comes to adding support for file-b=
acked
folios, are you going to use unmapped parameter to guard code for file-back=
ed code
in __folio_split()? Just keep piling up special paths?


--
Best Regards,
Yan, Zi
