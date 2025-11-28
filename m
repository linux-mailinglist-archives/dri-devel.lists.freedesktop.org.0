Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F98EC91907
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 11:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C9510E8A1;
	Fri, 28 Nov 2025 10:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="m3CqhfTy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010047.outbound.protection.outlook.com [52.101.46.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4A010E8A1;
 Fri, 28 Nov 2025 10:06:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRbyHvmV/uKKGmdHu7vz+tds/7XiBiVmD/LXd3/n8YWnQHi/3giqVYwohtBfk8Xd+6x+GFUmg2tqx+bYKhxhWPIX1N52z4teSHL9S1ENjB4x/6BH8F2PdPcChzYhiMo794OtPYqdfY7GXaAI2y0QiEj5NPaExgUjcxTjnPWWv542ntf3whCsJk9sC2zAjc+pIiDqpKujip4ufxQZozw+oWI8u4kSgjtYaqjlu9dlyTUbSrBytnzkRRqVBoc9LuqW0eHy+BG5B+gcdBoGx0m8AwQuai0gBoAU+o/4yIEqDZn5OOnA57gnfybN3okxe5+ytcaboahyuvOelA0+XDF3IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apXLzETwzBSq77xgo5RVtp46D+9fxRp/dEaxQDkN8EU=;
 b=xoPqS7F5e37ofpoxoSBNapZ9ZFFtC9MYQ2Tlp7bTa2FfJ9wOTEuc9iVh4xyaR6hneV0blaOx7KevA/jh9JtrRJHst3WHQ+QKGgvV9ANdgbFVwzGGdVic732F3OO6octx2q9Ix9SurFk57ejX82pouo2zUyBv+N0DZVZ5d7qC31ocEzYjUAp0lLLJbNTpM54VUXIAE4ysbWCcbAkRXJwjy4pNJdaPwel6k76eXqGFFjpmYPWW/RsCezagguLP5rAI4ALlWloqGd3b7EdkbLH5iQRXhZkdykVzyoK8jCMb24faLcIY9ae4SBU9vQPBk1QmLxzeG1YhzFp2mhBMmKZWow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apXLzETwzBSq77xgo5RVtp46D+9fxRp/dEaxQDkN8EU=;
 b=m3CqhfTynO6omgcvhnQYaHSa6W31G5Nv2NScIlehkJQq2ZbK/QLPb+W6iENhgd+VfbD0GJxXgFgl9bu3qOkpd+Djp9M6UQ12iW1SMtXqLENVPouJ8j5xCK05SxGa030hHk/+Z4t5/h/B+obkkyq8bleQJpWQ0KqIXTu4OGOKRQ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB6854.namprd12.prod.outlook.com (2603:10b6:a03:47c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 28 Nov
 2025 10:06:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 10:06:22 +0000
Message-ID: <30c8a395-6870-4787-a954-6c9cbc68be62@amd.com>
Date: Fri, 28 Nov 2025 11:06:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/18] drm/amdgpu: independence for the amdkfd_fence! v2
To: phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-14-christian.koenig@amd.com>
 <3cf92ff5fa9c9c73c8464434b0e8e13e402091fd.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3cf92ff5fa9c9c73c8464434b0e8e13e402091fd.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0421.namprd03.prod.outlook.com
 (2603:10b6:408:113::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB6854:EE_
X-MS-Office365-Filtering-Correlation-Id: bc16f402-d5dc-4b0a-41d4-08de2e65c8ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWVxTkk2bzVpVnZmRTNwT05wRGpZd2pHTmVUM1hFbjJ1QTMxOXdFMUNvMDNu?=
 =?utf-8?B?MkxJK2p5aWsyZUhNZTVDZEdjODkyd1J4UnBDbUxudG5RYVRDT043UXpmRE1v?=
 =?utf-8?B?S0hHeTJ0anZjMllZcURINGhLazdmUjgvVFpVZUZocWszSTIxT0NUbGxTcVho?=
 =?utf-8?B?V2MvTzhta21MTGo4cVRNbG5CUDNCNjM4cmxmVWIyclhKK3FUdnhmYXVETkpL?=
 =?utf-8?B?aTg2R3E3QnNhY1k5S0s2eDZWazRBakg4Yit5U01xMnRQR29SRW1wKzUxVkRG?=
 =?utf-8?B?Zk5hQnZZc1lkUUtDWlVBcEhuV24xTkJQQ0pwdGZnMUpLNUJXb2gwWUphSklO?=
 =?utf-8?B?VzE4THZCaVAyTXVOcUk2bXZSQzJheXVhZnU1Ky9YWGdoL3UrUU9UcGh3ckV0?=
 =?utf-8?B?bkVKaTFLdVpkS1NWS3cyY04wdWx3MnRCSHBQcHlmZFVScnNjTGhZVGtVQ2sw?=
 =?utf-8?B?Z1habnVya1QrdFNaa1FCSUdiYi9nZUxzdVhrUitQQlRlUzk3N2c5SHB1NSt0?=
 =?utf-8?B?aW1vNUhQbnE4ODByWHVjK1FoVmNkUE9jRGhzWFd3OVIwaTN6KzErNnA0czhX?=
 =?utf-8?B?SlVQK1JXVXVBOE83OUF4UjEydG8wdlJOQkplaGtFbU5PV0JOQW4wWkNnOWFU?=
 =?utf-8?B?VTZ4RmFGVHJieDMrT0VSbkJvTkxOZ1gwYzRXd2Rsekc2Si95UEUvK2hWNUZE?=
 =?utf-8?B?dXRHU201V0hoL3VhSG82VXoyV2thUTQvM1J0eHlFNHRmQWtMbkYzbUpDSUg3?=
 =?utf-8?B?NHFNWUlndU40SjZ5eTdUUStnRFZmcnhxZmlNR2hBUm9zWS9Ua3BVZDZhTndw?=
 =?utf-8?B?RENZY0VnbFJoRHdBN1JJbXZWOWVoVGRSZGx0QldOM3FJTGdlY3VtejB4SzlB?=
 =?utf-8?B?eWpPcXMxVTVlRkEvTGxPTVpGUDhoNmR3dVpSZ1VJTXVkWnE1UkhNY0lTYlFu?=
 =?utf-8?B?U25MTXltVmJncStLbGVDTGFXSTlsY3JGQUxnNUVDRjB5Nk5lekJaRlRNWXJ5?=
 =?utf-8?B?bFFnN0tlNFFyZ24yNzh1VXJwYUdmVkhWUzRyMDNGL0dxL3JzT3gyOTlGSk9k?=
 =?utf-8?B?VkZFZlc0Qk9FV09OeG9JRXJScFdQeWtjMG9VZnMycEdlcmoyR01DTk5aZm1o?=
 =?utf-8?B?MUlGeHBQekluRDR0Zm85OGNYYUxiN256ZUM2NzV2N3pjNGtpMzNSZ0JQajlN?=
 =?utf-8?B?YjRuWkh0QzEvMHluNS9nZklDNjIxUThzZ1NzOHVtWXN2R0ZMSEJSYkNMbzkr?=
 =?utf-8?B?MzZYMElLeFJjU2RCNVI0dGM3ZHZwc283ay9iM29ua0RzdERGa0hPYnhpYWtP?=
 =?utf-8?B?Z2ZmT1VLM0JvK0t5bzJGZ0tnS2F6dmxoK3p4bzZjS2J1YU4vZnpwbm5NcWE5?=
 =?utf-8?B?b1dFSXlCc1NKT2JzN2QxT0E5R09FcmFDNlVneWpYT1dlRWNpMm5UQzlOUXFK?=
 =?utf-8?B?V0NmQmEwVTZKaExkb1FwWEliblFnaW1iek9waHB1YytoZkVyNXFITGdoRVVP?=
 =?utf-8?B?L1ZzL2l6dVpUMzZrak1zR0pXeFJWS3pGZDdoamtaYmNLS3BJaStpK1gvRjRj?=
 =?utf-8?B?akgxZWkzQVpha2RrRGhWWlFHWTlvTFhNU3hhd214SGFHWGx6UEZUdk53RzFG?=
 =?utf-8?B?M01ycTRaOE94NnljRDFyRVdienk5TEZkNnpBSUdnckt6a2lHNWVRTWprcW84?=
 =?utf-8?B?Q05PYXBkZ043RzE1aE96elZ4aE1CQWFCbUlEcTM5TnYrQXUwZCtVWDVFMFQz?=
 =?utf-8?B?ekcwR1M2a3JzYm1PYXlJeTJmVEVOa1J2cXVsckpuWitCV3hJYnFzbktHMVB5?=
 =?utf-8?B?Q1hVUVJEV1laU1QzaENBSGF4c1V3OFlpUUREbWc2cnZVbUxPdVVJQWlYOENX?=
 =?utf-8?B?Znp3Nkh6S1hVV1FoOFRJd0kvUmNDSFcxUTBTWmFTTFBuWFQvZ1h4blBta09r?=
 =?utf-8?B?SnQ3b0lQU0RxaTF1bXh1MlZibVJWa3Z0UlJWQ2NIbzFrYXh5OWl6aXJ5THlZ?=
 =?utf-8?B?RHVlZnhqbEV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVlHNzBzSzhYM01UTUFRWkE5VWcrVlk0R3ZiTVJIdVJXR0VEcVRtck1UcXE0?=
 =?utf-8?B?YUpKWklqU1ZoL1IvQzVuaWhvVDlFVzlkMFVJbzluV3N3NDJNbmNhSFhvR05h?=
 =?utf-8?B?TU1vY1VITStsUUlxZGV5cTdCM1dJU0tGbHRkZ2VlaSttaW1lVkRpVWh4ejNF?=
 =?utf-8?B?eG04c210YTBqUWJoK0NYemYwNUNESDVQN1pxTmdZbG82bjNWamJ6TkZUZXh0?=
 =?utf-8?B?TWxUbnRMbTY0ZmNxanJiTDBreHJuZkQzd25KcWJvUGE5S0MxSytnVEFzcElX?=
 =?utf-8?B?MDkzNXBKM0RjMW1ESUhiNHZKdkZqcC8xb3NhZlp3UUgrdk93OE54b3ptayti?=
 =?utf-8?B?VWY0Yk5MdHpCUiswbHZITmFNV0o5SzhvamFzamhwVWdjL1EzK2YyVERqejFl?=
 =?utf-8?B?MEZ4bENmc0ZrU3BPRVVBSnZFN1d6bDhhazMyZ0F2NXROZ1VobndyYzNKTXVZ?=
 =?utf-8?B?VzEvU09HVWdvaFFhQjA0eWZnWGFWL1g5L1RFTWZ6QjE4VThLSnB0Um1zVlRx?=
 =?utf-8?B?MW40alV6NTY3dU4zNVhRdzdGb1ltUmQwNTNSS0prZHBsZWNNajM1WENnVXMz?=
 =?utf-8?B?ajUvRVE2b3haYXNwRjRGNi9zQjZsYnZyc2paYXhtL0FMM21CRG5CNmpqdENl?=
 =?utf-8?B?QVRFcVJxdys2UFEzbXJHYXdrOTUyOHIwR3lNMTRPNS9rYUxOdVk0em9aWFUy?=
 =?utf-8?B?Z1JFVi8rc3RiYzFoZTdlY1NQdXNpMVpyWTErc0FPUllKeUdGbzRoSlNFVGNP?=
 =?utf-8?B?U2g3MzJ3UWFEaE5Ha1JrRFRHcFo4aU53cWdGT3VuTk9CWmsxblA2SUJkYnhW?=
 =?utf-8?B?L1NnY21NSU80OHNoeXB0ZytEOGxvdnhQVEFvc0cwalAwSWM0cWs5K1MwWksv?=
 =?utf-8?B?NWhwSnp5a2hLcmVqN0I2dG8zZFdqdlIrMERvaFlST04xZ0ErbG04UTArSmh2?=
 =?utf-8?B?UFQwNys3QW5WMWZCVjgyeGtXTmhIOWZOcnFPMUY0MElGck9ieFlwR3V4WWN4?=
 =?utf-8?B?bTIzd3hjZWRQY1FOMjh0a1VNNG5ZUWZrNUx3dHBVUGxYQ285OVRDL1Arbm9D?=
 =?utf-8?B?d2dGUVpmckIyTHc5cmdmVWRLWGdFbHZvajM5SkROckl3ejg3aTVPWUFPYS9D?=
 =?utf-8?B?OHorWWhrNlJjZktjRFRjT0VjWUJyOGlqM3M3VVJ4OGVKWDFSbUd3QXc5cC95?=
 =?utf-8?B?RHZCYkR6SzZMZGdSK2NVdjlsRjNxdjhBMTJzcHhjZ3JyZHk2bjBlbVVYZmNj?=
 =?utf-8?B?NXJ5SWJvQXB5Mkw2SThwU0RkaXZtSkkyVTRkZC9MRU9zdm5JU2RiWGhRQU0y?=
 =?utf-8?B?RmprK01QSnVIS1ZCL2l2OXV1VVplMW5GMVRydXFISUwyZzI5YmNFLzduRW1U?=
 =?utf-8?B?NUR1dkMrMnNXdEFjRGtRVVA2VUlBNUFINUZjbi9SMmd5ek5oZVFSYjdJQjZQ?=
 =?utf-8?B?OWlTZlVnZFB5WjBJTFJGTFg5K2hUL3lVcURoMytyVG9SS3ZoeFFyRTVGNE5S?=
 =?utf-8?B?VGdsTDNobGQwNUlBK1crVldEY29pbjFYbXFtODhrS0ZFYTAvdDJ0aGVJbTdN?=
 =?utf-8?B?NW53WStmSDkvNlY3SER3TDI5T050QUZWSWNqcmVuUjNESHdMY0dVQVJmMFdJ?=
 =?utf-8?B?Mk1WWUhoYkdmMmQ2bld0OTZ2RDhSTCtyVGcyQUtIUC9nK1BLMzJxaGo5N0U2?=
 =?utf-8?B?c1N2Kzk3dS9MeHlPK1Zsa296QTN3Y0tndGtKZENRUjFIL3luSEdGRmErOWtT?=
 =?utf-8?B?cm90bmNOemZYbm56cUpESEl6ZEZqLzEwMFNCTTBWTTcyVXZseXZleU9LRWhC?=
 =?utf-8?B?ZWJxVkJ3YjNraGk3SmJseCtseXVwdXBVMEk0cUVLUFphWmozVnNmNXRVU3E2?=
 =?utf-8?B?QXM5bHRNa0pxUFFnODdsTUZhbmtWTVBBem9zaHNrWGlxbTFKUmFxNk9samcy?=
 =?utf-8?B?QllCc0RJVTdKZnU5ckwvaVdkRllsRzFkSThISm8wZ3lsQ0RxZzRycmpMb1dK?=
 =?utf-8?B?Z2xZRGU2SXJwSnBkSjJmMitRMzQxekRCNlJuTU1OUzJHUHJ5cHdNTlZ4Mzl0?=
 =?utf-8?B?anpFQmFNbkV2ZDhndlZyR09ydlAvWjZGL3BWUjltZWdTbW9pck5KWllOOHNP?=
 =?utf-8?Q?DbJKwJF7hhyT86DuEhlamp9Xy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc16f402-d5dc-4b0a-41d4-08de2e65c8ad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 10:06:22.8684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DoP5qJUatvmCGSfkUcwka69TXXolnY+rLFM4TkcbtYXDwu+2uYe6D5wevW49e14Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6854
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

On 11/27/25 12:10, Philipp Stanner wrote:
> On Thu, 2025-11-13 at 15:51 +0100, Christian König wrote:
>> This should allow amdkfd_fences to outlive the amdgpu module.
>>
>> v2: implement Felix suggestion to lock the fence while signaling it.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  6 +++
>>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  | 39 ++++++++-----------
>>  drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  7 ++--
>>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  4 +-
>>  4 files changed, 27 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>> index 8bdfcde2029b..6254cef04213 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>> @@ -196,6 +196,7 @@ int kfd_debugfs_kfd_mem_limits(struct seq_file *m, void *data);
>>  #endif
>>  #if IS_ENABLED(CONFIG_HSA_AMD)
>>  bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm);
>> +void amdkfd_fence_signal(struct dma_fence *f);
>>  struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f);
>>  void amdgpu_amdkfd_remove_all_eviction_fences(struct amdgpu_bo *bo);
>>  int amdgpu_amdkfd_evict_userptr(struct mmu_interval_notifier *mni,
>> @@ -210,6 +211,11 @@ bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm)
>>  	return false;
>>  }
>>  
>> +static inline
>> +void amdkfd_fence_signal(struct dma_fence *f)
>> +{
> 
> I would add a short comment here: "Empty function because …"
> 
>> +}
>> +
>>  static inline
>>  struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f)
>>  {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>> index 09c919f72b6c..f76c3c52a2a1 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>> @@ -127,29 +127,9 @@ static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
>>  		if (!svm_range_schedule_evict_svm_bo(fence))
>>  			return true;
>>  	}
>> -	return false;
>> -}
>> -
>> -/**
>> - * amdkfd_fence_release - callback that fence can be freed
>> - *
>> - * @f: dma_fence
>> - *
>> - * This function is called when the reference count becomes zero.
>> - * Drops the mm_struct reference and RCU schedules freeing up the fence.
>> - */
>> -static void amdkfd_fence_release(struct dma_fence *f)
>> -{
>> -	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
>> -
>> -	/* Unconditionally signal the fence. The process is getting
>> -	 * terminated.
>> -	 */
>> -	if (WARN_ON(!fence))
>> -		return; /* Not an amdgpu_amdkfd_fence */
>> -
>>  	mmdrop(fence->mm);
>> -	kfree_rcu(f, rcu);
>> +	fence->mm = NULL;
> 
> That the storage actually takes place is guaranteed by the lock taken
> when calling the fence ops?
> 
>> +	return false;
>>  }
>>  
>>  /**
>> @@ -174,9 +154,22 @@ bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm)
>>  	return false;
>>  }
>>  
>> +void amdkfd_fence_signal(struct dma_fence *f)
>> +{
>> +	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
>> +	long flags;
>> +
>> +	dma_fence_lock_irqsafe(f, flags)
>> +	if (fence->mm) {
>> +		mmdrop(fence->mm);
>> +		fence->mm = NULL;
>> +	}
>> +	dma_fence_signal_locked(f);
>> +	dma_fence_unlock_irqrestore(f, flags)
>> +}
>> +
>>  static const struct dma_fence_ops amdkfd_fence_ops = {
>>  	.get_driver_name = amdkfd_fence_get_driver_name,
>>  	.get_timeline_name = amdkfd_fence_get_timeline_name,
>>  	.enable_signaling = amdkfd_fence_enable_signaling,
>> -	.release = amdkfd_fence_release,
>>  };
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>> index a085faac9fe1..8fac70b839ed 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>> @@ -1173,7 +1173,7 @@ static void kfd_process_wq_release(struct work_struct *work)
>>  	synchronize_rcu();
>>  	ef = rcu_access_pointer(p->ef);
>>  	if (ef)
>> -		dma_fence_signal(ef);
>> +		amdkfd_fence_signal(ef);
>>  
>>  	kfd_process_remove_sysfs(p);
>>  	kfd_debugfs_remove_process(p);
>> @@ -1990,7 +1990,6 @@ kfd_process_gpuid_from_node(struct kfd_process *p, struct kfd_node *node,
>>  static int signal_eviction_fence(struct kfd_process *p)
>>  {
>>  	struct dma_fence *ef;
>> -	int ret;
>>  
>>  	rcu_read_lock();
>>  	ef = dma_fence_get_rcu_safe(&p->ef);
>> @@ -1998,10 +1997,10 @@ static int signal_eviction_fence(struct kfd_process *p)
>>  	if (!ef)
>>  		return -EINVAL;
>>  
>> -	ret = dma_fence_signal(ef);
>> +	amdkfd_fence_signal(ef);
>>  	dma_fence_put(ef);
>>  
>> -	return ret;
>> +	return 0;
> 
> Oh wait, that's the code I'm also touching in my return code series!
> 
> https://lore.kernel.org/dri-devel/cef83fed-5994-4c77-962c-9c7aac9f7306@amd.com/
> 
> 
> Does this series then solve the problem Felix pointed out in
> evict_process_worker()?

No it doesn't, I wasn't aware that the higher level code actually needs the status. After all Felix is the maintainer of this part.

This patch here needs to be rebased on top of yours and changed accordingly to still return the fence status correctly.

But thanks for pointing that out.

Regards,
Christian.

> 
> 
> P.
> 
> 
>>  }
>>  
>>  static void evict_process_worker(struct work_struct *work)
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>> index c30dfb8ec236..566950702b7d 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>> @@ -428,7 +428,7 @@ static void svm_range_bo_release(struct kref *kref)
>>  
>>  	if (!dma_fence_is_signaled(&svm_bo->eviction_fence->base))
>>  		/* We're not in the eviction worker. Signal the fence. */
>> -		dma_fence_signal(&svm_bo->eviction_fence->base);
>> +		amdkfd_fence_signal(&svm_bo->eviction_fence->base);
>>  	dma_fence_put(&svm_bo->eviction_fence->base);
>>  	amdgpu_bo_unref(&svm_bo->bo);
>>  	kfree(svm_bo);
>> @@ -3628,7 +3628,7 @@ static void svm_range_evict_svm_bo_worker(struct work_struct *work)
>>  	mmap_read_unlock(mm);
>>  	mmput(mm);
>>  
>> -	dma_fence_signal(&svm_bo->eviction_fence->base);
>> +	amdkfd_fence_signal(&svm_bo->eviction_fence->base);
>>  
>>  	/* This is the last reference to svm_bo, after svm_range_vram_node_free
>>  	 * has been called in svm_migrate_vram_to_ram
> 

