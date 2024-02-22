Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC23D85FDFB
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 17:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E3E10E96B;
	Thu, 22 Feb 2024 16:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DYcKR5D2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D104B10E96B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 16:25:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FINb9CdOqwiB6GL1VUqkm3vkTmMe1NNU8dSG7MJ2nNzrjGwbJK6dU81ZTEDBse5Y1rqTlpF8Hj+Li39F8y2TMuPJ99rBIu57lpT7U1QvlT9Ewp+OHo4uNDw8fS39oqIbthtNCCpQm8JqapLkH0SHB7QJRfqvBUh+XxQ/3oTdtOtiH8WU+alGY2wN/L9piZcHzT7nQm4UAhg6GrmRnAFl5mzfvgLTu4VQH2xdgC4XfoDqZ5i9uGGLurG9C+iIj713Q7NwDZ+wZekb8qfPSkc0VX6cBtjiXTQlGmhP/kYxGGFyzAbz/C1DS/HPX1dLm22kwTkx5055AYlLZ4Dkz6w3Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HS1nTxAMJ4jJWcv/kzaDhy/sq4PKGej8exUWYgLOww=;
 b=nifyBneb6WAVUSyQ7buLbiRbb/m6UpOUsI/kDo2zPNsonRolnsYhQSqDlE7yX1rjw/DXja6gWdZdJTg9I0en/ufdWSXlH92ONu2GsFB+WwMFvvbQb1dA8VykC/84UqI1UTEeUm94yi4FRRFtEdR9J9cGIeAAazhC/htuEN69P9mwgnIzg7kxzxTGZBaLrQXntT0m0J9C7dS0StFLQi0S/WCn0VEwwOWKL3cK0yiHc2kpfiRHFs9X1/AuEkV+DGzNWML4tWvGR7BJvY6yAILlpgpsTuSethmZWEh5vx9GGcA7RshPxUGxmBfulAEf3vpajUvSs6dtunvhANEsJtJqqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HS1nTxAMJ4jJWcv/kzaDhy/sq4PKGej8exUWYgLOww=;
 b=DYcKR5D2R9ojxiy500DYIUfezKd+FD2gZqhljkNfeSewOz1Vk+1jwWfC2/yeEK9I/Rn6jOl+tW+4Jv4oiqoNKS859wXpIiTXB7S66DEGdrh+5CXmXWVwXOGLjWuQOSV1pJV3bPlWrBnvVaNtQBIg1TdqCxdnqexv+YzfeGYkyVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW6PR12MB8914.namprd12.prod.outlook.com (2603:10b6:303:244::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Thu, 22 Feb
 2024 16:25:31 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a%7]) with mapi id 15.20.7316.018; Thu, 22 Feb 2024
 16:25:31 +0000
Message-ID: <46329386-c779-4e9c-80b0-c0f01e51d0a5@amd.com>
Date: Thu, 22 Feb 2024 10:25:27 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] fbcon: Defer console takeover for splash screens
 to first switch
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>,
 Daniel van Vugt <daniel.van.vugt@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <bb8d631d-9f6c-48e8-a504-8931ee21014d@amd.com>
 <20240219090239.22568-1-daniel.van.vugt@canonical.com>
 <20240219090239.22568-2-daniel.van.vugt@canonical.com>
 <rwifwv74dhd5dipnoi2txnecsydvfnrbog2ntk76hplf3tpdzt@5d4goejupypn>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <rwifwv74dhd5dipnoi2txnecsydvfnrbog2ntk76hplf3tpdzt@5d4goejupypn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0261.namprd03.prod.outlook.com
 (2603:10b6:5:3b3::26) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW6PR12MB8914:EE_
