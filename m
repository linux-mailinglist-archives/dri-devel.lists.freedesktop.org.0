Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E56F8FBB63
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 20:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1550510E5DF;
	Tue,  4 Jun 2024 18:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=oppo.com header.i=@oppo.com header.b="sEIXPKds";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2076.outbound.protection.outlook.com [40.107.255.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3CB10E5B1
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 18:17:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHCWFwAk1E6NoA2S0igQJOY1aep8WYsSRvS9CQ+hb8a4X5JSOip0cdHjlj9qmQ2mmmW2eCZr0XXl/iItKM07I3PsDXJpU6MMwXvVYIFemZy3+MGhsJppxiFzkZec6GNO9c0e2QCPTZTGwTnwx3ociorb7WC4vpmukF11V1rsih3mnDWBq48Jl+8SMTSz720AQ3yPzp9fno75kEY6U/3asuev3+0CeW+rvHQRUicRhjwDnZ7BPKE5893+E9MCfy7Vczc5wgOsQcO+59Yrx2QP5NyuXw60ByudT42ozJmc1zpd/CTAF0evU6KFjSVebjLcMvOUHCOErmEXDQZXEjGDVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cswQKSqfHIlb46vh8M9APYnPW07el9ykaBkEOz3+C0g=;
 b=Dtl1w2XIcryhRo7jasVjVjZn9gGGbMN+mcWL1pUFjB+Zm9zoF5xtqKGbt0wFsZT6jvahrWBaqSwhd15A5HNAXNz3ye+J7k41qSuIatyD0m+X91HHkykP17GFxL+kGDcS752KYhN1Bg5ewsmEiXxjwQWBZZzD0ErSyAx7iWOxnZahe7DkkEyULVwLtv8a6TGmv2+aUJ7vx9/RYXLznjd07OHNFIM1v6YB2p1wRiOdtNAd9M2bh9cLqWoqoAedoLai6PNqEYJy/J28fKvjXCfZQ6pu6B331Fla2viHQ4RzrTg52E0pT3WvSidD9JvK0tj+CBsNyNGS8xwnHqbC43JpiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 58.252.5.68) smtp.rcpttodomain=google.com smtp.mailfrom=oppo.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=oppo.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cswQKSqfHIlb46vh8M9APYnPW07el9ykaBkEOz3+C0g=;
 b=sEIXPKdsEIzdsvjt0tx5TswDKRPbd/eB0fpNYzD2C1UjCRkdOBMaNwVwmuPVR4R1Ah1BWTW3GsknoJmgq3lH1g/e0tixsyOBODER0OEcN6ruTYBJfHJ8K7SO6AjKjcbYY6+E56RM+uG2PxHhBGpYBdKwFIQGrDy+KNvzQphFpiE=
Received: from PSBPR02CA0018.apcprd02.prod.outlook.com (2603:1096:301::28) by
 SI2PR02MB5860.apcprd02.prod.outlook.com (2603:1096:4:1bf::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.28; Tue, 4 Jun 2024 18:16:58 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:301:0:cafe::bb) by PSBPR02CA0018.outlook.office365.com
 (2603:1096:301::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31 via Frontend
 Transport; Tue, 4 Jun 2024 18:16:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 58.252.5.68)
 smtp.mailfrom=oppo.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=oppo.com;
Received-SPF: Pass (protection.outlook.com: domain of oppo.com designates
 58.252.5.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.252.5.68; helo=mail.oppo.com; pr=C
Received: from mail.oppo.com (58.252.5.68) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Tue, 4 Jun 2024 18:16:57 +0000
Received: from [127.0.0.1] (172.16.40.118) by mailappw31.adc.com
 (172.16.56.198) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Jun
 2024 02:16:56 +0800
Message-ID: <f6dcb031-9668-4387-b279-958e344bdbaf@oppo.com>
Date: Wed, 5 Jun 2024 02:16:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1] dma-buf: heaps: move the verification of
 heap_flags to the corresponding heap
To: John Stultz <jstultz@google.com>
CC: Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 "T.J. Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, <21cnbao@gmail.com>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
References: <20240603114008.16235-1-hailong.liu@oppo.com>
 <CANDhNCq50zPB+TS+_Oo0HY0aUuBAdik2KrC8eJRTygbis293sw@mail.gmail.com>
 <20240603172148.gb7txpg2ya43jyxn@oppo.com>
 <CANDhNCrwgce7G5_-4tNfgTHcdL12zt3JKBg=o3bHrzMmfFMctg@mail.gmail.com>
 <cff79c75-4c9c-46e0-a3ac-b9c0e8cad6f0@oppo.com>
 <CANDhNCq1O9T6WxCpe9yNBycMu7U0SCVYBdW3R=J8jEqyqWYCiA@mail.gmail.com>
