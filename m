Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7048FB4817C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 02:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C722110E320;
	Mon,  8 Sep 2025 00:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="M+ODEgfa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C9C10E320
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 00:05:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWvlgbx8P4sZdSFpyR/DVq5GPRw0Km/JZVVQIK5lTeB8BVqqI7TagG5sVnTRRGkf84SKSmyLo2kE9GvIZ6Ic48xzvYxn2vG6c2I5T8LnBW8JytxhY0F7bLu26gUJD9vKwF3vdK1Ebr894YAnfeX5HlTYZTVlmjeRIAFiTMOZV9ck8dCdGfvvEYeSM6yqaXDygyJ72eB4ORcU85l3bMMmwEyT6q2g7Vjj+4rS1Cw65dIggA+OrbWkjX6eg13VsCHgqJvqRHJBo8JIHesJ546XkRuEotZ3POEmzfPG/zR6djikrY3gOhQRHsQEapfVT5TGqWjwp72LbadDBG3jbEBpyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXaSmoVK61hLtEUJLEcwAHEmJEnoqyY9BGy7WagQ3MA=;
 b=k7eKYM6fG07xhXot5A4EAUDaR/dNVycSmLcMGwC+VOaqZ6DHri/esDyd9aXU1NTIty0usEx5hwrvDpAmclaGPAPowqZwhrjQ1sV7YqfrdEFDi0+U5uA/rBvtxA/iJhmRql4T/YiT6W7N4c0PTtCYif7OeqnRKjBirehGyL8nqtZEOSturPUMOyWkTzEg/C28fCzwFKpZ2NLM0zSUKVcrfxcUoKGfn3fM9Fv7a0UivvnnNl4tYb8aUmrKPuYenqPpNdmiMxe82u2mdebTB1jYnS3qU/EJ2AnDMpCmHb1AbDzddb7wEAsv4UHuKgHYyOc5jdGjphsTAv/CmC+XfIntqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXaSmoVK61hLtEUJLEcwAHEmJEnoqyY9BGy7WagQ3MA=;
 b=M+ODEgfafCzWdq8ceQi6jHozWGTBDjxHD20YHT90IFvB/i3U/s3YIm9+6YhSq4P4GR/fmwP6CKQbUjefwv77uJTW50wxHTJG5i2ctGJTpJdYU9dkvd0iPZTsomaBHGxJ7QkMU9DJcNALztsMD3YkbUI4Ij+hgc5oHhOaTFs4eKXIKlmCU/HIsP3ss/8hjcXKRXSYbL47Hz8+iCZOlx6ofDCT9OG2zBUOlyTxhVl1MiEFNl193S7kqSYwslwd1AsYH4Z9fsFSJazkbjJYNZtoc7T6yEuc35mbDZ09/d4mzdhP2xomrJvxp8HyOGLwovPvUBYDrHOVKG2EpwX1etFb+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS7PR12MB5887.namprd12.prod.outlook.com (2603:10b6:8:7a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.19; Mon, 8 Sep 2025 00:05:33 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 00:05:33 +0000
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
Subject: [v5 09/15] mm/memremap: add driver callback support for folio
 splitting
Date: Mon,  8 Sep 2025 10:04:42 +1000
Message-ID: <20250908000448.180088-10-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908000448.180088-1-balbirs@nvidia.com>
References: <20250908000448.180088-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY6PR01CA0152.ausprd01.prod.outlook.com
 (2603:10c6:10:1ba::16) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS7PR12MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b1c3712-4576-4645-a1cd-08ddee6b6dff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWFYQ0pEZnN0QkVXYTJ4RGtlOEduTW5XRVF5L2JhRDJka05CNG0rNGUwVjNw?=
 =?utf-8?B?WDBMeC94RFBBc09FZjRwY21DV25PZmRQWE5oSU16MnFxVWFFYTYyMElCcmVv?=
 =?utf-8?B?a2wxN0ZFVlFzMWlJQk5zaHlla2RKRmZYU3pzVFJLRTV5NHFPZU4wbDFabVNr?=
 =?utf-8?B?SUVzS3VQRld0SkRPeVlTVjltZWFFazR1L1dXNy9GR0dlWHF3aE8vZXQ3V3VN?=
 =?utf-8?B?WkNsU1R2NlcyL0tBVEVJa3hJSkcyZ1Y5WWUvMGRaNHUzOEltdEJsblpTaEpS?=
 =?utf-8?B?dUlOSk1zakZJZ1l6MlpYNDVlT2tENTZjTW04OXJrdGVLWnFnVFpUdnNZL3Ax?=
 =?utf-8?B?U1hzODBYU2NkWC94d1lObmM5TzB2WmYyMHE0eEdmVVlBTytwT0phdmYxaW9Q?=
 =?utf-8?B?YTd4MWlwQ2M3Q0h2b1Z4WHBXbUxzc2tPeFg4NDBXQkdpSE4zWXl6eHllcFcx?=
 =?utf-8?B?N3pCNjhrcEJxaTduSnp1Z2dHK0pEeVBUalhVb0lQYWZoWGZKbWdrd3lYenNx?=
 =?utf-8?B?eFJQQXRnaU5jTU12ckxsdnpObldRT2t2Nno1VTFiVEFUQjh2Y1QwU2pEVzhR?=
 =?utf-8?B?UUlld2F2TWM3WVNRYVpXZk9CTUplcHFHb0F2TXZXNUFqR3RRc1pUWlJPbTFx?=
 =?utf-8?B?RG8zUkg1MyszVHRYYXFTQThJb01jd1lFOTk3dEZMb2JHa0haN2pjdmQ4anlY?=
 =?utf-8?B?dDFIOGgxOFFLdFA2WWhKa2k2TytRc01nYWl1YUJrS2d5aTg0KzNINko4V3Er?=
 =?utf-8?B?M1B1NVJEZnUwSmNhZ3NpTnRDYWJhaUpFcS9lb2w5QXNDVXJ2bHlwRGtlRlRV?=
 =?utf-8?B?Y3BRc1ZGaFBPbE94U1R4aFlwZENQb3NMOXBTSlNxQWxnemp5U0dYL0hvWTJQ?=
 =?utf-8?B?c0ptTU9mYlFYbmxTUEJDdDFoZmZXdSs4dklVZVhRRTB3TGhuVm5US3drT0Zl?=
 =?utf-8?B?d3lseHdZR0tXd3JRRTl1eFhsRzkya2ZzU3cvQWQrUTRlS3RhYjQ2ZzNIWnY5?=
 =?utf-8?B?aU56bHpOZ3RPS0YyVTJPTXRreC9CRUpHOFpBbkMwSGJXaFo0UEdhT25kTDhp?=
 =?utf-8?B?YlJZR3R1bG9FQ2tDUUlBeEJWTDlnTEJYeUZBZzl2bGN1cjFDU29DYS9ZS0FJ?=
 =?utf-8?B?dUpBdjNRdE1ZZlp6bTVrWGJ5UEF4SjN5VURhZ1pkL2x6eWU2QWhLdVc3ZzNy?=
 =?utf-8?B?djdBWGVPa2NXejg5ZEJHd3ZHTjVqUGEzdi83TWZiOEtDS0lRdFhORUFxTi9n?=
 =?utf-8?B?NFhmVWJ0U0IwSndUWjVCNW9CU3J1Z21IRjF6ZFlMWml3WGxGZHNSVkFZVWZB?=
 =?utf-8?B?OERPSVEwSmNOcWZxWGZCOEwyN0JXSmoxQ3FldXN4elhlV0gyVUIvSHUrMjVn?=
 =?utf-8?B?Y2dNNm9FNFpZVS9GZmhTdVdFZFljOG1RRXU1dkJEZW5yd0pZbjMwOC9KRk52?=
 =?utf-8?B?VUYxb3FPZ21pN2pPVlRVcjk0ZnM4S2dQSVlGVE1tYUYwcWo3NWp1cFVZNlht?=
 =?utf-8?B?RDByNW12UCtFVDVXaUsyeFJScG0zNk5jRDJ6WmJWRjZ5YWlqT0ZVakcwSXBN?=
 =?utf-8?B?TmN5Z2xVczAzbHhISGlhaisyV2s5Y2QxNVJmdlJ0NzRYS3BGTTVxUWNNbjhE?=
 =?utf-8?B?TXdscWovcU5INEFUN0NTRGpxZ3lqVGFRTTdxRHZnWTVsL0V3KzBPdlJUQVVw?=
 =?utf-8?B?Z2xYVEYyWnIvMHNOdHAySTBnQmxqM3l0UU5zWSt2L2JFUFB0cTIzVUFnbW1n?=
 =?utf-8?B?Q2htdFpQYzBpMS9pUE5FMnFoMEV6RmFhVmNsOS9WbTl4UUhJQitZMUJ0ekFG?=
 =?utf-8?B?ZVZ5bDJqNWZiWnBqTVpyLzUyN3FoclY3WDR0VXNGcjVnNE1IZjVNbG93V0Zs?=
 =?utf-8?B?eWpBaEdkWEJOQXV3L1pvOTZ5WkVtdnpobGR6Smcybk42UG12VkVUNkloZzBh?=
 =?utf-8?Q?ZwFLEPmXSSY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEZURjJFa0FzdDBKNmhpOW4xVmF5Z3k0NTVRaE1mb2pLZUhUaE9IRERoRGhJ?=
 =?utf-8?B?dkkxZTF1MGNicjEySCtIT0J1Qmpqc0lwc3VTWGpvWFgwbGZiNE1WN2hLSkFk?=
 =?utf-8?B?TS91bDR5bmVzT21BaG9hcXdIdThjMUhVMXVZK2t6dTYxUSswNnZkU2R2YUl6?=
 =?utf-8?B?M1R0eFpkSEJpVEY0RUdoS1JId1o5dmJsRzBDY01hNlowK1gvdW5BQ08yVTRs?=
 =?utf-8?B?eVNkODI0dFIxclZTS3VEWENRUWRrODdOOXBtdGp1NnVCUEVRdkZEYWJkdS92?=
 =?utf-8?B?c1BCQWxndHpySEV5dFRCc1VyL1Z1WmJvNHVzRVFuQVZwQU1QQllXT0lLOE14?=
 =?utf-8?B?bVlQNWJINU1qck40L1VrZk0vSGZCL3U2aG1Da0hHb21ZTVJvNFlFbDhvSjln?=
 =?utf-8?B?RXRhdEFWbVhxT2srdGtyNFZXa2xUOCtZZEtHeGJVMGhUQ0ZyMTlyUGdESkt6?=
 =?utf-8?B?VHVuem91QkNQUTNzTXR1RjhUcVRLaVVhUkRqVXdHNmZlMVZtSXdBWFM1U0Qv?=
 =?utf-8?B?eEJYZHQ3YUlneUdqV1JxdklkZ05lV1NadE55NFEzYWZxenFaUmw1TWJELzlE?=
 =?utf-8?B?blZKRnNvWkZMUVJaTXFVRlpnRHQ3aitWcTR3MG05UWZ3M0ZsLzA3K1k5dE1B?=
 =?utf-8?B?Vk5ZZkhFSWdLT3MwMEhUQmQ0V2hHeTJmZWlXTTNOQ0w5WE9rcEpvcTQ2QzV0?=
 =?utf-8?B?bGVoa3UvTkppdUtxekc5Ky9HMEV4OHNoRkdlOTVTeCtISjBYa1FaazM0REE1?=
 =?utf-8?B?Q1hoWWlyNWQ3Y1VTMVhITGNJMzJHNWNuQzNueTVYaEwrVHZqMTJKTEh5VHYr?=
 =?utf-8?B?V1YxVVc3L3Y0ZmVoU1NGLytFZXczaTFlNlg2eFN0Rmh6NDVsTk1BVENGMTF6?=
 =?utf-8?B?UWVtZFhKQUNNYXcxc1ZIa0w3Uklmb3pyaHRkM01HY3Z1U2J6UmJWeVlXbElE?=
 =?utf-8?B?ejJXd3lYS0JGamR2TlpqYjFnbjF1TXF2QUFtUFNaaGNXZVFqTTBGcGhrYTlF?=
 =?utf-8?B?Yk9HbThjbW8rRHJVRXpzYVZBcllvZ1RUdGNvTklwTXBXR0ZoWTZvajNmc1J4?=
 =?utf-8?B?QVF1cUxJR0hpaHNVaGVxNVNaemtMazcvUmlPRC9zczRoVHlibXg5Ui9XanFm?=
 =?utf-8?B?aUdBQ2NTOEM2NS9vT2RxTGxLd3R5ZWlNdTA2aWNKbVZTeERWTmNjYjc3enEz?=
 =?utf-8?B?UWtITFFrbFVxczBzb24xT3U4Q2xlOUpnS2svbGJkY1diMks2dzlBeWE2aU96?=
 =?utf-8?B?NmJRSStld3BaVzZDdHVZcDVZektRZFlmbSt0RXBUSlliOEdBNlRTOHh3anNx?=
 =?utf-8?B?b1F4VkNoRVRuenE2YWI1d3dTTDNhTCtEMzI5M3A4SE9xUGlqUkNhMGx1UmZI?=
 =?utf-8?B?T0tHeGlTVVNNNmJ2QkRqRW4xVHl5K2IwcG9IZVZXY3dGb0VRdnZwNWhrRFpR?=
 =?utf-8?B?K0ZCRmQ2bVhIS0dUTXlBRGpNZUxaUnlqbzB1bXpkd1ZIVVYwU3FFUGZ6N2ZE?=
 =?utf-8?B?MDJ0TEhHek8wdm1hYnNKK25MUjVSK2NJKzFiT2gvRWRUY1ViVGVmUGJzbkZw?=
 =?utf-8?B?bnNkYTdvWDlWR1o5blZPWUxzMmVYbmNGTmJuVTJVdE16MWlYUGpUUndkYWkx?=
 =?utf-8?B?UzltemU2TC9aR1k3Yi9tb3ZTWWdZbk54T1BOcEwvamYzSEFMNTZTL202VTc0?=
 =?utf-8?B?Mm1OTHJQUXVnQ25wQzdaOC9UK0dGNk5oR1o0dktpbHMzUHlZcG1FaFVBS1hU?=
 =?utf-8?B?QkUyVGhkK2dmbDd5OXhYaTNDWjZvSzB0YkdZUGhVdjVwczBxdGRtM2RiUjMz?=
 =?utf-8?B?dnlwWVcwVHFYY002cnhSMDBDK2p0bUlqQlVkeDNMRmFSamFqbHM2SWxxa3Fw?=
 =?utf-8?B?LzVIRlcyOFE1ZzJkTzRoTVRKcG5ZbkVFNUtlaDViV3JkajNMakEzVlpCZkJq?=
 =?utf-8?B?WXo3RlpNdFh5REdFYWwzcDF2OHFSMS9ZZFZPUXlkN25XbXhkS2RZeHlZL2tS?=
 =?utf-8?B?bXNNYS95SHplRTNCYXNpUmlDN0J0OE0wZWRpbzRzb3YwaXczR2tKZVRhRW1a?=
 =?utf-8?B?ODF1czZkK1dLY2xUY0h3Qk5aWlZWUlhZM1hSREI4bE9hcEJxTXJGM1lHRlVF?=
 =?utf-8?Q?doaJ4Mogtp/WPHSIOxiWq1RYT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b1c3712-4576-4645-a1cd-08ddee6b6dff
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 00:05:33.2030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ffh99NokoL2QvlQC2f/TTevul/+wFXz0Gx8STv5C6a4+MMWNe/XD/SWCn9GS+APyh+u8ThxW9GOHhOk7cBLlw==
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

When a zone device page is split (via huge pmd folio split). The
driver callback for folio_split is invoked to let the device driver
know that the folio size has been split into a smaller order.

Provide a default implementation for drivers that do not provide
this callback that copies the pgmap and mapping fields for the
split folios.

Update the HMM test driver to handle the split.

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
 include/linux/memremap.h | 29 +++++++++++++++++++++++++++++
 include/linux/mm.h       |  1 +
 lib/test_hmm.c           | 35 +++++++++++++++++++++++++++++++++++
 mm/huge_memory.c         |  2 +-
 4 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 75987a8cfc6b..ba95c31a7251 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -100,6 +100,13 @@ struct dev_pagemap_ops {
 	 */
 	int (*memory_failure)(struct dev_pagemap *pgmap, unsigned long pfn,
 			      unsigned long nr_pages, int mf_flags);
+
+	/*
+	 * Used for private (un-addressable) device memory only.
+	 * This callback is used when a folio is split into
+	 * a smaller folio
+	 */
+	void (*folio_split)(struct folio *head, struct folio *tail);
 };
 
 #define PGMAP_ALTMAP_VALID	(1 << 0)
@@ -235,6 +242,23 @@ static inline void zone_device_page_init(struct page *page)
 	zone_device_folio_init(folio, 0);
 }
 
