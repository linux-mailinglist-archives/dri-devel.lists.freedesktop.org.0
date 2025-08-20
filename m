Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC000B2DA2B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 12:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EB110E6ED;
	Wed, 20 Aug 2025 10:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="h6tCJ529";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A189710E6EB;
 Wed, 20 Aug 2025 10:37:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwlm1r4jUijJCpgkgFfq8IlVg7nzIwPw0EFjwf1f8lzOuL8kxuuSgmjfeaZO1sck3h7HtnwfShUC7965pKL0xj48iS4NcJ6B+rYOtm2EMUPfkEixkVxqvy50OxkqE10JGOy3kw507Pxb+dnhgN2sNfLYkpKpSsCa8fBd9dF6zTry/EX91g1XatcWrx9iQ/ozGBIL25Ox2CoTMBQaNGku34ADvuUDskYe49o50YvmoCz4PkOXptrPAOBcyE7Oy1mK2XXDlFMX8sU1QlaDQ6ddlCo6hyQEB1TmfzADfX2+sdzSMOs7u/z5e8AO1VsN5rmuqcfBAGJZQXFcNtuuEGpgtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFlnS+8cUgbykI5t1lNAEWfLATszwj294ghzmkHXClY=;
 b=IuhwP4A9omuugJ6IZb85Zsl7XjkZOc08+Q47HZgrTe9HoPUPlqWtTQLRYPfpTF16sscHE89mpMo9oyEMXJDdKGDQFp/Cdn6eExIxbbRQ/+Z0stNw+H4y3q0xmugY8JDhL8Kmt7BfPxyydStHckBZq+gNvY18IGA7yXaJuJOK3KtwhXxiqZ7dk0XMBtBDaDBXhPe/39dJiGTLp3XRMmKiYL5z8k3S0gUrYYWYR4HUdc+arwxO4B1JDplB4xRr/Vr7DIpJeUxNX1dA9MqWXnzaHzuaAmUu+emSs0cVHyv5JHhh42fQBmy8bnQDwuDydTU87gq1HQ8Nch6nCptq550lmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFlnS+8cUgbykI5t1lNAEWfLATszwj294ghzmkHXClY=;
 b=h6tCJ529/kkBafojz7+bFnpmVGhtjEpBoKNcqtVrV/9QtVx3mTumaNFtp67DnmaaP0qAnFRk0OYuYWFmstSmW/jID1J372Hcq6aFZublB6jmeLCGbEx9w45e2m6MYR6h4vfUFsNrwjwANHrkdEPZK9wUucP5gQsmeCP3W8fuTls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by IA0PR12MB7724.namprd12.prod.outlook.com (2603:10b6:208:430::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 20 Aug
 2025 10:37:24 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%6]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 10:37:23 +0000
Message-ID: <dab697ca-dff7-43c0-b393-e3141639ee61@amd.com>
Date: Wed, 20 Aug 2025 16:07:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/buddy: Optimize free block management with RB
 tree
