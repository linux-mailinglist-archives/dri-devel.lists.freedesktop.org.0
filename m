Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D001572000
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 17:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FAA12B909;
	Tue, 12 Jul 2022 15:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605EC12BC5B
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 15:54:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mD+ak/Cr+jyqTL20PAmBRGbLtsKkXe+PEosJwEb8Azlon463MYcO/6vY61kHrX9uNdKBBrcRROvseU89RVVCxgerDEAH9RNB+3cy5cVyM0Wub3ef+yxcDWBtam7FWXiOcvd4hbxYe9pdZLtPU8Hm0zV7D1SOTpC9R7zvFuQYkAtjZbHf1Yu9hd3J7LkLBuoC4m6ioULcy34SJEr/s8JTWqj9yTAkgJ3f/+TqQrTbdLlozmb+B70lyJGjKTxZAWtkINtQP0/yqU2I/eTs1/ySJakInwUVTF611jAyJYUFEe0n1edShXUK03uFQAMtftMwYyJfsh4Z6l/QuEY7tzjCBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzHLjV0UwjyG5/lpLydS3Lor6b5Y8KIyywS1BIDW3D4=;
 b=fQIhHRQBRlnwxN/ftdh3Wx2B5ANhXjPzs1R1fwK75n6DrA8r+DQ0k70ONYyCvge+d2ewuoPSsZ731jpcWAHOaiH7q91p/D80j9zgchtgouW0qNKEqdNW77mPxNsvmpOyvKl02b2tQckQWhsXVL2/UJXyFDegFhxZLWY1x+vhnoPY9qTrn1OMmhK1zZqRcQJfMBkIaTGjDQWVU0FQ+V73yTgcPoSgplCgQLMjz913wnAXE3sbx7vuDTMrabric7B6VKAFUf8N3UWH0UmPGvkZIzq5yWFwchmXg06/REgybuKPRBU8xlwkUnh6id9YMTDQazSnnuFXZW6UEic7+JUOVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzHLjV0UwjyG5/lpLydS3Lor6b5Y8KIyywS1BIDW3D4=;
 b=ZAOh2BwthDAS+YiIPtxSI2WpF7kuaycdy21v/RNyRTIZwLpZFDm9O1gHl/AIzphI7p3Ea3LC+5ofp1PGau8twvfoTzuQrH/UrUol1P9GG3dC8EjcKKiJ3B66RhQDwPthGB+KXno+3GKb/rloyswlwKO0tqJD2Tayy2ItNqIGsyk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR12MB1244.namprd12.prod.outlook.com (2603:10b6:3:73::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Tue, 12 Jul
 2022 15:54:30 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 15:54:30 +0000
Message-ID: <66110ee1-9358-b337-9481-d9fcdb5a4c00@amd.com>
Date: Tue, 12 Jul 2022 17:54:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC][PATCH 1/3] drm: drm_syncobj: Add note in DOC about absolute
 timeout values
Content-Language: en-US
To: John Stultz <jstultz@google.com>
References: <20220712042258.293010-1-jstultz@google.com>
 <13c5ca05-a366-2751-4f26-d978d074f748@amd.com>
 <CANDhNCp_d2M+n90T1ziP5rHF85ZsxyN6qg4iE84ucPO-XK_HUg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CANDhNCp_d2M+n90T1ziP5rHF85ZsxyN6qg4iE84ucPO-XK_HUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 903cff3c-f5ba-4097-8acb-08da641ece47
