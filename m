Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD44838C681
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 14:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF2E6E4AB;
	Fri, 21 May 2021 12:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79EEA6E4AB;
 Fri, 21 May 2021 12:28:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUuIQiSyAC86FN7hWEGRDeGcMeu5zSph7FvWXMa4Q31jmD2i/flpe//FvxKbd0Bwa4DUbbtRQwgrqGNGVCCj6e7viOjcAduiog5BJLrf37rIAhk63a+/m61IlWdfeHC035d5ytpM/RGJfJg74ni1ZcBC/7aH9yCPMmgRf/DO5EXefuNO2Pmwl8a4CnC+6X6avf8Y4nrjG40HwYY3fXOgSrWoTxgpocl+aHqJD2Sggaoi7Xi5MDrmruokQFHnJbzQkZoGIUIzFC/LtW9SxF0+MKPhAVswe5H6MYrXbUj6emHViIXZ178f4huNnXhy7iYhjfiuV0rOoGwTqHR1nQrTuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDTaFC6A56lzviBuzn6HKDa2YKf+vd/mhe5T2rDgygg=;
 b=I68mR81wz6zK0nXm8brGIPhifjCKnvN9bt+JCgEWi0ovENF4xw2gGgJYoIp3IDqown57SM3eCFFgkC67DlbxMFS9eLs+YCu2/F4kYBablq72IgivAyz6e4DlmSiw2WdvsrW8p7B7nU8STHI4to8ia4LcDEf/ShSn4+MmN72OaGXJSp6kUe9xkOXeMS827W4tbPNHKf2SB1oywaNhL6ciG84rxK3qZX7Mfo8YN4Tw6ec2KVQcJYzAzRjiQ1r+y8EVUoTS+MY2A7jcnggAMeF8gdLG3cUPUKnRF9iX0yKcofJ70hYYC9pysdW8j78toUhBIjuTRWzxXNG9YAtd3SRrbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDTaFC6A56lzviBuzn6HKDa2YKf+vd/mhe5T2rDgygg=;
 b=sjmWcev4I6erYM5ty4uEBRiVLYNs58ac2w9Jq42hBIW1Uygeir9h25SXCPR2KAwR7YiJRDDwr5EijQEATl07V0QRaVLK+wCnVRKw/07XiFZsQotyADN4qodtGN0ZietE7wC15+bZA65dUJE4GtXJeF+yYH3ZYeX9RURuKoxRFrM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Fri, 21 May
 2021 12:28:47 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.023; Fri, 21 May 2021
 12:28:47 +0000
Subject: Re: [Linaro-mm-sig] [PATCH 04/11] drm/panfrost: Fix implicit sync
To: Daniel Stone <daniel@fooishbar.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-4-daniel.vetter@ffwll.ch>
 <CAPj87rMBVRamT+VAVUaUnq3C1KFVqzABi99RKs=1_vyb4YWDnQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d1ef10e8-b774-06e5-92ab-047c58e1ea41@amd.com>