To: Matthew Auld <matthew.auld@intel.com>, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com
References: <20250724104640.2319-1-Arunpravin.PaneerSelvam@amd.com>
 <868ec7ee-442c-4f78-84a8-0c1f966ecc60@intel.com>
 <0af2a7d9-f5c5-4d82-a631-1c2924a5a35a@amd.com>
 <5961da7c-19a1-46df-862c-dc8ad3133763@intel.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <5961da7c-19a1-46df-862c-dc8ad3133763@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0118.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b0::7) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|IA0PR12MB7724:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f75a8cc-90da-4afe-043e-08dddfd58bf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dS92WElsNmlMdFBVK2gyc2w2U1dyTnAxZWFrU3IxMGVTMUhyZUlGRVFobGhm?=
 =?utf-8?B?VjRIMFRuMm9GY3k4ejFPNGR4RktqaHk5cEp3cWtIVmh0aUwvcXVtWmJOZmVK?=
 =?utf-8?B?LzlhdWdxUU5tUng2RzY0V210WjZSRjQzeHRSaXJKV2Q0T0J1TVZxcCtJR1dt?=
 =?utf-8?B?RitjbmVZNUJYUHJIQUlNQXNUcUxzbTZpcXZCM0hGeUVRTVdoNm42VGJZNS80?=
 =?utf-8?B?OG4wSXZRYlZYdTNxUkMrSnNGc0ZiYXpKRTRSbFoydWxPZWRBcXgrTmFubEpJ?=
 =?utf-8?B?alMrSTNMb0JtZUZmS2d2ZXB6NUZTSlBUK0JidEJ1L2hBR3V4SExhdktXY0Zo?=
 =?utf-8?B?RmRHY2JRcDVNVUd0MVprN2N0NzBFcFZLTnBuS3NvUmpVWHpsbnFCRXF6dkdC?=
 =?utf-8?B?RDMzOTA4TGpUdWxIcm9BRUluS21iNitNM0ZSOVhyOXRPY2FkcW1qcjlYSXky?=
 =?utf-8?B?eTVkSHRjWkhkRXMvSkpXZEx6V3RDb1k5a1BRYWJOZExrZ2YxRGNBeVN5bEkx?=
 =?utf-8?B?UDdpS3lIUll6L3FONm9xam5CdXlXNXJMN1VPYmdUcnJ4TE1obFkzYU9wQ0p3?=
 =?utf-8?B?ZlpSWVhNajIvQ2s4dmZwYW8yM3F0U3ExQVBPYml3RFZLZzlOdXJPY1lObTVl?=
 =?utf-8?B?aTIxMm11Rkl6L01JZVNWQnFBMTEzTXlEdjNzeEpnakVMaDgvakFyYmMvbnJX?=
 =?utf-8?B?ZHphT1BwWlArSTZwTCtrZDVkSnh1QWxKeXk3VlZuZHRXSEY4U3FRdlpFQUpw?=
 =?utf-8?B?TDMzYldNMWdQZXlzWHVocGR3ZG9PSGJiU2VTeGRqTnlDY3hTcEljL3VRK3lh?=
 =?utf-8?B?bFducDhBTWkyMHZwRVRqMDNVU1ZEb1p5L2VWNTVEMVRuN3pIRGlqSWZKSFEr?=
 =?utf-8?B?ZkhyRlRhZDEwUHc1SFgwelhCakJkUUhOa1NPUS8vTE9DZlNvM1d6QUZ0dlFk?=
 =?utf-8?B?UFdFbXhKNHJGTWQzWlZpOUpmQjBxamZqS0RqUEgrN1czcUc2dzY5MmtsRFRW?=
 =?utf-8?B?M3QrMFBKR21CY3lNVTNCU0ducTVZM09yRERWeVo4ejVLRDBCdTVIM3h5Sms3?=
 =?utf-8?B?cjVnMWVVNXNqZTg2bzQ0Ymd2N0poQ0pHQ1JTWDNqWFBJaDNMNUxwOWdVaWZs?=
 =?utf-8?B?TWduU25TUktuTUc2MW0ySlR3S1dPTGpLWG9wYjBJWlRoV3E3L0FuVFd3YmlP?=
 =?utf-8?B?MTBhUFBsNldQc2poNVdzLytMZFlMZ3gxOVhQbm9JanFTeFVLRmJaTlNSQ1U0?=
 =?utf-8?B?Ukc2TjBmZnVtRDRDSzNnako2Mlhua3BWamYvcXh4SmZIemVNZUFHTTBSckFN?=
 =?utf-8?B?cnFKTjlGdCtIUy9FUFJXejJ4V1I1Qmo4b1NBS3FWUmhYc1JJUkRPRWN2b1ky?=
 =?utf-8?B?WEZJOHFxM1pROEN2dzdtZk00dEo5c3pRNjhCWU1qY1Jjbk12MEpRYTg2bVAy?=
 =?utf-8?B?SDU0b3JCdkpYZktTbWwzY2VqUk5aS2xiWEJjeUhiVzdSOWw5RHhiUUl5OVlF?=
 =?utf-8?B?S1lWWlhrUHNMYzJRdHVNNUZUcENwVUtUL2RSNHNKODN0UlpVb1BkNUJRbnRo?=
 =?utf-8?B?OTd4NmM4T3FadDZTcWQzQjAyZnFzUGVnOGo3Z08yVTVNMkdLaTlLU0I4cVZC?=
 =?utf-8?B?KzdSZm56MHduekxBa0h5SFdkLzAxMklNazZtR0puYlE3SXFiNEVEOXIveCtD?=
 =?utf-8?B?S0tJMkN0SE8wMDZzQTlsaXFEMTdscUtZVUowcVU3UXYyZ1VyUVhkUW56SURZ?=
 =?utf-8?B?TktFRS9SbTNZWDlQaU5ocVRkSlVSb3d2cU9aMGZBZU5BRFpoejgrdnA3TXVX?=
 =?utf-8?B?cVJJcWxGY3kvcExud3Fqa1dxenNPbStIeGpoTmwwMUQ2QWN3elpuVFhWa3My?=
 =?utf-8?B?U1NIN0ZwYUhJa0hhZGNOYjhrbHg2SHdnRFR5SmFzTGM1YWQ2QmYydmZBZlhy?=
 =?utf-8?Q?EFkuVyGZBs4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjgrRXdaaHdCaTlVQUM2Y2QzUWtycC9uT1V6TmxuVXZMUHVpQ1FMbGZvMmN5?=
 =?utf-8?B?VW5CZ1Q0NDhoaUQ5M1JERkRmOFdVa00zTUU2YVViSE9MakVKeXhYUEZSblh2?=
 =?utf-8?B?a3Y1NUZJdGpkaHBrVG5WaEVYNDMwMU42eE4yOU92YjQ4Z2VuV2EyNEJRcmx5?=
 =?utf-8?B?T0dPQTNWcTh6VHgyRkcvWWVySDVhVDdnK1hkRCtLS09pRFU4bkVJK2dsdnow?=
 =?utf-8?B?ZFVPNktIREVHaGtTSTc4WWFoekpXSFV4UWc0QTF1N04zQ0ZiRHpjMlE2K1Z0?=
 =?utf-8?B?bHRwMFNSMFhidStaMkVTL3FTdmJtQW1nbDRjT0dqak1qaTNtNDBoR3pVUGxS?=
 =?utf-8?B?Z2g5Mjc4QVNXeDE0aWNvQlFWZHBMTldaWEFwNE1LY280cFYycjJ3WW9KVGxy?=
 =?utf-8?B?ZWJjZnRUaXR0OU9CRFBlS0lPWEJleHU1bFNYVTZDNXZUM213c1lLUmRubVVt?=
 =?utf-8?B?NXJpN1pjTEUrNVQyRWlUZkxRTW45ekpSL1ZXUTRuR0orVXhWWldsVTBWMFpI?=
 =?utf-8?B?VTFCSHYxRy9QMWpBUVBEVkJTVjRpaHRmMy9oN1ZoUkFTcWZ5TFdiOUxaMFpi?=
 =?utf-8?B?WWt6K2pud1BjSDdpaGNVTVpsNG10Z3l3TmVUS0xsZ2VQTHhzeTIrSjBudGJv?=
 =?utf-8?B?UjB4bGhXRFdEeWhSc2RSRW9WSFhsNzlVS1A0QWpaNzlEMi9WZmVXQy9RRzFK?=
 =?utf-8?B?QVBYSzlVemFxck0rK29vb3lSRkZtQXFEWFhUUjg4ZHoxT1NES08vN0JRVVJx?=
 =?utf-8?B?T1pURm5ZU2YxSE1OZW9tZlZGbjNlR3o3UFZ0YnNlNGZselFpMnVxeG1US0Fy?=
 =?utf-8?B?NHlGV3ZsZWl3bXorSDNnUWpRWGtVODVUeW5IQjlNOVQyUHdTNXBYa0VZdG9k?=
 =?utf-8?B?c3NlSUY0K3d5NEpCSmZHWGhZelQ2d1NQWXoyeUZHVkZaTEJyMFUvZEloSzEy?=
 =?utf-8?B?RTVvVkQ2YWlMSGF0eEJUUENXQlNyRDAxbkl0ZGhJb2VHR3U3cCtZSG9yRTIr?=
 =?utf-8?B?N0JpbHBlWStISDFLUzFWVE1CTlNMVkhLclVBMFVmM0xPTUh6M0p2bGQyVFBZ?=
 =?utf-8?B?dTlvRWxNWDdzeVdHejV5dG1vUmI3bURBWUxvWkI1SUtwdk9WeWlxV1NydXlD?=
 =?utf-8?B?ZFJKbkVIMlVrNEdXODlUWllFeEtpS0lmM1pqYWhoWnM4NVhqeTBkc3ArdGNa?=
 =?utf-8?B?L2ZlbFBudUhBVUtHNlNkYTZQTzFTc1NuVWNXSW5ZVzE1WU1jS2FTOXkzYTg1?=
 =?utf-8?B?Nzh3UlZJM2JwK2wwUTVBY1FTZGlqY0dIZEttemlUZkdUbDdzemtVblBObFly?=
 =?utf-8?B?bFBRQzY4a1lLekVqRTZwb1lJeXp2c3EyVjlENjUyQ3JNS1UxY2hrY0xVVUw3?=
 =?utf-8?B?L1pRLzh2Z1FaenlaekVhUFNHMGIrUmR2eTJDT0lSdnI5S0JSWUZ0YlVyVUMx?=
 =?utf-8?B?WFVjT3ZOZW9HQjVPVnphdlJ4UGRod2J2VERNcmhxeURXbC8vMk96bDkwMjF4?=
 =?utf-8?B?WkZPNWxxY0FaWlhCcStMQURlMndudmFlb0lpcUJLOW4zSVQ1bTFhOEJUL3Az?=
 =?utf-8?B?QmVxdVQ3S00xSWtscUhxMXpmVVZ1d1RYcEJoV09wZXJoUm1HdE93Y3pEcmlW?=
 =?utf-8?B?OWRzbk94blRNREdpSHpYMmtxQ1pDUGhjbU5iNmg4aElCMHdZMEZuVXVzUWpI?=
 =?utf-8?B?MzQ3Sm00NGp4dWhtcGpmNEZVUDRteUVVQmNPbDJkeFZNcUZLa3hINDBZYnQ1?=
 =?utf-8?B?V2ZuT2dyZFZNK0lpWmw0TlAyc041YWZNQUljMkpSUDhzM0h0dWVoU3hUQ0wz?=
 =?utf-8?B?S1U3UWF4R2h0TlZKUUNvR3lkVjVlTzF6ZzhoRG9vZkZJcE9ZZU9mcnNkMWRs?=
 =?utf-8?B?TlVRT1pwelRUdFhTeFFFay82SnNEQ3hML29NVWlPcC9aSkZtb0x3T0hiTUQ0?=
 =?utf-8?B?WWlnUmU3NG1wek85T3p1RnEwcll6L2lEWGJ0ZnZEZkhialFCODdCQUdJYUpl?=
 =?utf-8?B?MFltcHhvbmFOMjkxK3htaXVlZTBFaDA4NFZzOHBBM09zWUNpSzBXa2dxS3Rk?=
 =?utf-8?B?UXhyZ3NiSm54eDR1MGd5V2piRmFjRDVLeU9RYkozR1VSZ2VEMjljSFpFQU4y?=
 =?utf-8?Q?9hID24rurHCb/tp7tixdy+5Ov?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f75a8cc-90da-4afe-043e-08dddfd58bf9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 10:37:23.0698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VvLkeCVPU+RefRP/1/Xj1M5JmQV9gJ91hIyZsEvFK/lHh4aGgbRKT57x6Docw527TMsGXSXlvAhQj+1oeChPkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7724
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