X-MS-TrafficTypeDiagnostic: DM5PR12MB1244:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SdXEPGUfOuJHbGwfwB440BJu8wjvrj+Tzz8FlT36f1GMnJuSCsEpiI1x2ZnnIE41aHCOMt81/OcHiTIf/mBbgKPTvqelmIKgtszvmgiXJQKgbMTLMSIT1cKHMvD92wTRKslocbUpDdgEqTjHgmJYsgFSL+ZOj0K8zbkYg6bL5MQWYsFaTxzjHRWBHefKCcvTZUewetD9QavndRkPWKkJPnG7kfarXxONb2PkCbdUIWtxNh3F4sevgqWeOYXw3YYB8tgJPw18gJg1ncB7oftjIUKCWS9dJza/yUzTH9ms6sdClJHLIOU54yJGL9qrOly4U9L1OmYZiwvvaHY8XmpObrt/n8P1HLz2leiHmTWvWFow+8mgNH0iJPE8S7Wcj/+nBmVuu1mcbUz8fR9LYhFkHmFxBzT3Nu9g6FARVUYbYkA6iKKxQkPZhSFSDedt9yDWfoOxt4+Ut50BdG+MTaL5Fgd3Tzlv7J4aZaaC9UFVOiIYy0ehBZ0c/CBIHYPJmR5eIFov3qH9Wkm0fd3OF8MZTOiZ6GrORh/QKnNtO0ocTfAS8iee5Nrw2KUFpPtEQ0anV0kAqF7kcjO9PYvIbKm0i6SH6LQuzmFI2Fz3wYiaTyePQp/f4uWN4O0DGCx40V+nbBDV4j56D0I1qj3hd8GwinAN2ylfR08ejqP/64oOF4+E/K/eFHl2inyyprR5E00RND95HRr/C50jqerTB7NQb6qfcxrl1G49cU01vIiNv2frZ3cu77leiZYBRDFEfRU2O2wH5eZify9hCVeT5VhWEwoPrer+fp9RWSocDO14Dg3KgmqR66a8Ac/eK8PGTUPzVdjltyce4KtxyUEELYxeqeEQLEQJFHf+AD1wkv24xYOhTscPtkVFwM2iH8W8151u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(66476007)(2906002)(6506007)(6512007)(53546011)(66556008)(966005)(66574015)(66946007)(6916009)(4326008)(8676002)(2616005)(41300700001)(186003)(86362001)(31696002)(6666004)(83380400001)(31686004)(8936002)(316002)(45080400002)(7416002)(478600001)(36756003)(5660300002)(38100700002)(54906003)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2dEeWlCL0FRMjhjcS8vOGF3MEZ3TlRTOUNlSlBGaGs0YUxjWjhDQnBUUDBB?=
 =?utf-8?B?WFQzMzNrMTJhK29NRFFMTU1nWjA4TVB2bnJ1R0xZYXVQTi95Znh4YjA2R1Jz?=
 =?utf-8?B?TUpuYlEreWpMTjlEYUxLR0RiSzBaNlRWUHlUd1NqMjRnQ3ZRVlhzMnBGN3FN?=
 =?utf-8?B?cGx0ck9RTFZLS2l6aUppZW5sTUw1LzA1QURydlo5dVJ1OHlpV0ZxL3l2UGR1?=
 =?utf-8?B?QldwTlRKOU9Gd3FZNm5OL0grRXRFZ3lxQSs4ZTdVYjFUeDl1NnlRK0JNNDcv?=
 =?utf-8?B?alduOEVHVHdEMmgxSUtSd3hRL1ZVUmI5N3pqOVNkODFVU2RKWHUyVlpCUUpL?=
 =?utf-8?B?TUJpQlN1YVFPcERoajkyZHptc2NzNVlkYXRNazlSVmJpY3ZZejNjQkxCVHhm?=
 =?utf-8?B?RkY2czBKYS9LUmloQzdaV0RHajlrZ3V5QzllTThZbXhybDlFc1BWU1pIVXJM?=
 =?utf-8?B?V2ZxY3QyWS9wMjlDcGR1OHFxKzBYN0FFVEI3Z2hLemp6YlNZMTdadTJrUVY4?=
 =?utf-8?B?ZlJJRWNERlFRTTFPcmxTRnplL3B2ZjlDc3lFMG1lKzY2TkhTMWNuNDNkZlVm?=
 =?utf-8?B?TTRUWlNKcG5JdWR4bHR2WmlCUXVyenpBVllXNjRVTkg4N2FyVWsyKzhuOEow?=
 =?utf-8?B?WXpXMU5ZK0NtRk9GUE5GN1VmWmtxQk5nS2dIMFRjMHFzdENqaXYwSTlpTzVU?=
 =?utf-8?B?c0tFcmpDZlZ2ck5jUnRaQnd0czRpMmtteW0rK2FYU2tJZ3lCeDRveHh2WVZ6?=
 =?utf-8?B?NzRQTEVwUktRMzB2Y2hQWkhvYVkvSFoxSjJaeGNyUlFKMjJhakVYRFY0ZlJZ?=
 =?utf-8?B?V09sOERyVithNnFsMUdPNThHZUFEbEV0WWYwM3lhRm1OWThwTzdiNnVyNGpT?=
 =?utf-8?B?czNNSSsrMC9WblBmM3YwdEU4K1RUSmtUcEE2TkNXREdWS1hpbWJRT3RKd3dh?=
 =?utf-8?B?S2thTTZFTlVLUHpNQVgwNlRaU1V1VnhQQmNsbFI1eHNDcDU0N1ppVUtqVEVs?=
 =?utf-8?B?VGIrRmIvbVhpMEd1dTlYRHIvZXhOcGx2OXRRbWx1R3RpeGhxSEF3RFB5QjBp?=
 =?utf-8?B?bkpHV1pBZUV2L3kxTlRSTTdhVUJFU0dxNXZjWWxqbExhOXN3NmZEak96cTBB?=
 =?utf-8?B?c1dURFpGcGhnRUNvY2lTYklZa0RNV2hQRU9jQTZnUloyZEMxK1EwSWhrSk15?=
 =?utf-8?B?RFAvN2QrWjVxdXRmZEFob2tocWxNQjUzNEJ4UHl6Y1VRMGQ4V2JQQWRrbFI1?=
 =?utf-8?B?UmtuNTJ2OWNTdHdxa2QrcktpSVVrZ29JTDZTSGhRMlE4RnFRSTVJRHl5MjVk?=
 =?utf-8?B?Qk8vQjhSU2dVU244WEpOa05sbUdzRzZlRXNDRlFoOFBrbFdCb0tZNEh5R2ZK?=
 =?utf-8?B?eHQ5RG9vaVdXcWVIbzE5dklpU2tEVCtPZENBbXZxNmhMT3VUazIrUWJOdG9a?=
 =?utf-8?B?RjJuLzRHU0VFS0JnRzNSSFdWVnZpeEFvUTJtVVQxNkp6UVg4L29HZzJOR2xO?=
 =?utf-8?B?SjRORlJ4REZDRWxqQm9uNnFWTGRIZXJDZlhydmlvQUhnS25PbUZTbzJBQ2hX?=
 =?utf-8?B?NDYvQWRFOWIyc3RRd2I2TDA5ZWtLNlVnd0l6c1BjdWtCaW9GWmpJSmNscFN2?=
 =?utf-8?B?NGVlNnFDZUR6S0RrMmFKNWI2SnhuZStGVERGNThmc2VGSmpBSm9UQjVMb21T?=
 =?utf-8?B?MWcvb1QxanlWVHFXOUFaejhCYUVUNDVBbDMwaURVUCswM0pUbzhNNlhGSGFG?=
 =?utf-8?B?cWZpeHVnNStVTkdBeWxqTkJDMnRScGZ2SjNiMUVSSFRWQVdMeFYyRlFwMjVn?=
 =?utf-8?B?aE1ES3o3QUpjRmxwSU9BcHdDTUN0MFhIeEhBT0dJQzBpSENGWGRGbjFyd3ZX?=
 =?utf-8?B?dkJER1BjRFgvSExVR0RJSCtjRXlrVU5VYm5xQnEwY05ZZFNzNHU2RTUwak5h?=
 =?utf-8?B?VEQwMENoeklXVlN3VVRzamZGWVJRUDJyV0JEOE12ZUcvMEEzYUNqRkhTSWZO?=
 =?utf-8?B?N1E2TVlSYTREYkhjSWM5U0lGcDdHang0QUc2TG5vR3kyNzhoSC9vOTRXcDNv?=
 =?utf-8?B?RFFETGF5SHhoamdzOTNJSlNDVzZ0My9OZk1Kd2c0NkVEMmYrdFZpWmM2d0pM?=
 =?utf-8?B?RGhuU01OZDJqNmFORVhJdkVXb1pmMXZFMG9Ka1dLdmlTRTJ2amQ2RTZRQ2Fa?=
 =?utf-8?Q?BIhwHm/liqaR1TaRKzOr8p1i6zJPZVC0VEqek7danJBJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 903cff3c-f5ba-4097-8acb-08da641ece47
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 15:54:29.9875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ggibJ/y79JM7d7GPBehTrvGGW4nLC7P7RO6jSMhdCOHQiLqHgVX5gnLJbIEzi1tf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1244
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
Cc: Chunming Zhou <david1.zhou@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.07.22 um 17:48 schrieb John Stultz:
> On Tue, Jul 12, 2022 at 12:40 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 12.07.22 um 06:22 schrieb John Stultz:
>>> After having to debug down through the kernel to figure out
>>> why my _WAIT calls were always timing out, I realized its
>>> an absolute timeout value instead of the more common relative
>>> timeouts.
>>>
>>> This detail should be called out in the documentation, as while
>>> the absolute value makes sense here, its not as common for timeout
>>> values.
>> Well absolute timeout values are mandatory for making -ERESTARTSYS work
>> without any additional handling.
> Yes! I'm not saying it's wrong to use absolute values, just that
> relative values are common enough to create some confusion here.
>
>> So using them is recommended for ~20 years now and IIRC even documented
>> somewhere.
> So in addition to "somewhere", why not in the interface documentation as well?

Because it's the desired default behavior and we shouldn't have to 
document that on every instance it is used.

IIRC it's documented centralized (but I need to dig that up as well).

What we should do instead is to have a warning on every relative timeout 
that this probably shouldn't be used as example.

Regards,+
Christian.

>
>> See here as well https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flwn.net%2FArticles%2F17744%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C68a13ac3906d4ac4cc4308da641df25c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637932377042931797%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=dM4BkqnO0LrsdKBwKKMvx4zMabWrM%2FY7pPGDsdFO%2BnI%3D&amp;reserved=0 how much trouble system
>> calls with relative timeouts are.
> Yep. Well aware. :)
>
> thanks
> -john

