Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 921F0725A04
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A84310E49C;
	Wed,  7 Jun 2023 09:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20BA10E496;
 Wed,  7 Jun 2023 09:21:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbE09/79Lf0yn+/MSe2s2NRHI1wDuRbBd2+WxOY/prpuCh0dqjusgZsbKfqWCtmnVC7EkM/yZ6wR1x/tzwF5Ol/gc7mGTAvfNP+nd31RMkIgZNHxxawnzIUhoc6wLmF/hehSAqGnjBsrvB8B+UnBvPI4NCcEDGPINo+XlDYZ10zsgKOj+DgfGfVUJA6iGWIW0AmOU0QLDHf8L59JmzE7ymQs29fYc7lKzV5vMzQBM/Zqnv74hNQIWsrue+5gE3P85PRKtvqnn0e2ZKQqC9dAjDl5sZ2bV2WNfh0mfDLlHwvqsfNQgz7FVtAzWXswVsMbfCWsS45vcwaEyQv3t9Dg6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXQP/QE6vYbH7Yr1Fw2p5VqhtenAsH8liphDcyxEHLs=;
 b=JbAdLyx5uTNgss8+GhAJ8RjqnPHD9Q4NaZ9Rg5FEJhKHdcV51dlb85qkNbQCna/nCy6bdESKQDh+u8ymJN6HAvGW03WqihSZfWWA2AWkEQTtYmbbCC0IOPWQeqr7K9ie0G+osO44+RiD39VIk4Bh3bYQXAUn5qCd+HE1WvjY8QfU+e/KWafEqLhf1hNlpWfh5GKJ7rro4kFNeIdSmAKigFqjcPy71/3MRMpLCUtNwNkTDNBeywsdntECfMwb1EetVMvS4KZKNk/NDKlyZhKR5u576zPWQqVXFyb3LoN0lj3nxiJzAGDZKS4Yv+6lMaNbkXa6AvulZk10KAX32p/SdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXQP/QE6vYbH7Yr1Fw2p5VqhtenAsH8liphDcyxEHLs=;
 b=V7J2nB9CpvQ+aS+DOVOmBh36PSZFD9HmE5bNvVOoD23xi4nD4FP/YX5Do6iAKD940AxjtXZBhgemA6mSiHNc/4tCmTmeRxay58LnoQorrmrnyn9KodJAyHdofAR+R4iFkxEthWL6Dlm7OXEpj7WAJ9Zv1xxnESq9AZbI1IzEopg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA0PR12MB8929.namprd12.prod.outlook.com (2603:10b6:208:484::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 09:21:02 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::61c8:1d79:40e9:17d8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::61c8:1d79:40e9:17d8%6]) with mapi id 15.20.6477.016; Wed, 7 Jun 2023
 09:21:02 +0000
