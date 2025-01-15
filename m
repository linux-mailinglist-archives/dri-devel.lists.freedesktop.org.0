Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52890A1243D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 13:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C713D10E676;
	Wed, 15 Jan 2025 12:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BebPrFNV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A62D10E676
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 12:57:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W67E6Ho2/xDukQeMbmuoygH0kqabsV2Tx6PEA609cmCanML+R71BhjBBsgCUo2kc2GDSJZ/y8nOQZVWHDpjFKBUFk0NC4Er7ACeLw6P6DxIArwt9iKYkkgwBjEvqEyBOTtlylhmjfgif0w/EAPMwjDX2ZPHF3XgJKu+p08vD1rakcsIsT8T3Tf2t4UfuOYqWL2S9uL14I+22h2MOgqX0sR4dCSr/UtWeHP+IOl6mT6t4nfhvPcO/8dHwdrLMYGk6eUjoy0lK1E9vVUiGWQaYS6wH325TSK2b4n67xVr61Mo8XNBlyKwNewQt/cThks7cP3t77qp+6SA3t4recGxySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=di5di4IuV3nXiLimyw0ezQACRZlOwhFult7/u3pAUzs=;
 b=xwRGgVdj9n5LA/iYgPIvzIuJ7B7F/T0cFcH6wE4lGveomP4qSzcXpxi2R91OrmfVPAnpdj94vtcmzowue+DEER3g5ZFZ3x5cOWDsuy+6H8X4n/ob5YXR6DqmvqfceqM7RFQ/fuuDMN7LWt9zeH82RRRywUmHCYSZ2Nd6TrFrC6hCki5D677hWa2qeWiG2P25PLI6beQhXJAZYMnaiCbZMbf0pmG+ESccm2m1MvWxsF/L/NopyEfTB/8Uobz+qIukdqyPmYKvoC3qJvvv6omcwfC1/o3BgwiSZiZnU575MTgJN98vuuYbVfKwyzvb0XsMiJuFhrwe7JYEaIlgiYobxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=di5di4IuV3nXiLimyw0ezQACRZlOwhFult7/u3pAUzs=;
 b=BebPrFNVsEPAAM7LvMKWfP+lJZlBBuzTspFVat31bXANcbU1/xn/6hKn5mb1AZXCs2Rw+Sx/a3akXik7X8Zs/mqzntqkToDRr07jHtG//ssV7J3Sif5/J7tv3FCQJ5Tcuj6ADb54TR59HkWEFg1TUgR5A+Yc6Q+MNH35/cjx+G0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 12:57:22 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f%5]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 12:57:22 +0000
