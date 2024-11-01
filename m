Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C710B9B9527
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 17:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7211510E2F7;
	Fri,  1 Nov 2024 16:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fZHq+tz3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2080.outbound.protection.outlook.com [40.107.101.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253C210E036;
 Fri,  1 Nov 2024 16:22:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqLaHFtD3iTSbGZeXFRTHi41oozX47XowXL2KHZNmx0J1o5wabJD6vuU2oTnNs5PEB9G9Qc3DS0YkRzdshQFwlvvPs8yUrKbvT1n21/l9MUj/+q0CGmPBCsrU6SkBC0YoL4Dd3L4T0TQdRFYaZbfPimYqXr/8CrYW9LcyfKqGrJVTKJ4QyLTKq4lFnW/qB/AFe05EhzSmll3iI5rKIbI0VehQZP7rrnxx3kI+6Yh846TFiCDfRLMjGlDdtktHdQYooDuuqZzbX4692s8G/f88JQZTeTa2WJGXJxtaugRoL2cd98Z/kmcwFQX/37RrLfVF5joRUUq72k+P5QS2zzCWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uAjelOB4VOxy+rlR6xS9XziakUJvp2uotBbcWKDXtg=;
 b=tdKxL8KSgANomUoq/01IsJcO94KjgcE50XXt9X+PcCGVmQqmdDJskWLO/OsJ1qHHZVcqZGffMspjyd4l91K+6orodX75bm+vTtwzOhCkcmznqo4gTYhanTc65cH2ehv9+kVOKNsUK62g2YyRVJ9/wWR/90jOeQLoSwRTcwili7S4WdTSD18cQ0ZgfncIQ/JC6ddHCDW7jNVfhPIc/NTfgYyr6iBTYXBF2pncf+zivxSUylePlJadkZl8kbk32Jtq+w6R3LXnGKNTUZpzIiuN44bpJtDinuYJ0D5SWyLXR/hpcO5oLEsgDgMiOL4SOoKWeO9Mk8e6y1TAOq+VR5d49w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uAjelOB4VOxy+rlR6xS9XziakUJvp2uotBbcWKDXtg=;
 b=fZHq+tz3Gw43b/c/DM8lTbhrOcD4GAxg2ikCJQaT/l711T1QB1eazlJ5W0gixDn2CfTejlueBqnBMo+0x2XyiiR8Td34b6EotkhVJk5jYwKkh3Yi2OMv0iafwjqMyBoHVROoM7MOSw43afSgnq8Qg0ZvYpRvCvk+T3Xsrbj6SWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN2PR12MB4343.namprd12.prod.outlook.com (2603:10b6:208:26f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 16:22:13 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 16:22:13 +0000
Message-ID: <af5edb6c-3075-420e-b52f-05844c728180@amd.com>
Date: Fri, 1 Nov 2024 11:22:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] amdgpu: prevent NULL pointer dereference if ATIF is
 not supported
To: Antonio Quartulli <antonio@mandelbit.com>
Cc: Xinhui.Pan@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241031152848.4716-1-antonio@mandelbit.com>
 <00e9b1f0-7bc1-418c-8e67-e8f1893be665@amd.com>
 <34c84c6a-9b0d-4d04-9ce3-edf1bb850b2c@mandelbit.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <34c84c6a-9b0d-4d04-9ce3-edf1bb850b2c@mandelbit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0501CA0036.namprd05.prod.outlook.com
 (2603:10b6:803:40::49) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN2PR12MB4343:EE_
X-MS-Office365-Filtering-Correlation-Id: e2a85ae4-6038-4f3f-3bd7-08dcfa9157a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0R3ME1Jc0VYZ3BXMloxcFVRVms0c1dFamVkSXB3VGFWc291WEZoeG02YzV0?=
 =?utf-8?B?Y3JScy9zdXZjZlZFa25ROUdKVTBnSlZJZHhNM0FlSUZVMUtRU1ZLalg5WUx4?=
 =?utf-8?B?RzM3YWhzRld2R0l4ZkZqbitIdlpIZnp5U25UMGFzZnI5cW5Bb2RMRmhzK1Fq?=
 =?utf-8?B?M0swQTZMQmZTQnJlVkl2L0xxd3B0Zm9pR2x1akxmVGd2YW8yWE5YaTd6UmVL?=
 =?utf-8?B?Qzg3aUNLSHRPcTFvdUJxZGszdVQyOFYrcmlDS0s5OW03OThKaklDc2FNR1Br?=
 =?utf-8?B?c3VUSlFVdzN3T0Z4aHhPQ3VIU1ZLc1Rmc0I2eXUxMDB1OHFTM1JVR3gyZGtR?=
 =?utf-8?B?c1VvbENndnByaGJyVWlURmhEU1R3eTVDYkY1RmhwelN5cTAwZGkwaWFQMllw?=
 =?utf-8?B?QkdFbjJXOExoQnFCV0ZPd2ViZzRDL3E0Zjg5bk9JYTk3REw0cmxId2RvYmts?=
 =?utf-8?B?OFdkWFRRSkNST3BEbVhOWm01MkJzTmpZSlRoZnZUQjhwWWJFakxJNEI3M3lw?=
 =?utf-8?B?T0VERCtrZkxJeHJvV1gzeS8wUDIySWRYNTRVVDZYNGZ2d3RpUnRnUVV0QmQ1?=
 =?utf-8?B?T3lxOCtrQndoN0ZDck1TZnVHSDVsTzAvOHBXNmtTUUwzeUdNUjlpYzNNOFlI?=
 =?utf-8?B?VGhPNC9ibDc5bXpnaWN1bnpvV0QwQnJ4b2UrdU4zWmJwMGxNM3AwekNNZHpU?=
 =?utf-8?B?emZydnJNaVJibm5MenpMKytNbTYyTlJ6SkNkT043N3RMcmtBTHg0dU5FUUdG?=
 =?utf-8?B?R2FNQldZbExIaWlGWG5UVG5LN3p3aCtYcy96RFduaWQ2R1hlek1rUXQyQ1V5?=
 =?utf-8?B?Rzk5eWVPL0xkdVRnK0ZyOGIxcTFkaTJtN1pUL0x2T0hSc3gyZFZQU2owMFhj?=
 =?utf-8?B?VmlVbllIeHFPUWd2SzBvcEI3YlFUaWt1T25XeUxoNHhzM0RxOHNpUzdyaDVB?=
 =?utf-8?B?aWdxdDRMRVdMbWMxQTdDSVJrR0RWSEZPU2YzNVR0M2E0QWhkWDNZdzQvWkMw?=
 =?utf-8?B?eThraWxmcjEwRGxTNG1IS0lNYWkwQjBmT2pKdVEzY3phc0pCVGNVUjI0NStR?=
 =?utf-8?B?WkZTYVdhd05wdCs0NnluUjVNYk1IOGh4NFFBbU5SQ2cyL1VWdC9IUG02YXcw?=
 =?utf-8?B?UnQ1SXFaQml1SEI1cmNOVEtRY2czeXNqVGdNeVRSR2hGY3pvcXF1TGtmRDRy?=
 =?utf-8?B?aUZUWVg5RkRzd1pESkhFcmZBMEdUVlY4b0dXM1UzN2xCU2xJL0RaZmNrQStT?=
 =?utf-8?B?WmNGTmt0Q0M1RXVURWNpY1Z0alVmUFJYWU0veTZ2M3doUFQ2T0Y2NEcvTkNr?=
 =?utf-8?B?TmF4TDltcGhqR0lHeVY3cXdKZVRtOXh4eEd4b2x3MjZTUlJIcGQ2T1BVTkZz?=
 =?utf-8?B?aHowTWh6UVFZMFU4M1g2NlZmWTI5UGZHQTdrb2x4eWFlSG1ha0x0YkRIQWhw?=
 =?utf-8?B?RzhoMnM4Wm9lMW1ocEtBZnBwaDJiOWRndnh1UkFCNXQ2QkFEK1hiTEdqZS9R?=
 =?utf-8?B?QWM4akJ1dk9YRjhvcHJqK3JqeUtaTTN6Vmxpd01QTDNqeGFEL3JoOGNOT0s5?=
 =?utf-8?B?M0taU05wcS9QQ1p2WEdLOEtyVFA3L0xjZmJHckxGK3FXMGJlTjhLOFV5alc4?=
 =?utf-8?B?ajNELzZjL1NDVFQ3Njl0bmpqV3ZDRlFjQTRtUUVNZUY4ejVZTC85VUI4bEYw?=
 =?utf-8?B?emhsVnQ3K3BaSjUrajZRcUpiUVFCb0MrVDRPZHFwcFI5WklnRUdNUUdQWVNo?=
 =?utf-8?Q?1uYgnPkzaWtx8SeX8o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDlKSjJRNm1oL3V2eEo0aElkQk1yOFBUaFdrOFB4U0IyWnVMNlByUnphaFJT?=
 =?utf-8?B?Y1FGdnlrT0FlK3pTU3ZCaEtzajRQMTRxQnp2V3ZodVVlNUlOaWV2SHBCMHJL?=
 =?utf-8?B?L2d1dE5VeXJrQ1Y2R25MNUN3bVMvZGh6WWRZZ3haWkgvekVIOWo1ck0xdHBH?=
 =?utf-8?B?NlRPUWowenRkd2xvK0R3dkdMeU9veU8ySFhYdDZxbllRQ3VuRktYU0FKMUZE?=
 =?utf-8?B?bmI1NytKaUdNbnNhQXp1MEFUVmV2TjdHaWh6R2ZubmtSdVljNGR4VzNKeGxz?=
 =?utf-8?B?cXlLOGRPeW5vTlhSelFtWlhxWFB2ZVVQcHI3a0FvRHF3c3B2RW5oK25jL0Vt?=
 =?utf-8?B?TEhzV0lmc2ZPRk1pclhjbTViVUhUMlk0MEkzRUc4SlI5ODErNk1HTW5kNVB4?=
 =?utf-8?B?NVBkSE1FMU9qMk9rU1JtN2xlQUJYVUw5ZFZCMXQxVU1uUXBDemhxNlBzN0pJ?=
 =?utf-8?B?bzZLOHNiRE5ua2lIV1Q1clc1cHdRa3UwaXk1NHJBM0VMNW1CeFY1SEhSUVV4?=
 =?utf-8?B?bWd1KytlQ0xrcGlEeWg2aXFwaytYQm1vQ0Q0QUxqVDRsQ1ducnJCN1lYZkRs?=
 =?utf-8?B?dy93YzZMOVBNTTQzNjBRT1NiZVdta3VQNGwzM0lOeXhheHl6V0NoelIyZzJl?=
 =?utf-8?B?a2dkSTNXUE12eXlSZ09WRDFSUFJGOGdFNDl1NkRtT3NZRU5ianpSNFpyNjl3?=
 =?utf-8?B?UHNSUFIrcWp2WVdPelJNc3ZtOWlCS0c2Rkk1ZDRHWGxBU21wdHMwZmdYcVNE?=
 =?utf-8?B?ZVRnMWgydUVqZThBM29ET0NSUnNweGhIM2tUWTBIdy9LVk1CS0Z2cTQxWEVB?=
 =?utf-8?B?Y2thelZJTXNQa28rRm1Bc3Q5VnM5eml0cXF2ZnF2NmU5UWErN3A5WStyWEww?=
 =?utf-8?B?UlJXWDJPbnYyUlZNNnVuTnpzbTN0K040enkvU1RMZE9LUHR5bFpERUcvdGJo?=
 =?utf-8?B?MFlJTHVaQm1CZW1waXVmenF3YUFIWmJWRDcySXdCc00zTllHZFRRa2pwb0xt?=
 =?utf-8?B?S2Z5aTNBdkpzK253ZEg0MG45TEgxRjdabTd3R2NHVHhqNWEzNU1SOTcwdHk2?=
 =?utf-8?B?U0t6eG9YNkdSNlpsams2MGN0Ny9sU3dUbGhoRDhmUkxSUHl3eFZ4SlNINUlu?=
 =?utf-8?B?bmk4TTF1NDZJb25HMFFHL3JxdHRMNk5wcXJDTDJ6MGFIR2ZhZkJzTUlCSjJ1?=
 =?utf-8?B?czVzZ05tamlNNEdXbm11bGtiYTBIOS9nQUxqaTJlTjc1QlVmcGF0bkxpVVUz?=
 =?utf-8?B?bHRkZ2lJcDBwSTFkMHpWKzhidm1lbnJLV0VqSTJEQWcyRGxveGNsdUdPU3hx?=
 =?utf-8?B?ZVdmUXhaUjBFcTF3czdDdENhTnZsQWpxODBUUmNUWWZqYmRJcUxjYXNqU0Nn?=
 =?utf-8?B?dmxhZWRvNjl5SVU1dGE3L21kRzY2Tm9pQ3Z1NEw0VkQ3Q2JVYzhUVkNRODBs?=
 =?utf-8?B?TU5Dc1F5djlUQTJsNXVDOThPQ0JmUWc4NzMwNDZIMitDZGxqQjVnZ3JUcE9a?=
 =?utf-8?B?YzRMQXhUTWJNUk5aZFZYcWozNGN1MldFVElVUUZtS09YbGFRTmp0aGZ3czdN?=
 =?utf-8?B?bFBTeVdqQnlMajNyT1hMcytpZ2w3ZUZUVlQwWVcxQU1jcUtwcWljd1JFb2ly?=
 =?utf-8?B?VHpVTEdENUFYZWYvNXhyZWxFWG45MGEyUFkxa0JHYkk3cDVYNzdNRDg2Sm1E?=
 =?utf-8?B?akZGSXFlTkxRWjNxY3hOUGlsS1lwRTIvYVNxYWVML09tTFFtR0Ixa3llbWF3?=
 =?utf-8?B?dlRYM2kzaVo1N1ltOUhSbzVkdDVpQ2ZBaWJ1VkY0M2hkZnc0VWtWQzhxSnlG?=
 =?utf-8?B?cHRPTzFldkRPYnc3UWNqei9kR083TFBSVWNPRGxzNm51S1VMR1JZNWI0NlhF?=
 =?utf-8?B?YVZrM0JWcW9kMm83MmVWZE5EV1NyczdhWGJMYzdxL2REbmpneGlKSldoUlNi?=
 =?utf-8?B?SWZCR1poSnF5bVRrZ3JnaUtDMW1TK1ZKYkpPL25MNHVHWkF4UVUzekduaUlm?=
 =?utf-8?B?L29UN1k3K25GL3lZSHU2Yk5wcitCQVg5dUV2TnZES0dQY3Bxa0F0VnVPZmsx?=
 =?utf-8?B?SnlEM3h5YTk0NlFUby9JRVhzZzJqclhiZHBuUm5Sd1M2dTZscUlDQjFKRE9W?=
 =?utf-8?Q?kMwdgWzLdjXw3l8jg4AHq4QIB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a85ae4-6038-4f3f-3bd7-08dcfa9157a4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 16:22:12.9307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vBLEU8Q5NhU1hyfpo1FNtTTdTtVyeXAU/2DuAKcOYEpdr1ugb7NLWpu2dgba9/x0BOowxJfNGpOut3H+HWyGeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4343
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

On 10/31/2024 15:50, Antonio Quartulli wrote:
> On 31/10/2024 20:37, Mario Limonciello wrote:
>> On 10/31/2024 10:28, Antonio Quartulli wrote:
>>> acpi_evaluate_object() may return AE_NOT_FOUND (failure), which
>>> would result in dereferencing buffer.pointer (obj) while being NULL.
>>>
>>> Although this case may be unrealistic for the current code, it is
>>> still better to protect against possible bugs.
>>>
>>> Bail out also when status is AE_NOT_FOUND.
>>>
>>> This fixes 1 FORWARD_NULL issue reported by Coverity
>>> Report: CID 1600951:  Null pointer dereferences  (FORWARD_NULL)
>>>
>>> Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
>>
>> Can you please dig up the right Fixes: tag?
> 
> Fixes: c9b7c809b89f ("drm/amd: Guard against bad data for ATIF ACPI 
> method")
> 
> Your commit :)
> 
> Should I send v3 with the Fixes tag in it?

Don't worry about it, I'll pick it up while we commit it.

Thanks!

> 
> Interestingly, this pattern of checking for AE_NOT_FOUND is shared by 
> other functions, however, they don't try to dereference the pointer to 
> the buffer before the return statement (which caused the Coverity report).
> It's the caller that checks if the return value is NULL or not.
> 
> For this function it was the same, until you added this extra check on 
> obj->type, without checking if obj was NULL or not.
> 
> If we want to keep the original pattern and continue checking for 
> AE_NOT_FOUND, we could rather do:
> 
> -       if (obj->type != ACPI_TYPE_BUFFER) {
> +       if (obj && obj->type != ACPI_TYPE_BUFFER) {
> 
> But this feel more like "bike shed color picking" than anything else :)
> Anyway, up to you Mario, I am open to change the patch again if the 
> latter pattern is more preferable.
> 
> Regards,
> 
>>
>> Besides that, LGTM.
>>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/ 
>>> drm/amd/amdgpu/amdgpu_acpi.c
>>> index cce85389427f..b8d4e07d2043 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>>> @@ -172,8 +172,8 @@ static union acpi_object *amdgpu_atif_call(struct 
>>> amdgpu_atif *atif,
>>>                         &buffer);
>>>       obj = (union acpi_object *)buffer.pointer;
>>> -    /* Fail if calling the method fails and ATIF is supported */
>>> -    if (ACPI_FAILURE(status) && status != AE_NOT_FOUND) {
>>> +    /* Fail if calling the method fails */
>>> +    if (ACPI_FAILURE(status)) {
>>>           DRM_DEBUG_DRIVER("failed to evaluate ATIF got %s\n",
>>>                    acpi_format_exception(status));
>>>           kfree(obj);
>>
> 

