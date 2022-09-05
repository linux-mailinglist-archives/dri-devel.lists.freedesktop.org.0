Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4D35AD68B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 17:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9027210E409;
	Mon,  5 Sep 2022 15:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB7210E409
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 15:32:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7bKt4QQC33KY8/t2BES5avqCxN8RDX8LIP4oE9P9fCaJ+Q0D3Ow9piN0oNdJXhkznYzDZjba5yV5nzJo8vkiQuSlu2MLwEusUr0xnQ+ccfWSR5tmcqIxjVU/yqMe1w054S1qFHf6VCccFE6Uo/Asfw6aoKthgy4DS7PRSoZlE5mlNYbqCUDP4J6LX2LyOttoeHZl82Jag96uVE/ka3mcDap+7rPp7vQk5Q8cO+nkmPdTA/SrItnZyaEgJ1b2EH3t9fL+0xd9MIH3oM7TqrQJLtWOoVuOOPKjQNqGxt4rGSMOvhzqEhV2IQ6W4wo6fIsECalv+RW2TVRS2OPc+R9Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPcAxiR3eQg5ZV43nywZlrZzLuwPPSKfyhjh1V+9NBI=;
 b=FxCk2y3kJshucWT1TQhK7gx+r1MeKEZQseHtIS9raljWwf8oc361kHIJW4ZKXbnjz6hgFmysPfaiaibIZXTesbZtkWhZgE67v/TGNP2O96oaFJeSjGApVWBukNuCbuFYBSRVhHhP5n7zkqZSteu4vrdzJ5KqTBFiPhIxUF8qwF8+QynziJz8kViwE7ESXHF/KKbPYSD2Ig5VRnuMMjP/RK5sbukn8+dLitRh7IQDScsPSmZXzphoyvzC3RqLYlXIDGpXdy5MJZELGyGBCluS9CS+qKqGtTFq+CtGOoZ0fkS0dOVbrALsUUaIjQ8ZpELFCTvokSpSEqLzCjQao7No+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPcAxiR3eQg5ZV43nywZlrZzLuwPPSKfyhjh1V+9NBI=;
 b=NzCfcFvnJJ+kB+eFkasmGmP0zRMmHVde6ppoGYJH81NK5zaAyIKagh71od2tSj1HApESrQZxDLu+y/PVam8cseipLdsfglVdeO1m9V5QmqEBWIuWxTWs/q2Q/DpY5ZB0+s9L1IePbyI59Gt3d7xpBkitOT+ZCJGQVL04PTmpHwg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB7384.namprd12.prod.outlook.com (2603:10b6:303:22b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Mon, 5 Sep
 2022 15:32:24 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 15:32:24 +0000
Message-ID: <46ae09bb-2514-94b9-4497-e275bcc5f1ee@amd.com>
Date: Mon, 5 Sep 2022 17:32:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/4] drm/sched: Add callback and enable signaling on debug
Content-Language: en-US
To: "Yadav, Arvind" <arvyadav@amd.com>, Arvind Yadav <Arvind.Yadav@amd.com>,
 andrey.grodzovsky@amd.com, shashank.sharma@amd.com,
 amaranath.somalapuram@amd.com, Arunpravin.PaneerSelvam@amd.com,
 sumit.semwal@linaro.org, gustavo@padovan.org, airlied@linux.ie,
 daniel@ffwll.ch, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <20220905105653.13670-1-Arvind.Yadav@amd.com>
 <20220905105653.13670-3-Arvind.Yadav@amd.com>
 <96d14c8a-e3de-fcea-b3b1-434bc6a78ae4@amd.com>
 <5b84f7c1-99a6-02c8-2606-8986891a95b0@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <5b84f7c1-99a6-02c8-2606-8986891a95b0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0574.eurprd06.prod.outlook.com
 (2603:10a6:20b:486::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36f422ba-b6e1-4977-2c0e-08da8f53d4c6
X-MS-TrafficTypeDiagnostic: MW4PR12MB7384:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MD8Emrq1nqzhABNuHr5qIIcw3Z16fojCbJmHAgAVOKIPXQqVE2F5YeXzu0cgbU7DeURk417kG5ltweJLv+D9qgSg1vHG4utdVjDYRdeQsyjLKnj+v6GdvXS/TlcJbF11EwJRKKWE8qkkskvCZksb70Wny5LpmU12SMhEqrcg6aeG3L8utqBMnYWswZlB0apfySMQ71nHMULP35ba7T75UUOJr8DDc6yQL0eobV6KRzLlc0L2DutHtLded3AgLCPTVGkluvsNZ8BYDSMiULMls3kGACvJ7VgkZyfB6FybT6SJZBnv4/tPsCvOTsCqgryKIuMF2vXAoe8Vyb9ablVofq96lqh0UyBP3ziAyRuPcbAKBdTFWiLp+tdV740x/VTGP6fa1BpFbEkKumBDsHg5XbIwaFfevKZ+/g6UZYlirdmFWZQMoCCfN3PGG9/y8KPaiIt6CpsfODHjw1sPC02hwdovMPiERipe0++GLf+Cl33qSRWlFWJdjlZKA6SW0uCPPdoa1Y2oMoxo1o9hlV4yB1CEwxJK1sKg8+l2H/CprRrhwMqNZWZA21axyRchD9nIaImXPwhW6eVzjz8blB/N/UjCqEiZqI4rvsu/B17PN5xij8gKWxckTsVsZiPRe5AD72fEfn8maJjI7l5jfT46mR/h6DS2YFb1ocr142N9KY6CmKA/i5g9NpGZPN3i9wO/MGI/GrEdI71YIUZyAgGvNNanYzT1ebRb/URmfe1OslFsLF4fJeylrRlIuIRUQjXcMy//roWogqJ3uabAEvFApOoCqi+hRGu2aq3NTaxJCOBKXaiuHm3qTDVruueaXkMv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(921005)(110136005)(316002)(2906002)(31686004)(66476007)(66556008)(66946007)(8676002)(478600001)(6506007)(53546011)(6486002)(41300700001)(8936002)(36756003)(6666004)(5660300002)(38100700002)(186003)(66574015)(6512007)(86362001)(2616005)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uy8zR2FQMHZPcS9YZkZaV1lCcE11N2hXWk4zQ3hCSjlPTmJmU1dQVEVocjlI?=
 =?utf-8?B?eGUyT0tES1hXZkhFVTJoQ21yRHZpbTFtVW9SMmw5dWdVRERiZ3AxS3pLUWx0?=
 =?utf-8?B?MHhZVmVGelhzMDQwN1cvVDdzdzBIMFpMWFFmQzFWZ3J2WGVtanRQelE1U0dI?=
 =?utf-8?B?azI3bEUwSnRJdHREUm9jOVAyemk1am9yVVBqdzJMcGorSFRYWjNTK2hrNlQw?=
 =?utf-8?B?OE8xSkNWQ1U4cXVHdVE1RHJrUnEyOFdCc3Zid0pla3hlNTAyM0Nxb1E1T1RY?=
 =?utf-8?B?amRQTXRhKzVESGRsNVRiS3BJMlhsZkl3OGVXWktWNzE4Ti9ISlFGNXNuY0ov?=
 =?utf-8?B?YXgxUGthOVg5TDFYNngxamQwcmgvSG5ZbkpLNldSQ0hWVGd4RnBadFNkZktO?=
 =?utf-8?B?V1o0VWs3NUhDb0Y2TnFrTkVWY2JJV3VKdDNHRUhVdlJTYVhreFZJU3MwY0U4?=
 =?utf-8?B?U2pYZjN4Q2pvck1iZkd3bEFyNDNweHpFQ3pwczFjNlFBNE5DQ3BraHlXREhp?=
 =?utf-8?B?QWttVGdlZTIvVU5mOS9wN0Roa1d6MkgwbWR1NUNEc0MzRThDdVdpcXFJaG1n?=
 =?utf-8?B?OWo1Mks2QWVIdFNwUmUyTE9CZmZUa2l2dWtrTnoyTmJKRXhMWUpySk9ZSVJj?=
 =?utf-8?B?eDR6VDhuT1IzNVRBeEhaMzZHNzNMcjNGaWRjbzlPK01QdnFDVHA4TG1EbU1U?=
 =?utf-8?B?bjJaVm1HU3l5OXNMQlE2blcrSnp0TkZZZUsvWXNUdHN0K0lWa3R0dGplSG9Y?=
 =?utf-8?B?SHFIRUx4K3hiNG9tRmZJbTArc2RKWG90eU11UUVNNytRNCtaZm4vdjBkc3k1?=
 =?utf-8?B?bEU4U3hRL2txb3J1TEl5cFoxaGRVK3JsMjZwcytHVEN5YXJLN0pJM0QwWXpi?=
 =?utf-8?B?a0xzaVdjNUpnNkpUaktONUdiaVhJV2I1eERERlFXaG9VMGhjTTZESXlvUDA0?=
 =?utf-8?B?aWE1ekI3emdLOTIyU0RUT1hQODEzaUorZ25LNTFPK283V1JweHhTclcyUDlC?=
 =?utf-8?B?d1c2d29QcHJ5NnRRUVFrTjlxYStVaDFwTEorRTAzQkVMdzM4OHZzT2hoejNC?=
 =?utf-8?B?K3gwTSszOCs3d051UjlSYldOWXpKa0ErWHdPamxpVFpvcTNWK2RabmdZTTEv?=
 =?utf-8?B?V0tjN2VQVE8wNlp2TVNXaFFPaTc2UVhRNFRlalI5Zk83cFNrdUVDcjg3Qnpw?=
 =?utf-8?B?eFhvSDUwMDR0Y3k3RURzZTZRSkxYSVlSTzhFL2Y0SVhsOG9EUExXdldwZHl5?=
 =?utf-8?B?eWVXQVdISmI4ejVIeFdBOFFOeCs4c2tjV0RJQ25BM1o4ZFhGSnVWYVdoeXIv?=
 =?utf-8?B?VS9XTW5qR0dUcHBRUUhBbGtZVXVaYWpHSTlVaFBHMFlFQVhFQnZ0clRSdW1W?=
 =?utf-8?B?dFdkN29ENThVQjU4Zy9PZUh3SE5EWVU1UDlMc2pVOGNGVEJwLzNFZ2Z0RkFi?=
 =?utf-8?B?dnZNUHFkL1ZhblVBNHBjM1oxK1EwZGIrWGpkSlcyUE5pQi9VQ3BGeVBRMlpm?=
 =?utf-8?B?ckpBSktsa3Nub0ljRSs4WjZRNXZpM0tPY3VSYWlRd1hzYTVEbzhWU09UdjQy?=
 =?utf-8?B?eU5Oa0dQZnd6UytrZDByTGdvUzJZN2ZSMlhvUG01RzZ3c3AzTnVsQjkyRTFp?=
 =?utf-8?B?OGw3WEp4MWVVN1BHdnBiT3B3SzB4U2ZSOVhBUEtySmlMSHIyc0dDVHJ4VXRy?=
 =?utf-8?B?ZUp2cDhWYVF1MDVWQTgzRDd6TmEzNndteUoxYjFDQ005MG5lQnFzdGJiU2NO?=
 =?utf-8?B?TzhKcUtubStYdXNIWU5xSjlodG9lRksySGlGRW9FY1JxTmpUQmFpNER0QUU2?=
 =?utf-8?B?L2pIMSt1aTZqVzFqUGtuc1NWai9PTkN2dUN4QjRVTWhabXF2OVh1ZzNaVVN1?=
 =?utf-8?B?a20rYlNiVlI3NEQ2K2ZHQlc2Uk9HN09udUhRL2VicFRLWkp5Ymk4MXNXaE5W?=
 =?utf-8?B?SWU2Umg2Ui9UTndLUEZyQThiT2I2ZitIWXdiYzJXS21RUnBIWjR1NEpHejNl?=
 =?utf-8?B?WUZtdlY2NURGZEk0ZkhYZ1lmajlidmpxY0VXQnRnMWhhT0wxZ2tYYTFiTEVt?=
 =?utf-8?B?S0xSaVl6UlZXUnEwblRWUzA3VXhTcnIwQmZFSHdwNUFxMTVpNlZHbG5qOHNy?=
 =?utf-8?B?RCtHVGhTd3h2bDdRZ3JZOXh4LzBBUVZhNjZXd0tqKzZDaFBKZGFuRUhBWThJ?=
 =?utf-8?Q?JLjXknh0uaZ9/0Y8RtUu3KNMc4pPrnbTw9zMMFtHwcvb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f422ba-b6e1-4977-2c0e-08da8f53d4c6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 15:32:24.4598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7DYDqeZRIYPI7txKobZe4iUGold0IRO01BCu6Jy+m7h7Q3GaFVL4LzH+5GrMvyC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7384
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

Am 05.09.22 um 15:46 schrieb Yadav, Arvind:
> On 9/5/2022 4:55 PM, Christian König wrote:
>> [SNIP]
>>
>> Am 05.09.22 um 12:56 schrieb Arvind Yadav:
>>>       .release = drm_sched_fence_release_finished,
>>>   };
>>>   diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index e0ab14e0fb6b..140e3d8646e2 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -961,7 +961,9 @@ static int drm_sched_main(void *param)
>>>               s_fence->parent = dma_fence_get(fence);
>>>               /* Drop for original kref_init of the fence */
>>>               dma_fence_put(fence);
>>
>> Uff, not related to your patch but that looks wrong to me. The 
>> reference can only be dropped after the call to 
>> dma_fence_add_callback().
>>
> Shall I take care with this patch or I will submit separate one ?


Separate one. It's probably no big deal since we grab another reference 
right before, but still quite some broken coding.

Thanks,
Christian.

>
>>> -
>>> +#ifdef CONFIG_DEBUG_FS
>>> + dma_fence_enable_sw_signaling(&s_fence->finished);
>>> +#endif
>>
>> This should always be called, independent of the config options set.
>>
>> Christian.
>
> sure, I will remove the Config check.
>
> ~arvind
>
>>
>>>               r = dma_fence_add_callback(fence, &sched_job->cb,
>>>                              drm_sched_job_done_cb);
>>>               if (r == -ENOENT)
>>

