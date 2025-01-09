Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09747A07619
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 13:49:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8265A10EDB4;
	Thu,  9 Jan 2025 12:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tRpWyAAi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5E310EDB4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 12:49:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JW86f79J8b+p5NKVBxh/Dyo7OuVNkSMApSrXFzeWP8Z7xMtMEn7i5xB07yhkn6HGuh+sjUPp1DqS6mrpZkvjVBuexu2tCgvBixCfVDUs20rFR2bI0XcJdP2S3DCwbXNe08KPXNx8F9SSNkJ/x6uzb8/sKJAMmEG2zs7eIz/m5iiMwP18JpZSpbEo1AqZzKmLljBteTIK8ghZBMx9TP+LeB1P9fzmaIYAH0eCDvVBZqHO6VSnNi91I9tIgN4g5/pW9J/lbZ66wl3gPl173/d+dkWvoATR3CUaUfwd1PeCjc7dsyGz+WddKkUJJVTs0G+8wnMNqQMa9WllAPnytPt08Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iD9mMltQKUDzZH+9Wysa/NOcudEu9Rz5EuoblYAQb8g=;
 b=olI9Rzcw8yiL3sM9Hx0NQWoK8uVd0X06ppirx6BT6tYr14cNkIiLXaU6uA7F42AcbJfgUM8GklCsyO2nsJGfAdecx+/PzQhhYSJdiEBCgtVx9aiPeP2GZBpZAGaUbva+waTKCALelD93Mc0DqtSbAAmCJrsKeAu9uJcCmwOkRuKb2nCLTTHiHJ5ywxcj0CBfZxIwgdcyP+Dfd8Kq2ixoUS0u9p4maTNuoZlQdGu37TcsI1paz5a3sYdjyNKZJIXlALYyhjkFadbZ0yo9DMEP1u7gN0fpYrA1RGZb6alQdmW6J3J6f0ndt+21+LROFVaTYFPw5JCCVW4zzuyJmmrXxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iD9mMltQKUDzZH+9Wysa/NOcudEu9Rz5EuoblYAQb8g=;
 b=tRpWyAAizI9jY/fyOrZeGR9mz/xHz8lQ5L/u6uM/zfQZgebiYRdYe+VO28lAzvPQDhlIMpc1y5UM+KpG8VxokhUEDmuI3iyZpX7idWTibSKdnKYw1JzOKsyt5WuqU/S7fIEcwgA9t7kJweq7zEpl6XbMT0BCZ27N2S6UUegD9Pw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB8340.namprd12.prod.outlook.com (2603:10b6:930:7a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 12:49:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 12:49:38 +0000
Message-ID: <6fa2fd44-c01c-4c29-b3ba-3e1e36b68605@amd.com>
Date: Thu, 9 Jan 2025 13:49:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 03/18] drm/sched: Remove one local variable
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
 <20250108183528.41007-4-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250108183528.41007-4-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0221.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: cf1b7bef-8e39-4372-552f-08dd30ac1414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVNRM3RXZHlzNytmaU42NXJzR2xVSGpQNTV6eUNEMDIvVmFDM0dSMGFIRU14?=
 =?utf-8?B?ajRWWVQvU3dOSDdHRWpVdU1pSUtvZmpJd3p0TUJkSlJGdGg3OEJBcCtqem9r?=
 =?utf-8?B?Y2xyYVh6dlhjVXVWRXk4M0dNOUNFdWthK2lGVFJYOTRRb3pyR20rc3RmRU5q?=
 =?utf-8?B?L0w4OHBhRVo5WFprVUtHWGp3OTcvS29xRjg4WHR3NkxUeVV2NUVpQXNKNmM0?=
 =?utf-8?B?OTYxZTFPeE40SXlscjNZNVdwNS9obFg0bjRyY3drNjIyajlNYXVjcWx0TTNT?=
 =?utf-8?B?T1lXcmpBazBOMzB4VUhKdUxqQXU0aGd6eEUyTjlkUlRVN2k0QkJzUHh6b3l5?=
 =?utf-8?B?TzhibFdwZ1QxUU0vRk5PNTRaMy9DQ09sT0k1Z0ZDM211eUxiblBLNVNTSDdm?=
 =?utf-8?B?UjRSeld5MGF6a1RuelBOOVU1UFlPb2h2Z0xjaUQ2SUw0Z3ZTbmc2dlR6QXUw?=
 =?utf-8?B?aGZBVVY4VHczc0dmODJDZWZiZklIQUhrMm1xbkpqS2VIRVhESW96SHlQcWJw?=
 =?utf-8?B?OGxpa0FCU3Y3U0tRQ2kvVDBPNWVsN0lKR3R2NWMvTGo1WktoZ1U3SFEycTdX?=
 =?utf-8?B?cGhhQU5WSmZpTm55MDlKWkRQSUQ4RWhNSmdURGxjTmZ2MUNqa2dRQ0FpZlI0?=
 =?utf-8?B?dGc5Zk5Ec1RISEdYWmFZdk5MempTUW5GRWQyOGNyUjBkOUhnNkdkR3R4S1Fr?=
 =?utf-8?B?bC9KWUZ5N1VXci94NHJ2ejMzdkRVWHFuWVNHSUVwVTllaUQxUXlXOTBqalho?=
 =?utf-8?B?bUpaS2RwbHZ2dVY0ZGd3MzdDZUJuZi9tNkwxd0RBaTF4aXdpbTZERFdnRjNF?=
 =?utf-8?B?WnRtOVdFMEhpdWJMVjZzVWV5OURrUkdPVVhCRVNjb0F1bE5xWW9nVGVMOXdO?=
 =?utf-8?B?bDJLanUzWHQxa2FuL2JjWmFRVHVnc3JqNEl1SitIWmYyV3dJejdHTkZnQVNp?=
 =?utf-8?B?ek1rUmpydEx5ZFFldmNwQlVQSlIrd2ZyS2JRRHVVakVrQjd4WkxWQU0vNDhu?=
 =?utf-8?B?V0t6TmxiWmdYSnZFMFk5ZWxwQXpOUDdHUWJTV1UwZC84Z1hCQXVYYmIxZ1p2?=
 =?utf-8?B?YkZBL0tZWGhaaC9sK3lublI1Z3ROUlBlTEpCMGZabGNObDZ5UHJ5Y05CQ2t2?=
 =?utf-8?B?ZmIwelVoWm1BcjAzRzRSaEFoVDhNRWhFd3pNemtpOGJVYXJUYzA2RUVrZTRY?=
 =?utf-8?B?dHl4OXg0LzJ1bS9NVnBqUWM1Rm8rOUZ2Zm91eWtoRkI0Qk9LMlkzVHJ0RVkv?=
 =?utf-8?B?SHNrdkxESnRWTmJhU3I2Q0dYTUZYOGxYQ2JTTWVrNUNDWmxrcEpobnhBMm1X?=
 =?utf-8?B?TEN1dVBGTzRKSlF1bThIVURZRjRaWFpsdHdmT3VGanJSR2VRZUFIN2lvNXBj?=
 =?utf-8?B?TmppTTBkVDZpTzQ4aFlvWk5VaklHbTNjYmNlOXh5NThxbnh4Z0hGZXFMQ3hn?=
 =?utf-8?B?VUd6eGhXYktCZGNmOGZMeTFuOVZnelZjNkwwdHJLR3BkbjFzdzlVUHVsU3M0?=
 =?utf-8?B?ZjdYSEJwQUF5MEozQXc2UHQ5Q2xqSUg3NE5HVHpIVHMrampwQ3N0SFl2MkZR?=
 =?utf-8?B?WVI1NVhweTI1K2hsb3BaM3U0VEFIeFNSTE9vZEt4SjVUdkFNc0NmVEwyVE5G?=
 =?utf-8?B?RStJcnJBUXhDVVVZUjkxQ21hZUswK1VHYjQrR3E1RldEazVMdHo5YWZ0dTZq?=
 =?utf-8?B?RENqeG9EaHJSZmt1c0FyQUprM0Z1SlBHaDNFL0ZKZHpJNWhnb29zdlY1dWJ5?=
 =?utf-8?B?dE5RekVoNHA0VDZPbFlqclcyZkNIL0xtR1pEUjIxWTFZRUF1bGJ4VjdYeXpt?=
 =?utf-8?B?UU5OVko3TU5vV1pQeEwycE5VWnlwS051TTZ1c2k4eGVzQmFvYlJab3J2V2tL?=
 =?utf-8?Q?0fLG4DzuKXR1v?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlVXbFFaQVQxVm9ib2NjNkFmM05wV0twc1VIQlg1anZsd1BROHNOaUZMVmx5?=
 =?utf-8?B?ell5aUs0UWNZZHJYR1VheitMeUJMbDZXaDYybkVzQkJwQ3FwMzFnQk5mTFBR?=
 =?utf-8?B?RTNhaGpOdFpreXR4YmxKc0tKQ1EweWdBME9nZmQwbWxxV1haTUN3azN1YVlG?=
 =?utf-8?B?Zjd6V2YxdHAwcFcxUmlDTTk0cXRzeGZUZGNRUUZkSFZGZm1zWFZDdDNYUlRP?=
 =?utf-8?B?eitERHN2QWlMWTRBVkcyQkN4VUFQdlBpcGR0ZkFPVjFFZjFxRkhKUTZ5b1dq?=
 =?utf-8?B?eFpoME1Pd2VLUEl5Z1dnTXBRT0xyUjVqcEdtTW0ybVFYVmhQd1drL0lKcHlw?=
 =?utf-8?B?MmlkU0RWTFJ2UDYrMWhKek1JL1JFMlIySXIrYTdBOEh2R3ZQRkd2RnNKMkVT?=
 =?utf-8?B?ODB2SjhKajNmOU1JVFdiS2x1T3hkN2dhNFlLQXB0UHNaUmxXV3RmMWVVVFB3?=
 =?utf-8?B?OEthMlVnaVI5dERkN2tJQVVocTRtTUpzRXlFakVtbldLeVNCYzhrKzIwenY4?=
 =?utf-8?B?Q1FFVjFBRHd2bGt1a2JicVpIQlBSZTJyZktSQW9GNk5Na2UreHR3SklHNU5t?=
 =?utf-8?B?SzdrNXo2UXB5cjk3RHEwZUlLREkwNUoyTEdRVEt3dy8rc2xyWHlEcVVZeU9w?=
 =?utf-8?B?aEZ4MFVXZ2Evc0tXVkNMSTBvVS9HbW9XOVkzUFl1TTJvNllMcHRCR0ZEVlZu?=
 =?utf-8?B?ajJIY1l3MkI1ZmEzVVFIelY5TkhSeWR6YVpQU3FQaUIxWnJvNkF6MlBTT1ov?=
 =?utf-8?B?dTA2Mm9WUnNJZGtKY3BZcnBBUzJ3VTVyVnNJMk5RSWNaT3Q3SHhINmlTanpi?=
 =?utf-8?B?UGdCWjVLLzdKNEFWQ0dRcEx5a2ZxbkcyMGpuSlpSdFc5bkpuZVIrcHZueEdZ?=
 =?utf-8?B?L3FTN2pqWHd1Tk1FUktsWEFYaFZoSWY2czlXN2lxVGNKekpKK0tyT2pNVEVL?=
 =?utf-8?B?Y1VpS3ptWlNLS1RZeGljUThGV2xNTXNkb1ZVU1RNREFtSVZsTXY2eGUwNzFW?=
 =?utf-8?B?UGZhTVFZMGlTVDhBM3BWNkF4azBQeFZkSWt2TmlHVFVOOTdaeElQRWVWUHRW?=
 =?utf-8?B?bzUvc2tvMzhFU1lWZ09TcEgzaVhiSy9PanBrcmhGNU9HTzlORDVlZ2IvTldK?=
 =?utf-8?B?NFUrL1ZQZW03SzBxR3JRVHNObWw3cDJqVkU1Y0UyTFJGUThXZUk1dU9wNnZh?=
 =?utf-8?B?R1gvVGYrdmhZVTNRN3pLLytaSzdkRVNYd09lajRUZDYvTEgzaFpmTGdzMnky?=
 =?utf-8?B?bGxWY3FFQUZtTUxzeXVaSy9ucjNNMkp5YXZoZzlFSFJpZk5WeU9MSmJBSGxT?=
 =?utf-8?B?VEVwUkkzY0oxR0pacmtlOGNvcENFbXFybmlPWU5XU0xJZFhkWkdrN1RseTlE?=
 =?utf-8?B?Qi9JUVAxVWttTlkzYnpodkJxWG1ieCtDQXpZRHp4L1lJSThuYjJaS3ZNRS83?=
 =?utf-8?B?NmVpVVA4K1pqeTYvcExURllzbkZncGd0VEFkdy84Y2liQVVWK0xCK0ZwcW14?=
 =?utf-8?B?VE0xWk56YVExZlMzU3RRQ085UWlkZDkwdmVMTTV3azZEQWEwQWFtK2x4YjZz?=
 =?utf-8?B?bzZZUURtcDdKeExNVjFpWGF2UDZzQmN1UGtxaC9zNGk4Wi9mV1lxeG0wMUNh?=
 =?utf-8?B?RGJhczZoa0xVNEppbzZraUQ2L2UxelA5ZEkrRitpK1pKUlN3VG55MlVlVDVn?=
 =?utf-8?B?b3hiSEx4RmNpRm5sdDBacG8veHBLTnJzSWJwNjZUejJsQ3VEWGoyTmlBUnIw?=
 =?utf-8?B?VyswdWpqS1dRYU8wbUkwYUh0STNFWW44UjNBZGhUclZJdW13RUw2dEZLNXpn?=
 =?utf-8?B?ZnIxUlRPKzJJUUM4UVVIZC93WEdiaVhFUGR1Yy9HTUJlRTZIZHdDWTNrdklv?=
 =?utf-8?B?UmZHVHlieEVQTEJ4K0tCWVRFY1RRYlJnc0lEYnBuYVhvQk1nbFd3WTcrZlFH?=
 =?utf-8?B?bGFvb0NQR1hYNXNJZ0lWMnhJQzdkQ1FRb0c3cjlBSUV0c3lnYVRXck02ODRZ?=
 =?utf-8?B?NnpZUnAzT1BpWjBQY3hxWWNIYkhRbVd1VXRBSVEveU43UUhKUzI5ZzR6OHh3?=
 =?utf-8?B?U0VadW84RjhRampWd2YzNjJmQ1Y5bnZkTnppVkxRei9MM1EvZmh4WXc5Smx5?=
 =?utf-8?Q?gQnjK+pLbXSO1jgfOQC7rgJRT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf1b7bef-8e39-4372-552f-08dd30ac1414
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 12:49:38.7214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zF7SqRcQ+oyBPch17IhirkYfSggDVyg8fBbT3v8iTV4R1dWZH/r6yUZE/6B/iJ+h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8340
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

