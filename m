Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FA7B48171
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 02:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324F910E109;
	Mon,  8 Sep 2025 00:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aTuQsnfm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27F510E31A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 00:05:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxFNES4xhH/uZGokwSIJgLTnk6byJwplxoAiF4LBBJasQHVDWWWGxfzA45i8b/8JTy0kQ2boT19m6MCY6zzfZMcym5fNtRcTlKU13RKVMGQGtIOr95q+YHyGcx7Qmy+4336jb5r+oSyO8te203OTjGZ+tJJm8MyFnrllT8XBv4JytQKvb0shf+a+QAOIAlnC9sb2g+A3+7it36kEQ3r8lp78DhJa0SxELHHxoTMH/SSdsJtu/9DqWtQewR/+Szs8UQG5FE/+hXB6FHTAqv9MHvjjx4/fzmnQ6NYtkPd2NYvTNHFMyRaWdVV9LT9zKrt5woaleshzh/A3Jl9OjVJWSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cqfVPS36ZN94w+BSLv448AHlw4Fbjq0mobzVgnEiNc=;
 b=tf6iCp5TyAiaShwOp51Y8ZRG2fvZDVEdiXeUiecG1XWuY/W3l4wZe32oooa1gEp09qTceQTgZOa9GqcdsZ4qwv8a5KvXXevn5ezLWsMTgd6H/mie78hvSBYF13HWMPiMQkcAGQ1KBQiacuX/is5HXKkNn6MsQF6Zg6ZVRy1y1u5Als17zX80CR4R8gnOmvfvgQpf+xAGYiWciRQF+Sv+bLwOp+V/bZotsQzGRY1ROlpBEen2RfSZEd4k/QCuntoS3l8fGVKsM6XBtOFjCTew2SPeR5PoSwU2J5H++HgkMO2JyV3tkAvCziIgHvcd8DDVVK5Nzf4wCVfMUvVdt9uknA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cqfVPS36ZN94w+BSLv448AHlw4Fbjq0mobzVgnEiNc=;
 b=aTuQsnfmp1EkjgLhdgwveWZbc0cdpwXoeRQMZh2mKmqqjgPWAeh8+9w5vhYtBhv+4LpRmfZvBwXep19uFLshM9zbDNS056fOvR/7RcaOwRhg3C3F4qIFgVXjXDv2LYdoN4rb/lQeWgR2oStqSbZPqV2gmIVPI4Fp0ObBZ+E/FQYx//97Zd3o/kpGsi3J3yb9EoTxSmFSStnS72nmikJmoF8pisWrUhR+W8SKX7INTyk+5p6PBlyT+c941Kcz2wNGY09dzMHwhYtgIyaxdaoUBymLXHG8y9jqwoWQKZb8f47cPEwd7TSQE/rCKcwMDBd9+Mx76kDBVpvhfsq8EFoO7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS7PR12MB5887.namprd12.prod.outlook.com (2603:10b6:8:7a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.19; Mon, 8 Sep 2025 00:05:11 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 00:05:11 +0000
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
Subject: [v5 03/15] mm/rmap: extend rmap and migration support device-private
 entries
