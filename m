Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C08452B943
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 14:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CE010E4BD;
	Wed, 18 May 2022 12:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF3610F804
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 12:03:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcYsnb7TU9oBjupMr/Gv1X8NYQ01NROYeoFqDmkSMGlKdZnLl7nRjCgNrKXtd5odO2AJKDZH75lAiV8D3kkt+vQMpBlSFIACzdIqbEu4HpY/J62mLinNwJ1GNQiCMcxzbbF+vOcr6x9YxYATACDsFo9a3x/qC4ohkWpATTS5BadO7s8nCFYhXJY9jZxvqJKcrGsyconT2lcIvyQCENXRo4P8GTW9rwcsgmD0nyAqVKmjGb3wf6J3lUzq7HtjhXv6SGioIUPouwfdhv+u2LfBcak+86l96hn49OssKvEEuR8BUrtEQiHhTY80q+ufZsay4x9FZE4Oj6x8lcCcROjazQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3KFuxX+mUvErdLc/4ItB1fznJzX/iWBcgoTJ+UU+7E=;
 b=E8vppWO1+dh1xjQr8DM2ukHQDK+rpc+AzhXKxyyc7+KKdzK9XG1pcxhmgYt52tEtAh9CIKGXhFP0PH9LJHZ/pbHYaEWk1R2cxAhTan+89e7THj+tI2Vd4gsOQ1N2gYq5YvEBZf3/OouasLTVoA7iwjvPA8CtSY5LkDT0SRqaLvgm+9XpfTtDeTr8iUtdjNrMGZkGXibJhC+ru/q1jNv0SRqYYebjU/B9g3TF8JlQbWdbo+xONyvFG2zKOGvUF9qn3mzYApAgTVysg9BWJGtWOKPksGWVDC4TdEn+bP6QHgMEWpwDZqSBjgF5vkXv9c9Z6k2sJKy8H8Inw8h9AWXF6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3KFuxX+mUvErdLc/4ItB1fznJzX/iWBcgoTJ+UU+7E=;
 b=jnEQraTQO/iW+wtNCmWMJinihzgHBD4ET4T0bkrB6pMEGJCCzJ8Gy/QM51OgnvXzz5qw4eVfixSwvHBUMxCFtTHOXzV5+7H3jwE9/NUPjNTWqjdUVWjJTrJhmoD0I/6wI7S1rLE0tdqefMJaLzb/dHZpxh6OvS9mWF0rFoKmmQ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY5PR12MB6201.namprd12.prod.outlook.com (2603:10b6:930:26::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.15; Wed, 18 May
 2022 12:03:36 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5273.015; Wed, 18 May 2022
 12:03:35 +0000
Message-ID: <7f895a99-adfa-bcbd-c130-a924c668b8af@amd.com>
Date: Wed, 18 May 2022 14:03:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] dma-buf: Move sysfs work out of DMA-BUF export path
Content-Language: en-US
To: "T.J. Mercier" <tjmercier@google.com>
References: <20220516171315.2400578-1-tjmercier@google.com>
 <175c5af3-9224-9c8e-0784-349dad9a2954@amd.com>
 <CABdmKX2GcgCs1xANYPBp8OEtk9qqH7AvCzpdppj9rHXvMqWSAw@mail.gmail.com>
 <0875fa95-3a25-a354-1433-201fca81ed3e@amd.com>
 <CABdmKX1+VYfdzyVYOS5MCsr4ptGTygmuUP9ikyh-vW6DgKk2kg@mail.gmail.com>
 <YoM9BAwybcjG7K/H@kroah.com> <d820893c-fa2e-3bac-88be-f39c06d89c01@amd.com>
 <CABdmKX2m1b1kdACKM19S+u9uR5RTy1UGMRgd+3QA_oAyCpeggg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABdmKX2m1b1kdACKM19S+u9uR5RTy1UGMRgd+3QA_oAyCpeggg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0018.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::31) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c68ef7e1-dc21-4410-5dbe-08da38c66fc6
