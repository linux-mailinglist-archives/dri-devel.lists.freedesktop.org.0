Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 139FAA7863D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 03:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B634E10E19F;
	Wed,  2 Apr 2025 01:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Vt73e/bC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0E510E19F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 01:47:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtDMkFMiLrzwQLUx7GzDqfUuRkPtv6VUhO2BDCzjhaVWn2YEtsgod8/QmhhKkc7Nw3I9669XG9L4MNJzUhO5keCvKevmkYtpxre328DB1LE2zduVAFBL0oCQwI/noh5OCF5uQf96g6qv20jKN/n7Nd9c7UU7fZhslH6SPi8SkS0hwUD32/OTsOcSUtN6g+zDkoy87B6ECDrZenbTIpD+lWIsCjqRl1cnlAHuqhcqN7+BTEyn2OSXrLKK6rluNt1DLrD9EE3GPcc8ZMnPwvWZRi2hUPgjTbrSVbqUo3uErNS1yQcXQUaCbdm96xoVPh0PsyS6orsMaLIMMUohvklj5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtOCJIhfuXkWZmkhGLjfRjEOUU+Uac5bW5NmqbITMA8=;
 b=vXGH0m1TZUSCM4VPbRDkXZ/B2n7ttOYLTXrKtCC/PCvqfy2jXWGhYvaDiRBWGFLUKjggiXge5u2Hl+rpXZVPSgLC2dUaE5s9UV6/ox8/2psFq5Ddn+MmKLQZgFGMadkH/xwFz+wnraDj9aY180eyF7Om5AWiLaVtx2Y9nGNcFwCQ5RwwL1ePJzvqezU8K9/AkKG0sLt1oPQeixtchqb9ouOzUCen2bMd0wSIZh3ANmZmqyUYB5WUWjfw14qIAdh6vFChDDfRjZRIbwZd/oMLcyykTO1TqlPQCXILKXrCk3NJ21ip47dw4RjYp7t0cMVzIUU/tzTDtuKTayo9lFEx9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtOCJIhfuXkWZmkhGLjfRjEOUU+Uac5bW5NmqbITMA8=;
 b=Vt73e/bC59gflhL40ips87H24az9WG54HFq2Yy31aFUiytjhtg66zTkvibv8wiMkght1HkzgsPWXaOULrDimcbnVeNpyElfnA2c3z8YyvGrnoHWnyaIfsqLpXFh8l1NnAfnBfT80FMKk64DOtgMjh38S8N5FSY/OzOqIWxzZQK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by DS7PR12MB8289.namprd12.prod.outlook.com (2603:10b6:8:d8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Wed, 2 Apr 2025 01:47:52 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941%4]) with mapi id 15.20.8534.052; Wed, 2 Apr 2025
 01:47:51 +0000
Message-ID: <a8636797-061c-4799-8017-1fee51228e8c@amd.com>
Date: Wed, 2 Apr 2025 09:47:40 +0800
User-Agent: Mozilla Thunderbird
From: "Huang, Honglei1" <Honglei1.Huang@amd.com>
Subject: Re: [PATCH v2 0/7] Add virtio gpu userptr support
To: Demi Marie Obenour <demiobenour@gmail.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Huang Rui <ray.huang@amd.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <20250321080029.1715078-1-honglei1.huang@amd.com>
 <3baabd6b-95ba-4f84-bdef-b44d6d071aba@gmail.com>