Date: Mon,  8 Sep 2025 10:04:36 +1000
Message-ID: <20250908000448.180088-4-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908000448.180088-1-balbirs@nvidia.com>
References: <20250908000448.180088-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0165.namprd03.prod.outlook.com
 (2603:10b6:a03:338::20) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS7PR12MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: 4337ee54-a07a-4abb-2dfe-08ddee6b60e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzQyN0xzUVB3Y0JrcWorNjhaNDRKOTlYbGRRdHRReGhUNmFGTTVjOVNrbGdr?=
 =?utf-8?B?UjlPaE9BQm5ZRzVxTlZVTWlNOFg1SW51akRnbzR0Ykd4K0FFa0VDeVZxUVZQ?=
 =?utf-8?B?blRodjVGejdLeU9GdHVNYStYTUFhcnRGK2RPZXp6aGpmRHhGUTZTV0F3dGo3?=
 =?utf-8?B?cmFIQmcza0ZmaWZBQmdscEROR0JudVgyVEpxaStWR2plWmZpYmhTeGhBaUZu?=
 =?utf-8?B?VHZwTEhVOVFjMm9oVHFCdENuWDhZZjZkZEFheDFoN2lEU25BVlpIZW1VeWRK?=
 =?utf-8?B?UjloR0xPQjRwQitmNERnWEZUdlNYVzY0dmJvbENoVkloS1A3MmZFUWhjdzZj?=
 =?utf-8?B?VjhFeFkyeGdmTVZtcC9JZUh5S2YyUk9rQlJPK0ZpYVZhMVpwUVBVRnBGRUh1?=
 =?utf-8?B?K056ckdkSGNRTFJlczNCQ3JyTGoyZnFyeEtlcjh3OW1hT2VFb05IYWtJUnQv?=
 =?utf-8?B?NzcxeUZRRGw1Z041UDUyMmpqL0tUYTl6VFZiSFMwL08yalE4dUJOaWowZmZ1?=
 =?utf-8?B?MlhLUUJveVlFVnhkU2htNmNuUFFyMlZVVkdBQ2crNGZBR1F5dUpyblFKU1B3?=
 =?utf-8?B?bHhCc3VXRHE0bkMvc0ZUVy90UDNBVkhZWWMxYXBrV2lkRUtsa0RHdjBicFg1?=
 =?utf-8?B?MHpXdFNrblVoUlduaTd2aEoveXQ5ZHg5RVpMUGpXZG9YT2UrdVQrY0ltOVQ4?=
 =?utf-8?B?RFg1MFlhL3NCTHZMNVlNV2t2TWZoREEzazgxa2RXSEtldjl3Mkh0bStaendx?=
 =?utf-8?B?WXVMa3d4MDRScXZjaDN4OGpZbEJVT1hORjhGTk1sbXFpOUZGK3hHMWo1bXY0?=
 =?utf-8?B?WDV5VXVmdkhqSlB2Y09nWkRXaEtGeXZ5bWF1TG10cFU2blpoME04NDU0Ukw4?=
 =?utf-8?B?VHhZamVlaFFNa2VicEJFekdKYVU5a1dSaEovaVRMVW53VmNlOUgvY3R6b2ZE?=
 =?utf-8?B?eHg0cTYwUXFjMzN6RnBIWFBtNHBHNHhLTFJhTktKWkluRWY1Yk5GRlBJa25E?=
 =?utf-8?B?N24xVXRuZ0gybkI2UUVLZ1dueXVrZDFJc1dCQmZScDIvSlJjMTF6S2l1c1pn?=
 =?utf-8?B?ZUN2VjN0UTBqNFBEQUZzdGZKL3JBTTM2aXJOUTd4NnZXcEdVeittcVJwS1Nu?=
 =?utf-8?B?aWlRMGNQZ2JWa3pScUpWamxzOWp2ZDlwQ21kMDcwVGRmdXJpT0N1Unc3VW5T?=
 =?utf-8?B?QnpBQ3RUQW1wUGZrSTFtellhaDdLM2FXV1dpaTc1VzJ5RDZncElyVEp2dS9z?=
 =?utf-8?B?YjVrZEhEZWZkNVJBcmkzVEZmT20rSC9Lbks5amVUb090Q2NWK1NKb2ljUzBO?=
 =?utf-8?B?ckxIamYvTHZlL1JuaUlFNVNiU2VzZStsQXViWGVpWllET25oTk1rZUhSV214?=
 =?utf-8?B?WnpDdmR0YVVHK09UZTVUbC9xaDZ4WndZY1hoZlNtcDlGdDloZUVMZ2s3dmhs?=
 =?utf-8?B?YkdlOXRIVFdJVnhtSmhxdjdoSWxQMGZQWVZXbzN4Vk0zbnhTZmFwNml0UkdH?=
 =?utf-8?B?amZsTGEzSUl4TEZEczEwbHM4L09WbStWMUczck53WGJLb3hjeFp3cU4zckNB?=
 =?utf-8?B?Wkl2QXhSTDFoL0gxTGVKaFA1emVSMEFnNVZ4cm8yVHpuTDZ2ejRGOW9IK2ZG?=
 =?utf-8?B?ZjRQbDhieTlBWlZyWjMzQ3M1SlBBL2hsUzlzaDBDZ0pVVjQzNUdWZFFxUG1l?=
 =?utf-8?B?RWQxK2NpZS9qUWxvalVzcVV5bEtzVnZlMzk2a2xCdjFlL0IzRWtlSFVFYkJK?=
 =?utf-8?B?N2ppQUIyblptU1Q5UG9MKy9FMEVSNGZZaHJNVndiRTJWTlg0ckNGdjlIeUJE?=
 =?utf-8?B?cW1tbEwwTUJGd0lWa1pLZkMvaGw1VlVwTGVHVUdIS3piMGg5b1gza2xVbTMw?=
 =?utf-8?B?VUs5RUtKRENkU0lNWll5N1ZEdHNGNDBkZEtzQlJoZTFzbkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGo0RExOLzUwUG5CWkJOelQvQzl5K0ZWV2VHYnY0a2htYVg0bGkvczZzVUxt?=
 =?utf-8?B?MkFSTW9nN3h5RVBYdDRJdG9odXlSdW1OM0FOaTVJeWxCT1ZHRG1rbHlLU0RL?=
 =?utf-8?B?eDFQbzROVStqUzNjVHpQS0ROU3FGZm1MbUU4OEJYSnlwMGdsSTJNUndXOERv?=
 =?utf-8?B?TWRBcTAxdDJnZW9TWDFKVEpZTEU1OHNzcHUySmUrYmt4U2ZQQWVSRFdZSXlD?=
 =?utf-8?B?OFRnT3Vnd1JmTXRYblVsb3AxTkpnUXhHVXd2Y1lld05IOHRENlBUNEFDcGR0?=
 =?utf-8?B?UVkxaitGZkR2UjNyS0E1VGtKMlZUOFBKbXpoWmI0ZFk1VDZmOHV5cWU1cEVV?=
 =?utf-8?B?K0pzSWw1dEk4N0FDV3BFeStQQ1hFRklvSE96U3I2eHh5SWw5M2RvZklqZk9y?=
 =?utf-8?B?akxOZnhpb2RNSWl5U2l0ZEdhdlIvelA5UXJYWkFrMUxaN3B1bjdtYkYrV29a?=
 =?utf-8?B?eWoyWlRxRUtYV1ZFeFhYN0lPVHNKdlFDeUZadngySHBwSjNvZDRhSy9UV0c5?=
 =?utf-8?B?eVc1ekJheDZMZDFramxvNE9XYmNYQzQ5SFZKaXVkeVBnay9CZ0M5aUhDNGdU?=
 =?utf-8?B?b1BQSWtqWW16ejFUV1hWWkNJcWE4ckFXQW44eGs4RnFHTFR2aityZUhGU3VS?=
 =?utf-8?B?eWhwekxqQkx3ZHA5UG5ZTFF2NEVqTExZbFZnQWtwYWlTZWJHTWtSY291R2t5?=
 =?utf-8?B?MXJiV25aUzU5WXQ1MGpnb3Z2djA3WmpiNkEvWEJNcUpkMEpCMlFpVXhxdFd0?=
 =?utf-8?B?cmxZYWZ2NkhVbjdrV1FqRzZueThjRmVVcndmZzZKSzdOYTlUMUd3UWgramh2?=
 =?utf-8?B?WVB0MGMxdDRrVlJWWjRnQzlqS3ovT0hCV0s0aGYvSXNLYkNKZDBobFNHQU04?=
 =?utf-8?B?cE9zeTlHWnptcmhXQUJ0MWNjS2ZQamgwby9CbXptUzhNdXNLdy92STgwS0Ir?=
 =?utf-8?B?Z3M3amdvUktTcVdxR2FuWEVKYlV2K1h3Y0w1VlNNRFU1Rmw3RTYyNy9yUWlY?=
 =?utf-8?B?MXZGV0xnRmNVZVRLbGNnUDVHM1gxZ3p5M2hYaG1KRVU5eG03THA4MllhRHhm?=
 =?utf-8?B?TWNyTnFkMzVyZUIrZGdpcFJNMlBTb25wQk5yT2FKYy80bEhrVUIreHZWeXJl?=
 =?utf-8?B?cS9TY2N1azQ2cnN4RXBPRUJhRDhBY0FiNTFiUWt4TnJrbklGaWh4WWYvWDUr?=
 =?utf-8?B?RG9nQnN3RkpzQ2doVWtUWU9mV3VqblJPZ2JEZFkxNG5lTVlJcVBFcysvVXMv?=
 =?utf-8?B?U1V5dDFNQVR6TTZqbG4yZThIU0ZaR0FhVHNXNHJURmsxY3kvWloxVWsrbU9T?=
 =?utf-8?B?SXFNNlNSeGQ5dlo1enJNT0NHaEZnS2phckNSL3B3TlU5MzdWTjBQUnU4am8x?=
 =?utf-8?B?c3FscUN6UEtxUnBYNmlkOFRKUjVLVWJhVkd0QW5Ob3ZXMVhKY1IwNlVma09G?=
 =?utf-8?B?MkpEVlZockdBTXUxYkpVMWdVVEp6bVdBbkoxbWg3YVBvT2FoOUtnNzlZd0FV?=
 =?utf-8?B?M3V4dElrT0YyYjFMRUlHaDVFRHFjejd3cE1YVjMxNTJLamtBQmkxOEpoQTM4?=
 =?utf-8?B?bDN2eXFJaVN2ZjQwZS94Y2VyeWFrZU43ZXI2aVAvbkJPY3BTd2NtcENuc2hG?=
 =?utf-8?B?QTRlRVNicjRZMjJVaVhHVkh3MkRMS2l5eSs5czRwazZoaldDRGNEQjRjT1pw?=
 =?utf-8?B?UE03Rnp5c0NVdFpoRWVtK0xSN280RGpwRjYyTm1SZzIzUnlpV2RBVDFzRjE2?=
 =?utf-8?B?b3ArWkV5YXNkbytwV05Kd2VSdWNUSnNrazJ0MzJETmxVRTRQczNJRkl6anNw?=
 =?utf-8?B?WWRaNDlhbk1SVlZNS01vSUZabzVUZGgvQlhPcmF5UXZMNDlpQlF4YkpTeHhF?=
 =?utf-8?B?N2h4YWY0d3ZIdzA0dFRqYzVpUWFZTzV3dVhvMU9GV2d0ekt0OGNEQURxRHJS?=
 =?utf-8?B?L3lQd0JSTXpPcTJpQzlBRDBFbkMyY3pkTkdQVnRCdWpEcFhhZkFvVVF6cEtu?=
 =?utf-8?B?aFJ6RVBkU1hZMWhKZzNVb0lHdFVwOXZ0bldhWDZISnAwR0ZDY0FFSUxzaXJu?=
 =?utf-8?B?L2t1N3NGVGFoc3dIVW04ZVY2Wm84RGU5RzdMVzlrTEcxVy9vdWt0UXNla2Zo?=
 =?utf-8?Q?7HzSH8/uyxs8CTkMgNjowmrWq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4337ee54-a07a-4abb-2dfe-08ddee6b60e4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 00:05:11.3544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8wJlsiluNO6P3JdjW5x7mWR5Kle3ZDpLMbHo5p5X2kipiQnk6B7OPSKw+lda8N/MIuO8k53//oKOVfMErvhskA==
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