+static inline void zone_device_private_split_cb(struct folio *original_folio,
+						struct folio *new_folio)
+{
+	if (folio_is_device_private(original_folio)) {
+		if (!original_folio->pgmap->ops->folio_split) {
+			if (new_folio) {
+				new_folio->pgmap = original_folio->pgmap;
+				new_folio->page.mapping =
+					original_folio->page.mapping;
+			}
+		} else {
+			original_folio->pgmap->ops->folio_split(original_folio,
+								 new_folio);
+		}
+	}
+}
+
 #else
 static inline void *devm_memremap_pages(struct device *dev,
 		struct dev_pagemap *pgmap)
@@ -268,6 +292,11 @@ static inline unsigned long memremap_compat_align(void)
 {
 	return PAGE_SIZE;
 }
+
+static inline void zone_device_private_split_cb(struct folio *original_folio,
+						struct folio *new_folio)
+{
+}
 #endif /* CONFIG_ZONE_DEVICE */
 
 static inline void put_dev_pagemap(struct dev_pagemap *pgmap)
diff --git a/include/linux/mm.h b/include/linux/mm.h
index a6bfa46937a8..f9c8983c2055 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1250,6 +1250,7 @@ static inline struct folio *virt_to_folio(const void *x)
 void __folio_put(struct folio *folio);
 
 void split_page(struct page *page, unsigned int order);