X-MS-Office365-Filtering-Correlation-Id: 92c41afe-9120-48a7-daf4-08dc33c2e330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uq8mri15awSGuZAcfd92+r2jLRHHovz2xRpCtxNNcbiwMq0MQ6KlQL1HH5+4Lwh5cb5TFsvU0SaSUPDRAWsEEhHtyFfGFx7NR8U/bHvSwLbi60cAg+NlkcbNuh/wog78nTYyZC2vgTsifQGI2Xrc714tJr1zY6P1Xqmysj0/fAgZt+dKUIQOyq+FUTsa6qexQLlg0rTc5XFxNku1Sd0/KrpUEq3vkntxsRL7eq1d6/93XaTVfvRQTeUNNarVUgGCNs/gaKxOKT8++6fT696glVQFpDYejdA4TFnjJky9d9w/5OmWYPkPplET6xZHCIb0L+rZe01J9dc/xGGX/SaFb7LLOdDiEnwARQqQ/9fhMpUK9Q4mUUgSEA/4qJS2lPWiQChmlxUSEK9KWqcWhJo0OtYncxDghbIM1ULp7IEYJXvi5YCAVGspwZ0m2riNgEyvDukq7JN7GdDQHNo9+o43S8g/epQyC81fymXMR7ERyPStHN6KBUwYLjmEsd/MxrDiXKrHCWf32SGY0HYS/bGVwKKXNcNHhczpw23Un/rI9mmuqq90qmSHF4KdD0Ur7KxS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nms4WlVQSHJzNFM4Y2Q0T2ZaUFVqUU1kNDRaMlBWZU5LdTdNeGxycS9keWF5?=
 =?utf-8?B?eWE1Q0dDSEVmRU8wd2dXaE1icENtcnA1Zm9FU0ZuVDhhMVN2dWloOCs1bFNy?=
 =?utf-8?B?QVhKTDRRWVh2eDcwVjNhbTVHYlYvL0tmWldwcjZWM2dxNExFNGlrMlozYnZw?=
 =?utf-8?B?TTVsZFByVTE5dkxWVUt2WUhMeHlYZ3Y4N3h0MEFyMDlWZUlya0xsTTRSZGZ0?=
 =?utf-8?B?OHNYeDRTWU5FSTl4VlE4NHZFcXgrVHIySnl4dHJpVGU2WjlFZ21jMndTLzhj?=
 =?utf-8?B?bDRRSjJ2Mmwyc1FmOW1OSHU1OUZ5ckloZGxYS3NJbzF1cWk3cUl6cEtqc1JU?=
 =?utf-8?B?ckRJd1E5VytJbUpvT0xDVXVYa0VRblpHSENVM3A3M2ZzZGVMM2Yra2lMaVFr?=
 =?utf-8?B?Ymg2TCtHRzVwdGNHRHYwMi8vKzhEc1J0RG91d0VIeUZIZ3lqd1dmZytKQ3J6?=
 =?utf-8?B?K0lISnNvemxMdDB5bmJqUHVvNGxnN1prQVBPSkVpU2EyOXBJK0dpYlVjdEMv?=
 =?utf-8?B?a05BQld3b1dhZmhQWXRudmRjM3FkM0w2d3pmWm5HcnBuWitZV3BZeEE3VkFJ?=
 =?utf-8?B?NGxLclZrSTZKZExYaXl0R3JJMWhaN1dXUG1TaHV1Mk1NWUY4RmQrL1Z1S1Mx?=
 =?utf-8?B?Q2JkWlBrcHpzQ1VOZjFaM0lQTHFrVzgwYUg2bmpkcXNBSmNoS29EV1ZpVTRG?=
 =?utf-8?B?T2x6MHExNlZuaUJ1SzFoV25zS0V2YU5URkNVbWRwUEZDZStOUzRrSFBPenRL?=
 =?utf-8?B?czlMVHkzS1l5VHlFN3FHQXlEaTZRQ2ZUVDZhaEVqQTE1aU5VTjdGY0ZjN3k1?=
 =?utf-8?B?VDZTYXBqUWIxZy9aZlQ4MG1UZFVQTXJXc0xSNjBRVjJQQUNoeE95Z1VESllW?=
 =?utf-8?B?QmY5M3BZRGovYUhWQXExeWlGZ1dIRnR5dm1MUnBZa1B1bWNaWFhadDBnb05q?=
 =?utf-8?B?aFA3YWRIUjd3Q0NEMnd4ZUFVcEtUZnR3clZUclpOOWNlaytTcUFlWS9tY0JU?=
 =?utf-8?B?WjhLck50dElCUGZ3MVNrZkdRdE5JRVFLYlIrNndUV2xLUVFpZklld3lBUU1h?=
 =?utf-8?B?NjRnK0tFdEVDQmVRQzFDZGlLRkd6RTBaV2V4TFUyeW1lSjFnS1ptVnJ1UU1J?=
 =?utf-8?B?TzY2ZDQ4SUk4bnQwUDNVUm1ZaFAwUjVFNmk1L1ZyVGh0d1Z3US9aelFBZmtE?=
 =?utf-8?B?Tk1tbEEyRG00U1BMemVnNjkvNDNGVkViaThKbWVHTnRPU2dmRXg1eGNPTlZl?=
 =?utf-8?B?UkRnbHoybnN1amhNUkR6TWlYY3E4cW9MdWdjN1puc01HRkd0RklkRThJOXVD?=
 =?utf-8?B?VVZjMTl6NkkxMHNyOFlEM1hMZlNBZjA2U21vMGh5T0xEdzBnQlRMemNrNGE3?=
 =?utf-8?B?aXNCS3duSDBjbW9NcUtVRXZLYW1vdVBQY0hqaERQZXdsNFZsRkxjZE1JeWhB?=
 =?utf-8?B?MElpMW8xL3dmS2E2eFZ1UHlhQk01cVIxNVJyT05LVXozWDZ3cmpzNG5aR240?=
 =?utf-8?B?ZmtTZGFsaVBXa1Y1R3JTZzQ5cVpLUWtkWUp6azQ0cmo3WFFIVnZKWm11Q2Zj?=
 =?utf-8?B?MW1SS2hkRWdUKzhYNitFWWJzQnRpUkpwaDdDQW40TVJDSDVpaXNBelF5VzBQ?=
 =?utf-8?B?eERWL2UyQjF6cjFxeHhjOTUzeFUvSkNmRmlMVUJSdTlBdFE2WDZHSTErRFEw?=
 =?utf-8?B?R0MxK0ZPNnpWRTZKNkZySm9xRlFBdFdUWUhzR3E3M0tUSHpVM0tmMzAwZEZ1?=
 =?utf-8?B?Nzd3ZUQ5S2o0S3h4eHJnb0tUZWZtL08zTWFJNWFPRlFkWTB5akoydXN6bTdQ?=
 =?utf-8?B?Y2ZTdEV5WE13QnZUTCt4cERMbHlkQ0FXQVkrOVBrTzNpQWpTUnVDT2VoNzNE?=
 =?utf-8?B?cVFXU1dCbFd3RGw1Q0VudkdXcUw2Y1BHZXBFVitWQXRhYUMyeUQ4dncwWkxI?=
 =?utf-8?B?MlBBNWJ0UXgxY0c1Z29VVVNXUXpzTUVwc2lCYXdlb01BMjlrblVQVHk1RTJR?=
 =?utf-8?B?eTJ2dGRuc1YzT3lTU0VFNkpteXdrOUkwMzMrQ2NMRFBxVCtmcitzendlRWhl?=
 =?utf-8?B?VEU0MGdlUlNLNldPVE5lVWtycy9wZU5FNmI2K2xJRFE0M0FtM1pmVjFNZk5p?=
 =?utf-8?Q?aad1LhfD8sBzGi1NuxuLxDnVg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c41afe-9120-48a7-daf4-08dc33c2e330
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 16:25:31.0162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZpSr0Ozllv16ZhscFAnCC6/u1FuDzhRr7pgwuo7+zNYJDv4ts20uFgV1x0TYOPZlhUMcrzvf/G7QqZ173uZSlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8914
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