Add device-private THP support to reverse mapping infrastructure,
enabling proper handling during migration and walk operations.

The key changes are:
- add_migration_pmd()/remove_migration_pmd(): Handle device-private
  entries during folio migration and splitting
- page_vma_mapped_walk(): Recognize device-private THP entries during
  VMA traversal operations

This change supports folio splitting and migration operations on
device-private entries.

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
 mm/damon/ops-common.c | 20 +++++++++++++++++---
 mm/huge_memory.c      | 16 +++++++++++++++-
 mm/page_idle.c        |  5 +++--
 mm/page_vma_mapped.c  | 12 ++++++++++--
 mm/rmap.c             | 19 ++++++++++++++++---
 5 files changed, 61 insertions(+), 11 deletions(-)

diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
index 998c5180a603..eda4de553611 100644
--- a/mm/damon/ops-common.c
+++ b/mm/damon/ops-common.c
@@ -75,12 +75,24 @@ void damon_ptep_mkold(pte_t *pte, struct vm_area_struct *vma, unsigned long addr
 void damon_pmdp_mkold(pmd_t *pmd, struct vm_area_struct *vma, unsigned long addr)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	struct folio *folio = damon_get_folio(pmd_pfn(pmdp_get(pmd)));
+	pmd_t pmdval = pmdp_get(pmd);
+	struct folio *folio;
+	bool young = false;
+	unsigned long pfn;
+
+	if (likely(pmd_present(pmdval)))
+		pfn = pmd_pfn(pmdval);
+	else
+		pfn = swp_offset_pfn(pmd_to_swp_entry(pmdval));
 
+	folio = damon_get_folio(pfn);
 	if (!folio)
 		return;
 
-	if (pmdp_clear_young_notify(vma, addr, pmd))
+	if (likely(pmd_present(pmdval)))
+		young |= pmdp_clear_young_notify(vma, addr, pmd);
+	young |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + PAGE_SIZE);
+	if (young)
 		folio_set_young(folio);
 
 	folio_set_idle(folio);
