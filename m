Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 919D391E824
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 21:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458F810E4E2;
	Mon,  1 Jul 2024 19:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="v6PDwHEx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADF210E4D7;
 Mon,  1 Jul 2024 19:02:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/49M+2rxPcqDhBaUfw1QlSWf4wiQcTY6vY7NpgYpT/lp+OE69k9z+Uls1V1tFr4k0uyXjaNQ0JNZuT5bONKTKA4rl/dszL7+BH9SIjId9jxAuxZ3Ps95tX0in4Dg85GJ6YWxxI4ZNYc3Ux6sqIKoJlB8SNFAPVkHSf7W/FppIw4BX/PLKpWejm9UFvDVVn1sdbtZP67F2ZZ5wwkvYthpxdT9bXhVuU342ntjWT6RssSbQZZvO4/8c08n+qUmep1gFEhVKUVW1k6fAGDZp4oZREFBNRIm58FzLNWVCV5n03VV7yIH0sXehjyGkB209d4MgCRQcxf0yhSHyDbo9h49A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLvRxahF1UtqFcfD2KCpnqdEhMwS+IxBL029IpUx6Go=;
 b=UpsjuAi2z4U51hiEukMLvF7oeW5mstuSdgkjcCI9eT3Ol0KeBWSNGuNTpW8wylH0gMBhbJgTRB5WKGMamtpLN4rwhf2ckWCEf6Dss/XQA3DiQySvpJWd5tAUWr/+JxMLxM4MdrzNOACAYjl5wmxypjOBorcjhzKm9QqMYhV4TJ05OCcWGJM41nDPZ3pOOAjBOHdHFdu/AV+yLGWZPYHhYEYbZfxmh9UZNisXy+v+zXY5fNMLD4TFBzieyxj8Moj1wx+xp72xgTbYs8bS83k9/EhO723BqbjlDlpuC7ONabRAEE13Ca7Ap5hBQ2IlmKjnjoQo6Nxtbub+hGSX1JCNfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLvRxahF1UtqFcfD2KCpnqdEhMwS+IxBL029IpUx6Go=;
 b=v6PDwHExjWqZ+Q98tyLH5oJ9eoPGv76wJqTycqtWXJhHRrV8kPk0VULF2aZKZp3LAC+3ix3VVFtPeT8nfGnNX2VvB02zhiisrjoBJr5z+JPlPNZIFk5BsV7cLHNLQSkIYkViR05E7LPMMYbr2ctN40FkJaX16Wj2KvtnjsIOsWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM6PR12MB4451.namprd12.prod.outlook.com (2603:10b6:5:2ab::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Mon, 1 Jul
 2024 19:02:05 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 19:02:05 +0000
Message-ID: <49d70214-21e9-4547-96a8-ff168d922eaf@amd.com>
Date: Mon, 1 Jul 2024 14:02:02 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/amd: Add power_saving_policy drm property to
 eDP connectors
To: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org,
 Simon Ser <contact@emersion.fr>, Harry Wentland <Harry.Wentland@amd.com>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@google.com>
References: <20240606020404.210989-1-mario.limonciello@amd.com>
 <20240606020404.210989-3-mario.limonciello@amd.com>
 <bc1d81ef-d9d0-4440-b63f-ecfb735ef783@amd.com>
 <d637d3c2-34f7-42f8-acbb-6a1730d3fc3c@amd.com>
 <CAFZQkGy0xuuUw73HQvS8Ce92sUi2rVrRnX25pi1KdNmyQbtBZA@mail.gmail.com>
 <CAFZQkGz8DeoiVX2MohoBoTMxraJk1Ou41N_wKP3GkqRrPg_6sg@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAFZQkGz8DeoiVX2MohoBoTMxraJk1Ou41N_wKP3GkqRrPg_6sg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0130.namprd13.prod.outlook.com
 (2603:10b6:806:27::15) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM6PR12MB4451:EE_
X-MS-Office365-Filtering-Correlation-Id: fb2ccab7-8a1a-4dd6-cc6f-08dc9a004c26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWFrZVF1bDhpV0o0SzhEUGljSGRUQ2JQdllOUDhvU1JFbnRlUWNlalF0SGt4?=
 =?utf-8?B?bFUvejRrTERka1NEeDZCbGNKdWN3UW1TQVZGQ0NjZ0J6aE1hNlRadnB4eUkx?=
 =?utf-8?B?dFVRSFo4VFNaZDN0ZytNVFR2UFNqVWpXb0p3aXR5TEpyeW44QTN0dmNPOW9Y?=
 =?utf-8?B?YXZEKzJXZVRqU3pqL082ZGdOaWRzSjdMa1BiRFU5dW8vMUZxQXVDbEdXU05Q?=
 =?utf-8?B?UEJwa3lwVkE0L1JVK2Nzcm05SXZyelQ0U0k5M1hzYjQ2ODNsN1NoZXN3cVU5?=
 =?utf-8?B?YmN1ZHNyOUtiN25iZkZGOU1CRTFzU083aWlDYkcrME5oM3V6MVEycHpxbU9T?=
 =?utf-8?B?S1R1ak5KVy9qOVRpc04xUDNrTEhOejNKKzV1RUdDMWd6Wlh6QjJ5Z1Z0bnhm?=
 =?utf-8?B?ZW9BU3JoTWhvL2o4MVU4V0RyZDMvM1BZYU5RRllaRWhJRVZLbDJobXc1SmIy?=
 =?utf-8?B?VW9IdHlNRnQ2OFV5S1lUUVc3V0RsRlU1dWxDV2ptOFVuR0d2NjNJOWltd1dM?=
 =?utf-8?B?WGtiaURkTTg5RXJHVHQxNDFTTGJNejUxdnhEWXJZcUdhOGRkWjNzZmlkVUZI?=
 =?utf-8?B?eGtiUndvZnE1NWxCaURSOU1rTGNsSStUSVpDcVVjaFRYUzFPR3EzMmZQcmVI?=
 =?utf-8?B?Zjg1R0xFVUQ0VUtnUmdnQzFOSlpBeFJ4bGdWdENnSENoR2tjc0kzeGprUWJM?=
 =?utf-8?B?YzVMQ3V0ejZqbXdVb1dRcElRYjFZK294am01ZDRsdTk2RDJhNDBOVVhJczQ5?=
 =?utf-8?B?Y1hSMGRvREh3ckkwaTJrSlI3bDlNTURRaFI1cGtkZGN1UldQM3ZKVldoWjFt?=
 =?utf-8?B?VUw5UzVNUzNVblRQcmhWMG9rMXBXWllzelVUNEduTXZlNWtjWkk3bVcvNzlH?=
 =?utf-8?B?bUhoazFmanhmYWE2bjRzN3UrWTBKVk84blg5ZVBJRHp6eHFGcXdhSXZ6MWsx?=
 =?utf-8?B?RTZ4ZS9zMzVQcmh4anhra3ZoUjhCMHRuZTFITVZQbU9XLzF6aDJ0OW02NFQw?=
 =?utf-8?B?WnNkRUlZSjBCK3ZYZFpqM3lpT0RoU2JWZUM1akNFenpxbGFJQmI4VDF6bmNV?=
 =?utf-8?B?eGpISFVMM3YxQVlLYWlXSHBTQjZPckx0QWUzVnJJdjJoTGhxelhXS0FOcGR4?=
 =?utf-8?B?Lzh3RE5DeXVvUTlveDNGUWF4ZVRpdFNGUFlqMVhER0FvcUJ3RDIySEI0RWZs?=
 =?utf-8?B?bGk2aURDT2ltd0lXYnhqdXErNE94YkF3bC9WQmtWRXR5UUVmdnRxajlyN0c5?=
 =?utf-8?B?SitnaTYwZUVDQVNQWlRUdUpYdUVpc3A5TytrVnd2T1orOUZYaWtreXAwNHJL?=
 =?utf-8?B?NzNJLzJnZGNjY0MzaEE5RGVVS28xQWRLTk1tWldUbStmNGNMYndicXJIZXdh?=
 =?utf-8?B?UFQwUkZkL2JqeENreWpjVGdoNEdNTUpWZ2F1TkpIdXUyaks4U1ppZXlvTU1x?=
 =?utf-8?B?bEM3aXVmVEJBV2lLYlNSZDNJT2xOYUxiYmpLTG4zVXRyNlRPMHg0ZG5paXRo?=
 =?utf-8?B?R2dycVJieURGRFhSOHVqbEg0ZzZZcUFSTWs3R0xsMm1MRmJzb3VoVWRHMXZJ?=
 =?utf-8?B?VkZnazdvcXZHWWhqVTZUaFQrQml3VUZzdzRKOGh6M01oUS9uZjdPUTBxRnYr?=
 =?utf-8?B?OTk3a2hOcm93WU1LWWZ5YVhVVUpGNG5abHphdS9nYzJKTklseHk2RFQwdXNI?=
 =?utf-8?B?bXZ6QmN3ZVhQcnpObzd1K1J1aDZtaVIxcDA4UWdNYWVPbzZGMGRHdVpaaTNT?=
 =?utf-8?Q?59SVzrUe9V3UtF6yKc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?encrcGFpZ09DTWJWZEp5SmJPaFRPTXhGbmcxMlEvdGYyc09UeGl2VWJpbEEw?=
 =?utf-8?B?WlpBNjVkVTE0TUJTUXBaRmlzeGJyWW80bjFjcnlYYnFwYVVlSFc5RVltbXdr?=
 =?utf-8?B?SE84QkVSVHUySjU0SHpsbCtnVDEzcGZpU040cys2d0dCTDNuamFwaW1MK2dl?=
 =?utf-8?B?KzQ2RForSGhnZlZnSk5lZ1ZwR3Y4VmZ0VnB2WkVxekFmU2t6TDNqNmdQWFpE?=
 =?utf-8?B?dUdUdVNpTkRwWllMS1VZL2VWZUFCRVFrdFBoTSs1WngyTE5oTk9KQWRja3Ir?=
 =?utf-8?B?dkFOOEhLbTNzTUpJRnA3eGdSOHVrMGx5bjdlRktac2pVT1dGdnpxUTVWaGFo?=
 =?utf-8?B?WjFTUkp5K0VEbkJOWE9JR2lLMjUyTUU5L09Bek5Nanp6N3VsNVJkZzFrUm5Q?=
 =?utf-8?B?MjBOa2lUUHBDYWdMNm84Y0pHREN6bnNSWkxxOS9zenJRTnptNW40T3hva1BT?=
 =?utf-8?B?cC9KQVM1WHJLUzBMN1hpUWxGbHM1Q3UyeWxEcld1WmRGMnhqVEpnU2Vidkta?=
 =?utf-8?B?SjBucEZFYzdBV1RiSTZrVDJpbnl0N0VGbllub2Rtb1dNVUZEUHJycGcrM0Vz?=
 =?utf-8?B?SGVRVnNrNTN6M3dpNTErd0ZneDUxM3JFQWxTSmJrbGp1MFFoVFBSOXZHR0hq?=
 =?utf-8?B?amZFN1lic1MyUmh3LzgrSjk1cmlkQTBnRkI3elphdEFXTDQwSDhoZXJwUmtn?=
 =?utf-8?B?VnpLa3A0RzRUWXNZclFTd3hzcUtmL2hFTkI5bU1oUUljVG00QkpsWG51bi93?=
 =?utf-8?B?YTVwOEJjTlVRT3FXemMrSzhRUlFJcWRyRUt2WExzbGZrOXNsRFRlYVk4QXdF?=
 =?utf-8?B?TDZ1MTA0VCtEK2pjajc3bzNwTHEvSGJGWS85V2d1ZUNZdENmVXpMS2hJd2pm?=
 =?utf-8?B?VDFKWHFLWDZWSis0MHl2ZThuTkptYjhibllxS3J2T1B0blhDLzdhU0kvbElW?=
 =?utf-8?B?Um1GOER2TEFjRGtDUFVacGE1OCszQ2lrTWRyZnlscG9mNnVuUVFLM2YwTlJC?=
 =?utf-8?B?SmZVRmMwazVVQkptaHNGVVR6QjNzRlZ0dytCa1c0dEg0aVdiSnNLRUZuc1Iw?=
 =?utf-8?B?TlZ2WFF0NXFHUFY3TThUWXAyeGNOWHRMQXBvekpjNTE4Nnpwc1hKZ0pVOXdm?=
 =?utf-8?B?djVoWkZtQ2M0VDVnOE5QbkxuQ0hCREZOYmJRSm5xWmJ6SzJUd2JJKzlpeGpM?=
 =?utf-8?B?Z3UrUHNRMEU3TGl4bWZOcmx2N1FMZnpkTnROZ1ZUdTI5K2d3c2VCNkJZeHBJ?=
 =?utf-8?B?aUhLMDVHT3lpSldlbFlUQTZSY1NvY3dOUGJnTWJackZSUm5HMUZmMlE5OEpZ?=
 =?utf-8?B?ZUxKQ2NiMXJiT3ZGenZQYVpoRng5UXlDNjNqS3liamFsNVRuaFJYRURHMjFz?=
 =?utf-8?B?Vy9paXRVeXZUanlsdHJoZEhqR0x4ZGJIMjZGZi9MeEFXOEh1U1JIUjhqMllM?=
 =?utf-8?B?Nzdqenhkc0RIMFR3U3U4cnVKcVNZeEUyTUpaaDFzcWRyRDNKd1ZsaVoyZGtZ?=
 =?utf-8?B?a05GOHNTbm40a0YzVllFZzRKODV6WlEzdXV0dXZTTi92bFM3OG1yMSs4dnRI?=
 =?utf-8?B?enZrbEhUQWJiME1TSVE5NG1OS3RzVXUwbGxmSHV3STN5cjIzWU9uRVIxeURa?=
 =?utf-8?B?bzEyRVdXL1RMVlRDOG8vK3AvWE50cHhFYU9Hd0ordFZZejJqYTNielBJOWxQ?=
 =?utf-8?B?MU43QjZBNk4xZ2tYTW5OakZsSmNrK0tGdCtqa3czeVF6Q3p1UXhlVTlQZjhT?=
 =?utf-8?B?Zll1c2JGdlNzdHFWVVJGT1AybWhtUi8xSURnVk9nRVlHUnczbUZLVEZHZ09Y?=
 =?utf-8?B?Q0Rwa3VmODZ5YWlUSzV0Uko3QndWeG41WHJyV20xMHhZYVEvSjA4NytJaGQy?=
 =?utf-8?B?Q3pWdzlEUGlqMW5qZUozYU1BalByZHZkc1JUelVzNzlvRHdQTERsOWhyRytm?=
 =?utf-8?B?bmJ2NnV0VDhmZEJBcjZpNHNteUkvM2I2bkdKQm5VZ3k1UHgwOXR1eUFpM1M1?=
 =?utf-8?B?ck0xZzhRZ21NbDdCdG5hYjdhazVjYWpGc3pkb0VkaFZMTnpoMGExdXUvK1lC?=
 =?utf-8?B?eTl3SHZvbUN1Q2h2eU0rQ25TbmY1WmtXUEhnYWwzcVFSNHJ2elVxU05DK04x?=
 =?utf-8?Q?v9Jb+pNzoRudzD7r8/01NPBYm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2ccab7-8a1a-4dd6-cc6f-08dc9a004c26
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 19:02:05.0294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /7pB4m5Yi4aN+THrG6X/fA/Efk4V7uz4kdRZxGC9P+jeLKf494/NrgCm7DZAIf1n3xMzxaTyWjhnYJKWn79DtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4451
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

On 7/1/2024 13:47, Xaver Hugl wrote:
> Am Do., 20. Juni 2024 um 22:22 Uhr schrieb Xaver Hugl <xaver.hugl@gmail.com>:
>> Merging can only happen once a real world userspace application has
>> implemented support for it. I'll try to do that sometime next week in
>> KWin
> 
> Here's the promised implementation:
> https://invent.kde.org/plasma/kwin/-/merge_requests/6028

Thanks!

> 
> In testing with the patches on top of kernel 6.9.6, setting the
> property to `Require color accuracy` makes the sysfs file correctly
> report "Device or resource busy" when trying to change the power
> saving level, but setting the property to zero doesn't really work.
> Once KWin sets the property to zero, changing the power saving level
> "works" but the screen blanks for a moment (might just be a single
> frame) and reading from the file returns zero again, with the visuals
> and backlight level unchanged as well.

Hmm I'm a bit surprised the IGT tests I did didn't catch this.

Are you working on a system with two GPUs by chance (like a Framework 
16)?  If so; can you try the "other GPU"?

As it seems your PR to span 3 projects and I've never built KDE before 
can you spit out some artifacts somewhere that I can have a play with to 
reproduce your result and find the kernel issue?  Arch pkgs would be 
preferable for me, but some RPMs or DEBs are fine too.

