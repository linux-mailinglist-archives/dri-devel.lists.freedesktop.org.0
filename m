Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A14AB48172
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 02:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7C310E31C;
	Mon,  8 Sep 2025 00:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XE2iRsYt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2864110E249
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 00:05:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkEDF2EDEtOrmpxueoX1QU+klw5oyrpMhLckOhf8tV6daRBIZhYw+m5at7QpNdzEywZmVccrYg6MQUEbR/7CMtpIQ1z0kHYJyRDcQ9OsmSXhDZU/pd2qgNnss22dO6vII999nj0Kfta4SQmp461Z1Yv3b3ylVwV6Q4U0Gl1jC6BqP4GjSAWvJUiRzy0YLJfw/3KmGQUzXUFrgc67j5ujWeNGE5ulggDdzmSpzfyO/tTYyc7FmKW/2ez0SuO8BL4KT1HqWvjoku9T7ci6tLPR2zPv3UgqqeAlu+hRAUgDMshKnW/ecLCXNJazNsVLvPaJMyVaTAR1t7YPNy5ug26uaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jlU4iva0cKyyEH6s4yHUBrXIynGlWSKU71M89M4zQU=;
 b=wgXsK5UsdjWkk+UfvRN/lpXL3Ah46gavRjgsCeFqpCK+0kVH2J1FOkhZ7uKvi0zspeg28tTpyBX+2Savviuvmy7PzpP969k7fK71ISXsRnq8ah+V0InwWAxUDlnz0Gvv6LQYMAfh7d0vfL4RngdxziNIg2f5yBbftRJjQ8Eu61SJtN4vE9XDl8QGtUwe+N/78KC0T1UfT8rn/QPTJZJvkUDXI2gFTKJMYO//QoCNbk/fZn9++pU1JVNSQmFxstG1+EDZQHGjLkqwkjE9W/IfALajbfaad+IxOpNDE8TN8+m6CJ+umshZvFR2SzAZTjlqUpTmLe44dovjawTVTke5sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jlU4iva0cKyyEH6s4yHUBrXIynGlWSKU71M89M4zQU=;
 b=XE2iRsYtjx+EjGDjrJlc+HVMG3KWTI3QGTT8qUQYRyZFNBIjSIMT5MTq+E2DUgQrCyKU68czl9fjovbWEVBHSXpQ082FxWr0FnheUA7XsK78uq3kmxt5UbX1XO1a94qWUsKzJ0fcflevL9o5IhhVTuLX8/wZlrBPiNUWxwiWv/nWw0zaPfuwIjaFj4vqf4IdBsPENcClqkk8EMuKgb/N0pyy7BO72XkPtaoobvUHFKcalpSVjo6Ex7Fzp1qYQqZ7K5boOdpCaxKlK2DjTBUqk4f+1pzp6vpJBEtbRGBFmQcDyJ85M2ZoXL8TSzwmr8mblwLuiZ00YP+wkExbeOEIyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS7PR12MB5887.namprd12.prod.outlook.com (2603:10b6:8:7a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.19; Mon, 8 Sep 2025 00:05:14 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 00:05:14 +0000
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
Subject: [v5 04/15] mm/huge_memory: implement device-private THP splitting
Date: Mon,  8 Sep 2025 10:04:37 +1000
Message-ID: <20250908000448.180088-5-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908000448.180088-1-balbirs@nvidia.com>
References: <20250908000448.180088-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0169.namprd03.prod.outlook.com
 (2603:10b6:a03:338::24) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS7PR12MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: 59a4112d-0560-4d63-7599-08ddee6b62a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDFSb1BHZGp4RnZEUEVVQkMrOStWZ1V1YzZ3Zm5GbG1FYjJRYURZRmZQRXY2?=
 =?utf-8?B?NnkyMFVWZnVDYTM3RE4wWFFWK0Vtd1lRa09xQnFPc3BPaUwvbmN5YU9GNUlQ?=
 =?utf-8?B?MFpzOXZwcmNvajZaaFFsZmN5U0R1UHBuZ09SWTRoekdFbFpZcjhodzg0R1lh?=
 =?utf-8?B?RG53RVpxWUtwaVFsczVCRWg1NjM3SmVlTDBlV1Z0dENGRWNjbEI4QkxZYmxv?=
 =?utf-8?B?Y3ZEdmZVR0N5bDlzME1hREJwOW9yZit6dTVoYUVTUWFodWlacWVwektHb1I1?=
 =?utf-8?B?WE5wY0hIWDd0MHh1a0krSUVEZWg3L1BYdVJBbkNrRlo3VzV2MkwzSkNpc3BB?=
 =?utf-8?B?WkcwcDVaYjQrTGFxK2FUcUM5MUd1TTB2cVVVWUtKb1dBVk5sWTMzSlh4c25D?=
 =?utf-8?B?UFJBbWpVanhJUHhaNERKRHV3T0F1WVhQeUE1OTRLRHlsVE5YSEZLdzRwTFJJ?=
 =?utf-8?B?UWlCeXVPS1lvdERwTGpOQ1Q4OVlhSVZGakFsVkJxbElFQnlCOXVZUGRzSXNa?=
 =?utf-8?B?YzZaYlBvWmFYNUlPZS9CRzNVb1l4SDJoYWYwWU5KbmlwOWtVbm4xbTgrVEJQ?=
 =?utf-8?B?Ukx4WTl6NFRjSHVFTXNxVVd4d0FyZnhHcDhmbks3cTV3NW12T29xWnExbnhx?=
 =?utf-8?B?SFVPY0IvMjZ0NEJvaVNtUlZSczJXUW1KNnNxSldiZ0dVWmpaNHQyMGNVMDQz?=
 =?utf-8?B?NmNvQWRNMmwxMjF1UXJRQkhIaElOVnFtbk5FOE9PTGNYTkxRZFRjRkxUWEVY?=
 =?utf-8?B?VWJjS3JmVGg5cUdjWjRsUkg4cXoyQi9UWlVaL2ZMdlhIMTZuOUFCV29NTEZr?=
 =?utf-8?B?b1FYejlVcitLd1VVZCtyTDRUSERnR05TTmVqU29oRnpiSCtmT0VLd05jODJF?=
 =?utf-8?B?ZGlrY054OG9PUm84bG5EczFMT2t6VTROR1Nyd1NiclhqdVJNTXRLczRjd1cz?=
 =?utf-8?B?YmlaTHFUenUzSGNibmlHTWZibzYrd1dTYkJnNFdBTDhqTDRPR2FjdGpFTTlO?=
 =?utf-8?B?OTQ4LzA3RkFTcm9NQzVtc3B0dmpBMEFFOWdrZVNFZmMxQitUVkJod3ZWaW5p?=
 =?utf-8?B?UXFRdWI5YWxObjhjM0dEOEp2Q0ZBN3dGVHhOa3RMYytkbWdERVNJNTJ1VUpo?=
 =?utf-8?B?aXVTQnRJMXZkR3VxYjEvM2FTejdONExRbWRaWG00dTcxdlcvYW1iVk1UVXFy?=
 =?utf-8?B?dEMzcGdXYWVkb1hjQ25zQjYvZFVQOEMxUnprTERqZndjaVhkdjFkTVNKL1hR?=
 =?utf-8?B?R1FPeGNMcjVDOUI5QnNGaFhBbllVRzk0WVMzTHRGRm1CNEFRNzFQU0MrWklV?=
 =?utf-8?B?SjRzZFg2TmVEQnptbWc4Wk5QMElwNEdURm5SeUhxK1BDK0k0TWx1RWpCL0Fw?=
 =?utf-8?B?Qk9WT2tUTzRaN3d2Y2ZSMW9TNXVqVXZ2Nk9KT1VBV1E1bm04Y1ovOU9pWHBw?=
 =?utf-8?B?Vy93ckxJZTJFTGNIN2IvVFFuUmJPbHM2THpjeEJnVDdyNjlJSWJmWEsrTUE3?=
 =?utf-8?B?R2ZlODJ2RTljRjdHbmFZczJEUXlnNVlzcXFJSVJzeTJGYkNSYkZUb21hRE1T?=
 =?utf-8?B?dk9CeG9KbEFyQmhpY000U1UvcmptT2N2YlpOSXNPMGxpWmcxZURRMWZMbDdm?=
 =?utf-8?B?WElqNjRyQUlMQVdJSnlMOTVGbk13UXhkL3ZYNGROcXUvckRBVU9WK2l6WkxC?=
 =?utf-8?B?N1I1S1I0YVlkSVFnY01YdURiMFhMM1B2QVpSSUlUSE5JRk1tU0gwN2pUd094?=
 =?utf-8?B?UFBzY0NXSkZWNXVHbk1ETjhtU3E3WDNwVHZWRWJyUG1RUVJDb2tNNzFYNjRU?=
 =?utf-8?B?c1lpc2tKY2hiWEZRSVVsL29Mb0x3NmNTcGIyNTY2NmVUNnlFNi9BMTZiTUdi?=
 =?utf-8?B?V0p5cWdXdzdDa3IwWEx0QjV1U1JUbnp4bzQrdjBGdzkzV2Z3NTk1d1g5V2Jl?=
 =?utf-8?Q?/g61l/NovQI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2M1Vk5sM2pFNVJWd0ZRTjhFVzdXVjU4cVM1dDAyL0JaUkg4d3ZqMncyNndW?=
 =?utf-8?B?aTR0bUl5UHFDNC8wc0NoM3VyK29sNlZpdmVnaEw0VzUycUlBMzNOaXExaFFy?=
 =?utf-8?B?T25IZ0UvNzRzR2RFWEc0WVkxOGN1ajhzTDdEYmdveHE2N1NBWXh2M3JTMmdB?=
 =?utf-8?B?NnZpN2dyNjFRMmh2ejBiVjNCRms1a1hLc3NnaGx3bGdXNmlWUDRURnByeC9O?=
 =?utf-8?B?ejAwR3RGVVp4V2plWXpvU0tKUHJLRm81QjAwcXdzczJsVUJ1TXVKWENwUjV5?=
 =?utf-8?B?OHllU0NpZGZFSjBSS3BtMVNWYXFreFB2YmRTTGF0WHlqRi9PL0h6REowL1BT?=
 =?utf-8?B?TXl5RmFoYkg2U3RBWTRud3NwSnY0aldDcnZMak80bGJLUzNOS3p6ZmhxWGt2?=
 =?utf-8?B?QjI1U2IzOTFhcTVhSEQrOHRJVHoxYXZVQU9ScE05c3NCRE4ySzI0RDJubGFI?=
 =?utf-8?B?WEN6VmVqZ1hLRkNveEt5a2l3NlpTWUlrVFFRZ0NhZXNmOWQxRlZETHFNNVdW?=
 =?utf-8?B?aG91UmlGVXR3aldlY0NjcXdIL0Z6N1QyVnhhcmNvaU9wL1AvUExYWXBuZEgw?=
 =?utf-8?B?a2JDdDkvWDNnZW1GS3lqSEFYR1dXb3pBRUg3V0VUMllQVHVXOTBvS0c2N1BY?=
 =?utf-8?B?dngvWCswMDJ2QWhCYnl6UkFZMHBZOWlVNGR1dS9yVVY4L3E4OFNnTWtiYkt0?=
 =?utf-8?B?TFJya0xEdStvT0xZQlJqck1CazM1RVBseUloWUF2cHYxNVFsaU9NVFBPMlhx?=
 =?utf-8?B?THByUGhmYTNTb2kreVFBdjJhVUlXdWxNcGlqb2o5SUFTMUNvRXBhU3dRZk05?=
 =?utf-8?B?WXFBem1naXRNaVhqSGcvOWx2Rm1zVld1WTVxemE3RGxGMDZlUEpmRHFqV1RQ?=
 =?utf-8?B?b0t4WmxBSFJOSEE3Rm1DRmFtQ2VGM2tWZ1JTZWM3YkE4R1pyWWVERitZd2l0?=
 =?utf-8?B?ckRzSk9vckRiRXdtaUxUTnJwVVdoSzR3YXh6L0d3eTJISGxWSWIwbW9sWFRy?=
 =?utf-8?B?VGp3MmlBaGJyZ2lGLy9UR2N4K0NYbW5UeWFtRG5aV0pscWFLYmw3VWc2UXNI?=
 =?utf-8?B?TWoxZnpBL0JmL0FSMWtGZmMwUXlYRE1LclpSNTFQMFkzVm5aeXRXY0VCVCtK?=
 =?utf-8?B?VG41QlhWRTA0N1hDUkVXdGFURjVlT2tYZ0JjY2xDajFjTmMwQmFDVXdxRWpK?=
 =?utf-8?B?U3F5V1cxTHF5NG80NnFVakdFUDMxVkFhcVVNWnlKb0hoZm8zS0FNZHpJMDMw?=
 =?utf-8?B?bDkzV3FrVVNyRWJZak53QnAvdW5NNkxJUlZMemdpSzZOL0hZVitTblpDV0hR?=
 =?utf-8?B?aTZkUG1IUHJZUXo2OHgwZEJtcU5CS0ZwNXUwZGcvTnlSaU04TWw1RVUrbGdD?=
 =?utf-8?B?TTJhY3NFck1KU2JpaW92TzNhRFM0a2pReWx0M3poVC9RVUdhakE5T1FwREQ5?=
 =?utf-8?B?V0JBZFZML3RJSmNKWkE5SlEzWCtaWlpJelhONlF2RG5DanRkbWg4VU5nYjlq?=
 =?utf-8?B?YU1wbEEvK3ZHTWZlQ3RVb2NaY2RITXA0NU1Ubm9tQkltQ3pwNUozVzRxWWgr?=
 =?utf-8?B?YTVhK2dMcEgyenFra0orSFV6VTVaNjhMWTh2bkp0WUtDR0NyUUxYcDZHQ3ZK?=
 =?utf-8?B?cDJXWmQxdFNXUVB5SzhKdTh5U3BOaVBEOGNkTi94cDRhMXRIb1JRMWZMclA5?=
 =?utf-8?B?Vm5ScTI5UXJTWHF4MGJSbm1CdGo1YlJCdlNsbG95ekJtVk9FYnpKbWJkWWRI?=
 =?utf-8?B?OW1ZY00rZW9xS29BNnR6Z1cxcnRqNjQ4NVZJRWZ3MlFiTXNEV1RoM1Zvd1cv?=
 =?utf-8?B?UHZramVJN1VxUnljcWF3ajhJVkN0ZFV6K1prWUhIOEVzV1g4aGh1SnRLL1k5?=
 =?utf-8?B?NG9kam9FVlJhTHVtbCttbW12MXkzMndlTHVFNmNIM2ZXQkk1MVhFSkk1SEZv?=
 =?utf-8?B?dEJ6Mjdmc2tCNWFUQnZZMWgvTDZQejMyTDRIcmpPSFI3MERPTFM2NVBJQWlC?=
 =?utf-8?B?T3BQWmNRelVoajBiSzErZmhGQmtvc2g4UXVJeHRvc25mRUR1UWo0VjZhMGhr?=
 =?utf-8?B?RGFSZ3FseTRYaW1HalM0Z1Bibkt3eFc3WjhxMDNmYnQyMHNkQ2lialAxYXB0?=
 =?utf-8?Q?MLrPc+0QcJm80gdc99hs2pUkm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a4112d-0560-4d63-7599-08ddee6b62a8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 00:05:14.3987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SidNmIoGG3Kk1EChVCg9iez6+G4doZ4lkM4I/6vAHLk/PQNdyHL8mHOfnU2iaMOgueI113/fzfz+iY9a+EcnzQ==
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

Add support for splitting device-private THP folios, enabling fallback
to smaller page sizes when large page allocation or migration fails.

Key changes:
- split_huge_pmd(): Handle device-private PMD entries during splitting
- Preserve RMAP_EXCLUSIVE semantics for anonymous exclusive folios
- Skip RMP_USE_SHARED_ZEROPAGE for device-private entries as they
  don't support shared zero page semantics

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
 mm/huge_memory.c | 129 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 91 insertions(+), 38 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 337d8e3dd837..b720870c04b2 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2880,16 +2880,19 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	struct page *page;
 	pgtable_t pgtable;
 	pmd_t old_pmd, _pmd;
-	bool young, write, soft_dirty, pmd_migration = false, uffd_wp = false;
-	bool anon_exclusive = false, dirty = false;
+	bool young, write, soft_dirty, uffd_wp = false;
+	bool anon_exclusive = false, dirty = false, present = false;
 	unsigned long addr;
 	pte_t *pte;
 	int i;
+	swp_entry_t swp_entry;
 
 	VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
 	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
 	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
-	VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd));
+
+	VM_WARN_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd) &&
+			!is_pmd_device_private_entry(*pmd));
 
 	count_vm_event(THP_SPLIT_PMD);
 