@@ -203,7 +215,9 @@ static bool damon_folio_young_one(struct folio *folio,
 				mmu_notifier_test_young(vma->vm_mm, addr);
 		} else {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-			*accessed = pmd_young(pmdp_get(pvmw.pmd)) ||
+			pmd_t pmd = pmdp_get(pvmw.pmd);
+
+			*accessed = (pmd_present(pmd) && pmd_young(pmd)) ||
 				!folio_test_idle(folio) ||
 				mmu_notifier_test_young(vma->vm_mm, addr);
 #else
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 2af74e09b279..337d8e3dd837 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -4641,7 +4641,10 @@ int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
 		return 0;
 
 	flush_cache_range(vma, address, address + HPAGE_PMD_SIZE);
-	pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
+	if (unlikely(!pmd_present(*pvmw->pmd)))
+		pmdval = pmdp_huge_get_and_clear(vma->vm_mm, address, pvmw->pmd);
+	else
+		pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
 
 	/* See folio_try_share_anon_rmap_pmd(): invalidate PMD first. */
 	anon_exclusive = folio_test_anon(folio) && PageAnonExclusive(page);
@@ -4691,6 +4694,17 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 	entry = pmd_to_swp_entry(*pvmw->pmd);
 	folio_get(folio);
 	pmde = folio_mk_pmd(folio, READ_ONCE(vma->vm_page_prot));
+
+	if (folio_is_device_private(folio)) {
+		if (pmd_write(pmde))
+			entry = make_writable_device_private_entry(
+							page_to_pfn(new));
+		else
+			entry = make_readable_device_private_entry(
+							page_to_pfn(new));
+		pmde = swp_entry_to_pmd(entry);
+	}
+
 	if (pmd_swp_soft_dirty(*pvmw->pmd))
 		pmde = pmd_mksoft_dirty(pmde);
 	if (is_writable_migration_entry(entry))
diff --git a/mm/page_idle.c b/mm/page_idle.c
index a82b340dc204..9030c31800ce 100644
--- a/mm/page_idle.c
+++ b/mm/page_idle.c
@@ -71,8 +71,9 @@ static bool page_idle_clear_pte_refs_one(struct folio *folio,
 				referenced |= ptep_test_and_clear_young(vma, addr, pvmw.pte);
 			referenced |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + PAGE_SIZE);
 		} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
