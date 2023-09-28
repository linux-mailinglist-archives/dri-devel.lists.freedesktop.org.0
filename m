Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0135C7B201E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 16:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647B410E004;
	Thu, 28 Sep 2023 14:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2053.outbound.protection.outlook.com [40.107.100.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4911D10E004
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 14:51:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YiRYnvb1HaUmr4Kib1pqeGJeT67odYxL4WlmSSacMDuLEJIuCvzrt6Rzj48a1C7knYSedkmV0vp7NYO/jNVuYiVGu7lMfcFpD5GSmcD9JRbb/2JVPCWA132acZ0oSWp02AuHnh3OxRp7bK9BkmSlLkzkxEe/JzCcLDROEWpcErzqXFWZRvjcj/BT58E3iq+DFn0h8AgsjX2ziDBA9AuAFCFNSyqLIKUakQEX85uu5HpbrTU1RLIUVQxHaw9w0s4MLCruAFltN1GEQIbEPT3pmTgpqZQ2pAUapeYi8wKOZmDlKOUAv8CMz3EPqiseDoGNArFhZjKlq7no6J9oEGlJvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUvF5gm8z3VGP/zx7HLjMojKuWuUY4kZ/zg+Q8HMirw=;
 b=E2p1/8H6JNAtgEJkmdLO5FSwZ0mD984FdfzalGpJ3zh39ixZU/9xELgg5s4fQ1YUEXFE+i6DYSSjirsYoAHf/P7DxwZ77zKrYZlBMZItw9XF6cW40eSC8JZsQdtPmHJJq8WE8/tdD8zAFA0Yh6iomapBjcrs1H1vdM6pdBUFteJwzPSP000YrEKl5k0b5hcC4jR/WOO0qNRbBJ55YVrnb3FvUSeMCVMCAcOIMJLT6zwFxRQuCKvH6seBfCtNBmJsfe1ihshrAKobWUs8FO/MUyDiEgzRbhNd20yYJfpvxbPhbwRlNt9PXSt7A6e2DyA5dwDuq9j/96/iWogi5eGvpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUvF5gm8z3VGP/zx7HLjMojKuWuUY4kZ/zg+Q8HMirw=;
 b=ONX6qCE8ST66Xd1a1FffnPhOv/WDqx/XH4ucqhMui2Dthp7yDrmGVzDrXDJROo9AJ8ciOWlC6FzhkByYzTljO+znuXE3b2d29QZqDMXFMVQ4Knv3Ivm9wJjQf2z85bKZxddT7/b1Zx6FsoSVAbC2G4ZCngmNJIvgcWq0nIHiWn8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM3PR12MB9285.namprd12.prod.outlook.com (2603:10b6:0:49::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Thu, 28 Sep 2023 14:51:16 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6838.024; Thu, 28 Sep 2023
 14:51:16 +0000
Message-ID: <2e19a4a1-d42e-4e89-a0c1-c89e44d05819@amd.com>
Date: Thu, 28 Sep 2023 16:51:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Content-Language: en-US
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 Ray Strode <halfline@gmail.com>
References: <20230926170549.2589045-1-halfline@gmail.com>
 <c2ffc21e-bf92-81f6-aa9b-233e3475025f@amd.com>
 <CAA_UwzKiNJe6hjbAo7SK7-OB7sb_ieV_DcQ_8vf6UYw2gppGcA@mail.gmail.com>
 <a1316597-e91b-32f8-78d3-13977438149b@amd.com>
 <dbed4fe6-e99b-a31e-5715-7bd594fc22fb@mailbox.org>
 <CAA_UwzLpRsNHK7yFWP3tzLFgeZMMpq_AiWBEHW5Om6hfBxyYbA@mail.gmail.com>
 <806ab015-215d-4b45-1702-429e39d6edc5@mailbox.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <806ab015-215d-4b45-1702-429e39d6edc5@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0502CA0031.eurprd05.prod.outlook.com
 (2603:10a6:803:1::44) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM3PR12MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f5f8bb-a07a-4ae8-7686-08dbc0325df6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ihlqx2bBNBpFyLNpfNXw6RzhchFU/tfo32tb+0P/tDWr7yEVfvwSg1UY/rHoyg6OygwgwTpLlH1YpdeEeLeUQy/83+I38KRfr30cQr3Qtm9M3pNU6YQxFX9CPn7JgzRlCIqYmk9gHRDuES4B7o92wRzRydzB/iqINIWKyq+qadKFXbIw0uFtOt6c8qe9lindsgjSQlIc+CM2GEUqHXKIpQiuKWUfaHrBo6PPS/4XcCTpzV9qLxjKlVQ8OKdqKxRHlg71iSRJq7ZNYlkJy02Zhex5oVCnsX6OCmyzwctpOVAgiWDhhL1wEbNNpZ12wD9smJJVDyehJDFu/Eo0XYhHhqmgWZ3ZVjfkzsNZYPJfpbLT6Dfpfq/FOUYvkvjzinHu5fY9ssGhYMv9p5oU77Cdtsl0TY9SXW0kgL48mmQ5bKvt3ACmNJ3WKOgF19Anx6LpZcPKQdsRvkFoRPwb7ZqZ+JyDF4Sjr/JXyaIj3kJjbdVwENLzXse7Qk/2rYSTbQhdVMUPNMlqe97542aLYW06biH3T2SRWTk6sm8gegtkPfkKiR4A+jC8tTl7ip+3pqGTRYFwJVeqaeSc+/rRzgj30BDtoZfVF2YJMqwzWJhmsKMpSlritF5N3YQ82ujyFUEjz0Jk1jZ1dH7JZQa+X0fRQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(39860400002)(366004)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(6506007)(38100700002)(2906002)(83380400001)(66574015)(6486002)(66946007)(41300700001)(6512007)(66476007)(478600001)(110136005)(66556008)(4326008)(2616005)(8676002)(6666004)(8936002)(5660300002)(53546011)(316002)(26005)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3l0MVBCbXYrb240OXZVNVA5TUI3ZWNyUU5LeWJhakdoWEVDU3dQVmxTdWRv?=
 =?utf-8?B?VUY0R1FVQ0lFV1NKaW1CY3FZc0lDaTYza3NDc09VdEdEaUlnTi9WYmlrdDdX?=
 =?utf-8?B?N1ZOdGVhbDhOSGlhYkhua1diVURsNjVLM3didlJ3bG5xYkZIcmFkWEJiVktV?=
 =?utf-8?B?T0FtK3FvSGxGQnJLN1A3eWtqL1JsVktsL0RNcWxtVGtvemRvQlB6bk1WSzd6?=
 =?utf-8?B?NHZOTGZvZUY0K2VmU1pYRmdZTkVtNnNwZXJwSVNTR1F2R0txdHFNdFd3a01L?=
 =?utf-8?B?UnN0NDdPZUk4Z2FTVlZna0kzZnphcDNRdHZ3WEkwNUh6d3hKdmhsNElHSFhO?=
 =?utf-8?B?clU5R3A5b0dodWNWbVlnM21ZeTJaaC9lMVNmVXRtZW5QeDRkaERYSWd4OC83?=
 =?utf-8?B?U1A0dXc4VlN3U1J0WXNVMGNESzllWnJDMzNOek5peGJEUG5DN3lHb1VhZ0Ur?=
 =?utf-8?B?SFl5Nlg1WC9hY3FpT1FwMzNlNnJUbzJMZGZoRUtoNDY0MjRXSUJPbThOaGJK?=
 =?utf-8?B?cXlKa2FEbWtTSURJcG0xM3pmM05xZGdyUXdnMHBISnBYN2R5RUsvUTY4TkE3?=
 =?utf-8?B?OUlHaUFUVGZoaEVNb2dNUksweDgwc1dTOE43cjkzODdTQ3hPZDFqNENFS2Vk?=
 =?utf-8?B?enUvdmhVYU0zT29mM2dMRDQrK0I2eGtVMFZlUDlLZkhhMEpJeG5NNGlHclkw?=
 =?utf-8?B?WVRxbFFTSzNQbGVRSCtRWFNBQ3kzRUhTMXVwNXNxLytLY2lnRG0rUzRnV0lO?=
 =?utf-8?B?M05PY2w1YVFwNlJJZytmMUxSZGhMaDJndmJhUDBlVkpTMVdZdGJQWnIzcXlD?=
 =?utf-8?B?UVFBYkdwUkRiNkNiWCtZb0NBclZSSExrei8xMTBUV2RQK3FXYUFia1BRN1ZB?=
 =?utf-8?B?L0ViZGpIYzd1Z2ZsdVNZYUF0SzZhYXhLWXMzRittenFtMCtvQ3NqZ25SWi80?=
 =?utf-8?B?Q0R0REJZdFp6ZFN2ay9FNHBLMVBmTVlwOE5nMlZCQ3ltdjlXVUF6YUZScmxp?=
 =?utf-8?B?Vk5MVDJHUTl1SG1zUDRwMnp6OFprL3FVeFczeUJXQmVtNHpVdXd2RlNWODFo?=
 =?utf-8?B?eGtRcEo5cEtoVDh6VklIU1ZLQkQ5WmFVSnhjeEUveTQvZXJLYnJiMVhQcWRY?=
 =?utf-8?B?NU9sbHRJSkNaRStxVjU0R1loMG0rT1d4TE4vT2FCMWpwdWlRa2N6dFdSbDZx?=
 =?utf-8?B?Sk43ZjBSay9rMlBKbEJJNFU2NWI1MW53Mjc4Y252WW1ZR0pyZGtMNG83NTA1?=
 =?utf-8?B?eWY1SS8zOGYydjFEbFZvSDZxZVRMWGhLK0Q0ZE8xckV5VnZGU0YrR3A2YUFD?=
 =?utf-8?B?K1h4VThFMS9NYTFKdHlFdHU5UWxnTzNDaHpCRlVhdnVySXJ6WVppZmNUVkhy?=
 =?utf-8?B?THlQeGpTeDZOTDI5aXNndUQrTmZXeTN1TFAyMzkyNExGWERtUnFWU2dIU1JW?=
 =?utf-8?B?RXl0N2JPRFJxOTNTVUt6RElHY3duVk93RXEza0lENk5UZDdmL3E1TitNNy9W?=
 =?utf-8?B?R0FIc3NxUlBIWnRTR044Tzk2UG8wTXRPTURrQlprSG8wb3crSHl2VjQrS3RS?=
 =?utf-8?B?czBsOUZaSEhQYkZkeUhTRWJaalp2U0loeWZodjVidVpyc0NndUxhaFRSL3ZD?=
 =?utf-8?B?R05hSWswTnZONmZhVTV0SDNKZTFoYkJNUVVwK2dScU1lZ0E5b0NCYXFEc1Qx?=
 =?utf-8?B?Rm9BR0NLQ3JONFNiTHRKUHZCSzhuZElMZENzWGw2RDFvN2JwSkozSjE5M2Jr?=
 =?utf-8?B?cnp1M25LZk9DdDFTd2NoSkgyWFRneUErL24vTE9oMHZZc0ZFRjFSYTlDVWYz?=
 =?utf-8?B?cVBhNjNhUlIrcVVPdEJWWnMvZlBOQUFYbzhLcnVqVWhGRlI3eU1Gd1JjMGxO?=
 =?utf-8?B?ZUdaSEZ2TEptSmtxdWlqVUl6ZmZxTFUzU0JyMjd3WkcrTXhadUIxT0QzZ0gw?=
 =?utf-8?B?YjN4SGFnaEhXYnh4M2FBLy9TZmRRdWpvNXNKM3cvd2JUTVpXdXlXNzZuVVhB?=
 =?utf-8?B?NnF1TmY0VnU4MFQ4T0RPUVJmQUJTUlBqWlVveHBDOTMzNjVPdkdLRDhqaHpC?=
 =?utf-8?B?Uk9jSnlEVXZONytQM29tRVp2a3cybE5CWEpDbnQvcXpQbUVKeWFlU2I5d1Br?=
 =?utf-8?Q?pQk+9gb6lA5lMb+N3vIb9v4Nl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f5f8bb-a07a-4ae8-7686-08dbc0325df6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 14:51:16.2642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uawf/U9Bz3hGnow4rnqkS7y97FYsUgmULDtRgZqKwSACDEg+h/uFjk4TCI/98iP0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9285
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
Cc: alexander.deucher@amd.com, daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.09.23 um 15:37 schrieb Michel Dänzer:
> On 9/28/23 14:59, Ray Strode wrote:
>> On Thu, Sep 28, 2023 at 5:43 AM Michel Dänzer
>> <michel.daenzer@mailbox.org> wrote:
>>>>>> When it's really not desirable to account the CPU overhead to the
>>>>>> process initiating it then you probably rather want to use an non
>>>>>> blocking commit plus a dma_fence to wait for the work to end from userspace.
>>>>> Well, first I don't think that's very convenient. You're talking about
>>>>> a per-plane property, so there would need to be a separate file
>>>>> descriptor allocated for every plane, right? and user-space would have
>>>>> to block on all of them before proceeding?
>>> OUT_FENCE_PTR is a per-CRTC property, not per-plane.
>> Okay, sure.
>>
>>> Also, at least in this particular case, a single sync file (not dma_fence) for any CRTC might suffice.
>> I don't see how we could rely on that given the provided api and
>> multitude of drivers. It might work and then break randomly.
> If it's supposed to work from the KMS API PoV, any bugs to the contrary should be fixed.
>
> I'm not really seeing the big difference between using a single fence or multiple, anyway.

The big difference is that a standard modeset can take some time, e.g. 
setting up power levels, waiting for PLLs to settle, waiting for a 
vblank etc..

That this happens async in the background so that the frontend 
application can still respond to other signals seems reasonable.

But in the case of turning thing off, what should we wait for? I think 
we still support the out fence, but it doesn't really make sense to use.

> I do wonder if there might be a time window where the out fences have signalled, but the atomic commit ioctl will still fail with EBUSY. If there is though, I'd expect it to affect the flip completion events as well.
>

I'm not deep enough into that code to confirm that. Daniel or other 
display folks need to help here.

Regards,
Christian.
