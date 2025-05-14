Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B7EAB6D43
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 15:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C79310E63E;
	Wed, 14 May 2025 13:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5iwIjjO9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF51A10E63E;
 Wed, 14 May 2025 13:51:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/5Qx4jQBV8XciC9JfqWOINS4i++niCwa1Ih0NUCVrLp+qXCU4gSZdcMs9Nw2Ld/04R0BmXnK68Lku+RkwXJU0KFXERJL1op0OnC/2E+ixwYSCSxRhUehLKcHfhJJr5vqgraVBCEAajakjScYebvANkbk1E+3SFQXb3ri9aYDiaSOMREc+gzWhMj+CN7qj+7hLqAcbVFdZA9qMfOszdTBvK5qtb8A2nBSkIWaQWScL//1W6BIcNUgaGA8w0Z6+E3wvZuwknayeO2ADSuv0YNaDQeXbZVt+CfabOv2QeTCh97b8xyanVar5BQqBBf+d+So5ap6E7bjIRwzOO4hF+ZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqvRAzLRbIKUpy/IlPRrSU4fIOtO92ZCAIo1vAE9RKQ=;
 b=PLTHakgZQdOSZjsfMNa2+6JHNPzr8LhExpIOMSwbBpeBeMF0pdh0iRhbnSHhEmbjK4YivxdjnQ0F38td1KuMOVfuwPuFqPF1VSjhhPdhPSFGptpADy7JCrJvnvIV79kG6fIutvLFOB8yMmdJD6zA/W9Yhoci7HJP5ZPk1kF4Ty/dwpUJkMzQk/F+u4hfcfXW6R9kdZSuYEYUkoVsZYtY1WbzVwP+Vd5ByzLm+vsuuS1zvkw/ghSnYndlNpXZxqhvKGADPeWZlQpJlmDhqfoYmmJ6tcnrAd92u42YXpsseTU7VZrY5EacKzKpi7g4kCruBpS8aE7rg6Hz8F39p392+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqvRAzLRbIKUpy/IlPRrSU4fIOtO92ZCAIo1vAE9RKQ=;
 b=5iwIjjO9WxatFsvTHWDKbdCeDDfC/ATIPOzrSAkyifQ/kU6YSLwE71uWJVb4831uQavdrQfs8NA1WA6MREfyVlqSdqwcGrdi9g3XJ14XMFho52/6ZxyIuSYuKUvz30CdzyVUR9HB1UBIm9PB3bOkwacpuHm8motU6hgB+QPK5Lk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB6863.namprd12.prod.outlook.com (2603:10b6:806:264::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Wed, 14 May
 2025 13:50:59 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 13:50:59 +0000
Message-ID: <00d3e903-76fe-463d-bb5c-232e4dac4bb5@amd.com>
Date: Wed, 14 May 2025 15:50:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 07/10] dma-fence: Add safe access helpers and document
 the rules
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
References: <20250513074513.81727-1-tvrtko.ursulin@igalia.com>
 <20250513074513.81727-8-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250513074513.81727-8-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:208:52f::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: cb66133b-cb39-4e40-3c1b-08dd92ee5bbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eDhjT3p4M0pHVnRhd1k0ckxwYXo3KzB2UTNIMTNTSm5IUWFQVkE4ZzlWSUtp?=
 =?utf-8?B?NnordUVBR1NlV2dUS0ZkSGNXb2lUQ0JUL3I3RGlodnlrYzd5dnRTQjhTMGRI?=
 =?utf-8?B?NFhiTVdtQTF1d0VLZjZ5dFpDN3ZCNWVLUTBUU2RBYVhXNXJZUXJXY3M3WHdL?=
 =?utf-8?B?OUliVzlYZ0FReC9vbmFHSnVRNjMzOVoxVElnMzRiL01GU3l2eGNJQjJpNlgy?=
 =?utf-8?B?QkpIMTdaaWQ0dklUL085OXErQzdwNGlxcytYQndxYy9BbUNaY3FYNit4Z0E1?=
 =?utf-8?B?YWd6dXZzVGpIZEVuRDRLYTRvSXlYa0duNkY5cTN4b2dLd3h6cHFtTTlHMjh6?=
 =?utf-8?B?eTh5eEhNOGRaTEtYTTQrcjVvVmhsVXJDNnorZnYyTDA0Q01tR2o1aXRXU3po?=
 =?utf-8?B?Q251VTZVbXR4TEorb3VScWwwa2tVUk9sSlJMRDBPbmJHTjdYU2kybjVEMC9V?=
 =?utf-8?B?YnZXTVc2aXQxVU1ocExyZ29lUkNZMC9YTVBqaXRKK3hjbmVRSnZEeGpMaXdh?=
 =?utf-8?B?Qmt4QXFJRFpIbFczU1ZsVTM5MkxRVUMxd3p0VkQ3Sk01NTZHRWpVVEF3eTRO?=
 =?utf-8?B?a29va1BQajNnc0hmZ3F5d2ZzeENMejZ5YnpENW1IUUY4UXFaMjdwSXVCM1Y3?=
 =?utf-8?B?T0ZDSGdVemk0MXFXTHh0UFEwajIyazVXZFpPVGJiZWdWNWZ3bndlZkt5SkpM?=
 =?utf-8?B?eFB6WWo5M05IU0hRcUNOMzcrUEx6OE8wRkQxMm03U3hoZFNNbk05VDdxK25j?=
 =?utf-8?B?ZUJCVlAzQTBPUmpVOVY1ZzZyR2kwaGJtUWlKNzd3cERqcE56TTFRb0lkcnJU?=
 =?utf-8?B?RWZ0YWhVMmNJNzVvTktUWU1KLzZPQ1lkTUttRngxb0JmKzNHSnU2cjEraEZR?=
 =?utf-8?B?ZGJFSGdtLzZWZmR6aFYxMERmbGl1c0xWa2NnbkkvMXQ4TmxKL0F2YXFIcXhr?=
 =?utf-8?B?V0JTR2Yrd3dFUDBOUkZRZDNXczkxY08zellIRVJqTm9DMXpycVhWSGY1WHFQ?=
 =?utf-8?B?aWNjSlJwVWFKbWoyV2hpVzRJZlh2M3Y0MDNoSzJZalhmWFhQQ29LcCt1TzRx?=
 =?utf-8?B?RE1SSm9IOFBCNi95Q1djN2xWS0dxajZJRWZ1Snk2WkJGWnZucHBZditPczM2?=
 =?utf-8?B?NHhDQTFOanJLVnMwdCtYWm9nTWMzOWQrUzNNL2lzMjNPaSsyc29aZFlNWTND?=
 =?utf-8?B?U0JFVUVLNmtXMlZoeFJ4U1U5NXhwUmJPeTg1eGlLM2xiU3dFTGIvRkFHVkh3?=
 =?utf-8?B?MjNkM3NId0RFRkVvNU5BSHZnODUySG1xOXF1QkVzM2hqaUVKWEVFdDNuMFd6?=
 =?utf-8?B?aktrdDJaRmxNdUtXY1BwS0ZYemJOeTU1dWp5dmEwOTJoNW1kRGUvTngwbU4y?=
 =?utf-8?B?TDhWbXI1NG1HL0dBRWoycDFYNkZlUDRtV045blY4RGhMTm1XbDhCUTdrbUky?=
 =?utf-8?B?NFhXdTYzQmNNTVZwMlFYdnIySGRDS1BhQmVWaWhYYlU0djVQc0czVzRQdkhP?=
 =?utf-8?B?ZDRpc0swanBFdGd3UnVzWFNhc3Y3YU1kc2xQQmhxRGI0bG8wU05RS3Nydyti?=
 =?utf-8?B?aHhJTGpxMlFFQy9KRGJEalR6bzZNSnM4Vm1sYUQyRWFvV0tpemZzMkFhT21T?=
 =?utf-8?B?eVRQczdmdW9LTVpZbWdDanM4czFqc1krRVZSb0k1N3dtajNnSEVOUXMrdUFz?=
 =?utf-8?B?WjBOVDFmb0hkM29zRmtTNzlhenlpWENZY25wUmJVQVVmVGJsUGE5b1BvVk9h?=
 =?utf-8?B?aUFUa2VpTmJZdU5TY3RQa1J1WnFvUUI3eWlub04rbENTSHUyMENKclFNV2lR?=
 =?utf-8?B?NmtzZGpRdlRtckFIUHJuQzNKdzJLQnhNQWFqMzMvRmc3QzNUQXpScTE2QlV3?=
 =?utf-8?B?bjhHL1R6cjRPWmE3bjJRU1dlc0tKd2d0dHhzZWxraWJjTDlQQzFSUjdtMTBr?=
 =?utf-8?Q?D21/dkdaCgo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmpYMVg1NEcxOXc5RHZ3V2hqaDJYTjE5KzNldkUxRWJOeDhWREVHRDAyT2Z6?=
 =?utf-8?B?bFQvaldHNDNMeFFlVS9tRFQ5SlpPS2tiOHVOMnRGUldPTWJ0Y3BNVlVwVHg0?=
 =?utf-8?B?a2xOUzdhaW5aSE1UaDJqUjJCWkFvd1hkNGFZVldhcDdSQ1l5MEtwNU5FZFlt?=
 =?utf-8?B?Ly9NVHg3WXNUaWJxWEdrbjcyRE15SFAyQzYyZTJCNWJNazA4R3pyWUJEU2JB?=
 =?utf-8?B?Sm16SVJBUXFyc0pONnUvWDh1ZXpYV25kc0poVW02WHlDbnQ1d3dxaVA3OUNS?=
 =?utf-8?B?dEtIVS84Y3k0K1owdmdHVWhIRVpSK2M1L0VReHlaMEZYbWlYVTNHWWVTOEhE?=
 =?utf-8?B?RndlcC9GTWx6OHVIRWhjMnVrNnhXbGYyTGkzcXFCZjVlK0NQL0RyTWZFTGJ5?=
 =?utf-8?B?elVreXV5YXIxZm1oclBWYTBsL1hmRkZPUkFDQ2VWU0VCcEZ5ZTRIeEFRY1Nr?=
 =?utf-8?B?bnFEcTczSUlWelV5Zk9iRW1hMzh1TnhzYW5Qemtub2FXbG0xd3pvWDJTSEhp?=
 =?utf-8?B?SlJnOEZwSlNXSWxXb2FKSWhmbkcraXdGL1RTaTBOYnV1d2p2b3l6Y01yaTVN?=
 =?utf-8?B?MHkwbmR5OW5UQVZ0OVJLQ0h1NXhROGJBZTFPblp2cFlueDBrNUNudm1peDRa?=
 =?utf-8?B?WkFNb0lRR1hDZUN3M0NXRTN2QTFWcVZ4YzJ3Y3RxV3ZaQnE3Z1QrZ21xUkIw?=
 =?utf-8?B?dHl4cm5JTHYzTDNyVjIxYWJuN1ZmTk8yekJrUU00WU5ZQTNLMG1acVIwenR4?=
 =?utf-8?B?d2pUSVQzWGVCNFlrOWhsTW5BcEdILzRFek4zWGx1R0hLRzlLRGp2QkJ2c2dq?=
 =?utf-8?B?Z1ZMT3F5Z2FRU3FHTVRRSlJPVWlCcDdUbkhFdXhXWURpUEhiZW1pYU5OK2RV?=
 =?utf-8?B?RlhCYW9PTWNRaW0rMlk5Y25iRklxbkI4MG9Xd2Q3eFlJZVpTaVJCM284OXpG?=
 =?utf-8?B?anlVZ1grcVJBczc5dkltWUI0aUVvZHZQYnoxRjBNcHBuRkZLMENaK010UkRj?=
 =?utf-8?B?OWJ6VUZDMzNXV2J5L0lwWFhlYmwvQVZFcDJxdmtieDlDRjVyZUZGS3c3QkFF?=
 =?utf-8?B?djhVZHBlV2p1Zm5iK3E4V3c3bWdxWDhMZkZ6VDV1VW5INk12RDhja0RhaU5N?=
 =?utf-8?B?cE80VktMQi9abDJjdU1LWWhkdElaZk5nVEhRTXdwTXlTNGhHUmh3UDlkQjY3?=
 =?utf-8?B?T2RFZ216T2xieHh6UGlHRmc1Z1BkYmV6OFZDQU00MXFCNXBhaFlVWUpCMitR?=
 =?utf-8?B?YmdQdG5OZmI1Y1ZYL3pHc0xlY2NBaXJCM1A1MHYvVzFUbVR4aFM0bUlsaFBH?=
 =?utf-8?B?MStqSGQ0WHRsd2hjR29IMjNLM2NDaHZYMTZJckFuZkZzNjVyRkRBeXZTSWpM?=
 =?utf-8?B?RjBpUmpyRVhTRE1JbTRHcDVHUURhVmYzcjRmYnlBZjVjaUFjQ3VMVEFIemhy?=
 =?utf-8?B?R1VwMG50REpURmY4NWhTYytkblBCR1pDWjE4b1lLTERjbTZRU2hJUFpmTndq?=
 =?utf-8?B?Nng4MFgxY1RNdjd1MWNFWHEyS25SOTNoT3gxM2VLTG5pSVlONVhNSlZHS2Vs?=
 =?utf-8?B?VUwwUUE2dGdJbE83WFVDaXBTemk1eFJuRGZzUk1USERER0JTUFVwcXdRM1hj?=
 =?utf-8?B?QllyeUpiQWVUUktHbTBrRWJoQUJVekNpMXozL2tpM3BEeGxZcDI2YXRZQldn?=
 =?utf-8?B?T3J4STBDQ0Fxek9UYm4ycXM4RERYZnl2dGd4Mnk1RS9CR2NsWXBBZ04rVk1s?=
 =?utf-8?B?QndWc0IyQ0p2bm5lejBydzVTbDhFSnpSUk9jVVhZYSt6MDdudXR2RDZUMlR4?=
 =?utf-8?B?ejdKU25nbkdwNUhhQTkwUDVlR2hucTJvaXhsekpocjNjUUpPaHhSb1VnQ0Fh?=
 =?utf-8?B?VHdrdFBHYnJ5MUlnZS9QdG1uZzBPS056OXZ4YXdDY3RJRVFSMElWdHp4V2R3?=
 =?utf-8?B?dkhDVGtkZmpZS2o2Rit4dG94L0dOWWVzaUUwM0c0Yy9xaTRSeFZOT3JEYmw0?=
 =?utf-8?B?U3Zxckt1d21PVFF4dzNzU0txdE1wZFhVaTgwK0VTbnRPTmhDODViVjRVZ0x3?=
 =?utf-8?B?K1V5RTgzNWtickhaYmRrallraHBHbjdER1g1ME11UFJDKzRheldrU0xiQlkv?=
 =?utf-8?Q?j2v4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb66133b-cb39-4e40-3c1b-08dd92ee5bbf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 13:50:59.7522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Bb2Vs+YiEB+1mCCjW0KM0lbO5STZqXGBG1VcFVKYRv1bsWdH2BcSIG8t55xzU36
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6863
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

