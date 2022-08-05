Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D4C58AD3C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 17:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91753B790C;
	Fri,  5 Aug 2022 15:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4666DB7639;
 Fri,  5 Aug 2022 15:32:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8avi29TxQ+heAY5Ua6aitM4uMkuHzxrc9gvXLAtzSbNBj7Eckl/SZKzCf2g5hm0pu+QPrrPYpAqoFtel9jY5kBoQaDCRAqq4ekxhng4kSKFa19jGeEl96LSVDXzdmkygSvXayW1cGCtryNys1JYUQT9rdJnJ2oxYI6ZXuSzgJ6y6KcV9daqtv9lzGgclsYF7eNSVmosvzaqqssOjpHxDEYNazhs+Qx+Plctxc4MXPZmcUVla+5ucSmcnZLA3mCH91p5Ov1BKy+EwxhwVXYqtokVM2c/TZ0yYWjqbDKhMypNLAyHtTzSey5nxQS8Ole6VUDLxYSjfPzr3ZKGQ/zA7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Imu74BDeoNoXM/cnGiyxAjTr74ZmXuZdbjIhBwZ5h7E=;
 b=UVvXeM3IQBXnvwDBiLXlwr04n7SvVunC0AHIXVwv3TWqXHJzL/k7sBuxMfDntVCMbPokJAGxD9yzjA+2rscvFia/LDLShvvoI1Vc3nk0EqdA8MGC7xE4vO/2HgjKOTW+Y5Vo3vL6F0D0wBz9ixJL006bUuvEjy5w4zw3pqldnlLaVcOX2aXKURYGFDY2G1LDymigkUhA+mDJoEeXooEx5MDgWhGbrqOZ9/6JFohjzWFXL3yn/AJNZzuY+t27Ot7RtYwJregHWkZpxzTcJTpHOP1MMEPVkwxaRoUVEuLMY6nbl3S1guqguog0or1eI8FNgbScbTak82U0rVwL6rIiZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Imu74BDeoNoXM/cnGiyxAjTr74ZmXuZdbjIhBwZ5h7E=;
 b=i2RJPuEmqnSdCJhoL3C1HPKgLOer7j2/rJoEfVrgRatqYtLsn8f6XueFt38zCcqoapeOsPXGWiGil8gQXdfqvfzWlfrREK8N5aSbWA4AnPlKztOcQyIC82j9ws/I3FGosrlo3JLUY0262MRjpjLpGxm1WV2m7fjp8wz2Txu4vNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM6PR12MB3163.namprd12.prod.outlook.com (2603:10b6:5:15e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 15:32:37 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6999:13c9:d124:418a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6999:13c9:d124:418a%8]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 15:32:37 +0000
Message-ID: <9fb73284-7572-5703-93d3-f83a43535baf@amd.com>
Date: Fri, 5 Aug 2022 11:32:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: mainline build failure for x86_64 allmodconfig with clang
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
References: <YuwRyQYPCb1FD+mr@debian>
 <CAHk-=whptVSSZL=wSUQJdRBeVfS+Xy_K4anQ7eQOky7XUrXhUQ@mail.gmail.com>
 <CAK8P3a2bEaExue0OtNeLa2CVzBx-1dE9w2HZ2PAV5N8Ct9G=JQ@mail.gmail.com>
 <YuwvfsztWaHvquwC@dev-arch.thelio-3990X>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <YuwvfsztWaHvquwC@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0145.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::24) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5439a39a-c8e3-46f0-be19-08da76f7b996
