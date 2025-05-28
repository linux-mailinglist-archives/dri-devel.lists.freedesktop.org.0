Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F47AC69ED
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 15:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B455710E5F6;
	Wed, 28 May 2025 13:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UHCmTS18";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01A610E5FD;
 Wed, 28 May 2025 13:00:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ddT50yHe0JbiUofEhgDOjLvqZp/x0glXRYDW0b3ybdRZUqKbQaMGwRsiWjI/9I6tcndeqOsvGSKNEGMuCXqIP3/x3j3hdXfZJlvpzpCrE3CPp/KCfa5WSWnVAMOUfiQwH3OjEeO1Y5kSo5J++WqLtKoBVbZIDaimlr9MCQM9FvTUo04Ho+HwPuVytldkAeRqHCMjyd7B6oFb9nm/YG1ZAw2PYv3Q2hxK0TeinB3tcN6Q8mQ1xORygLyUsBvcK4wtfIOJyuS4NWZoI0fun1PFLn2ADrExNqC1oPqXCrA+D0E6m8wNIZdKFXmiTh+6lcNWaPKWgMOUdOAz+bIpqJJy4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmVTMjSWzbWW10cjx5oMXdONT3He2te7urW6yMP+sHQ=;
 b=A52bbgtfpPaGLH3V4gWNi7DL0m2U8T8xf9xaKpmq85rbY9XOTi7wdBc/9DKTkrQDpNSogy+FvHzXV46dLWt8lbnsHgHowRl5JZKovAQ+n7AFrGiEEY8N07n+SBU3noIWqoSVWGlEgFhX9HlRtj7Y4np6mwEECsMmM2TkiVxBrUB9dLSrFaCHe5TaAsI4ty9YH9kU0qMHDQg+N9RhBsvFuDxPZSnC1uNSI8xaJN1hYFFUQTbs/hoCPf3kU+z4Y9HJ7WdWRYM2l2Dizhxhh69iLT9VHGY9k0cEOsJDqQOHBTksmDT37/MldkueY3V1SB1HZpLRwIm8StWPmK92C4qZZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmVTMjSWzbWW10cjx5oMXdONT3He2te7urW6yMP+sHQ=;
 b=UHCmTS18zddWNVIzHRMCSawH58AX21ahaks+mcui+qAVMfZN4pR+G/snhOpmPVsFscMHI82vU2Aru2XSDwRPWv6iCDjpKucsWot5OHDaR8OoTXRHW+v1Cl9jgTj6giHKkZ+bJ2Gn6X3PrjrcTVnG0aW6wh1PZsEv/iCJyoEI4OU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH2PR12MB9518.namprd12.prod.outlook.com (2603:10b6:610:27e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 12:59:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 28 May 2025
 12:59:56 +0000
Message-ID: <53a43a61-00c1-4bab-a7a3-f0d5da4b0631@amd.com>
Date: Wed, 28 May 2025 14:59:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: Dirty cleared blocks on allocation
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>,
 Natalie Vock <natalie.vock@gmx.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@vger.kernel.org
References: <20250527194353.8023-1-natalie.vock@gmx.de>
 <20250527194353.8023-3-natalie.vock@gmx.de>
 <89652580-5763-4f1e-abf5-d340119543f3@amd.com>
 <dbbdcada-32ae-4457-af87-1f98362461f1@gmx.de>
 <da44526e-f2b6-4486-8ede-24647869576f@amd.com>
 <6cd32fcf-233d-454b-be3d-aabb870b8b4a@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <6cd32fcf-233d-454b-be3d-aabb870b8b4a@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR06CA0001.namprd06.prod.outlook.com
 (2603:10b6:208:23d::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH2PR12MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: 23a492e2-1d04-47f8-497a-08dd9de78b8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RC82V0ZmcTRJK3h6Q3dWTG14ZG4xUWpsVkFTWlQwdGs5dU51d1R4a2FLaWRs?=
 =?utf-8?B?K29UL2QwclVpdTFZckRJenlpbVlqZ00wN3Bhb0FtdEE2SWFKWndFQ1dyalN1?=
 =?utf-8?B?ZEUySG5vU1p6YXBRWi9EOU9lSE85ekVlSCtCYUJ1b0RpK1hZYkJzVTBWYlpI?=
 =?utf-8?B?Z3hWdXJQellWUDU2UlpZb0hwZEpLN0d2L1JrTG9jSWk3am1CTEZsWE5nVjh2?=
 =?utf-8?B?c3QrZDNwR1I1dS9wWnA3TmU3aEZrMmJxS29RMzZYamh6NXZITkFvUWxSY2xV?=
 =?utf-8?B?QlhCZjFRN3lxSjFRSEZ0MVpwcEV3eURTQlpkQ3N3YnFKN25CRUpkV3JIVnZQ?=
 =?utf-8?B?WW1JM3F4MGhQd01ZLzhUWWlRaTJKemtJYkw0WFQ4RElwQ0piUlFjL2kyT0xE?=
 =?utf-8?B?QlJGUC9nbkdOZmlRd09TU1RibkZ4NXdNVE1LbVBNenphelhkNGtkaWpObExv?=
 =?utf-8?B?aDZBVWVWdlhQZm1mMHB4TmNlSDR6RHl4aEdtYTJtSzhhTTVLZERpY2JxaWh5?=
 =?utf-8?B?V29PQ3hsYnMxbGtGZGNDK3BPNHRGYlBpRGhSRmNhUnA2aEtsaWozU0h0T0dE?=
 =?utf-8?B?a2h5SGFKUnU1VDVlMzR1Rm9EbWNqK04wV2xrZUdxell2ZFoya05KVDViQlhr?=
 =?utf-8?B?UXEzZkVnSHp3TEF5bXpMRXdIRVBqR01FeGhaYkdpa2cxTjdLNFUvM1V5cm5H?=
 =?utf-8?B?Nm9vSUZwV05CdFAzekhJbDZVYm1KMzZrVyt5bjNjM2pibFFBRXVGblZoVkUr?=
 =?utf-8?B?TWJPUFpFUmkzRTUvL3dmWUdUanlCOVp2QnVsWDM1ZStiZzNJM244TDRLZTFi?=
 =?utf-8?B?MXNIaFIvenl0c3RNb25SdGs2OFkvU1RXMXcvNmRnZGF6a1N1dkJqYW5NVEM0?=
 =?utf-8?B?NXJ5QW9hRTJWLzk3b2dKcFVicTFwRENmbVd2SXNIVUFVSG5FMC9qM0JaZml5?=
 =?utf-8?B?ZDY1NVRhdWhxMnoySWt2N2t3WjJBZDNaazNzbEJXNG1HWG1QMEE2YVI1em1I?=
 =?utf-8?B?bklYSk91bDZnTEJDeVpjVHR4SzFGSnY5Z1ZFTUc1dXlXcCtsUTFSdWZmUnJU?=
 =?utf-8?B?RVRkazVWaFRHQVJoT3h2Q1YvODBnQUtPTlRGbDdkMTZnSEFDcEx5YzI1ZHA1?=
 =?utf-8?B?SS9xbEptOWx2aW1ZaGZvcnc4UENXOUhMeUROSWdIdGlJSm9HZ1BKbmE0cXMv?=
 =?utf-8?B?bXZOaFBxNnFQRnZ4eHg4RSsxNHpLUHNUZ2dFSW96OFgrSTcwL0l6MFlYdUJH?=
 =?utf-8?B?Z3NWTW01Z2dnZzd4NWk0ZFhyajMrZmlTSHp5clZ0VnYwb2VZMFc2NEpyNVVI?=
 =?utf-8?B?THEzdzVWcGdBQVYwcXYxbTZMUE1Pckk0RW1qYmJwWnFoVmlGNElJaUVSUThx?=
 =?utf-8?B?aXdqbzJ2Y09EN2dLa0d0MUpTNXNyUUlpMnMzYkF4ZTBWMjBiUG4xd1NnN2RO?=
 =?utf-8?B?ajQ4MnZucGhuRkY4WW1TeHY5clNOR29xM2o5N3RCQSswMVFOYnpFcmoyeUhJ?=
 =?utf-8?B?di9yRkZnT1NtY1JGMjcvVGhUSVRuR2tBRHBUbHJ2dzFkMExyajROZjFCU3A3?=
 =?utf-8?B?dHdJRlNRWW82MWwrYkx3MFRwTDQ0YkZMTXNhWGRFejFKeGdHV2M4aE9IclV2?=
 =?utf-8?B?Sisyb2kxWEtCTUNqd09tNm04SmxralB5ZXl6NmVpVEN2dzUyKzVWTEZWc3lX?=
 =?utf-8?B?dDFVL3I1NjVrTWVFOWNzdWY1Tlg2dEYxZVZoQkx0WFRXT3NUSUg1VUR0R0pX?=
 =?utf-8?B?eEl2TUJJc1pkU0ZDSGFYbjlaMjE0dlJPZXBNYk9WNGVvczRWWWtXc2RJU1RZ?=
 =?utf-8?B?aUI5SzJlcVZ1eldLUUY1TGR6VnU3eUxMaFRjWGh0aWRxNUM2ZTQwU05OVnkv?=
 =?utf-8?Q?IlgTdWRs3MwOj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rjlwcks0cXhtOEU1S1l3d3pENWJqNWxnRDJaV2p6dm5OcGJnTGZiM2IwdEJQ?=
 =?utf-8?B?ZlpERWc0M1Zldk11QnpTb3p5aUNCNU90VE1FeDZqWEZoa2NSa2NXM0dFYUxP?=
 =?utf-8?B?anBPcDBhbis3YnJGN3o0dmpyRWxQOE85T0NiM2pvZWJYaXQ3QjBsVm5wbzND?=
 =?utf-8?B?UCt2aVQ4YlhnaDUvaFRuUFRiWUlyMVRaMmE3bUNkbnBmU00wVFJJMC9mY1hY?=
 =?utf-8?B?bXFXdmI1QWEvTDZ0WkRPcGdLSzRUaSt3eDFZeE9GNjJiZlpUQVJJYlZKUHpp?=
 =?utf-8?B?Uzl6L3dVK3F0ZVQ1NXdmL1pUcnl6cFB3Y3ZHMWs2aUhUMlg2cW9lSnhRWWQ0?=
 =?utf-8?B?SzgyOGRpQVRRT2lvT0dweTFCMkQrVGJVWTdzdittK0RjNU5CZ21EZXdMQnlD?=
 =?utf-8?B?eDBJVmRjTU1kdlZQRlIyRE5yT21hUHpjL0ZMVFB3QnVHYWdkR1RoakYxa1Ar?=
 =?utf-8?B?b0hxTDBMZCtYa2MxWDFoMWYyTkh1MEVmcjQ3MXl3YmVQRnhORjRzMUsvS0J2?=
 =?utf-8?B?QThDODJ5OFZMWFpwdW9wMGN5dHk3di90Y0hhQmRHVnNwQkFJb3Q5aktNMHR2?=
 =?utf-8?B?SSsyOXMwRmFhYnZRaGYzNEhRQy95QzZXcTFTcFh4SkVFSDNlNGxVQjZ1TEtu?=
 =?utf-8?B?ZUVaOUZFQXBtanhXY0Z1R1dMc05mTDlrVk9CWUROOXp1QnB0ZklFbmpYNW1M?=
 =?utf-8?B?VjBLUW5scUk3UTNUeU9zVENUUitmOWU3bW9qenliTWJucmlEN1ZxcGtwRHRa?=
 =?utf-8?B?RzZLa0xZam5iLzJ0Uis5RzNrMHhpM1pXOU1xT2dHeFBRZzBZeXVlalFPN0pu?=
 =?utf-8?B?REp3empTYkNXMzdPN3ZQRExHaFJzWUF4Tm5UNlBqSjMvOTJFTWE1WGdMZDUy?=
 =?utf-8?B?c1pPSjZGc0VtMmhMdnBoRHBBTmM3WWU4YWU0Nm82L28vbXBBdzJyMFU0OFZK?=
 =?utf-8?B?VFI3enVBdG9UbTRhckpzbVFEdDgrVHp5Mk1kZm1zeTE2bWc1VnB3MFlCcVl6?=
 =?utf-8?B?TkhGcGUxbHNYSkx5T0ZOdDZMR0J1QTZtY0ZYWUxqTmc4VDZLUnBZbHVjZDYv?=
 =?utf-8?B?U3JWWUluQzgzYU1kZWVteW9sRWtINEU5RFVWY3FqeEtKSzFCemxCNXVnLzJz?=
 =?utf-8?B?RmpLNEluVGIvSEdUMisyWXJ6L2tmRUFtNHBiK0lTWHhEc3RyWWg2azlCWU1R?=
 =?utf-8?B?MWRSV1RPRFhyV09NR0RrelpnUlpVMUVseUJQeUM1SlI4TWsrUnVUMTNWNXNo?=
 =?utf-8?B?bnU5c1kxVytYckswYi9BYjM0aTRjaEtiYmxOdGF0QWtmcjZnOU9ZN1B2UStZ?=
 =?utf-8?B?OHk5bUdXQ3YzTDBqNnY5bGFUNXdBc25kR2tBLzZndzR1UDhWZ2F5T2QyeTQ1?=
 =?utf-8?B?ZkZvWFJXNEw3MU8vVFNZdEhzMWE4Z2Z4NkRhVm5ETjRZSmxCSmxpbkFrS1Ba?=
 =?utf-8?B?ZEdQajFnZXhQQzE4c1EvSVNCdDZ2TCtmS0ZpaVB6TEhCeGR2U1NESHA1aklO?=
 =?utf-8?B?b0Vpb0kyejBXaWE4WnQ1WHFBZ0s0RGFJc0RXN1Z4VkF2My9NT3B2RTJWdzBC?=
 =?utf-8?B?YThzdktpZlZZWlBCUFNSaGFXQW5ZS0ZnZ2xzZm9OQjlRSEJTTSt4bnhVdFJm?=
 =?utf-8?B?RjdJbzFoMDdGWEZLUjNad3Raa2lZL2pJS2lBL0VYYkJSN2N5MUFYeTlyMDBN?=
 =?utf-8?B?eU1FU0ZHQnF0aVJFdkJ6YURRUFVQSmpDZVJJU2VUSFV4MTlIaHdmb3pwZWta?=
 =?utf-8?B?S3k5eTc5Y2RGL3FwUnVPT0txWVQ3cWJmZTlWMlJZR2J1SEx4elRXMzFnN0Jj?=
 =?utf-8?B?S2hhZGdrL24xRld6NGIzT3hsN0xOMHNHRVlHNTF6dkdjUC9ER2pOMDZRRmtr?=
 =?utf-8?B?dGlncHdDNE92Sm1FN2MwSUNpcUg5SlJhY2c1VW9iaUIvR3NEK01TL00yc0Iz?=
 =?utf-8?B?TkYvLzl6Rm1aOU5PdDZlRDdZRlhrRmJWc1NHa2Y1OXFHNkJ4NEcxY1dWaXZP?=
 =?utf-8?B?ZDF0NWlHeXVadEFOVTBIdGdDaWZXOURJaVFXRUhsbjRVRmRtVjBRaW5rSjcy?=
 =?utf-8?B?c0hjSTNDUFkwWVdTMVB2Qjk1UlBsUTViQWJKaktUMGErSVc5ZnNXb2lxcGln?=
 =?utf-8?Q?ahb5jQgPrSm6dwaHwLewit8R8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a492e2-1d04-47f8-497a-08dd9de78b8d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 12:59:56.3463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2i3zZQ1PJ1xEIkvnXj0u8v5/OHX+b7fcgZpWAoTCCbPTeOrJ+MJm+GOqyP7Z7fkO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9518
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

On 5/28/25 14:39, Michel Dänzer wrote:
> On 2025-05-28 14:14, Paneer Selvam, Arunpravin wrote:
>> On 5/28/2025 2:59 PM, Natalie Vock wrote:
>>> On 5/28/25 09:07, Christian König wrote:
>>>>
>>>> But the problem rather seems to be that we sometimes don't clear the buffers on release for some reason, but still set it as cleared.
>>>
>>> Yes precisely - "some reason" being the aforementioned clear flags. We do always call amdgpu_clear_buffer on release, but that function will perform the same checks as the clear on allocation does - that means, if a block is marked clear then it will skip emitting any actual clears.
>>
>> On buffer release [https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c#L1318], we call amdgpu_fill_buffer() and not amdgpu_clear_buffer() (in amdgpu_bo_release_notify() function), so the buffers are expected to be cleared without fail.
>>
>> When the user space doesn't set the AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE flag and having only AMDGPU_GEM_CREATE_VRAM_CLEARED, we don't call this amdgpu_fill_buffer() and amdgpu_vram_mgr_set_cleared(), and that's kind of makes sense.
>> I think the problem here is, when we don't clear the buffer during BO release, but the flag remains as cleared and that's why these blocks are skipped during clear on allocation (in amdgpu_bo_create() function).
>>
>> Therefore, if the release path clear is skipped for any reasons (for example, in case of AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE not set), we should set all buffer to dirty. Somehow, that is missed.
> BTW, I asked this before, but didn't get an answer:
> 
> Now that VRAM is always cleared before handing it out to user space, does AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE really need to do anything anymore? How can user space access the contents of a destroyed BO?

The flag is now used to communicate to the backend that we want to wipe on release. E.g. we still don't do that for kernel allocations or during suspend.

Regards,
Christian. 
