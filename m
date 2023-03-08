Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8A26B102F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 18:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FC510E6CA;
	Wed,  8 Mar 2023 17:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979A110E6CC
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 17:28:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILtabLtdWBOCLVNWrMLYcTdhpFxZd794crdn0y6wVdwjzanUCV3W8yKK7UGmD/B7VN7z81tmCYuGR0+hZKhY4alZlgqSzF9HDpIlnAQwYJlO8qk2LMPDNfhZRKcC5HzUYNTQIsBnwWsrxlMv9ZD7hp+63eMzJkALpz2bkJZHOjlTkbXR43KEPwdkKFLKIKwIKm2fCOD+XXpWuAy5Gk8UDPoV2PfK+Sqo3XKJCbcQ+6p9uO8b1cOsu40ElraHdlsfoW/l336My0GfHjbz+udUqOd6VVe/m3A0jtDrjPcX9p+3znypCu4HDR+0mU/o+9ldlW/7RsdH0gSk9NkOhZNchg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5DPdjFzSja952kNHzfQf1M6wM5x7JEJPqVnNbnyjq0=;
 b=BQE+vdWsiEX99DGWgx4jwsXjdgIcoi1Pc9ayYSPiTJ0Hv3GCYWp0Rry7AiHrQDEnHsa6OYD/42nAmygyM6oCWCjG8IcBVM/8t/c6uetz7b1WiKGQEVElTsvJZ+Q9fTdOQTF12UDVTANGfDWfRzzUerNoxG3lgCUvYXRnkOsXEgTwPj1gfBfUb75luOTEezDNTY+1vN4VcQ7PmRifjbC3hEfPN3a9oH0eRqqWtra1pxjJ0q2Guhzc7Aj9Id/80GK+qLUyaOBNbCmtsP6NK1+bsaR29sl1cm5vkhizDtglzVnd1t1r77Dozf666ssOs5X2mINzBcXbfqnbpS2HEA1SLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5DPdjFzSja952kNHzfQf1M6wM5x7JEJPqVnNbnyjq0=;
 b=ozio1N5K/MRAfsv6Q69w4D9DxSaq6KZw+wEioxRKba3ljFyunpjfQYB6LHXlI0HfpA3/hgTbY4Rpz8Gg60xAHXj5QAKrBIReF9wjUOuDm8uyItV2UtzrKNDeoohX3sU8j8+rEXmFGwi+3i1INQ2Oh9ZsEn8BrFfDceDU6UqRBtAB7bJccpViP/qEfqjGPE5h+gVcrJMb2kUxRKhWFf/ilUYVQh9lrjbmHs+w6A/+lVp3jsgRhLn2qIwS5hYY+EXxcRFlk4Tu0jNJjfyYP3LfGJxRM7JhZWB3/F6jhjvEaAWOQil72Tpm2mmDGB0dopOzke/uK3Qt1O6JSufe1qpQ2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MN0PR12MB6150.namprd12.prod.outlook.com (2603:10b6:208:3c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 17:28:15 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07%9]) with mapi id 15.20.6156.031; Wed, 8 Mar 2023
 17:28:15 +0000
Message-ID: <67f9fe7f-392a-9acd-1a4d-0a43da634367@nvidia.com>
Date: Wed, 8 Mar 2023 17:28:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] gpu: host1x: fix uninitialized variable use
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230127221418.2522612-1-arnd@kernel.org>
 <Y/eULFO4jbivQ679@dev-arch.thelio-3990X>
 <20230308165644.GA1181835@dev-arch.thelio-3990X>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230308165644.GA1181835@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::35) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MN0PR12MB6150:EE_