Message-ID: <17cd9b77-4620-4883-9a6a-8d1cab822c88@amd.com>
Date: Wed, 15 Jan 2025 23:57:05 +1100
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH 08/12] vfio/pci: Create host unaccessible dma-buf for
 private device
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Xu Yilun <yilun.xu@linux.intel.com>
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, pbonzini@redhat.com,
 seanjc@google.com, alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-9-yilun.xu@linux.intel.com>
 <20250108133026.GQ5556@nvidia.com> <Z36ulpCoJAllp4fP@yilunxu-OptiPlex-7050>
 <20250109144051.GX5556@nvidia.com> <Z3/7/PQCLi1GE5Ry@yilunxu-OptiPlex-7050>
 <20250110133116.GF5556@nvidia.com> <Z4Hp9jvJbhW0cqWY@yilunxu-OptiPlex-7050>
 <20250113164935.GP5556@nvidia.com> <ZnDGqww5SLbVD6ET@yilunxu-OptiPlex-7050>
 <20250114133553.GB5556@nvidia.com>
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <20250114133553.GB5556@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:806:a7::6) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|SA0PR12MB4430:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a87195-d7ae-4d9c-74ff-08dd356426f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHRZWnUwd2loT1BDaHBaS2FpK0hHYW9WNFZSOC9YVElKL3IyRmtvVVUwWnh0?=
 =?utf-8?B?ME5yMmlJRzZFaFJ5WUhIelkvVmZJMVV2cVpENnFuWkNkUWlIcU5iWE1JM0NU?=
 =?utf-8?B?NmNqeXlEWHZ5Z0dUaE13c3dZZ01OOWVva0RYSWNJQzNmUGNSRnpFU0drM1V3?=
 =?utf-8?B?ZlEyV2VGYy8zdzhOa2tuaTFnRTdaQXJaWENFS0MvUGRhUTZFTG41VHgxY1hB?=
 =?utf-8?B?VzZNMzMzL1IwSnJzK0MzMndPbXRUQWZYRWU4TWRuMEovUDlad3Ntd3ZPakR3?=
 =?utf-8?B?MnRBRHFYdVpBcTNRQXVSYnM0WjU4VDJWYkJCMjlIbzhlSTFxSWtPNGRvSEdF?=
 =?utf-8?B?amN2Mk1RTENxWERxMDJPY3lwQzJpbWsrSDZ0VTRkK21nU09GaW5oVTJ4b0RV?=
 =?utf-8?B?RDhkSlZnMVZndFRFTWxkZEw3ZmRoUWZjOHNEK25FcHRRSlBVekpON25BSUw1?=
 =?utf-8?B?MVhId25RTitNNHBrT243dkl3V05KUVhKeU4yMEJIci84NUt6QVdvRVFVNWRy?=
 =?utf-8?B?dUk2cW9wK2Zob1JFMi80WDRMRklwQUJiZW5FeHVDTVBBdWh0MCtBRjFQMHRh?=
 =?utf-8?B?OGZMVzMyYzZ6Szl1TlN4OWxnblNYM3haUDJHaTlod3JUUjlRcmNqenVkblZK?=
 =?utf-8?B?b3FSZW5XWHN5cy96Qkx2T0YzblZrZGZlMk1ERHRkODloU2JBanQydWJFMENC?=
 =?utf-8?B?OFpnRkt1RzlSNU1SN1llVHVIK3lpdi9xcEdsSmpmeG5kRC9mYmNQdWdLVEZ5?=
 =?utf-8?B?dWhxMmd0eTMraXgyV1dGMHQxY0NaM1c0SDlUM1RVbmVIUndQWFZ3ZFppc0Fz?=
 =?utf-8?B?UzdVY1RWSTZDcm5abUR0blNkN0RLZ0c4UXhZQkZHYXBtYW5zbG1KRE5ZY3Qz?=
 =?utf-8?B?V2FJa2N6dHAvazVnVjRYNnVRdkNrQVl5UytRampHSHF6ekNOcUo1VUtOdlJx?=
 =?utf-8?B?YkR1S25HWG0yZlhGMGM1Qys5SUYwZ1h1SGhKMVZUQlJjRmsycHppcmRvSEhw?=
 =?utf-8?B?TWtCSkRpMVZDelpjMlNiNmtIRmZ0Q3NaSlpUNnNKbndsdWVDVUZzcG5wL0FW?=
 =?utf-8?B?VDJFMTdnSFAzRi8raUdKeFlEUE9Wc3hXdmJIZnNWalNvb21iSGlwSmpERnVj?=
 =?utf-8?B?TkhscFNuZDZGOXlyZ0NwWm1nelNNVFVFN3k4ZFVhUlIwMENQV1FlZ2l5Q1VV?=
 =?utf-8?B?MGVRYXd0RlhGTUZ3M0dSS1ZEckFqSFdQcUdCQ3M4YjYzK05rM20yQTR6dzZ3?=
 =?utf-8?B?VEhvd01tdnhzTTVkSFJ0a2xzdWliUEFwTmRDeVdJc1BXTzdXMkx4V0xRMUN5?=
 =?utf-8?B?dVlZMUxBVEVBL0pET1lWRVhFTjZ0QllDOWE3NTJvSjdaT0gwV3hWVzNzWUpv?=
 =?utf-8?B?bE5qWDN5MmNKNDUxbHpmWXhxQjZLbmRFUWtGTkpseVpFK3AwS0k5WWRKZU5X?=
 =?utf-8?B?TGZvZVZOOFJLTlZ5bHg1b0xrcEM2SFRxeVEvYnVNUkY4cUpoZnVMZVp6K0JL?=
 =?utf-8?B?K3MvRjF3bnQ1THk1UkNoM1EvNDBVZHlrV1lJRzJsdnVtOUFrSmpqNHAvSVlx?=
 =?utf-8?B?TmhkbzArTDEwM1V4UzQrNjVqTzhZQWZqTEZ0YzBlK3JoejVZQVpyOGpYQXF1?=
 =?utf-8?B?Sm9IdVEwMWZsRzhaN2daenlyek45eklOc3FvbGhIc040QjdpTXZucTdtRnQ3?=
 =?utf-8?B?R2lPM2FEUkY0S1NmMjd1VUlod3dpQnpiZm9lVGtJZXVKNmRHZDVQVlpCeUc0?=
 =?utf-8?B?V2o5UjJ2TVc4UkNDTnNIZUZWZG8wSUlHTFZUcnEvYzZyUXYycWwxMmRFaTZN?=
 =?utf-8?B?Q1dPbk10ZDNIMVl1RUhOUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB9194.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDNuVFRXak5YM1VJREIwbHY5YjJFODVBVU02YmlVdDFWaHI0WU5pcFROYWpK?=
 =?utf-8?B?ZDVlT2dCYVBzc0xBcGVCT04vN2Y1cms2Q0RVdHppZGZVYnJSRDErWG5VM2xI?=
 =?utf-8?B?WDMyaGV3WW5TT3hNVEtsVE9jNmk5eFBwUGZzZnNOSVBsUDJHR052MXdyak5E?=
 =?utf-8?B?WE1Gd2cvblBQVkIrb3orZ0NPMnNmVTM0R3AxNnhKbEVOU3hBRGJCbFJiOXUw?=
 =?utf-8?B?U2xweG5WVUVJOW1TRk4yczBjREJOYTFXRndGTVZMTUtDRjdEbEVESzBGTkk2?=
 =?utf-8?B?Z29sK21waVJUSEJjWVliRGk0QmNtN2JWZ2c4aFJxT1RVTnl6YjZQaE14Wmwv?=
 =?utf-8?B?SDRQekRjK1diZ3RzbEtxSm5aYk16ckpxKzUrVE8zQUhjdGZtS2ZHWEZFb3FO?=
 =?utf-8?B?WkNIYkVKWVkwY2tMenFCNG1NVjdCWkdnQkw5RzBXSFphSjExdU4zRFBCN2dn?=
 =?utf-8?B?ZTA3aXA1c2RRWDdDQUV3N2srL2FDajlMTVFpdHorRGZCWmhnUEc5bEh6ek1y?=
 =?utf-8?B?M1ZtZmxuVXJSQ21wZmJOcmU4c0RJLzZlbXY1MDAwQ3pYd3pHdzlsbUJ6SXBV?=
 =?utf-8?B?Rk11cWFjcUxiQmk0RlVoa3M3TmYraUFjazNnYnJaaFp0d2RhVnRnUHVNb0p1?=
 =?utf-8?B?dFFWVWFDNXc5RmxpSzhoN3ZRVENHTzJhL3k1VjZrWm1oejlYemdBTjhjcjNS?=
 =?utf-8?B?Wmx2RHJ3c1RXMnVxUEdTNjZkQWZtWWRzZHpMZm9xb3NoK3ZmL2l4VXlGRjVm?=
 =?utf-8?B?UHhKOTZ6dEVEdjR5L1h1NkNUcVB2dEpITURzbVRtNkQwbkRpOWpuZVduNk8x?=
 =?utf-8?B?VFFPSWgzbUZHSFpsZE9MczJWbkR5cm9tZkdweXZRRlQ2YWdydStmeFNscWdQ?=
 =?utf-8?B?NklSWFdrTHY2SHlZZ283cURWaVZYREVwTXVRRENhdWNqYVIramc1cVJJeGZq?=
 =?utf-8?B?ajY5bCs0M1pHK2FjZ3RrQ0ZIdDFNVkZSTUJaVjFYR3dmcGJtcVo5eUNjd2xS?=
 =?utf-8?B?ckNmUjVVcWJ5Q0FaQkhhRzBxNkpGZnlPQ2dWZnd3RGpoTTVEckVzaE9Kb0tG?=
 =?utf-8?B?cWUyU2g3K25WL3h5dzE5UElySzdPb3E3QlpTanU1L294VUNscGR2TGV2S2tI?=
 =?utf-8?B?OU1nQzRjN3REaVlxeVRjdGNaMHBkdXlvSk5JL2NRN1JkR2taNkRxZzcyR2NM?=
 =?utf-8?B?Yko3d3VEOXYyQkEzeTkzYXp2aFZQZnVhd3VtWEJ4YmtJcnFEK1VCaVdLVjR3?=
 =?utf-8?B?WHZwWWZkM2pTekFRUHZ5amhFcFhJVW02MUJwNElzdnR1M0lYYzE4emQzcmx6?=
 =?utf-8?B?QTBaOFJGNCs2MHVEMUtWMnFYcTh3aVhkdGJpVWtkd1FMdmZlKzVpT1djRVNC?=
 =?utf-8?B?TStVQ29vM1lKTlhCenVOenE3amd6QUV5UFR6SHNIV1M0Zmo2RUNoSEZlTHVR?=
 =?utf-8?B?dUkzdlZnMFhVeGtHMnpheWQ5b1RyYlRianF4RXF1dlBMTGQ4eFJaWjRhYXc3?=
 =?utf-8?B?TWtnUUhweUFNbHlTNWRkR1lxNm5hS3I3Rm5VeWJHall6SjNwQktOWVhCb21X?=
 =?utf-8?B?SGFTZTNUdG5aQ05Pakw2UHZUeGhOenhKMnVHL3dwNkNyNFNVSDFGZGYrSWtD?=
 =?utf-8?B?KzNURUFZMzIvdkYxWlA3RWpZMm1VMUNpeStGWkdWZmZWZk1zUU5WNEN3Z2tC?=
 =?utf-8?B?eDQ1ME1JbEZVVWpMUUduUmdJMnlwVXA2VnQrTUFpQnVSQ3V1V1NBQzJnN2cv?=
 =?utf-8?B?QjlwZUR3bVRzSFBuZVlNZTljcGdzUWVyNmw0blRuV3BMRTJ2dlhKbGd5OUtY?=
 =?utf-8?B?bmlzakdKY2ZNakRHVXg1MTM0czF0S3oyYTBlaG5qQkRqSWxEeHM0ZU1aOVF6?=
 =?utf-8?B?MkpwQTRLeTAwcFlJeW9uR1RLd0FKR054R2p3MDhqdEp6cUFHUWpnWWFOWUo4?=
 =?utf-8?B?M3lnc2Z3cXB0b3F4WXNYRlRxeVVObGtTdEJzNE1SYWdBTjFZR0RSN1pBdVZa?=
 =?utf-8?B?a3pBV2M1S3RoR3hZN0puTGpqN1IyVWFWOG95VTh1VDEvSHZLS2tXTkVtbDk1?=
 =?utf-8?B?UUZad3ZMalRaeFBJZE45ZDU0MWJTM0RjMThuemRiQmxDM0RiU3RJUHcweS9C?=
 =?utf-8?Q?x0nglvIGxxDptZTE4Znk6MrpI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a87195-d7ae-4d9c-74ff-08dd356426f2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 12:57:22.4319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f1l0umMekakWzBKoJ5h94RmnkRWF4SomV4kOZP4JSvzeYlfp4U70USM2iMWHvgA9TOL09gb57uaUcIiEMl9bsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4430
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