+void prep_compound_page(struct page *page, unsigned int order);
 void folio_copy(struct folio *dst, struct folio *src);
 int folio_mc_copy(struct folio *dst, struct folio *src);
 
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 50e175edc58a..41092c065c2d 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -1653,9 +1653,44 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	return ret;
 }
 
+static void dmirror_devmem_folio_split(struct folio *head, struct folio *tail)
+{
+	struct page *rpage = BACKING_PAGE(folio_page(head, 0));
+	struct page *rpage_tail;
+	struct folio *rfolio;
+	unsigned long offset = 0;
+
+	if (!rpage) {
+		tail->page.zone_device_data = NULL;
+		return;
+	}
+
+	rfolio = page_folio(rpage);
+
+	if (tail == NULL) {
+		folio_reset_order(rfolio);
+		rfolio->mapping = NULL;
+		folio_set_count(rfolio, 1);
+		return;
+	}
+
+	offset = folio_pfn(tail) - folio_pfn(head);
+
+	rpage_tail = folio_page(rfolio, offset);
+	tail->page.zone_device_data = rpage_tail;
+	rpage_tail->zone_device_data = rpage->zone_device_data;
+	clear_compound_head(rpage_tail);
+	rpage_tail->mapping = NULL;
+
+	folio_page(tail, 0)->mapping = folio_page(head, 0)->mapping;
+	tail->pgmap = head->pgmap;
+	folio_set_count(page_folio(rpage_tail), 1);
+}
+
 static const struct dev_pagemap_ops dmirror_devmem_ops = {
 	.page_free	= dmirror_devmem_free,
 	.migrate_to_ram	= dmirror_devmem_fault,
+	.folio_split	= dmirror_devmem_folio_split,
 };
 
 static int dmirror_device_init(struct dmirror_device *mdevice, int id)
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index d634b2157a56..e38482e6e5c0 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3907,7 +3907,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 
 		ret = __split_unmapped_folio(folio, new_order, split_at, &xas,
 					     mapping, uniform_split);
-
 		/*
 		 * Unfreeze after-split folios and put them back to the right
 		 * list. @folio should be kept frozon until page cache
@@ -3958,6 +3957,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 			__filemap_remove_folio(new_folio, NULL);
 			folio_put_refs(new_folio, nr_pages);
 		}
+
 		/*
 		 * Unfreeze @folio only after all page cache entries, which
 		 * used to point to it, have been updated with new folios.
-- 
2.50.1

