Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E64D972AC4
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 09:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8032210E055;
	Tue, 10 Sep 2024 07:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hAXayI3a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4745110E055
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 07:30:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wLsJt5+ythu0aGRhJdBOdc9o7dbpGQ1t8FYkkReLizCkPqVNwpzLf9pa97uHh4H1r57UT/b2PlyZ8dqcPIOGXn2ETjpuQ4XdPqVidXTo0Oa1r0cem4ELScVT5IJUoqYFDVMc4GJq8QFqE0PEN/58B4W6vA92FOaHQNgGzlr5X6pHzop71iCHrvqZgKicCRT6MPH/jE7Z9Tw4mga5UqlzRavecn/fDAcBr7rCP8Zy9cBWg3bGYq8gPzD2qTC5mauh/teqfpJ9KRv2c5vBNc/q+l94ATSD31GGR6049Zxeygar6de+7v3fzNVCY8RpohVzI5iRe7TrdsRqSdjcwR6+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PtsbJs4qGVo1sCWuBx+8n3jIJDQ1GYbuuHGf+/6xKc=;
 b=j0lLaTnzTYWdTuIHDcqeDr7T6+V/lOOnnm5N2iDZhDV+ZHEQcVeRxoROf7I1mJCmpOytni1Say+GfOAVKyXBoH52ZwnDwfVwxVATeEU0QUAMnPW7rRL9HyZLew1WxQdB00mSkOft8gS12PTKvWbsx9uaOoUa/6npQPh2Nlf4E7dO+UUYc+UiSwT27FK8/3NQVDe+TdZ7Rl+mDYpEMzln7PDHuwZwi7qMR8VSAPudDVag3XFbsLyjKWbuyMgoInZN8IlWFAs6CYWj4tRt/9W3JfpewBgRqqxQJRLxKVKEqvDI5ahlR62kO61B2fLT3BbDPM7ReN4S0+z7hVKFdsDfsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9PtsbJs4qGVo1sCWuBx+8n3jIJDQ1GYbuuHGf+/6xKc=;
 b=hAXayI3ajt6nywqqaWuPt3k1wxyLglLGWInJpl810M9qXHrwhC3SapRM6f3lpjaXvng8p0s/aiOEo6+N3jYh4jeeWNlrtqE+VEQv3B3g6PgKPYnAlW9fWzYRb46JMA950GJgTqlgYjsl+ESDCVPo5Q1O+GLfg4GQGDt22yGpnGg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW3PR12MB4380.namprd12.prod.outlook.com (2603:10b6:303:5a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Tue, 10 Sep
 2024 07:30:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 07:30:52 +0000
Message-ID: <7aef07b2-9859-40a8-ba5b-22aba68c2d9c@amd.com>
Date: Tue, 10 Sep 2024 09:30:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/syncobj: Fix syncobj leak in drm_syncobj_eventfd_ioctl
To: Tvrtko Ursulin <tursulin@ursulin.net>, "T.J. Mercier"
 <tjmercier@google.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Xingyu Jin <xingyuj@google.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240909205400.3498337-1-tjmercier@google.com>
 <c970dfb2-078c-4bf1-8b50-6e535cf4adf7@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c970dfb2-078c-4bf1-8b50-6e535cf4adf7@ursulin.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0318.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW3PR12MB4380:EE_
X-MS-Office365-Filtering-Correlation-Id: 03062741-ea59-4283-0d4a-08dcd16a7fa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjY1dDlreTlxQnIvdHhGMDBxK2lEZUsvL1l5cFJQR2p0L2JFSUtKMW95UFpK?=
 =?utf-8?B?TjVDTEdaVWoybVUxV2JzS24wUDFjZERWY3N0UmZ0aWlxcTV1U3d0eHJxVEdW?=
 =?utf-8?B?NE83bEVSSEhXT05EMGlPOHM3d2FnWjZPQ2dFRlg5NGtvS1JGWmlkMFh1YmFq?=
 =?utf-8?B?MS9CT1hWOWFVNC9yTTJQQ1MrY09MM2gzS1MvdmprVEd6dUVieUVPdTl6YTAz?=
 =?utf-8?B?Z2JqcE5GKytLK3B3clRFV0t1dWR6c0VubHF3OTlueVpDUFNEUjRCYmFoVEEz?=
 =?utf-8?B?aUlGMUNGWlcvTWhjZGxlSjVBWExIdXJxYmxTTWR0S0JndlJOZituWFIwNC8z?=
 =?utf-8?B?WlhjTUF5U0lwOHVHTXVUTjA3ZTd0V2JMdTdJc0xYV2I1aUhsd05RL3Z4VHp4?=
 =?utf-8?B?TzZucVlGTEYyN0xoU1VpYVp3TWdJemhvV1dLNks4VnJKMTBtYVoxNnJ6U3Rj?=
 =?utf-8?B?aWRxL2doVG9TRXFPaGV4TjhadGhDUmRWQkhET1pEWkpzVUZmM0pzUVhNKzFm?=
 =?utf-8?B?Rkx2VUwxQkZtaUYwZUFtekRuTHUzNTZNR0Nyb2I4dktJb2tZaHJkazRORWdT?=
 =?utf-8?B?bXRhQkd2ZDhLNmJTZGo0SHhxUXBUMi9hWEJ3cWtuSmozQ0ZEbXMwTGRMZDA4?=
 =?utf-8?B?VkdnWUZTMVhCZ3JzR2lrYm1IYzZWbmpYT2QyWlZPT0JoTm0wL0dycjVnWS8v?=
 =?utf-8?B?RjR6bHhIWTNYOG80OXlOSXNFWU85Q0poNjB3Nzlod3hYeVFNVlNIVkYrZ0Ni?=
 =?utf-8?B?bkR3am9GbzBCMzhrbFlBMUxkSlRPaGsxSHQwQzN1UTZ1RW0xc2pHNVlJcTFS?=
 =?utf-8?B?TnhCdW9YNmdsajFVY2M2TnJsMVlRNHF5ZWpJTmpDdXpwUkQrRUtpVUdTWHYz?=
 =?utf-8?B?eTFkUytSQit3M2wzRzdibTB0OURBcDJoZTBYNDFhRVVsQ2pUYVp5UFVYWDdS?=
 =?utf-8?B?dUtsTXBzUitNRG1xVFJVcStWeVhvdnppM2xwOEthcENXUzZvamlqSktEdWla?=
 =?utf-8?B?ZEIxRHNNQzNXUzE4SGZIMmhYYUpLVGhlanQzWE1wT1ovYUJGcVJsRzcwbTNS?=
 =?utf-8?B?VnM5YWdnNjFYYWdsSVp1RDgxQXJqRjN3eHBib0ZyQUd0N0NmZHY2MG12WVdQ?=
 =?utf-8?B?U0QrSUQrUW5BQ1VCdGEwcVlwdXZqK1BGSXVJNlUwK2NlakxmT2dmUmdtTHJv?=
 =?utf-8?B?RkpTcE9oYVY0QjVIR1FReG5zQjFnSUNpenhJZWpWZldhdkFTRUI4RE1XMm1P?=
 =?utf-8?B?VzVVOXhZcjNXVVZCSzlKR3c1QWZxVi9NUEZ3ZFNDZjc0WVZBMWNzOWFzWGxn?=
 =?utf-8?B?OVpwdlY2S25TR1FrWWRoR2N3a2ZxOTM1TFlQanJLcllSQThvVmo0SjdHTjZz?=
 =?utf-8?B?UTBsd2RKRlFKK3FsZUFDVVlkbVVoTnJORGRMTVNONWsvb3JEVzljZWs1SE53?=
 =?utf-8?B?S045UWo5T3c1VGp6U1FYb3J4L214WEVua2E0QjhjZVUxQXFTMVpTeHJuQTlu?=
 =?utf-8?B?LzZQVXk5SXc3bituOHZmL3ZibEhqR0F1UGc1VVEycjVXM2VXVmRIT3BWaDJL?=
 =?utf-8?B?RWlmSlJQM2dXaDh6RDNPQkdMZ3NyUzk4eU5LWEpkOGJSUHplSkVKOHVmNStR?=
 =?utf-8?B?RU1ueWpmaStlT1JOZFNRaWhxbEEvZTVuSlZWck00K2RwTVdQNWJXMnBYSUZ1?=
 =?utf-8?B?WndmVkladk4rV2JvVER4SGNLOGRHOCt2VVRTY0Q3cXJsMm4wUjUxUWEwb3lF?=
 =?utf-8?B?NmpqcVhZc3pVbC81and0amVDUUdYUnkraW85bzhrZDRNZittcUxPdGppYWxu?=
 =?utf-8?B?ZjhMNFFpVDU3MFEvS21rZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDV5b3JIdm0xelhvbzk4bWluRGZWMmVDSkx0Q21JYWpFa0lTMTM4NkZ0WGgw?=
 =?utf-8?B?R1IwSlBWOWtHMHZ6MXF5Vzg3NElSQm5pUCtNbFBJUlNlR0ppWVc5d0NuVlVr?=
 =?utf-8?B?TUJyUkthTzFZdmtkNndKMXY2bHY5VWx0U00vYmg1VXdlM3Y5ajdLK1puOFRq?=
 =?utf-8?B?WFZQS3UyaERHZ09LaldZbFdheVEvNUJ5elVLRXIrZE4yV2dQalFTaVZWdmFX?=
 =?utf-8?B?UTJEZmtLSTVMQW1HVWQ4MXI5SGNuZ1I3WG1nZUM3R25MNlEzY2hNUlFXSVNF?=
 =?utf-8?B?UXpRcmNFQVZCWjczZGVwbWgwbXo2VGpDTE55R2JhQjM3K3p5cmppdllRcTNi?=
 =?utf-8?B?L0Jpd2N0Q3JPTGViKzBrZ01wdmc4MEI5ZThOdHU4Zzk4TVRLZGJ5SnRZQjBi?=
 =?utf-8?B?d3VQYWxXa1RQb3U4YXhZUEI1STlCU0lSVTBKNzViRksxZzJnUk5nbXBGUE9K?=
 =?utf-8?B?ZStWNWlJaXhSSkJ3QjJsdFVTQ2E2b00rTTJaU0VRYi9mQ0FZdFFyRVRxTEJp?=
 =?utf-8?B?V0VYN2pUSjVSNnA1cldWbUFXUEl3azNySktjclNlMi9VbnJ3MnVMVmRJQjJl?=
 =?utf-8?B?WTJ5SzhiRGdkd2NwdlgwOVhoRmZlOHp3NWpack1MNUptaXZyamk5SStpTWRw?=
 =?utf-8?B?TllabjhSMnVGempQZHRtR3NxRUJGb2orbXFuQzhiU3J3THZtcmIzaVZZL2pO?=
 =?utf-8?B?MWM5eTE4ZmVpeVMxK0dYQzFaeHJOUmlnenFrR255encvM3Zsemt5cVBkeWNC?=
 =?utf-8?B?Rm5HYlFja2xUcllSY1ZBN1dQMGhJSUZKeHBBZUNGVm45R3pXT1gzY05HaDFr?=
 =?utf-8?B?c0N5Nmw0d3VudTY4ckhpTDdLbCtoUGNySkQwZDZjYWN2SFc5QktDTGNCTkQ1?=
 =?utf-8?B?Y0RURzRRWXZzL1RGQnBoOXlOVjk1ZE1XV2VQS3gxWXZ2WUZST01rRnI4eXhS?=
 =?utf-8?B?VmRUM1FBWnNmUk96UjJCT2h1TFJVbjB4ZjVTZkxsNGpmK25hdVZtMWIvTHFJ?=
 =?utf-8?B?TWRXNG5CdWlsRmtCdCtMWFl0SGh4K3hMeFRuTlRiUHBzLy9xKzNtVFQ4bnkx?=
 =?utf-8?B?TmRYSVZMeXN1VVNXMlBFWWlLSVBwc3UyUU5KU1N6YUg2SlIxbTZDUXNpTlUx?=
 =?utf-8?B?NExISXQ1b3JTb1ovZmdIR0ZENTgvUUtuMjE2VGwyWGJIdmg4bW1xVEFZSTZH?=
 =?utf-8?B?c2dXaUE3T3JtaEY5enBYMXBGWHo0ZVY0elBzT2s4K2U3VHVNQXFaTHBTN0pl?=
 =?utf-8?B?VVJBa2l4WjgrOEdPVmxORHBUTTd0eE9UTzQ4TDR4TTk4SUpZdjNpMklhZ0U0?=
 =?utf-8?B?Sm9tRlJ4ZWNkRXB3bWc0Wm9Ea0FGUWovWklRc2UzcGhUc1k2azhjS1hjV05p?=
 =?utf-8?B?cXV3ZXMvenl4dGxuazhEUmZjWFlyS1ZxaEI0UGdhNjZ5THQ4K2JtUFN1SVcx?=
 =?utf-8?B?RU85SXA4eERtV1NVU2xpbTBjNDFOU0NVNzB2cW1KaUpBUURyZzF3R2t0Y0Qz?=
 =?utf-8?B?cjJna3BJeUV5OWlxVERMM01BQWJ4MDUvalZISlhpVUhHaDdCVnZvNklxWTNi?=
 =?utf-8?B?TDUrb1BPQWwxTzYxY2h0Z1FETmozd1ZZUlVHRWN0SUl3Y3lQcThDRDFjZHhr?=
 =?utf-8?B?V1RBWERZTlMxSm5MR1VWVmJuZFVaQmI0V2ErYUdPV2FVb0RTRFIrcWtNdFgv?=
 =?utf-8?B?UHBmL1haT1FQdXpxSGc2M2ZlUTJQV2FKWjBMMjlQYU5HWlZjM0JNK2RXZThF?=
 =?utf-8?B?RGUvK3lNaEZBZ3R5Y3Q5U2NOcTlOaU43bXU3bFE3Z2lBUDIzYTRyeU9GQXVI?=
 =?utf-8?B?OHdkbW9abVV2RTlvK2kxMkFBY3lybThxUGF4M053MXEzbFJJYkg2T0lkdmQw?=
 =?utf-8?B?cDRlbnNhbjhhUlBpOUZrSFI5c084SzBHd0REYktJc0t5ckZIdWY0czRBbFEy?=
 =?utf-8?B?NGtjTGhFc0VTdDUzL2s0MnUyUEdWdHJXNTErZXBQUUNHenNNYkF1ZnliUE5Y?=
 =?utf-8?B?RElVREZGaXpXbjhzMTJUVG1Nbks4Y202REZwRWYrVnV3N0tIL0FNNU5Dejh6?=
 =?utf-8?B?NmlUYTVZTUxnWnFLcHpGN0FHUmlhRlJzNFhaMTdYUG9LV3ptN2NaVGxiRWdx?=
 =?utf-8?Q?8T1o=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03062741-ea59-4283-0d4a-08dcd16a7fa2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 07:30:51.9920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ub07qoauX3ulPB/tWrndcEoGMIqeB0l4JUhIrvoY8YjASruw1xP7DNxPuA+JlN8m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4380
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

Am 10.09.24 um 09:26 schrieb Tvrtko Ursulin:
>
> On 09/09/2024 21:53, T.J. Mercier wrote:
>> A syncobj reference is taken in drm_syncobj_find, but not released if
>> eventfd_ctx_fdget or kzalloc fails. Put the reference in these error
>> paths.
>>
>> Reported-by: Xingyu Jin <xingyuj@google.com>
>> Fixes: c7a472297169 ("drm/syncobj: add IOCTL to register an eventfd")
>> Signed-off-by: T.J. Mercier <tjmercier@google.com>
>> ---
>>   drivers/gpu/drm/drm_syncobj.c | 17 +++++++++++++----
>>   1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_syncobj.c 
>> b/drivers/gpu/drm/drm_syncobj.c
>> index a0e94217b511..4fcfc0b9b386 100644
>> --- a/drivers/gpu/drm/drm_syncobj.c
>> +++ b/drivers/gpu/drm/drm_syncobj.c
>> @@ -1464,6 +1464,7 @@ drm_syncobj_eventfd_ioctl(struct drm_device 
>> *dev, void *data,
>>       struct drm_syncobj *syncobj;
>>       struct eventfd_ctx *ev_fd_ctx;
>>       struct syncobj_eventfd_entry *entry;
>> +    int ret;
>>         if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
>>           return -EOPNOTSUPP;
>> @@ -1479,13 +1480,15 @@ drm_syncobj_eventfd_ioctl(struct drm_device 
>> *dev, void *data,
>>           return -ENOENT;
>>         ev_fd_ctx = eventfd_ctx_fdget(args->fd);
>> -    if (IS_ERR(ev_fd_ctx))
>> -        return PTR_ERR(ev_fd_ctx);
>> +    if (IS_ERR(ev_fd_ctx)) {
>> +        ret = PTR_ERR(ev_fd_ctx);
>> +        goto err_fdget;
>> +    }
>>         entry = kzalloc(sizeof(*entry), GFP_KERNEL);
>>       if (!entry) {
>> -        eventfd_ctx_put(ev_fd_ctx);
>> -        return -ENOMEM;
>> +        ret = -ENOMEM;
>> +        goto err_kzalloc;
>>       }
>>       entry->syncobj = syncobj;
>>       entry->ev_fd_ctx = ev_fd_ctx;
>> @@ -1496,6 +1499,12 @@ drm_syncobj_eventfd_ioctl(struct drm_device 
>> *dev, void *data,
>>       drm_syncobj_put(syncobj);
>>         return 0;
>> +
>> +err_kzalloc:
>> +    eventfd_ctx_put(ev_fd_ctx);
>> +err_fdget:
>> +    drm_syncobj_put(syncobj);
>> +    return ret;
>>   }
>>     int
>
> Easy enough to review while browsing the list:
>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Looks reasonable to me as well.

Reviewed-by. Christian König <christian.koenig@amd.com>
CC: stable?

Let me know when you need someone to push it to drm-misc-fixes.

Regards,
Christian.

>
> Regards,
>
> Tvrtko