X-MS-TrafficTypeDiagnostic: CY5PR12MB6201:EE_
X-Microsoft-Antispam-PRVS: <CY5PR12MB620161E94126F00A929CF0F183D19@CY5PR12MB6201.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZknUcDnwpTw9T5vXnODpIV/hx4xduQ+U+Szb+sNxnFeiXG+sM7q9FNLHrJ7zy3O/GSe7+Iv4kcKncBP2GbNTEf7SfBGmFIvLwknXj39xyIygcyzX/iN4F3MqfJWgecClvUW8g2yHcxFwMim9CEjyQSWcx/34s0w/uY636g/yVsLnQQGb95S22zy8ak8K4L3Osbh/w3uzj9ZrJa+x7G0RJeWSQ5mE2DMbgrg/jvzkP0Ic7Ah5IFPSaosPFN+4r3sJUq5pRaPeau5mdSJ6reTAQx+C000owQsgHNLgu7VpROcWA0yuqKECstmGROGd4PgL/AwUiOtwopKrPrHrx7GOexS1uEnMRH6VTXIcydWYI3A4tfinu/VGf2+gDi0GAVZI3QrHhUCkvZj5Jsy02RBmJjnsYoHRcofcgBLcB0q+UfwkXD9ZBGGDkJnKD4Z3YZlfjlAe2K6xymDs3Ax2IISnWYwNujloN5+iHe4crL2dXXOp5BSTEReRXulscofJpXebsE3H0/AVAopwfCJyT98087W0IvHp9wTOABWqSFgrjIunx1FuikhYXjvqnUc7CA7ZbYijmyQNceAGgRuXy7hHFI6lH9PNritc/vR+f34hIThRieLJJTSKW8h3gkqLY63jtNgEQz+sHBvL5wypfJy2L6xE+fyAZ7qy4+R4cpJXSOalmBz8CIi5xQAynCoSKbG7ap5RLPqSqqkSxEuJSXADXGBYD69g5fJ2QVo75EyqZ/pm0TiDitsN4Xdwpi0L3NpqzXyVOrTxOEXOvg6rtQySEnFTIZE1fm8c47rrjtyqma2n2hIlmXs4SptBljwn3dhtvWfKb1m+VTEqFFCXsg09CQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(83380400001)(6486002)(8936002)(966005)(36756003)(8676002)(31696002)(54906003)(6916009)(26005)(508600001)(66556008)(66476007)(66946007)(186003)(86362001)(5660300002)(6512007)(31686004)(6506007)(7416002)(316002)(2616005)(45080400002)(38100700002)(6666004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFR2MU11Rks1dzUvSHJ0MEZOczh2NnVlN2k1dFRLSS84a2FWYjFPbGw5Qjls?=
 =?utf-8?B?WFJHaDcxVy9RTWRFYzM2ZW41N2ZaTCt2anRoazhoTTNXQzVFYVFyV0tSRU8y?=
 =?utf-8?B?Qjhoa1J2cnUzMWNvd3hqMVdZblZnNXdodSswei9sM0M4K004TzdyeHM0aUVu?=
 =?utf-8?B?YjhYMjQ0S0VmcEJKRFdJL0lOUjRKaDAxSCt0YStnNGlvUkVPOGtrQ1hTd3lO?=
 =?utf-8?B?REdncDVaS0gwS0hyMzVNT1B0SC92eVJWVGlMTzJ3STVZMXd0cWVlL0dleU9w?=
 =?utf-8?B?VzhmWmZSeEcxYUxJM3VrWXBhS01BVW14Njk2VFNPSFdXRnlyN2V1aGI1dTNm?=
 =?utf-8?B?R0dlMDlESVg5czk3dlVCNkdLZXcxdzQzUVNDVWsvcXNPL2VZWUI2OFZDb2FY?=
 =?utf-8?B?VUZ0Z0dFYWFSUEZWbDduRWg0KytxRGtGL0VMY3VFZjZEYXBISStQQmJRSWow?=
 =?utf-8?B?aTlQemFoQkNEcHk5eUVqU3NvdWdlYXFpV3Noako0Ui8vQW5WM3M1MWdXUzZ3?=
 =?utf-8?B?TkI5cEVVVm92RGU5ZER4ZHdCQjJRVk5jakQ2dkJoUFRKU3pYb3h2MHMydFNT?=
 =?utf-8?B?WnhlTHpwMDlpaUZhLzYvbG9zWlY0TFdoK3llZm52N3JHWXdaOEU2dmRNQnZB?=
 =?utf-8?B?OE5mVmkwL3Z6cW1sOVZVYVA0M3kvT0g5b1B6QUpQRlJ0QytkVFZ4UjJHWDVq?=
 =?utf-8?B?RTliL1Y3WlVwOGsraDUxejMwRytodGZpWDRpQy8veEUwM2YzS1ZYNE5Taklt?=
 =?utf-8?B?Vzc0MVA5VTh3ZStvUFRFQ2xzaFpTdEpRRDhWVG5ZaDdCbTZXYk9NWHdGbU1C?=
 =?utf-8?B?aEh5VGhyYVVIcUtFR1JiZGdvd1dIcStQWWZRekRobGVGQmppb0dmRkJsa2tG?=
 =?utf-8?B?bHI2cEp6bVVMQkpqbWFSTDZ2anAyVzJZM0txaUdLNDcyTHN6NUQweXlYeHpU?=
 =?utf-8?B?bjNmSE0rUzJ6N2w3eWlVYzBqRTl0UFpFMTVkWmtqcXF0RFAvUGE2emtGS1Zm?=
 =?utf-8?B?cTRNKzN4dEhKL04yeHcyZENvdmtzYy93elFZbzRuZ3hHcndsRC84YnFUUVdV?=
 =?utf-8?B?WHJVdmpDZ2xwNXRlQzZ2NnpSeFJoUDJlLzh1aG5uWDQybm1MalpGZS9xaFZj?=
 =?utf-8?B?VUthWHRMT2Z0cGthUGxWaUF4MkwyY1o5UFAwOFJGOVl2UlJZVzNTMWJSVTZk?=
 =?utf-8?B?bEc1aDcxdkh1OVYvRVpqM0pJRVJRTnI4M2YvYm5RTlhwOUFPS1BkcTZuTDRX?=
 =?utf-8?B?L0NjbEdCemlYY3dQL1JrQmpiVE5zdGg5b2xqVHN3dUVXTENRSFFoa1I1U0xQ?=
 =?utf-8?B?YUNheFRDcmpGa2JzT1RneEdscFpZWE50V0ZvRnVWekdiOU94Y3J1b3ZTWk9U?=
 =?utf-8?B?bXZsTUY3UGkzTkxHRHRZLzBqZlcvTmRNaUFsa3IrWCt3RmVaeURoWFBrQWxo?=
 =?utf-8?B?eTZrcHU2N0NrK0p0YXAyYmVCUkMvVWtHY29NdHYxRXZhVW15c2tVZXdhYkM0?=
 =?utf-8?B?UHFpUWhuZ1ovWnJUamRXN1VGdUlKdjhNNkM1UU9LSWRRS3dHSVRRVFFlNEd2?=
 =?utf-8?B?bWUra1hBc3FiQW1jY3VXYTI1c08yWDkzR3diZTArNGtRaHViS0hGLzVPSlRP?=
 =?utf-8?B?eWRVWlV4Zkh1NENIVFpiVUlscTFvSDdkR3hCdXZlY2Fka1lZOWdMRTFoU0Ev?=
 =?utf-8?B?RjNXdXRBcFJvUGdOZ0MyWEtEOTdSa1FDOGtaRTlUYnZqeHEyUmxMQ3BERGlW?=
 =?utf-8?B?cXJWSCtvQzdSenpFaGQ1WWUycHRGNXNkODJVWFpCczFIdVNEM01xRklEUnE2?=
 =?utf-8?B?WkxGRFBCMkMzakxBbkxNd2F4SjRpdXdCSVkwbmVoQ205aHlwcVZHWHgxOVNa?=
 =?utf-8?B?aW5UNFBOT2FRWnNqcWhmQzRCalludyttWUhseDY1ZjRlbzh2Q0ZnL2tDV1VK?=
 =?utf-8?B?ZjBXOEY4SjVnd2tBNkJlVzIxa0tzaXFoZmc5d2lQb01DeXB3ZTlLbkpiaXBq?=
 =?utf-8?B?N1Z5OXJzcXF3UThURDRDQlJ2UFZhQUN2bDVPNjh2QzNoUnBaK3U2eHhDUlo2?=
 =?utf-8?B?UjJZeEhNNjZtRnZjbmJHSXNUS1huUzJ6YmJieUoyRjE4cnFlMWVWTGp3RkNu?=
 =?utf-8?B?QVJuZUJQMnduYzlrOWliZk5hWVFGM2IzSTg0dzNhZDJmVWN0WWl6ZXBBWVNE?=
 =?utf-8?B?ZWdZMXladUkzcTlUQW42MWZGc1U1VWI5dWJEYXBGVzBGdjZ3d2hKa0lLUjdO?=
 =?utf-8?B?N25WTlZJd1A3UlFzOVI3cjVmWU5oY0lQZURDWHNZSVNYa05hSHRzSWpGUDdX?=
 =?utf-8?B?TGxpbE1sRThFa1g4YkkycUpjNHI3bWF2bGw1QVNXN080aVhkeTQ1dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c68ef7e1-dc21-4410-5dbe-08da38c66fc6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 12:03:35.8953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SSnm2Hpr1LSa8mVd/prsxfMW7hBXsDhHianLRl00qSbLxCk0JESqmkKQfzCt2Otj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6201
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
Cc: linaro-mm-sig@lists.linaro.org, kernel-team@android.com,
 Minchan Kim <minchan@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 John Stultz <jstultz@google.com>, Kalesh Singh <kaleshsingh@google.com>,
 Hridya Valsaraju <hridya@google.com>, Greg Kroah-Hartman <gregkh@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.05.22 um 01:09 schrieb T.J. Mercier:
> [SNIP]
>>> Perhaps we should go just one step further and make a misc device node
>>> for dmabug debugging information to be in and just have userspace
>>> poll/read on the device node and we spit the info that used to be in
>>> debugfs out through that?  That way this only affects systems when they
>>> want to read the information and not normal code paths?  Yeah that's a
>>> hack, but this whole thing feels overly complex now.
>> Yeah, totally agree on the complexity note. I'm just absolutely not keen
>> to add hack over hack over hack to make something work which from my
>> point of view has some serious issues with it's design.
>>
> Why is this patch a hack? We found a problem with the initial design
> which nobody saw when it was originally created, and now we're trying
> to address it within the constraints that exist.

Well the issue is that you don't try to tackle the underlying problem, 
but rather just mitigate the unforeseen consequences. That is pretty 
clearly a hack to me.

> Is there some other
> solution to the problem of exports getting blocked that you would
> suggest here?

Well pretty much the same as Greg outlined as well. Go back to your 
drawing board and come back with a solution which does not need such 
workarounds.

Alternatively you can give me a full overview of the design and explain 
why exactly that interface here is necessary in exactly that form.

>> For example trying to do accounting based on DMA-bufs is extremely
>> questionable to begin with. See a modern game for example can have
>> between 10k and 100k of different buffers, reserving one file descriptor
>> for each of those objects is absolutely not going to work.
>>
>> So my request is to please describe your full use case and not just why
>> you think this patch is justified.
>>
> The use case was described in the commit message when the feature was
> initially added (after discussion about it on the list) including
> links to code that uses the feature:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20210603214758.2955251-1-hridya%40google.com%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C3f6e3e98fc6f45ead80d08da385a59e6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637884257979664387%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=i%2BSfpB%2B6iBolBHu6KrKH3njq0zo1SBbrKDHZOjpsIks%3D&amp;reserved=0

Yeah and to be honest I have the strong feeling now that this was 
absolutely not well thought through. This description as well as the in 
kernel documentation are not even remotely sufficient to explain what 
you guys are doing with this.

So please come up with a complete design description for both userspace 
and kernel why this interface here is necessary inside the upstream kernel.

If you can't convince me that this is a good idea I will just bluntly 
mark this DMA-buf sysfs interface as deprecated.

Regards,
Christian.

>
>
>> Regards,
>> Christian.
>>
>>> thanks,
>>>
>>> greg k-h

