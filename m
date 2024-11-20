Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE819D3C9E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 14:39:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB92810E0C9;
	Wed, 20 Nov 2024 13:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FhJm9LAb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72DF10E764;
 Wed, 20 Nov 2024 13:39:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKY5FQxPTC8+P/e9eaQpBdcIVlA79eDYEcnQx83hcfviGAI4oES4k/+A0LHr4EVERwUm5GEOQgUUMBQvn2tYbVjHnnJq2L10V/WC+47UGunRVOlWagXVzTvqPDzB6lk7vVGzj2LMDdrV/3OHzrpTeyEnsmhPVe/wS8qR3Cn5cQR6SEGOZ94OLPc3M5KgDrlmP6UAJiEzXaXmmkunF4gk044mw/veyDMJiMV+gq+jnFI3v5s3FPNXR1cj+fLjt1TlV/uLnu9sJDHSooVzwQ3FPJBbryULOvfZ16wj0E8REdCR0jgNrzQ8+44qC+T88TMudvrD2VhKwHcUM53RRC5g3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQ7mIYZ/iFSzMTteh18Z7IIGu3TsGDjuAs+1Efgpw3g=;
 b=Vsxaddg8h/WQv0o324BqHR8XeIVJ9S7Q2mR5MQr8EQS3tdGWmx9fr3PJ/659n9UcRi2ecup9pLKiciYwIB0HwKpdDHlEM643huGRQxATdCR+OJ0twbgYhGn3YS7K2Mrl3JPOb+0pRTMffaKjjJSxbXEpTon/3mPS072fR+wM71pL5TFropiTF+VG6wpVzvNUYt/yiWFUv1pewVGzaVxrLd2zVRvMgDblKO/ow2iVTJxE7tNZO59ufrbC1h3vwPUcGhAWT11+dkk3TVb4EPddwti/z6bT8Gv+0t9gb46SHq2IWpV3i2lU15LE5KFdTa3oxVqHTh4maj2uVdFnZ/aaJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQ7mIYZ/iFSzMTteh18Z7IIGu3TsGDjuAs+1Efgpw3g=;
 b=FhJm9LAb5PC3vKl/JPF9Mgv0KF5TZPb9sMOfXcHbIzuZ3coSyO7RpWMjpreDWHlKmk15UGVQQEKV/8Rnh2B8bUv2zW6GKEXsOL2bVfo5hDWadBWQljp2IaXU5TqblFa0a1HkjptVFopPdGCNYGWezksVdsEtla5MVmAFl9RKKu4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15; Wed, 20 Nov
 2024 13:38:56 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8158.019; Wed, 20 Nov 2024
 13:38:56 +0000
Message-ID: <f802caa1-85a7-4a5f-ae92-9b1c0f4c500e@amd.com>
Date: Wed, 20 Nov 2024 14:38:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 02/29] dma-fence: Add dma_fence_user_fence
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, mihail.atanassov@arm.com, steven.price@arm.com,
 shashank.sharma@amd.com
References: <20241118233757.2374041-1-matthew.brost@intel.com>
 <20241118233757.2374041-3-matthew.brost@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241118233757.2374041-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0204.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4130:EE_
