Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA08BADAB5E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 11:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF03310E2E4;
	Mon, 16 Jun 2025 09:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ieMVF6pw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC3010E2E4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 09:02:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eP0p0tDM/7X72dIQrzL5F/C1hWx4WD+FIrVpPvZhHBCjBMiqltLZ7l34i64vGzDFsvsgYAcVcka+hl1gSBtgueIpVkkr2HvgUhO/ORNMrNPi2MDiJP+MMTo58Qa1LNVc/u7/VBkS8OunNXROXeKY5EfSB2LWOitK67n1O+bvIHoKZuL/1C71lGG3MVpxH0SrK3f9TdKYMiVVxuhYP39Y30Ugwj+OX9lDXeegBaYJTtE/pdYEa0VmO6n/ICLEFtvodS8Zn8xxV1dRnOBGWFLutpckNMaRdCMeL5KAXUu07+29zVNn6O11Vam1yzNhCIgNLFdo4ZzeMJKgBHndiv5kMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Np7/9kMas/x2CSqVtvc+WOflZGuTcgaBWM6QChymGiA=;
 b=qzyLhbo5mRUQOxqv5p4gJE4lnv5BfoIm2wUfV57tqf0+x8CrCXJIOILWECXxIXb5mB4/b9zcp0kslODRnCd0QO+vlhW3lnuGlL/755sH2EblzoNeDsVHtzxfWWOwfvXTAi5o5eQhTwE4wm2fVUwFgr9kqEq5daMu7FeusYay0oXm0o38OQu1OTNjJ+U7pnrmnb2LxPTHI45ZxXSQSaKD87c65XHUFukRrAEAG9HmwwlivwEx/3B4fm81Es3nKF7oQ7mdP6aJtD4fMo/KBQaVOh75zGbpO2dv2tBVuJQK4pGQ/cEBagZeoJJwurCgUz2MeAWHEbNRij1FT6eyN/l1ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Np7/9kMas/x2CSqVtvc+WOflZGuTcgaBWM6QChymGiA=;
 b=ieMVF6pwrcTSi+0+z7ohjrChpUyGR+IwNvybZ7jelqrRVl5rXkZTq2Mn9VZzWnCcgUn+B2e98095SLkIdBT/756GCFJzWbcpy1B/FORC4gNpMtTE4dpEizYD7fSrdvL0bM+5+8QQp/omN7yV275mGa6q7qh5sDTi/3jJWjEsWxc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6183.namprd12.prod.outlook.com (2603:10b6:8:a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 09:01:59 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 16 Jun 2025
 09:01:59 +0000
Message-ID: <e53a356e-a0d2-4643-98e3-721be16277cf@amd.com>
Date: Mon, 16 Jun 2025 11:01:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/amdgpu: Adding amdgpu CRIU ioctl
To: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Cc: tvrtko.ursulin@igalia.com, Felix.Kuehling@amd.com, David.YatSin@amd.com,
 Chris.Freehill@amd.com, dcostantino@meta.com, sruffell@meta.com,
 simona@ffwll.ch, mripard@kernel.org, tzimmermann@suse.de
References: <20250613182337.3767389-1-David.Francis@amd.com>
 <20250613182337.3767389-3-David.Francis@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250613182337.3767389-3-David.Francis@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6183:EE_
X-MS-Office365-Filtering-Correlation-Id: 043aca35-bcf0-4172-d677-08ddacb473a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVBsdGpMTG9VY3pLTWlZSERiMi9sQ050aFJxc0pUS3hCeGdQbDRTbDAybDRK?=
 =?utf-8?B?amt0MStBeWliOWxMNFNFcmhSZW50a0FPNUZuWFNUd1NHdWF1NXZZR00wckVO?=
 =?utf-8?B?YW9uOWpjMlY4OGFEYm4wTDdrb3Aza0R6QTYraVFpa0ZTOUpKQTV6bmVIRk9m?=
 =?utf-8?B?NE81RE5mV0RLamlITU9XZzNVS1llZEF2VlNVMkpnY0RhdjI2eTFhdjEwdms2?=
 =?utf-8?B?bDVIRktKcksrVU1RQ0NLTkJZS1V2R01uZWd1REExNGdDL1NKQWFNelJWVDlJ?=
 =?utf-8?B?OUMzSmE3ZHF4MVUzcVhGM2c3eEczdjFTU2Y0c0VWWnQzdUhTZVlSSW5NT25T?=
 =?utf-8?B?RzJITTFvQm05RlFZRW9jZEZQUkxyckk3Q29JVDZCaGJWUkpHdjFoVDJPR1Vz?=
 =?utf-8?B?bkxNdlF2bDVoRFVZKzBqMlVpdVQ3VGdNNzdwY3pyb0hLYUc4WHNaUjB2RUlP?=
 =?utf-8?B?UEFwU21XQTRodFhUUDNxSUoxeHo2Si9hQjg2S213aENUYkQ1dUFFOWlSV1hU?=
 =?utf-8?B?N3dTSmlscmxUdS9KSTMybDBHK3NPQ0tySzUrV1NOQ0JBTCtmdmN5Z0RFSnJP?=
 =?utf-8?B?OFV6b1JKY0JuUFZzYUNSb1QrdXpOc1pRNXNRdnlXcmR3MnNwMjhEcUVHUDVF?=
 =?utf-8?B?TDNRMktaVE9nK2g5N01XZlZ6cVdMaFZUNHIxRFNBWU10WFFnVmFOY3Q4bkow?=
 =?utf-8?B?N2lsdEhiTmVZRkFhVVdaQ0NNcjBwL3NidkwyVkZJNVVOdVNONDVTMkNmNXNQ?=
 =?utf-8?B?Myt3UXQvUGk1Q2MyZzk2WFZGR0YwMUFnOXcwRnhQdzAzQmc0OTkzNWRHdGhD?=
 =?utf-8?B?SXRxS3ZpeEQxZnJRMzZEMjJ4TkVjamNrc3dqRnBuNThVQ1NMSHVGYU9qME00?=
 =?utf-8?B?MEQ5eW5mTFA4OUZENUc0SzhubkFhclVRTFlPMUtHQ3ZiT0c4VWE1YitKQzdJ?=
 =?utf-8?B?YXNPMVpBUEpaaUYvWjREazkvSkwwN1hEdUdXS3BkbGhyZTlJbzRJWlRkWVJT?=
 =?utf-8?B?Z0JkWWJ2UTRBTTNoYzgyeS9idWdqWVRKY0w3QnluZGNzMWl1dTJDYUdiYW9J?=
 =?utf-8?B?cWR3S2gyWE9adTBUZDUyMVNESkVLSEdwSWo4Y1F0RXN5MmU3bnMwdm1haVd0?=
 =?utf-8?B?N2FzOVR0SklXL1JsYWNtRGRkNHluSGUxdTdrS010ZEFVTXdOWE45R1M2R2sv?=
 =?utf-8?B?TldMaXR5TTBNcFN4WHB3TGpaWmFzM1lTUFA3a05Hamx0ZVUrbHVVQlZkemJZ?=
 =?utf-8?B?VHVpN1dWajQ5VUxWbTFoQXVBWVYzQzF6SEZGSm45ZXkwY0E2MlVXUmZGTENG?=
 =?utf-8?B?YnlLWnk5NUhFSDViYW56cndEVHZzTnNoWC9WWW9lRldsWndRMFcyeXF5RGlq?=
 =?utf-8?B?bmxlUHNZbzlDc2hWK0JSZitjNmxHcG50NzJjd0c4TURPTHc2Ujg1MG0rc09D?=
 =?utf-8?B?cjhiYVpIM0E4NnhBZW5hajdLN0pFak5VTXdSS3hKUXp4YXRsODBPcHMvQlVL?=
 =?utf-8?B?ZTI4eERnSlhsQTFmMklsWklibzFxb2RPWGVEakhZR2tCQVo4bkxtUGVMRXhn?=
 =?utf-8?B?Q1puWGczQzNQcXZqWXJtcS81Y1B4dk9ISkpXT0lPOGdGZ1hSZjFTSnB2cXlK?=
 =?utf-8?B?ME9SckNmYWZYS3h5ZXoxbDV3ckI3UnY3d2YySU80RG8xK2phM2k2WnBRRkRj?=
 =?utf-8?B?S0RKYnhXVXR5VkE0M29jWmVQQlRQdjRLcS94NWZRNzJVMkh4cUw5V01XN2J2?=
 =?utf-8?B?ZDU1ZDBadXEvejBZRThJU2xkd0orcUJlUjJVNTk0Q2FRaTV6NmZwYXl2RjJo?=
 =?utf-8?B?Q0tvcGMrMlE1QjNiOUhIVHRsTFRZVUVHWkdlL0dNZW1LZWN3V2ZQOHVYdmpt?=
 =?utf-8?B?SXUwaVQ4WisxVGdxQmlac3ZkRzhJOTg5MDIxVkhCdnQxSGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dU9JSSthUHRTM0xzVnhxMEZzR21xT3RVYXJlNG9NWW8xZlE4VUxKVkR3aFpt?=
 =?utf-8?B?L1dxakg2Vys0QngreXZPRzBnaUc1b21maStxbU5ySTdBemNuMjhXR0xEY09s?=
 =?utf-8?B?WVFSMGFTS1dqVnFNNGhocFc0dzVhcGZCbXpZRDdlV0VIM29JNFVXWHc2UXVI?=
 =?utf-8?B?WWlpbFpOK0dudVZpa0pYNVY4b2JSN2wvT203UWFyYWZ3TWFTNzZITUxiZVlR?=
 =?utf-8?B?TEpiWm9QWit1UUxBRXJlYVBoZTk3bG1nOTlKekVjWHZmanVWd2drN29Lc2VI?=
 =?utf-8?B?L2N5OTBablBIbFBPSWxQSGs0UDVXazJ6TVcyYUYyNC9OcTdWTmI4VzNxUHVz?=
 =?utf-8?B?TnVyU1p6dVhFQXR2MmZPRHQ4UTRwS2lhQktBaXZiazdtSTBENVh3a05wcUNx?=
 =?utf-8?B?TDZST2NPeDYrQUJZNFhJVXFSR1k3bDd4aUNOSEsxU0gwZzcrbkc3RVFZSXA0?=
 =?utf-8?B?aFN1WVY4bnhsRzZzazZJeVNHbWxJQTU3OTM2aHpEaHZQMzBkalFWaEMrZGxP?=
 =?utf-8?B?SlpDeUhlL2NScm1PdFdWQlFZTjRvRE1oVldFa2FWamRVNlIzaDFzK3NXNnQz?=
 =?utf-8?B?TlZOVmxWK2VQUis0RU5QWHRnRFFtZWZwS3I2cER4dnkxNnd3L2FndllOUVVT?=
 =?utf-8?B?ZjlnSXpRZi9wZG02aktydFFBLzFqQXdtRm9iS2ZiNGxDRXoxN3JDbXJxUmRF?=
 =?utf-8?B?TTVCa0NuZG1OcUk5R203UkdndVNTd0ZEdDJZd00vTHhLM2hQSkdtQkRQMzlX?=
 =?utf-8?B?WFVhQ1VlclV0ck5MWDRjTnBKbDVHWndtSFg1S0R1bVJxQTJCVkJCYVphK3RM?=
 =?utf-8?B?bU0rcWNBTWZiYUllYjFtQ29rdlFtQVRPc3NxOVpJb2wvV1NiRmN2MmdXYS9z?=
 =?utf-8?B?eVBwTjZLemRGMURHZTcya0g1eHM3TTYvR0ZOaWloMURzOGgvZk5wNjdtQlM0?=
 =?utf-8?B?cmZtc1FRbkdFOWxLL2J2RmhNUjAzakU0SXgvMmVvWW1jb0tpb0trSkVJNlEy?=
 =?utf-8?B?bWhhcmpDOEVVNzdDeTIzNXVXYmlndmh2dGhRYk95NVoweEdpMVpQa0thamdm?=
 =?utf-8?B?S2w1OE1KWm83UnlQNXhxL1Y3YnJvMjFja2lETEZSRXNaRFpyY1d5ay8rRmhs?=
 =?utf-8?B?a2FxWGJ4MDFPZDVqQ2wyenE0ZUVFajZpMkIrdjVjVmhXbHdpMHE1c3RqbUdn?=
 =?utf-8?B?VXZHMFBwUXlLOU1rSnNneWZwRC9YeURaQ0VGY2Jtd2dZR0x0MUJRQ21rSmhF?=
 =?utf-8?B?Z0VPRkltN2lZWHFUQmN2YlJQMVdrcXN3b1E4bGZidHlwZFR5STZBZE9QT1JQ?=
 =?utf-8?B?bWRRWVNpYTIxVlYwY2xDRGtub1lMRkZUYTZBV24rVHpGNWNWcHFmT2s4ZlhP?=
 =?utf-8?B?cUg0ZTd6RksxSXhHcURnUXBLWHBJRExiTm9IZ3FTc2EvZkhEZU0rRDRJRXVI?=
 =?utf-8?B?eTR1Wkh6Uy9qTVZwSFRTRjFldzZPVi91TUxtWWtvL2ppUkF2VHkrSFNXWnVS?=
 =?utf-8?B?ZkI2T2hsREIySTVBU0FXNmlzdSt5bnhNUnFxdjNVMTNiTXFLZGRTNlYyQ2J3?=
 =?utf-8?B?YjFEQzJvYWdlbTlzTm1qb1BYeENSZ3Axakl2TzVFWVdwKzFpRXhvekxsTll4?=
 =?utf-8?B?Tkd5S2tWZHZCU2Y5SnZtVGxjTndwVUtDblY5ZlFrck9IS0VBZGtsMjZsM05u?=
 =?utf-8?B?TmVKazVBOFZVcGJmVDNabm9qSElGTkp3ckluc2pnTDlPTEpLdnlOR2RIM3NM?=
 =?utf-8?B?aVBVa2tIaEJ0K0poVWJhOFE5ZUdHRkdVV2h4a0FMaGJoeUlpWUFabFZRYjZo?=
 =?utf-8?B?L3o5TzR4bVNOZUR2Q3lGWTBFalpNODBVRmZCY1FDMXZ0bVppVHhOZURTdXIr?=
 =?utf-8?B?WG94dUdVZW5IaHRSOTZtSGhUZG9NWHFCZXowU2duelYvcFJUQS83QXdqVTdN?=
 =?utf-8?B?bGhBYkdJb1pUcjBYbnpvWkpCUEhBVmxBQkR0ZDM0Ym1ueGlNbHJLMXZYMFo5?=
 =?utf-8?B?NDNmN0R6c0Fsam1MOHhpS2hHS1RiV2JBTkpzSHUxTjA4blIrYnYxSFIrMk01?=
 =?utf-8?B?bHpKSHM2QjZXcFRiYTFOKzV6Szcrb0JUUy9NRXZCaHN5V3lqanlnQ0YrL1o1?=
 =?utf-8?Q?garzIZDsXBcrvu59ghs6xvvg5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 043aca35-bcf0-4172-d677-08ddacb473a3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 09:01:59.2551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e10NY0TmK2hUDEyq4qSwM3x2rKGl5U/bOAidllxptRAdXTt1D85ErgK4ujQqYTlb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6183
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

On 6/13/25 20:23, David Francis wrote:
> amdgpu CRIU requires an amdgpu CRIU ioctl. This ioctl
> has a similar interface to the amdkfd CRIU ioctl.
> 
> The objects that can be checkpointed and restored are bos and vm
> mappings. Because a single amdgpu bo can have multiple mappings.
> the mappings are recorded separately.
> 
> The ioctl has two modes: PROCESS_INFO, which sends to the user
> how many bos and vms to expect, and CHECKPOINT, which copies
> data about bos and vms into user-provided buffers.
> 
> Restore is handled using existing amdgpu and drm ioctls.
> 
> The new ioctl lives in a new file amdgpu_criu.c with its own
> header amdgpu_criu.h
> 
> Signed-off-by: David Francis <David.Francis@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/Makefile      |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c | 234 +++++++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h |  34 ++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   3 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   |  11 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h   |  10 +
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |   2 +
>  include/uapi/drm/amdgpu_drm.h            |  62 ++++++
>  8 files changed, 357 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
> index 87080c06e5fc..0863edcdd03f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -63,7 +63,7 @@ amdgpu-y += amdgpu_device.o amdgpu_doorbell_mgr.o amdgpu_kms.o \
>  	amdgpu_xgmi.o amdgpu_csa.o amdgpu_ras.o amdgpu_vm_cpu.o \
>  	amdgpu_vm_sdma.o amdgpu_discovery.o amdgpu_ras_eeprom.o amdgpu_nbio.o \
>  	amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
> -	amdgpu_fw_attestation.o amdgpu_securedisplay.o \
> +	amdgpu_fw_attestation.o amdgpu_securedisplay.o amdgpu_criu.o \
>  	amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
>  	amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o amdgpu_dev_coredump.o \
>  	amdgpu_cper.o amdgpu_userq_fence.o amdgpu_eviction_fence.o
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
> new file mode 100644
> index 000000000000..8141ab09698c
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
> @@ -0,0 +1,234 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> +* Copyright 2025 Advanced Micro Devices, Inc.
> +*
> +* Permission is hereby granted, free of charge, to any person obtaining a
> +* copy of this software and associated documentation files (the "Software"),
> +* to deal in the Software without restriction, including without limitation
> +* the rights to use, copy, modify, merge, publish, distribute, sublicense,
> +* and/or sell copies of the Software, and to permit persons to whom the
> +* Software is furnished to do so, subject to the following conditions:
> +*
> +* The above copyright notice and this permission notice shall be included in
> +* all copies or substantial portions of the Software.
> +*
> +* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> +* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> +* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> +* THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> +* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> +* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> +* OTHER DEALINGS IN THE SOFTWARE.
> +*/
> +
> +#include <linux/dma-buf.h>
> +#include <linux/hashtable.h>
> +#include <linux/mutex.h>
> +#include <linux/random.h>
> +
> +#include <drm/amdgpu_drm.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_file.h>
> +
> +#include "amdgpu_criu.h"
> +
> +#include <drm/amdgpu_drm.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_exec.h>
> +#include <drm/drm_gem_ttm_helper.h>
> +#include <drm/ttm/ttm_tt.h>
> +#include <linux/interval_tree_generic.h>
> +
> +#include "amdgpu.h"
> +#include "amdgpu_display.h"
> +#include "amdgpu_dma_buf.h"
> +#include "amdgpu_hmm.h"
> +#include "amdgpu_xgmi.h"
> +
> +static uint32_t hardware_flags_to_uapi_flags(struct amdgpu_device *adev, uint64_t pte_flags)
> +{
> +	uint32_t gem_flags = 0;
> +
> +	//This function will be replaced by the mapping flags rework
> +
> +	if (pte_flags & AMDGPU_PTE_EXECUTABLE)
> +		gem_flags |= AMDGPU_VM_PAGE_EXECUTABLE;
> +	if (pte_flags & AMDGPU_PTE_READABLE)
> +		gem_flags |= AMDGPU_VM_PAGE_READABLE;
> +	if (pte_flags & AMDGPU_PTE_WRITEABLE)
> +		gem_flags |= AMDGPU_VM_PAGE_WRITEABLE;
> +	if (pte_flags & AMDGPU_PTE_PRT_FLAG(adev))
> +		gem_flags |= AMDGPU_VM_PAGE_PRT;
> +	if (pte_flags & AMDGPU_PTE_NOALLOC)
> +		gem_flags |= AMDGPU_VM_PAGE_NOALLOC;
> +
> +	return gem_flags;
> +}
> +
> +
> +/**
> + * amdgpu_criu_bo_info_ioctl - get information about a process' buffer objects
> + *
> + * @dev: drm device pointer
> + * @data: drm_amdgpu_criu_bo_info_args
> + * @filp: drm file pointer
> + *
> + * num_bos is set as an input to the size of the bo_buckets array.
> + * num_bos is sent back as output as the number of bos in the process.
> + * If that number is larger than the size of the array, the ioctl must
> + * be retried.
> + *
> + * Returns:
> + * 0 for success, -errno for errors.
> + */
> +int amdgpu_criu_bo_info_ioctl(struct drm_device *dev, void *data,
> +			    struct drm_file *filp)
> +{
> +	struct drm_amdgpu_criu_bo_info_args *args = data;
> +	struct drm_amdgpu_criu_bo_bucket *bo_buckets;
> +	struct drm_gem_object *gobj;
> +	int id, ret = 0;
> +	int bo_index = 0;
> +	int num_bos = 0;
> +
> +	spin_lock(&filp->table_lock);
> +	idr_for_each_entry(&filp->object_idr, gobj, id)
> +		num_bos += 1;
> +	spin_unlock(&filp->table_lock);
> +
> +	if (args->num_bos < num_bos) {
> +		args->num_bos = num_bos;
> +		goto exit;
> +	}
> +	args->num_bos = num_bos;
> +	if (num_bos == 0) {
> +		goto exit;
> +	}
> +
> +	bo_buckets = kvzalloc(num_bos * sizeof(*bo_buckets), GFP_KERNEL);
> +	if (!bo_buckets) {
> +		ret = -ENOMEM;
> +		goto free_buckets;
> +	}
> +
> +	spin_lock(&filp->table_lock);
> +	idr_for_each_entry(&filp->object_idr, gobj, id) {
> +		struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
> +		struct drm_amdgpu_criu_bo_bucket *bo_bucket;
> +
> +		bo_bucket = &bo_buckets[bo_index];
> +
> +		bo_bucket->size = amdgpu_bo_size(bo);
> +		bo_bucket->offset = amdgpu_bo_mmap_offset(bo);

Not all BOs have a MMAP offset. Additional to that we already have an IOCTL to query the mmap offset which does the appropriate checks and doesn't potentially crash when there is none.

> +		bo_bucket->alloc_flags = bo->flags & (~AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE);
> +		bo_bucket->preferred_domains = bo->preferred_domains;
> +		bo_bucket->gem_handle = id;
> +
> +		if (bo->tbo.base.import_attach)
> +			bo_bucket->flags |= AMDGPU_CRIU_BO_FLAG_IS_IMPORT;
> +
> +		bo_index += 1;
> +	}
> +	spin_unlock(&filp->table_lock);
> +
> +	ret = copy_to_user((void __user *)args->bo_buckets, bo_buckets, num_bos * sizeof(*bo_buckets));
> +	if (ret) {
> +		pr_debug("Failed to copy BO information to user\n");
> +		ret = -EFAULT;
> +	}
> +
> +free_buckets:
> +	kvfree(bo_buckets);
> +exit:
> +
> +	return ret;
> +}
> +
> +/**
> + * amdgpu_criu_bo_info_ioctl - get information about a process' buffer objects
> + *
> + * @dev: drm device pointer
> + * @data: drm_amdgpu_criu_mapping_info_args
> + * @filp: drm file pointer
> + *
> + * num_mappings is set as an input to the size of the vm_buckets array.
> + * num_mappings is sent back as output as the number of mappings the bo has.
> + * If that number is larger than the size of the array, the ioctl must
> + * be retried.
> + *
> + * Returns:
> + * 0 for success, -errno for errors.
> + */
> +int amdgpu_criu_mapping_info_ioctl(struct drm_device *dev, void *data,
> +			    struct drm_file *filp)

Please split adding that into a separate patch.



> +{
> +	struct drm_amdgpu_criu_mapping_info_args *args = data;
> +	struct drm_gem_object *gobj = idr_find(&filp->object_idr, args->gem_handle);
> +	struct amdgpu_vm *avm = &((struct amdgpu_fpriv *)filp->driver_priv)->vm;
> +	struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
> +	struct amdgpu_bo_va *bo_va = amdgpu_vm_bo_find(avm, bo);
> +	struct amdgpu_fpriv *fpriv = filp->driver_priv;
> +	struct drm_amdgpu_criu_vm_bucket *vm_buckets;
> +	struct amdgpu_bo_va_mapping *mapping;
> +	struct drm_exec exec;

> +	int vm_index = 0;

That needs a better name.

> +	int ret = 0;

Don't initialize return variables if you don't need it. That is very bad practice.

> +
> +	vm_buckets = kvzalloc(args->num_mappings * sizeof(*vm_buckets), GFP_KERNEL);
> +	if (!vm_buckets) {
> +		ret = -ENOMEM;
> +		goto free_vms;
> +	}
> +
> +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
> +		      DRM_EXEC_IGNORE_DUPLICATES, 0);
> +	drm_exec_until_all_locked(&exec) {
> +		if (gobj) {
> +			ret = drm_exec_lock_obj(&exec, gobj);
> +			drm_exec_retry_on_contention(&exec);
> +			if (ret)
> +				goto unlock_exec;
> +		}
> +
> +		ret = amdgpu_vm_lock_pd(&fpriv->vm, &exec, 2);
> +		drm_exec_retry_on_contention(&exec);
> +		if (ret)
> +			goto unlock_exec;
> +	}
> +


> +	amdgpu_vm_it_for_each_entry(avm, mapping, 0, U64_MAX) {
> +		if (mapping->bo_va == bo_va) {
> +			if (vm_index < args->num_mappings) {
> +				vm_buckets[vm_index].start = mapping->start;
> +				vm_buckets[vm_index].last = mapping->last;
> +				vm_buckets[vm_index].offset = mapping->offset;
> +				vm_buckets[vm_index].flags = hardware_flags_to_uapi_flags(drm_to_adev(dev), mapping->flags);
> +			}
> +			vm_index += 1;
> +		}
> +	}

This chunk should go into amdgpu_vm.c And I strongly suggest to not go over the mapping rb tree but rather the list in the bo_va.

Regards,
Christian.

> +
> +	drm_exec_fini(&exec);
> +
> +	if (vm_index > 0) {
> +		if (vm_index <= args->num_mappings) {
> +			ret = copy_to_user((void __user *)args->vm_buckets, vm_buckets, vm_index * sizeof(*vm_buckets));
> +			if (ret) {
> +				pr_debug("Failed to copy BO information to user\n");
> +				ret = -EFAULT;
> +			}
> +		}
> +	}
> +	args->num_mappings = vm_index;
> +
> +
> +	kvfree(vm_buckets);
> +
> +	return ret;
> +unlock_exec:
> +	drm_exec_fini(&exec);
> +free_vms:
> +	kvfree(vm_buckets);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
> new file mode 100644
> index 000000000000..9c196973ed0f
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> +* Copyright 2025 Advanced Micro Devices, Inc.
> +*
> +* Permission is hereby granted, free of charge, to any person obtaining a
> +* copy of this software and associated documentation files (the "Software"),
> +* to deal in the Software without restriction, including without limitation
> +* the rights to use, copy, modify, merge, publish, distribute, sublicense,
> +* and/or sell copies of the Software, and to permit persons to whom the
> +* Software is furnished to do so, subject to the following conditions:
> +*
> +* The above copyright notice and this permission notice shall be included in
> +* all copies or substantial portions of the Software.
> +*
> +* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> +* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> +* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> +* THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> +* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> +* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> +* OTHER DEALINGS IN THE SOFTWARE.
> +*/
> +
> +#ifndef __AMDGPU_CRIU_H__
> +#define __AMDGPU_CRIU_H__
> +
> +#include <drm/amdgpu_drm.h>
> +
> +int amdgpu_criu_bo_info_ioctl(struct drm_device *dev, void *data,
> +			    struct drm_file *filp);
> +int amdgpu_criu_mapping_info_ioctl(struct drm_device *dev, void *data,
> +			    struct drm_file *filp);
> +
> +#endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 4db92e0a60da..5f3de93a665d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -53,6 +53,7 @@
>  #include "amdgpu_xgmi.h"
>  #include "amdgpu_userq.h"
>  #include "amdgpu_userq_fence.h"
> +#include "amdgpu_criu.h"
>  #include "../amdxcp/amdgpu_xcp_drv.h"
>  
>  /*
> @@ -3021,6 +3022,8 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
>  	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ, amdgpu_userq_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_SIGNAL, amdgpu_userq_signal_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_WAIT, amdgpu_userq_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_BO_INFO, amdgpu_criu_bo_info_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_MAPPING_INFO, amdgpu_criu_mapping_info_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>  };
>  
>  static const struct drm_driver amdgpu_kms_driver = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 3911c78f8282..f803908cf46d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -3156,3 +3156,14 @@ bool amdgpu_vm_is_bo_always_valid(struct amdgpu_vm *vm, struct amdgpu_bo *bo)
>  {
>  	return bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv;
>  }
> +
> +
> +struct amdgpu_bo_va_mapping *amdgpu_vm_it_first_mapping_in_range(struct amdgpu_vm *avm, uint64_t start, uint64_t end)
> +{
> +	return amdgpu_vm_it_iter_first(&avm->va, start, end);
> +}
> +
> +struct amdgpu_bo_va_mapping *amdgpu_vm_it_next_mapping_in_range(struct amdgpu_bo_va_mapping *mapping, uint64_t start, uint64_t end)
> +{
> +	return amdgpu_vm_it_iter_next(mapping, start, end);
> +}
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index f3ad687125ad..cd7d3940cc7a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -668,4 +668,14 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_device *adev,
>  				 struct amdgpu_vm *vm,
>  				 struct dma_fence **fence);
>  
> +struct amdgpu_bo_va_mapping *amdgpu_vm_it_first_mapping_in_range(
> +	struct amdgpu_vm *avm, uint64_t start, uint64_t end);
> +struct amdgpu_bo_va_mapping *amdgpu_vm_it_next_mapping_in_range(
> +	struct amdgpu_bo_va_mapping *mapping, uint64_t start, uint64_t end);
> +
> +#define amdgpu_vm_it_for_each_entry(avm, mapping, start, end) \
> +	for (mapping = amdgpu_vm_it_first_mapping_in_range(avm, start, end); \
> +		mapping; \
> +		mapping = amdgpu_vm_it_next_mapping_in_range(mapping, start, end))
> +
>  #endif
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index a2149afa5803..a8cf2d4580cc 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -45,6 +45,8 @@
>  #include "amdgpu_dma_buf.h"
>  #include "kfd_debug.h"
>  
> +#include "amdgpu_criu.h"
> +
>  static long kfd_ioctl(struct file *, unsigned int, unsigned long);
>  static int kfd_open(struct inode *, struct file *);
>  static int kfd_release(struct inode *, struct file *);
> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
> index 45c4fa13499c..16aee825e116 100644
> --- a/include/uapi/drm/amdgpu_drm.h
> +++ b/include/uapi/drm/amdgpu_drm.h
> @@ -57,6 +57,10 @@ extern "C" {
>  #define DRM_AMDGPU_USERQ		0x16
>  #define DRM_AMDGPU_USERQ_SIGNAL		0x17
>  #define DRM_AMDGPU_USERQ_WAIT		0x18
> +#define DRM_AMDGPU_CRIU_OP		0x19
> +
> +#define DRM_AMDGPU_CRIU_BO_INFO	0x20
> +#define DRM_AMDGPU_CRIU_MAPPING_INFO	0x21
>  
>  #define DRM_IOCTL_AMDGPU_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
>  #define DRM_IOCTL_AMDGPU_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
> @@ -77,6 +81,10 @@ extern "C" {
>  #define DRM_IOCTL_AMDGPU_USERQ		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
>  #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
>  #define DRM_IOCTL_AMDGPU_USERQ_WAIT	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
> +#define DRM_IOCTL_AMDGPU_CRIU_OP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_CRIU_OP, struct drm_amdgpu_criu_args)
> +
> +#define DRM_IOCTL_AMDGPU_CRIU_BO_INFO	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_CRIU_BO_INFO, struct drm_amdgpu_criu_bo_info_args)
> +#define DRM_IOCTL_AMDGPU_CRIU_MAPPING_INFO	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_CRIU_MAPPING_INFO, struct drm_amdgpu_criu_mapping_info_args)
>  
>  /**
>   * DOC: memory domains
> @@ -1626,6 +1634,60 @@ struct drm_color_ctm_3x4 {
>  	__u64 matrix[12];
>  };
>  
> +#define AMDGPU_CRIU_BO_FLAG_IS_IMPORT	(1 << 0)
> +
> +struct drm_amdgpu_criu_bo_info_args {
> +    /* IN: Size of bo_buckets buffer. OUT: Number of bos in process (if larger than size of buffer, must retry) */
> +    __u32   num_bos;
> +
> +    /* User pointer to array of drm_amdgpu_criu_bo_bucket */
> +    __u64   bo_buckets;
> +};
> +
> +struct drm_amdgpu_criu_bo_bucket {
> +    /* Size of bo */
> +    __u64 size;
> +
> +    /* Offset of bo in device file */
> +    __u64 offset;
> +
> +    /* GEM_CREATE flags for re-creation of buffer */
> +    __u64 alloc_flags;
> +
> +    /* Pending how to handle this; provides information needed to remake the buffer on restore */
> +    __u32 preferred_domains;
> +
> +    /* Currently just one flag: IS_IMPORT */
> +    __u32 flags;
> +
> +    __u32 gem_handle;
> +};
> +
> +struct drm_amdgpu_criu_mapping_info_args {
> +    /* Handle of bo to get mappings of */
> +    __u32   gem_handle;
> +
> +    /* IN: Size of vm_buckets buffer. OUT: Number of bos in process (if larger than size of buffer, must retry) */
> +    __u32   num_mappings;
> +
> +    /* User pointer to array of drm_amdgpu_criu_vm_bucket */
> +    __u64   vm_buckets;
> +};
> +
> +struct drm_amdgpu_criu_vm_bucket {
> +    /* Start of mapping (in number of pages) */
> +    __u64 start;
> +
> +    /* End of mapping (in number of pages) */
> +    __u64 last;
> +
> +    /* Mapping offset */
> +    __u64 offset;
> +
> +    /* flags needed to recreate mapping; still pending how to get these */
> +    __u64 flags;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif

