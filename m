Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D43BEB2F534
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 12:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5208E10E919;
	Thu, 21 Aug 2025 10:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hEoGC+b6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2071.outbound.protection.outlook.com [40.107.96.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B10B10E911
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 10:24:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cyT5t3yfDOEJD6fofq10FnEuui/V7G22qyTbPVjCjVYkrOzym17hl/2WMRAmStNA6pEIPnVl6jbHyoJlSGKVwi/ZxliqAq04PxwSUFjjj8dDuKm8D6xbvb0xO0kDm74xgtORfl/smxl+KKrQm3uwDCkl5rvYssa4yXjDWum9c1rwt9rk6KwewfOZ9B941wRVZ+1IERPwTqBd8lyEx2VLJ/NwLPctYkTRz1Yx9Wcs8+5wlfw0xO7cI2g4k0kcpKSymv/RsW6nf4g9Tn8nbiIIGDdSp6uhKgrsPQTjnqATX9yvglFrCeU2z2G8YXvJIbqSvZcla3xza0gev74tXxAICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIf7CbBbltScwi+P54axotgCldu+ulOSNxURut1tfzQ=;
 b=JOl03gEnt1PVGn3vNXG7W9AAe+JZjSyYFwlXM8bkVPH/t/O2uiNiubjfF8ZC3elI4+fDC0FmYPTbc2HxsQyVDNqywbu5p+wbnJQiTca9wihg9r1u7MwxsPFKrQr0HQoTX6/x7P8zYCJOX++qYV5ieFBViCSqT8KM3YMZ94Igt0VjapXYev6S4uffJg3/Pnc9f/mfRKTgZJikSlnud2pf15mde+BI5qXLzxTIYleTBLtCSJXfhgxEmWmHFjlfNyEJv1965J4JZEuqZcO1XXEEivqpZKRCw0kcT0xnvaUy79uSwG+bjdTOgBpfiBnluQyUIYWsBLG/2mXQCB05hqCvcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIf7CbBbltScwi+P54axotgCldu+ulOSNxURut1tfzQ=;
 b=hEoGC+b6oWfo+DzjxeLFmkafGKUotm+pT5Mzqaztz2BMXB8Tnzs0aofkInP3u8ZcQnMPoVOOZPMufRQJPj7zpXjxtPeAyzsD6N4uuK2YkrVoLkpiup5nD7y+8bVtvrN1SP2ZXkUdNZvRcJ3+pqo1/jQradveGBQRltIr8pXl+0asfuUeViNAd3YYskAwatyY+vziwLaZtdHqqUTQeUQv32nR0EdClHmTWs4LDp0ul8WFxC1WXyatFn8oPcXwnrR/ymwWp4dYc1lYvVlf8Py3EoU0jF6zjAgdQm1nzaENKDIDNhQXHHOdNsm91s8YJaRH4IsNT8X3KxhbED/Gzc3W7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by PH0PR12MB8128.namprd12.prod.outlook.com (2603:10b6:510:294::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.16; Thu, 21 Aug
 2025 10:24:10 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%2]) with mapi id 15.20.9031.014; Thu, 21 Aug 2025
 10:24:10 +0000
Message-ID: <e43b3eff-6d9e-4e6e-a0a2-9537e669aa82@nvidia.com>
Date: Thu, 21 Aug 2025 20:24:00 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 03/11] mm/migrate_device: THP migration of zone device pages
To: Matthew Brost <matthew.brost@intel.com>
Cc: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
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
 Francois Dugast <francois.dugast@intel.com>