Content-Language: en-US
In-Reply-To: <3baabd6b-95ba-4f84-bdef-b44d6d071aba@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|DS7PR12MB8289:EE_
X-MS-Office365-Filtering-Correlation-Id: 2619f307-52e6-42fb-d94b-08dd718860c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmcxclEwamJqQVo4OTA1TlVNUnQ3clFCeGNuRk1lemVJRDIreEVpT2dMNTgw?=
 =?utf-8?B?bzNvWUNKR1RpV3YvbjRBbHFWQ3ZXY0s4eE5yczFaek9yc3loZGJ5UU1oU3U2?=
 =?utf-8?B?ejZxMVM1RWJYREZXVFpETm5qTExncE9rZjhEbWRONWtFcUVpZ294V0FoZUZV?=
 =?utf-8?B?RWdDMVVjdTJVOWI2SVBRSkZiZWVwc015YS95YWd2VisrNWlRVDYyZ0ttNm5D?=
 =?utf-8?B?WFV2QXlNcTJPU3FPZEp6aEpjR1JxcGRqck0xd2NRMHJFQXgzUzJ2dU9kRWNo?=
 =?utf-8?B?d0g5U09mT0laN0FCSHBBL21sSks1S3l1dlo5TENDV0FDbmhqOHE4a1EyUjJT?=
 =?utf-8?B?SFRWVCtnWlJJVVR6NllEbklEckF4Zk5QVzE0bnRsVTFLMTRKVEN6VlRXTUx0?=
 =?utf-8?B?NnAxTnJhVnpqSmVaV0tIRmtmUHdhWWlQU0w3M1ZpeWw3RnNWUWtrQWxUcDFF?=
 =?utf-8?B?RGN0ZWJoS0FmMkdDYVN5R082cFFYNTdabGc3WTZkS3ZKZVhOckVJT3p6cUlP?=
 =?utf-8?B?d2h5VTZlc1RzNEd0N2YvZStrOEVKYWhzeHJJc3FPamYvblA4VFh3S0hPNG94?=
 =?utf-8?B?UHlyYVhqdW83Z2d1NTFyaVJQWEcyVDhTUWZkMWZiTXVCbkZ5b3d1UmtZT3V4?=
 =?utf-8?B?dU53RTI4MDNkQ085QWlMazdGSVhwcGovTDZFQ1BvZDhPNi9wUlNUMzZDeDFp?=
 =?utf-8?B?dlFRZGJGVWV6UlYyNnRPeGtPNytKVHdYTE0zRVVpMVFuK2FVT01Wc3E2RGhK?=
 =?utf-8?B?Nmc2N0x4aG1NVVFNZWFSNFhESVZXOXJpcWh6RWp2YWJDREtzNVV4ZFVacm1L?=
 =?utf-8?B?dWZtdXZBRHJ5TXFTTzNtQ0N2V1BuUW0rbm5tcTFlODlQV2lLQnB6ckZDa3Zo?=
 =?utf-8?B?aUYwWHJCbW03OE1yVTNLS3RCUWZyL1IwZm9DUnVtZTdLNitCV1dZTnBHSFZU?=
 =?utf-8?B?K3RHU0ZIUG10WHpxUFpoM05tNjFFS21nQ2RBdTUwZlV2UDkrc011RS9DK0Ry?=
 =?utf-8?B?cC9ZT0h6WTZkeUtvZGMwTTFVL3NxUnpJcWR1cHlOME90UTlVa0p2WXVRQWNs?=
 =?utf-8?B?dGtMbC9Nd2Z5ZnpxV21Za1FROHdhYmwxdklRcDk3V1FqODB1bGJ1aDRwTzNL?=
 =?utf-8?B?QytpVVNWdkZoaUtMRWE5dXdCeStpTWZhaVMxZTFtZkxCekdoQ2tqTXZySFZI?=
 =?utf-8?B?MTRrNWUxenorb3dvQmRqYnRsaDE0KzBYek5ScnBzNnIxNmZWa1RzV0djRlJ6?=
 =?utf-8?B?YlNMWUwxWlA0ZE5QVjhrSm1YRE1lTFFUNldIRXVkd0dCVGR5UWUveENQR0gr?=
 =?utf-8?B?Y2JwTUxZaTVqMGFYWDJLNWNWczI1VnAzOENGdXYxZzBzb1JzbEpveVNHbVhN?=
 =?utf-8?B?bGF1NjlQT0lPYnhZMWRCeENma20rRW9SS2tsbGM5bHZMWUFoNTN4V2FrM3Ey?=
 =?utf-8?B?TkVNcGYyTVFiQUIyZDAxUGNDUVJ4Q1pkRHdZeEtVcEpwVGl1UTIyaTY0c2NV?=
 =?utf-8?B?b1MwYmZoTGV5dFpvaDB1RGtnbWxFT3lJYng4UDFUMHA4MnArNStVNUJoYzV1?=
 =?utf-8?B?Y2lKVXRwUW0vWFNMQjBxUjNyT3VoMWtMNCtZU1JKUVgyZC9XWnZaUzFxdm9Q?=
 =?utf-8?B?VmNxUFM5d1ErMThvL1duRTREZWMrbi9tQkV3T1BXMTQ5dmxhbUppeEtTak4v?=
 =?utf-8?B?ZldYY2ZJeVlPYjBESzI3ZEM2cDNGUXFEMTRkRC82VzQ3bUhPalpyVU83d3ZH?=
 =?utf-8?B?Z3ZXTzM3Q2d0RDB0UlNzT0Y2TGtBY1NOZnpjUGpIQ3B0aWRxd1pDMW9Fc2xF?=
 =?utf-8?B?bmlpVTdOcHE2UFNRcW5IYlJtRmsxdVR2SG5oaVBEcktDajA0aDVteGFvZlZH?=
 =?utf-8?B?cVl1TjdDd0FaeTBGbnVEYldWa2owSC9vYnN6b3lrVjJCcGR6NWZxK2NFNktr?=
 =?utf-8?Q?dARJicLh+fs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nk84SEhHRVh3L2Q2OWs1UUtBd0J6UTUvY25zYlJTZGJIQk5ZTXp3bjFVdzRW?=
 =?utf-8?B?a2Z4blJoR0MzVXN6V2tDTEpyU25TcjlhbFg1WGl4RUVWTDJ3VHdQU1N4WnFi?=
 =?utf-8?B?THBSRzBQR01UbDZHazJFeVNRU1E0azA0b09ZVG85QzVnelgwbWcyaTlOMkIy?=
 =?utf-8?B?VkZiMlg1TW1oMGlqem9qVUZUQkZDeDJIU2xBaHVNVSt1bVQxd01LUGhaZXps?=
 =?utf-8?B?UEhXTFVzS0oySUNGcHlwRXkyMTk0ZC9RTVNsM0hUNnQ0bks4Y21GR1NLZi9M?=
 =?utf-8?B?NHJoQlpZci8vVXo2cmY1dkpqTnNZS3lJMTNQQ094QVZnNDZ1ZUxXRWJ3dS9a?=
 =?utf-8?B?Q1prVHBGMzl5aGxvZHViVGp6SDlVaHZpSUU4cHpKaS8wbkNOS1FQY2ZsUjEy?=
 =?utf-8?B?eXdybDdOS2NHa0hPS1o2NmlwclIrTmN4N3IwWFdHL2t4YUMxejdkVDFrL2xN?=
 =?utf-8?B?c21ZNE5xdWxSYWxxbWpMcFZSWGV3R3JEczRKS0NybGtOR2ZJanFQc1p4djF0?=
 =?utf-8?B?THZNK3RqMmNUN0UyMTdGWTBCUzRteHFyaW1WazRHTkNHZ1BvZ1lFMDgxbEJH?=
 =?utf-8?B?YkZOamhNemdFbzQwMjVHU0JHL1RkNDVDUTkzRkJ6NUYrZEFHWk5qNmhaYUVo?=
 =?utf-8?B?MjkrSFVZMTJUMXBaSzhJc2F2THZiV2FXNmlSZVk0R1FQcmkxYkpWemcxMjZz?=
 =?utf-8?B?TmsycnZIVjkyMytFakY5SEl1Q3l5SERSWVZOSWFqOFBReVRJb0VmNU5aTkdV?=
 =?utf-8?B?UjNLaThVQ0xXeDVSVEQ0T2JxR3V0QzZPbTdmU1Z0ei9JOXM4MnBMeCtHdEFU?=
 =?utf-8?B?MmgweVc4emdsV1gvUHJlVEpweUJkT0JkVFROQmRSYjljcEE3ZG0rSGFCK3lQ?=
 =?utf-8?B?a1VUcjRsa2ZoZkg5QXR3ZmJPL0U5d2lsWTA5TmgzN0dBb2cwTWltSndZckt2?=
 =?utf-8?B?bkdROExKTHA4RXZINjNlSXV0c0QwRlRVa2FLQ2FaTTNkNjRGYjJWVEF0M1Br?=
 =?utf-8?B?bUZLOXI3aU1nOElBZlFOSi9vSVJvUXc5aCs3em1YcXZYbEtSNlNjU1ZGK1Rv?=
 =?utf-8?B?aHF4anNmeVNXT1NWYkpIZlRIZFAzSGJ6cFZ4a2tMMEhuTENCYnE3bkppc1hM?=
 =?utf-8?B?YTVERDEyemF2QlNNNWJxWG9HUnlMeHdPdDl0OVBxM1Ryd001Nk9VbzlWTHQ5?=
 =?utf-8?B?TTgvMmVpZlB0ZXZad210WUJRV2RaaTdVeTN1Qnc3bHppbVBIL1NKVzJhdGlI?=
 =?utf-8?B?NjJQUklIR1NFWkxQT3k5VStFNnhMN0NHQWZuenZYV0JQbVZ3a3ZVYU1oc2Y2?=
 =?utf-8?B?c2IzTTN0dkpGQ3VpYWtoNnlkOWFJQ1BqazBVWGRld1VVdjR2YndhbDJIVVRx?=
 =?utf-8?B?Q0JEbHkxZVM5eDNhN2dJSE56YUI1UjFoa3ZIQXM0T0xlK0F6d2tlOXVOcDA3?=
 =?utf-8?B?SndJV1NnRkppSktuYWs0cmg3dGE2TjIvd1JLNXNWT0JIRUlyUXMrUUJpOXU4?=
 =?utf-8?B?T1FmY2NlWE1NS1BTSTRqY3ZydUd1SElZVUtORngrakV3SDZ1NVhUQ0FQOGc4?=
 =?utf-8?B?cy94a21OZURvNzJkcDhPcEZMcEh2a2pxQ1R6Q3YrSUY0QjlGVWtOcVNCTUNE?=
 =?utf-8?B?eTlRUDRGdVlzYlhQeVZzWEZGYzF0bVhndHd5anlMMHJiZ1JRZ3NvN0NVV2FJ?=
 =?utf-8?B?WWNjZ3dtbXFJaitBTnRVZTNmTWdmNHBpekF1L01EYTFGb1dtRzBuZHVseHY2?=
 =?utf-8?B?K1k3ZmZTTXJyY0JjdjBhT2t2V0dBWE04TDZFd0MzQ1lqSEtrcEx3cVY5L2ls?=
 =?utf-8?B?eWs1TVFGUGFpZkRlK1pocVVSb2EwcGtYanNKRlM5d2RzQnh0YWtzM1htWVh2?=
 =?utf-8?B?SG1GMG1BRnp6VmN3dFBhTEczaEpteFp5NkpHT2Jrbm5YUk1jeU0vMFVYWEhI?=
 =?utf-8?B?cmRZVGljZHVDR3ZtK25OREdmRG1qaW14MW1nVVRHNVV1UG9tcmJPd0YyL2lI?=
 =?utf-8?B?a0xiTXBsZ1VKUGRFOGdPUC9Kd0FCQTFIUG9xU011Zm9UNmsxQUY2MHpRQm5t?=
 =?utf-8?B?Y2FNOStzallaaURRNk55eHlTdjVuWU85U0JGSmlhb0lwclFqSHNKNFZUY3RD?=
 =?utf-8?Q?jIBRjMFOjh4jS+VZZ5DJO9/KL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2619f307-52e6-42fb-d94b-08dd718860c5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 01:47:51.3607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fRjOlFIk2cTXdKf2yI/JuZ0Fhstdb3LibXbX/VPvQ+4UnGM7ZFNqYP9Rk4CHxCNP/21p71qqJpX19P12FjRxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8289
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

