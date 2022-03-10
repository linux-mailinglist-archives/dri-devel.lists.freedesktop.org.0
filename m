Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C494D4EE6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 17:21:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E6B10E453;
	Thu, 10 Mar 2022 16:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C6810E3BA;
 Thu, 10 Mar 2022 16:21:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cdx//x7lF7EvUg4qckY7hM7U8D5gEKA6bIk6HVfW+30chkWWL6DdUGKR9nM8WIDKGbf6H4C2bcdFCi1KGEBfK2CtPRjiC48sjLR0DgBqFTt7KR34IZp1+Z1+EL8oIZBjXCfspRFZ3MBh7jjQRmPZonljEkGFHsxAzugct0s96Rtzt/RsBfl1Gg4f3ueajT9G22+QYKQVYhiPLzflIgs8e8MzrVIHELcI7YvcmA/1m5Vs5FX+h0mtYXkw2ugytDINKfu/0yQ56V7eAmNyQXkk3lUAz//r2afoaaCvs6Yo1pjOepLWqF/cacEH2hXxetVCl9p0UmqSsVNYNncSWIpZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qJ9sAibH6Jxx/CCblCCyVcnkuUMQpvjUrbRMTDHd4s=;
 b=m4vyePs7Cl1UaKIdWpHJZBpAWLqvcFh+fig6W0DrHrHokzogTzEIF9cUtwQZWEPN/kvAa7GUh4oUdltSYe0FUoBDhHdN7AGW2c8bQxTIRXQSKFmjhNMhLVNc8k6AAj4teJeEOfH2ysANisEpS5ozw64EsHTrSphznM43y1HIJ+LCheKaA83u1LSTsBGA/OamUhvmVzEV99Dwm8v7buLP3Tw1nrfKex1wseTkvCfV66EAWgzn5nuTXZvC22GWcoJeZwbnAtVdkTzE1R2bBx/FglaZLOPEF+Id6iPqwUAliJHAo5j4LqkVZgMyK7C7apxAQNUO8sLwgbYIBEIZ6oym5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qJ9sAibH6Jxx/CCblCCyVcnkuUMQpvjUrbRMTDHd4s=;
 b=kSOhgFQWKi1jR8c/i3zGABOH0nl9wK+yOy9DWSfRaKTclf9XQFHkkH6gqwIPDV0WmznvmCXJyCqdNeyqfn6jaFbMp0fVeFQdZs9lIAgdTsjo09J/i51GFhdNSAm5BoPF2et6hEKWltjbBinp8dSzCk4HN5es+Q41BJXjATwU5WU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM6PR12MB4826.namprd12.prod.outlook.com (2603:10b6:5:1fd::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Thu, 10 Mar
 2022 16:21:16 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::f037:e2a1:f108:125a]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::f037:e2a1:f108:125a%8]) with mapi id 15.20.5038.029; Thu, 10 Mar 2022
 16:21:16 +0000
Message-ID: <4f2b2329-3c57-3895-6732-875db2f98b5a@amd.com>
Date: Thu, 10 Mar 2022 17:21:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <CAF6AEGsmectHSmW-Y6rf+AksXTkges7rukeiYd4yDm-xwdb1=Q@mail.gmail.com>
 <55629bd8-9fb4-2ee7-87f0-6c4c77cf06fc@gmail.com>
 <CAF6AEGsgDTphUm7ET+RuMmh2aTn-Ho5gJdUJ4kwJ3iOh7+HGvw@mail.gmail.com>