References: <20250812024036.690064-1-balbirs@nvidia.com>
 <20250812024036.690064-4-balbirs@nvidia.com>
 <81ca37d5-b1ff-46de-8dcc-b222af350c77@redhat.com>
 <9207451b-ebd1-46d5-b277-2adf3028f361@nvidia.com>
 <23a3e9b9-ad35-4469-884d-279aac0868de@redhat.com>
 <a8732499-161b-47f3-a936-580a43c6f323@nvidia.com>
 <aJ55c8yrcAN6upp9@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <aJ55c8yrcAN6upp9@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:a03:338::14) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|PH0PR12MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d7276a3-5176-4827-9375-08dde09cddfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEtkd3lnUXcrend6Zm83UzJDZmRTY0w4RURNZmVmQy9uNkI3RlJrMDlGUC9V?=
 =?utf-8?B?angraTcwRTNvQWUrRFd3RjRjeC9zQzVCR1RLUGZKL3UzeVJUQjRFNDVaZ0di?=
 =?utf-8?B?VCtlREpKMWFsNUxYSSs2NHlzZFEvd0k2Q0dXTmVZRThSd2NJQ2RxVWp5Q0NK?=
 =?utf-8?B?R1ZUQlFDT2s2YWQ1czVvL1ovd3dBWUlnQ1N0bmhEVW9LUGRGRmNacStnWWFU?=
 =?utf-8?B?QXp4YVlrY2VvZUhTOCt1TlcxYVM1QVhEQnBCeHN0ZnNRQzdoVERkN2h6TmVo?=
 =?utf-8?B?TDVMRk8rL0s2WlZaY3psUnZtL09NK09DdmkxVjlOZmUyMER0ZjBHRHdEMEFi?=
 =?utf-8?B?MjB6MjZPOHlvTlVxanl4MFVCblcvRjJjRVFNbUpwRHBaV1FlSGFmTzBEaEp5?=
 =?utf-8?B?b1ZTK1RhaHNhYVpZb0RtTzBkUlE2QzdZWXlORWpXY1lCOW15bFFXOTVYeEY0?=
 =?utf-8?B?cDVncll2Z2lObU81N3hmaWEvemtMSjgxTEVCM1ZOVnc2ZDFRYi92S1FhMHkz?=
 =?utf-8?B?VytaQ1JGNnVxRlhEWmJaYVlIWDNaWEorWkRvK0NlQWlLVHN3U2Ftem5yN1Ux?=
 =?utf-8?B?QVZKME93cFBXdy9WZFBKck9nalpTRDgyRXhTMDNQT1AyeWpFK05jQjRaU3Ux?=
 =?utf-8?B?WDlneFROQW9GVmhkY3ZRV0F5SGFtcVE1dXVWWjErQmdOUVVBbFZ4NHRoZWxv?=
 =?utf-8?B?ZE5TUjNFL05TN3o2OVN5WW1aMmZGd2VWV2VCUVZYb3NUTWpaQzAzNmROVThF?=
 =?utf-8?B?TTRLWGdDLzNBZjlUT2RTSnc2bTJ4ZUNPSFp1anljd2ZkTGsrcFlad3FhWFpM?=
 =?utf-8?B?em91TGYwd1ZVUEs5UnhzZ1hORmNOZVRzUjlBejBud0RGZlVvS3MzVHFnTys0?=
 =?utf-8?B?dGlxSVltSmhKRG5WaDAxL3AveXlXNTdFOUZVeUJqUi9TcXcvUlQ2dmFSQlBR?=
 =?utf-8?B?QVBsRHZBb01oY0o3UkJnQzlaTFJjNEtCWFcrL3hYSVN5Y3JmTnlVSS81WXUv?=
 =?utf-8?B?MXg4elBSK3RFQkdBaFlFY1dkWHR6VDFVR3k0N21kYThISzk1Z0xtVGFBU0NS?=
 =?utf-8?B?bXQ0YWNhVnhodUtZSllEK3NPYk9sOVczZmNiL3lGRWkxWmtqaHpUb2NEVUo0?=
 =?utf-8?B?TUJVRXNyKzk2WENDV2JEUGdaeXRTcTRUekpvTGpMZDZwa1RMMFk4aWpLbWtT?=
 =?utf-8?B?NE1hQkRDakQ5TDNZdUNZY1RsNHRTdGRta3hBYzlhSUtQMXdUYUlEVlkxMkEw?=
 =?utf-8?B?azk2bTM5TVVjcm1LMGRvbzN0YW9uRFljTzRPdVpXb21RL0ZHUDJOalJCTjRU?=
 =?utf-8?B?RHptN3pCOFlVN0RIM2t5V3JWVGlsV0YyUGlQWTBkWmx0TDhSc08wdE5VZ2tF?=
 =?utf-8?B?Q0phZFdIRjEwZ1JhUktzaGQrRmVUN3VvTWdMd2xMQVMzTStWdVcvVmh6MFFQ?=
 =?utf-8?B?TnRUaUtNZmN6RERqcmVMdVUrY2lDQ0p3VGdUM2RKVFVDaXlsMkZWZVZoaDJ2?=
 =?utf-8?B?RS84eHlRajdmZHZiSXZXOEdEVEU4ZVpJdTV3MlFJWER6UWZGS0FHTTB6cDNJ?=
 =?utf-8?B?SEFUSk1UV0tlRWd5MDA0M05GeWlVM2lSaXUzajd5TkpucG5SclJHQmNNNzZy?=
 =?utf-8?B?NTdpS3N1T2dwN2xwWFJNT2dnNW0rTWJYb0VqcCtQTnZwczVUWTFpRzdGMk5j?=
 =?utf-8?B?ODRpSXkxcnRLTGtxQmEvckZ5bWFrOVVoY2ZqM1hXUFBpZ25VV2gvMjcwWHFq?=
 =?utf-8?B?clFsMzBVQ0xwSTVVMDV4VXUwVzdBdHhnMjhMSG5PUFp5RHZ1Ump2ZVJLdGZx?=
 =?utf-8?B?UlZUUlJoeDEzSEZ5cTlDVHA2QXcybzBETVN1WlBmWmVraDRWY1hUcnNQbEJC?=
 =?utf-8?B?WVcvbXRZWnRuZEtaR3AyeGJJN0w1cDNaL0Jzdi9JeXkwRTQycGJqZ0JrN1N4?=
 =?utf-8?Q?WIwZIYhauyE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB7272.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTBjbzNmWEZOTkJITVRlWGcvNTdzSnFQS2lIUERiYUNmZ21pMEVvemZOamZt?=
 =?utf-8?B?U3N2YVRnWVN4SnQyeVZ1ZzZKWlFCb2FiSE9SQ1FUOGRVR0kvWDJNMmp2Rm81?=
 =?utf-8?B?Wmc3cHlONTBoN1pVR3FwWHo2R0dSbGhTZmNmY1BmdDU0aGtpSUxWVkJnc2Vt?=
 =?utf-8?B?RzhmUUlYcFdxcERubm5aN1p0WlJtUnliQ0hnL1BMRnVLRmJiUVU0bXpscUky?=
 =?utf-8?B?R3V5TjNINHlXWTNHN0JmS2Q2K0toRmYzVEljdC80bm1VVjRYeDFzdHdpVFJa?=
 =?utf-8?B?UmtjVWxjSGNDL1ZkdFdPc0lCSGF2ZDFlM2hRbVVzL1pIU1NzaDdNZHBSZGdC?=
 =?utf-8?B?cHJmTVlGbGFqVThxL3IzOUcwRDVRM3ptVzVsTElGSy9LRzBOWjNiOFdlYjA2?=
 =?utf-8?B?WERUL21ubWxiNkZGQTNTajFMY3BPSEJ5MWR3S0kxMDlGY1dWaWVOK0RicVBq?=
 =?utf-8?B?dzViRU5aOFUrVDJkN1gveTNkak9ySktJVjRhUW9tcVNmTXEyVDUxRFFDNUI0?=
 =?utf-8?B?MDVUcmVHQm9NYnlDbGpIM3JsK2dKbFRxWUJmMjNJa0VTNTBIUHZvcms1cHhS?=
 =?utf-8?B?SW1BeDRvelB1Y1hEendtUHV4S3E3b3kvSkJLSXRvS3pTekpWVGl0bEx1N3RT?=
 =?utf-8?B?a0ZRd09VK3FvQmxNUXlpTFdXeC9BcXFSRmprQThxWkRHNlN6L0xFbzUzVmlM?=
 =?utf-8?B?VTVWV0dEaExVenlZcU1GUkRRLzFyTU9mSUc0STJpelhmRDA3K3h4NTZ4UlpH?=
 =?utf-8?B?M0dYcXVJc0RqRnpEMER5cS9xbVRyRXlHcE5WUFVHUDdvb0Q5V0dZUTBoK2ZI?=
 =?utf-8?B?OFQ4V2hOamh0QldFdENUT3dkVm5ENmR6bmVXa1FLUXRWbFUxelE5UUliYmFh?=
 =?utf-8?B?YzZVSHFPVDFoQ0Q4VjJVM3VoRFN2N1VSZU1FWk0yY0o1NHBLVjhzU3FZTnV0?=
 =?utf-8?B?cW9YVHNqZkNUUVFORzFabkVWaVUvNWFHdkJNUS9DU3A5TnRUV2dqNk1vZmJI?=
 =?utf-8?B?N3lIZjEzd3d3MzR0cEg4U0JNYU5qcFBXMWNOazcrSW5xUFFydWxacGtmTVIy?=
 =?utf-8?B?RElnT3JrWjVRM0ZhRG91d0xpV1VSMVVlYlNuZEtHYi94NFB2bWNLQS8xVGh4?=
 =?utf-8?B?M1pudzkxQk1FQ2xkZ3ZmemRKYnVzYytDRnNhc2xCRXR3WVRsUzdENFluSWRi?=
 =?utf-8?B?WVVVOUhneTZENjlacExpeGJUcWxrRGVIYkhWWTRDcCtNalNZb1hRaEFXcmRY?=
 =?utf-8?B?bU03MXN4bGREd3lkVHFLUTFwZ3AxdkpyYThaWU9CQ2VhYVRXV3Q2cGkyUENP?=
 =?utf-8?B?RVd3SzlBSk5KeGVuNlRuZXNvK0lLZ0sxZHl1M0xIYSsyekJnK2hqRnJKQlpC?=
 =?utf-8?B?UUE0VUkvM1h2YTN5TFl0L21ncHhPdXBLRWFkaTMzb0RqL1BQbGVNSk1BNERN?=
 =?utf-8?B?cVg1TmlaSkRtb25TQml4d1Fhb09pZ2VZcjQ5MGZZNlpmSXNCcVBsMTJJWmpC?=
 =?utf-8?B?bHdVUkp5eGxScVdXdzFNYlg2djdTaE42SWV4WVE3VUlTZERYYUlGbHBVbFJP?=
 =?utf-8?B?ZUlTa096SzNMUklwcUhEUC9Fa254RFNjTWZWVHppc1lWWU9aSzlTUTJHWXN3?=
 =?utf-8?B?R0l1Q1A1ek5VOUpqSHc2a3g1NzI2NDJ1S3ZsMFNsbVRZeVdLVnhaOUNLUTZE?=
 =?utf-8?B?bjBsUFhNMFBOM3pMc05ncmNLUmcwR0c2azltNVNrekdtV25tWUxWRzA4NjVz?=
 =?utf-8?B?N01ZWmhYNkdNLzBlbGQ1azlTaDVNQWFmRWR3VXhtRkdZU2Q3bldGN0hVR1J2?=
 =?utf-8?B?dC9kRW0zdG90VExzaWFYNTFnV0xadzNxeURGMEQ1UTNkVENkTUhGdzdlNWpy?=
 =?utf-8?B?dFBKMWNJZTNLY2ErdWtCaHAvbkJMTFN2dncxWENBVi96M1d3RXdnMCsvT0VT?=
 =?utf-8?B?Vk1oSVdWSktSNU8wZXZUSUl2NUx1K2VUNWFUQTYvMDF4TFQxNFN2V3EyM3dR?=
 =?utf-8?B?aEN5Z21mc0YyN2lZenU3ZUdXUkdwNHhFVEtVb2MraTFqbjZRN1lZRmU2alJJ?=
 =?utf-8?B?TEhxcW5KQ3R6M2VGNE94cXBveERMUkZWMnBOcHlPNFBIZnZsaHoyQTBuWjls?=
 =?utf-8?Q?PCQix/ImvrUZKlRPQ88CBxgjU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7276a3-5176-4827-9375-08dde09cddfb
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 10:24:10.1994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fGJ5Bi02u9tq7XXVwhYpkygnTW08nGUQZu5E4PJykhey4YxR7aV5xFx7vGkFgR5zqZQjSWawL2doc/vvTNqhHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8128
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

