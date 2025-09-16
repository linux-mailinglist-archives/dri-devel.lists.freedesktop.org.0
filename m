Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB7FB595F5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 14:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10D910E7C6;
	Tue, 16 Sep 2025 12:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ChbTfQKY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012043.outbound.protection.outlook.com [40.107.209.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA0A10E7C3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 12:21:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vigBE+eKpcS/GO9tcb9/GWkGq+dYAEtvcVSbGUUkfrrh+wICJ7eJE5bERuQ63W1xJqlG+fKip0OZWivJvITRLZcZbF9ESH7yxTicIalwQIOVLz9HXw0c/Sau4dK66MyPp1BdvANtEnio0qvVOKhJuDQdnAUfuUseQ0D+PiwUwr1IBsLkjc4zG6BYnv7TV4pziRjSC8cadT/sTphtxgL58DrMIAm0OoyqNBp2GIToaEcPKThFGvPpIDPvA3/J53mWw2mfVqGLwNgq7prA4rJ8BAroOoqUa1ZwzVe6SojHDii1rnxQSynaIknsrj1v7v9sNfa5DpdMuAHohZGqY3vpUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBJYwzC8ij3bER+guXDur9PRsNtFfvseWL/EWUSqFRs=;
 b=DvMtEd1pNleJm28MxM8YwI71k0fwCKvHQy8N1c4Zv5FbmKYm5am1fn5hqyV4o9c4yi7xvwoQMnO77x8M5fTf8huevswxrSdtCUFfh3/Ok2oxznMIbBkyjidnCXb9FkPbhUC93YHOJrDcHnE9BBmSKgzd28jaKzCMRqCjxxa0uqtDUQmtlVV0TrcNcgjhnL3IxliBOgAwaohe+4/xc/GgKXViXCWp/uBXxD8vd/2IZ2bpA5LHFDNJKTcAaeHwTegsGfyUItux63eXcQVbUBKmAwrWYATDpbiO/r5RsAq2Kw9o0cgK9O9HDkXpGa90lwF7qlnfu5zNOxYkyyyZ55eNnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBJYwzC8ij3bER+guXDur9PRsNtFfvseWL/EWUSqFRs=;
 b=ChbTfQKYy+5DRK3uD+1BKJzBxcogyXCsSx30MGd6oFiq7kbkvRnSY1vwXrGaFmM1kxEGklA7k2Kob6PB/s9iHps7lEJoJhFNRj0mgBdsnykHkhkAly2RikTIcRbw/nmNWpfT6nPhPzqZWR8P9xZbMqiO9J8UVO+rQ10/arIrEZHLC2cfakqEGs/AHR+e/+Li91K5s594jpq71ONz4e0c9bEB20ElFSWfD6Ja0qWu1NuZ8BtSxQOjO5W0VEXAuHkzef4SJo3crRCRfMK3FIq4IeWjxn0UyELso92hxHDl8l1HjLRjhnFLfiYW7ZiSecKtgww8EHIIfptghR2cqhXpeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH8PR12MB7373.namprd12.prod.outlook.com (2603:10b6:510:217::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 16 Sep
 2025 12:21:53 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 12:21:53 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>, David Hildenbrand <david@redhat.com>,
 Zi Yan <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>,
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
Subject: [v6 05/15] mm/migrate_device: handle partially mapped folios during
 collection
Date: Tue, 16 Sep 2025 22:21:18 +1000
Message-ID: <20250916122128.2098535-6-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250916122128.2098535-1-balbirs@nvidia.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SYCP282CA0006.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:80::18) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH8PR12MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: 676e1e64-6cbc-417e-3450-08ddf51b9e51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGhwWURwUC9YdDlrMzVMbGp4RzZ5KzFtWHdiRW5Gd0oxZ2VWRVc4eGZocXl6?=
 =?utf-8?B?RzNVUDRiTHVKTDB1M3NtM1kzR05ZNGRocXFodk9KUmxoeENiaUk1TGptVi9R?=
 =?utf-8?B?bDdhVFlUb2VzNEtJQitzVUFtTHVreVp0cG1VMW9HY0ZKVWdCeGdQRW14b0FQ?=
 =?utf-8?B?UVF4cHMxNkhacHVDRVQ1QU1pUS9HQ25zd2xRSVNWUXRJVVhoeVNPTTVQV2lW?=
 =?utf-8?B?S2srUEU4MTAwQkY3eE5vMk1udE1ERnZ3NEQrZVpWZlRoUXhNMnN1QW5Scko0?=
 =?utf-8?B?OWZtRERudjVCcDZTVFpZOC9UTkNCUHJ0RXMrZHdHVHBZbEVYVnVjSlg2SktG?=
 =?utf-8?B?OUpkdGhQVFRMWnBNMDRtM0hvMU5QSGtWQno1K1NVamFQOWdDdU5wWmI2OUkz?=
 =?utf-8?B?bnEvN0R2V1J4N2lXdFVBaVFXUzc3clozWW5jTjVIZXMvVHZuZU05LzRMcnhH?=
 =?utf-8?B?K0dWa1lpTXloZ2ZybTBHZStNNjdVUXdiamk2dWdSOHovcS9OeVVYRXNQdWtR?=
 =?utf-8?B?VXdodWFZVU5aS3J6eHNKNGNPanl0Vmp3K0dJYUdCODdMN005cU1ocittaHFI?=
 =?utf-8?B?MXBJZ0pJWUxmbXE0MVhFcGRxc2Z1S21IT01yQ0o5aWx6M2JVdkNrZlNQTG43?=
 =?utf-8?B?aGk2TmlsOHFTckFjNjh0U1N5YklibUQxaXhmemVRdkc0eXU4SGRxbUpEL004?=
 =?utf-8?B?Qy9BTWhoOHBjSGF1NGlxQ21WVTluSDZtQlMza0t5RVJxRGxzeGs4d3NwNnVY?=
 =?utf-8?B?YU94NmhMUzdoMjd0L3UyL0daemtOTGxUVnlIcmsyNXhKUWNCYUZWQUo2RmlS?=
 =?utf-8?B?QmtVSG5LZUsyTzUxY3p5WFJDTHIxZmluZ0xCME5VbkZRZHJEbjkvVWJoaWVI?=
 =?utf-8?B?U3daalVsaWNCV2NxL3Y0bHl0NEhXYlkzNWN6Q2VwSllzS0ZpYnkwNUdEcFhM?=
 =?utf-8?B?Qkc1TTBGdnU3ZGVOa2w1U2w2S3NiOEtIOGloZ21GR2kzN25FTENBNEY3TzVJ?=
 =?utf-8?B?UCtwL2lWODFhWUo0cGgwZkt4alBtRnF2MlRncHVWZFFPakJRUkI5YXFyQXdl?=
 =?utf-8?B?TmpMdTcwK25ibjlVMFN5V0FBQ0VSRldxM0FnQlFDaUJCbGpBQUFmWGttWE5h?=
 =?utf-8?B?UUVxQ3JxMThnTWxxVS9PQ3VpY0wyZ2sxWWlEbFY4ejVnRHFMTzVDVVRGc04v?=
 =?utf-8?B?bnBhcGdwSmdvZ0YyMmlCOVQvSTYvNGVOaFNwMjdTRzVEZkcyNjNOQUpaYjdZ?=
 =?utf-8?B?SFN4SmRxckxOZXVNdU44akNDeWE5V24wNDZyRi8rSzdzbnd5WWExajNQQ0Ru?=
 =?utf-8?B?VmFqNXJnQ04wLytYME52TXlxR3h2aWZTNE9LWFU0QlpVTlUwcjZHUENPUVFq?=
 =?utf-8?B?LzM2R3pkdWVzSFFoUEx3RXZ2ZXlzY3FXZjFIMTNYMWkwVzl1WVlBNVdkQlho?=
 =?utf-8?B?dFQ3c3B1Q1BMWm1IZFdjd0c0SXF1dlp1UXVCMldOQ2FzdE1aWG1icnYwb0lz?=
 =?utf-8?B?QUtJSGpXTkJOa1IvcXJzYkx0ZFE4UllYVjM0YmZsL3JMWC93OGNJNnozazRv?=
 =?utf-8?B?RlRCVnNxVU5IenNZUnZjV2ZjbE04RkZQZEpZR2ZycEwzdjJGSzBzN0Z1QSts?=
 =?utf-8?B?Z1hsQW5KZ1JUd0M5SkJ4OWZRdk1ORVJOVVFFSkdqUlhicjZ6K2ZuS3packND?=
 =?utf-8?B?SVV2Tmlob25ESGhybUthZkJ6T2FHQzlUdGxLSUo3UnZtTXJIQ25VYW8zWm9Y?=
 =?utf-8?B?VTBDUjdYeVlONnMzTUMwZ296OTA4cXZaT1JhdUtGQmE2M2N3aVlVOGUyd282?=
 =?utf-8?B?Y0F2UmNEaUk5V0dnRW5zRE5scXZWTGRzNzQ1cmxNVi9JMk82MVdZWFIxTDNI?=
 =?utf-8?B?Yjl0bC9uZm9TblVPS0wwYWw5bytjbWFhOVByc1B4TjhDUnlvQXZZeTQydWNR?=
 =?utf-8?Q?8EivLs6ReK4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUhkc0ZWYXNRTEhITFNSc2VyVElkZW5jckNQNk05MTFQY2tIV1lpN0hoaUJw?=
 =?utf-8?B?V0tDTG9wU25ObWJUNm1oSURZWmRkN2FZWFNwNTBjcWNIR1B6OHZrdkNPY2Rv?=
 =?utf-8?B?VEtsZGEwd0hsUlZjdzB1c1BKSk1ncnZqNGcxRFFiSUptaVJ2NDBDcTZ1TjF5?=
 =?utf-8?B?M25aZDBXSW53cnZ1RFlqL2ZLLzVXRHdCcU1UMmNzVEFldlRobXFwTkNMWHZo?=
 =?utf-8?B?dzl5OCtSK21tbnNzcHU2Qjc2eFgzYUVSN3gvT0Y1bHZGT0p4R01JdXVqRUZx?=
 =?utf-8?B?M3pFQWRoQnJ0MzhjdExsNWJlUWF1bGNsUTA5TGU1SitPVmNWald2TWwvUjVa?=
 =?utf-8?B?TlZ0TnFETEpoWWJTOFAwai9VcTQ1eVQ0cDlIdWVza243Tjg4c291empxbmdQ?=
 =?utf-8?B?KzU3bW1jNHZxTE02OE9FVnQ0VjMyUkxpblliWjl3emdTc1pxMExNNDEydmgv?=
 =?utf-8?B?dnl3d2pudVpMUjRzUVd3NGV0U0lzK1ExdWVVME1jK1NmL0lKQ05jVHRqdlAy?=
 =?utf-8?B?OHBtR0hobC94amhDKzdvS0Q5ZHR6UWpickZYMHZSdmpEVUdBWDRJamVUSG9J?=
 =?utf-8?B?YkRxbHlzbXVnZjVISVBYemwvQ2psUkZuTkJ4VDdCZ0FwcW9VUDZIMEUzbllK?=
 =?utf-8?B?elpCUm5zYXV5MmpDTi9yWENRc3d3SXgxV3dNZ2w4dlJNVy9OZ2tDZy9nNUZk?=
 =?utf-8?B?RWlvNzB1V1UxRnliVkdrVDBMSmZ0VGRJRlZ3NzkxZUpCTjhOREFuOHgrd29S?=
 =?utf-8?B?elBISEVXdWJwb0ZtcDBoZUI0b1pVRTZweGhzMnI2c202MnJDa3Noc0RQS0dN?=
 =?utf-8?B?cjVQWnMxSlhNN3UrSitvTEhqQ0NQZ0cvWHd5c094cXhieGUyQkdMT2hwMDRN?=
 =?utf-8?B?OHBhdVhwaCtIdUtUcFV3Ty9ZMGpCRWxOTjlXWmVXLy90bXpiZlJMZEx6VkZD?=
 =?utf-8?B?bXBaVkVMc1BheXpwZ1IxYy9XclFBTVpObENjZENMbGNsQUFkTjloMm5DNHdS?=
 =?utf-8?B?cGpTZjdiaWlFcVVNcTlLajBCQ0JsTis3RWlNV2psWUVDWlVsRUduVlFCQWFX?=
 =?utf-8?B?eFpOUjkzeFN1Y2kzMmxBbEJoZHU2SUN2QlRLem1sSE5sK2VzQXVNVGtvaElP?=
 =?utf-8?B?Uzk2b1RmNmVkREMxZ0tEcjM5V1lzeGFrSE9pUmwwUGlwMkd4M1ZEYzZ2d29p?=
 =?utf-8?B?RmJaNGhPV3B0d1U2RVlSVHJIWG1TakI2WHFuK1Q0blNZanBqdld0U0FjZWdJ?=
 =?utf-8?B?S2NUMjhhRFNYWDJzZmQ4RkpGVzYvcFd2d1haQXFFR1B5VDFPYi9kZVR5NW5t?=
 =?utf-8?B?K0FVaFRoUy82MXduazRhMFNWYWU3WXBUVzZHdWxtRFhPVEVrY1RjZ2JHazlq?=
 =?utf-8?B?K0REejVZT3h3SzVTSnpUSGcvendiL1pxY1BJbVBHbGwxdjBEL0N0MzZYcnF2?=
 =?utf-8?B?ZGVQOGxaMGNYRVVBQ0JaZEphcUY3azlEczBkQzd0OXAwc2ROK0l3RWkyRGV3?=
 =?utf-8?B?cWlTb1dxOGRkTTRMVkkrZ2RkcEpZdEFTNjg1ZXJnTlMyVjF1TUZWR0xqV1Yv?=
 =?utf-8?B?Y3V5STVKMUxTTlcxem1ETU5CRlJJa0NjSDFmSENPQ0RQMnpmRmh0K3dIcVZs?=
 =?utf-8?B?VFR2RXBFR1UrK3JaOGhTVFdLL0tiemV4bVV2L3RKcEJRTFMwWjVZNysxTmYw?=
 =?utf-8?B?b3BzTTZiZStEYTk3KzdtZ1llY1dRVS9DRWl5b0VNcm1tSS8rVjlqbFlySU1K?=
 =?utf-8?B?RkhZekxlNXJxMkhjM0lwaDBLK1VBS2VWaWtrdTRpQzhTcU9JWFJFM0MyQUs0?=
 =?utf-8?B?b3JTYWM1S1NJN2JMM2pObjhEelgzUFhwVnBUM0UwNXlMOU5lWTZFUTN6NStJ?=
 =?utf-8?B?Z0d5dXJSQzJjbGltZUd4Mno5T1NxL0wrV2NvNm9xK2Y3UXplemczdDFESUZZ?=
 =?utf-8?B?bkFhYUdqSE44MUlKM2dBcXFpbXhuZEpaTzNwb0Fxak0rUjRGWCt6NUJQWVB4?=
 =?utf-8?B?VVVRMzdGZ3NCaE5rSEltMUpUQWM5YmxhOERkWnczeDdTdHc4ayszOFk0UU1P?=
 =?utf-8?B?dkRpMis3Qm9LZTVHVklZOTY2VXkwaXdjZ1dvdWpFS3kvYkRLTWo2V2tWSlY5?=
 =?utf-8?B?ZHhwVGI0M1NjMjJScy9RR0N1M3FrSU5NZE1qWUw0b0NwK00xb3gvaXhQZzEv?=
 =?utf-8?B?VVE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 676e1e64-6cbc-417e-3450-08ddf51b9e51
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 12:21:52.9492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QT+e+kpK+MZqEgTJnSbja8EsneHBOrjnsTa7nN/fenCKXBtlhmS4f0rZE+ytderpCwW0qeuBF1O9xzHs3Ap7Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7373
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

Extend migrate_vma_collect_pmd() to handle partially mapped large folios
that require splitting before migration can proceed.

During PTE walk in the collection phase, if a large folio is only
partially mapped in the migration range, it must be split to ensure the
folio is correctly migrated.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
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
---
 mm/migrate_device.c | 82 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index abd9f6850db6..70c0601f70ea 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -54,6 +54,53 @@ static int migrate_vma_collect_hole(unsigned long start,
 	return 0;
 }
 
+/**
+ * migrate_vma_split_folio() - Helper function to split a THP folio
+ * @folio: the folio to split
+ * @fault_page: struct page associated with the fault if any
+ *
+ * Returns 0 on success
+ */
+static int migrate_vma_split_folio(struct folio *folio,
+				   struct page *fault_page)
+{
+	int ret;
+	struct folio *fault_folio = fault_page ? page_folio(fault_page) : NULL;
+	struct folio *new_fault_folio = NULL;
+
+	if (folio != fault_folio) {
+		folio_get(folio);
+		folio_lock(folio);
+	}
+
+	ret = split_folio(folio);
+	if (ret) {
+		if (folio != fault_folio) {
+			folio_unlock(folio);
+			folio_put(folio);
+		}
+		return ret;
+	}
+
+	new_fault_folio = fault_page ? page_folio(fault_page) : NULL;
+
+	/*
+	 * Ensure the lock is held on the correct
+	 * folio after the split
+	 */
+	if (!new_fault_folio) {
+		folio_unlock(folio);
+		folio_put(folio);
+	} else if (folio != new_fault_folio) {
+		folio_get(new_fault_folio);
+		folio_lock(new_fault_folio);
+		folio_unlock(folio);
+		folio_put(folio);
+	}
+
+	return 0;
+}
+
 static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				   unsigned long start,
 				   unsigned long end,
@@ -136,6 +183,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			 * page table entry. Other special swap entries are not
 			 * migratable, and we ignore regular swapped page.
 			 */
+			struct folio *folio;
+
 			entry = pte_to_swp_entry(pte);
 			if (!is_device_private_entry(entry))
 				goto next;
@@ -147,6 +196,23 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			    pgmap->owner != migrate->pgmap_owner)
 				goto next;
 
+			folio = page_folio(page);
+			if (folio_test_large(folio)) {
+				int ret;
+
+				pte_unmap_unlock(ptep, ptl);
+				ret = migrate_vma_split_folio(folio,
+							  migrate->fault_page);
+
+				if (ret) {
+					ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
+					goto next;
+				}
+
+				addr = start;
+				goto again;
+			}
+
 			mpfn = migrate_pfn(page_to_pfn(page)) |
 					MIGRATE_PFN_MIGRATE;
 			if (is_writable_device_private_entry(entry))
@@ -171,6 +237,22 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 					pgmap->owner != migrate->pgmap_owner)
 					goto next;
 			}
+			folio = page ? page_folio(page) : NULL;
+			if (folio && folio_test_large(folio)) {
+				int ret;
+
+				pte_unmap_unlock(ptep, ptl);
+				ret = migrate_vma_split_folio(folio,
+							  migrate->fault_page);
+
+				if (ret) {
+					ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
+					goto next;
+				}
+
+				addr = start;
+				goto again;
+			}
 			mpfn = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
 			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
 		}
-- 
2.50.1

