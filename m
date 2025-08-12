Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD013B21AD6
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 04:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA4F10E571;
	Tue, 12 Aug 2025 02:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QjXM7gPH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F5F10E571
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 02:41:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQRTEtwOfvDLSPxgBJWNjeXdEYkKBneEfFfjoOs3S+5Xn1pjoJ5AnjIS7T3U67ApfPzSF8/7riTDt2rz1TUhGAbGKwoOpi3RP3KxpbXi5CTrhoVHL8S2XhwlzrtyFpqKY7KGQ24luLESZYoXcfwKhX8PN6FLkRfY9dnUmn/Ckk8cLqHjJd5Ls0gmPt0fiefeK235eizYVeY8gJ6pcE0IDyyLGwPNru6mW4tEuLhSBoNvWkAcsgE7VSUMDjuzZTN8BrXE/vwYF5oQXa2epkyFUeBp1GT8qla/UQ3bDRJoif0/a4GyvTrvfWJsBkmI6MmQgQU36Yvaf7pcFnhhkZhZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFkFwadZtXjcY5QZa6F74BJGKb3PmXhFv7ISIxUPz2g=;
 b=D5HSl0hS6VdWqPkXDj/lOF07SUK3kuXsuzvkw5o6L9R6mwGyxe0jX2CwXpq+gEQr6nG2miTTW02R1sIhW/aycsSrt4hkfoiDOlkxDiGxd/0Zp3vTgxNsQQDd3HL295TD0e39Ym9d6uIG5lbu7kiAtQ6Lfdt+WGBxue3La1ss7JkPsd6Cs2NcZ5HR15rTkOs//vV/NyM3+hqU/3nGjWdNYWZ+Ka2vGePhMGeKx3jnbxsYA+51t2HMQRactA8pgP/8dTjaSy8q2UTbK8b+uWFqprruhgwTpSd/7ZM0VkaqNFG9Sjl2pPptWjm2tAYkEmg5GsOTAGen+RepBVaoEEkiqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFkFwadZtXjcY5QZa6F74BJGKb3PmXhFv7ISIxUPz2g=;
 b=QjXM7gPHrtJhmLmJgaajtPHozm7xyUYxsgkeNc2oCkfbslZema9cmHKB/Yp8bbbewzUippfxVv+U4PMSoaG+lMKrAoDY8shwvFZK8VwNihwJuVsvhyL0p/WQrDrIV478TKxCP4KkheJPlYw9i6X51k2gS2wGQtzi3GsvhRNm7WnXn9dbk3n+PHk5nicKKJ/XmNsmXlUzuVU4Jfk57buA4NLZMHRO8JWskw1zyQPDRnEBx2jBGdgkwXhnh1itW8cb4k+oWBVKH1ko+Zm5X9vHY87O4YOXq70z+fissVDxj29JirZKAM0qIOmbZr6sRW2UwsJxvIRhRyVNedh2c9cRMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CY8PR12MB7172.namprd12.prod.outlook.com (2603:10b6:930:5b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Tue, 12 Aug
 2025 02:40:52 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 02:40:52 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
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
Subject: [v3 03/11] mm/migrate_device: THP migration of zone device pages
Date: Tue, 12 Aug 2025 12:40:28 +1000
Message-ID: <20250812024036.690064-4-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812024036.690064-1-balbirs@nvidia.com>
References: <20250812024036.690064-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY6PR01CA0158.ausprd01.prod.outlook.com
 (2603:10c6:10:1ba::6) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CY8PR12MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: c486f5a6-1cd9-49d1-54f1-08ddd949a70d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clFuNDdqOHB1bG45alQwcDgwTlpPODQ2OGNJeU1sYnpQdHk4YlJzMzBaNTdZ?=
 =?utf-8?B?b3oyQVJpejRNQlVvTFpaZkQwWHdQMlpqUGE4NDVXME5OTk1EN2p4R0ZtbTdW?=
 =?utf-8?B?Zm5rSTJQY2gxQWlrc21tY3JjRkllb2VEOC9BTlZoWVdVM0NRdklZa1JrYjlZ?=
 =?utf-8?B?R2JyQnFOd2hSa0JaMm9QMzJpUXdGTUE4WlhxU3RCeVI1a1ZpWE5iVmdqQ2I0?=
 =?utf-8?B?SXA1NGVUYUNiVFFaci9kT2RwV2dKS05CTkVwcG50VXZJRlhDUDZhckNxOTNw?=
 =?utf-8?B?TkxSQm5mQkxnL3pJZlhOUTdJYnlub2Q4MFkwZkJVcHRTRlpTQ3FCcFZqQWVM?=
 =?utf-8?B?cys0bENTOUR0UXlpdDFFeUhsYUdtbStmdXpsTjFRQ2JuRHBUU1JQWUtaU29Z?=
 =?utf-8?B?eDhkRnA2dU4rSVdRSzdPbWZheHZOUmdHMlVsSmNycFhWRW5USnExcGNsdDY2?=
 =?utf-8?B?TG50NmJVNXRhZm5oK1RiQkJITnEyWUtKTzl0OW4xRElzSjhSNE9jUjFYNU43?=
 =?utf-8?B?UFNmeG5BZzYwWllpc3ZNb0FMLzJOeXNLMklESU05dXQ2NkxXSUtkb2p3THQ3?=
 =?utf-8?B?M01kdFFicWg2NkNVeE15aFdiTGxPazNvVVg3N1NGeHVjc3VqaXVLSTdybGFJ?=
 =?utf-8?B?Y3lscmpXSytwcHFNUUNNMUIwaWs0Y1dNL0JwQys1cWYrZ0VLaHVpY2s0QTJy?=
 =?utf-8?B?YkYwZWlTUDk4TkRNZWNmaUFJYkxuR2dRcGZUZ1RLc0dCN3Brdk5ETGxmcS9n?=
 =?utf-8?B?a0tXcWkxSTdGMEV6Y2J5NWprcy9JREIvczE1eG5sdFNONjBzcXl1S1h6dmVJ?=
 =?utf-8?B?OEF0VStqSGI0akxFWVFJbXFSbjI2YzZSSnJVR0RrN2ZwZFoyOEp5TURESkc2?=
 =?utf-8?B?TmcrWlByT0pNMHEwemUyN3JqTURwdGNCSGcydU5wZVZQSTd6cng0OVROV3gx?=
 =?utf-8?B?bHVsbFdBek0wemJXeDdJRmt4WGpXRXh2SXhLbUpMZ1Y5UlRSZnRhMmRxdmNQ?=
 =?utf-8?B?N0pxQlAyc0hYNkRlU2EwWjVtd3Vyd3E1YlF2d2xTblAwUVkxYXBadnQzMkFO?=
 =?utf-8?B?RzUzbWhTY1RTRnUzM2RtSHZrazhEL3ROWGxlN2J4WFJCNFM4OEV1b0pMNDVZ?=
 =?utf-8?B?SlE2clcvSEhDcEpHQ21YUXNtTXAxSkdPR3FWanpRK1VSckI1LzgyaDE5cFVH?=
 =?utf-8?B?MG10a0NTQUpjQjkyUVROVms0VzlkY051K2ppc0FpaXBCc2NQMUQ5N2VNaXlY?=
 =?utf-8?B?R1l5dVlIYmswWlQ3VGY0MHFLdEcrQjJ3OFZic29kOXlkQnVNb3ErYWk4cER0?=
 =?utf-8?B?VTZ6NU0xT1V1eXFhTnZ2TFdHbXhna1dPZGlUWmVBSFRoV1o2VytlQWNVeVNk?=
 =?utf-8?B?emFXUjB3NFNmb0l3d0tUSkJZMFpSR2d1ZWJ0Zk5sMzJMYm1LMEtJRk5tRG53?=
 =?utf-8?B?VXJtUy9vRGNvVW5lU25Qd0U3VXk1cmVEYzdzU3JKKzlQZjdRZ1Juem9MU2dY?=
 =?utf-8?B?NmhZeWo4ajlVUUJkdlFsWW5LeDAvZVhDaHlTYjFvSWlpTjZpbG1CRVJoTFNv?=
 =?utf-8?B?OXNTU2F0Q2l5S2l1eFIzbzJmMW5oVVI4c2lIaEQzV0Q4ZUJVRHJsMHVpcDc5?=
 =?utf-8?B?R0kwa2pKUk5iUENLamNMaGIybXBXd1pRU2g3Mmo4ZHh0cWtiZmFONlRCclNZ?=
 =?utf-8?B?NlpNcFEwYnoyekh2NVlMaWNpb1F0SjJsZVZ0Q3Q1V0ZNVVU3ZUpaWlRFWEJh?=
 =?utf-8?B?SVp5NHB1azFwZTRRMTBiZkZSS1d3V0tZcTVVbWNCVk9RcGlTZXBmQWFEdWd3?=
 =?utf-8?B?VmtRMnd5VUJpMlRRbmZFM0VDN0xmcFhscE93L2wzWVlDSERYS1BHcG5PenpE?=
 =?utf-8?B?L1FKcUtMYVA3czJDOXhES2VUZ2U1UFBIeUxYeWFpRWNPZ0RZamZ0YmowbThQ?=
 =?utf-8?Q?/lHEYPCdKME=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K09ReWlNdTF3dGJ0Tmk2bWh6SkR5aVBWUU03dWhkREVuU0s5QzVFMnN4cmpm?=
 =?utf-8?B?MmZnSEdhZXNIM3NaTmNvT3dhWFlXRGZ0R0dwZmhLYnVzRys1NjkyTDh5RmJl?=
 =?utf-8?B?aXowWTY1OHdGbXRuQW5hMWdDVitEUGRrM1g3SHdqYWF6ZWszcGFTVTVRU3Bk?=
 =?utf-8?B?MDZzbElYT2MzaG9hWXJKTk0vMVYwMjVPbGoyRFI0RUtjVnZDVmltYTJGbUh6?=
 =?utf-8?B?N3BFbzI0U2l0L3NDZnZKbGYxVVkwaGhqb25CMXU1WXRBOEVvamJaMG5DaXBO?=
 =?utf-8?B?OHM0SFQ4OWJaN2Frc2xDODhKczhjU3ZUZ3dTS0RaRGZMOVQ0Q3JjV256T1FE?=
 =?utf-8?B?WE1qdXVCRFd0V2QwVzk1R2ZuTHBoaUNsOXRQRFBkaG1maGpSdmxLUUg5amNS?=
 =?utf-8?B?cU5TSzRZZ0V1a1NvTlJBTTZKR0JzZENUUm0zaVBSSndoN1J1b3RlQnE1VEhM?=
 =?utf-8?B?VndkVHBGRkphMDZzODNZajFCdmQvSXo2MUVHS3F1em9vMFkyZ3NlNFd4cUg2?=
 =?utf-8?B?NlZuTnZoTVI4cmRsbHhQWWFsU2o5MWUxeWRsQ1dvTG4zb3BVNUJONzI2NGJC?=
 =?utf-8?B?bklrTzRJOGhza21tTHhGTVBlUUpFZ1ZQekNqMFp5WUVSdmpXSGJDdmVMdUlj?=
 =?utf-8?B?L05Kb2dvbGtvRlVUbnVyMHdobEF4L2cvU1ZGUS9zZFY3NktySmR1V0Mrd0Fm?=
 =?utf-8?B?L3NFcGswSUdlcTVRZUFLNE1qeHhVcnN2c0hsVTFsMDF2ZmtrS2hudnlrQjlT?=
 =?utf-8?B?Vm9vZWZyalVlQTRZdFFLWVRDNnNMMjVmQjdSdFB1STlBaGVLY2lxbW1mbWti?=
 =?utf-8?B?Vi93MkFUVFJiZW9TQ3czT0ZQNy95R01MbDVROXNTM3NRczJsWURqUUhSaFRF?=
 =?utf-8?B?TFg0bURWSHNoNHU4R2lvMEwzMkxkalo5SlQ3aVMzNnlsTXJHUFkzNC9vY3Yr?=
 =?utf-8?B?aFgwbHJCWG9Iayt0VzBUSlRXUlZTbUdkalhHczhJQTgrdDFObC90NllsOUNM?=
 =?utf-8?B?S0lKVzNLTmxqcHUzOXRxWkVzTjlBOWpnOHlmR3Y2eVloaTFDTzNFRjVCYXN0?=
 =?utf-8?B?RkZueENWTDNFSE1NMU1SUmpLKzRueGVXRHJGem9VbVpxNzdKZkRJRTVHbVlm?=
 =?utf-8?B?bWxZRm9pNWNtVVlVdEZXempRZVVJRHM2c3RYWk5jNUxLS0ZJWE1ndjk3aG1K?=
 =?utf-8?B?Ukh6d2xJV3B2WlpScXQwdlRzL3dFT1Rob3JreGFVc0FaSTJWeEc4aGhmU0NC?=
 =?utf-8?B?bld1R1FMQWNvK0VQYWNOVUxLVkdobllRdjIxTlJ4N2tKTlpnd3kyaWpTUVN4?=
 =?utf-8?B?UGppM3BCSlRPcERmVDdxUTZPTmdIKzEyRFA1ZVpHdTZtajdwUGhMWW9ranQz?=
 =?utf-8?B?RU1nVlY3YTdPUlFNQWRuZFcxVTc1NWhUbXRuUjFXV0M0VmZDUng5Y3MzOE9s?=
 =?utf-8?B?ZlZ5V0RCWThKendNSmZpbVJIVm5lQTk3MFFsTFArZHpkelA5K1l0Y1FxelIw?=
 =?utf-8?B?MTV4dXJ2RTFoMUVpR3FoY2hkRER0NytMOTFpSkduMnF4TmVydFQyWmk2UHRy?=
 =?utf-8?B?NzVjSkhwZ2ZxQklTcHFFL09KSUU0ZXZLZlUrb1JrdmxaeFVJRHlKaXhzQng0?=
 =?utf-8?B?T2RYUCthUkgyeHZaQW5UcUhvTmRDRk5pNnEva3FxVDhpckdjWmZjNDlobkFP?=
 =?utf-8?B?eG1mQWdnb1E0Vm9rbDZLeDFVOE5OS2lqbjFobk5sM01sUkhCMzdvenZMTlpU?=
 =?utf-8?B?VmhvVTBFWXRHTUNyWUZCNkNEOGNCVENCRG8xaUpmZytpZ2RLVWVGaFM0eWI4?=
 =?utf-8?B?U1puRkozZit2cHpLakdYNXZHQ3I1aGc3a0plY2czMTBSNUVyRjN6Mm0zU3VS?=
 =?utf-8?B?dWN5Y3IwK3NsSzQ4aXVkNWkwa3JiSGlaMGR5KzRWQjJoVytTMC93cTBxR1d5?=
 =?utf-8?B?cjM0ZzNjMGFyUmluYXJWMkQ0RWN4MGRIUGZ5aFhLQ3RSTmd1OXVZblExekky?=
 =?utf-8?B?b0tqWGRpNHFpc09aS0VHTVI0Y1V6SVdTZEZnVkRvdUxPeW84aEVQaXgxZHNu?=
 =?utf-8?B?VzZpY1JQU3Y5c1dJNTNPanZGeGxYWFZSQUVDTFFZYktMN2V0bGdxVTdEblhR?=
 =?utf-8?Q?ilA7kQjiGOtRWHTrVw3xxmPV8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c486f5a6-1cd9-49d1-54f1-08ddd949a70d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 02:40:51.7734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQsydig4LLe3+33Pb173tV/afxsdgnSgbCJHzWy27cLHwU0FF3CD+o/EpSvqnHVEyITUggTRx1o1cKwqOSDHpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7172
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

MIGRATE_VMA_SELECT_COMPOUND will be used to select THP pages during
migrate_vma_setup() and MIGRATE_PFN_COMPOUND will make migrating
device pages as compound pages during device pfn migration.

migrate_device code paths go through the collect, setup
and finalize phases of migration.

The entries in src and dst arrays passed to these functions still
remain at a PAGE_SIZE granularity. When a compound page is passed,
the first entry has the PFN along with MIGRATE_PFN_COMPOUND
and other flags set (MIGRATE_PFN_MIGRATE, MIGRATE_PFN_VALID), the
remaining entries (HPAGE_PMD_NR - 1) are filled with 0's. This
representation allows for the compound page to be split into smaller
page sizes.

migrate_vma_collect_hole(), migrate_vma_collect_pmd() are now THP
page aware. Two new helper functions migrate_vma_collect_huge_pmd()
and migrate_vma_insert_huge_pmd_page() have been added.

migrate_vma_collect_huge_pmd() can collect THP pages, but if for
some reason this fails, there is fallback support to split the folio
and migrate it.

migrate_vma_insert_huge_pmd_page() closely follows the logic of
migrate_vma_insert_page()

Support for splitting pages as needed for migration will follow in
later patches in this series.

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
 include/linux/migrate.h |   2 +
 mm/migrate_device.c     | 457 ++++++++++++++++++++++++++++++++++------
 2 files changed, 396 insertions(+), 63 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index acadd41e0b5c..d9cef0819f91 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -129,6 +129,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
 #define MIGRATE_PFN_VALID	(1UL << 0)
 #define MIGRATE_PFN_MIGRATE	(1UL << 1)
 #define MIGRATE_PFN_WRITE	(1UL << 3)
+#define MIGRATE_PFN_COMPOUND	(1UL << 4)
 #define MIGRATE_PFN_SHIFT	6
 
 static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
@@ -147,6 +148,7 @@ enum migrate_vma_direction {
 	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
 	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
 	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
+	MIGRATE_VMA_SELECT_COMPOUND = 1 << 3,
 };
 
 struct migrate_vma {
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 0ed337f94fcd..6621bba62710 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -14,6 +14,7 @@
 #include <linux/pagewalk.h>
 #include <linux/rmap.h>
 #include <linux/swapops.h>
+#include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 #include "internal.h"
 
@@ -44,6 +45,23 @@ static int migrate_vma_collect_hole(unsigned long start,
 	if (!vma_is_anonymous(walk->vma))
 		return migrate_vma_collect_skip(start, end, walk);
 
+	if (thp_migration_supported() &&
+		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
+		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
+		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
+		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE |
+						MIGRATE_PFN_COMPOUND;
+		migrate->dst[migrate->npages] = 0;
+		migrate->npages++;
+		migrate->cpages++;
+
+		/*
+		 * Collect the remaining entries as holes, in case we
+		 * need to split later
+		 */
+		return migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
+	}
+
 	for (addr = start; addr < end; addr += PAGE_SIZE) {
 		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE;
 		migrate->dst[migrate->npages] = 0;
@@ -54,57 +72,151 @@ static int migrate_vma_collect_hole(unsigned long start,
 	return 0;
 }
 
-static int migrate_vma_collect_pmd(pmd_t *pmdp,
-				   unsigned long start,
-				   unsigned long end,
-				   struct mm_walk *walk)
+/**
+ * migrate_vma_collect_huge_pmd - collect THP pages without splitting the
+ * folio for device private pages.
+ * @pmdp: pointer to pmd entry
+ * @start: start address of the range for migration
+ * @end: end address of the range for migration
+ * @walk: mm_walk callback structure
+ *
+ * Collect the huge pmd entry at @pmdp for migration and set the
+ * MIGRATE_PFN_COMPOUND flag in the migrate src entry to indicate that
+ * migration will occur at HPAGE_PMD granularity
+ */
+static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
+					unsigned long end, struct mm_walk *walk,
+					struct folio *fault_folio)
 {
+	struct mm_struct *mm = walk->mm;
+	struct folio *folio;
 	struct migrate_vma *migrate = walk->private;
-	struct folio *fault_folio = migrate->fault_page ?
-		page_folio(migrate->fault_page) : NULL;
-	struct vm_area_struct *vma = walk->vma;
-	struct mm_struct *mm = vma->vm_mm;
-	unsigned long addr = start, unmapped = 0;
 	spinlock_t *ptl;
-	pte_t *ptep;
+	swp_entry_t entry;
+	int ret;
+	unsigned long write = 0;
 
-again:
-	if (pmd_none(*pmdp))
+	ptl = pmd_lock(mm, pmdp);
+	if (pmd_none(*pmdp)) {
+		spin_unlock(ptl);
 		return migrate_vma_collect_hole(start, end, -1, walk);
+	}
 
 	if (pmd_trans_huge(*pmdp)) {
-		struct folio *folio;
-
-		ptl = pmd_lock(mm, pmdp);
-		if (unlikely(!pmd_trans_huge(*pmdp))) {
+		if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
 			spin_unlock(ptl);
-			goto again;
+			return migrate_vma_collect_skip(start, end, walk);
 		}
 
 		folio = pmd_folio(*pmdp);
 		if (is_huge_zero_folio(folio)) {
 			spin_unlock(ptl);
-			split_huge_pmd(vma, pmdp, addr);
-		} else {
-			int ret;
+			return migrate_vma_collect_hole(start, end, -1, walk);
+		}
+		if (pmd_write(*pmdp))
+			write = MIGRATE_PFN_WRITE;
+	} else if (!pmd_present(*pmdp)) {
+		entry = pmd_to_swp_entry(*pmdp);
+		folio = pfn_swap_entry_folio(entry);
+
+		if (!is_device_private_entry(entry) ||
+			!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
+			(folio->pgmap->owner != migrate->pgmap_owner)) {
+			spin_unlock(ptl);
+			return migrate_vma_collect_skip(start, end, walk);
+		}
 
-			folio_get(folio);
+		if (is_migration_entry(entry)) {
+			migration_entry_wait_on_locked(entry, ptl);
 			spin_unlock(ptl);
-			/* FIXME: we don't expect THP for fault_folio */
-			if (WARN_ON_ONCE(fault_folio == folio))
-				return migrate_vma_collect_skip(start, end,
-								walk);
-			if (unlikely(!folio_trylock(folio)))
-				return migrate_vma_collect_skip(start, end,
-								walk);
-			ret = split_folio(folio);
-			if (fault_folio != folio)
-				folio_unlock(folio);
-			folio_put(folio);
-			if (ret)
-				return migrate_vma_collect_skip(start, end,
-								walk);
+			return -EAGAIN;
 		}
+
+		if (is_writable_device_private_entry(entry))
+			write = MIGRATE_PFN_WRITE;
+	} else {
+		spin_unlock(ptl);
+		return -EAGAIN;
+	}
+
+	folio_get(folio);
+	if (folio != fault_folio && unlikely(!folio_trylock(folio))) {
+		spin_unlock(ptl);
+		folio_put(folio);
+		return migrate_vma_collect_skip(start, end, walk);
+	}
+
+	if (thp_migration_supported() &&
+		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
+		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
+		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
+
+		struct page_vma_mapped_walk pvmw = {
+			.ptl = ptl,
+			.address = start,
+			.pmd = pmdp,
+			.vma = walk->vma,
+		};
+
+		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
+
+		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
+						| MIGRATE_PFN_MIGRATE
+						| MIGRATE_PFN_COMPOUND;
+		migrate->dst[migrate->npages++] = 0;
+		migrate->cpages++;
+		ret = set_pmd_migration_entry(&pvmw, folio_page(folio, 0));
+		if (ret) {
+			migrate->npages--;
+			migrate->cpages--;
+			migrate->src[migrate->npages] = 0;
+			migrate->dst[migrate->npages] = 0;
+			goto fallback;
+		}
+		migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
+		spin_unlock(ptl);
+		return 0;
+	}
+
+fallback:
+	spin_unlock(ptl);
+	if (!folio_test_large(folio))
+		goto done;
+	ret = split_folio(folio);
+	if (fault_folio != folio)
+		folio_unlock(folio);
+	folio_put(folio);
+	if (ret)
+		return migrate_vma_collect_skip(start, end, walk);
+	if (pmd_none(pmdp_get_lockless(pmdp)))
+		return migrate_vma_collect_hole(start, end, -1, walk);
+
+done:
+	return -ENOENT;
+}
+
+static int migrate_vma_collect_pmd(pmd_t *pmdp,
+				   unsigned long start,
+				   unsigned long end,
+				   struct mm_walk *walk)
+{
+	struct migrate_vma *migrate = walk->private;
+	struct vm_area_struct *vma = walk->vma;
+	struct mm_struct *mm = vma->vm_mm;
+	unsigned long addr = start, unmapped = 0;
+	spinlock_t *ptl;
+	struct folio *fault_folio = migrate->fault_page ?
+		page_folio(migrate->fault_page) : NULL;
+	pte_t *ptep;
+
+again:
+	if (pmd_trans_huge(*pmdp) || !pmd_present(*pmdp)) {
+		int ret = migrate_vma_collect_huge_pmd(pmdp, start, end, walk, fault_folio);
+
+		if (ret == -EAGAIN)
+			goto again;
+		if (ret == 0)
+			return 0;
 	}
 
 	ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
@@ -222,8 +334,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
 		}
 
-		/* FIXME support THP */
-		if (!page || !page->mapping || PageTransCompound(page)) {
+		if (!page || !page->mapping) {
 			mpfn = 0;
 			goto next;
 		}
@@ -394,14 +505,6 @@ static bool migrate_vma_check_page(struct page *page, struct page *fault_page)
 	 */
 	int extra = 1 + (page == fault_page);
 
-	/*
-	 * FIXME support THP (transparent huge page), it is bit more complex to
-	 * check them than regular pages, because they can be mapped with a pmd
-	 * or with a pte (split pte mapping).
-	 */
-	if (folio_test_large(folio))
-		return false;
-
 	/* Page from ZONE_DEVICE have one extra reference */
 	if (folio_is_zone_device(folio))
 		extra++;
@@ -432,17 +535,24 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 
 	lru_add_drain();
 
-	for (i = 0; i < npages; i++) {
+	for (i = 0; i < npages; ) {
 		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 		struct folio *folio;
+		unsigned int nr = 1;
 
 		if (!page) {
 			if (src_pfns[i] & MIGRATE_PFN_MIGRATE)
 				unmapped++;
-			continue;
+			goto next;
 		}
 
 		folio =	page_folio(page);
+		nr = folio_nr_pages(folio);
+
+		if (nr > 1)
+			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+
+
 		/* ZONE_DEVICE folios are not on LRU */
 		if (!folio_is_zone_device(folio)) {
 			if (!folio_test_lru(folio) && allow_drain) {
@@ -454,7 +564,7 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 			if (!folio_isolate_lru(folio)) {
 				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 				restore++;
-				continue;
+				goto next;
 			}
 
 			/* Drop the reference we took in collect */
@@ -473,10 +583,12 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 			restore++;
-			continue;
+			goto next;
 		}
 
 		unmapped++;
+next:
+		i += nr;
 	}
 
 	for (i = 0; i < npages && restore; i++) {
@@ -622,6 +734,147 @@ int migrate_vma_setup(struct migrate_vma *args)
 }
 EXPORT_SYMBOL(migrate_vma_setup);
 
+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
+/**
+ * migrate_vma_insert_huge_pmd_page: Insert a huge folio into @migrate->vma->vm_mm
+ * at @addr. folio is already allocated as a part of the migration process with
+ * large page.
+ *
+ * @folio needs to be initialized and setup after it's allocated. The code bits
+ * here follow closely the code in __do_huge_pmd_anonymous_page(). This API does
+ * not support THP zero pages.
+ *
+ * @migrate: migrate_vma arguments
+ * @addr: address where the folio will be inserted
+ * @folio: folio to be inserted at @addr
+ * @src: src pfn which is being migrated
+ * @pmdp: pointer to the pmd
+ */
+static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
+					 unsigned long addr,
+					 struct page *page,
+					 unsigned long *src,
+					 pmd_t *pmdp)
+{
+	struct vm_area_struct *vma = migrate->vma;
+	gfp_t gfp = vma_thp_gfp_mask(vma);
+	struct folio *folio = page_folio(page);
+	int ret;
+	vm_fault_t csa_ret;
+	spinlock_t *ptl;
+	pgtable_t pgtable;
+	pmd_t entry;
+	bool flush = false;
+	unsigned long i;
+
+	VM_WARN_ON_FOLIO(!folio, folio);
+	VM_WARN_ON_ONCE(!pmd_none(*pmdp) && !is_huge_zero_pmd(*pmdp));
+
+	if (!thp_vma_suitable_order(vma, addr, HPAGE_PMD_ORDER))
+		return -EINVAL;
+
+	ret = anon_vma_prepare(vma);
+	if (ret)
+		return ret;
+
+	folio_set_order(folio, HPAGE_PMD_ORDER);
+	folio_set_large_rmappable(folio);
+
+	if (mem_cgroup_charge(folio, migrate->vma->vm_mm, gfp)) {
+		count_vm_event(THP_FAULT_FALLBACK);
+		count_mthp_stat(HPAGE_PMD_ORDER, MTHP_STAT_ANON_FAULT_FALLBACK_CHARGE);
+		ret = -ENOMEM;
+		goto abort;
+	}
+
+	__folio_mark_uptodate(folio);
+
+	pgtable = pte_alloc_one(vma->vm_mm);
+	if (unlikely(!pgtable))
+		goto abort;
+
+	if (folio_is_device_private(folio)) {
+		swp_entry_t swp_entry;
+
+		if (vma->vm_flags & VM_WRITE)
+			swp_entry = make_writable_device_private_entry(
+						page_to_pfn(page));
+		else
+			swp_entry = make_readable_device_private_entry(
+						page_to_pfn(page));
+		entry = swp_entry_to_pmd(swp_entry);
+	} else {
+		if (folio_is_zone_device(folio) &&
+		    !folio_is_device_coherent(folio)) {
+			goto abort;
+		}
+		entry = folio_mk_pmd(folio, vma->vm_page_prot);
+		if (vma->vm_flags & VM_WRITE)
+			entry = pmd_mkwrite(pmd_mkdirty(entry), vma);
+	}
+
+	ptl = pmd_lock(vma->vm_mm, pmdp);
+	csa_ret = check_stable_address_space(vma->vm_mm);
+	if (csa_ret)
+		goto abort;
+
+	/*
+	 * Check for userfaultfd but do not deliver the fault. Instead,
+	 * just back off.
+	 */
+	if (userfaultfd_missing(vma))
+		goto unlock_abort;
+
+	if (!pmd_none(*pmdp)) {
+		if (!is_huge_zero_pmd(*pmdp))
+			goto unlock_abort;
+		flush = true;
+	} else if (!pmd_none(*pmdp))
+		goto unlock_abort;
+
+	add_mm_counter(vma->vm_mm, MM_ANONPAGES, HPAGE_PMD_NR);
+	folio_add_new_anon_rmap(folio, vma, addr, RMAP_EXCLUSIVE);
+	if (!folio_is_zone_device(folio))
+		folio_add_lru_vma(folio, vma);
+	folio_get(folio);
+
+	if (flush) {
+		pte_free(vma->vm_mm, pgtable);
+		flush_cache_page(vma, addr, addr + HPAGE_PMD_SIZE);
+		pmdp_invalidate(vma, addr, pmdp);
+	} else {
+		pgtable_trans_huge_deposit(vma->vm_mm, pmdp, pgtable);
+		mm_inc_nr_ptes(vma->vm_mm);
+	}
+	set_pmd_at(vma->vm_mm, addr, pmdp, entry);
+	update_mmu_cache_pmd(vma, addr, pmdp);
+
+	spin_unlock(ptl);
+
+	count_vm_event(THP_FAULT_ALLOC);
+	count_mthp_stat(HPAGE_PMD_ORDER, MTHP_STAT_ANON_FAULT_ALLOC);
+	count_memcg_event_mm(vma->vm_mm, THP_FAULT_ALLOC);
+
+	return 0;
+
+unlock_abort:
+	spin_unlock(ptl);
+abort:
+	for (i = 0; i < HPAGE_PMD_NR; i++)
+		src[i] &= ~MIGRATE_PFN_MIGRATE;
+	return 0;
+}
+#else /* !CONFIG_ARCH_ENABLE_THP_MIGRATION */
+static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
+					 unsigned long addr,
+					 struct page *page,
+					 unsigned long *src,
+					 pmd_t *pmdp)
+{
+	return 0;
+}
+#endif
+
 /*
  * This code closely matches the code in:
  *   __handle_mm_fault()
@@ -632,9 +885,10 @@ EXPORT_SYMBOL(migrate_vma_setup);
  */
 static void migrate_vma_insert_page(struct migrate_vma *migrate,
 				    unsigned long addr,
-				    struct page *page,
+				    unsigned long *dst,
 				    unsigned long *src)
 {
+	struct page *page = migrate_pfn_to_page(*dst);
 	struct folio *folio = page_folio(page);
 	struct vm_area_struct *vma = migrate->vma;
 	struct mm_struct *mm = vma->vm_mm;
@@ -662,8 +916,25 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 	pmdp = pmd_alloc(mm, pudp, addr);
 	if (!pmdp)
 		goto abort;
-	if (pmd_trans_huge(*pmdp))
-		goto abort;
+
+	if (thp_migration_supported() && (*dst & MIGRATE_PFN_COMPOUND)) {
+		int ret = migrate_vma_insert_huge_pmd_page(migrate, addr, page,
+								src, pmdp);
+		if (ret)
+			goto abort;
+		return;
+	}
+
+	if (!pmd_none(*pmdp)) {
+		if (pmd_trans_huge(*pmdp)) {
+			if (!is_huge_zero_pmd(*pmdp))
+				goto abort;
+			folio_get(pmd_folio(*pmdp));
+			split_huge_pmd(vma, pmdp, addr);
+		} else if (pmd_leaf(*pmdp))
+			goto abort;
+	}
+
 	if (pte_alloc(mm, pmdp))
 		goto abort;
 	if (unlikely(anon_vma_prepare(vma)))
@@ -754,23 +1025,24 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 	unsigned long i;
 	bool notified = false;
 
-	for (i = 0; i < npages; i++) {
+	for (i = 0; i < npages; ) {
 		struct page *newpage = migrate_pfn_to_page(dst_pfns[i]);
 		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 		struct address_space *mapping;
 		struct folio *newfolio, *folio;
 		int r, extra_cnt = 0;
+		unsigned long nr = 1;
 
 		if (!newpage) {
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-			continue;
+			goto next;
 		}
 
 		if (!page) {
 			unsigned long addr;
 
 			if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE))
-				continue;
+				goto next;
 
 			/*
 			 * The only time there is no vma is when called from
@@ -788,15 +1060,47 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 					migrate->pgmap_owner);
 				mmu_notifier_invalidate_range_start(&range);
 			}
-			migrate_vma_insert_page(migrate, addr, newpage,
+
+			if ((src_pfns[i] & MIGRATE_PFN_COMPOUND) &&
+				(!(dst_pfns[i] & MIGRATE_PFN_COMPOUND))) {
+				nr = HPAGE_PMD_NR;
+				src_pfns[i] &= ~MIGRATE_PFN_COMPOUND;
+				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
+				goto next;
+			}
+
+			migrate_vma_insert_page(migrate, addr, &dst_pfns[i],
 						&src_pfns[i]);
-			continue;
+			goto next;
 		}
 
 		newfolio = page_folio(newpage);
 		folio = page_folio(page);
 		mapping = folio_mapping(folio);
 
+		/*
+		 * If THP migration is enabled, check if both src and dst
+		 * can migrate large pages
+		 */
+		if (thp_migration_supported()) {
+			if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
+				(src_pfns[i] & MIGRATE_PFN_COMPOUND) &&
+				!(dst_pfns[i] & MIGRATE_PFN_COMPOUND)) {
+
+				if (!migrate) {
+					src_pfns[i] &= ~(MIGRATE_PFN_MIGRATE |
+							 MIGRATE_PFN_COMPOUND);
+					goto next;
+				}
+				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
+			} else if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
+				(dst_pfns[i] & MIGRATE_PFN_COMPOUND) &&
+				!(src_pfns[i] & MIGRATE_PFN_COMPOUND)) {
+				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
+			}
+		}
+
+
 		if (folio_is_device_private(newfolio) ||
 		    folio_is_device_coherent(newfolio)) {
 			if (mapping) {
@@ -809,7 +1113,7 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 				if (!folio_test_anon(folio) ||
 				    !folio_free_swap(folio)) {
 					src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-					continue;
+					goto next;
 				}
 			}
 		} else if (folio_is_zone_device(newfolio)) {
@@ -817,7 +1121,7 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 			 * Other types of ZONE_DEVICE page are not supported.
 			 */
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-			continue;
+			goto next;
 		}
 
 		BUG_ON(folio_test_writeback(folio));
@@ -829,6 +1133,8 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 		else
 			folio_migrate_flags(newfolio, folio);
+next:
+		i += nr;
 	}
 
 	if (notified)
@@ -990,10 +1296,23 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
 int migrate_device_range(unsigned long *src_pfns, unsigned long start,
 			unsigned long npages)
 {
-	unsigned long i, pfn;
+	unsigned long i, j, pfn;
+
+	for (pfn = start, i = 0; i < npages; pfn++, i++) {
+		struct page *page = pfn_to_page(pfn);
+		struct folio *folio = page_folio(page);
+		unsigned int nr = 1;
 
-	for (pfn = start, i = 0; i < npages; pfn++, i++)
 		src_pfns[i] = migrate_device_pfn_lock(pfn);
+		nr = folio_nr_pages(folio);
+		if (nr > 1) {
+			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+			for (j = 1; j < nr; j++)
+				src_pfns[i+j] = 0;
+			i += j - 1;
+			pfn += j - 1;
+		}
+	}
 
 	migrate_device_unmap(src_pfns, npages, NULL);
 
@@ -1011,10 +1330,22 @@ EXPORT_SYMBOL(migrate_device_range);
  */
 int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages)
 {
-	unsigned long i;
+	unsigned long i, j;
+
+	for (i = 0; i < npages; i++) {
+		struct page *page = pfn_to_page(src_pfns[i]);
+		struct folio *folio = page_folio(page);
+		unsigned int nr = 1;
 
-	for (i = 0; i < npages; i++)
 		src_pfns[i] = migrate_device_pfn_lock(src_pfns[i]);
+		nr = folio_nr_pages(folio);
+		if (nr > 1) {
+			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+			for (j = 1; j < nr; j++)
+				src_pfns[i+j] = 0;
+			i += j - 1;
+		}
+	}
 
 	migrate_device_unmap(src_pfns, npages, NULL);
 
-- 
2.50.1