I'm going to push patches #1-#6 to drm-misc-next.

They make sense as a stand alone cleanups anyway.

But that here needs a bit more documentation I think.

On 5/13/25 09:45, Tvrtko Ursulin wrote:
> Dma-fence objects currently suffer from a potential use after free problem
> where fences exported to userspace and other drivers can outlive the
> exporting driver, or the associated data structures.
> 
> The discussion on how to address this concluded that adding reference
> counting to all the involved objects is not desirable, since it would need
> to be very wide reaching and could cause unloadable drivers if another
> entity would be holding onto a signaled fence reference potentially
> indefinitely.
> 
> This patch enables the safe access by introducing and documenting a
> contract between fence exporters and users. It documents a set of
> contraints and adds helpers which a) drivers with potential to suffer from
> the use after free must use and b) users of the dma-fence API must use as
> well.
> 
> Premise of the design has multiple sides:
> 
> 1. Drivers (fence exporters) MUST ensure a RCU grace period between
> signalling a fence and freeing the driver private data associated with it.

That's a must have anyway, otherwise functions like dma_fence_get_rcu() won't work.

I hope that we have documented that somewhere, but I'm not 100% sure to be honest.

> The grace period does not have to follow the signalling immediately but
> HAS to happen before data is freed.

That is the new requirement we have to document somehow.

