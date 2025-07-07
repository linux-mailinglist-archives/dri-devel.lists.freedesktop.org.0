Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E6FAFB0B6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 12:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3BD10E114;
	Mon,  7 Jul 2025 10:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eOeh6EX8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3393910E114
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 10:07:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SSX8SgQ3D8hhqNPV/EWjq2p2brOUe9khnIraDbkEEYfZplLD6KoMGeAEvOlx+dkb9R+zo1BZBX7ZjZ0uO5kNPNroD7HOF6OCOa4BoC2JnwDzETfhtoWHvpCDwmDE/WntmzrP1qLaQvs13q5cI1bNxqKULiuplBWt1ydokx9gMzLxoAcrmZGY3O9Q/7ASsx6DaYFY7ayNZBraHoeDu+VEHErFRMvzb00B+uanFlnmrwsUtpCxakmuQWQ1+dVnRJ34gKC1l9hg8PVD7kb/hGxoOK6B++IjpsItXc5S8uuRY+cfFVJVeO7P4mx9zpPKDlXC9WJ2Zt+kg0D8zU/6RVIMbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCEYRIun1n7e368lp5HS3fEeZF1QhPeGZ4qioWciy5Q=;
 b=O+id3gJ4YnU3i76Mx9pdt6a4CG3br9OhH4PvqQ68AmA54HE52Oq+Kysu8aimRfCar9rx9Y2mZnS7oFZUpDb7nIxvn8aHoJA7sONaCtdbhL2vY001nEqIRpSh1xoWB4O+MrPDUKFmelhBNazonOLWHlvKf+qGCXn8p1S4Isj+rQQb4IOPooBiGruTvg/O1moM7E+4GeqQOqIHPx3FI3CSqOtYjRiR2n1vwM6+Fd9mpEQ9J1o+HXN+kLpJ6H8oSD3NLfVy/fn5sCYSVgtQ33wu1T8ZsoYUOCxOWaJSp4jxmkmGiQMcxMOi7ocUPmqEqzs0HYXHnau3OTKob4wYCF848Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCEYRIun1n7e368lp5HS3fEeZF1QhPeGZ4qioWciy5Q=;
 b=eOeh6EX8Zfti83F48T/dQ4190AZetsI/F27WDstHGDmkda+vQJ9ODYlCH1oT+RORYnx6OKKSq1RJAMZmZbXBmsBAfrcM+zjIi9mjPMaO8dOxuqNWv6jPGSDXZtlcMcONUGJ8gs4ajodLlyfSv/xDe/WPR3uJTIFXzfIeqPy2Bnc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYYPR12MB8923.namprd12.prod.outlook.com (2603:10b6:930:bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 7 Jul
 2025 10:07:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 10:07:29 +0000
Message-ID: <4b20c75a-8459-42c5-9937-ebfdbee5ed32@amd.com>
Date: Mon, 7 Jul 2025 12:07:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/framebuffer: Acquire internal references on GEM
 handles
To: Thomas Zimmermann <tzimmermann@suse.de>, asrivats@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, jean-christophe@guillain.net, superm1@kernel.org,
 satadru@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bert Karwatzki <spasswolf@web.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 stable@vger.kernel.org
References: <20250707093200.78436-1-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250707093200.78436-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0450.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYYPR12MB8923:EE_
X-MS-Office365-Filtering-Correlation-Id: a6a1839e-52cd-4c7a-a7b9-08ddbd3e14d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1A2Y1pacFVDY3gwS0lvU21tS3A0ek5IL2NxMENGaUVrWXN1VURPMnMyYlo5?=
 =?utf-8?B?OWJDbi9FeXRVNUl6MDNZSk5uU090R054ZGRuYmJ4L3J5ZUVTMHNwM0k0QktO?=
 =?utf-8?B?bVowaEs4N2lvcm90MEgvYkJBdWgvRG4weHlKM1NJZ1pnWnpOam9VejNCREVN?=
 =?utf-8?B?L2U4OGVTZzBiVzB3NFUvSW03cWJUSzhzTGh2VXVBTUFuT1o1UU4xTGJUNUp0?=
 =?utf-8?B?ZWlFWm1FWU84L1A0M3cxS3p4NU9PTkpoNy9MU3BBQkpLa2ovajg3K3VsNVlD?=
 =?utf-8?B?d2d1ZkdIaklpZnhOZUs3RHFhYmdYN2tpSGI2VVR5ajMwYmdibFZIOVN0eGZS?=
 =?utf-8?B?RHVnNFZDNGZlZDB4L1FuZ0UvWkMxTUtOdkxzN1lmSXVYakIwWnh3VUVPaFV0?=
 =?utf-8?B?MStmOHJna0RmRCtqYkVhakU0ZUNDRkJneXJMMzR5V05rYjVaN1lnMDgrY29y?=
 =?utf-8?B?Y2g1K0lxWHlsLysrMlJ4SlZqSU5xcThNZC9kWVk3QWVzS3hSR0pGVXNjYXBR?=
 =?utf-8?B?V2V4MEdVSm02cW5IYmdUYm12MElqSklhdUhOWjl6RXFpWDI3RHQ5RXlNVEJn?=
 =?utf-8?B?aENEWjZHSmRBUmlMWG5Ubi9JeEVXeG10Q20wazFEZkpKNHRBbkJWTURVS0xi?=
 =?utf-8?B?MTE2bFRxRCtWL3RJMUkrUkJ5M0VmNzdMRTJ2bTk2L3orNVZoTWRTVzJXTGFB?=
 =?utf-8?B?akUwZE5oc25XU0dtQzYwbmlaeERtTVk3alBKUmRHTWRyc1hCczlhVWpaUWto?=
 =?utf-8?B?UkZ0NmlsNkdRS3IzZWszRExPbFdUWnNDTkNzeGNTejJWUElLa0VRandtYXFI?=
 =?utf-8?B?K3B4QjFLRHhiTGJIc2laTVZGbVJNMWpsaWJJMjgzWVRBQXdpNXovL1JNMm53?=
 =?utf-8?B?TnZWclRiUEJvNmJVa1NjQnNXeGlGNnpwcGtyeE91VmlXNndxYWdpRUI4c3lI?=
 =?utf-8?B?K25xdXFTeHJpY3NkdTM3REY1empPZm1mdnFKdmZnOUZ5a3NrTk1iTExDRmhs?=
 =?utf-8?B?SzI2ajhrcUJOcmpjRER0eXJyUmtkWjJ5UzRpTUZJb1B2amhrSGR6bWtGdnpQ?=
 =?utf-8?B?RzZxNUpBdTVHeERrUW1scHVrNEZoOUxnSVBxSk14T3dJWmwyU3AwL3hURm16?=
 =?utf-8?B?aDZTRHhQNXh2WGlhVEFzVFpQcGdPZWtCZXlMcVlvUC9MOW03TC9GOTNBaWo0?=
 =?utf-8?B?T3JibTVtWWdGRlBEcjc0STgrbndlUENrcTNjZk4wRGZ1SytBRU50Rk4yQUhv?=
 =?utf-8?B?Wm9Tak1zendUVzVsMlFybGpWU25mdzNMYlUvL3l5UG1BOWNOOU1rWTZobDVE?=
 =?utf-8?B?NnNXNmU3NWRIc080V0FhYU5PZWxoWHdOQ2pTOVFSU2lXVnU2MFVkcUxWSk1j?=
 =?utf-8?B?VkpidGdzbVo2UHpMVnMzNHhFNzdzSTYxOVBXOW9RSVZDYTdoUzJ4ZjZwQW9z?=
 =?utf-8?B?OEgwRXNITlUxeXJ0VnEvRy81K3BtejhDZGx6TzNza0dGbFVDM3FzZnE3WkY5?=
 =?utf-8?B?QTJkVmJYKzA5VDg3MUFKTXRyZFlOY1ZGQkE0V3JKbkc0V09qVUc4YlBXMlNN?=
 =?utf-8?B?UnpGaHVNeTAzSk1ZTkt6UVVaNTRWdFZiOWpNZ3BITjhkTVpVZWtLMzdzWjV1?=
 =?utf-8?B?OUlPSU9EdzZ2b1hoMnNCUkNnUXBHN3JVWWVrRjNlNHlVNWFwUXBRMHF4WGti?=
 =?utf-8?B?cUN2N3c4VEU4Kzd0aVIwUVpkc3hyUFJ3cVdueWQ4cGpDUWJiRGlBeEVMRTlo?=
 =?utf-8?B?dTdxMjVNOVozWnhiSWZ3d2F3cU5tSys5RDc3RE9NU1JEUjd3TWZoWnNPVEpP?=
 =?utf-8?B?SHFMclN0VTBQVTFTOWtPMEs2UnkvakVSL2xrQ2pVUnp5d0NsMjR4NWZBYUZB?=
 =?utf-8?B?VEt3dWVOSXozbWlhMHNXdkxlVVZIcHd1NUcrckZhRkFyVjAvVFlYbzNjczJs?=
 =?utf-8?Q?V82Y1qOcokk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnpGNEYvYUVuTEQrb2lGTlgxem45OWdsZm9pb0M1aDdUTVNoWG96VDRoMHpO?=
 =?utf-8?B?SzlkVllmZ1k4Q3RMUFk5ZUxMYllpSmFwVWZ0R0NRclQyUm8ybXVDUm1zSmY4?=
 =?utf-8?B?d3Q2d3dHSGdCUlpzVDB2U0Q4dGZmRVNMWUZFZVRna21rYk1iUG9YR0VSOWNB?=
 =?utf-8?B?K3lqQkg1U3FMd2EzM1FyR1UxRWxQUWgycXJ1MUEwN3c3N1B1UVppMDRhMFVz?=
 =?utf-8?B?Y3JhOTJ1MU1zaG9KUm5PSTl3Z3dTWTlKQ2Y5a1V0c2VSY3RlYzFZWFZjY1VM?=
 =?utf-8?B?QnpzSzlUNmZJTGNsOHFtU0pOQ2NCSTY4bWVOVHh4Z1pqcy9EQnR5K292alI0?=
 =?utf-8?B?WWhIMnJMQTN0aERTR0k0czVBckxlU3JldFNUR3FDMlo4aWlacldtWFhnSXND?=
 =?utf-8?B?bWUzTlFoQ3RHaEs3SnZRRnR5RDlKM2ZMd3hYaDI3bCsrS1FpQUM3eE5Jd2Ri?=
 =?utf-8?B?UFYwYUk2aGhmRS9uUTRZa0p2cDJoRXFkdVFGUkVOSHZINzBJVkp0cDgrVGE5?=
 =?utf-8?B?WUQ0Q1VzQk5iTmJiNHI5azVuR3VJa3grRU9FVVRmNFRpZVpwcEVoLzJpVzYy?=
 =?utf-8?B?VnpGOEN0ancvRHhYMGJha3l0Z3JVVW4rTkdBMW1YSWl0c1h3T2tJY2JHdW1o?=
 =?utf-8?B?WWxlSHRuSlE1dGl4UmR5MFV1NEVoT2RkditSZm5wak5NNnR2TWFnYUVaU0RR?=
 =?utf-8?B?MnpPUGVJT0FPR3ZvUDRtWUxmM2IyeGtpR1V3eW5tdjIwWGNrVWdVWUhyY3pB?=
 =?utf-8?B?cUJIZlVXRTZObFBTQnZTWFIrY0t1cy8rS3A1aEdFSmIxeXlveDJWQUtmVFpV?=
 =?utf-8?B?YlJvWVVKV3ZkQW5TUEI1SEcvTG10Ynlhc3huYk1Zb3dBck05QVVqVjlEZmpw?=
 =?utf-8?B?aGd0TEs2cGhZSDh2Z3JYOE5UdUpVZDZ3WThxNzB3WUh4TXFDNnFsUFVINUhi?=
 =?utf-8?B?V2dtcVd3bndnQ1ZnL0Y5WjBKUDNhSndtTzlXY0daMmlkNkY0cDlNeXN4MThV?=
 =?utf-8?B?SUlUSDkzM0pjWDRUZ3NlbExLZ1hQTzVESUZNa2FPZUpuSTFRSVpZb3kySFc3?=
 =?utf-8?B?THRsN2R6YnI5NkVxeEJaU0JiN1dBM1lPczNaRm5mRmhtQ3ZpRU54d0NuVG5V?=
 =?utf-8?B?VVVOSm9lN01KZzUzbW81M2hHR1dIdHJyYzF4WmF4dmcwYmlKekdIV2NuWmlQ?=
 =?utf-8?B?TjU4NjMyNmpaTVk2MVA0RHRpQjdWak9pRGluOVZUamVGTFF3emxBQmZFakls?=
 =?utf-8?B?aElKbFhWK0M1RTRoYXRobFV0ZFFSOWhDZTk2RXFtVldXSmQvUFZzdHdFSHlZ?=
 =?utf-8?B?Qkx5dHBiVFZ0Ky9oc3pXb1U3S25IbFZUNmxnenNVRE10enE2YVFFSjhTK2Ew?=
 =?utf-8?B?VFY0OUthdTlEQWFvOTRLbU9xc3B1U1A4UjNVTkxKMmEwemxjVWlBdEVWMFM4?=
 =?utf-8?B?WHBmdCtKZG9GT3hXL3pDM3FYK3Z3L3dUWk1xSVVySWt0dmVIZXBzZzFRVVhp?=
 =?utf-8?B?R01ER0NqM2tCWEdFMUFsbzVRdEF2Qjc4NkhYZ2ZWa3htMyt5c2hBSE9BZTJo?=
 =?utf-8?B?UXNOZlVEVnpuNENpcVZLY2QyRWdRVGFUWENETHJwNzBnSjhqczhDOGJKVDdL?=
 =?utf-8?B?bktMazdJMVgrSWhzZ1EydktjVldUVmZ1Z213ZFlqbDVQQ0I2K0FEZXJjY0R2?=
 =?utf-8?B?Y0FUVWs1VlBUdWVia2dqL09GYmJiRi9vM2JLZVFKdnNwMXV1VERJQnp0NjIy?=
 =?utf-8?B?ZUQxa05RQW5NM1VLeDVpOWdKVHRQV2hOWjhsWDNZV2dvRDNLZnZvTS9VNWdl?=
 =?utf-8?B?b3ZmWGN0a29NTFU1akNUcmFPOWlucldIWk84OTVSRWZOMXExUUJpSWlhVkVu?=
 =?utf-8?B?cmlkNDcvalc4dmtpRGxiOU4ySjJBT2ZGek5kcDNHL2h3UGpSem04d0E1V0lC?=
 =?utf-8?B?Vm1aMkRSRFZVNVVLSnpnTG5TVHpkbFJ6aWlEVUpQMmw5NGhXUVEycmtKQ2Ns?=
 =?utf-8?B?NXYyamdlcnVhbW5IaDRlTDk4Um1oZTc0a3VUZ1doa2NIV2RWbWsyc2E1czh6?=
 =?utf-8?B?WnpQQzR1ZXN0MVpBaEtCdmJwRzc1Ulk1M3B4SERGZ0tIZkdwbVVRNlpPUWFi?=
 =?utf-8?Q?rBJV75TNoMySf9YSnDjWp0ggf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6a1839e-52cd-4c7a-a7b9-08ddbd3e14d9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 10:07:29.3162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNRAkyo1Xlv02KVNyVLQGM28q/NPr61OwPdWDCZgsaMSHQpJTwaWS9yROVvpLVTi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8923
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

On 07.07.25 11:31, Thomas Zimmermann wrote:
> Acquire GEM handles in drm_framebuffer_init() and release them in
> the corresponding drm_framebuffer_cleanup(). Ties the handle's
> lifetime to the framebuffer. Not all GEM buffer objects have GEM
> handles. If not set, no refcounting takes place. This is the case
> for some fbdev emulation. This is not a problem as these GEM objects
> do not use dma-bufs and drivers will not release them while fbdev
> emulation is running. Framebuffer flags keep a bit per color plane
> of which the framebuffer holds a GEM handle reference.
> 
> As all drivers use drm_framebuffer_init(), they will now all hold
> dma-buf references as fixed in commit 5307dce878d4 ("drm/gem: Acquire
> references on GEM handles for framebuffers").
> 
> In the GEM framebuffer helpers, restore the original ref counting
> on buffer objects. As the helpers for handle refcounting are now
> no longer called from outside the DRM core, unexport the symbols.
> 
> v2:
> - track framebuffer handle refs by flag
> - drop gma500 cleanup (Christian)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 5307dce878d4 ("drm/gem: Acquire references on GEM handles for framebuffers")
> Reported-by: Bert Karwatzki <spasswolf@web.de>
> Closes: https://lore.kernel.org/dri-devel/20250703115915.3096-1-spasswolf@web.de/
> Tested-by: Bert Karwatzki <spasswolf@web.de>
> Tested-by: Mario Limonciello <superm1@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Anusha Srivatsa <asrivats@redhat.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: <stable@vger.kernel.org>
> ---
>  drivers/gpu/drm/drm_framebuffer.c            | 31 ++++++++++++++--
>  drivers/gpu/drm/drm_gem.c                    | 38 ++++++++++++--------
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 16 ++++-----
>  drivers/gpu/drm/drm_internal.h               |  2 +-
>  drivers/gpu/drm/drm_modeset_helper.c         |  2 +-
>  include/drm/drm_framebuffer.h                |  9 +++++
>  6 files changed, 71 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index b781601946db..23b56cde21d7 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -862,11 +862,23 @@ EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_framebuffer_free);
>  int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
>  			 const struct drm_framebuffer_funcs *funcs)
>  {
> +	unsigned int i;
>  	int ret;
> +	bool exists;
>  
>  	if (WARN_ON_ONCE(fb->dev != dev || !fb->format))
>  		return -EINVAL;
>  
> +	for (i = 0; i < fb->format->num_planes; i++) {
> +		if (drm_WARN_ON_ONCE(dev, fb->flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i)))

Looks mostly good, but fb->flags are the userspace mode flags IIRC.

Overloading that sounds like a bad idea. I would just create another bool fb->obj_has_handle_ref[DRM_FORMAT_MAX_PLANES] array for that state.

Regards,
Christian.


> +			fb->flags &= ~DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
> +		if (fb->obj[i]) {
> +			exists = drm_gem_object_handle_get_if_exists_unlocked(fb->obj[i]);
> +			if (exists)
> +				fb->flags |= DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
> +		}
> +	}
> +
>  	INIT_LIST_HEAD(&fb->filp_head);
>  
>  	fb->funcs = funcs;
> @@ -875,7 +887,7 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
>  	ret = __drm_mode_object_add(dev, &fb->base, DRM_MODE_OBJECT_FB,
>  				    false, drm_framebuffer_free);
>  	if (ret)
> -		goto out;
> +		goto err;
>  
>  	mutex_lock(&dev->mode_config.fb_lock);
>  	dev->mode_config.num_fb++;
> @@ -883,7 +895,16 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
>  	mutex_unlock(&dev->mode_config.fb_lock);
>  
>  	drm_mode_object_register(dev, &fb->base);
> -out:
> +
> +	return 0;
> +
> +err:
> +	for (i = 0; i < fb->format->num_planes; i++) {
> +		if (fb->flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i)) {
> +			drm_gem_object_handle_put_unlocked(fb->obj[i]);
> +			fb->flags &= ~DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
> +		}
> +	}
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_framebuffer_init);
> @@ -960,6 +981,12 @@ EXPORT_SYMBOL(drm_framebuffer_unregister_private);
>  void drm_framebuffer_cleanup(struct drm_framebuffer *fb)
>  {
>  	struct drm_device *dev = fb->dev;
> +	unsigned int i;
> +
> +	for (i = 0; i < fb->format->num_planes; i++) {
> +		if (fb->flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i))
> +			drm_gem_object_handle_put_unlocked(fb->obj[i]);
> +	}
>  
>  	mutex_lock(&dev->mode_config.fb_lock);
>  	list_del(&fb->head);
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index bc505d938b3e..41cdab6088ae 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -224,23 +224,34 @@ static void drm_gem_object_handle_get(struct drm_gem_object *obj)
>  }
>  
>  /**
> - * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
> + * drm_gem_object_handle_get_if_exists_unlocked - acquire reference on user-space handle, if any
>   * @obj: GEM object
>   *
> - * Acquires a reference on the GEM buffer object's handle. Required
> - * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
> - * to release the reference.
> + * Acquires a reference on the GEM buffer object's handle. Required to keep
> + * the GEM object alive. Call drm_gem_object_handle_put_if_exists_unlocked()
> + * to release the reference. Does nothing if the buffer object has no handle.
> + *
> + * Returns:
> + * True if a handle exists, or false otherwise
>   */
> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
> +bool drm_gem_object_handle_get_if_exists_unlocked(struct drm_gem_object *obj)
>  {
>  	struct drm_device *dev = obj->dev;
>  
>  	guard(mutex)(&dev->object_name_lock);
>  
> -	drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
> +	/*
> +	 * First ref taken during GEM object creation, if any. Some
> +	 * drivers set up internal framebuffers with GEM objects that
> +	 * do not have a GEM handle. Hence, this counter can be zero.
> +	 */
> +	if (!obj->handle_count)
> +		return false;
> +
>  	drm_gem_object_handle_get(obj);
> +
> +	return true;
>  }
> -EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
>  
>  /**
>   * drm_gem_object_handle_free - release resources bound to userspace handles
> @@ -273,7 +284,7 @@ static void drm_gem_object_exported_dma_buf_free(struct drm_gem_object *obj)
>  }
>  
>  /**
> - * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
> + * drm_gem_object_handle_put_unlocked - releases reference on user-space handle
>   * @obj: GEM object
>   *
>   * Releases a reference on the GEM buffer object's handle. Possibly releases
> @@ -284,14 +295,14 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>  	struct drm_device *dev = obj->dev;
>  	bool final = false;
>  
> -	if (WARN_ON(READ_ONCE(obj->handle_count) == 0))
> +	if (drm_WARN_ON(dev, READ_ONCE(obj->handle_count) == 0))
>  		return;
>  
>  	/*
> -	* Must bump handle count first as this may be the last
> -	* ref, in which case the object would disappear before we
> -	* checked for a name
> -	*/
> +	 * Must bump handle count first as this may be the last
> +	 * ref, in which case the object would disappear before
> +	 * we checked for a name.
> +	 */
>  
>  	mutex_lock(&dev->object_name_lock);
>  	if (--obj->handle_count == 0) {
> @@ -304,7 +315,6 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>  	if (final)
>  		drm_gem_object_put(obj);
>  }
> -EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
>  
>  /*
>   * Called at device or object close to release the file's
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index c60d0044d036..618ce725cd75 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -100,7 +100,7 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb)
>  	unsigned int i;
>  
>  	for (i = 0; i < fb->format->num_planes; i++)
> -		drm_gem_object_handle_put_unlocked(fb->obj[i]);
> +		drm_gem_object_put(fb->obj[i]);
>  
>  	drm_framebuffer_cleanup(fb);
>  	kfree(fb);
> @@ -183,10 +183,8 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  		if (!objs[i]) {
>  			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
>  			ret = -ENOENT;
> -			goto err_gem_object_handle_put_unlocked;
> +			goto err_gem_object_put;
>  		}
> -		drm_gem_object_handle_get_unlocked(objs[i]);
> -		drm_gem_object_put(objs[i]);
>  
>  		min_size = (height - 1) * mode_cmd->pitches[i]
>  			 + drm_format_info_min_pitch(info, i, width)
> @@ -196,22 +194,22 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  			drm_dbg_kms(dev,
>  				    "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
>  				    objs[i]->size, min_size, i);
> -			drm_gem_object_handle_put_unlocked(objs[i]);
> +			drm_gem_object_put(objs[i]);
>  			ret = -EINVAL;
> -			goto err_gem_object_handle_put_unlocked;
> +			goto err_gem_object_put;
>  		}
>  	}
>  
>  	ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
>  	if (ret)
> -		goto err_gem_object_handle_put_unlocked;
> +		goto err_gem_object_put;
>  
>  	return 0;
>  
> -err_gem_object_handle_put_unlocked:
> +err_gem_object_put:
>  	while (i > 0) {
>  		--i;
> -		drm_gem_object_handle_put_unlocked(objs[i]);
> +		drm_gem_object_put(objs[i]);
>  	}
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index f921cc73f8b8..e79c3c623c9a 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -161,7 +161,7 @@ void drm_sysfs_lease_event(struct drm_device *dev);
>  
>  /* drm_gem.c */
>  int drm_gem_init(struct drm_device *dev);
> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
> +bool drm_gem_object_handle_get_if_exists_unlocked(struct drm_gem_object *obj);
>  void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
>  int drm_gem_handle_create_tail(struct drm_file *file_priv,
>  			       struct drm_gem_object *obj,
> diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
> index ef32f6af10d4..1e8822c4b370 100644
> --- a/drivers/gpu/drm/drm_modeset_helper.c
> +++ b/drivers/gpu/drm/drm_modeset_helper.c
> @@ -94,7 +94,7 @@ void drm_helper_mode_fill_fb_struct(struct drm_device *dev,
>  		fb->offsets[i] = mode_cmd->offsets[i];
>  	}
>  	fb->modifier = mode_cmd->modifier[0];
> -	fb->flags = mode_cmd->flags;
> +	fb->flags = mode_cmd->flags & DRM_FRAMEBUFFER_FLAGS_UAPI_MASK;
>  }
>  EXPORT_SYMBOL(drm_helper_mode_fill_fb_struct);
>  
> diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
> index 668077009fce..11fa20d21c58 100644
> --- a/include/drm/drm_framebuffer.h
> +++ b/include/drm/drm_framebuffer.h
> @@ -23,6 +23,7 @@
>  #ifndef __DRM_FRAMEBUFFER_H__
>  #define __DRM_FRAMEBUFFER_H__
>  
> +#include <linux/bits.h>
>  #include <linux/ctype.h>
>  #include <linux/list.h>
>  #include <linux/sched.h>
> @@ -100,6 +101,14 @@ struct drm_framebuffer_funcs {
>  		     unsigned num_clips);
>  };
>  
> +#define __DRM_FRAMEBUFFER_FLAGS_BIT_OFFSET 16
> +
> +#define DRM_FRAMEBUFFER_FLAGS_UAPI_MASK \
> +	GENMASK(__DRM_FRAMEBUFFER_FLAGS_BIT_OFFSET - 1, 0)
> +
> +#define DRM_FRAMEBUFFER_HAS_HANDLE_REF(_i) \
> +	BIT((__DRM_FRAMEBUFFER_FLAGS_BIT_OFFSET + (_i)))
> +
>  /**
>   * struct drm_framebuffer - frame buffer object
>   *

