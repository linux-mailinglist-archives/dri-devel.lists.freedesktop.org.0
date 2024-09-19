Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A32D997C462
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 08:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE13710E67B;
	Thu, 19 Sep 2024 06:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="E1M6YleZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE4E10E67B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 06:42:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eb4B659MNGwqc5Bz2E6+7AKS9Lsoqvx8ZxUDxFvHw929ZIy+CHX85+23pC1PrDwzcYCjWKnCvH3aUFVYwb5XbnwQYVgL+IzcIbcDFmO5n+EQj1zexausVz5/VVUyOWjpJ0/ToAHWjOy6k22inlgSoGncG8Q5FAuRoOvh0RQmv2LbFx6VxcgtRlgccH4j/K8jPziCCGk9ZEWjqKg6T73tAs2z+9s9lLNaE4GAMIKjx+opnFC+xtdXTn1mDcjcVD29oQYCUr9pHv409cSKFYxHUMTn+dS6asUv64aLmsJvczHkP4uRO3LpEYF2XbC3RuVbmj7Swya7pJ8dCI8YWIilYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rR3wtjxNZRhNZEnAVG8OuD4BjTY3FJa9UhhXMOv8No=;
 b=otGNPwP/0ErSmOq15Q70prUTujf1QSWW4mWL8AvciVdP1qNhSR8AUPKixrIjKrMzRFoWWMw5tOYsBPBEZSjSkTiDcRg2bCfchjh1UqXKJyuk79zobCjG+i36wSOU0xqVM2zNROnzpDP/WfzXCctikzdyVpO1HomKupVlTgWlaan9fsyzr3Yc+KtJoJfxoEv1vDKsTegLPVxsDdU1DsAHLxVVo6TcJXwi+DYE4Ombp70HwDOsbaenDduniq4hMlkbu6d5Ef4AxOcR5UxYNwG9ZQJoHxVoGQlT8M2vrwJtS6qmtaZjHknqavYKtkDAYMseqZhAkKrC8YsdijGdwvhL1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rR3wtjxNZRhNZEnAVG8OuD4BjTY3FJa9UhhXMOv8No=;
 b=E1M6YleZy5cwZRVqkpY3fHnubmTBGszixqVtxj/9w+dLhG99EBfWSufOaTqWXc90kqPb9jqB+QbF5P039RqNv++HyYWh+kkG6WHEtQA/tY1uPuHE7RTPxijrjuuQ2NLIiwsCMsnzKuvVF7cGr43F/pCKXrjZTHR4XZRYCQxeA7IlhakhG21rr9tpnOu7L1QrCBzjGxvPKMv9LAFHOKnqEZWe4cuKIwEsZx7FF2wjttHWF7Xc6H6f/mB9YAc68c3Zb/PwYN0qwi4uuYLvV4DEbcipErec6afnfXNYNwPt9ynWB9omQiuToOdt7jSNIFrYAwxOReHJgOcXILNxMRZbJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5447.namprd12.prod.outlook.com (2603:10b6:8:36::7) by
 DM4PR12MB6640.namprd12.prod.outlook.com (2603:10b6:8:8f::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.16; Thu, 19 Sep 2024 06:41:59 +0000
Received: from DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b]) by DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b%4]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 06:41:59 +0000
Message-ID: <53d61e3f-f759-45a1-80e5-d3aa4ecf378e@nvidia.com>
Date: Thu, 19 Sep 2024 07:41:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: host1x: Set up device DMA parameters
To: Christoph Hellwig <hch@lst.de>, Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20240916133320.368620-1-thierry.reding@gmail.com>
 <20240916145835.GA17719@lst.de>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20240916145835.GA17719@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0053.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::19) To DM8PR12MB5447.namprd12.prod.outlook.com
 (2603:10b6:8:36::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5447:EE_|DM4PR12MB6640:EE_
X-MS-Office365-Filtering-Correlation-Id: c69a6455-28ff-448c-4c75-08dcd8762996
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OENGZHovdnZWRlo5bDZadmFnR0pEeXYzRTk1M1BPcGNha2NnS005b2hFVWFJ?=
 =?utf-8?B?THR4TythNXZFYUlsa1QzSGJxS3FGek50b3V6ak9aK216NUxOZDZ2Vkd1ZE1J?=
 =?utf-8?B?Tm14dmZ2ZDFiaUZQU3U2Y1VTTWlZUkpnWmxNY0t2QzNMT2hZaWxRMVUxMEU2?=
 =?utf-8?B?UlNkemsxaGMybVpvRTAyUUIxTlprYlZZZ2x6UEVUeVRvVU8xVHpRc3h1WklT?=
 =?utf-8?B?eGV3L05WZDh5V09EelY3VnhUT2lXOVZrYVF3RVlNM3FRVkwxZGsrT1p5QUVX?=
 =?utf-8?B?Y0ZHY3AzRm80ak45YTBUUTg0U3V4WGZPbndxdFRYZEUvNGpTbkdTN1AyanVO?=
 =?utf-8?B?STFwZ2xqSnNBYkxVc2lIMW5xcUtXaEMycFdIOFQ2WllkbkJGSEZqMFRPVGZy?=
 =?utf-8?B?WHhUZjVLZW4wMjNOYmJoU3J6NnBJNG4zLzIxSXBJa0R1bVlIZDZ0azVrNTAy?=
 =?utf-8?B?RWlhemJEanloU3haZWk3RjZpR2V2c3M0MEtSRkxvTUgxeUE3V3Y4NWVMMS9x?=
 =?utf-8?B?a1Q1bDY2UUZFK0xKZmdxL0U4NVk3cllzQlQ0VnRqRTVYSkZZVjNaRVZuWUJa?=
 =?utf-8?B?amFlbHRyZHJGcXg5ZldpbFRpWDJFeURVMXhudFJYRDdVaGFaNll0aWV2UGUx?=
 =?utf-8?B?eFdEOW1EbXAwdUF2dEN6a1RxdVZlNTFpL0g3dStMUHM2aC85a2J2cm1YV3Y5?=
 =?utf-8?B?OHZNVG9ZQ0VTQ2FHdXVaUHlBN1hNU21iYjFIVnR1alQycDd6Nnc1MG52TFJW?=
 =?utf-8?B?c2JUNzUxMGRtMmhhZ1dxMEtHZ2xuWDhtUGtlZWlUNWlFOGgxK0pJWm8yMjV1?=
 =?utf-8?B?MlRmWHlWNENuaVNQUis0M2l3VmprNHZrTVg5aDR2a2ZqelZEM1JjOWUrUGlD?=
 =?utf-8?B?UGxnd1BBQXV4Q2pHbGVxRk42YndjYlhVOEpOM21ZUlRUeklpT0RiQnNsU09R?=
 =?utf-8?B?Tmo2S1BGMDVoYzE0YklXbzhrSGpoR2ZTcEI2dWw2MXBlRGJZcHk4NTNRdVhp?=
 =?utf-8?B?TjFCSk8xaVR6aXdtUjIxNys0d2hWRDVxOVV5OVBDc1lXeGZ6dnNnU09jUkkz?=
 =?utf-8?B?eTI2azBnVE0rU01TdElCNDNxdnE5MU4xWEswVzd0L1Q5NXd4dGZCMExFR0cy?=
 =?utf-8?B?TU9tL25scnZuUzRKeXBmV2tCU0c0VDFlNTBWaEx4a1BUdzB2RGRMaGlRdDNu?=
 =?utf-8?B?dGYxTWdEeDNJNzNZRW5ZSDVtbEpSMm84d2ZYRFZWRFc0bzl3c01rYjJiYlNY?=
 =?utf-8?B?MndERnRsNnJaeEg1MUZCcDFtcmVmNTdWWnFscEFIcktsWGpOM1lLdmJBKzI4?=
 =?utf-8?B?UlhMMTQybDVua25oa0R2dDBtRm5GcWs5YUdWc2h6ZHZFS1BQekhwMm5tbGU2?=
 =?utf-8?B?ZkE5SE9QVGRId29SeWw1QndYMDFxbzVpL3huaUVacHlPMzJzOVFEbWExblk1?=
 =?utf-8?B?UFNFMDRnSExsVjlYTmduWldwb1RuMXVJNEtSaDFWbEd2SCtVWStzRURKL2RY?=
 =?utf-8?B?ZFFpZEpoUHU5U3Q2eTdKY1dhYzgzOWJIVlljZUxvWVdVMmNXQVNURjZpbmdP?=
 =?utf-8?B?cklNVDRCaFBxWkZ4TllTK0lzTlVwZm5CU01WMm13NkxSV0lVb1B2Mmg4bDBB?=
 =?utf-8?B?ajJtaWZkSHYvdlhUMklmQWY4YjB2T1JQQkxNUUNvWHZiQUR6VnVCSXF6Z09z?=
 =?utf-8?B?bTJYcWpvVGtQQlQ5UmNwV2dka0xUVVM1R1lYVWhZellLdlh2Nk5pbjRIVFFo?=
 =?utf-8?B?VFIva1U0SjJOMWVJYS9FdGtGMG01MjNUM0x5TEUvL1U2eEppRzRPdGUvZUN5?=
 =?utf-8?B?SHZYVUVUaUJRcHNaa2RzZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5447.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTY3R21TSlBWWnhjdkJCa1crVFduUHo1SERaMmJOME9hZWNOdGNRSmxGWm9w?=
 =?utf-8?B?MTI5ditNUDNvSzdnZ0hTSEkxTXR4YnNacDlFWVRmcStCRzlvWlBMTkV5ODRW?=
 =?utf-8?B?dUdLUkJQZ0ZZVFpSbU1tSUJXZEN2SDVEWlNlVythLzlKbklhc3dsbU1uc09j?=
 =?utf-8?B?cStjR0hQYkxyQXBOaXA0V1FLcGpEdDUzejhjbjB6bXVNUzJ3dFlHVzJlRjd0?=
 =?utf-8?B?WVNkUE52VU40c2tUakkwMVlDM0hLcE5sbmFabVVPMmdHR3dKRWI3TjJnODNZ?=
 =?utf-8?B?M1VBWHlPek1yWXIxLzd0MEY0VWxKaGFwM3pROFY4ZWN2eVdmODJncFVnL2kr?=
 =?utf-8?B?eCt1TXJFRW1neTl3MDBlRy9UelFocDlpYkFsaXRsNTkvTmxqeDJ2OWtZTzhS?=
 =?utf-8?B?ZmtEVGlIOWZ3cTZvZnY0cEowbTkrQm5YYjZOMithNGtKRjlEMXBqQlowT0lw?=
 =?utf-8?B?Q3FyUHNPMVMzbzRCMGlCYlFiTGR5dlZwcnpQbGptYnpuUkJXTGVseEUrWWFz?=
 =?utf-8?B?SDU5b3hxQmxUQWllVEhwMFpLaTNoYlhsZG1WSWtQMWthQXd5OE1VYmxPbTNt?=
 =?utf-8?B?SUhZd1Y4SFJGNGI0MklhVW1YN2JYZHllMU9BM2QxWWljaS9BdzhCOElWR3N0?=
 =?utf-8?B?TU5hVlJEb3dSNW1yZjc0MGVTZitZR2ZFRUNEb2c2bUR5RnQwN1lrT09pWUw1?=
 =?utf-8?B?L2kwMUJzUDZpWXVEYk9NYnd2Q0dBWDVzcGdtMGkzcWtDR3ZMSThiM09hK2ZX?=
 =?utf-8?B?RmRMWW1NamFqTmtXRVZTUHdBZERkYzBBQTlmcyttV3ZBTUZweFV1WWhQSENX?=
 =?utf-8?B?WS9UaFd4RGlLbjUrVFU3WkI4RVpFMVZJOTFtUzJET0dBWGQrNlNEdGswSmcz?=
 =?utf-8?B?UjFOWkg5QVdMWTlGRmZjQitSQ0h4Ry9JTCtpbEladEptZndkMmY4QmNDSzAv?=
 =?utf-8?B?T0FoK3NmYVpxRkpzN3lPMlV6WURKYnUxa2E0RHNRdmlsWnVPVUdaeWh3WEhm?=
 =?utf-8?B?S3c3d0thSXBEcGMwWWE5Uk5lOXlkbm9BeExvd2lKaGc1M0oralpPMDFEb0V0?=
 =?utf-8?B?R2l5WWJBbHZsRFFnQmQzYWpseWgwUFRCN2NQeStPdE0rY0Nlb1FHR1E0T0p6?=
 =?utf-8?B?Q2JOTzdScm0rTy9EV2RTUEpkOVdsMGE0VGdYRUg2TiszbXZNR3pQZFN4c0pI?=
 =?utf-8?B?ZUNQTzVYd2lYaXl1TTRtdGdoQXpDZkFSOEFVMXp6aVYzWHdGVmF1b3I4Sk9P?=
 =?utf-8?B?OERySFIvME1PUXk3MXRCT3BHWnpmL2hVNDYrelc1TWpuam53RkR2cjBKbnpB?=
 =?utf-8?B?elEvTjllMUdXWHRtaFc2d29yRkx6UXY2WVJDUjdpQTJpOTY5Z3h4RUFMZDVP?=
 =?utf-8?B?MW04SmRLUnUwei8yNnUrbU01MWprejF3Zk04Z1JQdXR3MEVDV09uVWhuVTZz?=
 =?utf-8?B?TExBZHBPRmY3RytTOWw1QVFVV2lQMWJSdmFQYXR6em5MRzNOUE1rWC85RGNj?=
 =?utf-8?B?a09iYVExUG5VVlg2M2FSbXo0SUFhUEI0NlVCU3dRWHNWVHRJZ2tMY3djT0Jk?=
 =?utf-8?B?ZkJrMVZkbThaTkNxOFhyZGNQS1pjWFNudFU5UGVUNUE3ZXlaZmhvS3pjSzUr?=
 =?utf-8?B?Q1pYRC9DTHN5SEo4OW1JUnUxdDQ3Ykd3dk95blZvcERSVVM1SnAzbElQbFVP?=
 =?utf-8?B?ZEk4R0N3d2lSb2tRWUxkSngydWZVUTdlOW1oc01GWTMzNW54eXFSak1pRzF4?=
 =?utf-8?B?RVVQbHpIQmN3WjZ5QktIeFc5ZnFlWFdjU0VPYUQ4Q1QvYU9nUWQ3REcwRFJv?=
 =?utf-8?B?c0RhQWZCd2ttWXo1VjR2bnJGTTR5OGcySVBJT2hBelkwWUZVeDFCQmZGdWF1?=
 =?utf-8?B?NGhHUmFWS2p0cVptZktsb3dKckU4RHhsYmNxYytMWGhJYVhMN01OeHNNZWJw?=
 =?utf-8?B?M3Z0N0ZNZElONTVQNERTSmJIbHp1RGpaVE5NSFpMUzladDVmeEZ1dlNaRnZz?=
 =?utf-8?B?MlVzemtWOUlKSnBKR0p1bVhRbVJ2aHo1TDhUUVNmN0pWWXVubFo4WXM3bVkv?=
 =?utf-8?B?YWdnTEVudzMzV3Rpc0lHODVKNktRMVA3QmJONGJaK3Jwa1k4WFdrMkpMZ2hk?=
 =?utf-8?Q?Ltmk2IKFQVLleOBgkvdiJrh0I?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c69a6455-28ff-448c-4c75-08dcd8762996
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5447.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 06:41:59.7115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ioCKLq5wl1BS6lTAmGf16IP7idQcmbZsurVZ3u/MYUmb7bhzLgqg8yJPKIFRHS4ubZSExUlvlKuilaBUrecDFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6640
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


On 16/09/2024 15:58, Christoph Hellwig wrote:
> On Mon, Sep 16, 2024 at 03:33:20PM +0200, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> In order to store device DMA parameters, the DMA framework depends on
>> the device's dma_parms field to point at a valid memory location. Add
>> backing storage for this in struct host1x_memory_context and point to
>> it.
>>
>> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> 
> Looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> I guess this another thing caught by the WARN_ON in the dma_set*
> functions?

Yes indeed! This works for me.

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic
