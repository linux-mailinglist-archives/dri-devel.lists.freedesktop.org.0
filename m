Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 929B15578BC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 13:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B609D10F085;
	Thu, 23 Jun 2022 11:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0735C10F085
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 11:32:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvZ7NqPl4CQL5uDw7Wm6zGAoS5jjX0oGm9IFtQXFqpEQsWsf9hkHs1+sZX/6IFpLcmeBKZHgrWSYv31v8/5+5YyH66ABHNRq4+NtnZfd8w2pkKrsJB5ZtvqZ9D8c4DL46x7R+TVIGRdW9tbAcXLS4G8vj6FJFxey8+FqCobgK64qNk3S/hR3AImllY5w5IT9bOgbcVGHNis+xyOJyWm9zJLMkUo5VVGGgYhSq3xxGKd3ZTlihEcPlU1OyqsKvfokSnUH2CJZP31X34JA4uyV1D/tD/bGLdcXW70wmhIQ+uQZ83+A2GgKg6cQEjZfThimzf72ZHlPtrAJJ94Hu+P3HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APiycPEHMnoeunBZCneioqv7F/BnjfeSAa9JqTJtpPM=;
 b=Jv5OfPTcsCjNRqqpwEbZzCtl7YNCVWtD7b4QeNZwCgxqqoi8gHj2nTVS7TIT04W2IwM3mzjux0/4FDGXe5qEICMoAYNqMR5MWlTOmTdVonfhrNMu8Jf343e8dgBVwCsaaeUU8M7RH4GHUXJ9Q94gqQXhVpyFsBZd9vGlCotbpSjtV726FCIO4bLDFfPPBYDKB+8QFQ3AL4mgUwzE8uUDvUUZuTMnmEk9DGr+J2NGb2ihekTVBQT8+Op7nMZBKgnxMPcS3IRV9F6BzgRTc1Q+GyqyPjYcMAvBIseho0MaKddzddv7QTGJ4Cy4lsBTEdx3ERC1tbr0THSbJCuQFWi0Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APiycPEHMnoeunBZCneioqv7F/BnjfeSAa9JqTJtpPM=;
 b=bGaXO6OyJY8+DuquVNTEsDI59cbbUH0AWLHk4BV99ikY9KzzImo+CscGj3g1oe20B1m1Q55fOyV0GuNCYP/aiMvQU0KdTSCbYrooSMVs+aB86OuW33SUGFd3IRhqZFKLCcwA1Zr9id5n+NgVXKeYIqqCIq++LbhJpNQliEPNb1o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY4PR1201MB2535.namprd12.prod.outlook.com (2603:10b6:903:db::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Thu, 23 Jun
 2022 11:32:26 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5373.015; Thu, 23 Jun 2022
 11:32:25 +0000
Message-ID: <578953dd-6298-2bfe-a8fb-52004b84fd17@amd.com>
Date: Thu, 23 Jun 2022 13:32:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: DMA-buf and uncached system memory
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <YCuPhOT4GhY3RR/6@phenom.ffwll.local>
 <9178e19f5c0e141772b61b759abaa0d176f902b6.camel@ndufresne.ca>
 <CAPj87rPYQNkgVEdHECQcHcYe2nCpgF3RYQKk_=wwhvJSxwHXCg@mail.gmail.com>
 <c6e65ee1-531e-d72c-a6a6-da7149e34f18@amd.com>
 <20220623101326.18beeab3@eldfell>
 <954d0a9b-29ef-52ef-f6ca-22d7e6aa3f4d@amd.com>
 <4b69f9f542d6efde2190b73c87096e87fa24d8ef.camel@pengutronix.de>
 <adc626ec-ff5a-5c06-44ce-09111be450cd@amd.com>
 <fbb228cd78e9bebd7e7921c19e0c4c09d0891f23.camel@pengutronix.de>
 <e691bccc-171d-f674-2817-13a945970f4a@amd.com>
 <95cca943bbfda6af07339fb8d2dc7f4da3aa0280.camel@pengutronix.de>
 <05814ddb-4f3e-99d8-025a-c31db7b2c46b@amd.com>
 <708e27755317a7650ca08ba2e4c14691ac0d6ba2.camel@pengutronix.de>
 <6287f5f8-d9af-e03d-a2c8-ea8ddcbdc0d8@amd.com>
 <CAPj87rOykZv7bjNhHPT4StrsPz8Y_DWqab4Ryq=Qqh77LS2e=Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPj87rOykZv7bjNhHPT4StrsPz8Y_DWqab4Ryq=Qqh77LS2e=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0202CA0013.eurprd02.prod.outlook.com
 (2603:10a6:203:69::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: faba3128-d548-44c9-55d0-08da550c0bb9
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2535:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB2535CD7AB6D75220FE60AC9A83B59@CY4PR1201MB2535.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IiBP5DGlgpwBLNuPdGazKoGwI7TEyP7aEXEnneHj32eO++jYAUXFF88arc5ve5oP4zEEJWw+8Do0WiqHjcJ9rvsuzw83onrLw9Msv69m6FliI3cVtemDsizs9HdHDARpehsrCacAb00LoUrW7tmDjEmRmuyjSACr/oU8RD7rvzse8KUqx5WfR/LUT+hXT613qW/qslf5GjASnDL98+QaRdKSLMYj5wl7+WlPN9uSgO8LAWpKMvI546S1WBb8Thq3gv3URDGRxD9EsxNSMF23rfTTBBW2Rbmnypi2lOyWj94SbB+7WCwiwZJeBnaQnBUBhzuGKWW5Snyw1DT2zF/4TsLaP5vHBZRsN/OmyM3/+YGjSqoYdfiycRWjx8U/YuWOswN8msdCugZhNK6GKo1Twi0MBKBi+ZtEDiHtmnJ1V8ptPZ6Vb5hv8H0r7ag3EzHAVpO+RJqp3ivbkzq9/oUwsz1R778/rZbZ4837hSSg+Vu2mcD1ZmVAruUIyMauXR8ArlkFS80GyMzsgZW2TxHEb/YW8Pj3KOXCHV/ZgYTyRJPdJ6ZawY+1hHT2T5+GAqIsuzruKLG8yD0aSpx4aub1xEzqsl6d9r1JIw6PBP8zgyPb3/gkCPrQAi8lM+x6YgGGifeTMbYM00r59PjBmH87LyJPF5Pm7XpCplpTXJ5UZIeTAw4OoaS3Lql9mdux9xPn6aaYVtgkEKj6Rkqo05CTPMwPVvrurPTH+U4Z5avcjU43F7geT+2CZslGmEYBEQ0b5QgGPxzcXt7ZbUJ74EC6U78eBqgWZ+5rHHx5S/6ouNw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(83380400001)(41300700001)(186003)(2616005)(6486002)(6666004)(31696002)(66574015)(38100700002)(8676002)(26005)(54906003)(66946007)(66476007)(6512007)(31686004)(36756003)(6506007)(2906002)(8936002)(316002)(66556008)(6916009)(478600001)(86362001)(5660300002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3htZ1p1cWhnWHpWWjN5K3JJY1FZV2NOL2xhQ3JIWFdSUFAyMnRjN21NaVhT?=
 =?utf-8?B?WmxBdk1uT3dOQjhCdzhLU2MwTElVT3c5YWFtaXhDNFN0TW43WmxVV1RvSjRY?=
 =?utf-8?B?alludWpWdUc0cHZiRTFTZ1hqWE1LdDEra04vMVZMaU1vUWwxbmtFR2dxR1M2?=
 =?utf-8?B?aWtyNDNzVm1GSXRiUjFOSTl6WTN5L3RCZmREUlNUeis5bXQrdVNEckVZWUlj?=
 =?utf-8?B?Ylk1bHUxY3ltUytjQ0c3c1owajVoUUlUdndXcUdLb0ZqVjFwUm84Wm5SVEFu?=
 =?utf-8?B?QXZBT1NGdmxvZjBXR001bVdiQVlYc0E4aVp4VWllbWxFMkpiWjBvSHI5M2lY?=
 =?utf-8?B?eWxwcmpqRXc1eGpTR3hOcU14NytjbEs4Qmo2Qkp2YjhkTnAxQjJidVg5Y00y?=
 =?utf-8?B?Y01KeGFPRmFteXEyNFhWMGZCbWxoNytNUkpEV0NZOVdEYVVsNFQzWHJGRXRk?=
 =?utf-8?B?OXliUkdnZUVsR0E4b1kzUzRpaU9TbVcyUUs2Ukc3TFgrTEQvRGl3a0FXRHJo?=
 =?utf-8?B?WkJEaFFEN0VMWWxLRmJRT0pKZjhhUm1MSXdjV0I3RC94M3ZGZFZoRW15cVha?=
 =?utf-8?B?czN1UGFaNmhGbEhrUDk0ZVUyNEFLMVV0ZnZGYWwrZ0dzc2l0SmFOM25OLzAr?=
 =?utf-8?B?Y2ZHbXpCS2JydnZwRFBCclQxMTVOdmQydUZaZnZNcTRibFJVeVdKcUp2OWI3?=
 =?utf-8?B?YXM0RVJTTzA2TzFVR09JamJTZXV6aS8wUThGN2YwY2lDbnJWd1N5QXUvcE9Q?=
 =?utf-8?B?ZDZYUCtEckhER2dNMW1QV2FBTU5oVVdyZnhPK05IZ2wrOGZMQndZRGQxa2Ja?=
 =?utf-8?B?dFhmOGs1aGNKK05HUmxRQXhZbjN4eDBpVkphS1pvdXpwUmxyMk5md25ZYmh3?=
 =?utf-8?B?OHlvMjVJRHFYRmN2ZFhYVTZPSHVlcUJKbnJXMnlXc0ZkL0tjQjhReU5HZldH?=
 =?utf-8?B?eFBOREc0SnVtOU5reFB1Y3VSVkhqQkZGQVkxVmM0VUJtdTM1YzFzSUcvU0ln?=
 =?utf-8?B?MmRMUlNxcjNGMFVUd3ZldktwQS9OeGNXb2FteTZHYU1CTWliV0F0c3FBemR3?=
 =?utf-8?B?YTBFdlFLdkFPUWQ4YW5EL01xQlVVQnlmTG9nZ281MmlpUE9aRkUrTW5DQVp6?=
 =?utf-8?B?YU9lRlA3R212SVU5T0ExTDQxZEVycUtQNSs4RmdFVHdlN3R4b0RQMkZmcHdD?=
 =?utf-8?B?d1lYbVdYZmNjQUtkRU94blcyc3FXbE8rVy9NT3cwQ2VDdTk4dmFiTUZJdThE?=
 =?utf-8?B?VUtON0syYVBJYlNqZ0ZQQXN0SkNWc21FK1I5amdDY3kwN1kwUmdzajQ1Mjdz?=
 =?utf-8?B?ajBBN3pSb2ZzV2lTS05xQ0R0WGpHbjZlY1poZGpaYW5tVmRubGdmbi9YWGd6?=
 =?utf-8?B?Y0lFbVgvV0RGZzVmRk5lR2p6Nm5yeEI4UkFycThqOGFUN3owQW5Rd1hyN0xQ?=
 =?utf-8?B?UWNyK0VtU3RpQUg2Q1JIS0RvdW90K2l5Ly80TTBCNnB5WHJnVktmSTdXMUlW?=
 =?utf-8?B?cUtHc09XSFFzcVVFeXhLOTNWOWxOZHJoQWNYdWRaNEYzcE9YdFVvL1pEMkVi?=
 =?utf-8?B?TVl6YVdLUnZuUHJBTHljSFhUaGpnTUJrdHhLYW10SDFaMm92ZUhXekc3SG9t?=
 =?utf-8?B?TTUxeW9NbWE0MUpMU0pzcysyaUR2enBXY3FXczdZNGF4TmxxazE0dTBBTHZN?=
 =?utf-8?B?TmgrMmhyYzMxcG91cFUreUg2NU85eWRpSWF2bXJOVU0vYTBydktiS3g2dUd3?=
 =?utf-8?B?bDZoSEdlZGE0SXI0NC9rbGVzTXVmQ01kWmxEL2s5RWhyTzFsSloySndjanFD?=
 =?utf-8?B?NzZlVkhSUC9OL1dRWDY4dGc0OW82OXgyVERHeml0empoRjl6OXZtNDd1dTNO?=
 =?utf-8?B?ZkFwU3hzTVJOT0pNeDRrNW5sTWFtVjN5ZHNXUjd6UG9RY3ZqSGxGR3JOWnpk?=
 =?utf-8?B?L0N0NUptQjJ5N0h4ZXZ3Z1NMNXRqWnRKYkhHUitwU1ZNSGVwWlBVSDRrbE4z?=
 =?utf-8?B?UG9mWlFpcFR4YkdFOWk2ZmpZWVp0aEN1QkVuZWk5akNsbnd2QXBhak5MUUFn?=
 =?utf-8?B?akZ5aFZoL3RWNkJmaEdhZFdWQUF4UTFYeWplWUladnJsdE5VMHVJZDI2NFEw?=
 =?utf-8?Q?bGjqfyg9pMkt7/wPW+wKlVO3b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faba3128-d548-44c9-55d0-08da550c0bb9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 11:32:25.2104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rQA7DjBNq5bxz74eEw6j+qDebHix8nENwTsgIg9jnxWLBFLjvaOXwpA+ghhg97BT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2535
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
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, linaro-mm-sig@lists.linaro.org,
 Pekka Paalanen <ppaalanen@gmail.com>,
 linux-media <linux-media@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.06.22 um 13:27 schrieb Daniel Stone:
> Hi Christian,
>
> On Thu, 23 Jun 2022 at 12:11, Christian König <christian.koenig@amd.com> wrote:
>>> In fact DMA-buf sharing works fine on most of those SoCs because
>>> everyone just assumes that all the accelerators don't snoop, so the
>>> memory shared via DMA-buf is mostly CPU uncached. It only falls apart
>>> for uses like the UVC cameras, where the shared buffer ends up being
>>> CPU cached.
>> Well then the existing DMA-buf framework is not what you want to use for
>> this.
>>
>>> Non-coherent without explicit domain transfer points is just not going
>>> to work. So why can't we solve the issue for DMA-buf in the same way as
>>> the DMA API already solved it years ago: by adding the equivalent of
>>> the dma_sync calls that do cache maintenance when necessary? On x86 (or
>>> any system where things are mostly coherent) you could still no-op them
>>> for the common case and only trigger cache cleaning if the importer
>>> explicitly says that is going to do a non-snooping access.
>> Because DMA-buf is a framework for buffer sharing between cache coherent
>> devices which don't signal transitions.
>>
>> We intentionally didn't implemented any of the dma_sync_* functions
>> because that would break the intended use case.
>>
>> You can of course use DMA-buf in an incoherent environment, but then you
>> can't expect that this works all the time.
>>
>> This is documented behavior and so far we have bluntly rejected any of
>> the complains that it doesn't work on most ARM SoCs and I don't really
>> see a way to do this differently.
> For some strange reason, 'let's do buffer sharing but make sure it
> doesn't work on Arm' wasn't exactly the intention of the groups who
> came together under the Linaro umbrella to create dmabuf.
>
> If it's really your belief that dmabuf requires universal snooping, I
> recommend you send the patch to update the documentation, as well as
> to remove DRIVER_PRIME from, realistically, most non-PCIE drivers.

Well, to be honest I think that would indeed be necessary.

What we have created are essentially two different worlds, one for PCI 
devices and one for the rest.

This was indeed not the intention, but it's a fact that basically all 
DMA-buf based PCI drivers assume coherent access.

Regards,
Christian.

>
> Cheers,
> Daniel