Content-Language: en-US
From: Hailong Liu <hailong.liu@oppo.com>
In-Reply-To: <CANDhNCq1O9T6WxCpe9yNBycMu7U0SCVYBdW3R=J8jEqyqWYCiA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.16.40.118]
X-ClientProxiedBy: mailappw31.adc.com (172.16.56.198) To mailappw31.adc.com
 (172.16.56.198)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|SI2PR02MB5860:EE_
X-MS-Office365-Filtering-Correlation-Id: a1e685c1-8e15-4058-48ef-08dc84c28535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|82310400017|1800799015|36860700004|7416005; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OS9vVkdkTGNxN3NyQTdZTjEwaUgvaG15UnBDakFkQlJyNWxBY3V6MDZDLy92?=
 =?utf-8?B?cGhPNmRXekZvaG15cVNWMHN1TEpVZ0pibnFVSk0yaTJDbHdwRERDQUhYa2hz?=
 =?utf-8?B?MXZFM2VhZW9tdm1sZTM3NytOcnVKZzRjQ1RJd1JwbVdtZEZmTlBncHF4QTlx?=
 =?utf-8?B?WlRxQUp6ajEyMjhiajFMZEx6K0k2dHgvUlFFUC9WbS9iWUxPRHd2dGxRNFJx?=
 =?utf-8?B?MUdBZUFPdWp6U1V0OHhYZjZmOGw4K1FLSUUvSnVTbkxjN05vTUJJUEVYaEUy?=
 =?utf-8?B?Q1JaUDZtemJCVHBqR1BsT3pLeWszZGUxbTJDZnNrSE9Sa0JNWWlGY21sRG5J?=
 =?utf-8?B?emdIYmQ2aEx1NUtvSEhZdWVaYlBMdnBjSWVmUVhrUnNsdlF6STJOd0Fsc1I1?=
 =?utf-8?B?Z3UwL2tyZWlScENSMU93alZ0TENmdWsrVW54eDhFNXljUlNjYVE2VTNzMHhz?=
 =?utf-8?B?QVpuZ1VBM2UrUHl2U2pMWVJ6b3JVRFF1Y25uMGpiR2RreStZUU1aZWpKL0Jv?=
 =?utf-8?B?NnFnMDdLODhYU3ZnN0xyOVB4VjJma1hhRnprNXJTUWg2ZURiUUUxOTJ4OFUy?=
 =?utf-8?B?ZW40MmdJSStQOVRYMzdWMHYwQURJaUV4RGNhT3cwaFVZNCtNM29uS2Z6QmRN?=
 =?utf-8?B?VGxNcDdEWEh2NkpoYnllVWFJYW1xeDlTdTNuV0dCektwbHp4RFhjMzJ6bU04?=
 =?utf-8?B?Uzk0c2hOYkw1YUdiVlN1QVZZMnN0ZE91Q0pSVEI4czc3VE1kcTFZNWQvRzNZ?=
 =?utf-8?B?R0E5ZmpjeXpGN21OeEVhOFA1bkFiODMxTk1pVEFteUNBN0F4a0JCSnFaWnp1?=
 =?utf-8?B?Vkc4aCtrQm9XRVJmdURiSmRSSGg3Z3VSVkFOQ0VQSlE0N3hTdEtadUlsM0gv?=
 =?utf-8?B?S0hUV1pzQThWSi9LM2tKN1RZVDJrTjBMQmhMQnV6d1d0UFJwcHAzUVRSMUpn?=
 =?utf-8?B?K1NFSUlqM1hJdGpSMlNLZDJlb2NNUXUzbC9ETi9EZzlic2Q2QUNyaWxIT2dy?=
 =?utf-8?B?WFdQc3FVK3Z5bHpEeDNtLzVuZWdubnFKRFpESVcyZ0FxVVhYR056WHhXRlg1?=
 =?utf-8?B?TE12ZEdYYXdHa1NzZjVjM2tOY3p5aER5ZENEN3BkNm5adVlxalBQT0wxZU9M?=
 =?utf-8?B?L2Z2TGJZTi9CN3VJMkpudm1uUzVFcElhWmhRV3ZhUzBFNWhwMEM3Ti91OGVH?=
 =?utf-8?B?d3MvcWZqbXE0cml0Vm5SWFpoTVhGMkpocVhaUURXUHVXTi8yN1FvejVUUUZX?=
 =?utf-8?B?a2pPam1uWElWZGRUUHJLNUVrNkNiM1Bob2JET0xONXVJVVdZN0lGQU1xZXM0?=
 =?utf-8?B?LzBVVFNhSjIySEc5YnpEcEpHY0lEWk5PQnltV1liekgxZnFyTXdLVEh0NWdY?=
 =?utf-8?B?cEFjNTV1SFhJb1VmSk5lRjYrS0ZMQmhVWDBwZVh1cjE2NXNYNk8xK2Q4b1BQ?=
 =?utf-8?B?Qk0yaHl5Z0N6QW5waWRtSTNtTWsvRmNRdkhUZWswQnI3a1ZBWjRaQ2J6V2E0?=
 =?utf-8?B?MVF3TUVEN3FISmdUWGR3YlZ5OFlZSkJsdzB2czhkbERNVjVGT1N0ajFicVBN?=
 =?utf-8?B?RVFpRjRPOTMzUmtOTi9CdGx0eFZ5bUV1emVISG95NXI4anZSL0dOa2M0N05z?=
 =?utf-8?B?L2dnQTVQMnVVNmN0aDNnVTdST0dNWFhlellEZ01keUtEZEZhQnJNc0NvUnVO?=
 =?utf-8?B?bjVWV2doc05iQnk5NjZ0Mk40RWJ6T0gzQW92YjcyWjduTUhqOGpkYTJFQTZy?=
 =?utf-8?B?Ky8xUXU4bDlxNFZLMEFWQVlKN2RxVjl0cFkzSy9jU2dIVkdQeWFxQ0ZtbWFz?=
 =?utf-8?B?cE56SEliMGlsbjMrOVR4cEVuRnVEaFlybUNzd2xvMFlpdTdNSVEwMDNKSE5p?=
 =?utf-8?Q?4QTemWqBkVqQ2?=