On 8/15/25 10:04, Matthew Brost wrote:
> On Fri, Aug 15, 2025 at 08:51:21AM +1000, Balbir Singh wrote:
>> On 8/13/25 10:07, Mika Penttilä wrote:
>>>
>>> On 8/13/25 02:36, Balbir Singh wrote:
>>>
>>>> On 8/12/25 15:35, Mika Penttilä wrote:
>>>>> Hi,
>>>>>
>>>>> On 8/12/25 05:40, Balbir Singh wrote:
...

>> I've not run into this with my testing, let me try with more mTHP sizes enabled. I'll wait on Matthew
>> to post his test case or any results, issues seen
>>
> 
> I’ve hit this. In the code I shared privately, I split THPs in the
> page-collection path. You omitted that in v2 and v3; I believe you’ll
> need those changes. The code I'm referring to had the below comment.
> 
>  416         /*
>  417          * XXX: No clean way to support higher-order folios that don't match PMD
>  418          * boundaries for now — split them instead. Once mTHP support lands, add
>  419          * proper support for this case.
>  420          *
>  421          * The test, which exposed this as problematic, remapped (memremap) a
>  422          * large folio to an unaligned address, resulting in the folio being
>  423          * found in the middle of the PTEs. The requested number of pages was
>  424          * less than the folio size. Likely to be handled gracefully by upper
>  425          * layers eventually, but not yet.
>  426          */
> 
> I triggered it by doing some odd mremap operations, which caused the CPU
> page-fault handler to spin indefinitely iirc. In that case, a large device
> folio had been moved into the middle of a PMD.
> 
> Upstream could see the same problem if the device fault handler enforces
> a must-migrate-to-device policy and mremap moves a large CPU folio into
> the middle of a PMD.
> 
> I’m in the middle of other work; when I circle back, I’ll try to create
> a selftest to reproduce this. My current test is a fairly convoluted IGT
> with a bunch of threads doing remap nonsense, but I’ll try to distill it
> into a concise selftest.
> 

I ran into this while doing some testing as well, I fixed it in a manner similar
to split_folio() for partial unmaps. I will consolidate the folio splits into
a single helper and post it with v4.


Balbir Singh
