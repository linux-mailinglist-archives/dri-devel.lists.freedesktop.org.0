Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67659B28397
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 18:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F2110E26E;
	Fri, 15 Aug 2025 16:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sWLUPg1n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D620A10E068;
 Fri, 15 Aug 2025 16:11:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wa2Ju5D8+OyZdaBvDya51/pNULG2cmLi+YbVcRL5FtzwLGHiOZbn9cGBa7wwitjRK0c3WFVn2ZlFPHzh4nSfK6c2rb5ja1KPoU5/n70bCPUykoH4kTxTLqwa/SaVeAU0iBBb4VSjqgSgV1wYgfscFuaDdxVpYYyK8I2Pwu4nFl+lZn/WdcV19mOmzbhPnZT1nItn1Hy+Msuflfoa+2jY1zSvCeqDCE+6YqDZz0SWelZmq7X5INJVZ4j6pNkx8kCuPdsImhYvWtac4rlhh6lv7+nGeYfSPRjAUbPLs64+cWnoSwhaf86//cj8viccl4n3woNI1e1Xz6LTN9KMNvjIRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fk6Kf/9Ca3TAlFi6uqG8aJjMi6uVfBgR0Q6U+rjcKHA=;
 b=NUrsJKCt4A7koHxN4CqkuyniDiesvfE/yieuTEveZfWmd45gptCVcRTmzz9jC7O/Xp5Tctf5+lxG67Pkt9rLx0LOhzZi+Zme420/EzUlvr6pSWDctB6AtnAVxI+F0aa+F1hr6jzg1qQmMQ4wCaHprexiTd+OAi1mFapfktdRZGoEeKj9vf+1mMNdVGeu41vwVHBPA2NzdLBhJ13fOt6k/nizlSg0dZgLZ+sKKJHf+DWa660JqBnoTNx4rn/9HldwydQ60ZrBP7gbRM6RF6kmmzybz5bF469t/KjcJ4TRXIWccBb/ujop8sdcnvutLdtVqnGp/8GpGT+17mPAUCsYFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kode54.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fk6Kf/9Ca3TAlFi6uqG8aJjMi6uVfBgR0Q6U+rjcKHA=;
 b=sWLUPg1nhZ/zggEJDBqZKcpRKl+H3KNHqN+lZG8lzH4ltZWeIxQzM8ghe+w7Rkbgmz8KArfsIR0cuRPolLvxklqCAHnrQzBnO9r+KO+u3crCJOkAaJYee7qeBiudmPE+tMRNS0terYh5n/rby76PqdgLSr95ZVcSJVM+xID57u8=