-			if (pmdp_clear_young_notify(vma, addr, pvmw.pmd))
-				referenced = true;
+			if (likely(pmd_present(pmdp_get(pvmw.pmd))))
+				referenced |= pmdp_clear_young_notify(vma, addr, pvmw.pmd);
+			referenced |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + PAGE_SIZE);
 		} else {
 			/* unexpected pmd-mapped page? */
 			WARN_ON_ONCE(1);
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index e981a1a292d2..7ab46a2b4e15 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -250,12 +250,11 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 			pvmw->ptl = pmd_lock(mm, pvmw->pmd);
 			pmde = *pvmw->pmd;
 			if (!pmd_present(pmde)) {
-				swp_entry_t entry;
+				swp_entry_t entry = pmd_to_swp_entry(pmde);
 
 				if (!thp_migration_supported() ||
 				    !(pvmw->flags & PVMW_MIGRATION))
 					return not_found(pvmw);
-				entry = pmd_to_swp_entry(pmde);
 				if (!is_migration_entry(entry) ||
 				    !check_pmd(swp_offset_pfn(entry), pvmw))
 					return not_found(pvmw);
@@ -277,6 +276,15 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 			 * cannot return prematurely, while zap_huge_pmd() has
 			 * cleared *pmd but not decremented compound_mapcount().
 			 */
+			swp_entry_t entry;
+
+			entry = pmd_to_swp_entry(pmde);
+
+			if (is_device_private_entry(entry)) {
+				pvmw->ptl = pmd_lock(mm, pvmw->pmd);
+				return true;
+			}
+
 			if ((pvmw->flags & PVMW_SYNC) &&
 			    thp_vma_suitable_order(vma, pvmw->address,
 						   PMD_ORDER) &&
diff --git a/mm/rmap.c b/mm/rmap.c
index 236ceff5b276..6de1baf7a4f1 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1063,8 +1063,10 @@ static int page_vma_mkclean_one(struct page_vma_mapped_walk *pvmw)
 		} else {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 			pmd_t *pmd = pvmw->pmd;
-			pmd_t entry;
+			pmd_t entry = pmdp_get(pmd);
 
+			if (!pmd_present(entry))
+				continue;
 			if (!pmd_dirty(*pmd) && !pmd_write(*pmd))
 				continue;
 
@@ -2330,6 +2332,11 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 	while (page_vma_mapped_walk(&pvmw)) {
 		/* PMD-mapped THP migration entry */
 		if (!pvmw.pte) {
+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
+			unsigned long pfn;
+			pmd_t pmdval;
+#endif
+
 			if (flags & TTU_SPLIT_HUGE_PMD) {
 				split_huge_pmd_locked(vma, pvmw.address,
 						      pvmw.pmd, true);
@@ -2338,8 +2345,14 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				break;
 			}
 #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
-			subpage = folio_page(folio,
-				pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
+			pmdval = pmdp_get(pvmw.pmd);
+			if (likely(pmd_present(pmdval)))
+				pfn = pmd_pfn(pmdval);
+			else
+				pfn = swp_offset_pfn(pmd_to_swp_entry(pmdval));
+
+			subpage = folio_page(folio, pfn - folio_pfn(folio));
+
 			VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
 					!folio_test_pmd_mappable(folio), folio);
 
-- 
2.50.1