Message-ID: <966758fd-53ab-c49b-e045-24ab1d12c0d9@amd.com>
Date: Wed, 7 Jun 2023 11:20:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Lima] [PATCH] drm/lima: fix sched context destroy
Content-Language: en-US
To: Qiang Yu <yuq825@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>
References: <20230606143247.433018-1-nunes.erico@gmail.com>
 <CA+E=qVcv4CrGki1cTYb53p5Ys0AgF=qfrK7XYB7X0gvu9knD-g@mail.gmail.com>
 <CAKGbVbs2uwap-EuQkn00+rZqOB+Fohd9FmazMs051Yn+VSjmmA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAKGbVbs2uwap-EuQkn00+rZqOB+Fohd9FmazMs051Yn+VSjmmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA0PR12MB8929:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f6c1c86-bd64-4de4-f68a-08db67388327
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YxdRAW31vCyoA+CunvD3A/6HzRwQGK8Zx+1iaRCQvOgIHwfx1U4Lq7kfsqC+xNnlUqBnCqaNA+3C3wx4RHDL6jeWHuizog1dpe772KcUlaQ9B7MHUqByIKV5az5YJEANGkX8fggKt8dah5QQkU6kzFlB1emFJ/rKGIXGnw0uazIgCW9bLFd2WrWhXQv3A3qS8szBofU4LxK9sXFZL6ln+8e+t6p2wV55cA4+X2XxGW6BxLvhJ6JAvOXqXm37Gv8NnsY0F9Sdkw3qDbo8fcigWlpzZ2yOc9ryQviivGBtzUDebHbX2FnuObelaZoMKfiLbNO//KqZtfMVM9UCKpKSx6DZK8C2zVQEMJthdzO4zbQsQj++jvYwugAgcMXaphzS0AGil8cO9Ouwb9pq0KoXrto6pc2/e7p6FYahsInPmMQxr/qtipaSMy003heR0VzrQyRtw/CSJ8EbUJQm/d7jI/6h6NFk5RBobTOi2o/giK0g1J8Ny/LOHwPhTAPPQyD0PNSPwcv8iojt2+W5XLHw8ph9ALvE8QLJyKLrL1ptIGgCoW2O/b01UYuDlSSlp6LXThNeJOutWS/e1OGUr+eV5w2KlKY4h9BeGOJD20zF0k8tvV3LjMUyOra7I9XV00nXqKbHYUb9YN827Gk5d+QEvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199021)(110136005)(478600001)(8936002)(66556008)(8676002)(2906002)(36756003)(31696002)(5660300002)(86362001)(4326008)(66476007)(66946007)(316002)(38100700002)(6506007)(2616005)(41300700001)(53546011)(6512007)(66574015)(83380400001)(186003)(6486002)(31686004)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjN4Vis3Z2pnUEx3cHBMU0EyM0U2YjVBVVJYVjhQMS9lTVNRTlRONlZ1clY3?=
 =?utf-8?B?T3JISmdWNU05anlTRGIydWlnRDlrRFdzVXI0UnVmWTdLdU5COW9ZUVJHZ2tk?=
 =?utf-8?B?NjBHWkxrU01xSjJHbTVzbTU2aWM4clRFS2VHUjUvOHFhT2V1azFPME5DaWlI?=
 =?utf-8?B?ZjlTYnI3L1lmbUpWT1A2NHhWQlBpTCtWYURaY1hKQnJmSnhML3ZQRVJsU3Jp?=
 =?utf-8?B?TVgydzBwZElXTXZ3Yk11NHFpNUxVMW1PMWFkV25wcEdxN1VCTUlGUTc0U3h6?=
 =?utf-8?B?ZVpHUGk4N2ZtcHFqdXlCNW1MRUNxSGRLZTd2YTU2UGF6YW9uZEV5UCtTTjFL?=
 =?utf-8?B?SGtrOG93SkxzTTdOdzdXT0RqVlc4ZVpCVkN6T0FBN3JCNk1IVkFVYWQreXd5?=
 =?utf-8?B?R2RBQUlzZEFZMnJ1WHZnNjBrVXdwL21aV2lGTGtUWHNLS0xFejJJUzF4bitL?=
 =?utf-8?B?aHhDMXV2WkpneG8vRlBlTndibWFqUHBFajVMd3Z4czZWUGtNVmNqcXA1YWx3?=
 =?utf-8?B?MjBqNS9XZ1QwWERZa3JQT1ROQWsxaDViclRBQzMvRTd4MUdSN3VJWnVVLzVv?=
 =?utf-8?B?UzBaa0lqUnI2QWxnUzlPekZxbUpqOG9halJQMTU3TVJ5OENwM3dkVnpmV0pk?=
 =?utf-8?B?aWd3SERNakFVcmJNajZxaUJCL3RuaFZIajRzYlNpa1BvQVhkZnd6UjRJU0dJ?=
 =?utf-8?B?QlhXUW9zKzg4akRHaDZ5K1VRdDhKUlo5eUw5UGtZUG5sZGZvV1NSenI4Vm9D?=
 =?utf-8?B?UGFOSXQydS9KQjc5RlBnWTlhM2lRbVZNZERMUWU2NmpEZ253MVpqRm1iWnV2?=
 =?utf-8?B?c3RVTlAzRkNQVVVSWDhZanNodGJuZVkraFczT05CT0hxcDJOZEZqek94VnAx?=
 =?utf-8?B?b0RqeVNKUW9zZndiOTZkVEhBYWFLVHdrRG9JTzB5M2hQT29NSEh3VVdjNmVP?=
 =?utf-8?B?K0ZLbXBoTnUydlJKQWRpS0M5N2pSZ3h3RFY5UXo3THc1aysrelA0UFhxMUdP?=
 =?utf-8?B?TjdFcVozaUcwcTE5Ymp1REpvazJPV0lIdGdBeE10RFhCVFhuTTBpQ29VSEdm?=
 =?utf-8?B?ck1zRTJhUmFjdlJXNXE4UWFQajRMYVJtSHNlSjVLMjlYa1lxWis4d1V0VlNE?=
 =?utf-8?B?bTg3M3I2ZXpjVGZOVysvOTEvamw0OW11Znk3OXFjR2hma2tyS3NDWlRUaUc4?=
 =?utf-8?B?Z2Zad3F4YkhZYWREYUxHdUN6MWF1SVVwYkhCNzlONUpLYjV0dXQzZEFzMHRy?=
 =?utf-8?B?UVFLQjIxOVlZL0dqRkFCa2todGRvMHREL3MxZktualBnRktjc05FS2k2Sjhq?=
 =?utf-8?B?dWdoa3NHa1p6SkdnNVN1V0hxek8wYUdRWUdmK1hVY0t2Q0pSblp4ZHR2MXZL?=
 =?utf-8?B?WkJubDRNNk4vM1YyOUgyK3lCdEpFbzMyT2lmZkNZR3NRVmVZTTBYUENyVmZH?=
 =?utf-8?B?blgxSnNmSURNbDYzTFFrM01SMzQyR0lxQzEyKzhjRlQ0SE04QlAyRFNuMTRS?=
 =?utf-8?B?WitxV0pzbXF0RVJmSkZxbCtWWnp2MjVsZmFaMGVFUzNpaFpOUENLMVBUT3VB?=
 =?utf-8?B?RVBRN2xleWRQaEN2UjZBYXdaOWRhN3pmVjczUUpnTkY0eXZkcThKWnRCVkZ3?=
 =?utf-8?B?UkIvbVM4UlVZRWR4aGhuUjB1WGhJQmd5aUQ0QnBoY1UwNGZkRml5T0hVTGpo?=
 =?utf-8?B?R2lXUjUrai94ajdIRWphdW50V3VrTllWam4vUWZsOHI3ajUza241OVNBaVNy?=
 =?utf-8?B?eldWbGo4NVV5a21EU1BQL1FjNEtFN3FoSG1SK3JSb1JXMGNhN21uWUV0YXpS?=
 =?utf-8?B?Q0paTWNyK1V1SzcvcGpGc3kraUJXcFptWnhIKzFveUVqSFF2R25PbjdxK0s0?=
 =?utf-8?B?YWdSMUdSd0FPaG9vZ0FjV0hjcWNzUS9aMExCWXZrVy9NUGYrSnhWMlRJVWMz?=
 =?utf-8?B?RGljTlVzK2JDaTRyZUJkbUZXRjdtNHgvT3pBSkRZVnFKYTBlUUkvMEVsZktK?=
 =?utf-8?B?elVWdHpHSjhFWlJlY2p5VVh5U0tXM3ZzeHBwRnpmMDlyVFJJUkJQWmsrTGU1?=
 =?utf-8?B?Nk96dmVsQUg5cFdKcS96elZBU1lDYytJSElLb0QrTnR1a0c4b1VmT2d3SEtZ?=
 =?utf-8?B?ZEhZN3NxcDF4WFR1MkxOVkIrOUJBY1g2bi9tOEZ1dzhjV3phZzMxb3UzQ2xX?=
 =?utf-8?Q?T5OPLg9Z1Z6zRx9e6zujg0sVGzsYo6rEQbsQgbhH80Co?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f6c1c86-bd64-4de4-f68a-08db67388327
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 09:21:02.1833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sr2FaDIE6IZkeGbmMR5GqdU8DaqZp7W7FnFgoXl5Ii37Jk9p+lRvrNylo6dH7Ebj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8929
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
Cc: lima@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Christian König <christian.koenig@amd.com>

