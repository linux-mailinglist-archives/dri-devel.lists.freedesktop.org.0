Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F64938E25
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 13:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80AA10E105;
	Mon, 22 Jul 2024 11:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VUcyjK71";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9916210E0B1;
 Mon, 22 Jul 2024 11:41:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rdz0fr4UayylmjTWA+AbDt4RDgZpYXZeWTBMmoy3lkzlmnpdh31+KqX63faDsnBq86yZD+zKyZSUS+Gm31Pc8tgPP0GtvxGkr0UvpZZ7xjntwJlARZZXo2A/Dxrzb/YivIvbkzvu1P1LxDheOyssOfoA9NzufEJxupea59qBtrqZjfuo9CXGhHRWVip/MjEA+0L1KX09FpxZMA9lK3ZWKxxsXcxkbzp2RP0fNs8hXAmTHCee0bYSZmIQtlfJC/SB1RogEQlOI+4KG8w2CIajgOlnAF4pekjviNiKB1UkZvR2U1oFyCv0s+tYXXTkGHrN70ScwrAqh7FBrrtKppwdtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86fFvKqYdacM2kWslQoR3U2tu5WMnX15EdsfQ8zIK/Y=;
 b=n/Ck9xZByyyoLcwnNVy9b/HdriGHvCTXFrQWXVApPx037pmD/ZOaxGlKDQB5fMru/5oHvnE4RON1QotTvJJYYLC6DjI/NYHtzHZLDQmhw16EO80X6P64DD/N1aknAtgZaKhj+qQpKZGXyzyGnH1EMSfsoPxIpwtTzni7IhUMNX7fQ/G1AyI2gc+LA7iCQQa3A+fcTh6WmK07HYdjTO0grrfkgd8PvB3Jss9FqTWlb5J91mAkUsqr9+MimGW9TrZTPoo6OrPm8jPCTWDc/3K8jV+2xi3IC+VOed7gNDYcAyBBh6jUqb0hFowkw9WMIVIPbSKHqnaCBOk1d4GVR1lgfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86fFvKqYdacM2kWslQoR3U2tu5WMnX15EdsfQ8zIK/Y=;
 b=VUcyjK71XSwZUSM/6TH2XcprmaYLRgxJh0rYe/upxNsBx7vjW6fPgSI8iext4JwuCtegLa0H5NO346CM5Xz/rIGp2uDkBcjh2jQOmiWRqk/+Uia8RBFUa1cpQOcH7HnlBe+A+ObfnpLRb6QagwrkFDefqRc3lYHlXERU8xRks0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by CY5PR12MB6228.namprd12.prod.outlook.com (2603:10b6:930:20::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Mon, 22 Jul
 2024 11:41:31 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3%4]) with mapi id 15.20.7784.017; Mon, 22 Jul 2024
 11:41:31 +0000
Message-ID: <2c3a79fb-4fdb-4c2d-806f-ceeed8116043@amd.com>
Date: Mon, 22 Jul 2024 17:11:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/buddy: Add start address support to trim function
To: Matthew Auld <matthew.auld@intel.com>, Alex Deucher <alexdeucher@gmail.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, alexander.deucher@amd.com, frank.min@amd.com,
 marek.olsak@amd.com
References: <20240704083008.870021-1-Arunpravin.PaneerSelvam@amd.com>
 <CADnq5_OcuKoZYizbeU_RGPaWYvTpxGMPWg6xOXaPASBMYb5kig@mail.gmail.com>
 <635ee761-13a5-413e-9953-cfb8c6d3cc0e@amd.com>
 <67ca2d5c-a762-4627-94d1-532b0e3d2100@intel.com>
 <f4027aee-1ff2-4f0d-8230-6f6b2e101f78@amd.com>
 <9fce9f74-ebbb-4763-9f87-218055e61654@intel.com>
 <dad0c7b4-2dc7-4c2c-bc75-ff70ead452e3@amd.com>
 <72c98414-3d17-4f00-85c3-2e584757c85b@intel.com>
