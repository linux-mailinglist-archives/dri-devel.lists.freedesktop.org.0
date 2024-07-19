Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE76937560
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 10:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BB010EB72;
	Fri, 19 Jul 2024 08:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vM3SQgqH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4708210EB70;
 Fri, 19 Jul 2024 08:52:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=koBStHu4kY7ilOBAt2/5Oov/+o3mx/EWF//EDrd8h3hRu5B3Ivgg/wn00weeCy4GOZrj5tY+yICtInkpDbQsD0NO9qLpn2CR/U5XfLxIAjtSrigjdgGMgiQ0Wvi7Dvm4btHYT8Zhd2XW5BVBDIj0HQ5bXwr8OfopkMtX1MDsUm7gmFC1sIuH7/K2n+iTdaTFOZP9Wl2AKuU4C8XvZLMb/jlLlEh5le/JY9Up1MqtwRBWw1Zobd3q/DMjPGhsb8hijKHGj+u3NwA4lHkR48g5Wl41aaTRCJN9nELxnuHGJMr1fBVmxHE48YOkY9EE+vvs7NSQRiEcMYxjQAt+jO8ddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAkepOzaMlaV+KYfL0jVEZz4LwabNAhpHIea8tnTZKg=;
 b=HCX/R3roQN6qTF5qcsANInpnILIMK2MDF7VK2hxbYOu3+eYqDVhLG1nw/DfXR0Mdnrylqy0yZAOx5CNkZ1iQgk+svDedw+BoGb5kMRJLtJdJA9JznOKfF+3Gpuf85zPfjPiRuAKJ4KrMG46qPhHc2KYSXjcmsRBJpuIWfnZIMISroGkQfAi6QZhZNVwybJs9AyAoy1rVjA5kJ58YX7xiBnj+b0g+9M6ARhdJPz1c8bJSR723qo9a54tJI9/Wu3q49YtKHResiSESIYNzXOsQ8z4rKGFn7InauDY+W/2hLDXOSBrOAJCS26GQQwQXZT22Sw+azGA3n8zW5/4D1CryaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAkepOzaMlaV+KYfL0jVEZz4LwabNAhpHIea8tnTZKg=;
 b=vM3SQgqHLaYrlE7KCdZtn/EcvEOfdG0MC+zFwitUooT8kf92k6njZhIEnI5qGBbeFarkqOG+FBKuRWO0piNyzt7e6xxuJ8SJYq5x0uI+Iizh6/FjK3PpnlmtjN5AMCtgiKxZCU2l4j5SJ89q1V2bZvpdhhKlkbl0pU0XFOk7x6Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB7569.namprd12.prod.outlook.com (2603:10b6:610:146::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Fri, 19 Jul
 2024 08:52:24 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 08:52:24 +0000
Message-ID: <cccf160b-a983-40a6-a463-a9f860433471@amd.com>
Date: Fri, 19 Jul 2024 10:52:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/nouveau: prime: fix refcount underflow
To: Danilo Krummrich <dakr@kernel.org>, lyude@redhat.com, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20240718165959.3983-1-dakr@kernel.org>
 <20240718165959.3983-2-dakr@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240718165959.3983-2-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB7569:EE_
X-MS-Office365-Filtering-Correlation-Id: befcdfe5-ac7a-4547-62ba-08dca7d01bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S21HeTU1bTJLNXlaS1pra2JuT3ZCUzZJUlhweXZ0WHQycmh2YkcraERzeXVq?=
 =?utf-8?B?c1k5YnBiZ3lsSmhaU3VtWmwwdnhtUFNhdU13d0ZtU3h1Z0xVOURWcjYydEVL?=
 =?utf-8?B?QldJdzBaZjNkUHNTdVhlU3hXMzA4RXJzSmcwNWg5OCtNbllMbE9DUkw3TVdQ?=
 =?utf-8?B?UnRZNUYyR3oxVEQzazdiMGFXR0kvS1JOVjNRS3BsdkZ1eUVOUEFxb1ZPWmE1?=
 =?utf-8?B?V0pDWWRkaWhtNVE1QVErVUlpTStXTFRTTXNQTTVzL1dxaEY5UXM4ZElZa0Fa?=
 =?utf-8?B?ajcwV29MeXNuZFVBblR5bXZ3SHRKMlR2U0hmd3I0QWFvQUo1RG9lM2hGMW9R?=
 =?utf-8?B?ZUFPclhxdmZjekxJZzV3NkNGYkZnYXNMMGxHM29MdDRtTG0vbDNLKzFFMVls?=
 =?utf-8?B?WWxnamJYTkFLYnA3cmNvRjU1U2ZYVTNGSlZwdUJXdFVvWmhVQ05ubndFS3Fp?=
 =?utf-8?B?ZDZSQm5KYWhzQ05DRDhRcGtidExJMHFRTnBpek9vRWp5MTArZXRLREpsNHNJ?=
 =?utf-8?B?OHpLTGVDYk51SFpsd0Q2VTk2b3A4UysxOHZyd0QwaVdqQVlBc1kzV3p6SnRs?=
 =?utf-8?B?RGNJWmtHbVc0NFlIZUc2a1g3QnZpcDl5MnJlVnp4UjNlNmI3anRGN1VpOFZv?=
 =?utf-8?B?S2pFU0RiZWJWUlAxVTB6TUE2dkJuMjQwVGVPYUhrakowWkx6cXdIQmEvbEpy?=
 =?utf-8?B?Nk1WWlBHV3JSbndXcmwzZlR3QmdvbnQvMVBxSEdEM3pqYW5nL2pFWHc5N0k5?=
 =?utf-8?B?WE1reVFkMUFYR0pWY0ZzTHJXTHlxNkc2MTJOQmpsbEZWMmlIZmpEWXJYaW9X?=
 =?utf-8?B?cnFWbGJqdldjY25ua2V0c0gyY2dqQjBBbVpVcmdsZy9yVXJESlBuVlZvUng1?=
 =?utf-8?B?K1hoREJQNFJVWkVXOUgwQ2N1Um11WThBcENtQ3l0SStXL3ByQzJyQjZFRWEw?=
 =?utf-8?B?U0dUYmt6cC84SzFCbnBRR2twV0tLZmk5ZDFybUZiaEtzZmxSZHhzOEszM05k?=
 =?utf-8?B?S2FlUjExTFlraml5SVNqYnlrdDlTOUJHNzhSVUxtVVJXUFg5SzVsYVM2NHRk?=
 =?utf-8?B?LzZxUE5sU3BpdXdONklqM2ZOY2FGcSs1RVQ4SHE5UE1kcVhLQmFLeHJwcHpW?=
 =?utf-8?B?c1AyVnNiOWVzTDlIcGc2UWdtMVdIcVZnS0YveHV4SE1hUjFwVXdZcWZOOVVS?=
 =?utf-8?B?d1drT2FVRmtPdHcxSmViN205M3V2STJ5cDV0OE5ncFZvNXRFRG92Tk1EeitN?=
 =?utf-8?B?TjdxcW9pR0VZZTR5UW5mYmJVcHEzNnZNSkRuMnJ5bHhBUEl1d1dBK0IyYzlS?=
 =?utf-8?B?MEFJYlJkOHlVRE9hRFJCMHNhQXVyLzZGSjMrclRYSFIwQ2lwQ0RsSFNINGxw?=
 =?utf-8?B?S21qVEZ5MDNTcEgxNnhwbFZHaGRLcDEwVjRLenh4b2I3Z1pYQWdrWElyNStV?=
 =?utf-8?B?cC9SYjJtZE5lNldwSi9ycTBMOEVIWGJWNHAvSWlqK1dEZm8yc1hpUm5meDJ6?=
 =?utf-8?B?V3ZZU3FFUm44WFlrOHl3RE1WNDVoK0hGWGR5ODhCRC9YRDkvUHBNdm9jZmRT?=
 =?utf-8?B?cUdkNDI4VmRtaVJpcW1CUEJPdVdFaGx2VjFONjdTZURTeVJYTHI3V2dTT0FQ?=
 =?utf-8?B?c2pWaDBGaVYwQnVjTm4rV3d6bGlscm8zMU5DUUMrenBsbGVMaHpzMFBPeU13?=
 =?utf-8?B?QXI1bnhCcGdoRzk4UkV1VlpCL2txZXAwYmQxdi9QaFZYUDY4WGFRT1Q0NTkz?=
 =?utf-8?B?amVwSW16N1BnbE1yd3lhOGdYVWVaUkczTCswMldkSXpyL0xLOWRrSWswcDdG?=
 =?utf-8?B?d1Q1TWdMR1NOV3BjdlBFQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bG5PUmNsRFpPTWI3OG1pZGVRYXEvdUVxc0VYbGt5NmxYRklmVXp1cVpFa2lS?=
 =?utf-8?B?QTl5NURWRCtpajdCbUpreGdsa0lhYUJ2V0tSWTlZSzlwcHhlZjdDNU5JTXh1?=
 =?utf-8?B?ZHNFZm9FVFhJQnVsKzNxSjI1M0VrbjM0S1p4WFY2ckt1VmJ1QlQyZWZzTUNv?=
 =?utf-8?B?VmE5VFZUdTVHOGlCeC9MdGNEVmViWWF5UW9EOVphN1hMUTB4NERQcFI2Sm9N?=
 =?utf-8?B?b2ZmNWdEQzM4OVM4M1FjUThKeEJqTnlVS1FWdlQvWnFoSDZwbWlkYk9UR1d2?=
 =?utf-8?B?aUtLR3FOR3lLY3JPZnA0TTlQVU1jd2JHUEt5dXFaMTN2V2pIcWZQc2hSdlBN?=
 =?utf-8?B?SlMrNlQra3lpR3p4QkIzekVXeXgrQmhjSGdOUnVUcm1xMXhxVWRiNWtMUUcr?=
 =?utf-8?B?T2tHS3poMkErNloxVVNJYlFWbEFGS1JtSUJUVGY4N1ZSLzZuTDZFeWpvam9j?=
 =?utf-8?B?endSSnhLU216cjRNWmQ2eGhaQTNPU29OSmgzdjd3QnVUcHVzTWNjQkh3aWNn?=
 =?utf-8?B?SG13YmtCWTFOWDJSQURmRFRsbzlXOUVUODgzTEk2aXpGUExEbTJwZitxUVdo?=
 =?utf-8?B?bndqVzJ2ODBSUjl3QjhjMWdoQTE4M1VuYzNUTlF3WWlHNFZxNGtubmhyVldE?=
 =?utf-8?B?dlowbzdxWXdWd0R0YVRCZGhFbWQ4dG5oRWZtd0NnTHBzVCtZeEp5VkVPSFk0?=
 =?utf-8?B?QWJJTklvZW5vKzBobFFWbmdhVm11RE0yVG5aaGVXT1crVDV0aEZwZ25LeXNO?=
 =?utf-8?B?RXpJNlhJQW9WRkplUW1nK25hU1ZLYVg2RklxbUt2N0x0K0phcHF1dXg3QTAw?=
 =?utf-8?B?eUdVTnNJRjk4bkZJMEZPQlA3U2FWbWRyVkUwZlgvdFE4UFY3cGl1Sy8zUEsr?=
 =?utf-8?B?YjlUWlZJcnQzQnF4NmU1STEveGdqaTVKOERYRjFjT3NweUR4TElwaElqTXZl?=
 =?utf-8?B?eHRuMnpEeWY3VllybEVNWXJvYVBZUWU3MkJKQjVXVlBxLzlCTEF6SE4xUThk?=
 =?utf-8?B?N2diakV6WHlpVGZOVVNvZHVYS0FNdzNJQmcyWVRzeUFNck1SYXl0RGJEL2I1?=
 =?utf-8?B?bDBmMitTMUl4cS96TS9hdlFud2pDYnorWWpwNjhDMCs1bDVwYmR0b0NzM3dT?=
 =?utf-8?B?Uzh4eVpkVk5PQTgySFNnWE43UHVmV2FnbWVXRERVK09MQ2hsd1NhWjdLQjNN?=
 =?utf-8?B?Nm9zd0lKci81bm03Y3FKZmk0MFg5R29rN24rZlNHUWo1WGd1NjBNSHc3RUE4?=
 =?utf-8?B?UnE2Y0ZhelNxVUEzclVIWVdDTVY1K2l0VFAwNHNqZ3VjblFkNFpoQ1BzaVJU?=
 =?utf-8?B?YmZVTGtRUFo3NHg2RmFFR3BQWkN2cWhBSTFCUFlJVDZtNk9lOFhvU0VZVFht?=
 =?utf-8?B?RllYeHZ4VDQyNkNQVkdiV09pRnBtRjkxTVY1LytGWVpXR21iZjFMSnZHQXZq?=
 =?utf-8?B?SVNFYnhsdG8wS3NHQ2t0Z0Q4S3JsMUlkZUpjemJoL1oraGlvdUtQTVpWNm5F?=
 =?utf-8?B?M2ZBbTY0NzRITUljSWwxbEVPa2JBZk4zbzF1aDNha0g3ZVA3TjJFN0RFRUZk?=
 =?utf-8?B?RTl2cVFNek5DbG1tZ0V1QkY5clI0RVJ6dFJ1OFlFNUxpRVVmODV3NEZGVm02?=
 =?utf-8?B?Z1NWVStVUW9oSkpTS2ZhY1cycFlNL3FNakEvZkh3WmVYV2s1Q0tiVUZFUkg4?=
 =?utf-8?B?ZWhmY3Vybzg2V3EySkNOQVMxdUZDSlR6b3ZmZVVEc2pyS1lVSzl3N2Z2c0g4?=
 =?utf-8?B?Q2dUelJYejVCN3MybmJMNnV3L2ZZSTI1ZXNGNkdtb1A3cUx0YVEvNUNvRVZt?=
 =?utf-8?B?YTBiSENSNE1La2tZSm9xNXRxcmlJOXU0QzFaUXI1dEJPSHFUdTl2MGF1cnh6?=
 =?utf-8?B?d0tJakdlYm1ZSHFXdVhxSnVoZmJOeEpCbmpyR1hDS2QxUVEwdU0wejdnOFFZ?=
 =?utf-8?B?VDB3cDRwb1dUZFdLL3Fod2xDenp5RmhwSy81NjdFT2w1UnRZa2UyTjRQaUtE?=
 =?utf-8?B?MFFBVFlXYm5VQWx0RkV4eDBSSTFTYWZBZmNWQ2xHbHJQRFB5cU85KzJCbjhy?=
 =?utf-8?B?SVVRNTdqU1FCRm52WWtyRmp0OVUrOGdjWEVNejc4Y1ZCQ0dDTFpDQThjTDdE?=
 =?utf-8?Q?fDb6gxsXxpT0UVmvYoXdqRAlO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: befcdfe5-ac7a-4547-62ba-08dca7d01bf7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 08:52:24.6220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: etPks6AMHYTcbwlNS5TMm+WiGu6rgCQwBb3F7GW/VUYaKWUnpQSt+cDIjSkpmgvb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7569
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

Am 18.07.24 um 18:58 schrieb Danilo Krummrich:
> Calling nouveau_bo_ref() on a nouveau_bo without initializing it (and
> hence the backing ttm_bo) leads to a refcount underflow.
>
> Instead of calling nouveau_bo_ref() in the unwind path of
> drm_gem_object_init(), clean things up manually.
>
> Fixes: ab9ccb96a6e6 ("drm/nouveau: use prime helpers")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Thanks for looking into this, feel free to add Reviewed-by: Christian 
König <christian.koenig@amd.com> to this patch.

But since especially patch #3 is not something I can fully judge 
correctness on I can only give an acked-by to the other two.

Regards,
Christian.

> ---
>   drivers/gpu/drm/nouveau/nouveau_prime.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
> index b58ab595faf8..cd95446d6851 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_prime.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
> @@ -64,7 +64,8 @@ struct drm_gem_object *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
>   	 * to the caller, instead of a normal nouveau_bo ttm reference. */
>   	ret = drm_gem_object_init(dev, &nvbo->bo.base, size);
>   	if (ret) {
> -		nouveau_bo_ref(NULL, &nvbo);
> +		drm_gem_object_release(&nvbo->bo.base);
> +		kfree(nvbo);
>   		obj = ERR_PTR(-ENOMEM);
>   		goto unlock;
>   	}

