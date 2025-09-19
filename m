Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC2CB87A3A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 03:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C0C10E922;
	Fri, 19 Sep 2025 01:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hQw3IMoJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011034.outbound.protection.outlook.com [52.101.57.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D6B10E922
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 01:49:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLTv3XyYm5J+qkjMwqyfAwnXSzChfkeLAP16DXvlW4vZ0eDuZP6MVOIdtTc1LVp6q9JkIVjXONCnbupUR8iPyxAaztwANkcO89I/u93NBGa56QXnxc6yKprR+s8zOaBov8Yupf5idmDoUc/lcxDL2vyIMO8HZ5AUreU/t1UY7wHIBPJ7XoTO/9uSJ+wUOrmL7hd9U3GkFU62rxSGGnNDNQL2By4Fiafmk8IUbuFPXGWPfL+5od3xEHortYCEJygYZICf3/3lYbrkTdr3qHs3qzm396gSg0HuqzA03YO9GkCFxQCjRuaC4Lr/Gw1TiqZ4HLqmmr/l26QF9luiuGJMRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33BaAsCWK71xp5Ewce/weN1NbP8pGc5lsLiYK8p9CkI=;
 b=A91RECeNC5oirk8BWxOY0bgs1kyiNYCqPQ4z9LaIZBAC5hU1nBItDrb/vX0KeCF7GxRbAHgRF0UYXDSqy0kRosLk2lejCzW8tbQMRjNlcGuklkpwXDmtAvbTEG8nNRJJ4ga7QMZRu6hh4ETMqf+LpwkMiVuQx6NVWaYgCBZcNMBk8aUA4BSpmzPbifJr3j17xK4M4HSbPI0lFSdcPi4j1fxGoENPYpXA9lkfKgkVmGq6fEWYps6hxw0QwDGxV+rXxEEW7LqZ1c6TiipWKzVOL8pd2gz0oVPkf2FOU7DTycSdDMU98FHrR6MujIX8HwRz/SAbOh7Bgxjf/+C8K3tmyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33BaAsCWK71xp5Ewce/weN1NbP8pGc5lsLiYK8p9CkI=;
 b=hQw3IMoJ9iToY5NQOZXstf7oTxiHZ+PncGEHaOMyhR8MTNip0yomg0kFbl/Hgv44jgK3/b13uPrBUCxa5RaVaU1CcYuC7pwK0SEFuY0MDcylnFeCJzMpIY9/3U/7Ry8pNqRBU8OWhZxKxGU8WMshkVlHkLyUuVXzlbAw1hWdU+vgCywDKCO9kNzWzG+zzpsorfXXW2/IrIZqP1I5Brt4R0CwknTTca2Cq7G46vMqk2/wDr7MmwjC3Q/rqGhQgxHc5DCSzKXkduuCSZp3wBCBDIlESQCfSI0GUVn3l6wYlbGQVGD48fmLnH6UCfSTwZb9T9PsmS385aByWPuU5lKI/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by IA1PR12MB6625.namprd12.prod.outlook.com (2603:10b6:208:3a3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 01:49:28 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 01:49:28 +0000
Message-ID: <ab236dfe-5680-4fa5-89e2-3a56cfe67ba5@nvidia.com>
Date: Fri, 19 Sep 2025 11:49:20 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 01/15] mm/zone_device: support large zone device private
 folios
To: Chris Mason <clm@meta.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
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
References: <20250918122813.1440093-1-clm@meta.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20250918122813.1440093-1-clm@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0045.namprd17.prod.outlook.com
 (2603:10b6:a03:167::22) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|IA1PR12MB6625:EE_
X-MS-Office365-Filtering-Correlation-Id: dee1e836-dcfa-44a9-89d0-08ddf71ec4cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MU1HdEp2eGJRNnFRazJzNVFhMWNXVUg3aXlMYTdzYkRPVmpmRVpleGJPMVdS?=
 =?utf-8?B?cURGbTA4bXJZdVZMbjZEZFZBd3IyV2pHSUdjZkRmZ1VydEs2bTNsamovRkIv?=
 =?utf-8?B?SHBXRElqVjlNZWNlazE0Z0wzMERWUDk5YnJKUW1Gb3ZrNlkwV0lxT3RNdlR0?=
 =?utf-8?B?SFRocHdsRWdXOW9UdWNCV0VuZ3ppYUdnWDZObmVyUG5Mb0RpR05Xbks3dXRo?=
 =?utf-8?B?QXFRa0pxakRQNmFTOEtRcHlZbzFmM1drZGZySVhkRklrYUFGRk1zRWVaazVC?=
 =?utf-8?B?SWZ2WHVvTkJXemJCSkFweFg1Z3k2LzY1VmtpNDlFNjBvbVN6Nm95TGd6T24r?=
 =?utf-8?B?d0FvLzdrM01kaG14VlJ5bS9YbUxPUEJXb01SditYZzltWHVUM25RK296Y1ZZ?=
 =?utf-8?B?Sk9nM2ZhVWVrMzRQNzdWNUREZ0QvN2JBMXVWNWo4MTJOK0dXSVhEWk5BTFB6?=
 =?utf-8?B?R3NLVFNPZ2VnaTdybm91a3BEUlRUOVRJYXI1T2NsWk80NjZ2eWVLWk8yWm9h?=
 =?utf-8?B?NFBMOUVuckFvcXlEZGROcGc1SHE1OHZiMzhYbEdEMnFtRlM5Ull3L0pMdW5k?=
 =?utf-8?B?ajh5Q2NLLzVKSXFQY1ZzOVI0a3o3QXhsZHpuZjZaTXBxdXR1Y2NhdUZaSkp6?=
 =?utf-8?B?dGFkSDNYTEdRbGd2UE9YUE1mV1dUVUZtRm0xazdLY3MvWEp2ZnlqV0k4Z2xl?=
 =?utf-8?B?WERxaWNiNHlPUmRvVzlXY0d2RXYyRUNHV3ZGeDFTWlNkM2NvZXN5ZWdoaEsv?=
 =?utf-8?B?VUMrUkplenI1dzR5TVZPbHloOEFaQ0x4WHRoSmZrRktoUHVzcTYxL1liUWNW?=
 =?utf-8?B?enpqVW85QzZPbE9mU3ZGNTIxLzlIUDVtdllPL2xBWkc3ZFo2UThzQXQzcjds?=
 =?utf-8?B?WDcvUmk1VGYwUXFCaUE3a2pXN0FFcjRpM0toTFhqTFJWaWtBbndYUXIydFNO?=
 =?utf-8?B?dkR5bGtNQ2Y4QnQ2eFh6MVBwaFl6MmF4cUIzLy85TnAwQmNZK1VWcnQ2b3Ro?=
 =?utf-8?B?UlQvU3A5dGNWN3N3NHBhRngyd2hXaGJvZ2F5YVpiOG5ySCs3YzNrL29HT2FH?=
 =?utf-8?B?aGlmL3hIczVlbnA5U3dUQmZkNFY1T1dnd1I2NVJRT2pWcWkvdjlNUG1mN0N1?=
 =?utf-8?B?UURvMk92eEp5dUhXU3pSajUrRnpuSklIUUlLcUJVQXZQR2hnaUJKWW13Ymow?=
 =?utf-8?B?RjZLN1lTa2FaL3JqMzRZM3JFaEFHVUhQYmRXTHRjV09NVk9NVmhpeVF3UWtZ?=
 =?utf-8?B?TjRYUGRReDZmTUNtakZkSS9LNktqckRENWJLMVFvSzlaSlhIMVBYdEttK05v?=
 =?utf-8?B?MGpkaS9ML2t0OU5RUnI0YS9RKzg5L2NaakUxSDR2L2FDRVFuQ0g0VnBLVVpU?=
 =?utf-8?B?a21PL0JKeCtZL3NZMVFIQ1V1eGpKMzZBMjIzSDl3aFJ3dTVDWkNpNHZaVSts?=
 =?utf-8?B?cmlxN2oyRlVrckR3d05IMUFqS2xhYlAvbk5FMWt1UnN0M1lITSt6WmxON1NN?=
 =?utf-8?B?REtMWnVxSHRBMlZWTWdobUVaZHhCc3d0Z2ROek13dk0ybkFSNEEvb1JyaGJu?=
 =?utf-8?B?dzZ5NmQvUVhZS2Q5ZWhyaCtQYTRsNnNkc0FoaE13SHp0UlJNdXpQS1I3Y3dt?=
 =?utf-8?B?d2xZenRidHV4Vkc3dGhkWXNkUnFKWEJOWW9FcEFOVllTZ2hWdFBCaWFDQ0Jn?=
 =?utf-8?B?TG41OGMzK1hMZGROem1UQmVQbkpaZS9odUpzdWtQNCs1N08yaWRlcFpnR1Ev?=
 =?utf-8?B?bHRZSUp0V1VhblNxeko2TmhHZ3FLUlBiZks2dVZtMXRveEVSL1ZXaWhWZkhG?=
 =?utf-8?B?T0FyOENxajZvRk81eVg2aVZianNYSFhKaFlZQnc2KzJLMnRxM0o0akhaRHFE?=
 =?utf-8?B?NWhnZnBaKzhUY2JSdG84eGVaRGpJYlNzQUJtSU4xSTFwaTV6VkUyckc5Ui91?=
 =?utf-8?Q?bHIGOadIUns=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SndYa3g3QVRoeVFOblRxNHJlK3FNWnlsWU1wa3FHMnpFR0x6SDBqN3daZDI0?=
 =?utf-8?B?SlZiaEYzRlZYcnF3VzVmSGFpTUg4LzFzc3FIdHI5U3RnWXlRWkR2Wjk4TVE5?=
 =?utf-8?B?Rnc3Z3V0ZFhCT1JqdFIwQjl1dTZMTjF2eVNEMjlrK1BmMlk4NTdlNTVpS0hP?=
 =?utf-8?B?TnlmUlFlZkUrL1FwS2dZTDRmd2gvYUxVbTQ3MzR6U2lRenQrNml6S1FidUJw?=
 =?utf-8?B?VjRwek1GUWtiOVp6KzU0UjluY01FS0gvYW9DU2lyem9BT2NkS2l0Q0ZNaGYz?=
 =?utf-8?B?ZzJVTkVkakZZenNrczZMMFNyR3llMlRMbUFjOVI2YWhaSnBvU1o5ak9qd2dG?=
 =?utf-8?B?eWEyZFdra2NSeFZsM0VKQS9hOCtXS2N6Q2w4czZEZmNIcUw5cWFxeVRLVktI?=
 =?utf-8?B?OFpkNXFSbktDUXg2OHJBSUR6bElZQ3E1SURuRjlZeW02cWdNUXkrWDhlajAv?=
 =?utf-8?B?WHVsVm1IbDY4VFhEdGF6anQ3VWdEN3NEek15emZLcFk3SFRONXZic0Y0aXZ4?=
 =?utf-8?B?MzF6a2V3SmhBU01GQXhUdXpzcmlNVHRlM0Iybjg5WUNHd1ZTSFJ6Q0JZYWZQ?=
 =?utf-8?B?c0pGRitvaFJvcm9uNzdBSUJ2RnA1TDVPNDAwOFpuNXRiT3k3WjJxVVd1d2or?=
 =?utf-8?B?MmRlS3dLcW5ET1luWUNoNUR6N0tzUHFNMndoQVkrZ0JLY3hrQlJMdDBiZkN5?=
 =?utf-8?B?aTgrc3c0OVBkR1lPUkNHbVl1QmV3OTAzRzVid3Fadzl5VWVpN1NPaUZzVk5o?=
 =?utf-8?B?bG1YOU9BOTZaUFJ2VUt2UlYyQ1puQ1RlSlhhYUEvcTJMSGMzMks1S1A1SnZC?=
 =?utf-8?B?N0V4aEYyUkVVSGowUitFQVhpQ1RtWXRXNVozVDkrd2Q4VjNMWHllRlhubEh4?=
 =?utf-8?B?MjVCTDM5UTVnTnJjMWxJaHRRWTVRaWFEeUsrZDR3Y0x5ZXFOZWE0bnNQVmdx?=
 =?utf-8?B?Mnp4WGtIc3dqWnR4NDg3V3NlME42WmZnYURzbVFJZWRKR1c4ZElrYlhtMDhS?=
 =?utf-8?B?YmlFWEFpUkFqMkQ0eXpsbVh5Zm85TWZnMHVQYi8zTGs2MWhsRmJ2YUJuS3Mx?=
 =?utf-8?B?SmUrU21KUm9IQVRTRi95MkxuZ29rS2t1YitUTzRHTmJlSEtFWSsxVjRXQzc2?=
 =?utf-8?B?aVBuUEs5SlVpZVJqcHdPVXo1MlZYbHlPSDBncDB6RUxSNG1MMXJrNFlKYWcz?=
 =?utf-8?B?cWxBakxUZkdJdVlLOFhkRXZOcjZ2SVVOZHNPOXNRRDY5MGZUM1FPZDNMOUNi?=
 =?utf-8?B?ekQ2UzF0eGxTK2UxUk1Cd0Q1NVZVZXF0RDNnNm0vREFLTmUxUFFwbUE5NUNO?=
 =?utf-8?B?WmRPZHJ5N3hERWppSzFPb0RDMXU1NFAvNkZaUVZld2tZa01NUWQ2TVc0R0lY?=
 =?utf-8?B?UHA1QjhkcmNKbzlzWVJIL25pMnBZdEswczlRWDcwNiszUWNiRU15MnVlNFZS?=
 =?utf-8?B?d3BWNFRkVWFtTXgreUo1SngyMVFJdXE3d2tkZFhvMlhxUTlQODR2dTM3UmY3?=
 =?utf-8?B?ZnFmSnlGVHZaVm9Ob2FpSllBVnVEZmVjVG5PejNVeE5jTk1PNHV3VGdCb1Uz?=
 =?utf-8?B?MUlIUVJhSm0rL0NtMlVUbVd5ZVoxQklSZ1dLdnlmdUhBWHhCUGUrVzlpM3Nm?=
 =?utf-8?B?QkZ4WEdlcFduQ2FDQmZ6ZnA3WTA4OWY2RmNmQUNjV2xFeDF2TXUvajFOenNh?=
 =?utf-8?B?TGYvdFd2YUorZUZ5UTNyOHdUbi9sNFNBQ242aWxWdG8xaVhLYWZzckc0amkw?=
 =?utf-8?B?RmV3Y0lqQmtvMDlaL0pnTElFY0dOQVEzV0RNaTYydnZOZVBkY0NXOXJTZHJ5?=
 =?utf-8?B?QnVTTFExc082dkdDMkczMUtPRFJ6YUd1SGhLMk9rT1lSVE5TTzdkRmpSbk5F?=
 =?utf-8?B?Mk1zQzIxRndBZE83cmY0bkhMNCtoYXVnNS9mdXBQdnJ0NysyNXVuRlhDQUhJ?=
 =?utf-8?B?VFUya0NhNGhPcG9ITWk0RHdEUFZ2K1BhemRMOXF3Mm9ubkRGRUxhT2R3TEEx?=
 =?utf-8?B?V0lFbCs5K2pQdGRMbjRETm9GU3A4TWJncnVMc0hOY3NGTHNpQnRVcmNIM0xS?=
 =?utf-8?B?VjRZdEdITWVEWEhYQ1F2ZUcxVmdKbTFjWXlmRlpBamIxUFdFNk96M0ZzZWVl?=
 =?utf-8?B?SWttTUl4QWFJdHpkZ09UOXJYMjNSYktzU0FFRmRXUlBrenE5VjVFTThtQ1gz?=
 =?utf-8?Q?8muIwbsGUUL8UO0ajcZzmBo1LSwfifEjrzVD30Ln+SK6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee1e836-dcfa-44a9-89d0-08ddf71ec4cb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 01:49:28.0960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A84XLnvUVKboFa4lMxb2+BD3ziM/QETkuPICMJhokwvzrgDuOIr59JFDKJhkXj9Q0hBx4Y26r4CBPjK/A7mWdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6625
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

On 9/18/25 22:27, Chris Mason wrote:
> 
> [ apologies for resending this, debugging sendmail ]
> 
> Hi Balbir,
> 
> On Mon,  8 Sep 2025 10:04:34 +1000 Balbir Singh <balbirs@nvidia.com> wrote:
>> Add routines to support allocation of large order zone device folios
>> and helper functions for zone device folios, to check if a folio is
>> device private and helpers for setting zone device data.
>>
>> When large folios are used, the existing page_free() callback in
>> pgmap is called when the folio is freed, this is true for both
>> PAGE_SIZE and higher order pages.
>>
>> Zone device private large folios do not support deferred split and
>> scan like normal THP folios.
> 
> [ ... ]
> 
>> diff --git a/mm/memremap.c b/mm/memremap.c
>> index 46cb1b0b6f72..66f9186b5500 100644
>> --- a/mm/memremap.c
>> +++ b/mm/memremap.c
>> @@ -453,11 +452,15 @@ void free_zone_device_folio(struct folio *folio)
>>  
>>  	switch (pgmap->type) {
>>  	case MEMORY_DEVICE_PRIVATE:
>> +		percpu_ref_put_many(&folio->pgmap->ref, nr);
> 
> Here we're dropping nr refs
> 
>> +		pgmap->ops->page_free(&folio->page);
>> +		folio->page.mapping = NULL;
>> +		break;
>>  	case MEMORY_DEVICE_COHERENT:
>>  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
>>  			break;
>> -		pgmap->ops->page_free(folio_page(folio, 0));
>> -		put_dev_pagemap(pgmap);
>> +		pgmap->ops->page_free(&folio->page);
>> +		percpu_ref_put(&folio->pgmap->ref);
> 
> Here we're dropping one ref?
> 
>>  		break;
>>  
>>  	case MEMORY_DEVICE_GENERIC:
>> @@ -480,14 +483,23 @@ void free_zone_device_folio(struct folio *folio)
>>  	}
>>  }
>>  
>> -void zone_device_page_init(struct page *page)
>> +void zone_device_folio_init(struct folio *folio, unsigned int order)
>>  {
>> +	struct page *page = folio_page(folio, 0);
>> +
>> +	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>> +
>>  	/*
>>  	 * Drivers shouldn't be allocating pages after calling
>>  	 * memunmap_pages().
>>  	 */
>> -	WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
>> -	set_page_count(page, 1);
>> +	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
> 
> Here we always bump by 1 << order
> 
> I hesitate to send this one because I don't know the code at all, but the
> AI review prompts keep flagging this apparent refcount mismatch, and it looks
> real to me.
> 
> Are the differences in refcount handling inside free_zone_device_folio()
> intentional?
> 

Thanks for the review! I've posted a v6, but in general

1. Large folios for supported for device-private pages, hence the nr (from folio_order)
2. The user of the folios specifies the order (for mTHP), a folio gets get created
   with that order
3. What you are seeing with the percpu_ref_put for two different cases
   MEMORY_DEVICE_COHERENT and MEMORY_DEVICE_PRIVATE

The reason I point you to v6, is that the diff is a little bit different there

Balbir
