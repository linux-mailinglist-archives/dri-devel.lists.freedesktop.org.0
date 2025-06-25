Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FC3AE80E9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 13:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369AD10E20E;
	Wed, 25 Jun 2025 11:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1hOYFQbM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23BF10E10A;
 Wed, 25 Jun 2025 11:25:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwfWh8Auxo2JJL6CFrVl7lMvsMh2IrpxXe/kv63aqWJOuYDOKBZqStjbQjB3UkwG8QaHAvqdrW2U6RCzk0C6vHSBYwNA0kqE7JcWoug2ASTQrJGitXbSb3zmvv2Vy/pwhQ+2j9Jez9FEqofRpSr/1VIw08SvXpQfj0ocDrFpaO8E+yrdcNJNHCYGA6sINgzudTvcJDNLT+CJuwnmnUW6A8MHpFPnxJ/QoEooXn/SEPs3rZOrUk+Fd4zC9Fv+9A17mDV1ialRLm+AHh/JQHU76STVAA3pMHs09I5Mhc/54ha5gVHo8fr1fri5yzPR34G7Q/NjC/AAzsx9BnY1S2RtRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQzcw3CWdb0Hibh0hd8K3mN/hN+CJ5ID+EzyWJtzwOA=;
 b=vENjxTU/CkIomo4fOldtVq0a6SdGRtRN7JSijFpqeG3kz8wA33u9u5P4Sn2R57uG8IqlUPuMCdMkCPf3KqbcKFbluOOtBK7Cuy4qzHSPb9oKCX5b3/C4Tnt+J4/vo4j9tgnujaG6dF27EEsla83Vdfyq/JoB4NgLkl015tZGvFj+AMlXbq3Ri/pUdIisnBtqpCjYsAeppiGiXiH4CtS/pu7T7rSj4Er/vuXCH6qU5jqoEeydBil75cf/CZEzrK8n2/1ngiNI1UIvAySwZ481toHZDL6/vp7P9GrmzDuH5/tybvD75orC/YkPfVYwnKqe5iYtxM0cf//Q+s+74QQ4Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQzcw3CWdb0Hibh0hd8K3mN/hN+CJ5ID+EzyWJtzwOA=;
 b=1hOYFQbMq+G6dDUUXyZAH5PjYDpmx4PvE/ZjCL/RTYMwzs6Y9xhF+wyNB57g3yiTN2KzBRHlLPnMm9BiVUgP0BHguc3etoLb6b+1qmlVf8zRcKVrJ469Xu+W4NzzPXkGXrt2QPm/du2wKJtp25OsCg4JLHdeuOYfkiRBi4osg4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB9116.namprd12.prod.outlook.com (2603:10b6:a03:557::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 25 Jun
 2025 11:25:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 11:25:28 +0000
Message-ID: <1f6b8e22-8608-4026-a306-3b4d38fb8027@amd.com>
Date: Wed, 25 Jun 2025 13:25:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm/amd: Avoid using import_attach directly
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@gmail.com, simona@ffwll.ch, sumit.semwal@linaro.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250625084314.414044-1-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250625084314.414044-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0303.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB9116:EE_
X-MS-Office365-Filtering-Correlation-Id: 197c9619-8275-4c8b-249a-08ddb3dafc7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejg5MlVFc1VOMEpaNjNvSTNGUHRvYWdWeEs3ZnZyL1BtRnRWRi95dytXbU04?=
 =?utf-8?B?bHhkSjAxdTd5UmNZakFPZHR1RGN1dUM0bXJLZTdJNUE5T04vN1QwNnBYc213?=
 =?utf-8?B?NExtQk1vRmlybjdVOVI2WXU2UVFmSHhCT0tzTnMyZ25hRWlCY0JjR0dJNCt1?=
 =?utf-8?B?cVJ4L1JYakY1WlR5V0ZnNitDV3dMNHM3czIrZ0c2ZG8vRytNVDZtaW1mUzE3?=
 =?utf-8?B?ODZOdFB6Rk1vT2MrbUVNeFg0M2JFaHUrMHVXRC9sYkxROGxvSnJTUFJmUzQ0?=
 =?utf-8?B?OHlYbnV2RlRPemJBS0V2TUJ1Y2hCa0ZFbC9WK1I2d1c3ZGd6YUZXc21QM1px?=
 =?utf-8?B?YmhnaWt2SmEwZzk4L05lVHgzMnpFdjJYZ2lpR0xYQXVLYUhRTUNYQ3hMU2xI?=
 =?utf-8?B?RFBNWS9kUmdJMVhFTGpPQnc3Nm4yVnNPeTJBdlVxa0h3L0pObDVMSU85ayt5?=
 =?utf-8?B?amY5TWJpZ3FVS2s4WHBydmdOcSt5WGxiTWF4UkdUV3JJNVgzT0hUN09NSUNB?=
 =?utf-8?B?UG5kL1VSdFg0Z20vY1lYQmoyeVdibXVYcDJnSmo3Q2FEL012dW5TS1JFanBj?=
 =?utf-8?B?ZlR0WS9VRy9BdFRUbDRsN2ZCZmc5UXNQaDNNNGE3dUVXSWNmbHZubDhrcEJo?=
 =?utf-8?B?amNZMFpXenpZbVVENllNVkdGZ005aVE3Q3Jnd2R3RzFqMVcxMkpHRXMvNmF3?=
 =?utf-8?B?N3FkT2pneFFUYUkrRTRNVnNNQWEzMUVSV0dxVjh6d1ZiSXQ0M2dvOFVCU3Vy?=
 =?utf-8?B?My9lUWtJWVpnWVRBcHUvbGJnSlNlWkYvRzRjeVBhWmMvMkhJUkYzSmhZZnJt?=
 =?utf-8?B?VEtWQW5PaFpyVXdEQitFWm1iTnJXK1Z2UGNpNnpTcUs1Rzd4RFFtL2JZT0lP?=
 =?utf-8?B?Q2NmMFl1UWNyQ0s3N25ncnU4MXEyampVdkFPRGJEVHhyV0lqOWw4bVBiREVY?=
 =?utf-8?B?blZXbHJ3b1F3VE5VV1lIdWNxNVlCZzhKNDdoUGZ4Q0svekdkM05Db3lxUGFx?=
 =?utf-8?B?T1BCWDd4RGdEbVRwckY4Q21zQjRVN01YNkJyRFBvSU5VSEQ2dzhTNENXSm1E?=
 =?utf-8?B?Y3ovSzM1NUJGTWZpU3pMMHlzeUl6SU9COUFlbStmakVDcmt3WmUycW80R2c3?=
 =?utf-8?B?V2IwL0EvZnJVOTR4d0NjMkxlSDUvcnF0WGlHNm5vclArMGhlWUFIQ2lwYnBN?=
 =?utf-8?B?NXdEL24rOFdZWFZrRTZTWU9kSHlzWnd3VStPOE1HSFpPWlpjUEgvb2ZmNDk1?=
 =?utf-8?B?N211Zk0vUmZCSG5YcSs5WC9GZGN4ZkozejdiVUZUNjgwK1hiT0pSclZESDZx?=
 =?utf-8?B?L0VnU0NLb0w3Um4vS3o2T0YyYm0ycGp1Y2VCNjBxUm5jajZqYnJoMm9raXcz?=
 =?utf-8?B?emgxMG0yeWdhMWN5aCtVckVZOVhqTWxLMFA1NzNqWnJIUEcwdzRqbUcxaGtS?=
 =?utf-8?B?Vldkc2R4dDNFVDgxVk9PQWpmcHR6bkViR0QxR3luanBvcG9PMnBQL2JFa0E4?=
 =?utf-8?B?WlB3aWVQWm5DaFljUkQ5dnpmMFJVZ0k0aS9JcU9Ma3Q3MHFRK1hjWmhFd09U?=
 =?utf-8?B?bFA5a3hKNUxOdk1SR2Z3UWlUamJFYXZNNXJTQmxLd3B5M0VDZ0VRa21qSnVs?=
 =?utf-8?B?WDlwL2dZcUZBVFFSbjZvTENmUDJCUFR6eE8ycnlyOC83MnlFSUtjYUZNUzNL?=
 =?utf-8?B?Y1lVSW5FTXZvTWljb293a29UTXdrbkoxUTR4Y2NSbDNFY1Jlb1A1ZG1DUm1y?=
 =?utf-8?B?cHpPYUk5cTRQbWtaRWlNQ2dBdjc4TVdmL0ZpQWU3TUZNUmdTWlgvOUNrZ3di?=
 =?utf-8?B?S3VZTjBWNElHeUd1TDBZa1FrVU1RMFNpd0wwS2thd2YyL0tnNzg3SklOUjVQ?=
 =?utf-8?B?M29Qb1lOaWMxS1kxbzJIbUxZalZZcUtpYXFlS1U3L050aVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmhoV2cvVnVNbENDdm9JOWh4dDJVdlB0MWQzd0hiWms2VEVQY2UvbnQ1ajU0?=
 =?utf-8?B?a0llaGJLSW9xT1NnSm5leTh3ZzAyaytlLzhZSlMwTFZPWVhOVkFxZGJBc0xr?=
 =?utf-8?B?RmJlSllsaEtRTGp6cW5qUDd5ek1zRnZxOTc5SDhOWVljdXRKbmkvNlhlSVd6?=
 =?utf-8?B?WjhPNW9NbkNNUWUzMDNQSW5ZNi9UVE1PeVNGck8vdy8wTzVnckZEbEdROC8v?=
 =?utf-8?B?WW9QUHBJK2tNRS9SckFhY0dVVTRySnN2dUIvUXR2SGxsUkx6V1Zrb0dCK1ZF?=
 =?utf-8?B?T3NNcUlvaVJDVS9ZMjZSbDBBZEhhd0ZubE9CdHdEK2JmNVFmbWFZMHRZeUw0?=
 =?utf-8?B?bHBOUWNCUWliVWQzaDJnSWdrV0ZoeTBja0pLblJiWnlrMVpxS0hVa2QzdFd4?=
 =?utf-8?B?M1A2YTZmYXdFNmtncGIwcjZBOGc1QVlkU2V4RG51RnpVOW1FU0d0ZEc2bStJ?=
 =?utf-8?B?aXFYdnFGSDhDKzNOZmFDaUpCQkN0ZHB3NTdZY0hGUXVLa3BJQUp0d2ZLZVl4?=
 =?utf-8?B?US95eVZRRWVoVjAyWkVhSWkyc1JLemhPZGtKYk1STFdUTXB1TS9uMWFnYTl1?=
 =?utf-8?B?UXhZSGRlR0M2aEVMR3ZDWmYrYmk0Mm56K2V1RXNoSk5rUWE5NUVhTE9JMHpK?=
 =?utf-8?B?eXlNa3BSMVV1bklCVy9VU0J3cnRWelBmMlozTXJqZXpmWE5MSmJHbFAxOE5t?=
 =?utf-8?B?MFVvS2hKMHlGMkFrN0c4QkV6c2J4b3ZqbC9iMFBadW82TTVDKzZSZ28yaVV0?=
 =?utf-8?B?UXZwQzI1VU9XWXl6b2VUcko5S1FvakNSd3VTODNPMFg3ZGlkSVQ4dnFQOXAz?=
 =?utf-8?B?R1BHYWVwb0hSdDVkM21JT09HM290QTNJSElQVlNlbVdsOGdHNzh0U0doTG9Q?=
 =?utf-8?B?bVQwaUQ1QmdVVEVLV2Jmd1dQNDRFQXEvVDJhRXEvV3ovZ1N2Q29DaE00QklU?=
 =?utf-8?B?Y29UMk41aUpheGRyb0dlOHRkS2dXTi9adFlNS3U5UHNpU3ZwT3poRGgxaTRn?=
 =?utf-8?B?T04xRjc0TXZjWlBQVGFYeFBKVmxycHphME1ENmZpdmtEbUdpd0tDeUY1WDN0?=
 =?utf-8?B?Y2IzOGFMUzN6Q09jMnlGQi9KZk9yci96c2VFS3Z5STNjcTR0b1ZOMWl1MU9H?=
 =?utf-8?B?eVhWS2hZdUkvQU9CWUdQczUwN1JKYm84STdSNnBZZTRBQXluY2VGeFY2T0VD?=
 =?utf-8?B?b1p4ejdFaXRLWTdIQkpJT2NwOGpOZ2RLaDdhOVY5YUhnNDYwRjNybDN4a0Vu?=
 =?utf-8?B?TUpRSWNQVzZ2cGtSZ3UvdHg1anRhRHpkWkxTdVpTaXdtclBYYytRK1Joa0xM?=
 =?utf-8?B?ZEdKMGRobTFUR3ZoWDRUM3I5YVFXYzRSaDQvRmd1QWlVMDVGWGNYcERLRG0v?=
 =?utf-8?B?SEJaS3NGd2dlNC90N1ZJbUJlTjlYeldYQmVCVUFwVjhPS01sY1pZRmpDSlV5?=
 =?utf-8?B?ZUx4WlZYd3J5dGtJdEVIK2FZUWFHNkxkcmR1clVOZXoyZng0VzF5Qk94T0F5?=
 =?utf-8?B?SGg0b3F0cTdPemxrcGY2REtzcW1xVWsrWE5QazlnUnFjMzNINlMya2sxaUdz?=
 =?utf-8?B?M0lkMzE3K0xUbXdZQ3RDNXlHMmRkNm5QMmlaQmo0MzdleEpBUXowMVJ4VjND?=
 =?utf-8?B?ZnpRcERSeU83dnY0T0hxUm16VmdoTzh6WE1RL1FpOWNvMGd6V3Z3ZEg1RWl1?=
 =?utf-8?B?NG9xeFVONDEvREtiSGw1RGF2eS83KzA3TDY4RTduTSsxMEN6ZHBrYkhkT21s?=
 =?utf-8?B?NGVBS3NWNEpjcXdjR0pHNnBDTFNMMkd3KzZ4STVrQnEwbmhaeWkrc1U0SEwr?=
 =?utf-8?B?RlVTa1hjMVU2N2I4U0hvdFNBaGJKWC84TGptS2Ywb1Eyd0p2VFU3OCtLMDFY?=
 =?utf-8?B?U3JjOGJVc09HNmFDRkNEVjFkQkZuVWg2TWxSR1FYb0daZzBNZWlONkkxbDF3?=
 =?utf-8?B?WUlDM1A4a0pOWUMrck54L0I3aEUzR2EvYXVNejlaRDZFN1VWallOSmNRRUdC?=
 =?utf-8?B?Ymc4cGpnVms3cXlYWVZscm9YaWpnT2tsdmJWS2hWRG5ick5oKzRPVEo3VXdw?=
 =?utf-8?B?SUU4UC9kMm9PUDhxc2Ntd2J1eHJZelJ3T2lWdUI1UlpiRWVlV2Jmd2N6b2Fw?=
 =?utf-8?Q?oz2+eRtJZektzaKNuXOfOLZfa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 197c9619-8275-4c8b-249a-08ddb3dafc7d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 11:25:28.0024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPvkLKCIIIvjwQc2hR5N3igLDF2vO9i4CWMJEVWCcxxxtBv3Xs3/3VY9l9DWpGuv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9116
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

On 25.06.25 10:42, Thomas Zimmermann wrote:
> The field import_attach of struct drm_gem_object is often only
> required by PRIME code. In other places, replace its use with
> clearer alternatives.

Reviewed-by: Christian König <christian.koenig@amd.com> for the entire series.

> 
> v2:
> - keep amdgpu_bo_print_info() as-is (Christian)
> 
> Thomas Zimmermann (2):
>   drm/amdgpu: Test for imported buffers with drm_gem_is_imported()
>   drm/amdgpu: Use dma_buf from GEM object instance
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     |  5 ++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 10 +++++-----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  6 +++---
>  6 files changed, 14 insertions(+), 15 deletions(-)
> 

