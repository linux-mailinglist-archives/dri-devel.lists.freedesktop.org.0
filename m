Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D78B411CD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 03:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEE910E857;
	Wed,  3 Sep 2025 01:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IB0qeE64";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B07210E851
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 01:20:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pT3q4h4BmGN6geowPUojsJJ5Ii3G7mjNRFZhFdbmO0n2YV6K+SzHAdzyriJ/jNrW/4e5ILxsL3HP7lbE62OiaanPSv4036SYTE+9jrNyiS3TLPgv3+VgyTXnXkc55RHjY5Hn8N1IVe/ag0F9cNPSvro7mxUjrst9oDNuCRP0mWEPKG2jnvm9Zui6ASBU9LQCUyMgZX4auKDo6X1bSDyR28u5WjSXvrJrR4VRUk9m7ju9La4HC5hFcipi/nDz+44ePNmpU38CaCbPqFIV/qx1dROvLax4QfTfVi94JiONhFfmqVbBYtALIWjXcBFybK19r92pno/7rBkeG4WuSomNgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/oU0sEP7/Os3HFnf9xi7YsxCWIu7Ka5WJFGKVP1C48=;
 b=Bdwmr80Oh65XrCbMRY2L7r6Tc9rDLgY26w3D/RwogBh9kMiwWVXlXQtzHZrISJ/xPjo15s2FSKIxbNZk7gDQmQGNVKVahLNbjDnS4wrMHQA1pxFOiuaoH6DPjZeUeRmQeT5HAlKCNd1ejNBXC7RknoYA1SagJEFLYwJTqbrgsMe+vdkRZ+1y1PwqctV2szGqMtsQrJn9jBO4CHZ7cCE0Ez+kpzeckVK7btyFqjNRfNqr85LW/Y2cweSvZKl0HOiYWj4PhcZUKZcK8lF6ZzsJ2ZLUtyapBxPjMXmvdZJs7pEaCnuMRoTpKdFt3yTuCWVhMl4ja+LHHFTqru4HFQVPcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/oU0sEP7/Os3HFnf9xi7YsxCWIu7Ka5WJFGKVP1C48=;
 b=IB0qeE64s6WULGOoq6GMK/xV7yYjmlvoZdOpQcfCBRArLvS9ZOrp2UBY39G+LIcxqnTwIjgUYKtvh94AVF9yJ1LX0nN+M0j/A+mQiuOZjWIRtt2m7MjcXL5ffF0E3JSCtuhOulosVQFgkzEvLFNbuqW2Qff7QZcERfilOmzOi3IHRVzjSasAKSRwiS6g71+3B1gVSzkR/ssNzmnUqkbSoT0uQjGeiFymvZWw8Hjxh2/eSiCtoY8E4aCtkbKCetBFda2X4knRS/pmVU98ineme1M5u8cOJLFtXKCpNZZncun4OqLFizgpQA1TBsfzIXjYCqgoHun28XB/q14D4mCUpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by MW4PR12MB6708.namprd12.prod.outlook.com (2603:10b6:303:1ed::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.34; Wed, 3 Sep
 2025 01:20:04 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 01:20:04 +0000
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
Subject: [v4 09/15] mm/memremap: add driver callback support for folio
 splitting
Date: Wed,  3 Sep 2025 11:18:54 +1000
Message-ID: <20250903011900.3657435-10-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250903011900.3657435-1-balbirs@nvidia.com>
References: <20250903011900.3657435-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0378.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::23) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|MW4PR12MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 280c3925-e2bf-4ac6-010c-08ddea8802f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2F0VEVQamxXYnpsNjdZNjZHZS9TWGgvbStZTHhBQ3NrNWdBSmxoZXI4YWpV?=
 =?utf-8?B?SGViUW85ZjJURnNWUWtXOFhTbkQ5bFcwR3Q5UmRwVDJ4UXNWeUR3VXZPcHRP?=
 =?utf-8?B?eEJsTVFZNzlLMU9VRTB5U0pXbWVFSVc5V04wUjJxdUE3dVNnRzRXdWZmeWY0?=
 =?utf-8?B?NzJaVkFWVEZFdTdMTzh3eTBKQlZuOHdVbTZBc3lTczg3UHJ1eEFvUlJGSEEy?=
 =?utf-8?B?bUJlSDBCL0NSVjZpS3MzT3c3ZXhRUzQySWk3QzBsQ1Y1L0wzK0lNWHhwQTJD?=
 =?utf-8?B?MGNNaCtiZ1BSbFpuRWlaVVVSVWlaMHgyWWF5Uk1pcytvQ25CdlR1SFY1MitL?=
 =?utf-8?B?VXVjajh6QWZsbWJaV3Blb1I0NWtod25HUTBlall2MjdtNnJXZGt6cmdPUDE4?=
 =?utf-8?B?OHBVTkFGeFAxMHF1dzZHTUZZdGYzQVZkV1E4Y3lvbnpKVFBaa3dkTGV5emZv?=
 =?utf-8?B?bTYvOEtYZ1R4QXpSSUlVQ2VkL1ZRWW1WcTFPbDRaK21VOE5WaFEwNld5K0dp?=
 =?utf-8?B?cmE1aTNUQ1VHS2o0NWRGNzkydktKcjRxa1dKamJodS82N1NlTnpwQldJamJl?=
 =?utf-8?B?Ri9TZDdZYW02M0hGWWRFVnZnVGw2TEVTa1NSVGFld2NYT2RtYnZqM2dWS25I?=
 =?utf-8?B?WGJ3ZkEzZE9LVjZKRUJ5bkJCazRmaUY1SmFGYjdDejFIQko2S25kM0c0dDVs?=
 =?utf-8?B?bVdzVHIyemdUeEs0ZVMvTlNudmp4QXZyOWlvcktlZWFQMWdySkNvWHpZZkx6?=
 =?utf-8?B?R3hQQUhHRStsSFlRVWVQald5VW40aXorSFZIcmpiNDZFdGZrMXRlRVNEYi9K?=
 =?utf-8?B?eEZTS0w3SVRobTA3aDU0UW1mOEtsUTl2ZEgwZ2l2UWgzaUQ2blh3UlR4NDZG?=
 =?utf-8?B?dU1IaDkxNVN0ZGk3cWI4UVN1Nm50d1EzQ0JvMWRBSXRJdjBxRkppYlNNL2M4?=
 =?utf-8?B?RDQxVHdoZGxkOFFadHdNYzJlVTNPR3dRb2prNDc1U3orMkc4RjBDTEMwNWU4?=
 =?utf-8?B?OWdaZlZjV3ZWaUtGM0FZL2syTUsva0pmd3VQblFJWHRXanFwc3NnL1A2QytI?=
 =?utf-8?B?WE80S2ZDdGVCd1pGQzcxMU43N3dJdnBYNUFQak5vOGcyMjFFNTNZUHhZMi84?=
 =?utf-8?B?TVpOUzRGbHJlYkpLR1BJOThzZ0xMZ1FTNE5zV29iZ3pOaGl1RjNnak9YaFBs?=
 =?utf-8?B?YXR6YU9lQlNoUkxFODNCUVE2SEdoZHpLV0NWNCtyR0xrMjMvNlRiZHl6dG1t?=
 =?utf-8?B?RFdsV3JhRjNUUGdyamgzQno5QTR4Z0ZQQ1hBdXVkdDZVM1VZbmcwWkVQMWo1?=
 =?utf-8?B?WUhKcU04UGJHTnJUOVIzVU5KWXFWd1dXSGN0ZCt6YlpaZXZVZk9FMkhqb3VD?=
 =?utf-8?B?Z2xQSHNDenVNdGFLTlovZDFxbVo2U3dmSlNIU2hUK2hxRUdmK0wwc0xpZ2R5?=
 =?utf-8?B?ZDdDby9mUjZGV0ViYjNpVWM5S2p1M2xoenRRMGxCejNrTDlQUmNxdHdKVjBX?=
 =?utf-8?B?K3dDaUF4bnkyWllQN1lRaW9hc25aVDl6WEkwdXp6Yk1KQmpleHBvNjVwNDdR?=
 =?utf-8?B?Z2x0ZHN4NDk0RGZCV0NjRVJEVkg1cUtHckZTcG91U1FBMWF4NlhYRVNjRE5q?=
 =?utf-8?B?MkE1NC9ad1pETVAyeWt0RzZyNkk3VGZVaG1BUEg3bHltemtTZ1VUVDNpczRS?=
 =?utf-8?B?YU9zbE8vNWNza0phTlIvV05hT0RzTGQySkg1b2xnTGh3ZnJXb2hzV0VwNkh2?=
 =?utf-8?B?aW1qaFRHM2FPTWhqdHU1VmxBUGE4YTl6dmt1WjdrUDNVcUEzenVDZklVeHoz?=
 =?utf-8?B?NUtraWhzYlJOUUI1dkpQQldQalYyK2QrdjVOdzVubVlLKy8zOW5tMi9hMDBv?=
 =?utf-8?B?emtUSXBLL29wQVRLSmVnbGZmeG1HR2RSdFluQ2ZtSEN2NFBQNHIxNFRXa1Zt?=
 =?utf-8?Q?vJF9fTsbESk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmFXWlIxZnozUHA5MDVKZ1IwVWZyREh6U1VkVENvU1MvNlF0dk1MeVFUamM3?=
 =?utf-8?B?TlJ6eCtKaXI2bzZUdjFJUmM4ZFZPRFdCcmRLZ2NlVnN6WENCU21mS3FkU1Zj?=
 =?utf-8?B?ODV3UlFYZnR2L3NaQTI0dm9LNHVqeXpWNUZ3bnhwcEQ2V2MzNFZlRkQvbzRx?=
 =?utf-8?B?SkJmYnJMa2ZRa0hKL09lYlV6aGFZYStiUmx3NUtKM0ozTHVoYVRmb3V6QXZC?=
 =?utf-8?B?RUkzL2s3THBZSkZRcVBPT253S2VIK3cxbHUzQ0lybzg1R3BPeXEwajhrT2xZ?=
 =?utf-8?B?dit5SFhDUDJhSjM5RGNWcHJZejY1RUJaczNtMUlLeG9tWmZNVzdSbmorK0pP?=
 =?utf-8?B?K3B2REFhTU1ZRE12Z291WDZCSVZIV2NYTlhxaHZNUHhvNTR4dEh6ek1uelRi?=
 =?utf-8?B?aHdDZXdlZ0dhWTFqajNUcUgvb3h3WHRxSkNrL2pvK3Jsd21wUE03YzZxUkpT?=
 =?utf-8?B?MGJqa1FlcFpzY1lsK0NFcGowTlU3d1JseGI3NElFcS9pcDY1cWlSbDFvd0dT?=
 =?utf-8?B?L0RESEY5YWpwSDJTTk1sczdKYUpPeDV0dU9idGM5OFhHRG5JajhzNkFUNWJi?=
 =?utf-8?B?VjNlT2YvaVV2RDZ6aTkydnF6NHUxaW5Oak5lbWoweVNJS1FCOHJRM3Zhdkhx?=
 =?utf-8?B?OFpOdTFKNTB3QnV6b1I0bm9vdFRSelYyRzdZM2JpbHFiVUdPU2JmVm43bjRY?=
 =?utf-8?B?UzVIeXhZSlh6eGlHTXVKRzdYNW9WdUhBK2t2RU1lU0pzYkdwby9mZmJFV2NK?=
 =?utf-8?B?MXhwTnVsMk9iOGRyeU90Yjg2MnlPMUh3ZzFLejNvKzRZaS9JT3h6ZmV3UE1T?=
 =?utf-8?B?Z2c2RHRGRDMzS0lrWVRIWTlPUTZ5eTdlZ3Q0eXRmU0N4MUVkbk9oMmRabitS?=
 =?utf-8?B?SStuZXlUUFNrV05BVmVUcUtQQStUY2RndVNNWHkzWmRkblRWQjdNcmg1dVd5?=
 =?utf-8?B?SFltOU16ZkFBdXBMWG5mN3duS25kcktUQVBFbUZ5TWNlUjFoMFdmcHJzK2VZ?=
 =?utf-8?B?TnIrMnJsclU5VG9KMys3RXgrTWwrT3dXRHh2TTBRb0JMemJTSTlvOThjeHc0?=
 =?utf-8?B?SURHK3NXem1kSmNGQitiejI0UFZvME16bGowbXYzVlVvLy9heGRaeGxMOWxl?=
 =?utf-8?B?SVVJZkhPM3FUenp6SExqSHlJdzh5ZE0vWHdLZ2NOMENBdE9hN0JkdW15cWVE?=
 =?utf-8?B?YXpWVWZ1VXVkN04vblVhd3hYZUo1Y2NMQytNVmRqZW0xU3JzWlBiVThPNTZE?=
 =?utf-8?B?L1cvWWlFcU1mT3hQOTNFZEtGUTZ2aVhwWnF1cVdxOUlzbXZOUTk2VERHeFBu?=
 =?utf-8?B?ampVV21aSUo5Y3RKaEx2UFBrVktrdmoxWGJiYUZsOXlyNHFuKytBZVZqVVdY?=
 =?utf-8?B?ZUdsZDlxaUJUTUpjM2YwN3oxK05nZDRKdkpRMlR2RTd5cUNLZEJrbFpPQzRs?=
 =?utf-8?B?K094MzlVUHVKdUtxQ213eENxN3JVakZKcGdXZDZ0ZjIyakRIRnFWbHFzajlv?=
 =?utf-8?B?NlZUSEpEN3hnVFpNdEM0RUFtRUFmTlg3NVkvYmVFc1BERm12eHNqbHA0bzhl?=
 =?utf-8?B?VmxiVGs3SWFNdUorblNFUHBZc1k2b3RER3NhSlovUDJCVWwyUXNNbUpPZnQ3?=
 =?utf-8?B?M29ZM0ZDNDhtNWxjSnJIMXpUa0Z6aXZvcUR2L29oa0ZIQ0s3aXd1TlVmTkly?=
 =?utf-8?B?M1YreDVHT1FOYzQ3YlZaRlFwaXFWUG1abnRkdHdCVklodlF0WS9xaTBsVnQ4?=
 =?utf-8?B?WDdQOTZVMUhPMEpJNG56QU10SUF5eW5PbzJEY2pOYS9oeEk3UTdvMXJlQ3BM?=
 =?utf-8?B?bkNWQlh1YTZYR2NUQlRSUEx2QVhKMGtMbzVTNThwZ1ZiMENlUGErWURUemJX?=
 =?utf-8?B?bFpWVjZXZXBENXRSOHBGUUl1RzJuWnEwZy9GZGcrSzV1VjNXeHcrMmVCRTd2?=
 =?utf-8?B?VzZ1VnAxdkR6V2t3bndkd1RiNnVnWDM5UndERVg4dUVlNGpmY1k2OFNDVEFG?=
 =?utf-8?B?RXZjc2UvMFFra0w4SWg3RkVqcThQSEVxbi9IOWYzU2NFalRoalNqL1VQeVpS?=
 =?utf-8?B?Z2VLZ3dWZG42UW9PcHRrTFJ3dzIwU2NaM3ViUGpZU0NIeDRaZHdJVE4xN2dJ?=
 =?utf-8?Q?/iqGQ1i/cxDoDaIhRjVsTmOpP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 280c3925-e2bf-4ac6-010c-08ddea8802f1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 01:20:04.5089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+emIkdfVOnI7Bz2Q3xZoz4nMNdi8FYSIILGsguAo1GWpuSKBffb1bSo1C2xTmxj2DQw4Af6Hs8fWneN82iOcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6708
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
index 0c5141a7d58c..20f4b5ebbc93 100644
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
@@ -229,6 +236,23 @@ static inline void zone_device_page_init(struct page *page)
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
@@ -263,6 +287,11 @@ static inline unsigned long memremap_compat_align(void)
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
index 1ae97a0b8ec7..681b3656a6d6 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1185,6 +1185,7 @@ static inline struct folio *virt_to_folio(const void *x)
 void __folio_put(struct folio *folio);
 
 void split_page(struct page *page, unsigned int order);
+void prep_compound_page(struct page *page, unsigned int order);
 void folio_copy(struct folio *dst, struct folio *src);
 int folio_mc_copy(struct folio *dst, struct folio *src);
 
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index d8216fbae1ba..9c0ddc6ec2a8 100644
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
index 9adffe343de4..259224f78af8 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3915,7 +3915,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 
 		ret = __split_unmapped_folio(folio, new_order, split_at, &xas,
 					     mapping, uniform_split);
-
 		/*
 		 * Unfreeze after-split folios and put them back to the right
 		 * list. @folio should be kept frozon until page cache
@@ -3966,6 +3965,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 			__filemap_remove_folio(new_folio, NULL);
 			folio_put_refs(new_folio, nr_pages);
 		}
+
 		/*
 		 * Unfreeze @folio only after all page cache entries, which
 		 * used to point to it, have been updated with new folios.
-- 
2.50.1