X-MS-Office365-Filtering-Correlation-Id: 54540a3a-eb07-49c5-3e95-08db1ffa7fc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YypRur4I0CBPyEn48ylWeWv+vf8Vyiej/qpgjz7hmUY+pPImCk8dzsaV/V+IxOINO0YjerueHkz9FHy06SrQzFiyLNGM5MJGOtwg0JXDBDhXLbFsXiRk9OkyHUnPPEEp+TMKwGftwsVZ4ZNyuoa8A7VkWe49FqhZ2xbSCp9wf+tK+B8liMUwYKtCHWHa5sBr2L4sQ7vu9va+Kkjk6Ol1lf42PlXCAp3E/4+s1CDEt7MCflZZU8HAN53vVJ1dHhhBxVrzoi0Z6dmZT4+PilyPYKGMFKpDB0tkUYlfgYhIIqM/P0Z/H5o95l/3bh3bRPTcjF9lU+0Qxysww1LAnBBMN6xNiogMgHuWmoa7Btm3+GxRjUz+WqfnXezB4VOuCg3ceXCCxpH0TlUy6nPoy+Yv6QQs9FG+JgUgEZprYV8AULx+OmuDVROpB0/Kl2qJkrGBWChwIIduvIVsceeKXos94S8WBKF+BdoRUqqZGw0SlZ4sMnU+GcHs47O3Q6RPuqQFreytIEcwZSePG/kVMua0ftvuJkfhWqE4VZg3uARR3SgcbKy8BxWnCDbA6/LKttd4qbagZxPp/OkHZQ/119wqx5wNnFCeBw4oBJznF/RsC34K1TygVoNO5u7tvYjnnp4EEwN0ApxE6P9xYFfGY8ZOdNfPLf5jCiwjCHalsIu9iD1e5G6KVC5l2BMEIIT9FBrXIxBIFnWLDebL7A4U6vxNCHEPUiQqcfDUg0l1mrB06bMAnMQIKRfWJ0R+ON69Sup4lIOxzccga6LVHDLUWG+fAgWK0e3I10+i4SqcRkTzSTTYqzX1M00H3mssh0wPs7y+PGkkLuIL+FQQyXfJjGAFCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199018)(38100700002)(86362001)(31696002)(6666004)(66476007)(2906002)(36756003)(41300700001)(7416002)(8676002)(5660300002)(8936002)(66556008)(66946007)(4326008)(6506007)(53546011)(186003)(6512007)(83380400001)(2616005)(316002)(54906003)(478600001)(6486002)(966005)(110136005)(31686004)(32563001)(43740500002)(45980500001)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vm9rNkV0S1dYREVDSGJaZjZadHFDbG41dGlVSVQrMklkdExOMDlWMEZzSU1z?=
 =?utf-8?B?bm9NUG5OT1A1M0U1ZVJBRlNxL2NXNytLNDlwaUVwTmZYbURkQjBCLzNxclJv?=
 =?utf-8?B?ZkYyVDc2R2dpMzRhSWhoaURTOStCNlMxazRnTEZFamtycU5LdHY1VHFSZmM4?=
 =?utf-8?B?SzFYa2ROeUY0UXAvKzVRekNrb281VDkrU2J4ZjVNVVdMNFVYZXRCam9ZSTFh?=
 =?utf-8?B?WEVqdTBRRFU0WmdpLzkvODBpSEkzRDlGSHNvRzM0MUJWdUcwUG5iMmVVMnJU?=
 =?utf-8?B?cHArNHU1MmppeGtWUFJKSDNsbnFOYVVZbTNDNWkwdEJQck0yWmplbVhaeTJh?=
 =?utf-8?B?WmFKRzRDRUdSS29zZUdTSTRjOW94SjVMVE9udU1pUkVUbmowU3k3VTFDUHFq?=
 =?utf-8?B?SjZuU0pGcm1BMnEvb1duU2o3LzMvUGIzWnlueGg3ajBnZWd2R1dDUno3YW5y?=
 =?utf-8?B?UDRpUHlpRXBpQVVwY01QMDArTHhaRFVtSlVqQ05iVzFjdU85OTI5YSt4Q09E?=
 =?utf-8?B?bmxkblBDVUJmVERHNXp0NDZuK1Bqd24yZHhpUGlDdHExU0o4L0dHWEFBSUpV?=
 =?utf-8?B?RHJzQzY5WGJZVEswYTJFSEdVYWJYczh3ZDFIbHVTRndrT1Q4UktMdGdUQksr?=
 =?utf-8?B?Sm0ySnNsTis5MklKUEIwN3hxSHFZYk1PTWkvSlNkaE91UDZtanBhZVE2VjNE?=
 =?utf-8?B?bFh1TldqZS95dEROV0hOUmdQbFB5VlFJWkJNbVBJNE1DamxxL2VVN1pGWmtU?=
 =?utf-8?B?Vnp4UWc0OG1kcTZWY3VsRUpDMjBlNzhzUE9mSFU4MVJJWG5Jc0N5UHNPZENn?=
 =?utf-8?B?ZndXMElkeG13cUE2ZUFjQ2E1dnpBeGpNRnRYZmNGekNxcUlsZnBSTHgvT2VN?=
 =?utf-8?B?NmthRFVqSlRkL0JzUDFXOUo2UmxpbG5sVDI4aThIUEZuUFkzaloyR3h5OHlL?=
 =?utf-8?B?cUVKeDBYTnA4VjVtMStwNDQ3MUppckVGeXlJKzZIQ3I3RTlJcm9WcGd0enNj?=
 =?utf-8?B?WEdOV2NTNzdMek9hR2JTSHl5Q3RUZE1pOERsYWl2ekVpb0NYZU5WclRvRU1q?=
 =?utf-8?B?MmpZVmFUcStIdE84b1pjcG1iZzgzMkVab3lQbWorcEFlL0thQ0MxcW54bnpC?=
 =?utf-8?B?UUFCMGN0eEVpOG5FWHhFNkZNcEJ6NnFvaGJ2Qm9aMmRoREdQMWdXMXIrRVRT?=
 =?utf-8?B?cFo5UmNhc2Q4MlkxRUpGcjd4ejhzUGJCSkVVNC9pR0Y1dDduYXFNb25sRUc5?=
 =?utf-8?B?NTVHMWEvVUhvRHRmVjQrb1JZSkpadU5LQnBRSnlid3J3OU1tSC81K3JFb29y?=
 =?utf-8?B?SnJPa1RaNmxDTFpGNnJ2U1l0eitkQlQwdkRNWDlkYkhJeW1WeEdXekRVa0wr?=
 =?utf-8?B?cWc3bzlDdHhIaWtqVTdvQUUyNlI0QmtOV3JOS0FJNWxWL1VGL2xNL01EUHdn?=
 =?utf-8?B?YjRPYWt3OUlEZHQ1d0p2aUZMME1aNlpDN05SUzNqYmNMNFg4Mm9Qc0lvQzJR?=
 =?utf-8?B?RURGaVQ0UWFOU3FvZFdXdGdCMUMzQ0E4NHdET2xmYTR2NmVqbUovNGoydjI4?=
 =?utf-8?B?REU1UFZNM2dRSGZNbGZ5OWs0b3RhWk0yc1NlVmR3eFFBdWZpd2YzVUczRGZW?=
 =?utf-8?B?MnhJSHV6OGZid0N5bjg3NlhSa2orSkVPOU1DN3hvSTNibnk3MTh1TVJSMmVW?=
 =?utf-8?B?MnZFRVJJRWdvY0ZEMGlVTzJMOTBEbzBKeUdHUGlnb3FvL2picHIrZCtHMGZr?=
 =?utf-8?B?czJxQlFxMFl0Ym5tdFBNZ0FLVmg2S0dpcDArTlFQWHFhSmp2ZUFYMElEbzdE?=
 =?utf-8?B?Y3hmNnd4bzVTcEx4aUZLbm1LTSswOFZEb0RDU04xcEFMOTBCN1RnNm1TdDRK?=
 =?utf-8?B?RE9abjgrSHhQbnhLTDE3TVlLbjJYNWdSUWpORFVZbmNjb1UxZ25BczJ1ZFFY?=
 =?utf-8?B?RUtxN2EyV1h4SUs1Sjl0NCs2UmwwbEpkMHk4Z3hPbm5MWWJkOEw1UWt6dEY0?=
 =?utf-8?B?czFKd0tPMjJiSklIanBucFF1cUphMjBPRTQxN0MxSU9wdFFOZmNOaGlmVFNa?=
 =?utf-8?B?U291QUZ1NW9yRi9TTDh5WnU5dm9pRkE3T0kvNE0vQXlPdVF2KzlQbENmK3VB?=
 =?utf-8?B?b2FMbk1sRE9ZNGZON3RQdFRvWGcxMFlCcHdQM3NBVUg4WG8yZUJ4ODVuR0NV?=
 =?utf-8?B?ZHgyaXFyNUNqUUNwQjZDRTFndWsxVnpBcjAwb0Zwa2l6YzVIS1FYUmpYOENP?=
 =?utf-8?B?clhxLzBRVUVCNDN2dzhrZHRkTU93PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54540a3a-eb07-49c5-3e95-08db1ffa7fc8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 17:28:15.2296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEUYBhOcoGAgpmHc6wdZN/lzmmwZd8nGdkoenm0PwE3uBH4/A30Br1p0sgBEXaCcfiMBGXt+Q9SrM57+rduoZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6150
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
Cc: Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08/03/2023 16:56, Nathan Chancellor wrote:
> Ping? This warning is now in 6.3-rc1.

