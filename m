Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59104AC0388
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 06:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A39110E0F4;
	Thu, 22 May 2025 04:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DiIt7P13";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A7D939F9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 03:46:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytDhEKwPUZzsCFUQToQs9uTTE6kKjpyrGfeixCZeiUHgGagwV4u1U5+SNy3L/FfeYEjR0oQNW8dic8RSZjNQAVq7Pd/cAW024o6BNROCumeRYVpSBM3nT58FcjK2j2yAW6UZlHHE+RceKvICdYuvl1s6ZqoFNDCZe7+/P1vI4UrWlKpbto+NOOrd5R+rQEys3cwNFDBrI4peDcJVK+tyVNnuSKvYcDSS0lSr9wyvhWQUpIgaYthofqxBbDXJ39Ukq05bvNiTyU5pbMF1uDviw7EABsTFKxQHi4a8Va2/POF+L9u5f8gWC/COX7gT0SJEg6ViywxZG9uOA0Bq9R6neg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ls0szZOulcGIFeIwKfGaDJaLNfU9MaNvdBwJK/NlVA0=;
 b=D/GIX7eOhbyr1op3K/rDhBNgA1yifvLcUddSs88Uh9+IoRyas2JVig32OXLpanGEJWLQ4iZVKUMYcd9bLZmzF5hMPyVPbnfHjTULO3HkXEvVAejOIcdpl42yhKjd4Y7ODWABsN3LRU8K+pVWhMWv+LGzJtXGvaUS2U2sa43vM0kIvFa8pcg/ITuNVOwfGO+HhWDUS1zE7jrkbf18KC1L+7mfVGIj5Yd1untLjM0n9rz8fEg0tLxLbt0sK3pQyXOvHgAqUeKcrx361ZSwxgjk47XhPA5BtpqkeGfiWWvss82yJ5IUDBbz3n9iCqVj/6zcphS4P7bIw8XrCEq8j9cFlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ls0szZOulcGIFeIwKfGaDJaLNfU9MaNvdBwJK/NlVA0=;
 b=DiIt7P13bA07UgiWdPUqUSHVCXbEn9GDGNsdaVA4FesYeWpwqYQiu+JzIIA+5NF0d6PYIBuV6V8uWDl4QrOWjIACdcv0dUvwDhtEuE0HZM2hZADa8tVwNOoe/ScC4Ctot12a4Li9stO6bvcsks6DcgmDBojoXM4YhTRPxn3Xc9U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by PH7PR12MB9126.namprd12.prod.outlook.com (2603:10b6:510:2f0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 03:46:07 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 03:46:07 +0000
Message-ID: <9dea400f-a57b-43be-a2e4-24a9f51e6ba0@amd.com>
Date: Thu, 22 May 2025 13:45:57 +1000
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
To: Xu Yilun <yilun.xu@linux.intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, pbonzini@redhat.com,
 seanjc@google.com, alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <4b6dc759-86fd-47a7-a206-66b25a0ccc6d@amd.com>
 <c10bf9c2-e073-479d-ad1c-6796c592d333@amd.com>
 <aB3jLmlUKKziwdeG@yilunxu-OptiPlex-7050>
 <aB4tQHmHzHooDeTE@yilunxu-OptiPlex-7050> <20250509184318.GD5657@nvidia.com>
 <aB7Ma84WXATiu5O1@yilunxu-OptiPlex-7050>
 <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
 <20250512140617.GA285583@nvidia.com> <aCRAHRCKP1s0Oi0c@yilunxu-OptiPlex-7050>
 <20250514163339.GD382960@nvidia.com> <aCYQdDrYYZRAgsen@yilunxu-OptiPlex-7050>
Content-Language: en-US
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <aCYQdDrYYZRAgsen@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY5PR01CA0041.ausprd01.prod.outlook.com
 (2603:10c6:10:1f8::16) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|PH7PR12MB9126:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e88cdd5-f7ec-4eff-020e-08dd98e32f06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dTFyL1pGYXVHbzQ3TmFQT2k1U3RPc0VKN2ZBQk04TG1QVTZ4QVE5ZE5WMUUx?=
 =?utf-8?B?ZklEcmFsRnVYam40RkF1bS9sdmIvR0U5MGNxc3pnS2krMjF5OVRiOFJHd3Zi?=
 =?utf-8?B?OHlJUERYOGNmYXVJWXRwai8vMGIyUTlLMkxuQy85Z2ZNKzJBUlhraUtSTDJu?=
 =?utf-8?B?NnVxbkVnZmNyTFJSYlFrNncxUFVOMHpkV1VESzNiUnNISlR5TWxEZG5wb3R5?=
 =?utf-8?B?cUVMU1I1OXJybWt3Z01YL1JsVUY2Y2JhOGltKy9teTI4RFFYUTFGaDRFbnhT?=
 =?utf-8?B?UWg2WFdxdHM5dVAvMks0TkNES2J6U2kvb3VzdHhNeEFCT3d2M1V0bHlzZm5X?=
 =?utf-8?B?TGs4ZHkyTm9Xd214UndSd2ovTGVqR244UTZLVVhXdnU4a1JmMTdiZHpMM3Rx?=
 =?utf-8?B?QW45a3pUUmh2VUpiUkZaOW9GWHBoa2I0aXJUWWV1aVpNaWN0OUdnUGloRG1w?=
 =?utf-8?B?aG5uVlBoMldLd28rWjNUYkRiNjVKcmpPaTV4MERycWQxbDV0bDlURWptY2dk?=
 =?utf-8?B?aWQvNGppR3dLMnYrRXpQbWk0dFFIbERvSUZoTWVYWEdLK3RwSHBhc0xJTjZQ?=
 =?utf-8?B?NVFTQ1RSUFlTa2l1UHJWQ09LRFBDSXVpODRySTY3UVd0KzI0OC9GSDNYVjF2?=
 =?utf-8?B?bDlKU2xYNDNmZGlJbk1GcTJZOGZ3b1loZGVwLy9ibHR4bFVndmprYVpaN3ZZ?=
 =?utf-8?B?WUczOFE2cTBJYWxnUlA1VFpNNEo0N2RWMjNMUFpabWxhTkhrSWdJcTlIZG02?=
 =?utf-8?B?RVhNZk1nd3RQeERiZ3I5aFF1QXAxME81R2hua3FoUkxHbnJvcXlLUXQ0NWt6?=
 =?utf-8?B?cGhITGlmN3BmTjVSYjBabVZkU1NpVGRzdXlHMVhxTU1ZNXJLeFZvd1lnQTBB?=
 =?utf-8?B?SG9McUlRc3JEZGZ3TlZ5OHA4c3gwbDJlOW9LUEF2YyttS1k4UVZFVzF5czg5?=
 =?utf-8?B?RXQwVEtvbkJFMGRDZG1Va2lBL3dqN3RTQ2NaSDc3VU1JZXBIUEZMU2w5WnBQ?=
 =?utf-8?B?Z1c5SFpZRksxTTVxVTNPcUJwYkhnek5tSUlRUmR3bWJFOUlGb2VkVDBrZTQ2?=
 =?utf-8?B?OGZrTytwdjRzVzY0QkpTQ0p2eTk3WmppWTI2K25iOEJDQ2lHTnc3Qk10UkNv?=
 =?utf-8?B?eDNGZE13TUlmOVdxOHpPSVhrbE0zVkNaa0ZTZTFkWkhPL3RYcXlNZHZHM214?=
 =?utf-8?B?aHJwVC9lbUp4bnBjRDFnYTV5cXVKanVrNU5Mejd3STA5NGpQSmlqTFZqbVox?=
 =?utf-8?B?SWE3dlBpSUswcjMyR2NkV3RjZUY2M003TThyVmJsU3hpcSs4eXBDM3BrYjQ1?=
 =?utf-8?B?L2c3VHFLSmlWM1lDVlBSb3N2Yit3STgzRGJEQi9JVCtWNEsvd0lKNmg5OStW?=
 =?utf-8?B?N0VYUVJ3S2pKdDV2QVRiZVFSTGNTODNGL2x2TGFZSzRqNlQ0VkZyWGlHbXRS?=
 =?utf-8?B?NE5OUGU3eUpyQlVVTmkxeWtMTU9rOHo4YVhZWWdHWWtVdFRDazR0MTlWYjRW?=
 =?utf-8?B?ejFOdTBVZlNHbEhBcytEMFNadyt0emJGT28zT1Nnbkxib3dNZnNJUzJ3bUdL?=
 =?utf-8?B?cG1UR1Nib2FlcmlFcUNpZjAyS0poemg4dE01MkNkMmgzZEN4WHdsbUtBWmww?=
 =?utf-8?B?RC91a1E2VGpITm9jc2xIQzNaaGZjZVBkSXk1VmcwMjR5T2ZzV3ErR0hmTDJL?=
 =?utf-8?B?Qzd1dmhzOHFpRVF1Q1h5NGJ3bUpSM3hIUHgxVU9hcEFOcDlhZXFiMjB4bkxQ?=
 =?utf-8?B?UC9sZ2VLWnZMRUkxMzA3bXZid3R1ZDdXWUN6SlcxQ1dwK3puc3hkNW1VbCs1?=
 =?utf-8?B?TnNIZHBrOTRSZDl1MFhvbnlkNDZmVzFTTkhLVXhtZ2M3K2JlTU5rcXp2Ky9B?=
 =?utf-8?Q?Xw3/U/WLDX56d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB9194.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzRSOWZIWVpZRHEyVXR5VEFWQmFoUGdKQitlNWd4T0FrV2R6bFFqb2JTRzJ5?=
 =?utf-8?B?cWowbFR3UGc3WEh4RWVhOHpmVVExbEJJR1VsRTl1Q2xwajlXSW8vTjZIbXdC?=
 =?utf-8?B?bTFmV01uYm9xQTY4Q1FGRHQzTER0aSsyZnNpVWdPeDczSDBGdHMzR0VLZlFr?=
 =?utf-8?B?d3VXME9ZRWQ2bTBPWU5wNzdadXBxSDg3NWlYY3R3RVJVUExZa2NQSFAzRk9I?=
 =?utf-8?B?VENPWVVLbmJsL2gzUDJHcTVnV0NsZWloNGFsTTZoY081MXFSRGVyVjhDUVNP?=
 =?utf-8?B?NGNjSHh5VjdDWGFrbjFMZmc1OC9KTzJxV1JBdmxIbm9NOXJBOUhLYXh5OGFk?=
 =?utf-8?B?d0pkT1ROSVZKSDlTdzF6SEVDSDk3MzNvaHRaUVVQbE5NenBPSmtWSXcvWjRJ?=
 =?utf-8?B?cnhDckQzV1p0SGY0bmtKMHhvL3ZlaU01Q29PbnFhYm1DWU40d1kwaXR2ZCsr?=
 =?utf-8?B?RUFPSy9zVkhNT1phS1BlVlRhOTlwWHNKS2ZIL3VTSm1DM1VuUEVtNGJiemVC?=
 =?utf-8?B?TVhRQzZCR1JVZTZ4eDJFTW8wb2RsWndpTzMzY1JoWmRiWEIrbzlKL09jYTBq?=
 =?utf-8?B?dmpPTnJPbFp2T2RKb0d1dzFVM0VTR1FOMWZoalR3VG1iUTZsMXc0ZXd0Vkgw?=
 =?utf-8?B?bDh2bVNqRGYzS2k1RWF0NGhHT1YzZDV3Sy9UY2QxRnV3MnpnMDIxL3hna256?=
 =?utf-8?B?YUVHNWxPUUt6eGtMV1J4cEd4ekJXOFpRVjRuL01SR0Vpb25UREJ5WUNmR0tY?=
 =?utf-8?B?SGpFQy84RkU3S0R6V0h4N21LQWVMcVJaSGxmUXR4ZDFONUZ2b3ZIcWhNRkVi?=
 =?utf-8?B?TmhFM2JLb2JJRjc5TVhIQkpKd0NVVmtMUXExSzdud0NtM1RtZlozenQ1Vnd1?=
 =?utf-8?B?R25WTlpQaWI2NWt6Vmd3QllhYzFxaEFaaGVwWFRnU01Kcy9SaVREbzQrNXA1?=
 =?utf-8?B?akhCNDdFSWZjTk9aR1dnclFJVHlMZ0h0dVNvS1NuUUpCM2p6dWhKVkQxYk1P?=
 =?utf-8?B?bFBnS0hmdTZJeTZiU0xETFJOblA1WHNiLzhQK2JoanJsRkFFWVhwOEUxbFZB?=
 =?utf-8?B?Z3oxalBNL2t3RDh4NkoxTGU0MTJpYkpDRVRKV2ErdmpLZ3I2WXpOYnNUT0tv?=
 =?utf-8?B?UTlaUlFsYWZkRzNic1ZWblhCV3JaVjhzMWRNVWs3TURCVXZ3MzJQTGpESGp2?=
 =?utf-8?B?azZSa0FJSEtSRGt6djkrSEl4OWJEWng2SUtoT3dLWDFKY2lmMkUzc0NQL2Nx?=
 =?utf-8?B?WTc0SEYwYzViSHA4QVZtdlpiN0tnWWYvOUdqUURiQmJybnZBOHZUNHVsWTVX?=
 =?utf-8?B?MjdKTytLUmo4bzFheUtrS1JIQmVNT3NQUWxBQzROMEtWV1VWODBpWVpRMXkx?=
 =?utf-8?B?Si8wdldzRmJJTFdQTWxSS1JUaWhmbEI2NEdSSHdNMG91aE51eWR6UU45eG54?=
 =?utf-8?B?bDh1eXBoNzdaT05ERTR2a0ZSRmNOZE96aG9mV3pqUTM3bld2RzcyQUMwZjBD?=
 =?utf-8?B?Z2UvVGlkNXc5MzJ0WUoxYXVCQi9JbWtjR1ZCelkrblZnM1pWbjFKR2Y0aisz?=
 =?utf-8?B?STRBalo0eFhxMTdXQlY1MnczZkVwMHNBc0pYVU12bjVWS0gyaWRGNXlxWVVl?=
 =?utf-8?B?NjB6Y2RmcUNxcGkrc1JJazFqMnZNWm9kd0J4djlZYTFobGtBdzNBYzVnZnN6?=
 =?utf-8?B?bkJtckoxdkppMkxTU0JuSlZjY043eThsd25ZdGg1eWNKOVBEN0RNcnpqWWFj?=
 =?utf-8?B?UVpodGh1c0RjYkV5NGZ6eTh4cGZJbitiaU9ST01ISURTV05XUzFTcXNpaXNa?=
 =?utf-8?B?SFNNVFVnaS9uOFcwVEVLdEhPaHRodjZIVGFqYjJkajJvM24zc1hNSE1md3kx?=
 =?utf-8?B?REcrTzc3Q2ZucTNxVUUvUkxPZ05ZR3Biakl1aTZwSVFQQ3hYY2l2M2tud0th?=
 =?utf-8?B?RnhkS3E0OGJHOWYzMW5lWDFsS2k3WnJyRVpxREFsdGszUUIyRWl3NzZCb0t1?=
 =?utf-8?B?WkJOamhvcGpHczNleFRycktLS1NNdjM3QktSL3gvdDlDNFNkZ3hYU0VUempM?=
 =?utf-8?B?TGtFTm9UUjFmMlFXcER1MFVYUWgzbGJPNEZIbmRUYXNJSmdrUTAvUEhlODNi?=
 =?utf-8?Q?1gLQgpsIiNixBiU6CsSFKW7l6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e88cdd5-f7ec-4eff-020e-08dd98e32f06
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 03:46:07.3962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Zl7PGXhqqzRVpS2suJpWEpJYMZW2GV6whMGqUXZDaQj8CQovzLEkAGWHeMq+JV+IKfQknG5r04D2hAS8c8u5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9126
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



On 16/5/25 02:04, Xu Yilun wrote:
> On Wed, May 14, 2025 at 01:33:39PM -0300, Jason Gunthorpe wrote:
>> On Wed, May 14, 2025 at 03:02:53PM +0800, Xu Yilun wrote:
>>>> We have an awkward fit for what CCA people are doing to the various
>>>> Linux APIs. Looking somewhat maximally across all the arches a "bind"
>>>> for a CC vPCI device creation operation does:
>>>>
>>>>   - Setup the CPU page tables for the VM to have access to the MMIO
>>>
>>> This is guest side thing, is it? Anything host need to opt-in?
>>
>> CPU hypervisor page tables.
>>
>>>>   - Revoke hypervisor access to the MMIO
>>>
>>> VFIO could choose never to mmap MMIO, so in this case nothing to do?
>>
>> Yes, if you do it that way.
>>   
>>>>   - Setup the vIOMMU to understand the vPCI device
>>>>   - Take over control of some of the IOVA translation, at least for T=1,
>>>>     and route to the the vIOMMU
>>>>   - Register the vPCI with any attestation functions the VM might use
>>>>   - Do some DOE stuff to manage/validate TDSIP/etc
>>>
>>> Intel TDX Connect has a extra requirement for "unbind":
>>>
>>> - Revoke KVM page table (S-EPT) for the MMIO only after TDISP
>>>    CONFIG_UNLOCK
>>
>> Maybe you could express this as the S-EPT always has the MMIO mapped
>> into it as long as the vPCI function is installed to the VM?
> 
> Yeah.
> 
>> Is KVM responsible for the S-EPT?
> 
> Yes.
> 
>>
>>> Another thing is, seems your term "bind" includes all steps for
>>> shared -> private conversion.
>>
>> Well, I was talking about vPCI creation. I understand that during the
>> vPCI lifecycle the VM will do "bind" "unbind" which are more or less
>> switching the device into a T=1 mode. Though I understood on some
> 
> I want to introduce some terms about CC vPCI.
> 
> 1. "Bind", guest requests host do host side CC setup & put device in
> CONFIG_LOCKED state, waiting for attestation. Any further change which
> has secuity concern breaks "bind", e.g. reset, touch MMIO, physical MSE,
> BAR addr...
> 
> 2. "Attest", after "bind", guest verifies device evidences (cert,
> measurement...).
> 
> 3. "Accept", after successful attestation, guest do guest side CC setup &
> switch the device into T=1 mode (TDISP RUN state)

(implementation note)
AMD SEV moves TDI to RUN at "Attest" as a guest still can avoid encrypted MMIO access and the PSP keeps IOMMU blocked until the guest enables it.

> 4. "Unbind", guest requests host put device in CONFIG_UNLOCK state +
> remove all CC setup.
> 
>> arches this was mostly invisible to the hypervisor?
> 
> Attest & Accept can be invisible to hypervisor, or host just help pass
> data blobs between guest, firmware & device.

No, they cannot.

> Bind cannot be host agnostic, host should be aware not to touch device
> after Bind.

Bind actually connects a TDI to a guest, the guest could not possibly do that alone as it does not know/have access to the physical PCI function#0 to do the DOE/SecSPDM messaging, and neither does the PSP.

The non-touching clause (or, more precisely "selectively touching") is about "Attest" and "Accept" when the TDI is in the CONFIG_LOCKED or RUN state. Up to the point when we rather want to block the config space and MSIX BAR access after the TDI is CONFIG_LOCKED/RUN to prevent TDI from going to the ERROR state.


>>
>>> But in my mind, "bind" only includes
>>> putting device in TDISP LOCK state & corresponding host setups required
>>> by firmware. I.e "bind" means host lockes down the CC setup, waiting for
>>> guest attestation.
>>
>> So we will need to have some other API for this that modifies the vPCI
>> object.
> 
> IIUC, in Alexey's patch ioctl(iommufd, IOMMU_VDEVICE_TSM_BIND) does the
> "Bind" thing in host.


I am still not sure what "vPCI" means exactly, a passed through PCI device? Or a piece of vIOMMU handling such device?


>> It might be reasonable to have VFIO reach into iommufd to do that on
>> an already existing iommufd VDEVICE object. A little weird, but we
>> could probably make that work.
> 
> Mm, Are you proposing an uAPI in VFIO, and a kAPI from VFIO -> IOMMUFD like:
> 
>   ioctl(vfio_fd, VFIO_DEVICE_ATTACH_VDEV, vdev_id)
>   -> iommufd_device_attach_vdev()
>      -> tsm_tdi_bind()
> 
>>
>> But you have some weird ordering issues here if the S-EPT has to have
>> the VFIO MMIO then you have to have a close() destruction order that
> 
> Yeah, by holding kvm reference.
> 
>> sees VFIO remove the S-EPT and release the KVM, then have iommufd
>> destroy the VDEVICE object.
> 
> Regarding VM destroy, TDX Connect has more enforcement, VM could only be
> destroyed after all assigned CC vPCI devices are destroyed.

Can be done by making IOMMUFD/vdevice holding the kvm pointer to ensure tsm_tdi_unbind() is not called before the guest disappeared from the firmware. I seem to be just lucky with the current order of things being destroyed, hmm.


> Nowadays, VFIO already holds KVM reference, so we need
> 
> close(vfio_fd)
> -> iommufd_device_detach_vdev()
>     -> tsm_tdi_unbind()
>        -> tdi stop
>        -> callback to VFIO, dmabuf_move_notify(revoke)
>           -> KVM unmap MMIO
>        -> tdi metadata remove
> -> kvm_put_kvm()
>     -> kvm_destroy_vm()
> 
> 
>>
>>>> It doesn't mean that iommufd is suddenly doing PCI stuff, no, that
>>>> stays in VFIO.
>>>
>>> I'm not sure if Alexey's patch [1] illustates your idea. It calls
>>> tsm_tdi_bind() which directly does device stuff, and impacts MMIO.
>>> VFIO doesn't know about this.

VFIO knows about this enough as we asked it to share MMIO via dmabuf's fd and not via mmap(), otherwise it is the same MMIO, exactly where it was, BARs do not change.

>>>
>>> I have to interpret this as VFIO firstly hand over device CC features
>>> and MMIO resources to IOMMUFD, so VFIO never cares about them.
>>>
>>> [1] https://lore.kernel.org/all/20250218111017.491719-15-aik@amd.com/
>>
>> There is also the PCI layer involved here and maybe PCI should be
>> participating in managing some of this. Like it makes a bit of sense
>> that PCI would block the FLR on platforms that require this?
> 
> FLR to a bound device is absolutely fine, just break the CC state.
> Sometimes it is exactly what host need to stop CC immediately.
> The problem is in VFIO's pre-FLR handling so we need to patch VFIO, not
> PCI core.

What is a problem here exactly?
FLR by the host which equals to any other PCI error? The guest may or may not be able to handle it, afaik it does not handle any errors now, QEMU just stops the guest.
Or FLR by the guest? Then it knows it needs to do the dance with attest/accept, again.

Thanks,

> 
> Thanks,
> Yilun
> 
>>
>> Jason

-- 
Alexey

