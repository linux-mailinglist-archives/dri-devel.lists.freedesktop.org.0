Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38833840688
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 14:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8459310EA2B;
	Mon, 29 Jan 2024 13:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B24310EA2B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 13:17:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZ0zFnLD9jxYRW3nnRlAOj5mYFiHPOTW3MvPyV3FVJvzyXcSPGbzualEw74HcIztYUmkTESekwAvm6qlEIgd/5vWQXwnZYChATnaGWgUJaAIwrGfnZlTy6EFSWyJQgjhLNYNmy7VIKaQ/4ADpzMXvbbfGHgkUTOqkNG0q+4uoOLtDy7Wuy5RhFkwg4rHqbudkIK0V9IoP0fE8JZ+QO1kUbYGXv7n4s1MgqDspRUkg5o25EsE77QX+YW7K2xw1pqgg8RYgbKrKbDF8rzHQdB5vowNy1B6SZST8TzwgK/VqMyEDbRy1S0Tr3BLGg1YE0JaJ2nmBobhJj1LMlUE6sS50g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TziM/MC4a+7rQVfajuIG3rpuBRK6MBZi4HF8k3308O8=;
 b=Dpt6U1mGGy2sfgw2r9JrdWo9c2APj+XNct7Xizq8bX9TWulVyrxZ86XiF0JVY2uU/f2UALctmZAGT9oCk2evUzKdTxdak5Ns6QZsG16Q4NdwVJw/nJayD5apnKVHhgBNXPM1WdELgiljnbXH8wCM+bV5ond+piqYQSZVtBzQpDZu4BDJlg1k5K6RItvzj+RwgX1Ftv1EZSJC1tcQeBgoq5QaSsYjP46pUoS+fWprTpZ0hFNUqmPfWtqYJOCUAGG9beFzZ+r3eQ2viRyf9TayxJqg0RGmypxVR3SVAm0zNAvnMw/5yytBpCstNgABrBOwRWArnqsJd3dO8+xRwjJXOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TziM/MC4a+7rQVfajuIG3rpuBRK6MBZi4HF8k3308O8=;
 b=MnhAVwCiZpTZ9qD28NLHTwxl5Wd9RXx2HonTwAZWkrtRG6Yze7hvGKwANUUWJhBfoYKhO0UCtG0tYlGStSEoDcxInpI8y4cMBVoLIOm2mbcb5jenmZwYB/wrGif2w8/OtxyrsxvD64RyVcBBQaVlOogTcftwxCy4jlcKK4LyR1g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL0PR12MB4929.namprd12.prod.outlook.com (2603:10b6:208:1c4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Mon, 29 Jan
 2024 13:17:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 13:17:30 +0000
Message-ID: <8fc55451-dfd7-4d09-8051-8b39048f85e2@amd.com>
Date: Mon, 29 Jan 2024 14:17:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] iio: core: Add new DMABUF interface infrastructure
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>, Jonathan Cameron <jic23@kernel.org>
References: <20231219175009.65482-1-paul@crapouillou.net>
 <20231219175009.65482-6-paul@crapouillou.net>
 <20231221120624.7bcdc302@jic23-huawei>
 <ee5d7bb2fb3e74e8fc621d745b23d1858e1f0c3c.camel@crapouillou.net>
 <20240127165044.22f1b329@jic23-huawei>
 <d6bef39c-f940-4097-8ca3-0cf4ef89a743@amd.com>
 <aac82ce15a49c5e4b939a69229b9a8a51ca00f5d.camel@crapouillou.net>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aac82ce15a49c5e4b939a69229b9a8a51ca00f5d.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL0PR12MB4929:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f51ebd-7e7e-44bf-b98a-08dc20cca552
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jthF+GGY5TWMfceu2Yvm06OP/1R7d0ggj8QmOeQta+12IqHw0inAHicHIn5Mbh2BMk9Ug8gaxc392uQJ7Si7oFyGM79R0cur4sWf1/i1/1QQEFUbR12NwfkL/f8OS50Mvlf68yJkFslgM/YVRcVWknH8EYTzjjqJdTRYyRJivYVtMydFQdAu2FXfY3IbyuI7QmMA2iS2D/OGUiIA3hE2DSdsuA9igHdnmeu+O4qtxb9z1wyjRI73MEt5sOm1FHC29+oHf3GwNPOIKE/oqS4YMRqHzIb0Cgj8QTvnB9odNjQt3gO1OqJ4HHUgyCpexI5UsQ2T0Zo4e2JFOdSj2loCzJHHZcz2p/CtJBJprHVywEmmKtYCSGIuTXnBji3npizxoc0qJc0dM3CXZ9Vh1Xr+G5mYCSGr9VdibeMMkaUBswPT8Otabj20AOpQqLu31oMUtu3VK6OzeLMjwWOnU4Ee4zbfwm2/0SDBJmdHlFac5tHe1IlVmDHzy90Bhq4qXnhnrPp6//el7KhroYyrLcddyeCJUsayVt9YAgFIjHWhPLJyT2FycsDOFp+/zffDJqEl8+HueD5V3N+zCVV5SIA7m4gnGm2Sv0rguX/+dRUMM+WCpHCf4JkDQ3fxvVrc/LUW/D08p1qZ+Y3l4zfnJSTu2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(366004)(39850400004)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(86362001)(31696002)(36756003)(38100700002)(6486002)(478600001)(41300700001)(8676002)(8936002)(4326008)(66946007)(26005)(66556008)(316002)(66476007)(54906003)(110136005)(2616005)(2906002)(7416002)(66574015)(6666004)(6512007)(5660300002)(6506007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUZUVFdOcjk1QzJlYmZFV2NlNkplbURLNHliTVFKa25teEROTi9BSUhpSG9Q?=
 =?utf-8?B?WkZRRU1tWDJ3NVYra1ZBaC8vcjk5azZFV3h4UFVXQVFCTGhROFdGQlYyc0Nt?=
 =?utf-8?B?MlJtMGVXTHozaVlweGZmN2gvcTlyejRqUGtuWHI1NTkrYURxenk1Z29HOUtI?=
 =?utf-8?B?ZzcvTmtXWnNQTWdxc1ZycWNlcFJvK2pxc3V4cjlZQWsxUXFvZ0wrSXNEazRX?=
 =?utf-8?B?QjQ0cGRWRmg3ZGdSNzBPU2ZKWkloSUk1cG1iaXdXZlNJSUtkekpZUzgxM1BS?=
 =?utf-8?B?UEJ3MlcwQlpDYXltWWoxK3BtWEE2eXNrNnU2ZzBkTXBXNDZwbGExNU1oMUdi?=
 =?utf-8?B?anJYVFFkaU9VWWpIVFNiUVZXK25ydEdrSjlmOVN0ZWluL0E3NFdxZXI3eHNq?=
 =?utf-8?B?U2E0VDJVbDRBRnF3akxhS3p0WjFJVWdwU0N2bFh3WjIxNWFEbEJnenliUGFX?=
 =?utf-8?B?d1c3T3dXN1BWengyNnpwbXdYaUtDdWhCTDFTNkZSNkVBSEsyRmJtR3d1RUsw?=
 =?utf-8?B?cmF6eGJvTmZHL1pGZ1FwL1FVd1hpRkhQVE1MeVdlM3pnMkI2bmorNlgwelZK?=
 =?utf-8?B?cmJXRW5KS3lEMlladEVnZHkreDNzNzkxTjEraW96cHg0RUtrRG1yVDI4Qlda?=
 =?utf-8?B?QWw0bExwdm5xZENJTnhjRlRQUDU3NXVhOUhYT3kyNnk0UlRnNWpHWTJFbDF1?=
 =?utf-8?B?RlozalpZVzlITU5pblFUQXRCNlI2dTZMU2E5QmczWlBRSS9XUFEzYnFIVW1L?=
 =?utf-8?B?OHRaek5OMitKTjV5RCs0SkxTS2N5aVNSSXQydXljZFJnM2hnamQ5U2RnMW14?=
 =?utf-8?B?QjVrWnc3ekZXUVJJVFlkdnp3U1QrdERodm1DOGdEbk9RTFFZeWpRenlCU2Zo?=
 =?utf-8?B?UENlL2JWbWhnOEwvanpLQmd6YUxLbWZqcmNJRXRYMzE2U0pEeCtFMzh3WnBw?=
 =?utf-8?B?Vkd5dmxsbGtzM2VQWWNCekIzdnVsczgyMzRacWpsMkxPNDhRazdDc0g3ZCtC?=
 =?utf-8?B?NTVGY0RuR2MyNGdhWjQvSFhFSGFBZ05DeGpBUEljYXlScE5SM0ROeHNZbHZS?=
 =?utf-8?B?NFUzVnoxS0NzSmFweEw1NGtzd0d5MGUwQmxjTVZVSk82azMyekd3eXZXTDRP?=
 =?utf-8?B?OHBaNkRoZWhMOW5VQzBzQkszcEt6a1JDRGYvTlBMR2YwN21FVGcvd0RjNmh6?=
 =?utf-8?B?b0J5dXpYbU9CMkdua2paUWhUSzhsNzYwVGg2UlZVSDdud0t6eWkvSUhzNjVq?=
 =?utf-8?B?S3MyaVBWNTVHSVQrQzU4YXRPczhBOEZLOW0zNmF6RmpIczFpNUpONWdCR1RI?=
 =?utf-8?B?RkFZOXVOUmIySWFWT2hYcFJJSWFlVng2bFVmVWJTZXY3WklUcnJ0eVM0RUtp?=
 =?utf-8?B?UTJUZEdkVjFiQW1EeUlSMElsTW84NTk0Zk1yNml0SXZaZHU0UE5sSE9qRkR2?=
 =?utf-8?B?N05MWk12MDhMMFhwS0JmWWcvMkRUOGdVeW1kU3ZNc1F0WU44Sk16ZzlDaS95?=
 =?utf-8?B?b0FmanNvUTBZdHE4ZHRkWjVsUVBXUXgwdGd5NE1yWkI2dmEzelc1eVVnS3NM?=
 =?utf-8?B?RVBYeVF5MDAvU2hTd0RFVWRsK1p3OFJRczdISEZRQ3NXWjRuVWR3Q1ZIeXd5?=
 =?utf-8?B?cnBMMEF5VHdGcnVRNWpjUTF5eVVEdHVVVnJXWmphZHMrckowOEd6N0JSdDUv?=
 =?utf-8?B?VFZoOGo5KzNpeFVkaDVRWlh5TmMyRytrNzA2WTB1Z1Bna2JzNGNQK0Z1c283?=
 =?utf-8?B?SEZ5eU5YaWM2bzhzTnZySkQrYmhTUXRHTk0wUkxMWHYveCtrUEVON0RlUHhy?=
 =?utf-8?B?ZVRzNFFTRnFYWjVOYThrTEdNZHlCMjYrcC8wMWNiNW5nVkVMeVFRc3ROYnVN?=
 =?utf-8?B?VzQwQkp2b1pJTXQ5S1pKT3hlZkZjWEpOZWFaVG5GVkU3d2lIS0k2TzhoTndO?=
 =?utf-8?B?UDduQUE1amszYzlUVXdqMDNsdmcrcW01d3NEZStsZnA5ZTlvL0hxelpEdkll?=
 =?utf-8?B?U0Zqb2VXZ2p3eEhYbjJ3OHdZengrL3huQlhTM1NZa3lxdXFGRkhjcDdFUGJO?=
 =?utf-8?B?NFlxR2F2WWY2Y3B6SFJISjI1S3hpRDJxWFhmNU80WmJidjhmcVRpSUcza0VT?=
 =?utf-8?Q?UrDJfYroSoIvRCEnnHNp7jHOS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f51ebd-7e7e-44bf-b98a-08dc20cca552
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 13:17:29.9931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9ERICCRppoDrgUG8pZry0OgcfxpOQjLkvHmWUtTQQcUdVLBZ2mgT8S6HvR1TdLF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4929
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Vinod Koul <vkoul@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>, dmaengine@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.01.24 um 14:06 schrieb Paul Cercueil:
> Hi Christian,
>
> Le lundi 29 janvier 2024 à 13:52 +0100, Christian König a écrit :
>> Am 27.01.24 um 17:50 schrieb Jonathan Cameron:
>>>>>> +	iio_buffer_dmabuf_put(attach);
>>>>>> +
>>>>>> +out_dmabuf_put:
>>>>>> +	dma_buf_put(dmabuf);
>>>>> As below. Feels like a __free(dma_buf_put) bit of magic would
>>>>> be a
>>>>> nice to have.
>>>> I'm working on the patches right now, just one quick question.
>>>>
>>>> Having a __free(dma_buf_put) requires that dma_buf_put is first
>>>> "registered" as a freeing function using DEFINE_FREE() in
>>>> <linux/dma-
>>>> buf.h>, which has not been done yet.
>>>>
>>>> That would mean carrying a dma-buf specific patch in your tree,
>>>> are you
>>>> OK with that?
>>> Needs an ACK from appropriate maintainer, but otherwise I'm fine
>>> doing
>>> so.  Alternative is to circle back to this later after this code is
>>> upstream.
>> Separate patches for that please, the autocleanup feature is so new
>> that
>> I'm not 100% convinced that everything works out smoothly from the
>> start.
> Separate patches is a given, did you mean outside this patchset?
> Because I can send a separate patchset that introduces scope-based
> management for dma_fence and dma_buf, but then it won't have users.

Outside of the patchset, this is essentially brand new stuff.

IIRC we have quite a number of dma_fence selftests and sw_sync which is 
basically code inside the drivers/dma-buf directory only there for 
testing DMA-buf functionality.

Convert those over as well and I'm more than happy to upstream this change.

Thanks,
Christian.

>
> Cheers,
> -Paul

