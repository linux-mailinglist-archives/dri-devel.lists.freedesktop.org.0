Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B188E98A4F8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CBF10E4BC;
	Mon, 30 Sep 2024 13:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NntH4iNS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAEF10E4B7;
 Mon, 30 Sep 2024 13:28:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+1x6QeWfEx/RulJTFn1Sg8shkX3sKbqUIzpo4aHTXn7sefZw2mQI5W86oQFGt1PbQJ1JMtRzEC9GEiAIbWhi8LobK/z2xsS6vsY2POF+df5xkSsBdIuDm4r4IbQnk+zMM5EXyhRMebk8hB/Q6jFSvnnpSnEHd6wrNWmcZRusu02fUGiJl77pXcHmdiTNik1aXUOV7qMKpSSxOKcQ34lE2abu9aaV6+yywchKvg8ksVPBPlknu02XpMoFutwUJ7u8iy33Ppb3sKsZkz5uPMI6aMFQ5PIwDPxuc8JROJBbBRiZIW0yjMb+hJuuHDmiKfgHHf5NEW6z8c+Xt/pVQdL0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sY3CYkABz7X9kr+IqxWb4V2/izC8K08qr60EwQxvbOI=;
 b=MLofd0hGuwgaL9OxXWHGGVsZVLRQe0pYu1CpNPgiRBrJ2FI/EDi4S2naJnV74D9h07HqG2DVcpavM24AWZ7beyn9iCsMa3Zlh0T0q+WAY1wrqrghpNIWhzsSLNThVV/c6iR79Rsf8VKpN6MuR57lnWOF6h31t8HrZ4YwMmqVRKk6PWSfNMZGESZW4WwwFfluHkR4jods5q9yTz6h9Kcxqovr0/LmxzH009BLhylfBEnk0h774GqQxME/XdxF+NY3xoqUV0TCde0WDsWFAtQyw2Xe14IuPaffPo9eTdtpuLnoDsgoikI1QHB/CQFaB8c2IUTE3Z0iR5dtdKXm6U9UWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sY3CYkABz7X9kr+IqxWb4V2/izC8K08qr60EwQxvbOI=;
 b=NntH4iNSJ9NCZ0OIywvkpzUt4QfBolkwTsAmweIrzADK1z2IXsOY9BtQ2ROrFBbTEQSa1pRJ45BCSLbnZllCXb+HA8G04jNqKbCK5ZabfXUn9Ebk6L7hLSfJA9xPT4GbHEXE6t7nKVmmPDLcWzA2DEJuS2Kq7wdrwUgsC0gLZZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL3PR12MB6547.namprd12.prod.outlook.com (2603:10b6:208:38e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Mon, 30 Sep
 2024 13:28:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 13:28:00 +0000
Message-ID: <693dd05a-0537-4be6-9d8c-6cd1b5d31833@amd.com>
Date: Mon, 30 Sep 2024 15:27:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drm/sched: Always increment correct scheduler score
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, stable@vger.kernel.org,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20240913160559.49054-1-tursulin@igalia.com>
 <20240913160559.49054-4-tursulin@igalia.com>
 <8392475d-489e-4aa3-b6c2-7cd15b86dab2@igalia.com>
 <cf135523-92ca-4d41-9acf-e979c9769ad9@amd.com>
 <2b0860a2-5ef0-496f-9283-d5056433af58@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2b0860a2-5ef0-496f-9283-d5056433af58@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL3PR12MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 43878047-4e11-43b4-11c2-08dce153b442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXdpdzRQMGs4R01QcDdhUlBYRUpBRWg1Y0Y2ZHVsVmhSRzFPRysyRnkySWVE?=
 =?utf-8?B?L3Z0QTRsQ1g2R0pJVlkrM3BlS3NGSm9RUURVNW1LZFBpcmRpUnN2QnFjajJO?=
 =?utf-8?B?N0lpSUx0alFaNUdrQlpla0N2MkFyNWlBUitudHowcGtoeExSRzNoNzlvOVB5?=
 =?utf-8?B?TGQ2U08vM3BpZ2Z3eGFvWGZkWm5hRkNIUjYxcjRsZUg5YjI3dlIxckt5aTN6?=
 =?utf-8?B?bC9OSk83TmZqeGRETHhGbElQT3QrcFpVMUY3S0hYNks5emt2L3oyblpHMWdm?=
 =?utf-8?B?b3RyazcxRGtjT3pqZGR2MXFiakZHaXVwLzVRaWV1U0J4U0FLTDhzbXhNWHNH?=
 =?utf-8?B?cThNNDFRRTRIbnpYazM1V0hxczZoZG9CQ3haaXBlSmtkUEttTjZqTWtvZ3JV?=
 =?utf-8?B?aThvQlIyekZKeXBQTFNHa3J6WWt2U3k4eDF1SE9zRCtkd1pqNkRwckFUOVk5?=
 =?utf-8?B?UXYzNFhVNDI3VXZkTGJ0KzAxQXBGWDZOaHVYbE9Pa0t2dGE3MFVoTk0zU2Mv?=
 =?utf-8?B?TkFHdzlKVjRSSXpGWStsaEdCbHNNbEFuMXFzLzU1d2FnSWZzdTBzNHhoYVhF?=
 =?utf-8?B?NGEwclBoZWNCcko0Tk5rVEFJNWF6RHNaRXZ4SEgxOERTVkE2UlQ2VVJ1Y2Nz?=
 =?utf-8?B?TU9SS3BDWGdET2JCUWhUR3VhY2Y1SXJ1Snp1QitNU1A1VzhYbXNyL3lXcCtI?=
 =?utf-8?B?eUxEVitxQVd2aENMYkNzUW5OTXY5cGM2SXVDWXVUNWJSU09uSkFJU1R0Z2Qx?=
 =?utf-8?B?eHFvdmQyRmlrNVJESmI5M2pVUGJkQVE3ME9nZFJIMm5ENDlIVDVTem9mOU9Y?=
 =?utf-8?B?TTNCM1FoVGFONnlzSGNZNGp5UHlhU05lWEJjMTZMOHZCM1dJRXBvM25oV3BK?=
 =?utf-8?B?T3VzYm5CdmErVVkwcndTeEJRTktxTStNNUN6akllcU9XRVBoRXJsdG9Jc3ZN?=
 =?utf-8?B?MUU0ZktlNmloL0xidEo5MHJwT1oxWXpYbkl4NkFWZEliWWsyb08rditxRWxx?=
 =?utf-8?B?MXJBWWZFSUorYVhQdVEvVDFjMDdOUFhQTFdCOTU0QnNFVUFrZk1seHJYOVRL?=
 =?utf-8?B?RHNob1NEQjFkVEVqalBxYW5BZlpoSHUxdGFMWnN2elh3eGRUem5sZjFMS3g5?=
 =?utf-8?B?bVhwZDJnRzA1VjY2NmFLZ0pDZm9jaElnRzlQRmpJakFvK2prNEtBVjlOWGRs?=
 =?utf-8?B?SUxrUnlXUVJvcytWcHcyMmlxbERUdzVMLzJNNGFuOG5zczhTN3MyM1ZqakxO?=
 =?utf-8?B?eDVYSlJsZ3lQelAzY0UvZ1dYdDFSMys4ZVB0MStHR09jV3BvZjEwTWZ4RURo?=
 =?utf-8?B?NVJBSjR3d01kOEdaWDBKcjVhdXk4R05ETXpleHdaMFJTWFp5TmsvZFQrelRN?=
 =?utf-8?B?UVlZenZLRU9mb3FyK1k5Rm90enl2Nk5YODNGdEQ0Y29IMlBXSktLNmxxWTJW?=
 =?utf-8?B?a2tkSm9rVTBjaDR1cjVZQVJsOFczd1lJWWNtMDlMaUdOdmgzRWZjcVFXcGhr?=
 =?utf-8?B?VkVmUGorbjFDRE1PdzVGYStFcWs4MW9uM09kQ0hmUnAzQTlpT3R6dG0zd2M2?=
 =?utf-8?B?T0NCZlFndTlCd25JckVFZmZpVG0xVUg4YytDRUQvZ25sZE9oZnh3V0lTMzlx?=
 =?utf-8?B?eStibHZpamtxMndSdmNpMWp3VVJPNmpZYnAxV2p4SUFPS3JjSm05T3dEclRX?=
 =?utf-8?B?YURBV3grN0pPdy9Mc0hXUEZQS3NvZ3dmUHFuYzVQSHpSTUhDK3dNUGpQZFJo?=
 =?utf-8?B?QlR6WWtZdDZ3bVBPYW9FTGtGZHc3eFJVOXR5aDJLUHNGQm9paS9LVVRRd1Fx?=
 =?utf-8?B?clZJZTViQTB6Z3Q4S0JMdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S05EUjVCMVA3Y0p4UHNwOEMvVlJ3U2V0QU9vVEk2MDkxYVpYMzZFVzF3eWtq?=
 =?utf-8?B?bjJCNm5QaE1oY3ZBallQbUd5SFBlYlVYTmt3YnRDVmlrRHBxVHlydGNZK1Nl?=
 =?utf-8?B?cityYTZHbnE1LzJ0RVVCUHU2d2lwWVltNzNBV1R3dlp0YnAva2RCREpkbklW?=
 =?utf-8?B?eXMvWHJqendGeTlJL09kWkI2bGF5ZmpSSTNnQWRmTlU1ZzFKRVk0bU1jdXhv?=
 =?utf-8?B?MVRBOFVCL3VjdUF5R3lUSU5hd3dFWWRodG92TlNnOE82SENDdk5aUFNLUDJG?=
 =?utf-8?B?MGpFQndtdVNaRU40R1lqeHF4dUo1ZVRJL3pZNHVDdHNQTFFwSlBjZjhyaUl6?=
 =?utf-8?B?WmxpSEFuNkF5S0VBYkJTeG1WWUt4aGU5cnBqZjdZamV5SUtMSmNHd0o2Ukla?=
 =?utf-8?B?MTFaRTFpVXhJNFlMZ2k2czliOUExVnBMTlJxdnl1cmQxK1ljdlR6UkdwUXRL?=
 =?utf-8?B?VUhmYnpROTY5emhkRm81WC83aHBMQ1Y1VkI3RUdiUFUrNnpUaU8zVG04UUU2?=
 =?utf-8?B?d1ZabER5bGw0OHA4N0d1V0J5dmZhV0ptSm56d0tPakVEa3lnSzkrUkVJNkdW?=
 =?utf-8?B?SytuZGJmTFYweUVmNDRLY1NHMzRlNkRpdFo2SmJoZUNtY1doaXFralUwdWEr?=
 =?utf-8?B?WjFBdnlsdUdsOFVDWi9EeEV5bldBWDYxTFRlbGZETzd6N2loT0llY0hOL2NX?=
 =?utf-8?B?VXNhQ3ZSYSs0ZUVyVEN3Z0lBc1dzYVcveldHQjhTVHFJazR2VVhIbG93ZjlC?=
 =?utf-8?B?eFB0L1lZMmlaMGNZbnF4Q0sxeVdYNmRxc21GL2RQcE9YTFJmWUhXb3M2T0Nt?=
 =?utf-8?B?VHQyZjNuOEp3QWxHNEVqaEJSMmFrakZnU0dOV3c5WVE3aWJFb0ltakxBc1FW?=
 =?utf-8?B?bUtQMjFvemxvRGVEaWw1cFh1c2U5TTZXTmRsTGxzdUFkRjRRNU0xa2xPUGNy?=
 =?utf-8?B?L0U5ZU1Ob29OL0ZLRkYxWmlCdVYrYng4NC9WTjZsdzkySkI2b3lkcG9ueG1P?=
 =?utf-8?B?QnJGeU8yaVFTRzFnbzZPYVFxbzhXRVNwNE5kQmpCNXVyYkM3MWZrQkhCQnZp?=
 =?utf-8?B?SUY3Si9zODlMU2F0M2NkVzlia3luZHV6cWlUL2lVSGNRemtJeTR3aGZMUEsz?=
 =?utf-8?B?WlJYMDFERUxjQkt6c0JrbzB6empKMzhpZU1LaWNNbTRmaEFWQTJwOGxRUnFK?=
 =?utf-8?B?U0dHWldZSXdhNzV4VU0zSWJqZHBqSHU0MEJKbi9MRGc3UHU0YWc3SG5aUHB4?=
 =?utf-8?B?eDFxRk9URERaSnNQb2ZCTm9BNjVqdEdmcW9kcnFjc09RdVhJUnp6ZElJQ3N1?=
 =?utf-8?B?WHRRNXRTV0s5aU1oWThoZ2NpZWVlVjNDaHkzb3p3Uk9maHZ5d1dvVEdmODUw?=
 =?utf-8?B?L2VuNjRnemlnQ2YybjBweTNiNkovZzE3cXA0ZE9uTmFmYmNtU0R5K0l3Ni9i?=
 =?utf-8?B?Y0VpQTlFelRYM3Z4VUdsUWtvaGFJQUQrMkcyMEJzV3labmVtTzJ5TnJKa2Q2?=
 =?utf-8?B?R0c5V3R6ZHBqdzRNNlF6WDhqUFVjanBJR0picUl3TDhBRCtSWUc1Vlp5dHQ1?=
 =?utf-8?B?MGk5VFp5WDBDTFZjMHZnRWJtR3VjUDRCdFFaWmN5dllYRDNkSmx0MW0xOFg3?=
 =?utf-8?B?cW5ieElLTUxDU2VEMEwxV2tCSDZvc3lRZTFHaXM5VEhZTmlkeldTNkh2elFG?=
 =?utf-8?B?RUNHUGdHdVI3MEsrU2x4Q3dRY3RYdklnSUhYbUhJTFRWaHpWdUY5WUtlMFU1?=
 =?utf-8?B?d09vL3F4UC8vUUx3K3lqV0sxTG94ZlhaUTlKbGJpRVVPYmR6WkZ5ZmZXRlVH?=
 =?utf-8?B?TjlJVzhhZi9mQk9EVWRMZTZwajk0RkhBdUNlWVM0cU1sNXJtZFpLcU9hVVBT?=
 =?utf-8?B?UXNWb0JyZ3piOEU2aVJ1VUYyL0pKRFJIbktKUTNDT29MK2h2MXdpa1BxT3My?=
 =?utf-8?B?VFRlSEJiUlBzTjNTZGhXU2p6c1cwcFhDYXFYb0toNnRyeENMRjlhaWVqaVZw?=
 =?utf-8?B?d08rRHJxMUE2ckhjYTl5VGVpb0xpdTgvRlpKVVBici9nUk9wMGtJTVpTU2NH?=
 =?utf-8?B?UDhScXJIWFBYWUF2eXNXSGdHOGlzelQ3bHVrZzFYQ2pnL3F0VFpzdVliak9n?=
 =?utf-8?Q?7wgwxb3LZ0/q1F10Dm1zXCtSp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43878047-4e11-43b4-11c2-08dce153b442
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 13:28:00.3666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QYj1yzdpsZKJYzOMl34ENv2j0AP3flGV+BBTtLgjPg4Hu0vi/iocdVWXd1YWnGNU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6547
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

Am 30.09.24 um 15:22 schrieb Tvrtko Ursulin:
>
> On 30/09/2024 14:07, Christian König wrote:
>> Am 30.09.24 um 15:01 schrieb Tvrtko Ursulin:
>>>
>>> On 13/09/2024 17:05, Tvrtko Ursulin wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>
>>>> Entities run queue can change during drm_sched_entity_push_job() so 
>>>> make
>>>> sure to update the score consistently.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Fixes: d41a39dda140 ("drm/scheduler: improve job distribution with 
>>>> multiple queues")
>>>> Cc: Nirmoy Das <nirmoy.das@amd.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Cc: <stable@vger.kernel.org> # v5.9+
>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/scheduler/sched_entity.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index 76e422548d40..6645a8524699 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -586,7 +586,6 @@ void drm_sched_entity_push_job(struct 
>>>> drm_sched_job *sched_job)
>>>>       ktime_t submit_ts;
>>>>         trace_drm_sched_job(sched_job, entity);
>>>> -    atomic_inc(entity->rq->sched->score);
>>>>       WRITE_ONCE(entity->last_user, current->group_leader);
>>>>         /*
>>>> @@ -614,6 +613,7 @@ void drm_sched_entity_push_job(struct 
>>>> drm_sched_job *sched_job)
>>>>           rq = entity->rq;
>>>>           sched = rq->sched;
>>>>   +        atomic_inc(sched->score);
>>>
>>> Ugh this is wrong. :(
>>>
>>> I was working on some further consolidation and realised this.
>>>
>>> It will create an imbalance in score since score is currently 
>>> supposed to be accounted twice:
>>>
>>>  1. +/- 1 for each entity (de-)queued
>>>  2. +/- 1 for each job queued/completed
>>>
>>> By moving it into the "if (first) branch" it unbalances it.
>>>
>>> But it is still true the original placement is racy. It looks like 
>>> what is required is an unconditional entity->lock section after 
>>> spsc_queue_push. AFAICT that's the only way to be sure entity->rq is 
>>> set for the submission at hand.
>>>
>>> Question also is, why +/- score in entity add/remove and not just 
>>> for jobs?
>>>
>>> In the meantime patch will need to get reverted.
>>
>> Ok going to revert that.
>
> Thank you, and sorry for the trouble!
>
>> I also just realized that we don't need to change anything. The rq 
>> can't change as soon as there is a job armed for it.
>>
>> So having the increment right before pushing the armed job to the 
>> entity was actually correct in the first place.
>
> Are you sure? Two threads racing to arm and push on the same entity?
>
>
>     T1        T2
>
>     arm job
>     rq1 selected
>     ..
>     push job    arm job
>     inc score rq1
>             spsc_queue_count check passes
>      ---  just before T1 spsc_queue_push ---
>             changed to rq2
>     spsc_queue_push
>     if (first)
>       resamples entity->rq
>       queues rq2
>
> Where rq1 and rq2 belong to different schedulers.

arm/push must be protected by an external lock preventing two threads 
pushing into the same entity at the same time.

That's what this misleading comment from Sima we already discussed 
should have meant.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>
>> Regards,
>> Christian.
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>           drm_sched_rq_add_entity(rq, entity);
>>>>           spin_unlock(&entity->rq_lock);
>>

