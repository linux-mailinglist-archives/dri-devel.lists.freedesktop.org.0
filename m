Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D11124D5265
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 20:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFCF10ED1D;
	Thu, 10 Mar 2022 19:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02FC10ED2B;
 Thu, 10 Mar 2022 19:44:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTHkINq2ozQ8HCoPFsZVWgDiGD4hcqitIO2FqhpVkgdB+bPTZtiNLW4ghH8jsAHISE4czXJiSXVcUVIjuJUmBM6YbrpNB8DHrhfevYAOYMlXQDrkgm072c9VZSY+I/6f7aujtYRu0S/vuUUyQqWkdbmJzROWnhg7UFe8WKb76eS3T5r577xb5y3cWngLtZVMgUGR5uYRQRWOPAVujPNNxnRUWpbu80S79kOKq5nMKh1FsvcB4JMx+gam51RQeB8IfNJjYJO5YEoAxH2LM+VajGc8XDqs/vWWAu6RW80SqS/pqAlX08213itbhtnfDIq3a3rcpPJwe6y5L4XBv37PQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0z0ODv6B6ztePPaCjHGShugbPhtNCnwMRxETBAEsKvI=;
 b=RAYiKnTS/Wu0i1EF3ZuReGYnxBadUNVPCBwN6Nv6gw8SeQV3JxGFtfX7qSfz4DezkuUanjVmns/r/YnWCvMyeSKW5FAVFjcmF7ibkwhrA8ZITu+VisfLG9TGgElvIhI+oymDQ1GFIv/wEciXusU+O7SOAWlwi6gxfuFSANxVxUaKHb6uo/ZHPnl1eS4KQxrSeNs4/5OjtdI0WhLpNo4a7QFNAWjE83v9Aw2sB4gT7Tj4muTkNpxelEPTDlaZ8sxXooa1NJtUxf7nsSOk38LnSfEeb/zuEv68PxwRWznMSEWdv3wFk4X4RctbMaE/SUSJMp86YrT7JaG4U8PcnXAZmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0z0ODv6B6ztePPaCjHGShugbPhtNCnwMRxETBAEsKvI=;
 b=p/kxdziqx8PWvuD1CaI5Tq+eZSMM842K1ig5Swno3MXMhp8noX2Kwa9OrDVypGQUunQd1NjpvIQVnGyRmheiiQHSGWJdgAVmRIsHbFdS+RInreUzjQ78bP/vUhP0WZeT9TQeaxCDZh/2Fc/vFnJl9c1OUzOPwUqR3k9VGszHJps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by BY5PR12MB4918.namprd12.prod.outlook.com (2603:10b6:a03:1df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 19:44:14 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::f037:e2a1:f108:125a]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::f037:e2a1:f108:125a%8]) with mapi id 15.20.5038.029; Thu, 10 Mar 2022
 19:44:13 +0000
Message-ID: <cda15a47-f469-2a7e-87b6-adf00e631ef0@amd.com>
Date: Thu, 10 Mar 2022 20:44:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <CAF6AEGsmectHSmW-Y6rf+AksXTkges7rukeiYd4yDm-xwdb1=Q@mail.gmail.com>
 <55629bd8-9fb4-2ee7-87f0-6c4c77cf06fc@gmail.com>
 <CAF6AEGsgDTphUm7ET+RuMmh2aTn-Ho5gJdUJ4kwJ3iOh7+HGvw@mail.gmail.com>
 <4f2b2329-3c57-3895-6732-875db2f98b5a@amd.com>
 <CAF6AEGvvskobh6YOUx55_4rtXJJjPO0PxWY8+EKiVqntT3k+ug@mail.gmail.com>
 <6b400b8b-1b5c-a339-2345-f317f197b4a6@amd.com>
 <CAF6AEGt0XhqzkyEhbNcNVQO_A_Lo4qcsPRZRL6QqYn+NWAfv9A@mail.gmail.com>
 <bf6922f0-da8e-eef6-8217-26c1f50f3c48@quicinc.com>
 <2980e6a0-624e-2b80-c5d0-c40dfce76fb8@amd.com>
 <CAF6AEGvC=k4xLA-0iTSf660X2o04E+ivjnThZA-=WANKzLSvpA@mail.gmail.com>