From: "Sharma, Shashank" <shashank.sharma@amd.com>
In-Reply-To: <CAF6AEGsgDTphUm7ET+RuMmh2aTn-Ho5gJdUJ4kwJ3iOh7+HGvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P194CA0024.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::37) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ed59731-46fa-4048-8263-08da02b2002e
X-MS-TrafficTypeDiagnostic: DM6PR12MB4826:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4826F3F5413BD354858D1F80F20B9@DM6PR12MB4826.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lxD9h/OvKRar+OFl/Jf8z/eJ81zM6wNQIx0vTOM98FVF1Z8rn6UGV1khNN3MPxGb1xhsmbyVj8gZdLmsVJcQo3mjMZUE+J2CtHB8vNnnPOyitXVpj+g1ukM+Xj3SzWadLlBXUxndVRs9tx3LR5ZrYkHWQpLNCKe5mssmzkk+7YG1kt5RbDDa/0BfTjTi7svGIcyletEDBU4b5qauw115s0SCdwiaUQyG5BtE5JDq9j5eROEvV0iLMPDXEYdDDvNVq4oAJLVa/+zSvD3TS7boNUg6JvDZJd0Wz7M+F/SVhRYGEVOe/v7Off29C85tZ0f0QkR+b8Bpx0FkMOSe+AcXfXuCXLSz8L07OMK8X7WEt+buSuthBMWMSzBUqiSClHCSqpP4c/ookVPal1KfZFSMjF9UlZEDo0e3PxW5WgZ/47Aca+xlLDCyn+HFvD+msLAUfRsRsm9Mb+7/yDsW3sD33TmcR2i14deqn2sotP31oG5vgZYQJ6VeQ5wc6jADOjN5IxpSBc+r0dlY9tHwfAI+dwONSs10d/fqA3AJLai3ZAqDHBb2pBn8YsAG4tRdAtF+lTaIej6l0kvSmH0laHogk9bOt+GjbqZ8BeRoY8QV+1cyJIUiEaosv42uhOEFRMnT8sD+zrAWa+CJXAtvRmo1lqeld07sOW2NwMAgWDaNlFNSBpkMBjryqdmXowIF/iz+wzdxhthaqsO2qm7+5SIEVTKTgQ2d84WKjVFFKKBmLJI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5040.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(186003)(31696002)(86362001)(508600001)(36756003)(2616005)(83380400001)(53546011)(6512007)(6666004)(6506007)(26005)(66946007)(2906002)(4326008)(5660300002)(66476007)(66556008)(8676002)(31686004)(110136005)(54906003)(38100700002)(316002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1JRZ2N1TmhOaHlSdVM4enRoc3pjTVJRNlZ2K3NpNGJlVlpNUVBRT21hVTJV?=
 =?utf-8?B?TXg0UkpRTG51NTdsRWhzZFZuNUlFR0NpZktQeHkzL09kRTZNeUQ0Z0ZEMFQ4?=
 =?utf-8?B?UHZNeEI2azJTVTI4emhLUUdHV1lmNytBUU52NW5wQ3pFaEkrY0pQZlBiWk9F?=
 =?utf-8?B?QzM2YXZiWTdBdWMxQXlCWVZPajhWT1F2U1FERmQ4ZitQWXEveXFjRzV6ekkr?=
 =?utf-8?B?REN0ZXBHdnRvbi9HTS9aTnBYTXVnUUUyNXlUcU9VZzFMYkdkMzhpZkIyQ1ZM?=
 =?utf-8?B?SC9Hd2xUMlZpb3lYT1ZVUWtMQllrK2l1UHByTVJyb3B2VzNmc2htMVRYODdn?=
 =?utf-8?B?SXNUU1VWRjEzUUZ6TGZ3d05HVm9jd0xKVTdXVGR2cGtKc080YUNaQjl1Yy9W?=
 =?utf-8?B?WXV0SjZNV2lrMktHQWMzNWE1TlhoMVRPS3hkYnpUQjltczJZNDhZeEY5N3R1?=
 =?utf-8?B?K2NXNmRMb0pabEM0YTVsQnBoQ29xSnNYWEIwTDhkNy9DWjJWWTBrZDlTbFVh?=
 =?utf-8?B?K3QzUVp0djJmZkNQUGpXMkpLY1pQc0pPVXJBOHJqSTZDbnNpQVdBMW5EaDNn?=
 =?utf-8?B?WE1KKzl5R1JIdHZZa2xHSG1pT051dkRyeXBFYlBMUndHV3BkNzE1KzJKdHlo?=
 =?utf-8?B?bkk1MXFaZURMa0dKMlNiNDJsYkxxczFWZVlab2d4WU54SzJJcEd5b3g2dkR6?=
 =?utf-8?B?VDNRd08ra3dmc0FtSGhEd25DdWx2OHphYlhvRGsyNnRLeG45MUtPT09xOVZx?=
 =?utf-8?B?dG50Z1dXd0ZtQm5xZUVKZUFIa3dld2FWV2FCTmtiWGJOcDdCWm42QTlkUW9z?=
 =?utf-8?B?V3hKMFRuS2dYaFUvWjhtbXFEVFk4bURXUlRsSnVCc010Y0l0UjdUNElFa2xa?=
 =?utf-8?B?VGFPRlVmK2NISS93ZTl0UFFnWjJmbFc4L3ZxcFU4Y3lkLzg4dWJ3dUlhemxp?=
 =?utf-8?B?VlVrSUY4NGNsVCtFbDdyQTY0MEhaRno1TTkxUkhrbE40SmJLa0tERDZ6Nk1H?=
 =?utf-8?B?U3JLVHB1UGd2b1FOdXYxT21DWWE1bXFBbDRwcVhZaTVrN3hEQ1BKYkhITHho?=
 =?utf-8?B?MnFUWmxMdHArd2IrZlgzVkVFdzNoaVFIMkNYdkVpOE9VMTVxeW5TZ2thLzU3?=
 =?utf-8?B?cmFlSllITHVEWDR1TGg5elFZN1dyTCtxSlE5bXVsd3pwd1dNbXAwS0tCNzBJ?=
 =?utf-8?B?TVZLdXB4cTdhRjAySE5iTzE5dEM4SFFuZ2hmVFVqY1FMOVFNcjNyWStxOFha?=
 =?utf-8?B?MXdnQjVQNGVKQ1picVlPTVpSSGM2b05DZko3R1pMc3UxbjljTDdTSlN4bjZL?=
 =?utf-8?B?Nkx5Y3pJOGtWKzI2LzZrOG1oeXFnTVJVSm9hNFRiZ2NZTWNOeitGZ3JTbE42?=
 =?utf-8?B?WG84c0ZOZzJLWFE1QjU4T2ptbmYrOG9UN3NYZzdLM09zREpiNUl1bXhDUi9H?=
 =?utf-8?B?bWRES0k4THYzUU0vZlNmbjdteHdjaDFCUkU0VWpSS1g0SCs2aElEbEZid3Zr?=
 =?utf-8?B?Z2dWODVQSVFWWUdnZEN5TDhScExQSW5TTUQ5OU9CcVk0bnlaS0NKc3FFUFIy?=
 =?utf-8?B?MDk2YXhjdml3bHpPT2VLbytRaEpwYW1jSFJhSEdWYUdVSXpCOERDc2RnQ0Vv?=
 =?utf-8?B?ZmlOUXVSZTNTMzJ0akExaUVOR0lZOFdaaUxLVjFKcmxKcEQwYTBHQ2JJRGxY?=
 =?utf-8?B?dTQxeGk5K3RjZHFTR0d1aENxT0ViTGorRUhRaTBpV0RXOG4zb3VVUEFndUpz?=
 =?utf-8?B?RXBZdEhMRmlmeWU4NGZHeVkvUXdPcDFlVlJOdXEwRURxbWRhS1ZQZHZwOXZV?=
 =?utf-8?B?VmFIMzBBUEkrKzc5Q0JuY2N1cDJoZlJlcjBKWUpiVnVYZmNsWHhkamMxam1N?=
 =?utf-8?B?VUNxSHoySi9kNWJmTFA1dFJmdXU2a1ByOSs1a1FxNklwREUrNFd0NzhxWktn?=
 =?utf-8?B?R01JUTJwMzJkOFByU29tN2l2YTRIT1F2TWVnWmFNcUVQMVhoc09pQ00xVzdk?=
 =?utf-8?B?ZHN4SHROZ3c0L3J6SGgvUGNuNE1Jek1KMjk3UkV4OWFoL2JZWWc4bmRZS1hB?=
 =?utf-8?B?eSsvZHFNczk5THNlVSs1MHZwa0FxZXFpelU5cWh3SElscEtkaW5ENGhHWkZo?=
 =?utf-8?B?TzNHb216OVRoTjlOdXFXTFNiOVM1MUZkNFlDNFE1MmNncGptaE16VlA0cmxk?=
 =?utf-8?Q?SN97r+sDklZztlnDxvVKaEQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed59731-46fa-4048-8263-08da02b2002e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 16:21:15.9953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qiDEKtMLpiNxlQDkjCGO0DWCkml6Y05mpF095GWxY+en1um3hLAmu8YVX88yy1Gi8w+qaiMV65vdv/gXMekXAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4826
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
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/10/2022 4:24 PM, Rob Clark wrote:
> On Thu, Mar 10, 2022 at 1:55 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>>
>>
>>
>> Am 09.03.22 um 19:12 schrieb Rob Clark:
>>> On Tue, Mar 8, 2022 at 11:40 PM Shashank Sharma
>>> <contactshashanksharma@gmail.com> wrote:
>>>> From: Shashank Sharma <shashank.sharma@amd.com>
>>>>
>>>> This patch adds a new sysfs event, which will indicate
>>>> the userland about a GPU reset, and can also provide
>>>> some information like:
>>>> - process ID of the process involved with the GPU reset
>>>> - process name of the involved process
>>>> - the GPU status info (using flags)
>>>>
>>>> This patch also introduces the first flag of the flags
>>>> bitmap, which can be appended as and when required.
>>> Why invent something new, rather than using the already existing devcoredump?
>>
>> Yeah, that's a really valid question.
>>
>>> I don't think we need (or should encourage/allow) something drm
>>> specific when there is already an existing solution used by both drm
>>> and non-drm drivers.  Userspace should not have to learn to support
>>> yet another mechanism to do the same thing.
>>
>> Question is how is userspace notified about new available core dumps?
> 
> I haven't looked into it too closely, as the CrOS userspace
> crash-reporter already had support for devcoredump, so it "just
> worked" out of the box[1].  I believe a udev event is what triggers
> the crash-reporter to go read the devcore dump out of sysfs.

I had a quick look at the devcoredump code, and it doesn't look like 
that is sending an event to the user, so we still need an event to 
indicate a GPU reset.

- Shashank

> 
> BR,
> -R
> 
> [1] One small change to allow-list the drm/msm devcore dumps was
> needed after a privacy review/audit of what is contained in the GPU
> devcored to ensure it does not contain any PII .. for CrOS on amd
> devices I'd be happy to walk whoever deals with amd CrOS devices
> through the process offline.
> 
>> Regards,
>> Christian.
>>
>>>
>>> BR,
>>> -R
>>