I'm not 100% sure but I think module unloading waits for an RCU grace period anyway.


> 2. Users of the dma-fence API marked with such requirement MUST contain
> the complete access to the data within a single code block guarded by the
> new dma_fence_access_begin() and dma_fence_access_end() helpers.
> 
> The combination of the two ensures that whoever sees the
> DMA_FENCE_FLAG_SIGNALED_BIT not set is guaranteed to have access to a
> valid fence->lock and valid data potentially accessed by the fence->ops
> virtual functions, until the call to dma_fence_access_end().

Mhm, how about returning copies of the string?

This is only for debugging anyway and kstrdup_const() isn't that costly.

Regards,
Christian.


> 
> 3. Module unload (fence->ops) disappearing is for now explicitly not
> handled. That would required a more complex protection, possibly needing
> SRCU instead of RCU to handle callers such as dma_fence_wait_timeout(),
> where race between dma_fence_enable_sw_signaling, signalling, and
> dereference of fence->ops->wait() would need a sleeping SRCU context.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/dma-buf/dma-fence.c | 69 +++++++++++++++++++++++++++++++++++++
>  include/linux/dma-fence.h   | 32 ++++++++++++-----
>  2 files changed, 93 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index dc2456f68685..cfe1d7b79c22 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -533,6 +533,7 @@ void dma_fence_release(struct kref *kref)
>  	struct dma_fence *fence =
>  		container_of(kref, struct dma_fence, refcount);
>  
> +	dma_fence_access_begin();
>  	trace_dma_fence_destroy(fence);
>  
>  	if (WARN(!list_empty(&fence->cb_list) &&
> @@ -560,6 +561,8 @@ void dma_fence_release(struct kref *kref)
>  		fence->ops->release(fence);
>  	else
>  		dma_fence_free(fence);
> +
> +	dma_fence_access_end();
>  }
>  EXPORT_SYMBOL(dma_fence_release);
>  
> @@ -982,11 +985,13 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
>   */
>  void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>  {
> +	dma_fence_access_begin();
>  	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
>  		   dma_fence_driver_name(fence),
>  		   dma_fence_timeline_name(fence),
>  		   fence->seqno,
>  		   dma_fence_is_signaled(fence) ? "" : "un");
> +	dma_fence_access_end();
>  }
>  EXPORT_SYMBOL(dma_fence_describe);
>  
> @@ -1033,3 +1038,67 @@ dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
>  	__set_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags);
>  }
>  EXPORT_SYMBOL(dma_fence_init64);
> +
> +/**
> + * dma_fence_driver_name - Access the driver name
> + * @fence: the fence to query
> + *
> + * Returns a driver name backing the dma-fence implementation.
> + *
> + * IMPORTANT CONSIDERATION:
> + * Dma-fence contract stipulates that access to driver provided data (data not
> + * directly embedded into the object itself), such as the &dma_fence.lock and
> + * memory potentially accessed by the &dma_fence.ops functions, is forbidden
> + * after the fence has been signalled. Drivers are allowed to free that data,
> + * and some do.
> + *
> + * To allow safe access drivers are mandated to guarantee a RCU grace period
> + * between signalling the fence and freeing said data.
> + *
> + * As such access to the driver name is only valid inside a RCU locked section.
> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block guarded
> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
> + */
> +const char *dma_fence_driver_name(struct dma_fence *fence)
> +{
> +	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> +			 "rcu_read_lock() required for safe access to returned string");
> +
> +	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +		return fence->ops->get_driver_name(fence);
> +	else
> +		return "detached-driver";
> +}
> +EXPORT_SYMBOL(dma_fence_driver_name);
> +
> +/**
> + * dma_fence_timeline_name - Access the timeline name
> + * @fence: the fence to query
> + *
> + * Returns a timeline name provided by the dma-fence implementation.
> + *
> + * IMPORTANT CONSIDERATION:
> + * Dma-fence contract stipulates that access to driver provided data (data not
> + * directly embedded into the object itself), such as the &dma_fence.lock and
> + * memory potentially accessed by the &dma_fence.ops functions, is forbidden
> + * after the fence has been signalled. Drivers are allowed to free that data,
> + * and some do.
> + *
> + * To allow safe access drivers are mandated to guarantee a RCU grace period
> + * between signalling the fence and freeing said data.
> + *
> + * As such access to the driver name is only valid inside a RCU locked section.
> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block guarded
> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
> + */
> +const char *dma_fence_timeline_name(struct dma_fence *fence)
> +{
> +	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> +			 "rcu_read_lock() required for safe access to returned string");
> +
> +	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +		return fence->ops->get_driver_name(fence);
> +	else
> +		return "signaled-timeline";
> +}
> +EXPORT_SYMBOL(dma_fence_timeline_name);
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index c5ac37e10d85..b39e430142ea 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -377,15 +377,31 @@ bool dma_fence_remove_callback(struct dma_fence *fence,
>  			       struct dma_fence_cb *cb);
>  void dma_fence_enable_sw_signaling(struct dma_fence *fence);
>  
> -static inline const char *dma_fence_driver_name(struct dma_fence *fence)
> -{
> -	return fence->ops->get_driver_name(fence);
> -}
> +/**
> + * DOC: Safe external access to driver provided object members
> + *
> + * All data not stored directly in the dma-fence object, such as the
> + * &dma_fence.lock and memory potentially accessed by functions in the
> + * &dma_fence.ops table, MUST NOT be accessed after the fence has been signalled
> + * because after that point drivers are allowed to free it.
> + *
> + * All code accessing that data via the dma-fence API (or directly, which is
> + * discouraged), MUST make sure to contain the complete access within a
> + * &dma_fence_access_begin and &dma_fence_access_end pair.
> + *
> + * Some dma-fence API handles this automatically, while other, as for example
> + * &dma_fence_driver_name and &dma_fence_timeline_name, leave that
> + * responsibility to the caller.
> + *
> + * To enable this scheme to work drivers MUST ensure a RCU grace period elapses
> + * between signalling the fence and freeing the said data.
> + *
> + */
> +#define dma_fence_access_begin	rcu_read_lock
> +#define dma_fence_access_end	rcu_read_unlock
>  
> -static inline const char *dma_fence_timeline_name(struct dma_fence *fence)
> -{
> -	return fence->ops->get_timeline_name(fence);
> -}
> +const char *dma_fence_driver_name(struct dma_fence *fence);
> +const char *dma_fence_timeline_name(struct dma_fence *fence);
>  
>  /**
>   * dma_fence_is_signaled_locked - Return an indication if the fence