Content-Language: en-US
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <72c98414-3d17-4f00-85c3-2e584757c85b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::26) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|CY5PR12MB6228:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dc9b6d5-3814-4c2b-0f43-08dcaa433b18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXgzVFBQSXRsZU12Sk8wWXhrOG9Tb09idkh1Q2pkL2dpV0FMR1BKTzFKenRS?=
 =?utf-8?B?VnA3b25mdEU4UXNwUjNZQWJwZm52NWFWRW5rdmNTNXo3aUhERVNKeVhDL3Jy?=
 =?utf-8?B?aU1CeXRWWGZoTjdRYXRTVG9zYmptU1ZFYndDaXpQbkprSEdmZFBHVVpWc3I1?=
 =?utf-8?B?VGcxWTFkUGZ4YllELzUvYTYvMkYzOVowUWhFTGNwaHFPbm9lT1dLRldkMGpU?=
 =?utf-8?B?SEcrRWd4QmFicEN4R2N4MHRUNjFoYnhGN0hsU1NaQ1pjZDh2MGNtZXNaUzF5?=
 =?utf-8?B?MUFzcXp2RlJLQjNocmx0YWswemJKTlVYMDFnTVg1cm5lT3VydTNDb0R5Q1B6?=
 =?utf-8?B?MHlWTWFtazU4OE40YzRMSFM5aDdWNGUxQ01BTkVTZjVKYVN2Nm5OTGNLNDAr?=
 =?utf-8?B?Ti9iekg2alFtSkFJUHRaV2htc2pKMmlKV2M3UzY5OWU2NEt4WEFQZDhnSW1h?=
 =?utf-8?B?aEtxZ1NwUDZVMW9ka1Y3aTR3Z2RLNWVYS3kyYngrSU5UM1M0N21JMG5HWk12?=
 =?utf-8?B?a0N2Tmc2U1JzeUhkakNieGhIOWF3czNKOHlNV3pJNXBVVVI2cWxvSGZDdXFT?=
 =?utf-8?B?S3g4Wk1UWEJTTHpJTVFTQVFtNDlWckpvVVNUZkNVQkxJZld1dlpMc0RPaFpQ?=
 =?utf-8?B?dmJnYVhVVDh2NlRSQVdQcTFzKyt2UXRKK1B1cHJqc1cvaDNvS2t6T3ZzRzhl?=
 =?utf-8?B?ZjJrdEJtOWpIUHFZMDNLVyt4ZUs0eVVGcWZNT250VTRnM0RnZUFNU0lqYUF1?=
 =?utf-8?B?MDdWNDhvRVZWZmxjSDgzcS9ZTS9POGZ0djUxTS80QmFHT05pTnVyYzFxL3BO?=
 =?utf-8?B?S0lMRDF5SFpHZ3BVTnlVWlZ3VEw2dzUxYWcyUVc2MzQzalJkbkRzU3lOaWNz?=
 =?utf-8?B?bUxZT2dXZHJRZWVNS2NzNVBXc0pNdVc3NjIvTjk0MEU1MGhjV05xVWtUbUFm?=
 =?utf-8?B?Rnl4OUl1L3lTR3o0dXZ5TDN4M2Q4dFhPemdjd2tNTlBvNVpVYnZuQmVSYm5Q?=
 =?utf-8?B?U3Q1Z1Y5STl5STlZM3pUMzZZS29vR0NQNE1IV3lFbWNBQ0FJV3VHN2pyZE5m?=
 =?utf-8?B?TzB2REdJUGdGSldKWnFnbUszQ3V5YUgwZm1CVUJMSVFHQ1oxRDE4R3UydU5T?=
 =?utf-8?B?ZWd5ck9RMkFENkZqanRKOW9YRDg0WkN2UlZEU3B5akFwRkFXSk5oNmF6aDdJ?=
 =?utf-8?B?c1M3NDAweEI0NUw0aExUUEhZRkNoNEtCVWlLV2VXUXNmWkFaMDlYSTdwMnhh?=
 =?utf-8?B?RzZqaGlwQ2JFMFFqL3NlU0dYdW9WWENJdHQ5TXViY3EreE10bFFZRThlT3hj?=
 =?utf-8?B?UVgvU1l3ekEvRVphdlNGL2xtY2x1R1JCOXRWbE9tVVV4NjdSeXBWWUwrc0c4?=
 =?utf-8?B?YkZ5NmxWRFRSRWFxS0k4RDZXRFQwME5uWjFlK0EwcnRYQkxHQXgxWTRvMHpZ?=
 =?utf-8?B?ZzgvQjFKdFY5UE8xMS8wQTVoUFFvOE82bGhvMnNBTHBhUjJzK0IxRjh4UWJt?=
 =?utf-8?B?cHhBWkIyTDA2dTdkNDB4T0JOSG5xMUkyVW1hVXNGMjJUZWN3WW5UVWFsaTlr?=
 =?utf-8?B?OWlJUUpiUFB5TVlpaWlzSENqOUp1YTkxK3Y5c3V6UDF5VTAvM0FOYVNzbUNH?=
 =?utf-8?B?V0VtWVBia291SmxubFc1ZkhhdTNOeTNYOEdkVjRwSmdYU3pTZWlUR0NCOXoy?=
 =?utf-8?B?ZDdBaXhNUCtEMmZ1dnhTQXJicEsrOHZKOGZqeS96WWU3STRvNVkySjNzNGxa?=
 =?utf-8?Q?jt2MkyZCFLxAuQy4WM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHhzK256eGM1c212ZVU1SURyUlRobGZJUnNnWlZ6V0hmUEc3RFZyNVFlRE1p?=
 =?utf-8?B?SjJqcFdaSFZiZHp3SDc2aVhQODB1M21GdXRObDR5NGNnRlZrckhMWFhjRlln?=
 =?utf-8?B?ekRnZkhzNXhnd0tzY1RVdlFSSVRTd3ljcUxtUXZIeFR6NCtvQzU1Nk1TODV2?=
 =?utf-8?B?d2ltd0g4ZFM5ZXhpcDNVSXpDNXMybGs0aEVXTFg3TlpUM2N1c0RjVCt6RVUz?=
 =?utf-8?B?VHdMNW0vSzFZQjhMYWhIaXlVTk82a3pxVStDa05oNlduL3JKZ1o3NkFLZVBz?=
 =?utf-8?B?dlJweWNpWTJXSmljWHJaWU56dFc0Rjlva2d3KzR5OGFvNXlDcVJja0pjR202?=
 =?utf-8?B?TUR6a2RDUXhXZlRKVjNYaklwdFVrTS9pS0s4TzNBOXJNZXZtRE5jcEczRDhE?=
 =?utf-8?B?eGNHM3YzOGVyVVgwcVZ5aDl1ZU4rTWFVc1ByNjNFT3E5eFRCS2h0bWV2cG51?=
 =?utf-8?B?WjEySHRvVDVxRHdJWkM4WjJTZzN3YXFRMEVRazJZZXlvd04zSThSR0RHeDVy?=
 =?utf-8?B?d05ZMW5ReDRrTVRBc2VGak0xTkFnRjlFUVdnSnd4SDBjQkJNOGJzR2s0emwz?=
 =?utf-8?B?dHJxZ25aT2MvN0h5TDdmZWJ2RTIvQytNN0pwRUtPZ0RMUkdHZWFETW0xengw?=
 =?utf-8?B?c3Q5TzJNcS9Td0lJYjBuN0lpSmpaUFRFQ2ZoV01XcXdGOEVtWThhUVA4aHpi?=
 =?utf-8?B?S3B4azlzbk8wdFgwMEFjS2UzL1JMM05DU1JKTkpHWmN3a1hGMWhBQTdyZHJz?=
 =?utf-8?B?bitKSHF3T1ZVTVJ5U2NSSnFNU3JvTVphbHB6aWxsSHBBZ1RwRzhCSjNrakxv?=
 =?utf-8?B?cXdyVnpPMFdhVEJZQ0I0TXRNTzF6MlMyTWZraXJNeUljRkNYdE9Hd0FvRytZ?=
 =?utf-8?B?ejRuZFhSOU90OUk3N2ZkOU5OL2preVZHcFBmYmw3U0dES01mMXJKY1N3RW01?=
 =?utf-8?B?Q2RIWHpGVUhKZVZIUXYzaklRVThlUktVUW9BWWlSS1EyeW5CN0dlejZDM29x?=
 =?utf-8?B?YUQzVStvSU9pcWJsbFU5dVN3anErckFidUlRdlBCZ3JrSmhZblp0RSsyeDkz?=
 =?utf-8?B?QmtpNmsra1VLRERLN2JBckFGL2lGSitDcThUR1NTYXlLYzRXV0FkNU9kc05W?=
 =?utf-8?B?THBPYk1FTkxTTURrVjg2MWEvMXZjSkRXc2NpSFZqdi9QcUFOTXUvM3hENklx?=
 =?utf-8?B?MDQ5Yk1BM1hxR29TSUJzdnRKOHZId3ZxZDBnL2FEOWxYZzJiUjRLQUFvQkVh?=
 =?utf-8?B?bnhLZTZZV0ZuV1RNSUxWcU1BcmVobzEwVkpsWS83Q1piQ1M0azNhM21kdXNn?=
 =?utf-8?B?T1RKTVd3S0hTSFZlcDZYQWJvbVVVTFR1KzFkMk1SMk5na3oxWHJESUxJdjBR?=
 =?utf-8?B?dDI1RC9PK21aTnpBUFRscEFTUFhyaUEyNGU4Tzkrc1dFcTMwREFpWHJ1a0tE?=
 =?utf-8?B?ZkZHVlB1T3FvcldodmNKUDFTQURRSzZYaXZxZXVFWFV6Nk9uZEl5Z2FqYTYv?=
 =?utf-8?B?TVoxL2FVdnB3T3llMDJVQm0zRk9ScG5wSFIzOUdKb0R5aEZJWFJmemtsSEwz?=
 =?utf-8?B?amRFK2NFT1hMVlJucTFralNDNVlVbXNVZFNlT3pFZ0xDaTlQWktzV2RnUDZE?=
 =?utf-8?B?K25KKys3Nkt5ejJDNWcydW9Sb0JMWUQySTNMSVZSU3JZNVcxOVZCZWROcFpx?=
 =?utf-8?B?R21hQXRNNGlDVnZmeU5QUXBGYTlSaUE3T1FRdlNGRVdkcWdBSE9BVDl1WVR0?=
 =?utf-8?B?TklYTWdjaXc4V0ZMeThiN0hrSC9iYmg5ZmtJYTY0V1hOQjJIeGxaOElQd3hV?=
 =?utf-8?B?SUp0ZXdMQ0xEbElzSnovUTZGeWljYWFrOXNHWlZ5R2JwK0kzb1g3WWErRVl2?=
 =?utf-8?B?OUlRaG1Td0JRTm1TeWdWL3dYaG1iSkdOZUtpZkJOMU5FQ1l3R1R1MWY2Sllw?=
 =?utf-8?B?Q2V3Nmtncm8rMURPdDJoclN1TjY2RDQ0Tnd2QWtyUUdTS01PYnJhSmZ0OGd0?=
 =?utf-8?B?SExFNlQxRWxTbXNDa01IeW9XTG4xeGJFOXE5VXNFL0Y5VC8wYW9meVFIVkRT?=
 =?utf-8?B?cEVtTmNPS1A0UlNIUUg1Mm1kWGpEdnVFRkY3R2E4WVp0c1hrK3BiT0ltbFdI?=
 =?utf-8?Q?a88EPlJxEN9sW6PYrkvA0n1m0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc9b6d5-3814-4c2b-0f43-08dcaa433b18
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 11:41:31.3982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUXPzwdR7kVjzHJKdzwIaLzqVqIQzZ1MxKxfsYcAhtiA319zK/6CHS4FSpOsWrGFB7pIyU8HrUGMXZxIIEZMgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6228
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