On 2/22/2024 05:08, Maxime Ripard wrote:
> Hi Daniel,
> 
> On Mon, Feb 19, 2024 at 05:02:34PM +0800, Daniel van Vugt wrote:
>> Until now, deferred console takeover only meant defer until there is
>> output. But that risks stepping on the toes of userspace splash screens
>> as console messages may appear before the splash screen.
>>
>> This becomes more likely the later the splash screen starts, but even
>> systems whose splash exists in initrd may not be not immune because they
>> still rely on racing against all possible kernel messages that might
>> trigger the fbcon takeover. And those kernel messages are hardware
>> dependent so what boots silently on one machine may not be so quiet on
>> the next. We also want to shield users from seeing warnings about their
>> hardware/firmware that they don't always have the power to fix themselves,
>> and may not be deemed worthy of fixing by the vendor.
>>
>> So now we check the command line for the expectation of userspace splash
>> (CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION) and if present
>> then defer fbcon's takeover until the first console switch. In the case
>> of Plymouth, its value would typically be "splash". This keeps the boot
>> experience clean and silent so long as the command line requests so.
>>
>> Closes: https://bugs.launchpad.net/bugs/1970069
>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Daniel van Vugt <daniel.van.vugt@canonical.com>

I did test this series on an Ubuntu userspace and it works as you 
suggest it should.

Tested-by: Mario Limonciello <mario.limonciello@amd.com>

> 
> It's not clear to me why we should want to make it an option? If one
> strategy is better than the other, and I guess the new one is if you
> consider it fixes a bug and bothered to submit it upstream, why not just
> get rid of the old one entirely?
> 
> I guess my question is: why do we want the choice, and what are the
> tradeoff each strategy brings?
> 
> Maxime

The reason for choice is that it keys off a kernel command line 
parameter that is inconsistent across distributions.

For example Ubuntu uses "splash", Fedora used "rhgb" etc.

Even the plymouth userspace maintains a list for it's behaviors of what 
parameters to look for to start at bootup.  So the obvious alternative 
is to clone that list in the kernel.
