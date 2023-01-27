Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E78667DEB2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 08:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D237C10E164;
	Fri, 27 Jan 2023 07:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD7410E164
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 07:49:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6wkO0NMXQXYbTMYsjR8lad40e5uarDiWhUzjGb4Roc7E3E7bNE/lshYTTCIwlW/GXUatc6xKGmEukaoufN5It9VCBgLgJiHNG+xumNWBexiC/MSlAGsUzyYVnMpFd9kGFLHxOGZXYnRHmDi1Bx4ERH/cjwpIqnkYE86r1GA02ZXyb2njKE0OjNj7UkChPxQXkpqUXT38egAZsoshHYYgeU6Gsytjgo+rHyivbj4ObSevmw+Dm7XDp83KaZD35cQqYuvNVeSwIVEQq/NXA9F2HI1ZRCFVh/Fg1ls6qTaHosnGaKs8eIZgYyFeMu2gXB1PqzVc2GnUkT8pLXUuudqVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqHXGye1ZEX6qOPvs7P0th8lS5aRHjVeVgfr9fJBVAA=;
 b=I0TpXQeEP0LHHEiLPSpAkVTH4qHjlTwUHxRe69VQ2kmxWbPkMiJgJgrkuvFm+zSW9Y1qN+p/6L5ToEsNMzunz7ywGlJkV1+9qgbQh+EdVeLzxVQ9oWCiW/RMdR7FYjkX20manj9PUZOBlAJ/PAgpu1etC9cNEecepl/yp1O3W9chbWVQ9N9OI5YNq49QTMLwtQBo0a6+knGBdjE8e5aga5iraaSGbTohjT98ReNJdMKOveV8shhrhAnCQfM6mZvItrcmDLRlazA7Ke1HAR54lKtqc2FAKTXbeeTlFwHReFnFTaoqIkiOaWlyqjdTMiq8x3aISDGplutbkUxH2oJ/eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqHXGye1ZEX6qOPvs7P0th8lS5aRHjVeVgfr9fJBVAA=;
 b=O2R16dzF0bKsAGm9LBTpAtnmuAAFfpnoQrXLSYTi8kFP30BNApG1hxl1v7sc/jwrpNfgiTYzZDBt7We6XlGigHcge7OuQWgzUmQak6Fb7Nf/G3Jrn/k5V1/wsE8QkCO/57FLhNE/MUiqPFYs68ixQyU8WhzShmPheD4+7M2nago=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY8PR12MB7489.namprd12.prod.outlook.com (2603:10b6:930:90::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 07:49:31 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6043.017; Fri, 27 Jan 2023
 07:49:30 +0000
Message-ID: <081122e1-ecfe-9441-fb91-e1887f148529@amd.com>
Date: Fri, 27 Jan 2023 08:49:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dma-buf: actually set signaling bit for private sub fences
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, Arvind.Yadav@amd.com,
 sumit.semwal@linaro.org, gustavo@padovan.org
References: <20230126002844.339593-1-dakr@redhat.com>
 <4b13c48e-1677-3947-42e5-5ba241bcb96a@amd.com>
 <5caf64b6-0e3c-4c24-4fe8-9ed2caf43822@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <5caf64b6-0e3c-4c24-4fe8-9ed2caf43822@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY8PR12MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: f474f936-0ed7-4cd2-2258-08db003b05bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CBrhiWvqoLlDgDVcubYeIOFERsBh4VmLhZsUbT6vfkRTWvzHZZS+h4iOAV9ze36UrLyWkZfajs3GVvcTidOeQgVuvvpnPu/Pq5DNfBPUe1ez1jMv+4FaOxm0AVGwFhcr8susI7GOL7GBONl7wfq607PiEyf1J/KzQoClgq6wtBqiFzotsFza0ikwGbYpDpFE/Nch1BB/2iqww5LhJ9wMoaLLr6hFYAvd5mTGpFcFqsuNV3XTy3AvZ5fW3SiAg9To2MrNqaL4/To+cWKwMY7SCE5Dd4s1yXNRIgd30rvHYmdG8DiW/JvN3CPVhpvZjJKeb3Dl/Liay3WXkyCEhJG244QgfZSe7W47hmULTMUz10274DsAGXpdYDdQUQHoiuWLfm7GV2bPSvs/ol4IUekcNvnKR8M0RUyQxhgJM+toz6NksCHLnm30RZssL2MZtXPA3s/knpnu8JkXVJhgFn5RbAk80NLWV+QK+UA80HnMWkXJ/idULzHu1kMRp025/FqpveP/xIB0jo/QG7eo50ilKaxCv7KDSpEGCcJF/3Z4i0Lmsc8ioJvZ2lc4loFDmIJPjDzTL2a4zVvv2X4oISt4qNo5zQI4n0W4qj3OidIUvGJY0ZZAuhMzwgktWCnW20BYBbqFW+E6NZm3CVSixILBzp6IoXbZ0RihreI7Y3wwz/FBLuDgKz930PDOcPMJlennuvC08Wh8SM2DY4a/u6i1B1TSP2Q6gnsNi+YO9rIKwNg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199018)(316002)(38100700002)(41300700001)(8676002)(66476007)(36756003)(31696002)(8936002)(66946007)(5660300002)(66556008)(86362001)(4326008)(2906002)(6506007)(53546011)(478600001)(6512007)(186003)(31686004)(6486002)(66574015)(83380400001)(6666004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFVuYzBiK0NWbkF1Y2RKeXoyZnpIWE95S0VSNFQ5M3hiSWFGam9raEFseDBi?=
 =?utf-8?B?RmRLeGY3K3laaGx4QmNieWV1MEJBMzJHSHU3UUlGL3laWlhMMGt6TjNYR3RP?=
 =?utf-8?B?M0VkM1VzU2ovbGxVUElOU2ZIdlkrZkh2MU9YZTVtY3RTNVFhMzJMSTVjelVX?=
 =?utf-8?B?dFNqMHh4NTlGMU50QVZOYXh5YlJxd1RnRDQvcERlLzRMTUsrSFRlcEFKZThB?=
 =?utf-8?B?dm5iamZsamZUeUh4dUlmQ2JxNmJlaDFwR1ErVS9GTUlQNzd4cWJoVUhJL0hN?=
 =?utf-8?B?WkJxdWtHREs5ZjZRTWlDcVNtdzNncUJEWkNJMWh3VG5iQnMxSHV0REYzVHJG?=
 =?utf-8?B?eElXOGR3RnhPWXNNcExuN3JIWjNLbU1SOW5SR1M3Z1FEQjcwU0EydHRWMjZV?=
 =?utf-8?B?bEhEM3N1RElXd2hmQkJob3lpQWlMdm5INzVhZmhWcjgxQUtPZ3RjSVJLVTFR?=
 =?utf-8?B?M0QvbFpIcXIyTTRIWTZLS2FCdUgxbHlTTTdQbHlaWTJjSGs5akFSOW9vSkNr?=
 =?utf-8?B?amgyNnZRZHdrZ2ZMa2FDN2lqYW5VZTlGMWplbGVZd3lwd21lMnJOWFhCSTBn?=
 =?utf-8?B?OEtEMFlIT25tS3FGUlQxczFMUDRIUmN3ZnNjTGFwY3RhNkJFajBtQk5KMmpZ?=
 =?utf-8?B?c1RsSHlFMkFBSEUrL1VsWXZycVpXVlJPVXcvTXFKcWpCU0c0YU1Ud2c4MDlW?=
 =?utf-8?B?b1pBVFFMeFlSZlY1OFI5WnZ1b0VmamVRUWlFU0wxNkNHcDVlbjNLNTJpWjRk?=
 =?utf-8?B?NDFZQVFWRjQzNUhCbEs0WitsQWxwM1FidTNiUTZiN1RsNGwrNEFQcDZsRmNT?=
 =?utf-8?B?SXFZK3oxZ21FMWVQaFVGVUtnQjNmSWlBTEZQbEgzOFJxNFVqVHRQVHVDS09R?=
 =?utf-8?B?MW1QbVhUSzNhdTVJYnlzQS9uelJ3azZCTGdRNjRJdk9oN2dHaWQ4YUk3Q09p?=
 =?utf-8?B?c1BRWkZEeFlaVzNpUjg0OGxOVFZCTjB6MFR6c0tCSGd4M0VHQ2Q4dmovcHpU?=
 =?utf-8?B?K2pIRFhLRlVxS2E0Tkdld2NFclVMUCt5aUo4S3ZrL3daRE1wU2hPellhMWNM?=
 =?utf-8?B?TFl1MHAyUk9UTk5MeGlxK3pqZnFqaCtQTDdxeGx6em9pYlVORzNBeXJsNFg4?=
 =?utf-8?B?aEREMTBrY05kUGlFTSt3akttN0RjYzVKNVZMSGJIT2Q1bHhtazBWNS9jREY1?=
 =?utf-8?B?UlRBeDFKZGlodEYyUWNHRmJTZzlYdTlXNE9mQVR0MEJVblIySHJJTkJwWHdM?=
 =?utf-8?B?UnF6VTVBU1VOZjBjZHBnY25uWVNyUmlpYUtoVUk1QmxPYlNQN2pEOXN2UW5Y?=
 =?utf-8?B?cnBUOWRCR01NbXhRMEh4b04yQ3NZRUNCbFMrem9wS2Jzd3JUc1B6OW5xMmtX?=
 =?utf-8?B?dmhYaCs5ak9tV09nb3IyNlkrRTI1SlMydWpNV0tNUVlqamdoalR6ZEVJcnRr?=
 =?utf-8?B?d2N4YUt3SUsxMWFwOVpZNmRDemJqeHVjUmx1MGR3RnQvZHUrZHIraHRSWHBr?=
 =?utf-8?B?K1BCWldNcnFQTGJ5bVlYQVRPTDU3a2J2SkMwaGZHWGhWajdSNVUzSElFSkZV?=
 =?utf-8?B?R2VGK1BtMDhLQ28vWXJMblAzcnZYcU9SVUV0QTVtdGk5S21NcmhTVG9QNWVN?=
 =?utf-8?B?QjNmOVd1WFBsU0s4UllKU3dXVnhCL215VkNMbjA2bjZyeTY1UC9GYnhQTDhn?=
 =?utf-8?B?Znd2VERXbVdLRnlldXFCTnZkT1dWcGd5VERsOTJPamNCVEMxVk9tNHJGOHBo?=
 =?utf-8?B?ZEU3bXpod1ZZVXVUcHR2Y2p3T3JBc01jU3Z4bVZWMUUvWE5TWFBzb2YvbWp3?=
 =?utf-8?B?TWZJUi93SlUvNWkwa2xLeFZNYW1yNVV6WkpzOWFNbFYvZEFBcStDNWZwVE9s?=
 =?utf-8?B?eiswZXEwMzRlSHN2Q1FuVzNGU2JEVXdSdGV5VkI4ZVRNaXR6S2hKSTZKV3N0?=
 =?utf-8?B?bFAyYzBBbldrWFcvSWJKekdZbmtsVU1jKzZVTzd0K2U0dWUvMlZBdnAwMWVh?=
 =?utf-8?B?NndoL0JwY2k2a0hBa1BwTmV4dk01ZlIwL3dKcEkzTnMremdFRXQ1OHRzY1Zv?=
 =?utf-8?B?ZXlMRVljRzJsTkthQ3dlMWxDNzJMTm4zRzNUb1gydUt2aS9jeGxoUmx5ZkVO?=
 =?utf-8?B?alFYTHd5M1hBWllIanU0MVdoL09mY0M1MmZQZ25XckZkY21oQUJadXFkem9o?=
 =?utf-8?Q?DvjSSxOoctePrXPOycZLCjVObXBspe9yxkgnvlaxl47i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f474f936-0ed7-4cd2-2258-08db003b05bd
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 07:49:30.5689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9o3CJ8CtC+hgnJyDw+0RcjPlLUmxYqVLegbNV9CqqhzjrgKaTKNMR0eCTLvVNSK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7489
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.01.23 um 23:25 schrieb Danilo Krummrich:
> On 1/26/23 07:58, Christian König wrote:
>> Am 26.01.23 um 01:28 schrieb Danilo Krummrich:
>>> In dma_fence_allocate_private_stub() set the signaling bit of the newly
>>> allocated private stub fence rather than the signaling bit of the
>>> shared dma_fence_stub.
>>>
>>> Fixes: c85d00d4fd8b ("dma-buf: set signaling bit for the stub fence")
>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>
>> Good catch, Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Should I push it upstream as well or do you have commit access?
>
> Thanks, I can push it to drm-misc-next.

This is clearly a bug fix so better push this to drm-misc-fixes and 
maybe even add a CC:stable tag.

Christian.

>
>>
>>> ---
>>>   drivers/dma-buf/dma-fence.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>> index 406b4e26f538..0de0482cd36e 100644
>>> --- a/drivers/dma-buf/dma-fence.c
>>> +++ b/drivers/dma-buf/dma-fence.c
>>> @@ -167,7 +167,7 @@ struct dma_fence 
>>> *dma_fence_allocate_private_stub(void)
>>>                  0, 0);
>>>       set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>>> -        &dma_fence_stub.flags);
>>> +        &fence->flags);
>>>       dma_fence_signal(fence);
>>
>