On 15/1/25 00:35, Jason Gunthorpe wrote:
> On Tue, Jun 18, 2024 at 07:28:43AM +0800, Xu Yilun wrote:
> 
>>> is needed so the secure world can prepare anything it needs prior to
>>> starting the VM.
>>
>> OK. From Dan's patchset there are some touch point for vendor tsm
>> drivers to do secure world preparation. e.g. pci_tsm_ops::probe().
>>
>> Maybe we could move to Dan's thread for discussion.
>>
>> https://lore.kernel.org/linux-coco/173343739517.1074769.13134786548545925484.stgit@dwillia2-xfh.jf.intel.com/
> 
> I think Dan's series is different, any uapi from that series should
> not be used in the VMM case. We need proper vfio APIs for the VMM to
> use. I would expect VFIO to be calling some of that infrastructure.

Something like this experiment?

https://github.com/aik/linux/commit/ce052512fb8784e19745d4cb222e23cabc57792e

Thanks,

> 
> Really, I don't see a clear sense of how this will look yet. AMD
> provided some patches along these lines, I have not seem ARM and Intel
> proposals yet, not do I sense there is alignment.
> 
>>> Setting up secure vIOMMU emulation, for instance. I
>>
>> I think this could be done at VM late bind time.
> 
> The vIOMMU needs to be setup before the VM boots
> 
>>> secure. This should all be pre-arranged as possible before starting
>>
>> But our current implementation is not to prepare as much as possible,
>> but only necessary, so most of the secure work for vPCI function is done
>> at late bind time.
> 
> That's fine too, but both options need to be valid.
> 
> Jason

-- 
Alexey

