Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F64948D875
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 14:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B63910FF14;
	Thu, 13 Jan 2022 13:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2058.outbound.protection.outlook.com [40.107.95.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1870010FF14
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 13:05:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PosakaSTzS6uysC4UaBcBHnW4VGOlwKoZfNbPVrANaaOxq1OD8Q3i3I9mkNgPrrOrGlBgWtaBp7tRDi1j9W8yCblXJq5GtRg5BN3/NmghJGbPaMBbUiyLYF0XjwefBCZ2NeG/YvtszkBUklJ2gR3KVXwLYCSEQyZ6YSVo2BF1P9Bq2aCx9jJnLEh1TQ/5FPmNV0ohH+Bp9nHI9zrDh70EWSWGhz+ir3sfwngRriGbaPlwiwRcGQDlZWLQZSjU7koccFu6bVLS3YyWrr+Y6+rrb24SX/w38e8AloUwPxWCQWbDQOelT8O5Z4jPyGQD1yYEpyWy7kH9EhGOPdkdWyvKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/3xytwaD9kG7qcZ30NdH1RpHar8az4dZcSWzXabsjY=;
 b=mfg40ugATgHpvuYpQJwe/Usf0+MMjZzIIB4EZwvRiQWvp8tHKAA7JVC1LAN9FB/dy6WoqrM/xh9i/kIyrNo4rzEdAeUv5/nE5YgBf5vk6ausC0WzDZOw881wxj6G0SCa19c8gx9l6UCdT3IAFvO8Enu9QjY2sj5qqVXSAcSxQHh63vf8BCnhapn14CidWzW87BfMpzQ1SbsDN4UnJ2WN3z1mtep2JxGPMgfwMc2HhHUzNInJ2Bmn5GzSl30/Y3rr0btXtxAHP61Gh+e3/pp1WUym2imGkmMpXhEG7YzaQtIcgbMia6xZo+qDC+EblQrK/N9LMeT8nL9rpZ0wjP9maA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/3xytwaD9kG7qcZ30NdH1RpHar8az4dZcSWzXabsjY=;
 b=HE1PNUAEGYWZfgGwLuC1q5arcdWXyAJhyns3QTytevmpyOyO7mBv7uc/YIp/0wYixDslB8RN+oO8tNhlB+rqgD+8j47KjZhEDLfYBML0bhybhbuIlZifCvbMF1x49xtThKGAp7Mf7Fl30lm1Sfcx7JO4aTvr5ZB4Pyble1HkxZk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by BN9PR12MB5066.namprd12.prod.outlook.com
 (2603:10b6:408:133::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 13 Jan
 2022 13:05:32 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4888.010; Thu, 13 Jan 2022
 13:05:32 +0000
Subject: Re: [PATCH v3] dma-buf: dma-heap: Add a size check for allocation
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "guangming.cao@mediatek.com" <guangming.cao@mediatek.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
References: <CAO_48GF=ttKqSOm9GRoA3Mq+-RQOtRjWp449XPcz-wH=kjaTjw@mail.gmail.com>
 <20220113123406.11520-1-guangming.cao@mediatek.com>
 <4f88205c1b344aea8608960e2f85b8f4@intel.com>
 <e657f5257cbf4955817b0bbf037de9f9@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <24157767-dc29-bbdd-5428-d89ecc6b9606@amd.com>
Date: Thu, 13 Jan 2022 14:05:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e657f5257cbf4955817b0bbf037de9f9@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR04CA0076.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::18) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18ce137f-f4a2-4256-1a26-08d9d6956183
X-MS-TrafficTypeDiagnostic: BN9PR12MB5066:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5066518CCC008E037D7EF50583539@BN9PR12MB5066.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hg2EAYWqC6L5uaezWkqH4ayzSkXxZr19pDPALiuhHNA4wE5PwSbNsEfOw/ifqFITe9eVx8h66ZKkYJmpFH0jFo5WCtT1i9ZTSK3PnNAcfvzLQ/XjFOiuXm7sCHN4jCvRd5JaWgRFI9fvnbueFZEqz3XWaFLaptpD6MIZGJTJwBorM53sDSKpsJHxFoCdu2BuFfeQJrm3iths5w54fREo18Rh4QrYhIRZp894rzNOnExWWrlKZ8Hi3NWimuuJiqj46RyEe6Rf/Ql5h3Sf/Ms40UCGb9avqW5HhElia6JKxQ4boVH6xeNNhA8va3CL2aX4kOHI1n0GAM/irn5UJ5UftFn+j9ssBLm/el/eSaj1NkKzhatJjkP249xT0NyAjQZgyhsIBXpmQ07veMtWSpbKXHULJHbLsKalRdsLjhcT4QECU9XYkeANcwHnJRAYwErAEg+tAcnk2AWCU+FxyHfkyFqvWg+JYKJmXMSVvE4VLNHsZjuCL+PBeUpkefCmEJxOfAIkO/n3yknqhSHRpajsWgkCn9gUblSZwJ4qaKXJ1KPoRnyhIEB55Mppgr1KeewTVLvprFkVyUzQSaN5EYmx2eL6huG2GJDuws7LWjh6R56uJV/zjGUwXrhU0atXQUN+c715bjVU8uQBOJTTvXPWKmjbOzKxP0gLRYR7Ncb3TKrjwNgrb37Y7EHADhBhuJY/v9cpGMfF5alkyQWx/K1JqwsisqbX2rVspy75/wCebEZ91H9pWCarrOr20NQFX11i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(53546011)(6506007)(186003)(110136005)(316002)(5660300002)(36756003)(8676002)(7416002)(31696002)(86362001)(31686004)(6512007)(6666004)(2616005)(66556008)(8936002)(4326008)(54906003)(2906002)(38100700002)(6486002)(508600001)(66476007)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzhidnYweUg2dDR4aXJqRXJIek80K21NWldVNThRaFlXbGg0dEtFR2FyZUQv?=
 =?utf-8?B?ZFhlRmhkL2d6eUk3L3hZNXJoTi9pYVhjS1oySU9KMGtiYmN1MWVodTFOeVFW?=
 =?utf-8?B?RlhkVzNIYVlvT3lrdFlmUWx3d1BjSWxBYkdvNjNIdUtJczBlT1JFL0NYYVpt?=
 =?utf-8?B?RW9UdXYwTm1IQndoSS9hM1ZoV2NXYnhVSmtKczQ1ZjJZTlIveHZlZ1RuVzNy?=
 =?utf-8?B?MWxSNWZvUWoza0wrWWF3R0RSb2h3OW1DT1h4bUpNVWtkOEFDMlFwaHJDWDFt?=
 =?utf-8?B?eW4xaW1XOFM0NktIUWQycTdpamEza0o2QjNGeTdXbjBrN0lJZkJzLzNURjUr?=
 =?utf-8?B?emcxVCtNbmRJeFVocC9KN2tDajlRYjFqazlGcDIyL0JINUNZOVl1a2JqenhX?=
 =?utf-8?B?NDM0RnNlRXQzYWFGd2t0YVp3V0dwK3craHpjbWVab3dZNThBTTAwbWJRNlNa?=
 =?utf-8?B?MW5pQ3NVYnF0TFowbVRXMDM4dXdrbzdHb1h0dW9NSCtqcDM4UmdSdjRhTHVC?=
 =?utf-8?B?dVNlMVBlNG83eEViMkt3bGswdndhMW0zV0tXR210Tm1zMDBqOGc5SkVQU0VO?=
 =?utf-8?B?ck1EbjRQMFBjTTRLbzNQdElBcVRPcGpPRDh2dlEvNGJVQmtuZmRPYXl2MzZH?=
 =?utf-8?B?ajV5THdrSG42L1U2VzNMOHR6NEtLZ0JIWGowUVdMS1F6Q0hXRFpncGZycjBR?=
 =?utf-8?B?ZmFUTVM4N3EvaDRDUTdtMjBQaGlLR2cwdXdNSzlXeXM5YlBjRXBGTjdqM3NY?=
 =?utf-8?B?bk9KdkdQZGV5bGp1UHBCeldhRU1xbVRiUzNvY0pNTlJFUmE2amc2Y0NXQjlZ?=
 =?utf-8?B?QmtMQWY3MFYvak01MEptYThjdHp3dUw3c21HS3gwUVBzQy9jYWFIVFZpVExq?=
 =?utf-8?B?aWRmNXVrK3p1V2x0c2pYd2YvV3J3N3UzekZEcTJvQmUydE5BbFZXYjdsVlNh?=
 =?utf-8?B?UXkzcm11Q3g2MVZjSU9MalhHeEdWcUN6bjNyYkpFWEhhaFFoUzU2Nk90ai8r?=
 =?utf-8?B?aXJPakRNcE1LZktaTHBIY0p6UUZ1a3JaNDF3SlY3RnNKU0tmc0p3SjBlU01X?=
 =?utf-8?B?bDdTYmtRSllvTkhHY2hubERLM051Z0hhWHFZVWs2bzJkeTJsMHZ4KytPRjk3?=
 =?utf-8?B?cVR2Smtma3pCaTNmTzFySEVtT3U0T2NQWjhaU0xBT1J2VWtKRlVkcldJN1J5?=
 =?utf-8?B?K0d5MzNpMnBRUk9DS3JrZ1RCRzdSTGVLR3lZY2lpdDJLVlpNbnRwRHhyRUtT?=
 =?utf-8?B?b0NGT3liQVVyVXl0ZVl4Mm5UNU5rMXpZZlZkV2xaLzNHbTNNTzF4ZkVQdXNn?=
 =?utf-8?B?ZVVEU0VFaGhSd2pCdGZ2OEh3bVBmcjZaMjRwbkRIc1NpTGRQV1dHMjkrK2NF?=
 =?utf-8?B?MURxeUVyMFc4b1NpWWVudjdsUThBK0VJZlZ4VGgyOC9mQk9QQVJwL3J3dmtG?=
 =?utf-8?B?VWNBbWN4Rmg2aGtsYmlPaXh2bDl0T1QyQmg2anhNcUNaaDJ2QmJMUTlIMzZD?=
 =?utf-8?B?VGVqMjJOOEdsVWpVU0JoZGFmaEhkRHo5b3dKQ3ErRHgra2hPdmhpV01rcTJU?=
 =?utf-8?B?K1RwR3Y2aUR6cXQvM1lLaEhWRjFzVjZVZXRvaG5FME1aakZHUjNzVFh1N1Ri?=
 =?utf-8?B?cWdwSU1YQVpqYXdmemhjWE1MY01hUmJZeTliUHI0MlBDTmVCdkoxM2lFM0JP?=
 =?utf-8?B?M3pjUVhaM05HMTNUUkhHWGwzNnNsdFJCajNHcTAwMlRTeVRiS0FLRm9WYy9y?=
 =?utf-8?B?ME1CY25iRHUvQzBtYlVpak5WVjArYWJKTUVOdHMwWVNWNDlVSjVEcE9yUjRu?=
 =?utf-8?B?YTMwYytzT0w1dHBlR3dEaEdraHZTNnpjSUQveW5KakFDSGJKM05oREp6czQw?=
 =?utf-8?B?Y0dJK1ZCOFJlenkvR0hERzlScjRVR2dBR2FDUlR1RHdRMnZ0UFZTcmovMFZM?=
 =?utf-8?B?aXBtemh6MHMrNmFvRkJITjhBUzhRZkczTnFCWk01K2xTelphY3MyTVNzbUk1?=
 =?utf-8?B?OWlBKzVqU3k5LzlPaHFkUEhwL1drdUFLRmx6NWlTWW9zMHhqMW8zVnZGY3Fm?=
 =?utf-8?B?bTJjbXFkdWdweVdUOHdnN2oyUUM1SndENHdUYWpTUEI2RXlFdXZramYzV0I2?=
 =?utf-8?B?NFQ5K2dqQ3R5RURVV3VmdXR6NThVNm1INFN5UUsyODd4bkRFTVJISXQ2bjZW?=
 =?utf-8?Q?/lg2T42dmpmRoPy7E2dILjg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ce137f-f4a2-4256-1a26-08d9d6956183
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 13:05:32.6119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ulYBrgs1WCg62CwjPCDXY6/Hb4VLB0JNh2JQvWOSrnS1walgJpa8NJtWfXX4GS8J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5066
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "wsd_upstream@mediatek.com" <wsd_upstream@mediatek.com>,
 "libo.kang@mediatek.com" <libo.kang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "yf.wang@mediatek.com" <yf.wang@mediatek.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "lmark@codeaurora.org" <lmark@codeaurora.org>,
 "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>,
 "bo.song@mediatek.com" <bo.song@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "labbott@redhat.com" <labbott@redhat.com>,
 "mingyuan.ma@mediatek.com" <mingyuan.ma@mediatek.com>,
 "jianjiao.zeng@mediatek.com" <jianjiao.zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.01.22 um 14:00 schrieb Ruhl, Michael J:
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>> Ruhl, Michael J
>> Sent: Thursday, January 13, 2022 7:58 AM
>> To: guangming.cao@mediatek.com; sumit.semwal@linaro.org
>> Cc: jianjiao.zeng@mediatek.com; lmark@codeaurora.org;
>> wsd_upstream@mediatek.com; christian.koenig@amd.com; linux-
>> kernel@vger.kernel.org; dri-devel@lists.freedesktop.org;
>> yf.wang@mediatek.com; linaro-mm-sig@lists.linaro.org; linux-
>> mediatek@lists.infradead.org; libo.kang@mediatek.com;
>> benjamin.gaignard@linaro.org; bo.song@mediatek.com;
>> matthias.bgg@gmail.com; labbott@redhat.com;
>> mingyuan.ma@mediatek.com; linux-arm-kernel@lists.infradead.org; linux-
>> media@vger.kernel.org
>> Subject: RE: [PATCH v3] dma-buf: dma-heap: Add a size check for allocation
>>
>>
>>> -----Original Message-----
>>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>>> guangming.cao@mediatek.com
>>> Sent: Thursday, January 13, 2022 7:34 AM
>>> To: sumit.semwal@linaro.org
>>> Cc: linux-arm-kernel@lists.infradead.org; mingyuan.ma@mediatek.com;
>>> Guangming <Guangming.Cao@mediatek.com>;
>>> wsd_upstream@mediatek.com; linux-kernel@vger.kernel.org; dri-
>>> devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org;
>>> yf.wang@mediatek.com; libo.kang@mediatek.com;
>>> benjamin.gaignard@linaro.org; bo.song@mediatek.com;
>>> matthias.bgg@gmail.com; linux-mediatek@lists.infradead.org;
>>> lmark@codeaurora.org; labbott@redhat.com; christian.koenig@amd.com;
>>> jianjiao.zeng@mediatek.com; linux-media@vger.kernel.org
>>> Subject: [PATCH v3] dma-buf: dma-heap: Add a size check for allocation
>>>
>>> From: Guangming <Guangming.Cao@mediatek.com>
>>>
>>> Add a size check for allocation since the allocation size is
>>> always less than the total DRAM size.
>>>
>>> Without this check, once the invalid size allocation runs on a process that
>>> can't be killed by OOM flow(such as "gralloc" on Android devices), it will
>>> cause a kernel exception, and to make matters worse, we can't find who are
>>> using
>>> so many memory with "dma_buf_debug_show" since the relevant dma-buf
>>> hasn't exported.
>>>
>>> To make OOM issue easier, maybe need dma-buf framework to dump the
>>> buffer size
>>> under allocating in "dma_buf_debug_show".
>>>
>>> Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
>>> Signed-off-by: jianjiao zeng <jianjiao.zeng@mediatek.com>
>>> ---
>>> v3: 1. update patch, use right shift to replace division.
>>>     2. update patch, add reason in code and commit message.
>>> v2: 1. update size limitation as total_dram page size.
>>>     2. update commit message
>>> ---
>>> drivers/dma-buf/dma-heap.c | 10 ++++++++++
>>> 1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
>>> index 56bf5ad01ad5..1fd382712584 100644
>>> --- a/drivers/dma-buf/dma-heap.c
>>> +++ b/drivers/dma-buf/dma-heap.c
>>> @@ -55,6 +55,16 @@ static int dma_heap_buffer_alloc(struct dma_heap
>>> *heap, size_t len,
>>> 	struct dma_buf *dmabuf;
>>> 	int fd;
>>>
>>> +	/*
>>> +	 * Invalid size check. The "len" should be less than totalram.
>>> +	 *
>>> +	 * Without this check, once the invalid size allocation runs on a process
>>> that
>>> +	 * can't be killed by OOM flow(such as "gralloc" on Android devices), it
>>> will
>>> +	 * cause a kernel exception, and to make matters worse, we can't find
>>> who are using
>>> +	 * so many memory with "dma_buf_debug_show" since the relevant
>>> dma-buf hasn't exported.
>>> +	 */
>>> +	if (len >> PAGE_SHIFT > totalram_pages())
>> If your "heap" is from cma, is this still a valid check?
> And thinking a bit further, if I create a heap from something else (say device memory),
> you will need to be able to figure out the maximum allowable check for the specific
> heap.
>
> Maybe the heap needs a callback for max size?

Well we currently maintain a separate allocator and don't use dma-heap, 
but yes we have systems with 16GiB device and only 8GiB system memory so 
that check here is certainly not correct.

In general I would rather let the system run into -ENOMEM or -EINVAL 
from the allocator instead.

Regards,
Christian.

>
> m
>> M
>>
>>> +		return -EINVAL;
>>> 	/*
>>> 	 * Allocations from all heaps have to begin
>>> 	 * and end on page boundaries.
>>> --
>>> 2.17.1

