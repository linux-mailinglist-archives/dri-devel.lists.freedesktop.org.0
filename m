Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3668CB061B
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 16:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1317510E1E4;
	Tue,  9 Dec 2025 15:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZwU8H61D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012023.outbound.protection.outlook.com
 [40.93.195.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2574F10E1E4;
 Tue,  9 Dec 2025 15:18:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LdfTcKk5roAAkuP1zFfwtUX3DJQ6E3XFfRaKNuDNPugVBmOztLNooyWx+0cmfAzS6qZdErfUz8Fq31GIX4BbGT+HADfanj0galiBkw3c8mnCEx7qaUrhxcvFg41cZ9NIOByJAHCJnkLPJgGagrNRAghauGtB8jrK+TKvxj7bjtjjdZQ2yeMLNJIkpHVAbDdm/0Jq9kVDFG/PP0fAIsShhGjR8FFs3lhfnHd1HVJacJXgRJ0TwNAlrriV9HQS20Ycd0ze/1n6WaLAfE0Zc6beeImdNH+WeykeNNTHLduz/JyE1ZAgou6MKogfQ1F3feksgf/tDbVgNNq/4sTYK/GyuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1aJvWFMxq+rFCOsYgLYCVpkzMznK0P6woBEpRuixvCk=;
 b=DIxMer7mSIrMGKKqTsH6nqLqDhMCtskvJLDwZpFIOP3fqfauh1T31gNvACxH5wYubEhsvGoSIaVZfSRmJ7cwYln1BoGWIqyIISzlfOgqOiQsUQDsubcVtNUGSwjqpEJEs1rI2wlEBwcl2MtoAioXxkidcLmyPlLjIJuXXYxF3zlMyKyn4U5EDP977bbDgJJJxOmnrSHD4wniO2jgZ5nOEsFcN/LdDdo3YT1xlndCOH7mkkSqNPHxb10oLyFiMmvagT99nv/29W0anmYd+D0EHnwQJi6ECFHZe7XStN+ZDy1sdTwpo0OkUm6q1FK5CYsUoSCkGd6JIiVUA96EEGIXYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1aJvWFMxq+rFCOsYgLYCVpkzMznK0P6woBEpRuixvCk=;
 b=ZwU8H61D/xXAhKJMbfeBAZOhZcdjkrjD3wclAfnm+eI03wKA28KtYOPFc6FPOksVglwdTYREB+1gondwZFW7QOU8WplIA1lZeTss3wAITSPtHECe9jUm7yZuw+jSk4t9BHD32Bb0mfaCRg0xK2E8x8YyASMJhJ+Aq9Kjt+xk+Po=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 by SA3PR12MB8046.namprd12.prod.outlook.com (2603:10b6:806:304::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 15:18:25 +0000
Received: from BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe]) by BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe%4]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 15:18:25 +0000
Message-ID: <4f02daf8-1bd2-4105-b270-0aed496501cb@amd.com>
Date: Tue, 9 Dec 2025 10:18:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: use DCN10 CM helper for plane shaper
 func translation in DCN32