@@ -2937,18 +2940,43 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		return __split_huge_zero_page_pmd(vma, haddr, pmd);
 	}
 
-	pmd_migration = is_pmd_migration_entry(*pmd);
-	if (unlikely(pmd_migration)) {
-		swp_entry_t entry;
 
+	present = pmd_present(*pmd);
+	if (unlikely(!present)) {
+		swp_entry = pmd_to_swp_entry(*pmd);
 		old_pmd = *pmd;
-		entry = pmd_to_swp_entry(old_pmd);
-		page = pfn_swap_entry_to_page(entry);
-		write = is_writable_migration_entry(entry);
-		if (PageAnon(page))
-			anon_exclusive = is_readable_exclusive_migration_entry(entry);
-		young = is_migration_entry_young(entry);
-		dirty = is_migration_entry_dirty(entry);
+
+		folio = pfn_swap_entry_folio(swp_entry);
+		VM_WARN_ON(!is_migration_entry(swp_entry) &&
+				!is_device_private_entry(swp_entry));
+		page = pfn_swap_entry_to_page(swp_entry);
+
+		if (is_pmd_migration_entry(old_pmd)) {
+			write = is_writable_migration_entry(swp_entry);
+			if (PageAnon(page))
+				anon_exclusive =
+					is_readable_exclusive_migration_entry(
+								swp_entry);
+			young = is_migration_entry_young(swp_entry);
+			dirty = is_migration_entry_dirty(swp_entry);
+		} else if (is_pmd_device_private_entry(old_pmd)) {
+			write = is_writable_device_private_entry(swp_entry);
+			anon_exclusive = PageAnonExclusive(page);
+			if (freeze && anon_exclusive &&
+			    folio_try_share_anon_rmap_pmd(folio, page))
+				freeze = false;
+			if (!freeze) {
+				rmap_t rmap_flags = RMAP_NONE;
+
+				folio_ref_add(folio, HPAGE_PMD_NR - 1);
+				if (anon_exclusive)
+					rmap_flags |= RMAP_EXCLUSIVE;
+
+				folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
+						 vma, haddr, rmap_flags);
+			}
+		}
+
 		soft_dirty = pmd_swp_soft_dirty(old_pmd);
 		uffd_wp = pmd_swp_uffd_wp(old_pmd);
 	} else {
@@ -3034,30 +3062,49 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	 * Note that NUMA hinting access restrictions are not transferred to
 	 * avoid any possibility of altering permissions across VMAs.
 	 */
-	if (freeze || pmd_migration) {
+	if (freeze || !present) {
 		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
 			pte_t entry;
-			swp_entry_t swp_entry;
-
-			if (write)
-				swp_entry = make_writable_migration_entry(
-							page_to_pfn(page + i));
-			else if (anon_exclusive)
-				swp_entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page + i));
-			else
-				swp_entry = make_readable_migration_entry(
-							page_to_pfn(page + i));
-			if (young)
-				swp_entry = make_migration_entry_young(swp_entry);
-			if (dirty)
-				swp_entry = make_migration_entry_dirty(swp_entry);
-			entry = swp_entry_to_pte(swp_entry);
-			if (soft_dirty)
-				entry = pte_swp_mksoft_dirty(entry);
-			if (uffd_wp)
-				entry = pte_swp_mkuffd_wp(entry);
-
+			if (freeze || is_migration_entry(swp_entry)) {
+				if (write)
+					swp_entry = make_writable_migration_entry(
+								page_to_pfn(page + i));
+				else if (anon_exclusive)
+					swp_entry = make_readable_exclusive_migration_entry(
+								page_to_pfn(page + i));
+				else
+					swp_entry = make_readable_migration_entry(
+								page_to_pfn(page + i));
+				if (young)
+					swp_entry = make_migration_entry_young(swp_entry);
+				if (dirty)
+					swp_entry = make_migration_entry_dirty(swp_entry);
+				entry = swp_entry_to_pte(swp_entry);
+				if (soft_dirty)
+					entry = pte_swp_mksoft_dirty(entry);
+				if (uffd_wp)
+					entry = pte_swp_mkuffd_wp(entry);
+			} else {
+				/*
+				 * anon_exclusive was already propagated to the relevant
+				 * pages corresponding to the pte entries when freeze
+				 * is false.
+				 */
+				if (write)
+					swp_entry = make_writable_device_private_entry(
+								page_to_pfn(page + i));
+				else
+					swp_entry = make_readable_device_private_entry(
+								page_to_pfn(page + i));
+				/*
+				 * Young and dirty bits are not progated via swp_entry
+				 */
+				entry = swp_entry_to_pte(swp_entry);
+				if (soft_dirty)
+					entry = pte_swp_mksoft_dirty(entry);
+				if (uffd_wp)
+					entry = pte_swp_mkuffd_wp(entry);
+			}
 			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
 			set_pte_at(mm, addr, pte + i, entry);
 		}