X-MS-TrafficTypeDiagnostic: DM6PR12MB3163:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0I6G7uFHEu5nH3avgiSjCiIefT+TdKXAu8sn8KVN8bY/9sotznFz4tNBCSNdc186zufUfWUdmJdsyPf4FYfbmIGlsNnq/77FpoK31sKSdBIgLKyum9etiNGYZQCUcUaVkOwb/ygL/fqk5rcOdzh45k/aalED9/53YNqNC9YVvJoaphmRLt/3owuAb0aTgoqGY7ddsYBR7J3Br8LXkI2esEn5HdtiHn7Vnla4SFERFHz/Fqk3oE+AxiZ9M+ocYifJjyfT0Fzbm4vXwTKa6nDTINB/UCp6L6x947gWgr9Vz+wXqPM+UvppTMSKa+MBzcmCJ12ciPx5sWoMw7M3xHcrCPfBKkd4twzY+oBetO63OBsitgyr5NEprWjt0C1cs0KAMsw5zDBtJz0nDJoC/GybWXJQIOBrQAX6IA2qcF4jOSty2gB1aVlYNDOpO7cWMsT5hqdW5wYobHT5LWm3RKXRakX2eL3u8zPxsIds58Mi59CNq+/MHa6g1QIQZw/JWbsKdvxJMPEzfDz/4oBVpR5Qrufr+emdlFSz27JuqTQSHhdfyo0s3ihwVcbDCZzPtWoripHANWV1IxwUbCMtOlls9klrAlLEaeZvxqE3+dnNiYxnqvadcxkbHCqMnruXHTX8Q5VLg94jgQ1Od8PDfSksp2bExQpa6GxcAWNuf3bAzGfuQw5AjpKoBVWJLtamnKxucbBsJqGG8rAUXGpne+DsuzjyyQDft9pm2cmonOsTrppuk1fu4zIbVRDfYkj/jCAw6nWw/RM79lOKbzezvveQ5BExsgmEiFjUsaGgkiA/JjQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(376002)(136003)(346002)(396003)(54906003)(110136005)(2906002)(6636002)(316002)(8936002)(66946007)(8676002)(86362001)(66476007)(38100700002)(66556008)(44832011)(31696002)(4326008)(53546011)(2616005)(5660300002)(186003)(41300700001)(6666004)(31686004)(966005)(83380400001)(478600001)(6512007)(26005)(6486002)(6506007)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFNYM0l3dE45R0d2MFFBbS9Qb3JCaEdETjkxNDZndGJiUkRCVkJuenRDelRu?=
 =?utf-8?B?Z1ZGdEdrVE1rbmM5VEtIV2NVVXJaV3hjZ1IxMnB3dHdxS256VXRHV1o0NGFY?=
 =?utf-8?B?Z21uVm9hZlllMHl5cGFEeXhwTUxhRVJtUWpha1dlcnZZdis5M29EZHVPdUZE?=
 =?utf-8?B?S0luL056M1JCOEdCVjVwVmYvOFFFNHozWnhoeHAzQ3lHckFaM3NWd0tFL3gz?=
 =?utf-8?B?dEl0UHBRK0VkNFlmSTkvNWV3RUlGTGFhU3hpMkxGZ1RFTklvc3NCSXFNSC94?=
 =?utf-8?B?anFBOTRBbW9zdElhR1Y5NVdxdkpwSVNCZ0RQV1FOb2toOTQwQnhBM29nQ0NI?=
 =?utf-8?B?cUt6dmg5V2UvTXp4cGJaL2lQTUVNTGxlTkJ1TlFMcTlDMnpKeE1SakEzR3J6?=
 =?utf-8?B?N0JPSEdFMFVWQ1JuTzZxWU1VblVmTUdMWHVRaXVIVWFjNEc3OWNjc0dFbFJk?=
 =?utf-8?B?K1B4ZVZ4R1NBRFVheHJpRWlyaE5rOWhNRThub2F2TDRwUW4xdHhRVEJyK1V5?=
 =?utf-8?B?TmhsTW15YVdWUTdVMTZyYjBPUmtPOVYwUytybE12ekhVZUVWQXNTSjJzUjFU?=
 =?utf-8?B?ZEtLaEl5Ymg1YUJUL3E5ZTdLbUF4ZUI4ZEZkWGpRbWRvS3ZLeGZSQlB0NjBC?=
 =?utf-8?B?QS9vMjNRUis3ZzJRVVdIczVRdnc0Y1FDSDhHVloxNFpCdWEzRU0xUm1TYU5l?=
 =?utf-8?B?Qm5aZWhSUUdTKzhDZ29FeTRBNHdMWWhGWnhYUlNIY2JEWmV4cWZ0UDBzdDNJ?=
 =?utf-8?B?NUw1N1RNYnVNc3lmZUFsNVBTSDljWUttWEhIMlU1cUxQc0x4RmdjeWFIWVlF?=
 =?utf-8?B?Wk1iNUZKdDJnR1cyVlp0VkpmQ1lJd2pCVWEreXhGZEp3dHoyNmdybm9RUE5M?=
 =?utf-8?B?eTMyVlZBZ2FkVkJNcWIxbXRINk9XUzR1eUpuWDk1SFNqWHVUYUxDaUJZdFVn?=
 =?utf-8?B?aEpNd09yNkpvNXoxSm1WVGtYd0ZQMGYwdWlqKyswWmg5bHdJLzhxdFdaNEpa?=
 =?utf-8?B?dHZsVkEyaFdIS3BuZmVQRFVEczAvZ1pSaFdJbTNqSFphbi9RUWZYSkpQSXRn?=
 =?utf-8?B?RUdhMzNhQzdrZkcwWnBZY3JhS2ZMcHBhKyszKzhQQTN5VWRiZUYvKzhMZFNC?=
 =?utf-8?B?L2w1TTJmSTF5NEE0R1pxOXp5bk5sdHREeEFlRU01dmw0T3I5T2hEU0FMZGpn?=
 =?utf-8?B?aHIxL1NlS1pFanR5amdXU01GNVlxeGNzR2R4dXg1T1UrMWdTWXpYSmdXSlkr?=
 =?utf-8?B?c3hHSlpNRkZlWGdnODNvZnlCQS9ZdU5uSk9SM0lydWRRZ3praDVSZ2t1eHBu?=
 =?utf-8?B?Y1JIbWZ2a3VkOHhBalhzZ1lvOWRHbXlva2oxNUZ3TFZBWU1BU1gwTVBRVE1N?=
 =?utf-8?B?bGJjeGNtSkE3VTFJRmhpVTFBUnZTRWtKSWJ4S01hME5aWG9HQ29QT1NJV0ZR?=
 =?utf-8?B?VVk4eitZTk9jaFFQNytMT3JFTmhSL0RoaGlyUkJpazlRKzhvREY2U2lmeTRJ?=
 =?utf-8?B?YytBUDdVbEYzY2xOVCt2aTFhZVMyeDJJeENmZjhVbVVFQlFlak1nTmVpaE96?=
 =?utf-8?B?RTVGQnErZ2EvSXlZN1pteVJvM2llOS9oOUY1S1I3NFNNelFweWVabzg4bEk4?=
 =?utf-8?B?K2MvNTVPTzl4MW9acmViVFhEckhNTFNobmNGd3JEZHBEL3VQWUdXS0taS3VE?=
 =?utf-8?B?WTE4TTNuelRkYTZNdWVOb2pvaTJMSHJ1VS82OVFzaWw2V2JkZmhySXpOSW0z?=
 =?utf-8?B?c0dLd1llSlZuaDFESzFvbUR0Zk10VTRVRk1pY1ROMWhTK3RmOVF4M2NRY3FL?=
 =?utf-8?B?ZHliK2c3NjRIYnc0VitqT2JlRmFFQlBXMkFOcVpzVFFLS2hpbThpUzZYVUhG?=
 =?utf-8?B?QzNjbEt4WXlrNXUzcFh2LytDWE9kejUwck45ZU85Mi9HdmtGazRQL0MrVE5N?=
 =?utf-8?B?Zm5XdXl5U0xXVzF6Ry9XcXJKOUhiL1NSWVAzb3VlV2pkSUdCalgyUS9vcS9Z?=
 =?utf-8?B?S0R2RVhpS2U1VVRZNWl2T1RpeUpoYXlqRW1EaEhob0ludDJQNFJGWDRUZzBh?=
 =?utf-8?B?djdWeHdWTjZCaUlaYVNzT091aEVUUlVFTjZYeEJ1a1pXNVNJS3lJbFlFWmlV?=
 =?utf-8?Q?78WXxl1fFIdK8bz/oFuZMsMlX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5439a39a-c8e3-46f0-be19-08da76f7b996
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 15:32:37.1665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EaVVBpccmC5z+gQw3qi8ranypnllouM0UVcLBmdHjypl0MMG473Nk+rkYpgPIBcjk0JmiJCsThb47Wqx5Hn+kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3163
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
Cc: clang-built-linux <llvm@lists.linux.dev>, David Airlie <airlied@linux.ie>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Sudip Mukherjee \(Codethink\)" <sudipm.mukherjee@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-08-04 16:43, Nathan Chancellor wrote:
> On Thu, Aug 04, 2022 at 09:24:41PM +0200, Arnd Bergmann wrote:
>> On Thu, Aug 4, 2022 at 8:52 PM Linus Torvalds
>> <torvalds@linux-foundation.org> wrote:
>>>
>>> On Thu, Aug 4, 2022 at 11:37 AM Sudip Mukherjee (Codethink)
>>> <sudipm.mukherjee@gmail.com> wrote:cov_trace_cmp
>>>>
>>>> git bisect points to 3876a8b5e241 ("drm/amd/display: Enable building new display engine with KCOV enabled").
>>>
>>> Ahh. So that was presumably why it was disabled before - because it
>>> presumably does disgusting things that make KCOV generate even bigger
>>> stack frames than it already has.
>>>
>>> Those functions do seem to have fairly big stack footprints already (I
>>> didn't try to look into why, I assume it's partly due to aggressive
>>> inlining, and probably some automatic structures on stack). But gcc
>>> doesn't seem to make it all that much worse with KCOV (and my clang
>>> build doesn't enable KCOV).
>>>
>>> So it's presumably some KCOV-vs-clang thing. Nathan?
> 
> Looks like Arnd beat me to it :)
> 
>> The dependency was originally added to avoid a link failure in 9d1d02ff3678
>>  ("drm/amd/display: Don't build DCN1 when kcov is enabled") after I reported the
>> problem in https://lists.freedesktop.org/archives/dri-devel/2018-August/186131.html>>>
>> The commit from the bisection just turns off KCOV for the entire directory
>> to avoid the link failure, so it's not actually a problem with KCOV vs clang,
>> but I think a problem with clang vs badly written code that was obscured
>> in allmodconfig builds prior to this.
> 
> Right, I do think the sanitizers make things worse here too, as those get
> enabled with allmodconfig. I ran some really quick tests with allmodconfig and
> a few instrumentation options flipped on/off:
> 
> allmodconfig (CONFIG_KASAN=y, CONFIG_KCSAN=n, CONFIG_KCOV=y, and CONFIG_UBSAN=y):
> 
> warning: stack frame size (2216) exceeds limit (2048) in 'dml30_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
> warning: stack frame size (2184) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
> warning: stack frame size (2176) exceeds limit (2048) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
> 
> allmodconfig + CONFIG_KASAN=n:
> 
> warning: stack frame size (2112) exceeds limit (2048) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
> 
> allmodconfig + CONFIG_KCOV=n:
> 
> warning: stack frame size (2216) exceeds limit (2048) in 'dml30_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
> warning: stack frame size (2184) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
> warning: stack frame size (2176) exceeds limit (2048) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
> 
> allmodconfig + CONFIG_UBSAN=n:
> 
> warning: stack frame size (2584) exceeds limit (2048) in 'dml30_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
> warning: stack frame size (2680) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
> warning: stack frame size (2352) exceeds limit (2048) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
> 
> allmodconfig + CONFIG_KASAN=n + CONFIG_KCSAN=y + CONFIG_UBSAN=n:
> 
> warning: stack frame size (2504) exceeds limit (2048) in 'dml30_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
> warning: stack frame size (2600) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
> warning: stack frame size (2264) exceeds limit (2048) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
> 
> allmodconfig + CONFIG_KASAN=n + CONFIG_KCSAN=n + CONFIG_UBSAN=n:
> 
> warning: stack frame size (2072) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
> 
> There might be other debugging configurations that make this worse too,
> as I don't see those warnings on my distribution configuration.
> 
>> The dml30_ModeSupportAndSystemConfigurationFull() function exercises
>> a few paths in the compiler that are otherwise rare. On thing it does is to
>> pass up to 60 arguments to other functions, and it heavily uses float and
>> double variables. Both of these make it rather fragile when it comes to
>> unusual compiler options, so the files keep coming up whenever a new
>> instrumentation feature gets added. There is probably some other flag
>> in allmodconfig that we can disable to improve this again, but I have not
>> checked this time.
> 
> I do notice that these files build with a non-configurable
> -Wframe-large-than value:
> 
> $ rg frame_warn_flag drivers/gpu/drm/amd/display/dc/dml/Makefile
> 54:frame_warn_flag := -Wframe-larger-than=2048