While you are at it: It's beneficial for drivers to implement the flush 
callback on the file descriptor.

This way you can still send a SIGKILL when a terminating application 
waits for the entity to be flushed out to the hardware and all the 
pending jobs are canceled.

Regards,
Christian.

Am 07.06.23 um 06:04 schrieb Qiang Yu:
> Reviewed-by: Qiang Yu <yuq825@gmail.com>
>
> Applied to drm-misc-fixes.
>
> On Wed, Jun 7, 2023 at 9:18 AM Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>> On Tue, Jun 6, 2023 at 7:33 AM Erico Nunes <nunes.erico@gmail.com> wrote:
>>> The drm sched entity must be flushed before finishing, to account for
>>> jobs potentially still in flight at that time.
>>> Lima did not do this flush until now, so switch the destroy call to the
>>> drm_sched_entity_destroy() wrapper which will take care of that.
>>>
>>> This fixes a regression on lima which started since the rework in
>>> commit 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and fini")
>>> where some specific types of applications may hang indefinitely.
>>>
>>> Fixes: 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and fini")
>>> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
>> Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>
>>
>>> ---
>>>   drivers/gpu/drm/lima/lima_sched.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
>>> index ff003403fbbc..ffd91a5ee299 100644
>>> --- a/drivers/gpu/drm/lima/lima_sched.c
>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>>> @@ -165,7 +165,7 @@ int lima_sched_context_init(struct lima_sched_pipe *pipe,
>>>   void lima_sched_context_fini(struct lima_sched_pipe *pipe,
>>>                               struct lima_sched_context *context)
>>>   {
>>> -       drm_sched_entity_fini(&context->base);
>>> +       drm_sched_entity_destroy(&context->base);
>>>   }
>>>
>>>   struct dma_fence *lima_sched_context_queue_task(struct lima_sched_task *task)
>>> --
>>> 2.40.1
>>>