Hi Matthew,

On 7/19/2024 4:01 PM, Matthew Auld wrote:
> On 17/07/2024 16:02, Paneer Selvam, Arunpravin wrote:
>>
>>
>> On 7/16/2024 3:34 PM, Matthew Auld wrote:
>>> On 16/07/2024 10:50, Paneer Selvam, Arunpravin wrote:
>>>> Hi Matthew,
>>>>
>>>> On 7/10/2024 6:20 PM, Matthew Auld wrote:
>>>>> On 10/07/2024 07:03, Paneer Selvam, Arunpravin wrote:
>>>>>> Thanks Alex.
>>>>>>
>>>>>> Hi Matthew,
>>>>>> Any comments?
>>>>>
>>>>> Do we not pass the required address alignment when allocating the 
>>>>> pages in the first place?
>>>> If address alignment is really useful, we can add that in the 
>>>> drm_buddy_alloc_blocks() function.
>>>
>>> I mean don't we already pass the min page size, which should give us 
>>> matching physical address alignment?
>> I think we don't need to align the address to the passed 
>> min_block_size value for all the contiguous
>> buffers, so I thought that decision we can leave it to the drivers 
>> and they can achieve that through trim function
>> in this kind of a specific request.
>
> I would have assumed it would be simpler to use min_block_size and 
> then trim the size, if it's too big? That would then also take care of 
> the try_harder case?
For example, if the required contiguous size is 1MiB and min_block_size 
is 256KiB, to perform the address alignment of 256KiB, we might need to 
over-allocate at least
to the min_block_size (say 256KiB). Now the size becomes 1280KiB and 
since the contiguous flag is enabled, we will round up the size to the 
next power of two and the size
value becomes 2MiB. Next, in trimming we should round up the block start 
address to the min_block_size. May be we can keep the above mentioned 
operations under the
flag combination DRM_BUDDY_CONTIGUOUS_ALLOCATION && 
DRM_BUDDY_ADDRESS_ALIGNMENT?.