Thierry is away at the moment.

David, Daniel, do you want to pick this up directly in the meantime as a 
fix for 6.3? Mikko has already reviewed and FWIW ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon


> On Thu, Feb 23, 2023 at 09:28:28AM -0700, Nathan Chancellor wrote:
>> Hi Thierry, Daniel, and David,
>>
>> On Fri, Jan 27, 2023 at 11:14:00PM +0100, Arnd Bergmann wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> The error handling for platform_get_irq() failing no longer
>>> works after a recent change, clang now points this out with
>>> a warning:
>>>
>>> drivers/gpu/host1x/dev.c:520:6: error: variable 'syncpt_irq' is uninitialized when used here [-Werror,-Wuninitialized]
>>>          if (syncpt_irq < 0)
>>>              ^~~~~~~~~~
>>>
>>> Fix this by removing the variable and checking the correct
>>> error status.
>>>
>>> Fixes: 625d4ffb438c ("gpu: host1x: Rewrite syncpoint interrupt handling")
>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>> ---
>>>   drivers/gpu/host1x/dev.c | 5 ++---
>>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
>>> index 4872d183d860..aae2efeef503 100644
>>> --- a/drivers/gpu/host1x/dev.c
>>> +++ b/drivers/gpu/host1x/dev.c
>>> @@ -487,7 +487,6 @@ static int host1x_get_resets(struct host1x *host)
>>>   static int host1x_probe(struct platform_device *pdev)
>>>   {
>>>   	struct host1x *host;
>>> -	int syncpt_irq;
>>>   	int err;
>>>   
>>>   	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
>>> @@ -517,8 +516,8 @@ static int host1x_probe(struct platform_device *pdev)
>>>   	}
>>>   
>>>   	host->syncpt_irq = platform_get_irq(pdev, 0);
>>> -	if (syncpt_irq < 0)
>>> -		return syncpt_irq;
>>> +	if (host->syncpt_irq < 0)
>>> +		return host->syncpt_irq;
>>>   
>>>   	mutex_init(&host->devices_lock);
>>>   	INIT_LIST_HEAD(&host->devices);
>>> -- 
>>> 2.39.0
>>>
>>
>> Apologies if this has been reported already or has a solution in
>> progress but mainline is now broken because this change got separated
>> from the change it is fixing:
>>
>> https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/4249931209/jobs/7391912774
>> https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integration2/builds/2M7y9HpiXB13qiC2mkHMyeZOcLW/build.log
>>
>> I see this change sitting in the drm-tegra tree [1], which is getting
>> merged into -next, so it is fixed there, which is why we did not notice
>> any issues until the drm-next tree was merged into mainline. Can this be
>> fast tracked to Linus to unbreak clang builds with -Werror?
>>
>> [1]: https://gitlab.freedesktop.org/drm/tegra/-/commit/b9930311641cf2ed905a84aabe27e8f3868aee4a

-- 
nvpublic