On 2025/3/30 3:56, Demi Marie Obenour wrote:
> On 3/21/25 4:00 AM, Honglei Huang wrote:
>> From: Honglei Huang <Honglei1.Huang@amd.com>
>>
>> Hello,
>>
>> This series add virtio gpu userptr support and add libhsakmt capset.
>> The userptr feature is used for let host access guest user space memory,
>> this feature is used for GPU compute use case, to enable ROCm/OpenCL native
>> context. It should be pointed out that we are not to implement SVM here,
>> this is just a buffer based userptr implementation.
>> The libhsakmt capset is used for ROCm context, libhsakmt is like the role
>> of libdrm in Mesa.
>>
>> Patches 1-2 add libhsakmt capset and userptr blob resource flag.
> 
> libhsakmt and userptr are orthogonal from each other.
> Should the libhsakmt context be a separate patch series?

I will separate libhsakmt capset patch into another patch series.

> 
>> Patches 3-5 implement basic userptr feature, in some popular bench marks,
>> it has an efficiency of about 70% compared to bare metal in OpenCL API.
>> Patch 6 adds interval tree to manage userptrs and prevent duplicate creation.
>>
>> V2: - Split add HSAKMT context and blob userptr resource to two patches.
>>      - Remove MMU notifier related patches, cause use not moveable user space
>>        memory with MMU notifier is not a good idea.
>>      - Remove HSAKMT context check when create context, let all the context
>>        support the userptr feature.
>>      - Remove MMU notifier related content in cover letter.
>>      - Add more comments  for patch 6 in cover letter.
> 
> I have not looked at the implementation, but thanks for removing the MMU
> notifier support.  Should the interval tree be added before the feature
> is exposed to userspace?  That would prevent users who are doing kernel
> bisects from temporarily exposing a buggy feature to userspace.
Ok I will add interval tree patch before introduce the feature into user 
space in next version. Really thanks for the review.