Date: Fri, 21 May 2021 14:28:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAPj87rMBVRamT+VAVUaUnq3C1KFVqzABi99RKs=1_vyb4YWDnQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d]
X-ClientProxiedBy: AM0PR04CA0040.eurprd04.prod.outlook.com
 (2603:10a6:208:1::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d]
 (2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d) by
 AM0PR04CA0040.eurprd04.prod.outlook.com (2603:10a6:208:1::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 12:28:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7afc9adb-1eb8-444c-fb60-08d91c53fabd
X-MS-TrafficTypeDiagnostic: MN2PR12MB4390:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4390610DE18D8B0340DC96DD83299@MN2PR12MB4390.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5mctcImB3EdftLQqT/Gqrqub82utOn8aLleBJTL/KihYETn37LSDaMkmccGJu1N+9CekTK464boil9nzhSgVLUjCvM/uQ/bPmKn/V6mHnVQJrlQqDF7UAHPdVIIGU4NiEHQwNCd0nibNoh6A/gTNWMWQHOQkDhX+3oX9EKyqbbZrHH6cD2t5dT0juR/M3F6Y1IksVePkITGj0Eq6GPumVJwuBFbckEcEJtphx0Hl09b3g+0J5qUsBKHi9vGD4a4AaD1OfUWeimvmO7NCxCCayo2fs59XXufDrZr0lMo+Er8R9GjTLzEzdA7He9uISQwXdH0owPw0xIBIP46ZyUtdo715qNe3ep4/MslAkzB0gv5zrWlwDnNMmt52chqXIa+v3Fo23FKnh8Uoc/pNk7YgQuGxTqyLWmr+/HL6HWqO6Ci60CS8UOjnf1bjhGiJ8fYkAH9mxS0ur5dJgvSeGUre/2Bful+cTekKRSiwoErYGVO3Fthd1qYsh/vVCyho4mAa1SB26jejlYKs3u58mwyOZVS7e8tPh6qv3HIh7uKai3Pj2qnmVsowjiZVsqws/Wr7KAl9AljuabAZWCRHYD54cnH5YgPhpIvl3oF2RehUwB06TJL5Ccu5jxWWX+uTCqNsGxb9ihYDmFzANNpsXw/d7fEe1NEVyvgbHL7xZOZmuPdsGPqVx6GJpjOOLu5NhYRXoldp9pUyIi6/66DrUVIFAfi9NlS+QK/SKjNqfn55Hn0SJoouCKx+4cRpaR8YT2gVaMOnHaLMmgUufnT7LEe3jJZX5OrJutm7Iln2Jb8Srmnuskls8KRDPl66K3LLAQcd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(6486002)(2906002)(6666004)(86362001)(2616005)(8676002)(5660300002)(4326008)(66946007)(66476007)(16526019)(186003)(110136005)(8936002)(54906003)(7416002)(66556008)(316002)(38100700002)(966005)(83380400001)(478600001)(31686004)(52116002)(36756003)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?LzVrSDFybXViTW5oazJsbXA5bUV0cG5qMUd4SHpkb1g4YjNnNk9OTzNiSE1o?=
 =?utf-8?B?bWcwWTl1Um5XRGhGK1ZXZWlsOERwc1RwSTFwUnl4dTJlTWdhdWhsbDVNU0dM?=
 =?utf-8?B?MWNpOGZvM2hIT1VMVjAzOVpVQ1pkaTFxaTBJNmQyL2VhN2lGYy9SdHFkYlJF?=
 =?utf-8?B?c1JlRWhNU3Y4WUl5V0tFOGoxMWUwdWhqYmRKRW52bm5EVDFFL0hYeFpFbFNO?=
 =?utf-8?B?NWNSZkNWREM0VkFCYnR4WThubklHNmovZmtOQ3hDZU9CZnZFcDh5QUFIdGtP?=
 =?utf-8?B?M0ZWYTlQY3g1MFdGVVRmQ1NZa2RGZUg2QzlCSkdDQ0oyQ3JjdnNOd282TGdQ?=
 =?utf-8?B?ZVJKSjlrVGorSlp2WFNoT216c2ZCaHRUeHlVWlZUQWdNWEJlbjRZaUlUYlcx?=
 =?utf-8?B?K3NOZy9VT3hWbGhtVEI5b0t1UnBXQVZmTXhVZjZJM2lncmljdm5MQ2xPd1NJ?=
 =?utf-8?B?enBENmdXbHE1TEZyR2dpVGU4RkxOZFFkcWtJanUxeU5KcnN1bExjbE9kZWl5?=
 =?utf-8?B?QzNVN2VKdGk4cWM4R2g3czZLTGpodzA5MnlnZU43cHZMZklibTQ0RCtybisw?=
 =?utf-8?B?aUw4TmNjS0ZQcGE0T1ZaSDdZNk5NbTVFbjM3VTlqYyt0TzRHVGdlWXFWZHRv?=
 =?utf-8?B?d2t5STJBS1RXQkVEY2FlUGV3dEVtc3diVmJjd3ZPY0tDWE41T3BEREtPYTZy?=
 =?utf-8?B?WGFRZmlqNVhLaS9OQ2d6aU95YmRBUCt3ejBhYkFQVnBvYXBRUXhwSlI4eTJY?=
 =?utf-8?B?QUhVdDZhNFJxQkk3eFVtVWhBYW1mN3NNalM1VkhRSEtzNUtHNDNZUE1oczlR?=
 =?utf-8?B?NE55cEhKMW1FOXRJdlpod01aRVpCK0xPak1ycENrcTNrZkppMUdJODRLSnpR?=
 =?utf-8?B?ZldOQWdUOGQyU2JJSGFRczB3akJpN1ZJRjJibnlndlVuZWtocjdURW5XbWlz?=
 =?utf-8?B?NDY5RlhKNWxLL08zbnQyVktOeXR4K0RScWJ4NVhIVm94SGRHMXB2VDVkTVRP?=
 =?utf-8?B?S0I0Sy9veDZ4SERqZGdLbFBwMXZRWmE5c3Fnc1pkTWxnZ01uMkRXcTRQTzlx?=
 =?utf-8?B?b0FOeXdGRDA2aDRSbXI1bkFDMyt0ZlIwbHBRMVBvY0lzdENuTmI4ZDdGb3dE?=
 =?utf-8?B?U2l0VzdhR1RndDFwVUFJUytwakJySlJMNHlJQnlEcFQ0Vk5jaVgrNm55eXNv?=
 =?utf-8?B?bU1TWGpjNDloRG5mSmZXV3d5cnZWVm1XNlBIL3NDekgvVEY3UTlCREFkRFN2?=
 =?utf-8?B?d1FzK3BJVGRhMldNL013NzFxUGdpTHhQb1Q4ZXFZVThpUmJKQmpsZkw5dzU2?=
 =?utf-8?B?bXZ5SUlGZG9MQmQ3WCtmbVN2N1NVZ0FUeU9XR000cTJwUTlDc0VlUUcvM1Ns?=
 =?utf-8?B?dUt6NUhKRVZyTDMvYUIyR09kTkNsZUlWNEpJTDY2b3JIdy9HV1BwaHl6UDA1?=
 =?utf-8?B?M05RRC82NjkyMHZvc0dLNndQZWw3UmFyOWZFQU45YTBlSkpXV2hyZ2Y2b0hS?=
 =?utf-8?B?NGNwbGN0UW1oUzdud0RqcktUYnhXL2Z4MWFJQ3Vwd0toTFlkb3JjWDNGV1R2?=
 =?utf-8?B?Vnl4MXJGWkVKRjFQYncyQ1lnYjRUY1MwMS9JZmdJWW1mclpBa0ZoYUhuN0NU?=
 =?utf-8?B?V3FPckcvd0ZRK2o3TzM0NHU0a1h0U0M5T2xlMzE3VWdSd3FIdHd6dDU0T1Nv?=
 =?utf-8?B?SDNRVHY2OU5zcUtobURSTGI1Tjd0ZXhPdTdSS0ZmTEE0eXdVZDJ0bjhpNTdQ?=
 =?utf-8?B?T2h4RXhxS2F4S1lNWlNHUzFqWW9hTDJ6WDd3VEdkVkowS3RZY2tlVFpiMnZp?=
 =?utf-8?B?NDRDKzVxcFR6QUpCdVZleXRpZ2NRNHZndXJQdExWTERnM3YwbHVCOEJUdDNq?=
 =?utf-8?Q?9bplRJRovkYOA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7afc9adb-1eb8-444c-fb60-08d91c53fabd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 12:28:47.1909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmmfVg+Sc5Oq+4n3q2g/PYFh+Smf8fqfbW5oRILfNw/baNgzcsAGMM7kcxFAlDHR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.05.21 um 14:22 schrieb Daniel Stone:
> Hi,
>
> On Fri, 21 May 2021 at 10:10, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>> Currently this has no practial relevance I think because there's not
>> many who can pull off a setup with panfrost and another gpu in the
>> same system. But the rules are that if you're setting an exclusive
>> fence, indicating a gpu write access in the implicit fencing system,
>> then you need to wait for all fences, not just the previous exclusive
>> fence.
>>
>> panfrost against itself has no problem, because it always sets the
>> exclusive fence (but that's probably something that will need to be
>> fixed for vulkan and/or multi-engine gpus, or you'll suffer badly).
>> Also no problem with that against display.
> Yeah, the 'second-generation Valhall' GPUs coming later this year /
> early next year are starting to get pretty weird. Firmware-mediated
> job scheduling out of multiple queues, userspace having direct access
> to the queues and can do inter-queue synchronisation (at least I think
> so), etc. For bonus points, synchronisation is based on $addr = $val
> to signal and $addr == $val to wait, with a separate fence primitive
> as well.

Well that sounds familiar :)

> Obviously Arm should be part of this conversation here, but I guess
> we'll have to wait for a while yet to see how everything's shaken out
> with this new gen, and hope that whatever's been designed upstream in
> the meantime is actually vaguely compatible ...

Yeah, going to keep you in CC when we start to code and review user fences.

Cheers,
Christian.

>
> Cheers,
> Daniel
> _______________________________________________
> Linaro-mm-sig mailing list
> Linaro-mm-sig@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/linaro-mm-sig