Received: from DS7P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::17) by
 SJ5PPFABE38415D.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::99e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 16:11:43 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:8:1ca:cafe::38) by DS7P220CA0003.outlook.office365.com
 (2603:10b6:8:1ca::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.19 via Frontend Transport; Fri,
 15 Aug 2025 16:11:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 16:11:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Aug
 2025 11:11:42 -0500
Received: from [10.4.13.140] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Aug 2025 11:11:42 -0500
Message-ID: <1b7fb3d2-1df4-42eb-90ae-d032feadaae2@amd.com>
Date: Fri, 15 Aug 2025 12:11:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/amdgpu: Enable async flip for cursor planes
To: Christopher Snowhill <chris@kode54.net>, Christopher Snowhill
 <kode54@gmail.com>, <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250619125507.54384-1-kode54@gmail.com>
 <DARA1U86AS72.QOIEVZWCFPYC@kode54.net>
 <DATUOZZD8316.2INSL3KL5RA80@kode54.net>
 <DATV4CAOHVGV.1UJ803EX21II6@gmail.com> <DATYCMWH1X28.NE3M8KJ3SPV9@kode54.net>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <DATYCMWH1X28.NE3M8KJ3SPV9@kode54.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: sunpeng.li@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|SJ5PPFABE38415D:EE_
X-MS-Office365-Filtering-Correlation-Id: 500aebf1-37d2-4540-b9ab-08dddc166d2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|42112799006|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXRVT2tLQ1RPNnFONlZBcnRYem9XZWczVVNFNWNBK1EyaEZZWnpLbEV5U1JN?=
 =?utf-8?B?dDRGREIzbGIzMEoxNUxXZDZQZjdhL0lDaWtzUmQ5TllUSXdCTndSUTFzNTQ3?=
 =?utf-8?B?bmpaV20yamlJcU5PQlgycWhpRUhXaHN4NjdhRk1YMlc3ZC9ydFRUMzBzZjlQ?=
 =?utf-8?B?ODgxbmwxSUdMbXk1QjVKZHovUUNocnAzVm1YNzFwRlc0dEI2ci90aFJGN3JC?=
 =?utf-8?B?ZGlLb1FmZW1iRmZlc0RhdVhuUWM0ZXNnbFBGRXltNnlteldUdjhIM2tjNG1H?=
 =?utf-8?B?clZjUnEyTWYwbm5oNlM5bk1pbmZUeTBMeG95UENJNUVOV01LTGpwdWcvVDRh?=
 =?utf-8?B?UkNWaCtMaHMyZUFNTHAxV0hNYVZ3dDJjVkpQR01zd2MyaUt5ZGtuSVE4WExw?=
 =?utf-8?B?RE0rVUFKSzVGOVhIYWgwdTVSeUcyRGt1OGFDVW5iTndwUUhGRk90dG84a2tV?=
 =?utf-8?B?NkgreVA0SmN5MXdlUTNSdmF6a2d5clZWYTNLQWZmK01NZjh4S0NHTXdPSmw2?=
 =?utf-8?B?T2RXVHN5V2RhUHM3YnFxSkVKSzNnMG5VWk1ITkgwVmNHbXZSWS9sTjhGdktn?=
 =?utf-8?B?bFZHUkd0WCtCMUtSR0RnNmF5SEtVRlpiUC9TRS82bWZRU3R5MFZyQTBCMFg4?=
 =?utf-8?B?MEx1dnI0aDcvOVNBRVovbllzOExMTEExQlQxQWdqTy9KUjFxZ0phSE1sSmNx?=
 =?utf-8?B?WFgxcWZRd25xVENrNTlXS0cxc3lQVU9nZnp4d0R2YzdURUNMS3Jhd1ZheTdp?=
 =?utf-8?B?eFRrb3RlS3NiZEcxUm8reStKNWZVYlJHM2hrdC9WU0Zkb3RwS00wNjJnM2tQ?=
 =?utf-8?B?SlRmdDJBUTJRaW83VEhvMk8xK0ZmK0xoTGFlem1GUkhncmszM25VdTZrejJ5?=
 =?utf-8?B?Y0orbUhMSHdEOFJFRzhCYnNZbXFyR05ib1hZU202OGM1L2sxMlMxTTlDUDZ4?=
 =?utf-8?B?bVZ5eVh6eUhtbDFMaUs5UlJ4UXdWMUh4TEYrN2xFc2ZTcENZZkZqQloxQUlm?=
 =?utf-8?B?eTRycVB1dzVubGc1ZURuRUJSQU9jWGE3S3NXUncyOEY5YnpjSEpuMXhCakxF?=
 =?utf-8?B?Zms0blJtY0JMOUM5dmFDZkErMEtPb3dzOC9hSTZxaHRNK3hkSTNpZFJ6RUFZ?=
 =?utf-8?B?VVRjdkRhQnBQNGx4Y1daQjIvUlBsMU5BOU42VWowaFNpTU1WczJjNnR0c3pL?=
 =?utf-8?B?MUltZWk0L2Y1RWFKeHNqazBpdTluUjRvVE9sN2hXWHRodXlxVU5iR0pkUE1C?=
 =?utf-8?B?UVZ0SE5tYnI2VitXS3hRVEVoZUhWVXJNQVo1QnJ4WXdLRHEySE9GRHJqOTVG?=
 =?utf-8?B?YUtEWVE1Uk03ZzdjT1R6bW5ZUzVXL2NhTlZmUlJkQnlHR1FEVEllZlgvMlVE?=
 =?utf-8?B?c2Z4TytMa0t1OVl0Nkk2VUUrNzJubVJSSk5JVVh0MkQrbS9tbEkrbWtmajV1?=
 =?utf-8?B?Uk5TTUt4SU9Rcjh5cG5pR2lpNHVNSjFXM1lxaThKYU1QbEhBSTltV0V4T3Jn?=
 =?utf-8?B?NmNhVlFyVmNUT0NNUTRRZHlnVjFJcUVwa2hoR2EyZEZ6dXZZak9yVTlWV0tv?=
 =?utf-8?B?NGRkQkJvOVJnRExqVDFtR1g1N09qN1JEaWptMm9iY2k1dDBROGJ0UmJncmxI?=
 =?utf-8?B?UWxkaHhnV1ljazhjMkxrY1JoSUE2WjJxYVlYN0pFbmRaUlpVS1JiTDZTVm0w?=
 =?utf-8?B?bGlzU0dPV3llK2d6WEFIclI2M0tyZnA2UzZqTkNycU1JMm9tWW1lemk5dzBx?=
 =?utf-8?B?czFpdmxjVGhXaDZ5RmJyRnlEVFZsSDIxS2ZuMUpTQWZNYXA2TjFoSGRnWWs2?=
 =?utf-8?B?dzBPRXdjNklIaVo4czBTMCtaUVdKWWR5ZGRrQjlRZGRaMkp6MkpDTUhQSGp5?=
 =?utf-8?B?Nk9ZSXB1QjhPSzc3eW5YbFVTNFg5R1J3YUE5elNKSjNyRFF4TS82QXlNTW96?=
 =?utf-8?B?Ty9YTGxPZkNVMi9sZHNJaTdzZmhnT2xuZ0ZhSDUvRWIvNlVxVlVDNHlqU0Fp?=
 =?utf-8?Q?6lpkUkLt8e5ksMxeGmGR8pINEmaOWM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(42112799006)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 16:11:43.4636 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 500aebf1-37d2-4540-b9ab-08dddc166d2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFABE38415D
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



On 2025-06-23 09:38, Christopher Snowhill wrote:
> On Mon Jun 23, 2025 at 4:06 AM PDT, Christopher Snowhill wrote:
>> On Mon Jun 23, 2025 at 3:46 AM PDT, Christopher Snowhill wrote:
>>> On Fri Jun 20, 2025 at 3:10 AM PDT, Christopher Snowhill wrote:
>>>> Here's another alternative change, which may be more thorough. It does
>>>> seem to fix the issue, at least. The issue does indeed appear to be
>>>> no-op plane changes sent to the cursor plane.
>>>>
>>>> If anyone wants to propose style changes, and suggest a proper commit
>>>> message, if this is indeed a welcome fix for the problem, please let me
>>>> know.
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>>>> index c2726af6698e..b741939698e8 100644
>>>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>>>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>>>> @@ -1087,17 +1087,22 @@ int drm_atomic_set_property(struct drm_atomic_state *state,

Hi Christopher,

Adding some additional context lines here:

>>>>		if (async_flip) {
>>>>			/* check if the prop does a nop change */
>>>>			if ((prop != config->prop_fb_id &&
>>>>			     prop != config->prop_in_fence_fd &&
>>>>			     prop != config->prop_fb_damage_clips)) {
>>>>				ret = drm_atomic_plane_get_property(plane, plane_state,
>>>>								    prop, &old_val);
>>>>				ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);## end of additional context ##>>>>  			}
>>>>
>>>>  			/* ask the driver if this non-primary plane is supported */
>>>> -			if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
>>>> -				ret = -EINVAL;

Firstly, apologies for the delay, and thanks for the patch.

The original code definitely looks fishy. The value of `ret =
drm_atomic_check_prop_changes` is not used afterwards and is ignored.

Looking at the history (v6.14), it seems the original intention was:
* For PRIMARY planes
    * Allow modifying of properties fb_id, in_fence_fd, and fb_damage_clips
    * Allow setting same value for all other properties
* For OVERLAY and CURSOR planes :
    * Allow setting same value for all properties

(https://elixir.bootlin.com/linux/v6.14.11/source/drivers/gpu/drm/drm_atomic_uapi.c#L1078)


Then, the behavior changed in v6.15:
* For PRIMARY planes
    * Allow modifying of (including setting same value for) **all** properties
* For OVERLAY and CURSOR planes
    * **Allow modifying of all properties** if `atomic_async_check` callback
      exists and passes
    * **Setting same value can fail**, as behavior is now driver-specific.

(https://elixir.bootlin.com/linux/v6.15-rc1/source/drivers/gpu/drm/drm_atomic_uapi.c#L1081)


But IIUC, the desired behavior is actually:
* For PRIMARY planes
    * Allow modifying of properties fb_id, in_fence_fd, and fb_damage_clips
    * Allow setting same value for all other properties
* For OVERLAY and CURSOR planes :
    * **Allow setting same value on all properties**
    * Allow modifying of all properties if `atomic_async_check` callback exists
      and passes


Is this the desired behavior? If so, I think it makes sense, but the existing
conditions need some cleaning up.

Thanks,
Leo

>>>> +			else if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
>>>> +				ret = drm_atomic_plane_get_property(plane, plane_state,
>>>> +								    prop, &old_val);
>>>> +
>>>> +				if (ret || old_val != prop_value) {
>>>> +					ret = -EINVAL;
>>>>
>>>> -				if (plane_funcs && plane_funcs->atomic_async_check)
>>>> -					ret = plane_funcs->atomic_async_check(plane, state, true);
>>>> +					if (plane_funcs && plane_funcs->atomic_async_check)
>>>> +						ret = plane_funcs->atomic_async_check(plane, state, true);
>>>>
>>>> -				if (ret) {
>>>> -					drm_dbg_atomic(prop->dev,
>>>> -						       "[PLANE:%d:%s] does not support async flips\n",
>>>> -						       obj->id, plane->name);
>>>> -					break;
>>>> +					if (ret) {
>>>> +						drm_dbg_atomic(prop->dev,
>>>> +							       "[PLANE:%d:%s] does not support async flips\n",
>>>> +							       obj->id, plane->name);
>>>> +						break;
>>>> +					}
>>>>  				}
>>>>  			}
>>>>  		}
>>>
>>> Upon further testing and reflection, I have come to the conclusion that
>>> this is indeed best handled by a kernel fix, rather than breaking user
>>> space.
>>>
>>> I attempted to work around this in wlroots, adjusting 0.18, 0.19, and
>>> 0.20 git with similar patches. First I attempted to stash all the
>>> written properties for the atomic code, storing an initial value of all
>>> 0xFE so it was always likely to write the first time, and only setting a
>>> property if it changed from the last commit.
>>>
>>> This resulted in whole commits breaking for one or both framebuffers
>>> until I ctrl-alt-fx switched to a tty and back again, and this would
>>> work again temporarily.
>>>
>>> So I went back to the drawing board and only withheld seemingly
>>> duplicate plane properties. This "worked", until I attempted to play a
>>> game, and then it started glitching spectacularly, and not updating at
>>> all if the game was doing direct scanout and vrr.
>>>
>>> Clearly this is wrong.
>>>
>>> The wlroots library queues up properties for each commit. On every
>>> commit where the cursor is disabled, it queues up both fb_id=0 and
>>> crtc_id=0. Every commit. Is this wrong? Should it only be queueing up
>>> the disablement properties once? It also queues up the full plane and
>>> hotspot properties when enabled, even if the cursor doesn't change
>>> position or appearance.
>>
>> Probably should have CC'd the drm misc maintainers when I started poking
>> drm misc instead of amdgpu. Pity there isn't a list for that...
> 
> I am a dumbass, I didn't notice get_maintainer.pl. Added more people,
> and the correct list. Not sure if I should remove amd-gfx, since this
> affects them, somewhat...
> 
> However, the intention of this thread was to seek commentary on the
> situation as it is.

