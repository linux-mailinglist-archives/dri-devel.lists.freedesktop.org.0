Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EF290E22B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 06:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094D710E07F;
	Wed, 19 Jun 2024 04:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="np5kbCTu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9433A10E07F;
 Wed, 19 Jun 2024 04:08:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYJEmk7RhwXU91u6RbsUm+ZjLXzmVEOXcEC2G40GapkI2oLsmXex6kiPjF96CaewK2sZNDVewEAq+1bYhgz2mys55YZkANis45h58QPJxq40+jrm5XXbWMAbPyl6Ulqq471/V6d5SAJmyj1s8HJoDMPG8BPXYrMlvBKsLbVmbomueNc4tuxb29MFKEafbvuSXajKc0px9klseEEsXQF25A+9qkGmB/EnqRgcGNpjBs+91VXpw5uadeN+aZBxsE6UbV+LMg/w3kSq6HEiqdBOSeBQjzVCSVyT6tIZMldhRe0S3+i58cYde+eyy6sgmIN5i5h7/aaRCjOplmPKKi05xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+UMmxjwDGdkzv7oKewhzai/Ui+GvIjlZGVNk+UJ3MgI=;
 b=GFp65ZjRGefKIbpiJlhm5wmUkkSSgmD5irdTbxe7jZOhr7MC3pYdUvb/dYkktwmO9JO+8D6ldpw0yeLS7NzN597eAekYJUOFeHgxorK2RVQTr84nkrdXuqq3j7dK3IBGbPwvE1p+qNW/7ccamY/x1cbRKkBEkZEqNeinb5eiG2LD+NziPytGOHDLB2/8FP1lkp/bT7gHWarKvIG85GXGnpt+wfrVlIr886qoHz0NsOOIPz/a95Bn3v9D+PYNw9Y9kfjwt3hKdtD9D8fw1RNMxKXeJ4aAhmW9CdInmFSUdUGO3nJphEt/sZr/RebddWrI0iPJwgBpmFy59KoN2BwHPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UMmxjwDGdkzv7oKewhzai/Ui+GvIjlZGVNk+UJ3MgI=;
 b=np5kbCTuqqK3i/Bci5AhOhOopCEOO7QNMzi37lywzANm35u8vtu+Okj3haqcvHWhDP3ojjItGW3tQrJZ5PVBAZp/XW/WPiIBp7NXrJJCag9HvkHEeZNZADLq2ShnhCX/XjZFsT7oMDRSv2GOJx/1LdKrmdSYF4vYQhaLAQylXU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA0PR12MB7556.namprd12.prod.outlook.com (2603:10b6:208:43c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Wed, 19 Jun
 2024 04:08:53 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 04:08:53 +0000
Message-ID: <d637d3c2-34f7-42f8-acbb-6a1730d3fc3c@amd.com>
Date: Tue, 18 Jun 2024 23:08:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/amd: Add power_saving_policy drm property to
 eDP connectors
To: Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org,
 Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@google.com>
References: <20240606020404.210989-1-mario.limonciello@amd.com>
 <20240606020404.210989-3-mario.limonciello@amd.com>
 <bc1d81ef-d9d0-4440-b63f-ecfb735ef783@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <bc1d81ef-d9d0-4440-b63f-ecfb735ef783@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0091.namprd04.prod.outlook.com
 (2603:10b6:806:122::6) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA0PR12MB7556:EE_
X-MS-Office365-Filtering-Correlation-Id: fb7d156f-85db-4fe4-7432-08dc90158857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NktGOG1JWGxHQklkaHNhelMzSlVFLytGNitkNE81UmtseDZvVys0RVNoUjYz?=
 =?utf-8?B?Q3JXMHlTSEVGZzRhckVuNGdoUllpalhpeXZtWk1lMmdpd2dRa1I0Qi85RkFs?=
 =?utf-8?B?ZE5tdXJsVzQ1SVI4RTA4c3QzMlpRQ3c0K3M1SnZGbDVhWkNnbDVjckJBL2pZ?=
 =?utf-8?B?MkJjRmY4T3J5RUM5eDYxMTVQelNkcmlONnY5M2MxZVAvU2NMc1NseXUrM3ow?=
 =?utf-8?B?L2pXeFBiQWpybzJEY0xYM0tTaUxOeTFXKzU5ZEIxdy80YWZtY01ZYTUrN0Iv?=
 =?utf-8?B?ajhUeEJDQStSUkZuTHo2TTk5V1ZVWW0vOG5DOHN4SXRsTnhuWUR5dWh3WDlZ?=
 =?utf-8?B?ZnVhSXE1RE1acjh1dEZMTVVrSjBRbnBhZXpEeXkyenlMMnNrRS9yV01WZnpr?=
 =?utf-8?B?aFc0dmFZb0tPZUZKL0tGcEV5Y0paTUlCUkZza2I0a3QwN0FtWmlZMWkySmtm?=
 =?utf-8?B?RmRncDZFZW5nZFQydVgxdmJSb3N4RUJET3ovSXk0QmRjdmU5MkhjejI5VEdi?=
 =?utf-8?B?VWRKQ21mcWE5bXRRSk9HL0FDM2FsZjBsNGljV2Z4dDV1NHdpYnhObGhtVlRS?=
 =?utf-8?B?ZiszSGYzOVNYazBQbGFTV285dkJUVDUrMmRPdm1rZzYzRGFLWU5vcDVNNTlT?=
 =?utf-8?B?ZDZUeGhidnBxaGZmRnlXR0w5ckNiMUVGSjhtN1hpQXNUcE5ERXNjT3VuOFdE?=
 =?utf-8?B?UGhuSUxHWXlVNDB3MmgwVWxsNGVhOEphb3prbktvRGg0VnhENnJjTUo5Vy9w?=
 =?utf-8?B?MEZ4KzdjeFd5SFZqTU5TaCtiazgwQWhoWjBvWVg3VmtpaWN5MFpMV3NGbjJk?=
 =?utf-8?B?UUlqTDZGUXlWUXpYZzR2SlJUMDhNUG5uM29SQ0UvUTNKM0RsNUZZcDBOZ3NS?=
 =?utf-8?B?Wmg0L0dLVkZGU3NBRnlNVjd1S3MvTEtlbFVabHJYdGt6a2Zua3ZLWkNuSzVE?=
 =?utf-8?B?UGF6NkVydGJRTjlSN1ZlVnp3OTYxajVUZ292MVkyRUNJSTdtZlI4YXdyb09r?=
 =?utf-8?B?anhJZXNieWdScE04VVYrdjRueExmZTlXcFBpNWtJWXlTZWtWNW92d2VQRkMv?=
 =?utf-8?B?bWlXSlZhRFNTa2NjcHUwcmpwbUJ6YnhxblFkQ0VUazVCUzZqYWNiSG4zMi9v?=
 =?utf-8?B?eTZSR1NTOEtzM2RLdHBBOVdvRkdCOE5CNzh6bTg5S2FrQ3h5UE1Wb2xoS04z?=
 =?utf-8?B?RjM4NStIZW1RNWtpWUlaYzhwdFlNd05JV0lIb2VoaFpJQ0JoeVR3SEVMbmg3?=
 =?utf-8?B?VXdscFlSMUNOUFBxLzhXb2g3bDZjbFNlM0UxN3hmS2orb0VEdUtUVmUzeE5F?=
 =?utf-8?B?RUIzRWQzblhpNllYaFBXTzVxN1J3NitsbEFmZ0djbEV4M2R5T3gvYTRJQWEz?=
 =?utf-8?B?VFd2eXBEbVI1U3pRQUZZa0UrNjJhb294eFEzUDNRKzdBUmNOdVNRZEl6LzZp?=
 =?utf-8?B?UWlkS0laV1JXdEdDZUEzWktiUXlMMmJ6Z0hQeWtWM1p6bE9pL1h2a2tQL3RJ?=
 =?utf-8?B?RUlGc01UT0ZMWTMvZUEyaXpxNmZaUGd1VHZQQVlyc0hEQ3NmT3VqcWI5TlZ0?=
 =?utf-8?B?cEJ2TmFlWnptY2hrUW53WU05bk9GSUFKSVpYSmlhVklHZDFRSUI4K2txZGxt?=
 =?utf-8?B?ZU0wcU9MT1oxV3JaeGg0RUgxSHVyVlQzdkdXK1pqSytBU1lFMngvSmsxeER0?=
 =?utf-8?B?T21qckcrZmc3RzJsOStjbTNaajVYT1N1RFBJamtzb2ZCMkRid1M0VkhmWlFT?=
 =?utf-8?Q?8KRR6jHZd+AnOafPFJXvpgSp9DcBfea8JV8PkGr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azRDRVEwWkhoOHJVYnlMb2hNV0lLY29GWkJUeXBNMlJwcUR3bXpaVzUyK0JY?=
 =?utf-8?B?NWlWdFE1eE8xZW9KTUpFdXFYcjU2Sy9UV0RQQTE0Syszb3AxRnNrWnl6QzVX?=
 =?utf-8?B?YVdrRHF4T284VUxqRElhN2tFTzZEdDE4Q0ZmU0JhWFBQeTc3bm02UVc1RGVq?=
 =?utf-8?B?VENQWTlGU25SL3FEQ0ZKK2JOQk9yUUJlcDBZOUlFQzNvbEhheGxwcjA1NlNr?=
 =?utf-8?B?d1lQOWgzUzdIbW9td3dsTWZMeWw3bC9vQTZveDRpOU9sdy9HVXZrMTJYbmxW?=
 =?utf-8?B?YVNuajFoY2xIUkMyME9VaU0yL1dDTEYyR0ZzTDBxZWk1VGIwSGwzQVhTa1hn?=
 =?utf-8?B?RnlvOVRpRjg2dmQ3Z2MrOUV4SXBCdlpVQmw1b2RlTUF1S2pYUGtzeWxnbU9C?=
 =?utf-8?B?eG9xRG9pNUpkTWJ5KzlhZG9IeXhVdE1LbEtXUVNreUI4TGk2ck9qalNLdVd4?=
 =?utf-8?B?NFJ2K0I3WmZQQ2E4ZUt0YUw4TW9xY0xSUVJEaW8vcEVxNGdvUHRVMDFoYW9S?=
 =?utf-8?B?VEY0TmhMRCtValJGOEg3cXh2Q3d2Z2pJRHN6aUN2WDJTbEtKNk9HVFdJVSsv?=
 =?utf-8?B?empkTExqRTVFbGFKbTkySWlBNmNTS1k3Wi81SXMwUVdMbDJyQ1dLV3FScGVO?=
 =?utf-8?B?Wk52VC9IUGk3TEc2RGp6dHZXTkZRSlR6UmVEUTZLdVJxUnpNQjQ5RW8zQWpi?=
 =?utf-8?B?d25Eb2w0a1k2bzZHL2QrQnA0cjZMRmhzZHhFcFRSNTV3RnJEYng3eUk0NG9S?=
 =?utf-8?B?RGZWNjF2L25hQjc3d3kvb1NGZ2ZrTXZGRjFKbGNoai9sdVExcXlMdGczd3lm?=
 =?utf-8?B?UVVjcHlMeGxhUEJHVG9mVmYvbFE2VW50V2tPd1lzNU11Mml5cnJyNEpVQlFq?=
 =?utf-8?B?a1JjOW1wc1RLR21wRTNnK2hCNkNQQi9SekZPeXBYM2xJWFFJQmFrNDdWZFB3?=
 =?utf-8?B?eFRuRXVRcUl3NlNzMnFkbmhzMTlSbnVNWmRTbzAzaTBqWi9ycFVmcG0rdkor?=
 =?utf-8?B?NnNSWW1hT2lvdVh0WFBkanFKVlIxR2NwSlhlM3ZYT1doMjYvdUk4WEgyNHQx?=
 =?utf-8?B?MS9tOVVkUjZEbllEbDNiZE1sWmZockZsb0JHU0RWaFBQOVdNcis3bEUvd3hw?=
 =?utf-8?B?alduR1pISW5rUTZDYTRoS3NsMkhYajVUOUdiTkpXbXdCVzk5d3psbHpjR0Fl?=
 =?utf-8?B?ckdYRUlpRk9DUUZyUk9Ud2toQStvRUYweStsci9XbjZJZzdJR01aa1lGQ2wy?=
 =?utf-8?B?VVNVU2JieUN6cG9WaERpRkpEUytNZmRUM3owVmJnRDN0Rkh6K3pKd2FZb1pX?=
 =?utf-8?B?bHp1UUhzOEVyUTVnQ3Z4eXhhcFhmMldWZmthOER5bDdjSTdwZU5hcHA2ME1z?=
 =?utf-8?B?aVJnQkx4MG9iRC9RQUNhQkgzQ2xHYW5oZHJidVB5MXpSK3ZEbUEzNjJlRWdT?=
 =?utf-8?B?RXI1WWc4OVVRNVFmeFJReU5TOXV5V3BJeGZXMVdoek1vVDliMDVSdy81RDJn?=
 =?utf-8?B?YWpFZVpqRVdsMHhqajJXNThTVUZrQlJ4bGlxbmRjcVFLb0JOS2hyVmU4bWVD?=
 =?utf-8?B?a05zeCt5dVAzVnJtZWZxaEgwVmdKcmk4aXdxZFpmbGh6VmwvYXdvUlN6NHBt?=
 =?utf-8?B?ekdYVU13WUt0Rk9ZWGlFUWZiSndHZWplOThtYTZ3TDE3REUxa0hOZEtCOGw4?=
 =?utf-8?B?UVpwalk0SFVWcEZPN1pMdDVnTzJVaVM2dkMwTWZ6eDZwWlUrOUNyd3VQdWtE?=
 =?utf-8?B?eDVYaEFHZXVBUzluQlJrb0t5a1ZJcmNiNzkxYXVVbkFDYThwMTRHTnJQNXdY?=
 =?utf-8?B?RE1aQ1czb3dJT2dIajZ4M3VXcXlPQ0drNTYvWmczZE4xaFJDN3d4S1JHU0pr?=
 =?utf-8?B?a1NDTlFFdW13ZGRIM0FRdHlUZGFZcVAxWGJ0U0tnWmFsUHJlRHNsTGxYbG5p?=
 =?utf-8?B?VTdXMWFKTDhJYXRaS3NnZjdweHBEZ3pWU2JqSjE2NHpJTXVYMWU1K2lqeHdv?=
 =?utf-8?B?cFZCZWdsaHppTGNnM1pPam5uR2p2OHhhYit5UVBVckFtRkJwM0xEZXBscURY?=
 =?utf-8?B?V0xMTEFGQnpSZkwyVzBZMzg4SDhsZjN0eEEyMWNVcUphM0NBTkpoZ1dOUlFS?=
 =?utf-8?Q?OWw4+PVmoXRDGYl9bfYjDWbQD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb7d156f-85db-4fe4-7432-08dc90158857
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 04:08:53.7164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUAHtN3iCzSRQrI4JoU7nWrqTLRBpAB/pbX87z2xno0TlEJXVPKk5Xh4MRTO5DaHUVNz9CrCBeKqvRrpV7eeGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7556
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

On 6/18/2024 17:36, Leo Li wrote:
> 
> 
> On 2024-06-05 22:04, Mario Limonciello wrote:
>> When the `power_saving_policy` property is set to bit mask
>> "Require color accuracy" ABM should be disabled immediately and
>> any requests by sysfs to update will return an -EBUSY error.
>>
>> When the `power_saving_policy` property is set to bit mask
>> "Require low latency" PSR should be disabled.
>>
>> When the property is restored to an empty bit mask the previous
>> value of ABM and pSR will be restored.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Reviewed-by: Leo Li <sunpeng.li@amd.com>

Thanks!  I don't have permissions, so can you (or someone else) please 
apply to drm-misc-next for me?

After it's merged I'll rebase and work on the feedback for the new IGT 
tests.

> 
> Thanks!
> 
>> ---
>> v2->v3:
>>   * Use `disallow_edp_enter_psr` instead
>>   * Drop case in dm_update_crtc_state()
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  4 ++
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 50 +++++++++++++++++--
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +
>>   3 files changed, 51 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> index 3ecc7ef95172..cfb5220cf182 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> @@ -1350,6 +1350,10 @@ int amdgpu_display_modeset_create_props(struct 
>> amdgpu_device *adev)
>>                        "dither",
>>                        amdgpu_dither_enum_list, sz);
>> +    if (adev->dc_enabled)
>> +        drm_mode_create_power_saving_policy_property(adev_to_drm(adev),
>> +                                 DRM_MODE_POWER_SAVING_POLICY_ALL);
>> +
>>       return 0;
>>   }
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index f1d67c6f4b98..5fd7210b2479 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -6436,6 +6436,13 @@ int 
>> amdgpu_dm_connector_atomic_set_property(struct drm_connector *connector,
>>       } else if (property == adev->mode_info.underscan_property) {
>>           dm_new_state->underscan_enable = val;
>>           ret = 0;
>> +    } else if (property == dev->mode_config.power_saving_policy) {
>> +        dm_new_state->abm_forbidden = val & 
>> DRM_MODE_REQUIRE_COLOR_ACCURACY;
>> +        dm_new_state->abm_level = (dm_new_state->abm_forbidden || 
>> !amdgpu_dm_abm_level) ?
>> +                        ABM_LEVEL_IMMEDIATE_DISABLE :
>> +                        amdgpu_dm_abm_level;
>> +        dm_new_state->psr_forbidden = val & 
>> DRM_MODE_REQUIRE_LOW_LATENCY;
>> +        ret = 0;
>>       }
>>       return ret;
>> @@ -6478,6 +6485,13 @@ int 
>> amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
>>       } else if (property == adev->mode_info.underscan_property) {
>>           *val = dm_state->underscan_enable;
>>           ret = 0;
>> +    } else if (property == dev->mode_config.power_saving_policy) {
>> +        *val = 0;
>> +        if (dm_state->psr_forbidden)
>> +            *val |= DRM_MODE_REQUIRE_LOW_LATENCY;
>> +        if (dm_state->abm_forbidden)
>> +            *val |= DRM_MODE_REQUIRE_COLOR_ACCURACY;
>> +        ret = 0;
>>       }
>>       return ret;
>> @@ -6504,9 +6518,12 @@ static ssize_t panel_power_savings_show(struct 
>> device *device,
>>       u8 val;
>>       drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
>> -    val = to_dm_connector_state(connector->state)->abm_level ==
>> -        ABM_LEVEL_IMMEDIATE_DISABLE ? 0 :
>> -        to_dm_connector_state(connector->state)->abm_level;
>> +    if (to_dm_connector_state(connector->state)->abm_forbidden)
>> +        val = 0;
>> +    else
>> +        val = to_dm_connector_state(connector->state)->abm_level ==
>> +            ABM_LEVEL_IMMEDIATE_DISABLE ? 0 :
>> +            to_dm_connector_state(connector->state)->abm_level;
>>       drm_modeset_unlock(&dev->mode_config.connection_mutex);
>>       return sysfs_emit(buf, "%u\n", val);
>> @@ -6530,10 +6547,16 @@ static ssize_t 
>> panel_power_savings_store(struct device *device,
>>           return -EINVAL;
>>       drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
>> -    to_dm_connector_state(connector->state)->abm_level = val ?:
>> -        ABM_LEVEL_IMMEDIATE_DISABLE;
>> +    if (to_dm_connector_state(connector->state)->abm_forbidden)
>> +        ret = -EBUSY;
>> +    else
>> +        to_dm_connector_state(connector->state)->abm_level = val ?:
>> +            ABM_LEVEL_IMMEDIATE_DISABLE;
>>       drm_modeset_unlock(&dev->mode_config.connection_mutex);
>> +    if (ret)
>> +        return ret;
>> +
>>       drm_kms_helper_hotplug_event(dev);
>>       return count;
>> @@ -7704,6 +7727,13 @@ void amdgpu_dm_connector_init_helper(struct 
>> amdgpu_display_manager *dm,
>>       aconnector->base.state->max_bpc = 16;
>>       aconnector->base.state->max_requested_bpc = 
>> aconnector->base.state->max_bpc;
>> +    if (connector_type == DRM_MODE_CONNECTOR_eDP &&
>> +        (dc_is_dmcu_initialized(adev->dm.dc) ||
>> +         adev->dm.dc->ctx->dmub_srv)) {
>> +        drm_object_attach_property(&aconnector->base.base,
>> +                dm->ddev->mode_config.power_saving_policy, 0);
>> +    }
>> +
>>       if (connector_type == DRM_MODE_CONNECTOR_HDMIA) {
>>           /* Content Type is currently only implemented for HDMI. */
>>           drm_connector_attach_content_type_property(&aconnector->base);
>> @@ -9307,6 +9337,7 @@ static void amdgpu_dm_atomic_commit_tail(struct 
>> drm_atomic_state *state)
>>       for_each_oldnew_connector_in_state(state, connector, 
>> old_con_state, new_con_state, i) {
>>           struct dm_connector_state *dm_new_con_state = 
>> to_dm_connector_state(new_con_state);
>>           struct dm_connector_state *dm_old_con_state = 
>> to_dm_connector_state(old_con_state);
>> +        struct amdgpu_dm_connector *aconnector = 
>> to_amdgpu_dm_connector(connector);
>>           struct amdgpu_crtc *acrtc = 
>> to_amdgpu_crtc(dm_new_con_state->base.crtc);
>>           struct dc_surface_update *dummy_updates;
>>           struct dc_stream_update stream_update;
>> @@ -9360,6 +9391,15 @@ static void amdgpu_dm_atomic_commit_tail(struct 
>> drm_atomic_state *state)
>>               stream_update.hdr_static_metadata = &hdr_packet;
>>           }
>> +        aconnector->disallow_edp_enter_psr = 
>> dm_new_con_state->psr_forbidden;
>> +
>> +        /* immediately disable PSR if disallowed */
>> +        if (aconnector->disallow_edp_enter_psr) {
>> +            mutex_lock(&dm->dc_lock);
>> +            amdgpu_dm_psr_disable(dm_new_crtc_state->stream);
>> +            mutex_unlock(&dm->dc_lock);
>> +        }
>> +
>>           status = dc_stream_get_status(dm_new_crtc_state->stream);
>>           if (WARN_ON(!status))
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>> index 09519b7abf67..b246e82f5b0d 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>> @@ -873,6 +873,8 @@ struct dm_connector_state {
>>       bool underscan_enable;
>>       bool freesync_capable;
>>       bool update_hdcp;
>> +    bool abm_forbidden;
>> +    bool psr_forbidden;
>>       uint8_t abm_level;
>>       int vcpi_slots;
>>       uint64_t pbn;