X-MS-Office365-Filtering-Correlation-Id: ea1c53f8-1346-4bf6-f79e-08dd0968ae39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1FpM3Mxa1lqYVl2RjFrVVVyNmpOYm5KaFV0WWYyM0l0Nm9vOHNmd3psTDBZ?=
 =?utf-8?B?UVNEb1BFWVQ4eHQwZ0pRdnhaTjh3Ky9lb003QXNrSHdGL3JINWk1dGI4MUhS?=
 =?utf-8?B?TFJiR00wRlduUmhiVFRaNm1LOUxWVVBCeWNIaVVzeWEyVDBlelYxRmJ6Y1pB?=
 =?utf-8?B?ZFJ6V2VZTmZrZm5uZlBLMTJadnpoMEF0Tk4yTlMzSXNEVTBJWlpOeDJkK3M3?=
 =?utf-8?B?Uk9xNEpJU09pY0tNbzlCVVB2L2NlajFQU3pCbC8wQU5nL1J4NzA0TzRuU0lW?=
 =?utf-8?B?aGFLZXNDMVAvY3dWclpqdFZ3dGNUOGx2aGJlbno0UzRIR1dVb3ZSWEF3eWJK?=
 =?utf-8?B?REhmcUdibzJ4czNXeGJRUFh2Z0pUTko1S0NERE9JcFFtanhuZVI2cmF0UVFq?=
 =?utf-8?B?em1vNVpZNDZVMitPWXhZZGp4MGJiMFdsbm8yZU80RWhvTzJweUhMcTJQOHpa?=
 =?utf-8?B?QkV3OW5WUGRHYzZ0dk1yczFqQ0tGK3BudXpiR1NXTWlXQ3lpNENXMFd2UE5E?=
 =?utf-8?B?VGFpS1lKSjROTnFvTFYvcDV6bXdValhQMy9wR3M1V0pPWlNCV011YU9uNXNj?=
 =?utf-8?B?T2Q5NGQyU096dlV2b1ROTFJyWUFpSjJrMUlqeVpMdDRyaEdlMiszdC85K2Qz?=
 =?utf-8?B?Y3V3NWx2dHFoaDNjZkxxaXlpbmUwY09oUHRzYWFPaWx2cVZtWEk0eUZmWWx1?=
 =?utf-8?B?R2xwZC9iM2ZydU1lQnNKZ2lLNkgwaHB2WmxKcFlNQzJrM0pHMSt2ZXZKYnl6?=
 =?utf-8?B?dHdTSGU4cDlHOXE3SmxhQUNqbmsyOEY4VW1jR3hCWGVoT1FhR0grclBLZFhw?=
 =?utf-8?B?WjY4MkI4Z3NxQWtLNW51TzV3ZGFxVDJ5WExxNEliN2JYV2JuUWg0bTg2ZEtU?=
 =?utf-8?B?TzhvT3UxNC9peFo3dlRwdFBORlU3Vi9sVUk4L0RQWXdiZXdURThGdEJRNVpO?=
 =?utf-8?B?VnpBRC9WODFLcnRDVE5OV1VVVWtyU2NNV05lTklRZmNnaE5UeXQ5SWFkc0Iv?=
 =?utf-8?B?bUJySkNXd3p4WCtvSTZ2QWtNTkhlR2xCRWo2aHNON3FqRWNaTTZOak8yaXgx?=
 =?utf-8?B?MUdXRThtTWpOYlU0SENSV21obWxaNXh6NXlQVlB2bEs5WDY5Tld4VENVc3Fm?=
 =?utf-8?B?Tmh5dmxUeGl4L2dxMzh4SEpSajNSdjBUT1M4OXV2OVNERmNrc3hleXZIWWN3?=
 =?utf-8?B?bnFTT2xNWGM4VE9rbUVKbGN2THA3MU51bzE4Q2toT0JYdlFFTlp2MmIwcUVV?=
 =?utf-8?B?N2c4TnlmdExxTlJzdUNRaEgybjhQWDdrNlVzRVpLbDNTSWx0VFN2R0RmcVR4?=
 =?utf-8?B?SWo0VStaUDFtQjhibThRUGZkTTVZZ2tuajU3azNaN1JobUNLZ1hKNUIxWHdT?=
 =?utf-8?B?TnVIRzhjUkltQTMxTkprNkxqQm03ZHhzS1lMZmVBYTFvTWdQejVpaU9aMDZG?=
 =?utf-8?B?ZEZ5QlZoVXMzS1VzVTIyR085MnBkdzN3M05PQ1BBZ2lpZjB1T3NJencwZGJq?=
 =?utf-8?B?M2FRRWUyNS9DbmswWXF5NWkxT2NvUjI2VkVBZzZNSkRoVnFxK2l3VTVTZDFZ?=
 =?utf-8?B?ODBvRVVZVEJiMGw5N0lJSWIvNWtld2o0YkRyWHo5NDRWQ1hqVkprS1FxTTJt?=
 =?utf-8?B?d3ZKSG5FSFhmcXhJTW15OEhhYlRhK3hXSmdMSG04dXM5dCtLVVV1UmF0SGF5?=
 =?utf-8?B?Q2MxN0o5dGhobFJubnVjbG13MmtnZXV6bFlzL1ZNdUczODlOMU8vemljVVRE?=
 =?utf-8?Q?uFehG5QGu1/wuuMJxLvaYr0mYn1pmkVvvz1Fowa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1ZScnFUZUhGbDVNcjFDYjFrMDM5Sk16QXRCZHZwTUdMeEZVUlZVUUZaTHM1?=
 =?utf-8?B?Z2NtR2hFdlc4SHlVUURLK0ZSSVp5aVo5ait3VWxWWjJpdVEzbUg2bWFIL3NX?=
 =?utf-8?B?ZGhVaW5EOFRBK1c2L1IzUG00VEZSVmoyMHdGK1FGV0tEbFlMYllWblpBV3U4?=
 =?utf-8?B?WUFRTjdzVVVXaVFWZFgwc1RxbUN3ZFY2ZWNpcVV3UlJsa29rQW1TSnFvT1Zr?=
 =?utf-8?B?MWNTMW81cTBabDlSeFJEdTdaNzVBSjJXWnprNFpMNk10RjhOL1U5MUZKUzBu?=
 =?utf-8?B?RWtiREcvNXowSi9tZU5NSnhGK3dwQ2Q5NkhTTE9NNzYxSDdaMWlja05hdUtW?=
 =?utf-8?B?OURhSEo2WndwVER0MW1MWDd5bDNNMDJ5M2dCUmVUeXZsUDE5VytlZnBBSitj?=
 =?utf-8?B?OENOWHlveUpPM2EyTU9VL3ZER2dBZit6cFozaFFPSXR3K005eEVEamFLMVB0?=
 =?utf-8?B?QmdXdEY3SUNDU0lzNmFvVFM4a25IVHcrOXZCRGdMaXBkRzJ5clpyOU5Bcy82?=
 =?utf-8?B?Z1Z1Mzg0bjRUUmw1YmJxeFBqSGl0cWMvZUwwdU02TGZaQjQ4NTFNMGNUS3NL?=
 =?utf-8?B?RWxhTThVaTBEWnpIVjhldXZhM2dPa3Rha09qTk1OQkxPUnhkbWZjZHhtczcr?=
 =?utf-8?B?cFo3bWRxSitXc2U2TE5qOUVWYStTdHF0NmVFT09mYVRBa1VpRzczbXVUczZL?=
 =?utf-8?B?Mkw3Tm0xbG0reXRrVFhkSnpucEFQUG5XYjdYQWR2bTdFd3RtaWdUczVYWEI0?=
 =?utf-8?B?WmhMSC9zNVlGSXFPWFpTUmtyWnAxT3o3TElvUVFVcFZwOE1jYXh1ZG5qSUVr?=
 =?utf-8?B?NGZpOU5KNUFFL2ZpeDBNR2grcFV3TTRyb1VKZzZkNS8rRUZHVmpQcDkrTUU3?=
 =?utf-8?B?SnpxdXdnODJuUS82dXdITGF4d01tK01ZSHBpZ0dSTFZtSU5CQjhUMmgyWHYv?=
 =?utf-8?B?RXdZNHdYbVB4dWxMNEw3ZjVlV3pKdWROajVkWitManJWVFJlZ05aY2VlS1cz?=
 =?utf-8?B?Q3d2VzZPUDhkajNPWnBhbFppajZ6MUNvQ3BJQjI2S1dsQ2tiYk1wcDZpWW4r?=
 =?utf-8?B?dUViTkQvY002QXpLYmRYaThQYU5Lb1hjSXBjMTcycTFMb2xRaENiZEtWcS9Y?=
 =?utf-8?B?aTRLUWN4L0Q3bUtORFVwQVI4YWt6Q0JPakg2QU9vSmZnaUIrVWt4ZE1NTFQx?=
 =?utf-8?B?WGdkVXBQVmxLa1I1Zm1WQURaUGdNMXhNUDZQeklIbVI3MFJTanpqT3FyZ1ZZ?=
 =?utf-8?B?RUZJQ1UwbGJjTllRRW5IOWdQeFFzc0U1M1lPaEttV0ZmNEMzRkZJNHZMU1cx?=
 =?utf-8?B?RmV3RkQwQ2piWkhXamhLbjBtR2hmT3Y0NUh6Q0VTaCtQVVI5eU5aY3FUTldq?=
 =?utf-8?B?cGtnS1IvSURjY1RZdWp4WHNwQnBPMERSVHlKbFFSZzNkOU9wT2V2M04zcms2?=
 =?utf-8?B?alc2dENaNE43V3cvc3htNi9zNmYwZ1Qxd1pIV0NpbDRXT25YMTdySldTSnhj?=
 =?utf-8?B?SDl0OUh1a3h4Z2NTZFJUdWg5U1pYUWl5dVhtMWlTNzJQSDNEZ3V1RXd3UkQ5?=
 =?utf-8?B?MW00TklLYktHUUt1aGVyaTBmMDU5bkRhQm5YQ0pHWEVNYUFtbjJpZENPTkYw?=
 =?utf-8?B?RlVBTHpnbStwaGk3cmhYT2hLamxzRW1NYU5RNU1ycDFxSnNQbW14NEJkaVZK?=
 =?utf-8?B?eWtoeDRXR1hSQi9jK2xGUlNYL0k5TDJFdUxocXNqei9MQm51Ry9UM3VwTG1F?=
 =?utf-8?B?VWtmVnJtdy9mdDQwYW8vY05UWUhiTk50S3lnSzk4QnN1YVRwbGpHZWdXclBZ?=
 =?utf-8?B?Z2VYU2xrTWdQTk44Ris1Si90bEZSb3kzaTMvTnl3QU82Z0o2ZFViRjlKaGhK?=
 =?utf-8?B?UWEwbm5JbnBCREp6VDRHVHl3ZjU5TjJka3JPZ2hpVVlScHdxSVh6bEJ6Zk9T?=
 =?utf-8?B?SWdWdTJ4UytJenR5dmJadjdiRXBCMGhGb2FQL0xpblBCSWlHZXlyOHVYdUFh?=
 =?utf-8?B?a0ZFMTBmOXFocmxVMk9LWEN3R0hCUEp3NWV6d1I2MmpXbnducVBxVVRYL25W?=
 =?utf-8?B?TEY2ZWhYd0EvU0dXV0JkajVtbERpOHhvQkJub3lnRlI3VDBZMUp4SDJ3TFVw?=
 =?utf-8?Q?7cLob3+wO8FGeyX50fZPnyl+X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea1c53f8-1346-4bf6-f79e-08dd0968ae39
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 13:38:56.3277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QAnFH+L3S5UoA/fL7r/oSncL5lqKW5QC0reEkzcPnljUV1gitaRCHKlfAtICRDF0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4130
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