On 8/20/2025 3:44 PM, Matthew Auld wrote:
> On 20/08/2025 08:56, Arunpravin Paneer Selvam wrote:
>> Hi Matthew,
>>
>> On 8/14/2025 4:15 PM, Matthew Auld wrote:
>>> On 24/07/2025 11:46, Arunpravin Paneer Selvam wrote:
>>>> Replace the freelist (O(n)) used for free block management with a
>>>> red-black tree, providing more efficient O(log n) search, insert,
>>>> and delete operations. This improves scalability and performance
>>>> when managing large numbers of free blocks per order (e.g., hundreds
>>>> or thousands).
>>>>
>>>> In the VK-CTS memory stress subtest, the buddy manager merges
>>>> fragmented memory and inserts freed blocks into the freelist. Since
>>>> freelist insertion is O(n), this becomes a bottleneck as fragmentation
>>>> increases. Benchmarking shows list_insert_sorted() consumes ~52.69% 
>>>> CPU
>>>> with the freelist, compared to just 0.03% with the RB tree
>>>> (rbtree_insert.isra.0), despite performing the same sorted insert.
>>>>
>>>> This also improves performance in heavily fragmented workloads,
>>>> such as games or graphics tests that stress memory.
>>>
>>> Neat. Also please Cc intel-gfx@lists.freedesktop.org and intel- 
>>> xe@lists.freedesktop.org on the next revision so our CI can pick 
>>> this up.
>> Sure, I will add on v3.
>>>
>>>>
>>>> Signed-off-by: Arunpravin Paneer Selvam 
>>>> <Arunpravin.PaneerSelvam@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_buddy.c | 141 
>>>> +++++++++++++++++++++++-------------
>>>>   include/drm/drm_buddy.h     |  39 +++++++++-
>>>>   2 files changed, 128 insertions(+), 52 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>>> index a1e652b7631d..19e9773b41be 100644
>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>> @@ -31,6 +31,8 @@ static struct drm_buddy_block 
>>>> *drm_block_alloc(struct drm_buddy *mm,
>>>>       block->header |= order;
>>>>       block->parent = parent;
>>>>   +    RB_CLEAR_NODE(&block->rb);
>>>> +
>>>>       BUG_ON(block->header & DRM_BUDDY_HEADER_UNUSED);
>>>>       return block;
>>>>   }
>>>> @@ -41,23 +43,53 @@ static void drm_block_free(struct drm_buddy *mm,
>>>>       kmem_cache_free(slab_blocks, block);
>>>>   }
>>>>   -static void list_insert_sorted(struct drm_buddy *mm,
>>>> -                   struct drm_buddy_block *block)
>>>> +static void rbtree_insert(struct drm_buddy *mm,
>>>> +              struct drm_buddy_block *block)
>>>>   {
>>>> +    struct rb_root *root = &mm- 
>>>> >free_tree[drm_buddy_block_order(block)];
>>>> +    struct rb_node **link = &root->rb_node;
>>>> +    struct rb_node *parent = NULL;
>>>>       struct drm_buddy_block *node;
>>>> -    struct list_head *head;
>>>> +    u64 offset;
>>>> +
>>>> +    offset = drm_buddy_block_offset(block);
>>>>   -    head = &mm->free_list[drm_buddy_block_order(block)];
>>>> -    if (list_empty(head)) {
>>>> -        list_add(&block->link, head);
>>>> -        return;
>>>> +    while (*link) {
>>>> +        parent = *link;
>>>> +        node = rb_entry(parent, struct drm_buddy_block, rb);
>>>> +
>>>> +        if (offset < drm_buddy_block_offset(node))
>>>> +            link = &parent->rb_left;
>>>> +        else
>>>> +            link = &parent->rb_right;
>>>>       }
>>>>   -    list_for_each_entry(node, head, link)
>>>> -        if (drm_buddy_block_offset(block) < 
>>>> drm_buddy_block_offset(node))
>>>> -            break;
>>>> +    rb_link_node(&block->rb, parent, link);
>>>> +    rb_insert_color(&block->rb, root);
>>>> +}
>>>> +
>>>> +static void rbtree_remove(struct drm_buddy *mm,
>>>> +              struct drm_buddy_block *block)
>>>> +{
>>>> +    struct rb_root *root;
>>>>   -    __list_add(&block->link, node->link.prev, &node->link);
>>>> +    root = &mm->free_tree[drm_buddy_block_order(block)];
>>>> +    rb_erase(&block->rb, root);
>>>> +
>>>> +    RB_CLEAR_NODE(&block->rb);
>>>> +}
>>>> +
>>>> +static inline struct drm_buddy_block *
>>>> +rbtree_last_entry(struct drm_buddy *mm, unsigned int order)
>>>> +{
>>>> +    struct rb_node *node = rb_last(&mm->free_tree[order]);
>>>> +
>>>> +    return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
>>>> +}
>>>> +
>>>> +static bool rbtree_is_empty(struct drm_buddy *mm, unsigned int order)
>>>> +{
>>>> +    return RB_EMPTY_ROOT(&mm->free_tree[order]);
>>>>   }
>>>>     static void clear_reset(struct drm_buddy_block *block)
>>>> @@ -70,12 +102,13 @@ static void mark_cleared(struct 
>>>> drm_buddy_block *block)
>>>>       block->header |= DRM_BUDDY_HEADER_CLEAR;
>>>>   }
>>>>   -static void mark_allocated(struct drm_buddy_block *block)
>>>> +static void mark_allocated(struct drm_buddy *mm,
>>>> +               struct drm_buddy_block *block)
>>>>   {
>>>>       block->header &= ~DRM_BUDDY_HEADER_STATE;
>>>>       block->header |= DRM_BUDDY_ALLOCATED;
>>>>   -    list_del(&block->link);
>>>> +    rbtree_remove(mm, block);
>>>>   }
>>>>     static void mark_free(struct drm_buddy *mm,
>>>> @@ -84,15 +117,16 @@ static void mark_free(struct drm_buddy *mm,
>>>>       block->header &= ~DRM_BUDDY_HEADER_STATE;
>>>>       block->header |= DRM_BUDDY_FREE;
>>>>   -    list_insert_sorted(mm, block);
>>>> +    rbtree_insert(mm, block);
>>>>   }
>>>>   -static void mark_split(struct drm_buddy_block *block)
>>>> +static void mark_split(struct drm_buddy *mm,
>>>> +               struct drm_buddy_block *block)
>>>>   {
>>>>       block->header &= ~DRM_BUDDY_HEADER_STATE;
>>>>       block->header |= DRM_BUDDY_SPLIT;
>>>>   -    list_del(&block->link);
>>>> +    rbtree_remove(mm, block);
>>>>   }
>>>>     static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
>>>> @@ -148,7 +182,7 @@ static unsigned int __drm_buddy_free(struct 
>>>> drm_buddy *mm,
>>>>                   mark_cleared(parent);
>>>>           }
>>>>   -        list_del(&buddy->link);
>>>> +        rbtree_remove(mm, buddy);
>>>>           if (force_merge && drm_buddy_block_is_clear(buddy))
>>>>               mm->clear_avail -= drm_buddy_block_size(mm, buddy);
>>>>   @@ -179,12 +213,17 @@ static int __force_merge(struct drm_buddy *mm,
>>>>           return -EINVAL;
>>>>         for (i = min_order - 1; i >= 0; i--) {
>>>> -        struct drm_buddy_block *block, *prev;
>>>> +        struct drm_buddy_block *block, *prev_block, *first_block;
>>>> +
>>>> +        first_block = rb_entry(rb_first(&mm->free_tree[i]), struct 
>>>> drm_buddy_block, rb);
>>>>   -        list_for_each_entry_safe_reverse(block, prev, &mm- 
>>>> >free_list[i], link) {
>>>> +        for_each_rb_entry_reverse_safe(block, prev_block, &mm- 
>>>> >free_tree[i], rb) {
>>>>               struct drm_buddy_block *buddy;
>>>>               u64 block_start, block_end;
>>>>   +            if (RB_EMPTY_NODE(&block->rb))
>>>> +                break;
>>>
>>> If we got the block from the rb tree, can it be empty here?
>>
>> I saw a crash earlier without this check while running graphics 
>> workloads, but it is not happening now. I will
>>
>> test with more workloads and remove it if everything looks fine.
>>
>>>
>>>> +
>>>>               if (!block->parent)
>>>>                   continue;
>>>>   @@ -206,10 +245,14 @@ static int __force_merge(struct drm_buddy *mm,
>>>>                * block in the next iteration as we would free the
>>>>                * buddy block as part of the free function.
>>>>                */
>>>> -            if (prev == buddy)
>>>> -                prev = list_prev_entry(prev, link);
>>>> +            if (prev_block && prev_block == buddy) {
>>>> +                if (prev_block != first_block)
>>>> +                    prev_block = rb_entry(rb_prev(&prev_block->rb),
>>>> +                                  struct drm_buddy_block,
>>>> +                                  rb);
>>>> +            }
>>>>   -            list_del(&block->link);
>>>> +            rbtree_remove(mm, block);
>>>>               if (drm_buddy_block_is_clear(block))
>>>>                   mm->clear_avail -= drm_buddy_block_size(mm, block);
>>>>   @@ -258,14 +301,14 @@ int drm_buddy_init(struct drm_buddy *mm, 
>>>> u64 size, u64 chunk_size)
>>>>         BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
>>>>   -    mm->free_list = kmalloc_array(mm->max_order + 1,
>>>> -                      sizeof(struct list_head),
>>>> +    mm->free_tree = kmalloc_array(mm->max_order + 1,
>>>> +                      sizeof(struct rb_root),
>>>>                         GFP_KERNEL);
>>>> -    if (!mm->free_list)
>>>> +    if (!mm->free_tree)
>>>>           return -ENOMEM;
>>>>         for (i = 0; i <= mm->max_order; ++i)
>>>> -        INIT_LIST_HEAD(&mm->free_list[i]);
>>>> +        mm->free_tree[i] = RB_ROOT;
>>>>         mm->n_roots = hweight64(size);
>>>>   @@ -273,7 +316,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 
>>>> size, u64 chunk_size)
>>>>                     sizeof(struct drm_buddy_block *),
>>>>                     GFP_KERNEL);
>>>>       if (!mm->roots)
>>>> -        goto out_free_list;
>>>> +        goto out_free_tree;
>>>>         offset = 0;
>>>>       i = 0;
>>>> @@ -312,8 +355,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 
>>>> size, u64 chunk_size)
>>>>       while (i--)
>>>>           drm_block_free(mm, mm->roots[i]);
>>>>       kfree(mm->roots);
>>>> -out_free_list:
>>>> -    kfree(mm->free_list);
>>>> +out_free_tree:
>>>> +    kfree(mm->free_tree);
>>>>       return -ENOMEM;
>>>>   }
>>>>   EXPORT_SYMBOL(drm_buddy_init);
>>>> @@ -323,7 +366,7 @@ EXPORT_SYMBOL(drm_buddy_init);
>>>>    *
>>>>    * @mm: DRM buddy manager to free
>>>>    *
>>>> - * Cleanup memory manager resources and the freelist
>>>> + * Cleanup memory manager resources and the freetree
>>>>    */
>>>>   void drm_buddy_fini(struct drm_buddy *mm)
>>>>   {
>>>> @@ -350,7 +393,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
>>>>       WARN_ON(mm->avail != mm->size);
>>>>         kfree(mm->roots);
>>>> -    kfree(mm->free_list);
>>>> +    kfree(mm->free_tree);
>>>>   }
>>>>   EXPORT_SYMBOL(drm_buddy_fini);
>>>>   @@ -383,7 +426,7 @@ static int split_block(struct drm_buddy *mm,
>>>>           clear_reset(block);
>>>>       }
>>>>   -    mark_split(block);
>>>> +    mark_split(mm, block);
>>>>         return 0;
>>>>   }
>>>> @@ -598,7 +641,7 @@ get_maxblock(struct drm_buddy *mm, unsigned int 
>>>> order,
>>>>       for (i = order; i <= mm->max_order; ++i) {
>>>>           struct drm_buddy_block *tmp_block;
>>>>   -        list_for_each_entry_reverse(tmp_block, 
>>>> &mm->free_list[i], link) {
>>>> +        for_each_rb_entry_reverse(tmp_block, &mm->free_tree[i], rb) {
>>>>               if (block_incompatible(tmp_block, flags))
>>>>                   continue;
>>>>   @@ -624,7 +667,7 @@ get_maxblock(struct drm_buddy *mm, unsigned 
>>>> int order,
>>>>   }
>>>>     static struct drm_buddy_block *
>>>> -alloc_from_freelist(struct drm_buddy *mm,
>>>> +alloc_from_freetree(struct drm_buddy *mm,
>>>>               unsigned int order,
>>>>               unsigned long flags)
>>>>   {
>>>> @@ -641,7 +684,7 @@ alloc_from_freelist(struct drm_buddy *mm,
>>>>           for (tmp = order; tmp <= mm->max_order; ++tmp) {
>>>>               struct drm_buddy_block *tmp_block;
>>>>   -            list_for_each_entry_reverse(tmp_block, &mm- 
>>>> >free_list[tmp], link) {
>>>> +            for_each_rb_entry_reverse(tmp_block, &mm- 
>>>> >free_tree[tmp], rb) {
>>>>                   if (block_incompatible(tmp_block, flags))
>>>>                       continue;
>>>>   @@ -657,10 +700,8 @@ alloc_from_freelist(struct drm_buddy *mm,
>>>>       if (!block) {
>>>>           /* Fallback method */
>>>>           for (tmp = order; tmp <= mm->max_order; ++tmp) {
>>>> -            if (!list_empty(&mm->free_list[tmp])) {
>>>> -                block = list_last_entry(&mm->free_list[tmp],
>>>> -                            struct drm_buddy_block,
>>>> -                            link);
>>>> +            if (!rbtree_is_empty(mm, tmp)) {
>>>> +                block = rbtree_last_entry(mm, tmp);
>>>>                   if (block)
>>>>                       break;
>>>>               }
>>>> @@ -728,7 +769,7 @@ static int __alloc_range(struct drm_buddy *mm,
>>>>             if (contains(start, end, block_start, block_end)) {
>>>>               if (drm_buddy_block_is_free(block)) {
>>>> -                mark_allocated(block);
>>>> +                mark_allocated(mm, block);
>>>>                   total_allocated += drm_buddy_block_size(mm, block);
>>>>                   mm->avail -= drm_buddy_block_size(mm, block);
>>>>                   if (drm_buddy_block_is_clear(block))
>>>> @@ -806,7 +847,6 @@ static int __alloc_contig_try_harder(struct 
>>>> drm_buddy *mm,
>>>>   {
>>>>       u64 rhs_offset, lhs_offset, lhs_size, filled;
>>>>       struct drm_buddy_block *block;
>>>> -    struct list_head *list;
>>>>       LIST_HEAD(blocks_lhs);
>>>>       unsigned long pages;
>>>>       unsigned int order;
>>>> @@ -819,11 +859,10 @@ static int __alloc_contig_try_harder(struct 
>>>> drm_buddy *mm,
>>>>       if (order == 0)
>>>>           return -ENOSPC;
>>>>   -    list = &mm->free_list[order];
>>>> -    if (list_empty(list))
>>>> +    if (rbtree_is_empty(mm, order))
>>>>           return -ENOSPC;
>>>>   -    list_for_each_entry_reverse(block, list, link) {
>>>> +    for_each_rb_entry_reverse(block, &mm->free_tree[order], rb) {
>>>>           /* Allocate blocks traversing RHS */
>>>>           rhs_offset = drm_buddy_block_offset(block);
>>>>           err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
>>>> @@ -933,7 +972,7 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>>       list_add(&block->tmp_link, &dfs);
>>>>       err =  __alloc_range(mm, &dfs, new_start, new_size, blocks, 
>>>> NULL);
>>>>       if (err) {
>>>> -        mark_allocated(block);
>>>> +        mark_allocated(mm, block);
>>>>           mm->avail -= drm_buddy_block_size(mm, block);
>>>>           if (drm_buddy_block_is_clear(block))
>>>>               mm->clear_avail -= drm_buddy_block_size(mm, block);
>>>> @@ -956,8 +995,8 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>>           return  __drm_buddy_alloc_range_bias(mm, start, end,
>>>>                                order, flags);
>>>>       else
>>>> -        /* Allocate from freelist */
>>>> -        return alloc_from_freelist(mm, order, flags);
>>>> +        /* Allocate from freetree */
>>>> +        return alloc_from_freetree(mm, order, flags);
>>>>   }
>>>>     /**
>>>> @@ -974,8 +1013,8 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>>    * alloc_range_bias() called on range limitations, which traverses
>>>>    * the tree and returns the desired block.
>>>>    *
>>>> - * alloc_from_freelist() called when *no* range restrictions
>>>> - * are enforced, which picks the block from the freelist.
>>>> + * alloc_from_freetree() called when *no* range restrictions
>>>> + * are enforced, which picks the block from the freetree.
>>>>    *
>>>>    * Returns:
>>>>    * 0 on success, error code on failure.
>>>> @@ -1077,7 +1116,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>>               }
>>>>           } while (1);
>>>>   -        mark_allocated(block);
>>>> +        mark_allocated(mm, block);
>>>>           mm->avail -= drm_buddy_block_size(mm, block);
>>>>           if (drm_buddy_block_is_clear(block))
>>>>               mm->clear_avail -= drm_buddy_block_size(mm, block);
>>>> @@ -1161,7 +1200,7 @@ void drm_buddy_print(struct drm_buddy *mm, 
>>>> struct drm_printer *p)
>>>>           struct drm_buddy_block *block;
>>>>           u64 count = 0, free;
>>>>   -        list_for_each_entry(block, &mm->free_list[order], link) {
>>>> +        for_each_rb_entry(block, &mm->free_tree[order], rb) {
>>>>               BUG_ON(!drm_buddy_block_is_free(block));
>>>>               count++;
>>>>           }
>>>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>>> index 9689a7c5dd36..a64d108a33b7 100644
>>>> --- a/include/drm/drm_buddy.h
>>>> +++ b/include/drm/drm_buddy.h
>>>> @@ -10,6 +10,7 @@
>>>>   #include <linux/list.h>
>>>>   #include <linux/slab.h>
>>>>   #include <linux/sched.h>
>>>> +#include <linux/rbtree.h>
>>>>     #include <drm/drm_print.h>
>>>>   @@ -22,6 +23,41 @@
>>>>       start__ >= max__ || size__ > max__ - start__; \
>>>>   })
>>>>   +/*
>>>> + * for_each_rb_entry() - iterate over an RB tree in order
>>>> + * @pos:    the struct type * to use as a loop cursor
>>>> + * @root:    pointer to struct rb_root to iterate
>>>> + * @member:    name of the rb_node field within the struct
>>>> + */
>>>> +#define for_each_rb_entry(pos, root, member) \
>>>> +    for (pos = rb_entry_safe(rb_first(root), typeof(*pos), member); \
>>>> +         pos; \
>>>> +         pos = rb_entry_safe(rb_next(&(pos)->member), 
>>>> typeof(*pos), member))
>>>> +
>>>> +/*
>>>> + * for_each_rb_entry_reverse() - iterate over an RB tree in 
>>>> reverse order
>>>> + * @pos:    the struct type * to use as a loop cursor
>>>> + * @root:    pointer to struct rb_root to iterate
>>>> + * @member:    name of the rb_node field within the struct
>>>> + */
>>>> +#define for_each_rb_entry_reverse(pos, root, member) \
>>>> +    for (pos = rb_entry_safe(rb_last(root), typeof(*pos), member); \
>>>> +         pos; \
>>>> +         pos = rb_entry_safe(rb_prev(&(pos)->member), 
>>>> typeof(*pos), member))
>>>> +
>>>> +/**
>>>> + * for_each_rb_entry_reverse_safe() - safely iterate over an RB 
>>>> tree in reverse order
>>>> + * @pos:    the struct type * to use as a loop cursor.
>>>> + * @n:        another struct type * to use as temporary storage.
>>>> + * @root:    pointer to struct rb_root to iterate.
>>>> + * @member:    name of the rb_node field within the struct.
>>>> + */
>>>> +#define for_each_rb_entry_reverse_safe(pos, n, root, member) \
>>>
>>> Would it make sense to give these a less generic name? Something 
>>> like for_each_rb_free_block_* ?
>>>
>>> Also should this be exported or rather kept within .c?
>> yes, I will change it.
>>>
>>>> +    for (pos = rb_entry_safe(rb_last(root), typeof(*pos), member), \
>>>> +         n = pos ? rb_entry_safe(rb_prev(&(pos)->member), 
>>>> typeof(*pos), member) : NULL; \
>>>> +         pos; \
>>>> +         pos = n, n = pos ? rb_entry_safe(rb_prev(&(pos)->member), 
>>>> typeof(*pos), member) : NULL)
>>>
>>>
>>>> +
>>>>   #define DRM_BUDDY_RANGE_ALLOCATION        BIT(0)
>>>>   #define DRM_BUDDY_TOPDOWN_ALLOCATION        BIT(1)
>>>>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION        BIT(2)
>>>> @@ -53,6 +89,7 @@ struct drm_buddy_block {
>>>>        * a list, if so desired. As soon as the block is freed with
>>>>        * drm_buddy_free* ownership is given back to the mm.
>>>>        */
>>>> +    struct rb_node rb;
>>>>       struct list_head link;
>>>
>>> I think we can be slippery here and make this a union? They should 
>>> be mutually exclusive AFAICT?
>>
>> AFAIK, we need both, rb_node rb is for handling free blocks and the 
>> list_head link for adding the allocated blocks into
>>
>> the driver's list.
>
> At a given time I think it is either on the free rb or user block 
> list, not both at the same time, given that a block can't be free and 
> allocated? Just thinking if there is an easy way to trim the size a 
> bit, given that we are adding an entire rb_node, and there can be many 
> of these of these blocks around.
yes, you are right. I will add union for free rb and user block list.
>
>>
>>>
>>>>       struct list_head tmp_link;
>>>
>>> Otherwise it should be possible to get rid of this instead, and just 
>>> re-use link? Could be done as separate patch, if this makes sense.
>>
>> I think we cannot use link here since it is needed to add the 
>> allocated blocks to the driver's list and tmp_link is already used in
>>
>> alloc_range() and alloc_range_bias().
>
> Yeah, I don't this will work, but union might still be an option instead.

sure, we can make union for rb and list.

Regards,

Arun.

>
>
>>
>> Regards,
>>
>> Arun.
>>
>>>
>>>>   };
>>>> @@ -68,7 +105,7 @@ struct drm_buddy_block {
>>>>    */
>>>>   struct drm_buddy {
>>>>       /* Maintain a free list for each order. */
>>>> -    struct list_head *free_list;
>>>> +    struct rb_root *free_tree;
>>>>         /*
>>>>        * Maintain explicit binary tree(s) to track the allocation 
>>>> of the
>>>
>