To: Melissa Wen <mwen@igalia.com>, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20251126005608.37513-1-mwen@igalia.com>
 <2a918940-700d-4b24-90ae-4d9d4f9b457d@amd.com>
 <f832ec8c-cce1-45e0-975b-ed7000bed891@igalia.com>
 <2ddb06d0-70e5-4a1f-850d-3753f9fb3d0a@amd.com>
 <7ad74d3d-5a63-462b-8243-f8f26441b04b@igalia.com>
 <b0288d0f-fcd9-4ae6-817f-5a927b9164e5@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <b0288d0f-fcd9-4ae6-817f-5a927b9164e5@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0105.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::22) To BL1PR12MB5126.namprd12.prod.outlook.com
 (2603:10b6:208:312::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:EE_|SA3PR12MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c678592-2359-4b20-b25d-08de373632e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnZiaHhIaFJMV01TSGRvaEdTc1N0V0VPTFl3RDJ2TkhjSlNKNmZHR2dyZ3pQ?=
 =?utf-8?B?NU5jQUprRUFzc1dybWRJSlMySTFIZmd4QnkxSFJQUG9nYVI4QjJwd1lYU3pE?=
 =?utf-8?B?Mnp6ditvcFROcFNlMHl0d2lpV2paTFdkYkJ2cDkxS0NyYmh1YTRtaHVMVzZt?=
 =?utf-8?B?MTlZdEYxNDR4amRoYnhkT25yelRyQS9DcTQ4cmR3RHMzS1k0d3c2RlNLdUtQ?=
 =?utf-8?B?OGNVVmZsYzB3eUVFcHRDT08xVkdZRDhscHFsQ0V1SGJ6enJaVzdSUTNuMlhm?=
 =?utf-8?B?R1loVW1GQ3paSnpoMkNPKzJZY09DOVRYVVljQ3dvR3hoMkl4WEdpNjNQaTFO?=
 =?utf-8?B?TjI2ZlkrZHlNR0tsOEx1V3MveHpNODVYaFIwbldIREZiOUFYWlJyOUZlYUpr?=
 =?utf-8?B?MkNDemlheVl3WkdtQ29XSDkxTWM5UDZpdWI4Tm9zNWtxUDRtNFZsUmVMZjZG?=
 =?utf-8?B?RWo5RXJSd2hDM0FzVk41cjRNK0d3cUpodWdQS1FaRXllNmZDMldtS3h5UGhB?=
 =?utf-8?B?QXkyblVTc1EwMmJFWk80MmllRi9sV29ZbG8ranp3c3V3R3UvRjJZbUkvbjFt?=
 =?utf-8?B?MlFlOGJ3aUhDK3ZHZS92K0NYUUxtb0Q2cHVCREZocDNQMlVScEVROWNPNE9V?=
 =?utf-8?B?d2s3RjF0bVJYKytzWEZoekRFbkhGL0FhUzRCaHRId0o3VTNKeW9kNlFxM3Ax?=
 =?utf-8?B?SWtqRFBNREZWZ1JmbmlmaVF1d2o4ZlVqY05JakgxTnVDRVJqaHhMNWNqTVM5?=
 =?utf-8?B?LzFJOW00ekwrUUFmZWtTZFVvdDUzNzZkUG5KWkZteDl1R1pxQmtKUi9tdldC?=
 =?utf-8?B?MW5kWDNnMGE3RVdYS1NaYnJ4eUdOdWUydmcrRWJsOVd2c2UrNnJkbmNTcjlR?=
 =?utf-8?B?WjhpR1l4WCtibm9qVDBhazNCdE5uM1lnd2QrdXBuV0NNUmFUQ3k1NFFCaWIr?=
 =?utf-8?B?VkFFaEcrQUJVa3Z1dzVVOWJDL240TlZORjFRWjlTTnpaVk96djg0K3gyOTlI?=
 =?utf-8?B?MUpBYkp4ODZCclJzbFNNVEtCMnFlZVdvVXZRcDRyUzJiMjlVajZid2U5cWgv?=
 =?utf-8?B?TmxWQzVCakYvUDVYRjczK3RuRHBHT0lrRU1sc1ByVC9ablBvN3BXWUZFdWcw?=
 =?utf-8?B?azdzSjZCemNLN0pRODBLWXpYTlByVmtxa0dpZFdLbHBJdll6WGtYTUhVKzI4?=
 =?utf-8?B?OVFBWm42bmhuRTlXY0JxSjZ6OE8zb1dQczJMcWtPVHNIWWtSSDFxRVdxdGZ1?=
 =?utf-8?B?aUhxVFVaWUlnaGdHRTdzaFFsc1hPcXNmNjNDZHlaaitHTkVpNkU3NjJvRFRu?=
 =?utf-8?B?clBFRG9BYjhlY2FoN3dleGZwRUpiUEFuYjA4d2FNUnRQTzNidnM1aXRCTUJx?=
 =?utf-8?B?dU5LRFliNzZSMkpWZjJUOGJFc3RuZUVoV3BKZjlGRTNySk9IRXhqNSsyWktO?=
 =?utf-8?B?NVBSanFWMmd0ZW1iTk9kV3c0bllBaG02VVRZeHFacmIvR3lkSnJmbEhsRzdr?=
 =?utf-8?B?TjlsOFc3L0pBMFFiUFBIUlA3MkwyRFAvK3Q0SG01UDdDV2t6MXU4UTMvS29N?=
 =?utf-8?B?eG5PREl5Q0E4Q0p4aFZZS0ZOMGZVM2NVRHY0bFlIODJhcGp2TTA4UmNVRzYw?=
 =?utf-8?B?ck12MGtoajBUc1FnbFZJeDdyWTJ1alVnVCs1V2dEbXVPVHM0WUh2dXM3Ui9F?=
 =?utf-8?B?MjYwUWxtYnNXVGZKY1ZFQmg0VS83MFpxMnA5dzhRMXNnc1JnSlROWE1WZ0FN?=
 =?utf-8?B?QzlSTWhWUC9wQTVwcnRKaGdLV0tYcmNZM0VqaXByVkJaeW81NVc1ajlXZ2Zm?=
 =?utf-8?B?YzhGTHFBcnJWaUZncUZjK0MwcFIzT2tzNmsyMTFjNzR0SXgydGdjakt2d215?=
 =?utf-8?B?cCtKaWsvWmEzV1VwbVIyb0F0SUdJb09yWU9NWFdBUlliVFpKTG1vblFKTzVr?=
 =?utf-8?Q?BuQCXEN3m4bhDFTHVr5oud751L7BbkVC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1VjY2RoT01iWG9sVWZQZGFQLzJDWlJ4RGpQdmVHZWlqcDZ0QXhrMTNOV1RC?=
 =?utf-8?B?U3BYWUMzaGZRRjVPV3BDTThEY0xscnNhaFRQQjRDTCtkZEhyaFVta2lNZURS?=
 =?utf-8?B?d0l1TTRWVUNOQ3F4QjVZOFIwTzF0NnRHZk1jWlBRNC84OUFXZ1VjclZUYTFZ?=
 =?utf-8?B?QUdxSkpGTE5PSDNra3N1cytaRXQ0d2V4K0VydU9nRkpEb0NoREV6cGUzcnNt?=
 =?utf-8?B?R3o5dTUvOTRNenk5OFVNbU1aNk56QVpCYkNrWEhiQVl5TEYvY0EycitJczNa?=
 =?utf-8?B?TkRFZFZEaklDWFpGL3hEWFphUU4vR1F2ODhPUU9kNnQ1YlI4a2kvSWw3WU1I?=
 =?utf-8?B?YnFoNkNyWng0M080MDBRRk9CUUx2TEhiZldkTU5JbEZhcklNc05kNjZzbFdQ?=
 =?utf-8?B?TGlDNVR0ai9DcHBxcEF4MmJXQTF2ZUlYSHFaMUFYeUQzTFJVVHJzaEFVMnRy?=
 =?utf-8?B?RVZ6T3dUTm93ZUYwNytxSERuOUkyWFZkZ2I5cVZzQXpHODZxbHdvRGhqWGMx?=
 =?utf-8?B?S25DTnFvVkxZSUtZbDFZZHhOV0VhWFFzMGZraWpTQ3MwWWJvTkZNRk9SK215?=
 =?utf-8?B?SWppeE8wTDYrUURwZEc3S3lDMzdNMWdjMXpQaGdNM2pnZFJoejlWR1pjOWdC?=
 =?utf-8?B?TnFhd1B1WU1TYkNzbEQzdDEzUmRsYUxJUk9WQzBVUitmMElESUZKTWZzSjh0?=
 =?utf-8?B?c0wzdEJub3JsNkorbGFYcklXSVhDVCtsbEFOcnEzV3FYcWI2dWVWRUtLcEla?=
 =?utf-8?B?MEdSZGdCZmx1WW43T2NabkN3b0prcTBET0ZTczhLRXhLZWE4OVZzWW5kalRI?=
 =?utf-8?B?MkJXRkh6Znp3NzUvOTRTQ04zVmt6bitmYk9ycmNYVFg4WEx2SFJYWi8yYnk4?=
 =?utf-8?B?b3FJNjdJMmhKWjd5eVRXYXpuSHB2U01kaDVFTWFSUk04YjYzWGZ0UUlJbGZD?=
 =?utf-8?B?VHU4d3NabnBGSjBHNjhYczdnTFowdDdVMmVUbmpFV1hodjdDdkZyVlJrU0tT?=
 =?utf-8?B?Z2d5RHF3Y2lrWnlZdkR5cWF0ZUErM3V5U0IvaDJwYXBCSDNWQkZJRXB2MzhP?=
 =?utf-8?B?ZTlmUDYyQWFFenJPS3JUYjl6RlJpc05ZOXF3dk9nTnhMZFkzUXE4R01Rb3VQ?=
 =?utf-8?B?ZTFxclQ1WkZXd29DWDk0UFYvMFRKTmEyTm1NNFNZMlBnK0syaHJ3dHhWd0xQ?=
 =?utf-8?B?L1pnem5hbERuOXZpZTdPOWpuMWp1QXYvYVdHcDJJcEgvemRhMU5yOVNaell0?=
 =?utf-8?B?b0ZLdlJPU3hxTm1pZlVucmh2TFdBUWE0MVZMUk94ZEVkUlltSWNnZlBqNHp2?=
 =?utf-8?B?TE9VMGlrSTh6UmxuaGFZVUx6Ykl0akREeUpkaEJlRUhUKzJZSlY5WXVoM05u?=
 =?utf-8?B?eENIUVJHYS9nbDRNY3loaHV2SXBLT29vZGVCa2JNUU1Ed09jN202WkVZejRI?=
 =?utf-8?B?YTUwdzVzeFJDTHhJMFZFYzlBTkE0QVYzck4vKzBjcC9ZQ3NwUGVpVXJUTlJK?=
 =?utf-8?B?MmVocGNGb2VOa05WUXlkcm1La1dEZE1aYlBWb2Z1VDl1Z3dQaXJRcU1seUNv?=
 =?utf-8?B?alFrOGR1c2dyblAydmMrSVpSb2svSW5SWUlmU0FoODZWcFM4UWtJUjJHWXVC?=
 =?utf-8?B?WUwvYlhGdTVncVE1TndrUTZwYTd1dUpQZVVwVk5zcjR1Vmd4YXF1cDZZbzhS?=
 =?utf-8?B?UEpSRVVzbStNQU5Ga1lKM2tlNmFrOVpZcTB0djljNmhyQ0U4L1dYa3Q1QitE?=
 =?utf-8?B?Uk5qbkRQektnSCtkL3g2dFJSQXFUZTRKQlFQdHo1MkhicnZMUXVLUE5YQ3BH?=
 =?utf-8?B?eU44UXMyL09UK2hPaXZ1RmxWSGVMQnpZTEw2UzRVMkVBNzZ5UGlPc2xhVGhy?=
 =?utf-8?B?T1JERGUvY25qL0FSeGE5NGRBdDdFWThCQVBoaU1iNkN4YkV6UVZGLzhkMmJy?=
 =?utf-8?B?b0dFV2h3ZnZrUFN4MTdHN1RRUktETkIwZzNlL0VnZW1tT213bWhlZlA1ZkVz?=
 =?utf-8?B?MlhDTVovUHVwOUlXV1h4MXFSbmt4Vkc0bTdXdHJYWlZ3dEkzUEVSSXdFSDUy?=
 =?utf-8?B?elRyZ1JXZGgxR21lK0RKeUNENGpkM2N6SWpNTTk3dXBPUVFBc1JGcGVVV2JO?=
 =?utf-8?Q?NMOqDXfWvPSxhJwM9GIbqSzU8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c678592-2359-4b20-b25d-08de373632e8
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 15:18:25.6296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FSQG39CjO3nt6v3UtcOk0ZSoh8XwVp3emYVohvl2R0VEZG+YZhBHFRwahfsBdOPVARruQO34evFHied7ZgLfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8046
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



On 2025-12-08 19:13, Melissa Wen wrote:
> 
> 
> On 08/12/2025 20:59, Melissa Wen wrote:
>>
>>
>> On 28/11/2025 18:36, Harry Wentland wrote:
>>>
>>> On 2025-11-28 14:09, Melissa Wen wrote:
>>>>
>>>> On 27/11/2025 17:39, Harry Wentland wrote:
>>>>> On 2025-11-25 19:45, Melissa Wen wrote:
>>>>>> The usage of DCN30 CM helper creates some unexpected shimmer points on
>>>>>> PQ shaper TF in the steamOS HDR color pipeline. Fix it by using the same
>>>>>> DCN10 color mgmt helper of previous hw versions to translate plane
>>>>>> shaper func to hw format in DCN32 hw family.
>>>>>>
>>>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>>>> ---
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> Commit a953cd8cac6b ("drm/amd/display: Fix MPCC 1DLUT programming")
>>>>>> mentions some visible artifacts when using DCN10 CM helper on DCN32
>>>>>> shaper and blend LUTs. On the other hand, using DCN30 CM helper creates
>>>>>> some shimmer points on steamOS HDR pipeline. We didn't noticed any
>>>>>> visible artifacts so far, but I'd like to know more about what kind of
>>>>>> artifacts were visible at the time this helper for shaper func was
>>>>>> switched in the afore-mentioned commit for further investigation.
>>>>>>
>>>>> Thanks for the debug.
>>>>>
>>>>> Do you have more info on the unexpected shimmer points with SteamOS?
>>>>> Ideally a video and a description on what to look for and why it's
>>>>> wrong, or a comparison to a GFX-transformed example that shows the
>>>>> correct visuals?
>>>> Hi Harry,
>>>>
>>>> I took some pictures of clear unexpected scenes in HDR games.
>>>>
>>>> 1. https://people.igalia.com/mwen/hdr-dcn321-pics/HDR-DCN321-split-fiction-game-black-loading-bkg.jpg
>>>>
>>>> Just loading Split Fiction after having turning on HDR in this game options (Options > Graphics > HDR).
>>>> We expected a black background with the Loading <icon> in the bottom right, this background is full of bright spots.
>>>> Friend pass is enough to reproduce the issue without having the game.
>>>>
>>>> 2. https://people.igalia.com/mwen/hdr-dcn321-pics/HDR-DCN321-god-of-war-ragnarok-menu.jpg
>>>>
>>>> Colorful-bright points around the margin/corner of the God of War Ragnarok game menu.
>>>>
>>>> 3. God of War Ragnarok game intro:
>>>>
>>>> - https://people.igalia.com/mwen/hdr-dcn321-pics/HDR-DCN321-god-of-war-ragnarok-intro1.jpg
>>>> - https://people.igalia.com/mwen/hdr-dcn321-pics/HDR-DCN321-god-of-war-ragnarok-intro2.jpg
>>>> - https://people.igalia.com/mwen/hdr-dcn321-pics/HDR-DCN321-god-of-war-ragnarok-intro3.jpg
>>>> - https://people.igalia.com/mwen/hdr-dcn321-pics/HDR-DCN321-god-of-war-ragnarok-PS-logo.jpg
>>>>
>>>> Same random shimmer distortions.
>>>> I think those images are good examples, but still pending screenshot/GFX examples for comparison.
>>>> I'll take it and reply here later.
>>>>
>>> Thanks, that would still be helpful, but even as-is these images
>>> quite highlight the issue. It's more severe than I expected.
>>>
>>>>> Obviously we don't want to simply switch back to DCN10 helpers
>>>>> without understand why, and potentially regressing other use-cases.
>>>>> At least we should look at what the differences are between the
>>>>> two versions of that function, and which part of the curve programming
>>>>> causes the undesirable results.
>>>>>
>>>>> The original bug that was solved by that commit was a regression that
>>>>> sent bright values in an HDR video to black or red, so basically
>>>>> something really messed up bright PQ values. At least I suspect
>>>>> it was a PQ HDR video. The ticket doesn't state that.
>>>> I see. Looks like now we have somehow the same problem but in reverse (?) like black values mapped into bright values (?)
>>> Yeah, if I understand your screenshots the issue seems to happen
>>> (mainly) with dark values?
>>>
>>>>> When looking at the diff between the two functions I notice that
>>>>> the cm3_ version is missing the dc_fixpt_clamp_u0d10 for the
>>>>> delta_<color>_reg assignments, toward the bottom of the function.
>>>>> I remember I had to add that to the cm_ version since it caused
>>>>> issues with SteamOS HDR. Can we try that on the cm3_ function?
>>>> Yes, I remember this issue.
>>>>
>>>> I've already tried the same changes from this commit (https://gitlab.freedesktop.org/agd5f/linux/-/commit/27fc10d1095f) to cm3_helper, but it doesn't help... probably because the commit was addressing a different behaviors.
>>>>
>>>> I also noticed on cm3_ they consider a different range of hw points, as in this comment:
>>>> "
>>>>      // DCN3+ have 257 pts in lieu of no separate slope registers
>>>>      // Prior HW had 256 base+slope pairs
>>>> "
>>>>
>>>> Can it be related to this problem?
>>>>
>>> Possibly. The point distribution is one potential culprit.
>>>
>>> How I would debug this is to look at the diff between the two
>>> functions and try each diff one at a time to see whether one
>>> (or two) small changes fixes this. Then look at what that change
>>> was and what it does. That can then give us a guide on how to
>>> properly fix it without affecting other use-cases.
>>
>> Hi Harry,
>>
>> Sorry for the delay. I got swamped with another debugging.
>>
>> I identified to different problems on plane shaper LUT when using the cm3 helper: those dark values wrong mapping and banding on some light values.
>                   ^^^ two
>> I followed your suggestion and found the necessary changes to address both issues, I just sent two RFC patches , so we can discuss it better there.
>>
>> https://lore.kernel.org/amd-gfx/20251208234741.293037-1-mwen@igalia.com/
>>
>> I still see a gradient banding on the game menu of Ori, but it's present with the DCN10 CM helper too.
>>
>> Thanks for taking a look at these problems.
>>

Thanks, I'll have a look.

This is with the AMD_PRIVATE_COLOR stuff, right? Do you know if anyone's working on migrating gamescope to the now-merged color pipeline API?

Harry

>> Melissa
>>>
>>> The other thing to understand is why we didn't see issues with
>>> the Color Pipeline API tests in IGT.
>>>
>>> Harry
>>>
>>>> Thanks,
>>>>
>>>> Melissa
>>>>
>>>>> Cheers,
>>>>> Harry
>>>>>
>>>>>> Thanks in advance,
>>>>>>
>>>>>> Melissa
>>>>>>
>>>>>>
>>>>>>    drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c | 6 +++---
>>>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
>>>>>> index bf19ba65d09a..a28560caa1c0 100644
>>>>>> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
>>>>>> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
>>>>>> @@ -501,9 +501,9 @@ bool dcn32_set_mcm_luts(
>>>>>>            lut_params = &plane_state->in_shaper_func.pwl;
>>>>>>        else if (plane_state->in_shaper_func.type == TF_TYPE_DISTRIBUTED_POINTS) {
>>>>>>            // TODO: dpp_base replace
>>>>>> -        ASSERT(false);
>>>>>> - cm3_helper_translate_curve_to_hw_format(&plane_state->in_shaper_func,
>>>>>> -                &dpp_base->shaper_params, true);
>>>>>> + cm_helper_translate_curve_to_hw_format(plane_state->ctx,
>>>>>> + &plane_state->in_shaper_func,
>>>>>> + &dpp_base->shaper_params, true);
>>>>>>            lut_params = &dpp_base->shaper_params;
>>>>>>        }
>>
> 