From: "Sharma, Shashank" <shashank.sharma@amd.com>
In-Reply-To: <CAF6AEGvC=k4xLA-0iTSf660X2o04E+ivjnThZA-=WANKzLSvpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR04CA0031.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::44) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8befd482-a671-483d-8bb6-08da02ce5a47
X-MS-TrafficTypeDiagnostic: BY5PR12MB4918:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4918187A9D2AF7BD38893244F20B9@BY5PR12MB4918.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CD5dlCBM53v0KpJEPKOTSqAuaSXpcpF6B3K4IhlNxAiuxs59QqJ1L1Wna47VbGAomqO5UScHCxFFtpypMc5ulwWfefPdpx8np56qZu9FCkbfKXnrqCXPstwDK9aQQzWcqIpevUar1xV+lWTr0l+Vx4nSpY2NZWT6/g4Z33qcnLBQ7USlBasgE3F+DI3yQIR97uR43l3V4AvahLNwg/ndaKuIbgU6qRBjtILqSg/bdZDCGFMNDhTNSUi2MHf4orzeYUtRdOY7+PN1pvKycGGIqSGVYHG0uibZ19npF5csGBXdseD/FFqyF3mtj08OV6ZYKmIhqghf+3N2Tk+ZhLHrWo+K2ytn0uB76UXckMYyxOCL1HAAKSESGl9xwRJdQev8RAlkGNq6Jf1yMi5PmnOcuFCJt8GR0GyfBUiUNUWNF0um51RWTsPGheyiEnFbqFG7vua2/JskJn4kA3X3BjhYLDb0MCp+gY7LK0/j70kkN+roODvFmGC4oSvuXymYVluaY0JFgKslMPzVICi1ot0tWVIzylbphUQ9D51VRWm+yYjLssqHddnEFTtzqphrMJoA/fZmkE010qcvZXHeQLemzJSt+Wfq5J1LjkJTH3W7jDYK1gYBtJWXkQOFjZCk8q7xyZy89HUx3DA8OQNlZKbc0cN4TXOB3S1z7roffDlEpYGceoxQ9eA3r+9fdVaPVLJ+EuiMf5anymdUy65wn6gkPjEBieR+KCWAGqts1fkgxHdLWyiqG6onWOYeKGJC9BvCuBIzyuEikM2vgCuObIuaFNIWkC4oAfdU8lM+U/O9FUrvCZEAK7b/O8zOeqwWMVG0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5040.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(83380400001)(66946007)(4326008)(508600001)(66556008)(66476007)(8676002)(6486002)(966005)(5660300002)(8936002)(6506007)(66574015)(6666004)(53546011)(36756003)(31686004)(26005)(86362001)(186003)(316002)(38100700002)(2906002)(6512007)(2616005)(54906003)(45080400002)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFU2eWlXRmFQVHUzRlIyTVFUNFpid1hZenJPelgyK21DRkx2Zk9xYzZ0SHVP?=
 =?utf-8?B?Q3RLdS9YaTlXeHcvTjlPdUlFME9IMkJhTStkdFNqMklCanB5R29TaW52TWpN?=
 =?utf-8?B?MVhsY2YyZ0VESmJIT1p2bEplRWpaQ095dVVhNWxCdElUQS9vUmNESzZBTm5F?=
 =?utf-8?B?K3g2eXVIWnEzVkdwSXZyMGxmWElHUnpTMVhQcERxL0FIeU00Rkx6aXJWNU15?=
 =?utf-8?B?SHY5ZjdkZGZ1L0c1dEpBSGdKQ1BQYS9wZzhsSGVaYlBNSzlQTlEyNGdWUVJK?=
 =?utf-8?B?TGhWUTA5aytCdU5Kcnl4NDVSVVoxT0VFRjVRWmNGTk5UbUh4OFdWVmFhU1dD?=
 =?utf-8?B?d1pNbmh4Mjk3anN1YmYzVWhlUytjVWlnOVluT2FWNXNPdTM3TzN5MnhrcTFr?=
 =?utf-8?B?dUNTR2tyQStlQnNtNmdlZVVuN2wrWDNxLzRiK1ZOeXRTVVdSY1p0ZE5PV0Y3?=
 =?utf-8?B?MFIvR1hOemtqVC9tMVJDWlNqak8zSDNtWUtFck9XenQxWkRYdXhwbHFKNWd2?=
 =?utf-8?B?T1FzSWlnU3kvUFNBRkRlSG9DRmQyTFdQWG5NRzVXbkwwUzh0Y3p1Q09GdW5y?=
 =?utf-8?B?bS9VQ0hlUlBqZlhrZHdsVUk1UzVzcWZzTCt0Qkp6ZXBxR085NGdMVWdjT3E3?=
 =?utf-8?B?cTRQZTRJdy9yL29DalNwd2llTkVIYXg4Q0kzK3JZb2V4SENqQVM1Ylhkd0dl?=
 =?utf-8?B?bnNRUmxWbkpsQW0vYUQwZUZqcU81QTFKcklqdURxRnFYU1Z1ay9LRlREdUpz?=
 =?utf-8?B?ZklDckJSSmQwRk51bG1kUnVZOUxUSkV0dVBkRWlER21pZGR6am50NVlZMFhh?=
 =?utf-8?B?ZUppV0NCd2Ezc3pGSUVnZmNTNklVeCt4Y3U2RU9uU1pSVmpTQkJ4NFc5bzRM?=
 =?utf-8?B?Rk1tRTVYSEEzakt0WEZ4ZXBaYVVQSm9PMXFzSG0vcVhBZ3pEWVY1Ymt1RXU1?=
 =?utf-8?B?Y3R5d0JHd0xoem5MeFl6T3grWmUyc240QjduQXcrUVRYM0JzOFN3bEtnQnpE?=
 =?utf-8?B?dGcxSGZaZFJzV3A5MGF2N0l1VGw4RHY5NmNyOXFKZTNkT281N0ZPUjF3bmlQ?=
 =?utf-8?B?Tjk1aWplNi9WQXg4ekVpMFRvbUNBUmRWRjRIN1RQcCtUdVl5WXlsUityMnBN?=
 =?utf-8?B?NTBRYkFmRElwTHFzb2VKUFJUTDNmaTJwd0M0cmV4ajUzSFN5SE0rSWNaWUNy?=
 =?utf-8?B?TnJOZFc2czU5QkhneFo3MVMwYnhBTmp6WWdGYWRubDc2ekttYm1FcDEvWEdR?=
 =?utf-8?B?cXYvb0FDYXEyYW92bW5VY0ZWb2tEYytveDRWNW05SldJTnZhbnl4MXVsLzJs?=
 =?utf-8?B?NkxzbjNXQVp4SHE4bHcweDNOaTJNOHByckFqQkxzSm5CcGNFNFVoVlQycFFK?=
 =?utf-8?B?djMyQlBnNTJZbEIyTkMzVklxM1ZmOGlndHNlVjZoREg1dFJKQllrUUdmSENk?=
 =?utf-8?B?cUxOQXlIS1Z0OVdoU28vQ1lGZGVzSDJOdEk2VmViNFFSL2NTMVdIS2svUDl4?=
 =?utf-8?B?aGpWS1ZmSnd5eFBLMlovbC8wYXV0T3Y4YnNpd1M5VDFDQnAxRDFScXpLWERX?=
 =?utf-8?B?Q0t4UGZnbFI1cFR1L0RTWEJKOUhJMjZOY2huamVwaHBsMUJWL3FNQ2lIOTBF?=
 =?utf-8?B?ZVlFNzdpb3FqbUQxMFc3M0pKdStUWllKZzg5bEw5d0NZWnVOV05TektJK0g4?=
 =?utf-8?B?UWRoNDcyT09jTnVCUnBaYVlpWnl1NzNQTk9LYXFQb3VaUFVVYlp5SjkwY25w?=
 =?utf-8?B?M0Zpd2s3TFl4MUNYQk9WS1ArVHVERnh3Q1pYeUs3SkxYcEgyYU5ZQjVaT2Jj?=
 =?utf-8?B?bUE1Wm5MQXpKN2MrSTFMTDdzSG5wM2ZUb09DRmhYMzNQU3lUb0lKVVY1Ymhi?=
 =?utf-8?B?WFhHTWxDaEU5bGZzc0ZBQWxwS1k0NFRRdW9CRDhkUGZ3QU9ZRkUyQWxmZmxQ?=
 =?utf-8?B?aFdiYXhIR08xUC9udlRXaWlQcEJlRTVTdzlWYmd5SXVkalZqaFB2Q3dybmNR?=
 =?utf-8?B?dW4vcERvU0tPV2cvMkJqZXZmN2dZU0E2ckd0ZHJoQ0x1MExSN0ZoM0l5U05i?=
 =?utf-8?B?MGc3TjR3dHhrUWFMZDREM01GTVlzZDUza3FGOURFN0NQSFhET3JHd1A5MzFs?=
 =?utf-8?B?K2EyY1hzQTRzT2dYNm04a0hEemZFSWl0Sm8vaFhVWCtoUG1keXIvZlV6d2xK?=
 =?utf-8?Q?Exz5/x2goMjT5kis1zwusPk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8befd482-a671-483d-8bb6-08da02ce5a47
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 19:44:12.9872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5n2Keot2iwszlXbpW7aB+XXfnbtFKuDKFoGxUKf+r1lVzN0T9bX2n4YhSEW4GmXX/+VPm7PejcgBUZvI8kw2Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4918
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/10/2022 8:35 PM, Rob Clark wrote:
> On Thu, Mar 10, 2022 at 11:14 AM Sharma, Shashank
> <shashank.sharma@amd.com> wrote:
>>
>>
>>
>> On 3/10/2022 7:33 PM, Abhinav Kumar wrote:
>>>
>>>
>>> On 3/10/2022 9:40 AM, Rob Clark wrote:
>>>> On Thu, Mar 10, 2022 at 9:19 AM Sharma, Shashank
>>>> <shashank.sharma@amd.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 3/10/2022 6:10 PM, Rob Clark wrote:
>>>>>> On Thu, Mar 10, 2022 at 8:21 AM Sharma, Shashank
>>>>>> <shashank.sharma@amd.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 3/10/2022 4:24 PM, Rob Clark wrote:
>>>>>>>> On Thu, Mar 10, 2022 at 1:55 AM Christian König
>>>>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Am 09.03.22 um 19:12 schrieb Rob Clark:
>>>>>>>>>> On Tue, Mar 8, 2022 at 11:40 PM Shashank Sharma
>>>>>>>>>> <contactshashanksharma@gmail.com> wrote:
>>>>>>>>>>> From: Shashank Sharma <shashank.sharma@amd.com>
>>>>>>>>>>>
>>>>>>>>>>> This patch adds a new sysfs event, which will indicate
>>>>>>>>>>> the userland about a GPU reset, and can also provide
>>>>>>>>>>> some information like:
>>>>>>>>>>> - process ID of the process involved with the GPU reset
>>>>>>>>>>> - process name of the involved process
>>>>>>>>>>> - the GPU status info (using flags)
>>>>>>>>>>>
>>>>>>>>>>> This patch also introduces the first flag of the flags
>>>>>>>>>>> bitmap, which can be appended as and when required.
>>>>>>>>>> Why invent something new, rather than using the already existing
>>>>>>>>>> devcoredump?
>>>>>>>>>
>>>>>>>>> Yeah, that's a really valid question.
>>>>>>>>>
>>>>>>>>>> I don't think we need (or should encourage/allow) something drm
>>>>>>>>>> specific when there is already an existing solution used by both
>>>>>>>>>> drm
>>>>>>>>>> and non-drm drivers.  Userspace should not have to learn to support
>>>>>>>>>> yet another mechanism to do the same thing.
>>>>>>>>>
>>>>>>>>> Question is how is userspace notified about new available core
>>>>>>>>> dumps?
>>>>>>>>
>>>>>>>> I haven't looked into it too closely, as the CrOS userspace
>>>>>>>> crash-reporter already had support for devcoredump, so it "just
>>>>>>>> worked" out of the box[1].  I believe a udev event is what triggers
>>>>>>>> the crash-reporter to go read the devcore dump out of sysfs.
>>>>>>>
>>>>>>> I had a quick look at the devcoredump code, and it doesn't look like
>>>>>>> that is sending an event to the user, so we still need an event to
>>>>>>> indicate a GPU reset.
>>>>>>
>>>>>> There definitely is an event to userspace, I suspect somewhere down
>>>>>> the device_add() path?
>>>>>>
>>>>>
>>>>> Let me check that out as well, hope that is not due to a driver-private
>>>>> event for GPU reset, coz I think I have seen some of those in a few DRM
>>>>> drivers.
>>>>>
>>>>
>>>> Definitely no driver private event for drm/msm .. I haven't dug
>>>> through it all but this is the collector for devcoredump, triggered
>>>> somehow via udev.  Most likely from event triggered by device_add()
>>>>
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fchromium.googlesource.com%2Fchromiumos%2Fplatform2%2F%2B%2FHEAD%2Fcrash-reporter%2Fudev_collector.cc&amp;data=04%7C01%7Cshashank.sharma%40amd.com%7Cb4e920f125ae4d7de29708da02cd3112%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637825377562005233%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=M4xHPErex4vn7l3lNPgniiMp%2BKb3SpOHQo2QLAndxDQ%3D&amp;reserved=0
>>>>
>>>
>>> Yes, that is correct. the uevent for devcoredump is from device_add()
>>>
>> Yes, I could confirm in the code that device_add() sends a uevent.
>>
>> kobject_uevent(&dev->kobj, KOBJ_ADD);
>>
>> I was trying to map the ChromiumOs's udev event rules with the event
>> being sent from device_add(), what I could see is there is only one udev
>> rule for any DRM subsystem events in ChromiumOs's 99-crash-reporter.rules:
>>
>> ACTION=="change", SUBSYSTEM=="drm", KERNEL=="card0", ENV{ERROR}=="1", \
>>     RUN+="/sbin/crash_reporter
>> --udev=KERNEL=card0:SUBSYSTEM=drm:ACTION=change"
>>
>> Can someone confirm that this is the rule which gets triggered when a
>> devcoredump is generated ? I could not find an ERROR=1 string in the
>> env[] while sending this event from dev_add();
> 
> I think it is actually this rule:
> 
> ACTION=="add", SUBSYSTEM=="devcoredump", \
>    RUN+="/sbin/crash_reporter
> --udev=SUBSYSTEM=devcoredump:ACTION=add:KERNEL_NUMBER=%n"
> 
> It is something non-drm specific because it supports devcore dumps
> from non drm drivers.  I know at least some of the wifi and remoteproc
> drivers use it.
> 

Ah, this seems like a problem for me. I understand it will work for a 
reset/recovery app well, but if a DRM client (like a compositor), who 
wants to listen only to DRM events (like a GPU reset), wouldn't this 
create a lot of noise for it ? Like every time any subsystem produces 
this coredump, there will be a change in devcoresump subsystem, and the 
client will have to parse the core file, and then will have to decide if 
it wants to react to this, or ignore.

Wouldn't a GPU reset event, specific to DRM subsystem server better in 
such case ?

- Shashank

> BR,
> -R