Am 08.01.25 um 19:35 schrieb Tvrtko Ursulin:
> It is not helping readability nor it is required to keep the line length
> in check.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 1734c17aeea5..01e0d6e686d1 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1175,7 +1175,6 @@ static void drm_sched_run_job_work(struct work_struct *w)
>   		container_of(w, struct drm_gpu_scheduler, work_run_job);
>   	struct drm_sched_entity *entity;
>   	struct dma_fence *fence;
> -	struct drm_sched_fence *s_fence;
>   	struct drm_sched_job *sched_job;
>   	int r;
>   
> @@ -1194,15 +1193,13 @@ static void drm_sched_run_job_work(struct work_struct *w)
>   		return;
>   	}
>   
> -	s_fence = sched_job->s_fence;
> -
>   	atomic_add(sched_job->credits, &sched->credit_count);
>   	drm_sched_job_begin(sched_job);
>   
>   	trace_drm_run_job(sched_job, entity);
>   	fence = sched->ops->run_job(sched_job);
>   	complete_all(&entity->entity_idle);
> -	drm_sched_fence_scheduled(s_fence, fence);
> +	drm_sched_fence_scheduled(sched_job->s_fence, fence);

Originally that was not for readability but for correctness.

As soon as complete_all(&entity->entity_idle); was called the sched_job 
could have been released.

But we changed that so that the sched_job is released from a separate 
worker instead, so that is most likely not necessary any more.

Regards,
Christian.

>   
>   	if (!IS_ERR_OR_NULL(fence)) {
>   		/* Drop for original kref_init of the fence */