X-Forefront-Antispam-Report: CIP:58.252.5.68; CTRY:CN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.oppo.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(82310400017)(1800799015)(36860700004)(7416005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:16:57.0963 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e685c1-8e15-4058-48ef-08dc84c28535
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f1905eb1-c353-41c5-9516-62b4a54b5ee6; Ip=[58.252.5.68];
 Helo=[mail.oppo.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF0000021E.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB5860
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

On 6/4/2024 11:33 PM, John Stultz wrote:
> On Mon, Jun 3, 2024 at 11:30 PM Hailong Liu <hailong.liu@oppo.com> wrote:
>> On 6/4/2024 2:06 AM, John Stultz wrote:
>>> On Mon, Jun 3, 2024 at 10:21 AM Hailong Liu <hailong.liu@oppo.com> wrote:
>>>> We now aim to improve priority dma-buf allocation. Consider android
>>>> animations scene:
>>>>
>>>> when device is in low memory, Allocating dma-buf as animation
>>>> buffers enter direct_reclaimation, longer allocation time result in a
>>>> laggy UI. But if we know the usage of the dma-buf, we can use some
>>>> mechanisms to boost, e.g. animation-memory-pool.
>>>
>>> Can you generalize this a bit further? When would userland know to use
>>> this new flag?
>>> If it is aware, would it make sense to just use a separate heap name instead?
>>>
>>> (Also: These other mechanisms you mention should probably also be
>>> submitted upstream, however for upstream there's also the requirement
>>> that we have open users and are not just enabling proprietary blob
>>> userspace, which makes any changes to dma-buf heaps for out of tree
>>> code quite difficult)
>>>
>>>> However, dma-buf usage identification becomes a challenge. A potential
>>>> solution could be heap_flags. the use of heap_flags seems ugly and
>>>> contrary to the intended design as you said, How aboult extending
>>>> dma_heap_allocation_data as follows?
>>>>
>>>> struct dma_heap_allocation_data {
>>>>         __u64 len;
>>>>         __u32 fd;
>>>>         __u32 fd_flags;
>>>>         __u64 heap_flags;
>>>>         __u64 buf_flags: // buf usage
>>>> };
>>>
>>> This would affect the ABI (forcing a new ioctl number).  And it's
>>> unclear what flags you envision as buffer specific (rather than heap
>>> specific as this patch suggested).
>>>
>>> I think we need more details about the specific problem you're seeing
>>> and trying to resolve.
>> This patch mainly focuses on optimization for Android scenarios. Let’s
>> discuss it on the issue website.
>> Bug: 344501512
> 
> Ok, we can do that if you need.
> 
> But if this is ever going to go upstream (and it's more and more
> important that we minimize out of tree technical debt), conversations
> about how to generalize this will need to happen on the list.
> We need a more complete design and test results to convince upstream to accept. 
Thank you again for your suggestion.

Brs, 
Hailong.
> thanks
> -john