Tbh, I was looking at the history and I can't find a good reason this
was added. It should be safe to drop this. I would much rather use
the CONFIG_FRAME_WARN value than override it.

AFAIK most builds use 2048 by default anyways.

> 70:CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vba_30.o := $(dml_ccflags) $(frame_warn_flag)
> 72:CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/display_mode_vba_31.o := $(dml_ccflags) $(frame_warn_flag)
> 76:CFLAGS_$(AMDDALPATH)/dc/dml/dcn32/display_mode_vba_32.o := $(dml_ccflags) $(frame_warn_flag)
> 
> I suppose that could just be bumped as a quick workaround? Two of those
> files have a comment that implies modifying them in non-trivial ways is
> not recommended.
> 
> /*
>  * NOTE:
>  *   This file is gcc-parsable HW gospel, coming straight from HW engineers.
>  *
>  * It doesn't adhere to Linux kernel style and sometimes will do things in odd
>  * ways. Unless there is something clearly wrong with it the code should
>  * remain as-is as it provides us with a guarantee from HW that it is correct.
>  */
> 
> I do note that commit 1b54a0121dba ("drm/amd/display: Reduce stack size
> in the mode support function") did have a workaround for GCC. It appears
> clang will still inline mode_support_configuration(). If I mark it as
> 'noinline', the warning disappears in that file.
> 

That'd be the best quick fix. I guess if we split out functions to fix
stack usage we should mark them as 'noinline' in the future to avoid
agressive compiler optimizations.

Harry

> Cheers,
> Nathan

