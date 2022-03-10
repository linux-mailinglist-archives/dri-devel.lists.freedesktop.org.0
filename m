Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671504D5016
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 18:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1253210E5DA;
	Thu, 10 Mar 2022 17:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A1510E5D3;
 Thu, 10 Mar 2022 17:19:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtrrCQrX6gjk3E8nfxGuhpTFQzEgebgRoPDuQBYp8KU6IEJNbKLSaNjPC6WcRKah+Bc8Vr8SBSfSlMBjcqH55RJmr7w5eNwBWPYOclqEKxLukDU+fKZe39jCARoAARPSFiR5+HRh0t+/atKDlMjJgIISG2bPkv6BuUKFcGk49BYwZTfxXmBbTnTfJ+8k0Eg7zm27ep879IWtutFHnsZ3AY/a2w7z/+3+DzUtWYYtsv0AvTRJxEI8EqDS9Ws8tO2YtE8TFYU4bPtmUAQcHGVL7SefTVI7VoJf4H/o3g6R+Jsvv3/LDdI0Fmfskpu8l4Ic0Z7599c6SdSzi1xY6AJxjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqA6QUI0qRk7vW+zSvxBVe1iF7Eg2uNglT/ekbyNgk4=;
 b=VCNol7NgXKUrvVeneUBWSeKzKeGrTr23CuqVuW38gyWO3uL4OiZ2Qe3FGgbEbzCHnaxwQyDodZKyAHVFOGA/jhkwuxyJpm7x0axOsq6jpYRNcLPKG6nGx1pIVG0RzmbuvkQkLBWNn8Oec1XwXh/u30WpNoia4p5RsU0k5SnCJQxoxvx/i6TMDNMoB7+z2Oa7qV+DFppIvL7Kwio5jn4h5wlTI9nc0OCHeX7rbSul7vHVgHp4DsiJYtuUkXKUhS/7J56rY43o/DLdzCZjjVEDe+qU8HSBTGbxi+rLVyDRZLODOzks1YqcOf7qp1DHhTE78p5sAW8LYfZtu6mmclhxWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqA6QUI0qRk7vW+zSvxBVe1iF7Eg2uNglT/ekbyNgk4=;
 b=m8sl+9N/3T6lR1J2Puw/p5k81nfTQHBYJsKgCsfwu2SfFqf3kOP776VDzLbHdyeMOisGi93tOl0Evi3AY1rjQedH8vFBbYS/h36XRtJaZCJb6PczHkBc+2R6wFESD0oBU2+kbWrDf44rQ1KXWkaV2sIg8ES6593WXGBkdny3BjY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM6PR12MB4634.namprd12.prod.outlook.com (2603:10b6:5:165::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Thu, 10 Mar
 2022 17:19:14 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::f037:e2a1:f108:125a]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::f037:e2a1:f108:125a%8]) with mapi id 15.20.5038.029; Thu, 10 Mar 2022
 17:19:14 +0000
