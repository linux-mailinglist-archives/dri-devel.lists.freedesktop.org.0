Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C413CB26549
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 14:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD9510E1B0;
	Thu, 14 Aug 2025 12:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dFLVzx/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2070.outbound.protection.outlook.com [40.107.96.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5286310E1A8;
 Thu, 14 Aug 2025 12:24:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMX2KBcAfCqSu+CpLFJ++fDXEB4f7fHc/64boGaHeSCc4TtM7IfTxq7CG83tVTcpezgkLYKzCyTn4uQzgNHk1mer8cTdphFFjihfMe3lYmM4YLzhZ4Rmf7doD31s8a3ayRuF27FHX4DxmZTz8KhZcmJtWj235JY6NbL8XijwcsS4FCsb/CP/DVgjABKUvwC7RWWNyJRcA7nP6U8PE/+jHLoFVSlYB6On9AsYDz5dmRuFpmJqSRwC2nsenho1OsK+OEkzUWq857JSrkYj9XAs+EijbLO4Syg8s+EEJ3Qi/0XZyZol8Qd7TOh7Q7c0yPD1dc3rd6CJ9suLYwo9RNEn2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTe+L7XMd2CNjA7mkTw9vjEYj/5euu5XrvJzx+khWmE=;
 b=OlOcST+VdEOhRUSyCyXMQ+zoVibhapz2OEaQk3JijSZs3IbU+hGLpGdqH/rpaDzXcfgsXnr+6ssYVnLqm+B11KY9ub9vD8JblOEyfytFETf4qfyz8hQArW+WfeiZeChTv3uNpGs6e7HIs5KrMHA5JE1zEf9hBz+97inSorcihDr3qV/VV1co+0qVBmke4jk5Z+WpDDrUhAWk/rDciERo4A00hx82Dnpxk9EFfbf8Z/DX0QJCq50ObNVs6S16pQki/WAH2ynr5XV2Vj2EajU9Wit9k6aIAVvHX70AcrL8bUqRXuZw2+/iDlywhtiL+zIBBIPMqoZvjbZfAEpYXTYofg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTe+L7XMd2CNjA7mkTw9vjEYj/5euu5XrvJzx+khWmE=;
 b=dFLVzx/lxSLgigXs9rznXqRHWqIBxOXKHitMYWGoFnqWKMvzyw3OlDq/4hsGOsWTZb0kum614fphEEHum2pHXPnCv3G11ZuxGleWi02CqoCl7dcwNzCKLsTKQ8VXtn/dksvW5Po67y1i4OXgTy49z9uLQDSQsp0OhMrIFy3gIn4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5819.namprd12.prod.outlook.com (2603:10b6:8:63::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Thu, 14 Aug
 2025 12:24:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 12:24:34 +0000
Message-ID: <0920872a-6f8d-4301-b9fb-c8fa54b7ffe7@amd.com>
Date: Thu, 14 Aug 2025 14:24:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] dma-buf/fence-chain: Speed up processing of rearmed
 callbacks
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20250814094824.217142-6-janusz.krzysztofik@linux.intel.com>
 <20250814094824.217142-10-janusz.krzysztofik@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250814094824.217142-10-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0385.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5819:EE_
X-MS-Office365-Filtering-Correlation-Id: d7554c83-2685-499e-691f-08dddb2d870c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L05Qa1lZSVpxTXA1TVJONDBVS1FMSzExSEVQYjdKZ0tzVHh0dFRmeTl5dko4?=
 =?utf-8?B?TFFtRGUwTUZTOXEwTVVXYWE0RE16aU9nRk11WUdrWXhMK0VKTTNCZ1lSS1JL?=
 =?utf-8?B?NUdpWlkyWmhzNW83S0JEeXpZVEVJSm9wWElDYWNaWG5hYklSZGN3cU4xS2Vt?=
 =?utf-8?B?RDRhYWtDTVQ2dmRVWURwOXVGSGtFWEdMejRna1JmTVg3R3B3dWQvb2I5TGhX?=
 =?utf-8?B?cnF1YWUvZWgzaWtrNTV0MnhBNms2U0dzNHcvQmN3YU9YQ25IY2NYNGFLZkhN?=
 =?utf-8?B?UmRzS1ZXSkkxenZoc1JBcG5jVFRiU0hrQ0tYNUNJcDhCbUxVeUFZVUs1dS9E?=
 =?utf-8?B?dGVkNVF0TUozNjBOSzlXQXA4OXNwOXJrckl2U2R6aU4xeWIzak94c05qU3pG?=
 =?utf-8?B?VjUyMXIrN3o5SGd5Z1JPTERTM3gzVmlyYmVBUklEdW9CV2xxbDdscG9qREVW?=
 =?utf-8?B?Z0xwbDd5VXVNSEN4V00weXE4NEY3L0wrTVJ1V1NOdmlCWmx6dXl4ZmdQdmh6?=
 =?utf-8?B?SXJCRFdtck05b0R1VWQxNWRGR3IzNFNHUTNSVC9BNW1XeCtEK2NyeVVlK3RB?=
 =?utf-8?B?QzU5TTV0TDdBeHhEVzdRY3gvcTcrRVc3bkRlSEt3Zy80QW93R1R1TlhzcFNB?=
 =?utf-8?B?M2JxQzZ5a1picUNEdGNmVm5KaEZIRG1uVHhvMXdoeHI4RkpIVTZnK29CNURy?=
 =?utf-8?B?b29vekF6WEtVQy83THlhc0I4WFJlU1BGVmdXT3l0UzVvc1NCZHFDZ1N6amU1?=
 =?utf-8?B?dFBMZDhwOXpQNkFLWklHaVhlRC9vUC9xZmFLTmtFQVdIbkxlVTR6N1J6bTN2?=
 =?utf-8?B?SHRUcVZCRUNPY002VFhjcHJPaXFpeGNuTEJNVzUyV2syK1hWUk1zeDBLOWFo?=
 =?utf-8?B?NHdzRW9kQnlVaC9xc0RqYnpjQlAzSzBIOVhvWThWbkRaOWlONmxUcCtzN2lD?=
 =?utf-8?B?SzFDQkQyY1Q4TG0vRXVyZG4xT2l5bTFwQkJTZ3ZyMlVueklNMWJVcW9ibnla?=
 =?utf-8?B?NjhsZGFsdDl5UU04amNtWHFCTy9BdkMvdDJtcVN0R1FFbm8xR01UaXJQYXVw?=
 =?utf-8?B?UFJkWGVmTGw5cEN0Q3ZFdmhSRWlvZWxXb2xCL1kwUElZZ3NoSS9BblZzc0Vv?=
 =?utf-8?B?SzZRUVMwN3FseDdGVzJoZy9CNkRiOTFXNXlMYlNnZTVCMGNMS3E0YWk1em5I?=
 =?utf-8?B?Mk1iWFp3VWJnQWFOMHdUOG0xTmVDVG16eWdBVk11YlMwMGtZMnZ0bmQrZUJz?=
 =?utf-8?B?cUVEYys4d2dBWnVXeWZlOW5OVVBiaGh4TlREOVV3RDJVSktiTlB0QmxPQnV5?=
 =?utf-8?B?enorT1hZakIvakw2ZzRlWmsreGNUcVljeVgzY1RQWGpHeDJZV1RId24yM3RL?=
 =?utf-8?B?MFh1NEJSMEV4dFFEb1ZmaEFkTHZVUzVFeHJPeUxmSG1Wb3BzYXVUNVRzRi9w?=
 =?utf-8?B?ZTRmbHh2MEw4bTdyTFphQnpNVERtcy9hUzNaOUtRMG1kc1VjNFdLaXhLV0l3?=
 =?utf-8?B?eC9BWTZheFg0NHdBL1R1U2hURklkRU4xU0M3c0J3eng4MjdkQzZyN2JnVG1u?=
 =?utf-8?B?c3ZwY0ErWGJ4c2kwYmt5WlA5enRYS3ljeXlHYXJ6M05OOFp0a21nbXdoT1NU?=
 =?utf-8?B?THplQVFyejNDUGV3WndEaGhEeG50SW51N01lVTdOcVFGNTcrWEJWTlY2RnF3?=
 =?utf-8?B?UGhYODdoTkhNL2V2ajF5akh4Y0xHZnZsUHlpSGVvbWJ6VTUxL1pSTFpYMWRq?=
 =?utf-8?B?a1Z0NGIrMzAyZEVLNHRHTUZsNU55UnQwY09EOWNPOFZKU24zNGJ1c1RtNFdN?=
 =?utf-8?Q?qA5Wud1i8EUx+Wfj/XnwOEFchhXal3wfgD7lo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGJjblZaTlduZTlhRGVIWmJaTC9wN0YxSGJMWGxTVk93WE9DdU1aZGk3L1RP?=
 =?utf-8?B?RlZNclBkTWh5NHZndVdwWkJ3aEQ5c25xREVlTWVOTTlpR0NBME43TFQxb044?=
 =?utf-8?B?Q0s0WmE5MURXYVFSVjlLVmhjS2EvZ0NldkVXRWd5NFdmd3RvZnk5dmQzK0Rw?=
 =?utf-8?B?WVFmRk9iQmNJeHQ5TjZDVWhCc1YzamUzSyt5V3had2F1U3VMZGZ6cGNnaGtR?=
 =?utf-8?B?WlFPa1NHSU41WHc3MmNXTVZWK2RHSk54bUp6d2FMQU9uZnp6dG5TdWhKMkpj?=
 =?utf-8?B?bEJFVmNjZHBiWGR0ZE94WFV6TzVTZ1FxT1pRR2hpV2RhNm00V0N4NVZzenNi?=
 =?utf-8?B?VVhuZ1pGMHVnZjVEK3V3NUMrZDhTaStrd3h2VU1Pb202aGgzQWhRdFlNMkJZ?=
 =?utf-8?B?NlFXTENmZUxNSjhjcVdLV0YrUlhoQ1RTV0grRFBwbU9ISjZhTDU4OStsbFFu?=
 =?utf-8?B?a2lBK0Ewb040WHcwZm1sSXE2OFo0b2kvY1RwNlVka1ZPN2Uwb0RrdjNmZWt1?=
 =?utf-8?B?RnB5L3czaGJMWnJRUGJXaFNsQ3IrbXRoclI2ckZFd1U2Y0FrUTlKMm1xam96?=
 =?utf-8?B?WHo1cW84dUR1eVRIV0tBMGwyNWs4dHB5bzJjZDFJbWVwb0ZKQm9rNE9LbWQ2?=
 =?utf-8?B?eHdnNlRLQW9zR2dwQm9tdG1mQWYrN1JmQTNKZWRVVUc5TkNSWWVaakkvU0tL?=
 =?utf-8?B?ZnY1RHlEaU8yRUtjQWQ0c0ZDbjVCNmVmcDR1ZHpYRzZTdWhLbEVrQWNQdHE0?=
 =?utf-8?B?SzJ0emJmZ0tWdzNjRGhEM0VjQWE2OE52RzBpd0JnRDl5WVNRbFhFNDZEbG1h?=
 =?utf-8?B?bFJYY0QyTzlLRWlUNkU4SWNpTUdzeTJjbDliVms2MHY3RjNoWnVXaGI0Tlcz?=
 =?utf-8?B?ZE1LdVYzVC9tcFZGSkM2TGhUREVTVVBJaTVMRXdNRWV2OHhHWWNPUEJiVXkr?=
 =?utf-8?B?WVBZc3FtYUhSVTlxQS8xTnpqTHlDbWNXczVQbjFoNm52bXhkSmZsWDBqaDhw?=
 =?utf-8?B?UHR2UW1nVm5yNjNzcUl2ZlhSeHpDMHZtNG5BY29BRXNMV2k1S1N3QjlBa2xM?=
 =?utf-8?B?UjVwUVhVQlA0bXFnSGF3ZkYyS1V1TGVPelM3eTdwbWFjcmhkSTB3c3NPZVNV?=
 =?utf-8?B?UUZVY25uU2hOTGs1QlRBaXBveFREbzRRRTFsbkNOZU03Y1JqQ2xvQkIweUsr?=
 =?utf-8?B?dlRZNURPbmtNdWdjUXl2UnJTa01NOTR3SmZha3NlOTR5QkN6bTlraXAzSG5z?=
 =?utf-8?B?NGY0YnNQaU1XVXRQMVJkOGd3OXFjNWZraHhQTVhCcUZJRE96UnRxbGwzbnhL?=
 =?utf-8?B?NXlaZmVzQUFlSXk4aFJ0c0ZnQ2tJcWNwZVowWDRjdXlxNi9aSzJlQWYrMi9s?=
 =?utf-8?B?Wms0RzFhb3F0a3MwdXJYNm1EN25rZ1BXcVI5RXoxMjNWaU55MEplZ1R3bmxl?=
 =?utf-8?B?aXdWWkFzVDhDUy9MbmoxUkdlN3ljRmpFYXFhK3N4OTdMNEVnL3ZNWFJIZXlS?=
 =?utf-8?B?MUw1djVqTWNPOHFKdDlYVGhwZjJ3VFF2dW5QYVpMK2ZrYW93K1czQS92QkdM?=
 =?utf-8?B?SGM3ekFydDdlT1NIOFBXaUt3SWFvUnc2N0JIU2wra3g1NzlYN3hRZWcxQmVT?=
 =?utf-8?B?SzB4RmZrN0ZCWmViWVc1Wkk1Y3lDWlFYSlloZjZPWFkzZGtuajduRWVwZXBi?=
 =?utf-8?B?aTdnUUV6NC8yM0x6QUpGMGc0cXFaSisyRlZpa1ZDSU4wNDJzWDFsTGhLa1dl?=
 =?utf-8?B?c1U2aHM3Z1E1TVBBUjIwMUhaZzRxL0xqeWd1eGlqeS96QlBMTnJSTkRiclpX?=
 =?utf-8?B?LzRQYThQWURDQzhZU2xrZ2xSSm80cG1NL21aYlVtTU4zbmtaQlcwVWhnakhE?=
 =?utf-8?B?bHVSdXBPblpTdW91dXR5UTZHdVZmMzV2ZHhkQmZHZGN5WnNOOUdISmt3S01i?=
 =?utf-8?B?T2x5U2NxeVZ4amUraXR1cDRzbmsyMnU5RXN4a09KeU1OS09BdDZhSHdsdmVs?=
 =?utf-8?B?YkR1dWZOSUY0OHlPd0VYbXZBU1lBTTRwVmpCNEhYUEYyby9xUEhUSGNIb3M4?=
 =?utf-8?B?dEwrVFNrOXN0S1pOcEN4TitTcG5jS1JCRXhyK2pJUm5peU01UG1LemIwZGJD?=
 =?utf-8?Q?HBkFWsa0UNx9vKTzVnWO4kM7n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7554c83-2685-499e-691f-08dddb2d870c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 12:24:34.5791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjnhoInGmFFcVAczUMHOCj7Bh2PYIH7VoEQeo5ij5buFzEdyD0qditLPYpEz5gQN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5819
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



On 14.08.25 10:16, Janusz Krzysztofik wrote:
> When first user starts waiting on a not yet signaled fence of a chain
> link, a dma_fence_chain callback is added to a user fence of that link.
> When the user fence of that chain link is then signaled, the chain is
> traversed in search for a first not signaled link and the callback is
> rearmed on a user fence of that link.
> 
> Since chain fences may be exposed to user space, e.g. over drm_syncobj
> IOCTLs, users may start waiting on any link of the chain, then many links
> of a chain may have signaling enabled and their callbacks added to their
> user fences.  Once an arbitrary user fence is signaled, all
> dma_fence_chain callbacks added to it so far must be rearmed to another
> user fence of the chain.  In extreme scenarios, when all N links of a
> chain are awaited and then signaled in reverse order, the dma_fence_chain
> callback may be called up to N * (N + 1) / 2 times (an arithmetic series).
> 
> To avoid that potential excessive accumulation of dma_fence_chain
> callbacks, rearm a trimmed-down, signal only callback version to the base
> fence of a previous link, if not yet signaled, otherwise just signal the
> base fence of the current link instead of traversing the chain in search
> for a first not signaled link and moving all callbacks collected so far to
> a user fence of that link.

Well clear NAK to that! You can easily overflow the kernel stack with that!

Additional to this messing with the fence ops outside of the dma_fence code is an absolute no-go.

Regards,
Christian.

> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
> Suggested-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  drivers/dma-buf/dma-fence-chain.c | 101 +++++++++++++++++++++++++-----
>  1 file changed, 84 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index a8a90acf4f34d..90eff264ee05c 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -119,46 +119,113 @@ static const char *dma_fence_chain_get_timeline_name(struct dma_fence *fence)
>          return "unbound";
>  }
>  
> -static void dma_fence_chain_irq_work(struct irq_work *work)
> +static void signal_irq_work(struct irq_work *work)
>  {
>  	struct dma_fence_chain *chain;
>  
>  	chain = container_of(work, typeof(*chain), work);
>  
> -	/* Try to rearm the callback */
> -	if (!dma_fence_chain_enable_signaling(&chain->base))
> -		/* Ok, we are done. No more unsignaled fences left */
> -		dma_fence_signal(&chain->base);
> +	dma_fence_signal(&chain->base);
>  	dma_fence_put(&chain->base);
>  }
>  
> -static void dma_fence_chain_cb(struct dma_fence *f, struct dma_fence_cb *cb)
> +static void signal_cb(struct dma_fence *f, struct dma_fence_cb *cb)
> +{
> +	struct dma_fence_chain *chain;
> +
> +	chain = container_of(cb, typeof(*chain), cb);
> +	init_irq_work(&chain->work, signal_irq_work);
> +	irq_work_queue(&chain->work);
> +}
> +
> +static void rearm_irq_work(struct irq_work *work)
> +{
> +	struct dma_fence_chain *chain;
> +	struct dma_fence *prev;
> +
> +	chain = container_of(work, typeof(*chain), work);
> +
> +	rcu_read_lock();
> +	prev = rcu_dereference(chain->prev);
> +	if (prev && dma_fence_add_callback(prev, &chain->cb, signal_cb))
> +		prev = NULL;
> +	rcu_read_unlock();
> +	if (prev)
> +		return;
> +
> +	/* Ok, we are done. No more unsignaled fences left */
> +	signal_irq_work(work);
> +}
> +
> +static inline bool fence_is_signaled__nested(struct dma_fence *fence)
> +{
> +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +		return true;
> +
> +	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> +		unsigned long flags;
> +
> +		spin_lock_irqsave_nested(fence->lock, flags, SINGLE_DEPTH_NESTING);
> +		dma_fence_signal_locked(fence);
> +		spin_unlock_irqrestore(fence->lock, flags);
> +
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static bool prev_is_signaled(struct dma_fence_chain *chain)
> +{
> +	struct dma_fence *prev;
> +	bool result;
> +
> +	rcu_read_lock();
> +	prev = rcu_dereference(chain->prev);
> +	result = !prev || fence_is_signaled__nested(prev);
> +	rcu_read_unlock();
> +
> +	return result;
> +}
> +
> +static void rearm_or_signal_cb(struct dma_fence *f, struct dma_fence_cb *cb)
>  {
>  	struct dma_fence_chain *chain;
>  
>  	chain = container_of(cb, typeof(*chain), cb);
> -	init_irq_work(&chain->work, dma_fence_chain_irq_work);
> +	if (prev_is_signaled(chain)) {
> +		/* Ok, we are done. No more unsignaled fences left */
> +		init_irq_work(&chain->work, signal_irq_work);
> +	} else {
> +		/* Try to rearm the callback */
> +		init_irq_work(&chain->work, rearm_irq_work);
> +	}
> +
>  	irq_work_queue(&chain->work);
> -	dma_fence_put(f);
>  }
>  
>  static bool dma_fence_chain_enable_signaling(struct dma_fence *fence)
>  {
>  	struct dma_fence_chain *head = to_dma_fence_chain(fence);
> +	int err = -ENOENT;
>  
> -	dma_fence_get(&head->base);
> -	dma_fence_chain_for_each(fence, &head->base) {
> -		struct dma_fence *f = dma_fence_chain_contained(fence);
> +	if (WARN_ON(!head))
> +		return false;
>  
> -		dma_fence_get(f);
> -		if (!dma_fence_add_callback(f, &head->cb, dma_fence_chain_cb)) {
> +	dma_fence_get(fence);
> +	if (head->fence)
> +		err = dma_fence_add_callback(head->fence, &head->cb, rearm_or_signal_cb);
> +	if (err) {
> +		if (prev_is_signaled(head)) {
>  			dma_fence_put(fence);
> -			return true;
> +		} else {
> +			init_irq_work(&head->work, rearm_irq_work);
> +			irq_work_queue(&head->work);
> +			err = 0;
>  		}
> -		dma_fence_put(f);
>  	}
> -	dma_fence_put(&head->base);
> -	return false;
> +
> +	return !err;
>  }
>  
>  static bool dma_fence_chain_signaled(struct dma_fence *fence)

