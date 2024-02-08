Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389FA84DA32
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 07:30:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFD010E13B;
	Thu,  8 Feb 2024 06:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FcI9DLTY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2042.outbound.protection.outlook.com [40.107.212.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D845210E13B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 06:30:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxWmbLekoox8Znz/n/4IL0ofn1Ctbk94TkDqWReod95aJ7ByfWRlFZUZH0tGDq9bNcDLNjs1XlYwWLAfveOFEjPtnHNQkZXhV5x7j+dmZAa0uqEp4dT6nqM7Uq3iJ/yvre2rbetwT7Qe9H8sDASVMfKIYgMIZBDkouTNtxs3+u8niJ1F2tTXzmcjW3b5xdeJ8XIivwzyEBpvkLpwXkXTshV6Q3XprRA3gK9aKWHpcGQVMb1WSZtMtdeZcoSUl4GiCkkhDtn3RTDOY5d3yK1MEbxV03u9KJXsjmuPxhWIz6di8Cw/LahSEpIB9y8HMmkbN3Lg13+9a2mV4U4pylxT7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ps0mmPyVepYDikad0NZGcnxiIIrnw2eZRuyu2QhPY5o=;
 b=L3ooWBqf+fyyunAzVnpNHHt6/Uyp/BrSA8AMgS3B+5QYY6UHv794/FrtuqzRame9tzjBg10fPxIn02OGbASPrwOjS1IEc3KhUQ3MKQxhzjBSIJCYRW9fCBCaFrnePC4O+quwno5kDDaWyUVwcMoIyNfpVa8ZRl4owc6xJ7VgsCv7O1xv+/7D7uauyHbIxITSWp9PTn0RZ/HNIkQRpUNxCA6EQL2l1SM5Zlb7Q4tVzeJ1MhugqLYz3xy4AEFRCL581sf4X3Lj2SOYTTB6VUKw6I0Wx2+llB7l5NVlGosFxBs4YgvWJ153v9JwZLwqApwjcrTtnQAjMNrys5gMpgMNqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ps0mmPyVepYDikad0NZGcnxiIIrnw2eZRuyu2QhPY5o=;
 b=FcI9DLTYgiV5sWMp2/wqtHqLL30gZbKjHQN1TRgHyAiHQH+c88VWSJe6rGEKvG7mCtYI0q+gNiz0LwUOxrD2uFV8tImhzN8XtjOpHEhiUaOykaBQE004WNYXyqUq2yN0OmFzQ+9YC+4ysC1UDhr3AMNJv2fnJLzTSSITho5qOKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7371.namprd12.prod.outlook.com (2603:10b6:806:29a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.14; Thu, 8 Feb
 2024 06:30:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7270.016; Thu, 8 Feb 2024
 06:30:26 +0000
Message-ID: <bafff5df-a382-45fa-b706-47cdf0afe2cf@amd.com>
Date: Thu, 8 Feb 2024 07:30:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: xe vs amdgpu userptr handling
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
References: <CAPM=9twPgn+fpbkig0Vhjt=cJdHQFbNH_Z=sRhSZwuvLKhavbA@mail.gmail.com>
 <0c4da8bd-452a-4ba5-9c4c-582cbc7b5dec@igalia.com>
 <CAPM=9twvcJPdZvaw+TOpTC+6NoNTbSqhy97aJRP5Hg0HBkQE0g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9twvcJPdZvaw+TOpTC+6NoNTbSqhy97aJRP5Hg0HBkQE0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0375.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: da27e1c4-f3bc-4285-280a-08dc286f7001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fl24tZuMNTzuhlETDNyYluZ6j78cBZ/j94saDoYahIPuC6S5GbWtEotJdp9gqFrfnOa12FO4bPd8ft+0673sSr411ocFF1CnV5d7V5oO+Ipjz+0/QkQVqPyooxWHjpBxSVG8YYBqunCD1sfEu5pa9C0EcqqHDIOPeaRmSLgbFL/zfdzpqUnfZUfTeDeRy/mKe8Icq3lPcrD/SqCV7HsjsmY7UKfxnMQV1ONBjiTZXvu45OcdFBDf9O08ipDiKWVIuvPoa6rAx8CUQ1O7vOalBnsS6m6TaQioWlvpP6II6qo5gEvdCEPv1AQAwtlQ7OGe0ntSAzWLrOGLmD7gwsapEi6iAr2mve6Nmk0alPi8iXY1hJ6mcN4S+OdX4DuZ117my8J5SJwayvb7WvREA/jZTZC+z8W89TTla8jYsVIvZIt9QReNxtx9kI6Ix8STcxAEQs8mEkfreWrXhxFeajXx4xhPdXg5O4cKCk9lZFa3sZiRBaFfsaIYrwLNjBGlzs7CMBTVZOl3Q7MRKXaAxVrzv4SHHjkwB6Xm+B8jFzXPn7MQVouymU02bFVjBQFSNfL0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(366004)(136003)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(6506007)(53546011)(6666004)(6512007)(66574015)(2616005)(31696002)(66556008)(26005)(316002)(36756003)(4326008)(5660300002)(110136005)(66476007)(8936002)(2906002)(66946007)(8676002)(41300700001)(6486002)(86362001)(478600001)(31686004)(83380400001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVk0SXdtSE9HQXZVdS9ZZVo4dWRxZGRaTGprd1BnY0VRZUNCNVZJekNWRzl6?=
 =?utf-8?B?NVl0aGR0VjJnaGR6SFZRemVMNjJ1V2M1QXpuOU50aXVIcmNqMFZVc2dQNUxJ?=
 =?utf-8?B?TzdrdkNDajV2WWtOTnBiWFcvMmsxQ1MvT21GY08xWHk2b1ZnUWw4NFl5R21x?=
 =?utf-8?B?OGhQZm9LM0RtWG5hVzlFL0tFU01MUVlKZFFVZGpSR0RtczhVdjdSOHMvak1C?=
 =?utf-8?B?ajl6MVlFREVudGgzMm5lZnhGWXBzd0xLM2hlZ2RLRExiODU3OWdrR1dCbWFD?=
 =?utf-8?B?NVZvRUtCUksreWxtdG0wRTVxTGcyVjRaYXVZNnQ3QWwyMTBkb3AyYS9QbjQ2?=
 =?utf-8?B?UEQxbjdvNVplWG5JbnZhZjBaWEtSUmUrWllrMk0wZy9ybWNIcHpnamxNWi9S?=
 =?utf-8?B?akFMZlNjTjFjZmowME1Nazc2LytwODk1RTNRM1I2NkFVN1BZV09HdXZ5NkZ0?=
 =?utf-8?B?TXlVUlk2OWxnV2wwUUtCcFZHL0Zzdm9RS3dvVTdZa0ZvbEZDMnBjUWEwYnBj?=
 =?utf-8?B?OVVIcEx6TW4zNlF6OGZOckRHVmc5VzZMaXR2L1poQ0hBTkc2VndaTkNYdWx6?=
 =?utf-8?B?TnEzem5VWGw1VnltZFhoWmdkeDhEOUxzeUl0Rk9JVWUvaHBJcldWaWxiS2dB?=
 =?utf-8?B?NE5KZWFwOElUWm5YMC9rTkw0b3JvZW5aNUpocW04ZHd2eTBHSytkQmxlVmh1?=
 =?utf-8?B?dFArMXhpQ3E0SmVEZC9zaTZxdnpJSHNyTDlOaC9YUHovQVVobFFZVFNzYmpS?=
 =?utf-8?B?RlZqVEdTRXZnUFByRU5sK1FERmdyR0Y1U25xaExlU3E2UkNOeEx1Nmg5Zmpy?=
 =?utf-8?B?Tm42S2pDRzdIREp6NldnNlRGdGZDbzJCTnhMTjB3enZtdFJYSVcvblJFRnpv?=
 =?utf-8?B?ekJ4bnluem9kSFBBUDl2ZTE1Z09oS2J0WlVaVGttT1dtd3Q5R3BacG9GQlpv?=
 =?utf-8?B?dGR5M0JNK21lUlhyM3RuWmZoZGF1Q0VjbCtWWTl1Z0lRS3FGeGp0cEorWnZr?=
 =?utf-8?B?N1dLOHdoNlZ5REZ3VUpKNjRzZnUzbkt6Vkh3R3pweFF0NWw1NjlsaXp4L2hu?=
 =?utf-8?B?MGNmR2hwa3k1K2pFbkFPZWFYSGdhdGVxa3JiMURtZ3Z3NWNESUhFZTFaOGY5?=
 =?utf-8?B?S21pWnFqaWw5RnNIY1NiaFhydS9RWGhwYlRIQy83VExXTlA0TGdCQVdhcU4z?=
 =?utf-8?B?TysxeHNWVy92a1RCOTE0aGg3UTdwc29ERG1OYUc5SGx2R1pETTZkNzU1WW9q?=
 =?utf-8?B?UzAxdzBmVHhYMFl5Z0Q3ekZCdGFjb29VZ0tuOXgxNmprajg0WGJYVUszZzlS?=
 =?utf-8?B?RDNwS0NOOWZESi9iMG5YTzZ6TU1zSEt6V0tDY3dRUlB1djdhcWl5cGdDY2RS?=
 =?utf-8?B?TldYbk80Q3pnSk4xbElKU1VYMk8rbnArUHJFMDV2V3g4cUNQNUNFVjRTSHJz?=
 =?utf-8?B?RHRiT2taZ3NiTWtSb3laVmxVRlVJU0h3N0Z5QWIyVHpNK1F2b2dnek9KKzhF?=
 =?utf-8?B?bVRyVjFlakwyTzJUejJpVDVTZk0zUjY2M3VySlRSeE5INXB2emlNbFF5K1lk?=
 =?utf-8?B?cjZWUVdNeUhCYjBubnBzRHRSNHZYWjR1SVFDVW4zd3NQYVk4dkxtSGdQNEdm?=
 =?utf-8?B?dzFhdi9DVGFXM0YwbkJrS0Q0MFlVejNjU2JmTHA4NnNqdjRhdGp5enZkaWdJ?=
 =?utf-8?B?am1iZ2pyUk5IT1JHMXhKQTQrWkN6L25QZlB6T29tQTkrUkYxanhlejB3WC9z?=
 =?utf-8?B?RFNtVUxLRUZMV2VmL2g3TVNaQTRjckZaNStMYUJZVEp5MktSNWdoMWdWSGlz?=
 =?utf-8?B?RUNsTzhCUTVKZ0YzZEtKVGZhY3YwT2ZQd3FrN0J5TnNKbVBQTlJxYUhabkkv?=
 =?utf-8?B?Wml4YllneUhaTFdXN0JwdmhNUXc0SXlXNHo4WTk3TnN4bnVWZ0FhZVRkd0dZ?=
 =?utf-8?B?RHJxUE1ySG04VUJadmVtVlBWaUk1SXA1bEl3bkhWUVIya2U3REtlWVE1Wmlj?=
 =?utf-8?B?Mi9GQW1abm00NFhDbmpYZVFnU0FvN1IvaTRMdWhOOHJGWm9La0lydUtQeUs2?=
 =?utf-8?B?UmZUTFZOc3Bid2VVVFBycjQ3ZlNiK2pvVkYwbUZwcmFRb1RPZFhFakNJTXpU?=
 =?utf-8?Q?Hc0Q1oi4Gu/n5dXNKze9YZu5K?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da27e1c4-f3bc-4285-280a-08dc286f7001
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 06:30:26.7057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YehdkxbjSu+vi+ZsotD8DwggkSRzh34GaeabmU2zXDK6iYZmx3pOBCsiU1vqrnkK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7371
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

Am 08.02.24 um 01:36 schrieb Dave Airlie:
> Just cc'ing some folks. I've also added another question.
>
> On Wed, 7 Feb 2024 at 21:08, Maíra Canal <mcanal@igalia.com> wrote:
>> Adding another point to this discussion, would it make sense to somehow
>> create a generic structure that all drivers, including shmem drivers,
>> could use it?
>>
>> Best Regards,
>> - Maíra
>>
>> On 2/7/24 03:56, Dave Airlie wrote:
>>> I'm just looking over the userptr handling in both drivers, and of
>>> course they've chosen different ways to represent things. Again this
>>> is a divergence that is just going to get more annoying over time and
>>> eventually I'd like to make hmm/userptr driver independent as much as
>>> possible, so we get consistent semantics in userspace.
>>>
>>> AFAICS the main difference is that amdgpu builds the userptr handling
>>> inside a GEM object in the kernel, whereas xe doesn't bother creating
>>> a holding object and just handles things directly in the VM binding
>>> code.
>>>
>>> Is this just different thinking at different times here?
>>> like since we have VM BIND in xe, it made sense not to bother creating
>>> a gem object for userptrs?
>>> or is there some other advantages to going one way or the other?
>>>
> So the current AMD code uses hmm to do userptr work, but xe doesn't
> again, why isn't xe using hmm here, I thought I remembered scenarios
> where plain mmu_notifiers weren't sufficient.

Well amdgpu is using hmm_range_fault because that was made mandatory for 
the userptr handling.

And yes pure mmu_notifiers are not sufficient, you need the sequence 
number + retry mechanism hmm_range_fault provides.

Otherwise you open up security holes you can push an elephant through.

Regards,
Christian.

>
> Dave.