@@ -3084,7 +3131,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	}
 	pte_unmap(pte);
 
-	if (!pmd_migration)
+	if (!is_pmd_migration_entry(*pmd))
 		folio_remove_rmap_pmd(folio, page, vma);
 	if (freeze)
 		put_page(page);
@@ -3096,8 +3143,10 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
 			   pmd_t *pmd, bool freeze)
 {
+
 	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
-	if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd))
+	if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd) ||
+		is_pmd_device_private_entry(*pmd))
 		__split_huge_pmd_locked(vma, pmd, address, freeze);
 }
 
@@ -3276,6 +3325,9 @@ static void lru_add_split_folio(struct folio *folio, struct folio *new_folio,
 	VM_BUG_ON_FOLIO(folio_test_lru(new_folio), folio);
 	lockdep_assert_held(&lruvec->lru_lock);
 
+	if (folio_is_device_private(folio))
+		return;
+
 	if (list) {
 		/* page reclaim is reclaiming a huge page */
 		VM_WARN_ON(folio_test_lru(folio));
@@ -3896,8 +3948,9 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 	if (nr_shmem_dropped)
 		shmem_uncharge(mapping->host, nr_shmem_dropped);
 
-	if (!ret && is_anon)
+	if (!ret && is_anon && !folio_is_device_private(folio))
 		remap_flags = RMP_USE_SHARED_ZEROPAGE;
+
 	remap_page(folio, 1 << order, remap_flags);
 
 	/*
-- 
2.50.1

