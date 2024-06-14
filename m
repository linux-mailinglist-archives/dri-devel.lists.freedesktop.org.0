Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7F5908CB0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 15:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5070D10ED1F;
	Fri, 14 Jun 2024 13:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MAyqcIPi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3479A10ED1F;
 Fri, 14 Jun 2024 13:47:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Equc2P2/Unm2T2T1cQ+oIvlxidraQBS+ciSMkt2yrVFkcjIMvywTH10VgxgeTYSKGKrXL2FqKN5CMeW7GY1qrZ2OviKPa+o53YQwjRGG52yA9YIRYY4KsFTTa509HYyB1R2ha9nbk2pj9BAdut9ZHB35Gl6A3t7Fl2yfR2/X3G+qxaBtqPlSwlNi2+O29DkyT8QLzm//4dyCV3bO7drZUl2QqmFuxtsPlH4lzTzzKhwDTHBHYCTsPSY4ZTrmBve5b1cwnt3poOH7Z8CrdE+NyoVGil6rFTPaPqrV+FhL71o6SJeknjvf+63lti3gK1GoWZscwl9x1cT8Kqpzlun5vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hs2+TNAN87LKCrjBo446uWR/XK3vgDLDtWfVcT+omOE=;
 b=kl6Tr4RKYXQkTSQWbZmknd/JT3Ze9aCPoj7FCo64mzJMx0YqeTIeG75dvrAWOoxA2HEdKXjH1vk4jj4QthIsY7ksLjXs/7zsInpqKiWLqHwsgN/sj2EV100XKfFtdLve2A8HFutwR0UwQXu2XfcEV6OLUyK9zxPPtYzdkMLIV4kEBmIs1gow+107wTqR15D6fmKr5+uvbaMAHbj3JEE6RbdMtjlcbAo9s/NpUsPuEsfhE6nOprJzKQ7Jk8V8NdcmurS+I4oTlAu8f8xfdgoY/FoqIum+dF9snWgQaAQKsNkU70/1ZcY10yYcnO1Fw+iglkp13NE25A7qICpcYB8ytw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hs2+TNAN87LKCrjBo446uWR/XK3vgDLDtWfVcT+omOE=;
 b=MAyqcIPiN+tVhhacAhkV4z5X1w7paFpypEjc7cnx5zQWPomJD4Rf6utfk+tVH/a7LFks8ujP1CViq49UBpXAwPdoXBlzTTdisPP0xK0Kxz/uZkFtA7D4FrizNhIIevKXSBDz7xPtHW+TwMx9RiWWaWFUqj/mKAurg5qDmHs9uLU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB6821.namprd12.prod.outlook.com (2603:10b6:806:25c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Fri, 14 Jun
 2024 13:47:53 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 13:47:53 +0000
Message-ID: <df7dc942-4e65-4e3a-8b10-6f4f0d1ef602@amd.com>
Date: Fri, 14 Jun 2024 08:47:51 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/fb-helper: Detect when lid is closed during
 initialization
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Chris Bainbridge <chris.bainbridge@gmail.com>
References: <20240613051700.1112-1-mario.limonciello@amd.com>
 <f5485db8-9e1d-4b95-a0ec-25ee8551795d@suse.de>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <f5485db8-9e1d-4b95-a0ec-25ee8551795d@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0194.namprd04.prod.outlook.com
 (2603:10b6:806:126::19) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA1PR12MB6821:EE_
X-MS-Office365-Filtering-Correlation-Id: 0355a6cc-e8b8-470d-630f-08dc8c7896e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|7416011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzhmbXR3Y0tPVGNTTDh2eEhzWGs0RG8wcjJCQkI2cXdRWFdoelhVRU1sMjJr?=
 =?utf-8?B?QzJ5NzZRZXpHTVlHNllTWUNwUm55S3IwUnJiazllSFQ3eDZyUnM0WkxxNmxh?=
 =?utf-8?B?eWwyOUFXeWdSUmpEZWt4cVYvbng4U3BGYzVxNDhXV21wUFd0d2xoYWNxWTlE?=
 =?utf-8?B?eGNhMkkwT01mWFNrUnVtcWhYR2plemZncm8xKzdMUXRpSjVJL002SCtGNzUx?=
 =?utf-8?B?VFRvelBNYU8yNzcxMGJ6MHh0aUcwV0s0a045dnhBMmRlMnFqdDI0ZDRaNTFI?=
 =?utf-8?B?KzZSY2htNXIvYkFlRmtwcEtOQ0RkZWNEQ0ZEb2huS0RPdllwTHZ0eWlaM2Fv?=
 =?utf-8?B?Rng0SEZwYTA0KzlOOW5kSUpVaDg0MDRKK3Jab0J5S00rZ3hLemppK1ZZR0U0?=
 =?utf-8?B?OElrV0l6b25oZ1pEbUk2dGgwU0pNcmRhQVN1ZWJyRVVORndsSUh3M0xtR0Zq?=
 =?utf-8?B?MFYrVEg4azIrKzUxN3MrYUpZS0JXYXRScGgxb2NISVVNcE0wM0lyTTVZMkFI?=
 =?utf-8?B?akQ5RjlJSm82aHlmMlRVMzFyQ0g2d0NpUjJINGYwU3B2ZVFtZmw4WTFOZEZs?=
 =?utf-8?B?Vjl5ZHE1MjlhR1B3dkVJaUVNd0hvNGpmU3lYbmZXMHEyRHczQ3JRSVo5bTYx?=
 =?utf-8?B?d1JiM3lBTlkzYStTSGg4dE5QOHBuUTQrR2FIQ0RkZjNBVmpVZHpGYTh5c1k4?=
 =?utf-8?B?Q2xHZ0hBSE5sV09zU1p0alRpL2NnWGVGQlNZT0E2RXlMV3ZEclJYU01QZ1V3?=
 =?utf-8?B?eDBIVG1TeW9MYiswa3ZKeUNvd1E4Y2FKamVUbFdjdVZEdThUbkY4aVlqRFBq?=
 =?utf-8?B?dlF6d2o2YlBNVStYcHJzZHJaekxUZGxsaHFJQ1JDb3Q3WWVWOG5aRjRscHNW?=
 =?utf-8?B?VVExT002eEdKZkhuVTFIK296c0owdTYxZ0tBMkw5bFl5R3ZWWFpOcW1Od2FP?=
 =?utf-8?B?eUZqMnk2b1JJSHY1RmNxQlFUQlZnL1k0ZzFVd2hoY2trWUFNUEtjR1NnY2hw?=
 =?utf-8?B?TVdsUmlVcHBGSzhuVk5JYytTZ1cxODNKMHBGUXMyK0hCbWg2bmFyTDBCWnFx?=
 =?utf-8?B?NlZDSWFrWHp0K1I3REhHT212ZGFGMXVPMitTWFRRMFpSTnVHR2UzcGdSUUhT?=
 =?utf-8?B?TTlqV292ZW1RcWxGc2dobXZkMUFsSEhGbkhJYmFQMGVIbDhqUitZQnR3R0JK?=
 =?utf-8?B?cGJmQXhmQlVOalhnZzQrM1FXUjdYUlEvUmpLSGNmV01sOTgxQUxXNEZ1WGZL?=
 =?utf-8?B?ZWs1Kzhpc3lvMjFXNiszM05oczV5NGZuTWdacXdVUG1qckhnYWR1NG9rZ2Yy?=
 =?utf-8?B?Y3gyUEZ0SWx5cVRDN1R0ek1JQ1NqeDhyM1JMRkRxR2gvWW12UlRSaU5YV1Q1?=
 =?utf-8?B?UmcvT2svd2MybWJheTI1UnhzNkQyendFaTJsQ1luS1hMUHgwT2NjSW9IOVd4?=
 =?utf-8?B?OU1QWlBqdXFjM0tpaGErNkZpZm1VNEZaeFJFYW53MGNSeVJnSHBNUU5IVmIw?=
 =?utf-8?B?cG1JZG9vMlorOC9sS0JlVkFldWF6cVVkQlZoTXE5QzJ3ODh4bE9MUE93TGhD?=
 =?utf-8?B?cWN0ZmFlMEVvSjFDNVFrK3N6WkRpN3FzVzJMYWt1MnVZM3dwRG5ac2lpMXZL?=
 =?utf-8?B?SG1wRXVNSjFOYlNReTMxMXhqS0tjMHN4ODltVU0xby9tUS9Zc0oxeHBDT2sw?=
 =?utf-8?Q?T8gwf87KCKH26gOJy/e3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(7416011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW8waDVUYllGRlAyWjBUOTR2dUU4SEloTHk3bTZSYVhNY2pFUHVRNTR2ZXF1?=
 =?utf-8?B?SEl3R3ZPZzhzYURTOUNIUUo5RkFrVUtIMzJ6aGQ5OEh3S1hUVVFVckhhU21a?=
 =?utf-8?B?aWdCREovNnovakhHSnNOcFA3NVhSRFRSdzlGYnZIMVRoU1NhMStiQ1ZFWVNJ?=
 =?utf-8?B?L25sTEc4WTYxb3I1S2UxdzAySVZLTUhpUmIxdWVQS2I2dHBBMDVYVDBUWnIz?=
 =?utf-8?B?Yk94ZEJJR0ZVemtaSWdpczEvTC9yVTZBSWdRTnNjb2ZSYjZBQzZna0V5YVkx?=
 =?utf-8?B?K3QvL1loWlpzMDliWk5PWDFFYllkamdPQXFpVE81bzB4Q0lkbFYvVDNVTlhk?=
 =?utf-8?B?b3ZDNUFJT0l1L2NjSEY3MFl4MGtNa0xhNXZPcEtBamJyT1lxdDZGK0JTR1p6?=
 =?utf-8?B?L00rTDJYbjRCTERRT0tjMjhReDFTQXdCNVlid1ZLZWc2OCtsYmIwWHRzaTda?=
 =?utf-8?B?QUdpcC85SHZ3bHN1SzdTL0x3WXJWa1k0Mm1HRzdmVjlSbE10MXA4NnVkTUw2?=
 =?utf-8?B?UjJzUGlIaGpBa2ZYeXBMekZzUFBELzIzSnRpL2xZbVc1Z3NsMmprcTdkVFNp?=
 =?utf-8?B?REhhL1lEempaY1IwWXZOU1dtbnFxRGlTS1ppdGpkT2hrOGFETW9LSitqYytY?=
 =?utf-8?B?WUJLRVB6VHIxS2xoN1NCK0NKLzQxalU4L0UxSDArMDg4V0JRVjY0czRxK1l6?=
 =?utf-8?B?QmU2KzZGcXlRUUk1RzZuQ0NLeUwrMllpR0c4OTFySlY3TjJkRTZoMVNyUUV6?=
 =?utf-8?B?TFJFcUozdmc0RVlvMzBWZ0p4VWFkQ21kd3g2MVo1M1l1b2dkVWZiUjFLZjEw?=
 =?utf-8?B?cWYxaXdYMGRRTlBXb1JxZXlUQVdvcWpDdjBmSy8wOENoaWJ0THlZbGQ1VkJI?=
 =?utf-8?B?NUpkMjNERWtFdmlOTzRNM1kzUHA0VjhCOWd6bWg1OE82SngwL2FCME40TDZO?=
 =?utf-8?B?Z1Q2N0tlbmJkNEF6N1VRN3dOYVhHZXlEekdxdlhWSW92d3lvUXk5MHAxL3lX?=
 =?utf-8?B?Q25UaE9CeDE2RThjeUx1RFFLZ0pPc3RhTGhnWnlzSkwrM041VFRQMVpDOTZP?=
 =?utf-8?B?UHBPN09kVEw4eGFXL1hweTJvTXBZR0R1cWp0ZlJNNHpYbU5TdUJkNG9semx6?=
 =?utf-8?B?Z3hLaTJvcWtkUTY4YVoxcmEvWVJyRTM1b3o1TUI1QjcxQ0tMZ2d0SHJyMlJU?=
 =?utf-8?B?UEdSRUxuckI2TlB2M05YYXArMUQ4eVVzWmxicTNyQnZLalRNNVRodFJWYjZm?=
 =?utf-8?B?ZjhUR0JPMUttWEZzV0tPK1M5TWJFOXM5SmpmMExrRnlVcFBlWnE1ZklVQ0lm?=
 =?utf-8?B?UnMvQ2N3YTlOeDJxeXlXUll1UGVLY0VZTWpHS0hVVm1aMXVwYVhleWVoRldx?=
 =?utf-8?B?ZmxTTVZCeG9Pa2RlTkpiWGx0Q0RSamRkemp3UEZhbFlmQXBOeUtzanUzSGdG?=
 =?utf-8?B?V1Z1TU1vOXJsWHc0bDJLUS9TSk1mbFhLek15dkNYbDljZFFwWDhPRSswOHhN?=
 =?utf-8?B?bEYzYVVnKzBhUzd6VXhnRnlub004NTBYVVhnSW1tRGJVUElyOWpSUFBvSGNB?=
 =?utf-8?B?ZVJaZWRCOHVnaWlhd3A1T1pxSk5idHg0dFBJM3RTOGpnQy85dWlqemRjU21h?=
 =?utf-8?B?RUMvOXYxa1dlL0JSYmdVZ3NaakZGSDB1cnVDVUpTRHFTWDRRTHFSZ1lGWWFS?=
 =?utf-8?B?V01Nekp2QW1PcGRySEtDTTk5Y3duUGsvWkh5cXorQkRIYjJicXU2and4U2hN?=
 =?utf-8?B?ajBoTVI0bVNySGFzY0k1Vk5HZXgrRzJZcXpXQnhldzI1WnAyTWpxdlJ1THBS?=
 =?utf-8?B?TllidG5DR1EzSWgwcjc4VWpvUmNPTzdPOUc5MHZGRmdnOUpyWTZOdXBpSFlr?=
 =?utf-8?B?WnBWT0g5NkQxek1QTW0xNWxXeTdUMWE5Rnd4czY1U0dHM1pPaXhycGQ2UEND?=
 =?utf-8?B?dHBzVVBJaHoyeVN3OEpHQ1lNbUN2MUVCUDFyQmZzdEdaV09hOWxlYkw5SVp2?=
 =?utf-8?B?N012akJBYmlERlNRa1dueUVKS1NWTkhDOFpTSGFtdUYrd05hRVhXUmR6SllC?=
 =?utf-8?B?RXFqajdQaDhqUTZYcVlTRTNaZlZPZ3gzM3ozZHdBREgwZVordzFOTXY4WGxV?=
 =?utf-8?Q?X9ZrXUruUg98VIkVMLKQRCJhj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0355a6cc-e8b8-470d-630f-08dc8c7896e9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 13:47:53.6887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zaEwMOy/kqq/xphjo3Os1BI3Gwvo5fG7qGxTBS9h+BgujXVOLqYwkBCZ1XlPpmaSpBqhfoWUTsn3iIxDNNpMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6821
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

On 6/14/2024 03:15, Thomas Zimmermann wrote:
> Hi Mario
> 
> Am 13.06.24 um 07:17 schrieb Mario Limonciello:
>> If the lid on a laptop is closed when eDP connectors are populated
>> then it remains enabled when the initial framebuffer configuration
>> is built.
>>
>> When creating the initial framebuffer configuration detect the
>> lid status and if it's closed disable any eDP connectors.
>>
>> Also set up a workqueue to monitor for any future lid events.
> 
> After reading through this patchset, I think fbdev emulation is not the 
> right place for this code, as lid state is global.
> 
> You could put this into drm_client_modeset.c and track lid state per 
> client. drm_fb_helper_lid_work() would call the client's hotplug 
> callback. But preferable, lid state should be tracked per DRM device in 
> struct drm_mode_config and call drm_client_dev_hotplug() on each 
> lid-state event. Thoughts? Best regards Thomas

This is pretty similar to what I first did when moving from ACPI over to 
generic input switch.

It works for the initial configuration.  But I don't believe it makes 
sense for the lid switch events because not all DRM clients will "want" 
to respond to the lid switch events.  By leaving it up to the client for 
everything except fbdev emulation they can also track the lid switch and 
decide the policy.

I also worry about what happens if the kernel does a hotplug callback on 
lid events as well at the client choosing to do it.  Don't we end up 
with two modesets?  So then I would think you need a handshake of some 
sort to decide whether to do it for a given client where fbdev emulation 
would opt in and then all other clients can choose to opt in or not.

>>
>> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> Reported-by: Chris Bainbridge <chris.bainbridge@gmail.com>
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3349
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>> v2->v3:
>>   * Use input device instead of ACPI device
>>   * Detect lid open/close events
>> ---
>>   drivers/gpu/drm/drm_client_modeset.c |  29 ++++++
>>   drivers/gpu/drm/drm_fb_helper.c      | 132 +++++++++++++++++++++++++++
>>   include/drm/drm_device.h             |   6 ++
>>   include/drm/drm_fb_helper.h          |   2 +
>>   4 files changed, 169 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_client_modeset.c 
>> b/drivers/gpu/drm/drm_client_modeset.c
>> index 31af5cf37a09..b8adfe87334b 100644
>> --- a/drivers/gpu/drm/drm_client_modeset.c
>> +++ b/drivers/gpu/drm/drm_client_modeset.c
>> @@ -257,6 +257,34 @@ static void drm_client_connectors_enabled(struct 
>> drm_connector **connectors,
>>           enabled[i] = drm_connector_enabled(connectors[i], false);
>>   }
>> +static void drm_client_match_edp_lid(struct drm_device *dev,
>> +                     struct drm_connector **connectors,
>> +                     unsigned int connector_count,
>> +                     bool *enabled)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < connector_count; i++) {
>> +        struct drm_connector *connector = connectors[i];
>> +
>> +        switch (connector->connector_type) {
>> +        case DRM_MODE_CONNECTOR_LVDS:
>> +        case DRM_MODE_CONNECTOR_eDP:
>> +            if (!enabled[i])
>> +                continue;
>> +            break;
>> +        default:
>> +            continue;
>> +        }
>> +
>> +        if (dev->lid_closed) {
>> +            drm_dbg_kms(dev, "[CONNECTOR:%d:%s] lid is closed, 
>> disabling\n",
>> +                    connector->base.id, connector->name);
>> +            enabled[i] = false;
>> +        }
>> +    }
>> +}
>> +
>>   static bool drm_client_target_cloned(struct drm_device *dev,
>>                        struct drm_connector **connectors,
>>                        unsigned int connector_count,
>> @@ -844,6 +872,7 @@ int drm_client_modeset_probe(struct drm_client_dev 
>> *client, unsigned int width,
>>           memset(crtcs, 0, connector_count * sizeof(*crtcs));
>>           memset(offsets, 0, connector_count * sizeof(*offsets));
>> +        drm_client_match_edp_lid(dev, connectors, connector_count, 
>> enabled);
>>           if (!drm_client_target_cloned(dev, connectors, 
>> connector_count, modes,
>>                             offsets, enabled, width, height) &&
>>               !drm_client_target_preferred(dev, connectors, 
>> connector_count, modes,
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c 
>> b/drivers/gpu/drm/drm_fb_helper.c
>> index d612133e2cf7..41dd5887599a 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -30,6 +30,8 @@
>>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>   #include <linux/console.h>
>> +#include <linux/input.h>
>> +#include <linux/mod_devicetable.h>
>>   #include <linux/pci.h>
>>   #include <linux/sysrq.h>
>>   #include <linux/vga_switcheroo.h>
>> @@ -413,6 +415,128 @@ static void drm_fb_helper_damage_work(struct 
>> work_struct *work)
>>       drm_fb_helper_fb_dirty(helper);
>>   }
>> +static void drm_fb_helper_lid_event(struct input_handle *handle, 
>> unsigned int type,
>> +                    unsigned int code, int value)
>> +{
>> +    if (type == EV_SW && code == SW_LID) {
>> +        struct drm_fb_helper *fb_helper = handle->handler->private;
>> +
>> +        if (value != fb_helper->dev->lid_closed) {
>> +            fb_helper->dev->lid_closed = value;
>> +            queue_work(fb_helper->input_wq, &fb_helper->lid_work);
>> +        }
>> +    }
>> +}
>> +
>> +struct drm_fb_lid {
>> +    struct input_handle handle;
>> +};
>> +
>> +static int drm_fb_helper_lid_connect(struct input_handler *handler,
>> +                     struct input_dev *dev,
>> +                     const struct input_device_id *id)
>> +{
>> +    struct drm_fb_helper *fb_helper = handler->private;
>> +    struct drm_fb_lid *lid;
>> +    char *name;
>> +    int error;
>> +
>> +    lid = kzalloc(sizeof(*lid), GFP_KERNEL);
>> +    if (!lid)
>> +        return -ENOMEM;
>> +
>> +    name = kasprintf(GFP_KERNEL, "drm-fb-helper-lid-%s", 
>> dev_name(&dev->dev));
>> +    if (!name) {
>> +        error = -ENOMEM;
>> +        goto err_free_lid;
>> +    }
>> +
>> +    lid->handle.dev = dev;
>> +    lid->handle.handler = handler;
>> +    lid->handle.name = name;
>> +    lid->handle.private = lid;
>> +
>> +    error = input_register_handle(&lid->handle);
>> +    if (error)
>> +        goto err_free_name;
>> +
>> +    error = input_open_device(&lid->handle);
>> +    if (error)
>> +        goto err_unregister_handle;
>> +
>> +    fb_helper->dev->lid_closed = dev->sw[SW_LID];
>> +    drm_dbg_kms(fb_helper->dev, "initial lid state is set to %d\n", 
>> fb_helper->dev->lid_closed);
>> +
>> +    return 0;
>> +
>> +err_unregister_handle:
>> +    input_unregister_handle(&lid->handle);
>> +err_free_name:
>> +    kfree(name);
>> +err_free_lid:
>> +    kfree(lid);
>> +    return error;
>> +}
>> +
>> +static void drm_fb_helper_lid_disconnect(struct input_handle *handle)
>> +{
>> +    struct drm_fb_lid *lid = handle->private;
>> +
>> +    input_close_device(handle);
>> +    input_unregister_handle(handle);
>> +
>> +    kfree(handle->name);
>> +    kfree(lid);
>> +}
>> +
>> +static const struct input_device_id drm_fb_helper_lid_ids[] = {
>> +    {
>> +        .flags = INPUT_DEVICE_ID_MATCH_EVBIT | 
>> INPUT_DEVICE_ID_MATCH_SWBIT,
>> +        .evbit = { BIT_MASK(EV_SW) },
>> +        .swbit = { [BIT_WORD(SW_LID)] = BIT_MASK(SW_LID) },
>> +    },
>> +    { },
>> +};
>> +
>> +static struct input_handler drm_fb_helper_lid_handler = {
>> +    .event =    drm_fb_helper_lid_event,
>> +    .connect =    drm_fb_helper_lid_connect,
>> +    .disconnect =    drm_fb_helper_lid_disconnect,
>> +    .name =        "drm-fb-helper-lid",
>> +    .id_table =    drm_fb_helper_lid_ids,
>> +};
>> +
>> +static void drm_fb_helper_lid_work(struct work_struct *work)
>> +{
>> +    struct drm_fb_helper *fb_helper = container_of(work, struct 
>> drm_fb_helper,
>> +                               lid_work);
>> +    drm_fb_helper_hotplug_event(fb_helper);
>> +}
>> +
>> +static int drm_fb_helper_create_lid_handler(struct drm_fb_helper 
>> *fb_helper)
>> +{
>> +    int ret = 0;
>> +
>> +    if (fb_helper->deferred_setup)
>> +        return 0;
>> +
>> +    fb_helper->input_wq = create_singlethread_workqueue("drm-fb-lid");
>> +    if (fb_helper->input_wq == NULL)
>> +        return -ENOMEM;
>> +
>> +    drm_fb_helper_lid_handler.private = fb_helper;
>> +    ret = input_register_handler(&drm_fb_helper_lid_handler);
>> +    if (ret)
>> +        goto remove_wq;
>> +
>> +    return 0;
>> +
>> +remove_wq:
>> +    destroy_workqueue(fb_helper->input_wq);
>> +    fb_helper->input_wq = NULL;
>> +    return ret;
>> +}
>> +
>>   /**
>>    * drm_fb_helper_prepare - setup a drm_fb_helper structure
>>    * @dev: DRM device
>> @@ -445,6 +569,7 @@ void drm_fb_helper_prepare(struct drm_device *dev, 
>> struct drm_fb_helper *helper,
>>       spin_lock_init(&helper->damage_lock);
>>       INIT_WORK(&helper->resume_work, drm_fb_helper_resume_worker);
>>       INIT_WORK(&helper->damage_work, drm_fb_helper_damage_work);
>> +    INIT_WORK(&helper->lid_work, drm_fb_helper_lid_work);
>>       helper->damage_clip.x1 = helper->damage_clip.y1 = ~0;
>>       mutex_init(&helper->lock);
>>       helper->funcs = funcs;
>> @@ -593,6 +718,9 @@ void drm_fb_helper_fini(struct drm_fb_helper 
>> *fb_helper)
>>       if (!drm_fbdev_emulation)
>>           return;
>> +    input_unregister_handler(&drm_fb_helper_lid_handler);
>> +    destroy_workqueue(fb_helper->input_wq);
>> +
>>       cancel_work_sync(&fb_helper->resume_work);
>>       cancel_work_sync(&fb_helper->damage_work);
>> @@ -1842,6 +1970,10 @@ 
>> __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper 
>> *fb_helper)
>>       width = dev->mode_config.max_width;
>>       height = dev->mode_config.max_height;
>> +    ret = drm_fb_helper_create_lid_handler(fb_helper);
>> +    if (ret)
>> +        return ret;
>> +
>>       drm_client_modeset_probe(&fb_helper->client, width, height);
>>       ret = drm_fb_helper_single_fb_probe(fb_helper);
>>       if (ret < 0) {
>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>> index 63767cf24371..619af597784c 100644
>> --- a/include/drm/drm_device.h
>> +++ b/include/drm/drm_device.h
>> @@ -316,6 +316,12 @@ struct drm_device {
>>        * Root directory for debugfs files.
>>        */
>>       struct dentry *debugfs_root;
>> +
>> +    /**
>> +     * @lid_closed: Flag to tell the lid switch state
>> +     */
>> +    bool lid_closed;
>> +
>>   };
>>   #endif
>> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
>> index 375737fd6c36..7fb36c10299d 100644
>> --- a/include/drm/drm_fb_helper.h
>> +++ b/include/drm/drm_fb_helper.h
>> @@ -143,6 +143,8 @@ struct drm_fb_helper {
>>       spinlock_t damage_lock;
>>       struct work_struct damage_work;
>>       struct work_struct resume_work;
>> +    struct work_struct lid_work;
>> +    struct workqueue_struct *input_wq;
>>       /**
>>        * @lock:
> 

