Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D6B92A5A6
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 17:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C46810E384;
	Mon,  8 Jul 2024 15:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eoJvrNDc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2309D10E384
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 15:29:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmTUuMOYIUGs4+y8O4Kz2WIom2J4uDwkBr3ygx+0NmKMR6ZPFr7CDhOETAzikL0O3x3bjGCA4KYNNoqITerjwIN2Tmezlt2PrBkesniBkR7nRTPM1OWg9vRy+89sBMUngzsmOyE27kU7pvTF2fFd7B2KSiHOWA6vVJbMlxsPTPvUbPiXS/1tP8tWyYjPbkXyydIFWp4K6eGrRjCyJTyB6reUYj6T+hx9WgFGF7zsTRKFSLgeR4pwB+9xkBwOIi0OhC5fAv6ds9mr8MO8fgmVeLvjrmMjLrHgpY7jyU8YJtNQ2alPQUOywA056oJS6Yi11rGq20eB60x519KtONkeKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAuZBirSdyeoXtC2AbQzV/TiR2HQYb368K3PA/WDZkM=;
 b=X4rG8c2S71fNldUFAfvqdBt4E3OwSOvYlV2MNFR0S/URK28JsefVZFhaOfY+LTL2fPHR5XeUrN0un+nyL0sYZ7OhV3/e/wA2p2uJueCycdl/5h0fwbV9tJIuMfGxPaCSVstKqzByqc8qEMBE2dloEzfQbilv6eLCLdehuj+k0omHs35wjGNOxwZwnBdqvz2mBV5Gz9P2E5j2eYeUbdjL251rx5O73kUtSwJnB+PT3DwlgIhq6beYBwgZNaID9YNwWE/AzaiFi1AN9fNH3w/dAICmULabwcHgxDCKgUlcUvbJxvsJHRs/b3Acjj/4PMwMNcjx9M8EuSXOgVz4bTbPrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAuZBirSdyeoXtC2AbQzV/TiR2HQYb368K3PA/WDZkM=;
 b=eoJvrNDc3oMPTQvKNLY4VbgoR5wzvGms44yy+S47s+69L3cJkYb2t+5EHf81FZFBMiLqgUCmxURvsQPtYvJAznOmRAojqYZ0tyN/4QxpmdAu31M2x0Plaxzj7qhi/V3Whr2gNkktFdRK/d3yV1ym1kncvvEqOu6Z30TY4E5Si8M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6241.namprd12.prod.outlook.com (2603:10b6:a03:458::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Mon, 8 Jul
 2024 15:29:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.7741.017; Mon, 8 Jul 2024
 15:29:36 +0000
Message-ID: <e356d7e2-33db-4aed-bfee-8e0828372527@amd.com>
Date: Mon, 8 Jul 2024 17:29:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: The TTM LRU-walk cherry-pick series
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
References: <0db8246a59e67c8e740110c6cfdd8339bec97f32.camel@linux.intel.com>
 <ZowEX6tlXJJafTDZ@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZowEX6tlXJJafTDZ@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: b643ceb6-40c7-4d6a-433f-08dc9f62c61b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHRZd21hbWdTb05saUJ5d0lVbDkyQjFYbUF4ZGxkYlRpWVY1VnN0NUFDMzBO?=
 =?utf-8?B?ekJsWnBYN2l3aTdoNnFPSEE4ZEN5ZDJtR1h6RDFMLzZPeDVzdW4xVWN1bG11?=
 =?utf-8?B?K0lVK2k0alhPUkFLVVBnOVBnUkh0dG55YjF4NFk2SDQrRXVJN3FURDQwU1E1?=
 =?utf-8?B?amgyQlQ3cTg3cDZVczNRN2xnUHRkemhoN0JLOE13eGMyZjJrWG5tYU8vVWFv?=
 =?utf-8?B?NnhGbzdMNi84ZWQ4WjFMKzVpTHRvRWRNU3VqRldlOVY5NGM5UU9VYnU5OGlY?=
 =?utf-8?B?TWRZU0ZUZm9HcDJjckUvNEJISm5mcGlNN2ZYR1o2MERpV3U2WEN5YnUvbjVk?=
 =?utf-8?B?dGsycUs5akFHSHJDM2tqcU5NY1NNRG82Tk5RYklpTFJLQmpoTHVlRXNnUzJm?=
 =?utf-8?B?OUZJZlRrZWNIZkdRQ09uYUR0YWVJSk1ucWNDWnJ1TEIxMC81Vm4rYkdueis3?=
 =?utf-8?B?eXlxWlAyMzR5NzBMU2FKb3JJeFFsRVMwZVU5VDlFUktqRFBJY3ZYaTR0ZmRJ?=
 =?utf-8?B?M3UyNjRpQlZwUHhiYUpLQ0RtMDJ4UGRJdUxhRUl3ajRsbHNEWHphb2J2WXRX?=
 =?utf-8?B?R0p4dE56cW9YaHowU0F4dXlVcDJJYmxaYUxQWnh0UTJESUNSVUxoczdMTWdu?=
 =?utf-8?B?T29QZmVKNzhUeFRJZ0VCOGpsS1lKUjhqYm1FUUFkOHpMakZRVWdIZnRTMTBh?=
 =?utf-8?B?SG44cTkzRkZtb2paNHlkdG5zVVREMXlmNGk0Uml3VlNqZkx5QytSREo0V2FC?=
 =?utf-8?B?Rm91eTM4dzhWYjVJRXAvZEdFQlZpczQ4NS90bGxDSkdHSmZIVU04czdGN3h1?=
 =?utf-8?B?Q1ZmbVFuaW8rcVJGSDR5aE4vcitwM3owUVNjUU9NRDlEejdZNTV5QjBDa2hQ?=
 =?utf-8?B?TkluU1h2ZDUxZG5kTUQ5UjBVeFZnbmNuc0lyZktML2wrTjlqcUFpWVNjWDBD?=
 =?utf-8?B?S1MwNEdpU1QyaHorMncxSE85ZmE4U3ZUMEJWWFZxNmNhMHJ5RGN2Ri8wM1lL?=
 =?utf-8?B?NEljWkowOXRXZkUxcG16b0RQamJ6VXlRaGNGS2RZNVkrQ2hsN283MFYrc203?=
 =?utf-8?B?NUhOZkc2UGVnWkR1RTRaRkpoRE40Y3g5UUcyRUFkK3hOVWVodDZtbnpMS1Zn?=
 =?utf-8?B?UThJc2ZlQXVKV0szc2tFb09wVkZpUkw0TWZGUTBGSS9ZMk9wUkE5TStNMDRt?=
 =?utf-8?B?WDl4ZHhLdTNpSmxlVzVGU2l5YUYwVlc3YnVZck9RTUJWVmRBVjdITng5dFV0?=
 =?utf-8?B?WHNvajFFcmlhMndyNVRJZnZNMlR4czlOOUQyMGxJQ0M0bjJnR3ZkYzVjTVJ5?=
 =?utf-8?B?bkpVcHg3ZnpuWWY4aC9jemdxeG5KU011TUhLM051eldRMzJ4bmlpamViR0F3?=
 =?utf-8?B?dDNNSlEzaGtldzRGWW1LU3BoeGhkWi9KUk9uRFU1QUkrTXh3UWVCeGhmUXIw?=
 =?utf-8?B?dkprc2RIeEpMUWdwMjRsY0NUQUxWdlRtZFhpMzBTOUdFaGUraUF2djBNa1Rp?=
 =?utf-8?B?NURVWTMwbktXRGVKZFpQemhxR1p3SWZLeE4vWllPV3VIRWZpY1c1eS81Z2Y3?=
 =?utf-8?B?aEF0MWFQV3QxYS85eE0wV1pnVVBNUTBwMzA3NzFEaFhBTmJtY0NsTzFDZVg1?=
 =?utf-8?B?dzNlbjlLaDFHTmlxL0dwRFRLRTJ5OERlN3NEL2hVRjErR2sraVpiTHZKUlUw?=
 =?utf-8?B?UEhzVWI3NkdsSjFMdFJzTnBOVTducVZKa29WQkpDZkdrVWV2WTFYbk9LSkpO?=
 =?utf-8?Q?NcYyf1WNqxldc+wDjM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVBIOC9idk1CZTNkMHIvdzFpOXc5dmpBOXpRZkxIUXFPZHJHQUNacEUxOFRa?=
 =?utf-8?B?NVlqNGl6UDcwSFp5TXRGVkFtUmQzaU01WlkyWU80R3NBazU0MitUY25Tc1Z3?=
 =?utf-8?B?NFdheDdISzZ5Vy9sMlc5MExSZlNpbENsT0RmK0JBejVLR1laelpXa25nbys1?=
 =?utf-8?B?UDd6bzdxYWF4dloyMHVoSUVuNDBqbFkxckxRTS9RL3UzYklXaGk2VWVSY3ND?=
 =?utf-8?B?VjZ4czVBdk1SbWd4cjhranc2bWZ6djB0azRVWnAvOHNrWGJQWEMyOXFlMWh0?=
 =?utf-8?B?ZkEvZW5CNUY3UW9SYXVmc2hqK2xzS3M0SnIzZzE1Y2wrRER6SU10Q1pRUUps?=
 =?utf-8?B?bzU3LzRBQXJHRUNXTHBLSWZJU1E4U3lLa1p0dXowb1lWSFFPcVY5Znhxbm95?=
 =?utf-8?B?MGQzbklKN0IxSGtUcnVod3RaYklXUWpqZHdxL0ZFZGpNVUh3eThrYXF0ZXJ6?=
 =?utf-8?B?ajlGcjRQZFNtVTJEMHdCUTdNeW9rck90MUk1ZzdMNFllTVFsb0tFaTVMdmZa?=
 =?utf-8?B?WUhCWlZ4S0pjV2dKTmp3U2htc0Q1TnV0QW40WTdmclFvL2R1S1g0cGlhaW1s?=
 =?utf-8?B?aDJnYVROS29OZmNhaVQ1R0JuQ3RERThxSWJmRVdPZXZvT0VpTE5vcHdKT0Jp?=
 =?utf-8?B?R2lrNWhSUkVZSnd4T0pad0JjTDRoRGsvU0dRUTM3VHE2eEh4TEVvdDFhK2JB?=
 =?utf-8?B?T3p0VWZqYXk4MjRPY1FnTUM2TXY3MmpUelZhNXAxcU9qVlkwbkVnTHRGVDl1?=
 =?utf-8?B?VlNraVZRdFNUTWRWcU5PVCsxc3NqZVltaTM3UlgydzVOQVRDK3Z1SmVIaHZY?=
 =?utf-8?B?UGdGTnZsQWxqNTAvRjdTMXN6M3JvNHhySEpXWGlsZDNPVTUyTXQ3R29wSHBF?=
 =?utf-8?B?UFk2aStEL3VWWThnR2Z4dTAwQk1NY25zTzMraFFWT2VBd3p2b2dHZzlZTGN0?=
 =?utf-8?B?dVdrU0tESm1TU28xUXNTTFNpa1VmYnk1dmxMTWtMVTI0bUo3eUttbFZ2L2Yz?=
 =?utf-8?B?Rkd3dEhzMmtST1c2SnBPaWdjK3JLY3pXc2d5cVAxSDEwUExEeTJpNWcrY3U4?=
 =?utf-8?B?SFR4TFBZQmlBRlFoWHFldmxXa0o4L3ovdDBSdGN2M0Z0TG5MaW5CYWh5by9r?=
 =?utf-8?B?SEtNbXhmRXB3QW9VMEhETEgybDk4UGU3eUpZNldHYUQrTVlGVjFHS3hxS2RU?=
 =?utf-8?B?eXZxeVNGcGVHeDAwajhDOUNmQVJwUloxOTZ1a05qdXFKSHAzWlQ5M2YySGpL?=
 =?utf-8?B?ZHF3MkxXS0kvUU90N2dWdUpLdldNbktadEtaYktJTm15ajRVT292dndpVGxz?=
 =?utf-8?B?UWhDdEhJWnNVcnFhVmRkcldWNlRBOWFSMDVKMHVXRHhGakFyMTR6Q0xLNFlF?=
 =?utf-8?B?RUJtRzAzUGpmRDdqTW5HU3JuN0N1ZkFpbXBVeHhtQ2RPZk8xSU40MVdHaW9r?=
 =?utf-8?B?Z1dsWkdxakhzaGNPYVFTNFlMNjR4Y0o5dDVNd0laMThxL1Z0ZDhOMlJBdSs2?=
 =?utf-8?B?SHFyYzRuL3FhMmRSczBydG45a0VVVXRwaDNxYzBUSjhnZ2dUUEFyRWRMTFBi?=
 =?utf-8?B?d3E1KzhORlFCQnZac29jeUdUNWxpQ1M0VWVlb0FZWThjendJQ1lueFlFZzhV?=
 =?utf-8?B?b3RGbEVjTGZjYkZxa2d3VFdoQ1dHTFJpUTN6SlpibzlPVGJWYmlFRURkTTJ2?=
 =?utf-8?B?ejd3bjVJWUttQmU0cndRSWtwdUJYd1djYU5TeEVtbW82SzB6d2xiaE9sZTZY?=
 =?utf-8?B?UUMvQU8xU3JWa1JKSGpTWjZSWkVqVjR6cmc0VjY5WkV5NWNqUFAxYlpEWVcy?=
 =?utf-8?B?OWkyUEJRRERaTktaNnF3YlN2STZZaXVIcDIxTzByeTRma0FZNWtDMnRCUURN?=
 =?utf-8?B?ZzNheTEzSGtENXE2WWRrVm5XOGVvZkdnUDNMc2lkL2QzVXZ5OVJxWVBrYjQw?=
 =?utf-8?B?MWFQQnBTWlhUT3JCVE83cUFueTZNamFsYkd2c3FTTXpBZDZUTDBnVUROdm4y?=
 =?utf-8?B?OGVGaGMyZlNaQWJDalp0UFBYL0lwQy80VlhkamplYXdrL0RlMkpndWtIQVg1?=
 =?utf-8?B?N0NjQldEbWVVOUJZUEdnRVVvaHVwSFUvdWM0bE5HRTJxMmxWUWFFZlFTVDhG?=
 =?utf-8?Q?f85xEqOcsscX6Q779V7RBRkeP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b643ceb6-40c7-4d6a-433f-08dc9f62c61b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 15:29:36.1497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RlDy1HK9EVgOtCttT8hBE3RL/bJnMbl82Urd/qSYMn/uXf8y8TtZigJq8gAnvkk5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6241
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

Am 08.07.24 um 17:23 schrieb Matthew Brost:
> On Sun, Jul 07, 2024 at 05:49:16PM +0200, Thomas Hellström wrote:
>> Christian, Matthew,
>>
>> I think I addressed all review comments and a couple of anticipated
>> ones (s/long/s64/) in the swapout- and eviction patches.
>>
>> I'm heading off on vacation today, (4 weeks) so if something becomes
>> urgent in-between feel free to pick up, modify and merge.
>>
> I found a couple of nits in last patch of [1] but gave an RB as the nits
> can be fixed on upon merge.
>
> The series [1] is fully RB'd and CI looks good. I'm thinking we should
> merge this. If any bugs pop after merging feel confident that I can
> quickly fix them while Thomas is out. Also fine for waiting for Thomas
> to return too.
>
> What do you think Christian?

I'm currently working on testing patches 1-7 and if that doesn't show 
any immediate problems will push them to drm-misc-next.

The kernel build bot also complained about something in #8 additionally 
to your nit picks so I think we should investigate that first.

Christian.

>
> Matt
>
> [1] https://patchwork.freedesktop.org/series/135801/
>
>> Regarding the drm_exec trylock functionality I'm for as much as
>> possible that it should look like any other locking primitive trylock.
>> i.e. no additional tricks needed.
>>
>> Thanks,
>> Thomas
>>
>>