At the moment, we cannot support address alignment for try_harder 
allocations since in case of try_harder allocations we first traverse 
RHS to allocate the maximum possible
and traverse LHS (here we align the LHS size to min_block_size) to 
allocate the remaining size. May be in case of 
DRM_BUDDY_ADDRESS_ALIGNMENT, we should first allocate
LHS satisfying the address alignment requirement and then traverse RHS 
to allocate the remaining size if required?
>
> Also how are we dealing with the multi-block try_harder case? AFAICT 
> we only allow trimming single block atm, or is it not possible to 
> trigger that path here? Or are we handling that somehow?
not possible to trigger that path here. only when we either 
over-allocate the LHS size and pass the multiple blocks to the trim 
function or implement the above mentioned method.
>
>>
>> https://patchwork.freedesktop.org/series/136150/
>> We are getting this sparse error from the Intel CI. Do you think 
>> these errors are introduced with this patches?
>
> I think it's safe to ignore, there seem to be other series with the 
> same thing.
Thanks.
>
>>
>> Thanks,
>> Arun.
>>>
>>>>
>>>> Thanks,
>>>> Arun.
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>> Arun.
>>>>>>
>>>>>> On 7/9/2024 1:42 AM, Alex Deucher wrote:
>>>>>>> On Thu, Jul 4, 2024 at 4:40 AM Arunpravin Paneer Selvam
>>>>>>> <Arunpravin.PaneerSelvam@amd.com> wrote:
>>>>>>>> - Add a new start parameter in trim function to specify exact
>>>>>>>>    address from where to start the trimming. This would help us
>>>>>>>>    in situations like if drivers would like to do address 
>>>>>>>> alignment
>>>>>>>>    for specific requirements.
>>>>>>>>
>>>>>>>> - Add a new flag DRM_BUDDY_TRIM_DISABLE. Drivers can use this
>>>>>>>>    flag to disable the allocator trimming part. This patch enables
>>>>>>>>    the drivers control trimming and they can do it themselves
>>>>>>>>    based on the application requirements.
>>>>>>>>
>>>>>>>> v1:(Matthew)
>>>>>>>>    - check new_start alignment with min chunk_size
>>>>>>>>    - use range_overflows()
>>>>>>>>
>>>>>>>> Signed-off-by: Arunpravin Paneer Selvam 
>>>>>>>> <Arunpravin.PaneerSelvam@amd.com>
>>>>>>> Series is:
>>>>>>> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>>>>>>>
>>>>>>> I'd like to take this series through the amdgpu tree if there 
>>>>>>> are no
>>>>>>> objections as it's required for display buffers on some chips 
>>>>>>> and I'd
>>>>>>> like to make sure it lands in 6.11.
>>>>>>>
>>>>>>> Thanks,
>>>>>>>
>>>>>>> Alex
>>>>>>>
>>>>>>>> ---
>>>>>>>>   drivers/gpu/drm/drm_buddy.c          | 25 
>>>>>>>> +++++++++++++++++++++++--
>>>>>>>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  2 +-
>>>>>>>>   include/drm/drm_buddy.h              |  2 ++
>>>>>>>>   3 files changed, 26 insertions(+), 3 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/drm_buddy.c 
>>>>>>>> b/drivers/gpu/drm/drm_buddy.c
>>>>>>>> index 94f8c34fc293..8cebe1fa4e9d 100644
>>>>>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>>>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>>>>>> @@ -851,6 +851,7 @@ static int __alloc_contig_try_harder(struct 
>>>>>>>> drm_buddy *mm,
>>>>>>>>    * drm_buddy_block_trim - free unused pages
>>>>>>>>    *
>>>>>>>>    * @mm: DRM buddy manager
>>>>>>>> + * @start: start address to begin the trimming.
>>>>>>>>    * @new_size: original size requested
>>>>>>>>    * @blocks: Input and output list of allocated blocks.
>>>>>>>>    * MUST contain single block as input to be trimmed.
>>>>>>>> @@ -866,11 +867,13 @@ static int 
>>>>>>>> __alloc_contig_try_harder(struct drm_buddy *mm,
>>>>>>>>    * 0 on success, error code on failure.
>>>>>>>>    */
>>>>>>>>   int drm_buddy_block_trim(struct drm_buddy *mm,
>>>>>>>> +                        u64 *start,
>>>>>>>>                           u64 new_size,
>>>>>>>>                           struct list_head *blocks)
>>>>>>>>   {
>>>>>>>>          struct drm_buddy_block *parent;
>>>>>>>>          struct drm_buddy_block *block;
>>>>>>>> +       u64 block_start, block_end;
>>>>>>>>          LIST_HEAD(dfs);
>>>>>>>>          u64 new_start;
>>>>>>>>          int err;
>>>>>>>> @@ -882,6 +885,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>>>>>>                                   struct drm_buddy_block,
>>>>>>>>                                   link);
>>>>>>>>
>>>>>>>> +       block_start = drm_buddy_block_offset(block);
>>>>>>>> +       block_end = block_start + drm_buddy_block_size(mm, block);
>>>>>>>> +
>>>>>>>>          if (WARN_ON(!drm_buddy_block_is_allocated(block)))
>>>>>>>>                  return -EINVAL;
>>>>>>>>
>>>>>>>> @@ -894,6 +900,20 @@ int drm_buddy_block_trim(struct drm_buddy 
>>>>>>>> *mm,
>>>>>>>>          if (new_size == drm_buddy_block_size(mm, block))
>>>>>>>>                  return 0;
>>>>>>>>
>>>>>>>> +       new_start = block_start;
>>>>>>>> +       if (start) {
>>>>>>>> +               new_start = *start;
>>>>>>>> +
>>>>>>>> +               if (new_start < block_start)
>>>>>>>> +                       return -EINVAL;
>>>>>>>> +
>>>>>>>> +               if (!IS_ALIGNED(new_start, mm->chunk_size))
>>>>>>>> +                       return -EINVAL;
>>>>>>>> +
>>>>>>>> +               if (range_overflows(new_start, new_size, 
>>>>>>>> block_end))
>>>>>>>> +                       return -EINVAL;
>>>>>>>> +       }
>>>>>>>> +
>>>>>>>>          list_del(&block->link);
>>>>>>>>          mark_free(mm, block);
>>>>>>>>          mm->avail += drm_buddy_block_size(mm, block);
>>>>>>>> @@ -904,7 +924,6 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>>>>>>          parent = block->parent;
>>>>>>>>          block->parent = NULL;
>>>>>>>>
>>>>>>>> -       new_start = drm_buddy_block_offset(block);
>>>>>>>>          list_add(&block->tmp_link, &dfs);
>>>>>>>>          err =  __alloc_range(mm, &dfs, new_start, new_size, 
>>>>>>>> blocks, NULL);
>>>>>>>>          if (err) {
>>>>>>>> @@ -1066,7 +1085,8 @@ int drm_buddy_alloc_blocks(struct 
>>>>>>>> drm_buddy *mm,
>>>>>>>>          } while (1);
>>>>>>>>
>>>>>>>>          /* Trim the allocated block to the required size */
>>>>>>>> -       if (original_size != size) {
>>>>>>>> +       if (!(flags & DRM_BUDDY_TRIM_DISABLE) &&
>>>>>>>> +           original_size != size) {
>>>>>>>>                  struct list_head *trim_list;
>>>>>>>>                  LIST_HEAD(temp);
>>>>>>>>                  u64 trim_size;
>>>>>>>> @@ -1083,6 +1103,7 @@ int drm_buddy_alloc_blocks(struct 
>>>>>>>> drm_buddy *mm,
>>>>>>>>                  }
>>>>>>>>
>>>>>>>>                  drm_buddy_block_trim(mm,
>>>>>>>> +                                    NULL,
>>>>>>>>                                       trim_size,
>>>>>>>>                                       trim_list);
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c 
>>>>>>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>>>>>> index fe3779fdba2c..423b261ea743 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>>>>>> @@ -150,7 +150,7 @@ static int xe_ttm_vram_mgr_new(struct 
>>>>>>>> ttm_resource_manager *man,
>>>>>>>>          } while (remaining_size);
>>>>>>>>
>>>>>>>>          if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>>>>>>>> -               if (!drm_buddy_block_trim(mm, vres->base.size, 
>>>>>>>> &vres->blocks))
>>>>>>>> +               if (!drm_buddy_block_trim(mm, NULL, 
>>>>>>>> vres->base.size, &vres->blocks))
>>>>>>>>                          size = vres->base.size;
>>>>>>>>          }
>>>>>>>>
>>>>>>>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>>>>>>> index 82570f77e817..0c2f735f0265 100644
>>>>>>>> --- a/include/drm/drm_buddy.h
>>>>>>>> +++ b/include/drm/drm_buddy.h
>>>>>>>> @@ -27,6 +27,7 @@
>>>>>>>>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION BIT(2)
>>>>>>>>   #define DRM_BUDDY_CLEAR_ALLOCATION BIT(3)
>>>>>>>>   #define DRM_BUDDY_CLEARED BIT(4)
>>>>>>>> +#define DRM_BUDDY_TRIM_DISABLE BIT(5)
>>>>>>>>
>>>>>>>>   struct drm_buddy_block {
>>>>>>>>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>>>>>>>> @@ -155,6 +156,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy 
>>>>>>>> *mm,
>>>>>>>>                             unsigned long flags);
>>>>>>>>
>>>>>>>>   int drm_buddy_block_trim(struct drm_buddy *mm,
>>>>>>>> +                        u64 *start,
>>>>>>>>                           u64 new_size,
>>>>>>>>                           struct list_head *blocks);
>>>>>>>>
>>>>>>>> -- 
>>>>>>>> 2.25.1
>>>>>>>>
>>>>>>
>>>>
>>