Message-ID: <6b400b8b-1b5c-a339-2345-f317f197b4a6@amd.com>
Date: Thu, 10 Mar 2022 18:19:08 +0100
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
From: "Sharma, Shashank" <shashank.sharma@amd.com>
In-Reply-To: <CAF6AEGvvskobh6YOUx55_4rtXJJjPO0PxWY8+EKiVqntT3k+ug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR1001CA0042.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::19) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7da1a31b-e1c2-4578-e61b-08da02ba1968
X-MS-TrafficTypeDiagnostic: DM6PR12MB4634:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4634A37BE15F9040D8C9DD98F20B9@DM6PR12MB4634.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eFMyRdMi6S00WW4sO7Bqr0KZnRVS7HbX/GHtl1OdXh1ktm4etERHsXopooAggEwctnZmi8olLC+28OwQd7ZnzCSIXIbrHatLm0Edmv5E9u7XMQArEoANvX0+DdKVO2I0qnkWxR2YCIgQObvFdQ5re77r8gvqGuU9rGClnNZBFdfmkTTCs+RKHYzq+964UzeLGO/lYmOV7QYpNmcRz40qAqYm4yopD/2u5X/yUTF9VWUi4mdqeFtO/x9nDqwy/B3wcOf1heF819A7xBkystm4F+cY7vuMJD6arDiVb48+dHHrKZn9fc0qJk+gTp0nm2FpDcHeBLySTwGliym4fwraND23XbrIkZm3YWj7yyQp0Jw9ksk40KhL0IqIMextpc0MFhQ6+0zs0bpXoKwLx0BGc9N4OzPHzVi8yvIEkg7sURRQxSaCLja1jc7hbMXMo1sHJaSJZAc/V2LHpcKeJE/sqDjopWMAHCIWBErfyRW2PtP3SHixRfUhNDdXB3W/NRKsciOYyCxIO37j87lwEbuv0TFyye8wlXkDpvm31EjW2zF3W+wsRZCPpTmr/V4+293dW5Cj1NQpAlFYYSi6PkDaQkvYkFCSmG3YyKgjQAQhRgySrCd2wYjaOgPEAeRQduFndEdqCmePjCbnwgsXeDt3jDL2EhJE3KKXVQOHCp9Dh4DoakIasTyBD8yGauwsUBPXwruB45liuZ8IDreof3Z/N8CzEPKPAiNYwMm0MZ3XAXW/SdoFXXHRZd5mi3OOFpSH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5040.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(66946007)(508600001)(86362001)(54906003)(4326008)(8676002)(6916009)(316002)(31696002)(66556008)(66476007)(5660300002)(38100700002)(8936002)(6486002)(83380400001)(186003)(6506007)(6512007)(6666004)(31686004)(53546011)(36756003)(26005)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWdDeFhkKy9UYVFPZDQ3MnNKZ0VzZ3RtMWtvbFBWOUNqNnJicTVCYW5pcVdY?=
 =?utf-8?B?Z0tJY2laTEFMRndXdmdCakRrRlJRODZmUlpLaXNCOVp6Z2NZYTdaZGtGYUNn?=
 =?utf-8?B?TVh0Wk9XVVBpcDBRanhFMXFxT0NIWkFyc2hRNmUreVQ5cUFTSU5waXpsUlFT?=
 =?utf-8?B?VXdEZDJralBrUmFuZmc2emlDTHpqT0NTZlZNaXlrMExuZ3JtNXFnQjdqV2JI?=
 =?utf-8?B?U1ZLTzdseXBjY0M2RmVVdWJyOVZXTlYzZzVyUXVPTzlQSXRORWNtalh0YWZm?=
 =?utf-8?B?NDNuM0pWUEMyRHRRbmZpTFhMYnRoTDdxUE1LTFdOeFZnVkJoaVY3am15WWNH?=
 =?utf-8?B?TkxJMnhQTjh2bmxPYTluUytrVUR3eW93K1VWUGdXdjlPRDNwVVlhY09FOFlY?=
 =?utf-8?B?aitpT3lVemtGN29YTHQ5YnZrMC9pL0NmeTFqd3I0a3NhQklBMGlxQlBCVWgx?=
 =?utf-8?B?cjF2SFdPbUQ5OUZMMWRwZWJnb0RhY3VjQ0ZjeGRNTFU1SUIxMFhQV3hnRll4?=
 =?utf-8?B?M29kYnZvNlVEMWpIYzNaQ25tT3FGejMyTXA0cE9sZnZ2MHlROWtreWVlZG83?=
 =?utf-8?B?UGhUUTdBbmpCZmNqeEZyS3B5Y2ovdzJXRklSanFacEdzQm5HNzF6ZG00d2Iw?=
 =?utf-8?B?OTFwRWZOYjd0RU5DNzZGZTdaUitOL2ErSFJwQWRzdWliRzROcFJYVmlYVExK?=
 =?utf-8?B?eTlEanQvSUFtM2FLZEpyS0N4M01yK3hqOVE5WEVVNGVuRURpOHJnMU5MREk3?=
 =?utf-8?B?VmpEcGlUMVlZM3p3VElPTjlXcUdGMVpuK0plVDZaRW90d1B0ZjduT2xlaXBo?=
 =?utf-8?B?Rm01cmkyeVZSdFhncEJjbkxzSFRJa1ZxdlRDdzh5NHlJcU5EbW5jQ0RZMkNX?=
 =?utf-8?B?Yktjb1htRkg1SmFSU1ZCS2xxa0RFb1lGU3hkRUhHSXFjbEpET2FZZ3EzdG1L?=
 =?utf-8?B?RkVvbHNJMHZveEMyZFZ4RnowbzBmNEU0bWpIRUcwak9YY1hDM3FQdkFoWm1x?=
 =?utf-8?B?RnVzU0pJUURFbWljRlR3aHkwMmZNd1BrS2w5WG9ENkxFekNVa0hnOUs4Z29D?=
 =?utf-8?B?ZVdDK2dqWVRrSE1KNTZhVlNpNmVPR21yVzVQTlQ1YkI0TmRKV1VVblRIMEE5?=
 =?utf-8?B?VGNlUEo0dnFDd2pZblVsVFFOVllHRUVWY3V5MW5STFdlUEoyTGgwTW5CTG9Z?=
 =?utf-8?B?VTVVVjhaSldZa1I2eHNxVzV3YmN6M2wySDZjdGdSaWFlb2NQUkJrOUNURUNl?=
 =?utf-8?B?U3V1Y0RHK0RPU25lcHp3MVZvMU1yUWk1cmZCUHdZUE1oSC8xcjlRWS9jc1kr?=
 =?utf-8?B?YjNUT0FCYzJTRkMwUHFUM25MekFXWkVzOWF2NmtDOFlpOXRaMk1sT2lLUzJa?=
 =?utf-8?B?R3RKbUQwUlFzc3FnczJZSi9OcWFtTzR2aGRCUGFZRDdrVloyOGZQelV1b1hq?=
 =?utf-8?B?OEIwMXYzdEJkSEl0Qjc5bmF0dEdCVm5yNXVaWWRaeE54OEozeFZqZUQ2UE9X?=
 =?utf-8?B?N3dYdnVnVGVYUHV2RkdWVXh4WlR5Zmt3UUNxRXhFVGxSZHdoNUI4YnZEZDRS?=
 =?utf-8?B?TXR5TXNpS0c1cVJJYmFaZ2tMdFp5eGE1S3B0Wk4vQnE2Q004VFFYQmM3K2lk?=
 =?utf-8?B?Y243VHFhRTZLc1d2RXR5a3ZHWjJtQVhCaHlQeHAwWTFHeU9RVzR5b3kyUnps?=
 =?utf-8?B?alYrcnVDdUpGemc4M1Q0UklFSitlVW5ma1dGM0dERS92QURGRzBZOS9yL1NO?=
 =?utf-8?B?SGZIeEt0SFVna0djeEovODFxZU5LRE5GUE9HbU8xSlNBVkxRTlN3b0oyeVkr?=
 =?utf-8?B?emRQN2ZraEJrN1JjNjR6aFdrN3dJaTBYMGdDVGxRMXgzZ3Nob3g3d0JoUUU0?=
 =?utf-8?B?anBYSGFWK1VYSjIwajg3Q0tYdnJtSFFZTGdaK1FTM25aSWNsY0FMaDFTdVNM?=
 =?utf-8?B?eVNCeHg2QklCM0tkamNiRHo0WVBORmNmbjZXeUxPSUlJNVh5Rm8xam5jM2l4?=
 =?utf-8?B?YlVLeWo0M2swYkxrdEEyekMwaDROODNQZThPaGpYN3dVVWFIbDRqKzd5WThS?=
 =?utf-8?B?eEpiOFl1akVaVUNTdUl2VGdiRm5CM09IOFdtNVBiMDBHY2crSGFwblA2RFlY?=
 =?utf-8?B?NFZEc1lZWGZNRjdaWGRKcTdXQWZXcjRiVEMvYWNXQnY3bVp3RUtvbENJVDBE?=
 =?utf-8?Q?yYYT7WFNJc3UC1wJDg9nkE4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da1a31b-e1c2-4578-e61b-08da02ba1968
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 17:19:14.2167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QEEiJLr1vj/gpB9MaasZwRw2TF4Gc+Hbdy8UHN0qMwDxtI+iVTbGlfrJagveErCGg8T9GvkSbyomO2g+LKrhrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4634
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/10/2022 6:10 PM, Rob Clark wrote:
> On Thu, Mar 10, 2022 at 8:21 AM Sharma, Shashank
> <shashank.sharma@amd.com> wrote:
>>
>>
>>
>> On 3/10/2022 4:24 PM, Rob Clark wrote:
>>> On Thu, Mar 10, 2022 at 1:55 AM Christian König
>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>
>>>>
>>>>
>>>> Am 09.03.22 um 19:12 schrieb Rob Clark:
>>>>> On Tue, Mar 8, 2022 at 11:40 PM Shashank Sharma
>>>>> <contactshashanksharma@gmail.com> wrote:
>>>>>> From: Shashank Sharma <shashank.sharma@amd.com>
>>>>>>
>>>>>> This patch adds a new sysfs event, which will indicate
>>>>>> the userland about a GPU reset, and can also provide
>>>>>> some information like:
>>>>>> - process ID of the process involved with the GPU reset
>>>>>> - process name of the involved process
>>>>>> - the GPU status info (using flags)
>>>>>>
>>>>>> This patch also introduces the first flag of the flags
>>>>>> bitmap, which can be appended as and when required.
>>>>> Why invent something new, rather than using the already existing devcoredump?
>>>>
>>>> Yeah, that's a really valid question.
>>>>
>>>>> I don't think we need (or should encourage/allow) something drm
>>>>> specific when there is already an existing solution used by both drm
>>>>> and non-drm drivers.  Userspace should not have to learn to support
>>>>> yet another mechanism to do the same thing.
>>>>
>>>> Question is how is userspace notified about new available core dumps?
>>>
>>> I haven't looked into it too closely, as the CrOS userspace
>>> crash-reporter already had support for devcoredump, so it "just
>>> worked" out of the box[1].  I believe a udev event is what triggers
>>> the crash-reporter to go read the devcore dump out of sysfs.
>>
>> I had a quick look at the devcoredump code, and it doesn't look like
>> that is sending an event to the user, so we still need an event to
>> indicate a GPU reset.
> 
> There definitely is an event to userspace, I suspect somewhere down
> the device_add() path?
> 

Let me check that out as well, hope that is not due to a driver-private 
event for GPU reset, coz I think I have seen some of those in a few DRM 
drivers.

- Shashank

> BR,
> -R