Am 19.11.24 um 00:37 schrieb Matthew Brost:
> Normalize user fence attachment to a DMA fence. A user fence is a simple
> seqno write to memory, implemented by attaching a DMA fence callback
> that writes out the seqno. Intended use case is importing a dma-fence
> into kernel and exporting a user fence.
>
> Helpers added to allocate, attach, and free a dma_fence_user_fence.
>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/dma-buf/Makefile               |  2 +-
>   drivers/dma-buf/dma-fence-user-fence.c | 73 ++++++++++++++++++++++++++
>   include/linux/dma-fence-user-fence.h   | 31 +++++++++++
>   3 files changed, 105 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/dma-buf/dma-fence-user-fence.c
>   create mode 100644 include/linux/dma-fence-user-fence.h
>
> diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> index c25500bb38b5..ba9ba339319e 100644
> --- a/drivers/dma-buf/Makefile
> +++ b/drivers/dma-buf/Makefile
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
> -	 dma-fence-preempt.o dma-fence-unwrap.o dma-resv.o
> +	 dma-fence-preempt.o dma-fence-unwrap.o dma-fence-user-fence.o dma-resv.o
>   obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
>   obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
>   obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
> diff --git a/drivers/dma-buf/dma-fence-user-fence.c b/drivers/dma-buf/dma-fence-user-fence.c
> new file mode 100644
> index 000000000000..5a4b289bacb8
> --- /dev/null
> +++ b/drivers/dma-buf/dma-fence-user-fence.c
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/dma-fence-user-fence.h>
> +#include <linux/slab.h>
> +
> +static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
> +{
> +	struct dma_fence_user_fence *user_fence =
> +		container_of(cb, struct dma_fence_user_fence, cb);
> +
> +	if (user_fence->map.is_iomem)
> +		writeq(user_fence->seqno, user_fence->map.vaddr_iomem);
> +	else
> +		*(u64 *)user_fence->map.vaddr = user_fence->seqno;
> +
> +	dma_fence_user_fence_free(user_fence);
> +}
> +
> +/**
> + * dma_fence_user_fence_alloc() - Allocate user fence
> + *
> + * Return: Allocated struct dma_fence_user_fence on Success, NULL on failure
> + */
> +struct dma_fence_user_fence *dma_fence_user_fence_alloc(void)
> +{
> +	return kmalloc(sizeof(struct dma_fence_user_fence), GFP_KERNEL);
> +}
> +EXPORT_SYMBOL(dma_fence_user_fence_alloc);
> +
> +/**
> + * dma_fence_user_fence_free() - Free user fence
> + *
> + * Free user fence. Should only be called on a user fence if
> + * dma_fence_user_fence_attach is not called to cleanup original allocation from
> + * dma_fence_user_fence_alloc.
> + */
> +void dma_fence_user_fence_free(struct dma_fence_user_fence *user_fence)
> +{
> +	kfree(user_fence);

We need to give that child a different name, e.g. something like 
dma_fence_seq_write or something like that.

I was just about to complain that all dma_fence implementations need to 
be RCU save and only then saw that this isn't a dma_fence implementation.

Question: Why is that useful in the first place? At least AMD HW can 
write to basically all memory locations and even registers when a fence 
finishes?

Regards,
Christian.

> +}
> +EXPORT_SYMBOL(dma_fence_user_fence_free);
> +
> +/**
> + * dma_fence_user_fence_attach() - Attach user fence to dma-fence
> + *
> + * @fence: fence
> + * @user_fence user fence
> + * @map: IOSYS map to write seqno to
> + * @seqno: seqno to write to IOSYS map
> + *
> + * Attach a user fence, which is a seqno write to an IOSYS map, to a DMA fence.
> + * The caller must guarantee that the memory in the IOSYS map doesn't move
> + * before the fence signals. This is typically done by installing the DMA fence
> + * into the BO's DMA reservation bookkeeping slot from which the IOSYS was
> + * derived.
> + */
> +void dma_fence_user_fence_attach(struct dma_fence *fence,
> +				 struct dma_fence_user_fence *user_fence,
> +				 struct iosys_map *map, u64 seqno)
> +{
> +	int err;
> +
> +	user_fence->map = *map;
> +	user_fence->seqno = seqno;
> +
> +	err = dma_fence_add_callback(fence, &user_fence->cb, user_fence_cb);
> +	if (err == -ENOENT)
> +		user_fence_cb(NULL, &user_fence->cb);
> +}
> +EXPORT_SYMBOL(dma_fence_user_fence_attach);
> diff --git a/include/linux/dma-fence-user-fence.h b/include/linux/dma-fence-user-fence.h
> new file mode 100644
> index 000000000000..8678129c7d56
> --- /dev/null
> +++ b/include/linux/dma-fence-user-fence.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef __LINUX_DMA_FENCE_USER_FENCE_H
> +#define __LINUX_DMA_FENCE_USER_FENCE_H
> +
> +#include <linux/dma-fence.h>
> +#include <linux/iosys-map.h>
> +
> +/** struct dma_fence_user_fence - User fence */
> +struct dma_fence_user_fence {
> +	/** @cb: dma-fence callback used to attach user fence to dma-fence */
> +	struct dma_fence_cb cb;
> +	/** @map: IOSYS map to write seqno to */
> +	struct iosys_map map;
> +	/** @seqno: seqno to write to IOSYS map */
> +	u64 seqno;
> +};
> +
> +struct dma_fence_user_fence *dma_fence_user_fence_alloc(void);
> +
> +void dma_fence_user_fence_free(struct dma_fence_user_fence *user_fence);
> +
> +void dma_fence_user_fence_attach(struct dma_fence *fence,
> +				 struct dma_fence_user_fence *user_fence,
> +				 struct iosys_map *map,
> +				 u64 seqno);
> +
> +#endif

