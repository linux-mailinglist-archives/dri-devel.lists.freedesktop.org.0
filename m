Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEF579A831
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 15:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D0210E028;
	Mon, 11 Sep 2023 13:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC8210E028
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 13:12:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WxHfFAgUNKyq7szUucpb3MJM9+WF7vJzpc7ZcrEUZrLDzBSpw0iiEZeWV+5v5j0rB7NlKFy4+MuDzCbKkxmgIXc8jSwyU6CRgQx8reB2frp5yWZBkuRMkZ5PyirgyTS7bGuMlZjRtHxM8sVNQjtyUekeSNpuC8PIU69YC/9a6181bQ4GqmwbPGmUV3Jyx9qFTUA88l6OagimFyhRVvIEnh7OKIP6GM5Ew/RY5GX0THAJHEHdv8wRgvJjnzFI4WHyPGFRcfCvvy546I65SqecPeS3YQQOLGDgEbi7gRS3jphNz2w9tIoH1BJA76UHKLfBG8GLQVKx/hFhB5ttVZp9gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsC82h9st7vXsvVArWtkdxw4dXWo0muvyUJ9bhsB4vs=;
 b=JplXi2NDeaFEtJvWTAVLl01BXlampaC69/JYUY1hKYGnuap6pzHwAAwH6WMyK6jPBvyDsLDtZY3xDJoA2PUUHrK3T/AtTKF3uIOyG2XtF/7wBWeI9RW14GAmyB5zb7EqbG6rxCDsjK8+K9I7FhtgiSbRgSdiAC9FAQGD1BRf2y3zstQy/kco44+114FAlY62ci5ohHbyYYfIMk/SgzerczDmlXLuxwEF/u9sLmbyCDsvvqTDIPN/EIs8LHb165MDXGxeSB6XWmztoJxs0npdsrHC2mKulxbsO16ZQHnK1Qo13NjxE9PVkTaaxOYUh2Wrx3Tj8uH2l3n68IPPZc2aVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsC82h9st7vXsvVArWtkdxw4dXWo0muvyUJ9bhsB4vs=;
 b=U2yLNvVBbMvYAimuPWorrsoepYEfbDiEAfedukx3Dng6obQMZIE3Ztrtiui6F4bmK51KAoH8dL8SE75ZIathdOdQT8XiebwOVndLhJWPMLr+IgHszv8nADxFMlwx1wubt35KVpy7f8gSC6+uBtqIk8OqDMVACbXJXP5uEySs6Gk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4269.namprd12.prod.outlook.com (2603:10b6:208:1d4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 13:12:14 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 13:12:14 +0000
Message-ID: <4080bd92-d10e-4cb3-fce4-a76892834baf@amd.com>
Date: Mon, 11 Sep 2023 15:12:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 1/5] drm/ttm: Update Makefile for KUnit
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org
References: <cover.1694422112.git.karolina.stolarek@intel.com>
 <3782fd55e8479296daab7041430fe7b0848bf621.1694422112.git.karolina.stolarek@intel.com>
 <87fs3lf0ht.fsf@intel.com> <60ffa6fe-4750-c864-9012-7a047a0f1c3b@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <60ffa6fe-4750-c864-9012-7a047a0f1c3b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN2PR12MB4269:EE_
X-MS-Office365-Filtering-Correlation-Id: 155baa0b-e7a9-497c-951a-08dbb2c8b756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B+edtt3bO1ogEJ5X3BOwscgt4DUrpVXUCPH1gp7Xa5I7xA07wyeWgt0hc1D+IFpLcr2byq9hiG91fDU/8XMKmpnZS5kOKHXUQ0ItrEqFzhG743vGV6rlqQTq4cupQ6QjNrt1by71OjsDZjXVOyDC57ESICERLtTl09rMVwC7/iDgwMLNDbT8Mk0FZBlWHhXStYkhW1rFE4AJofQkBpC6QqXe6hY8U2+S5q0tmtK/yJEB97/MmH8dtvAHUH5fceoMxUIPqQhCOXbR69N/lxjLAtadDWMwPjfjixOUMZWWcwiAHhWCxTQ++aKEqVK2cLSVuHVKUzjKhGOEdN9MTJZ5Z5R+IxdPk/PnNQlD8J7Aqo4oW26hnhFGjtJrHPjMSzV+GzR4ZV7zT07P6lnveQ6xRUkP4ALhKvW/0zUXVbf8zTYjALtRt96IDBo+v5rzq199+l+befM6zfu0Dlc7GDdCdj9TqP+OoAZU5EMdEK6/neegkiKRniE3EoJJODR/1jJSOOLf3jxB9GpW8PKhFU2vgBweow23bPbinftKYq9Exo1q6BBOsZECukspVoM6rKurP78lmUt+gvbhmDQKWQ4B4nZNy0NaAG5etNPQvZdXxEjKJSKhmdc5u2dXsehhf+cYLYZ+FMwq5Py5524DgOsOYCgTeS1Hkx8WtDiones0m7dBpoAOv1thnEZ2lQdzDdsb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(376002)(366004)(39860400002)(186009)(1800799009)(451199024)(110136005)(6486002)(6506007)(53546011)(6666004)(966005)(6512007)(478600001)(83380400001)(26005)(2616005)(15650500001)(54906003)(66476007)(66556008)(66946007)(4326008)(316002)(2906002)(41300700001)(5660300002)(8936002)(8676002)(86362001)(31696002)(36756003)(38100700002)(31686004)(66899024)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGhSVTVDZHhGeFh3RDVELzFwcVl0WHIxZ2o2UktISjZISG92Q0lLSjNjMHZN?=
 =?utf-8?B?TVhUbHl2cmsvalhXb2ZwU1MvOStRaDBNZnB4OWRzRGczM25NR2tqdTFOUnVP?=
 =?utf-8?B?b2Rsc1lQMFlTak9nRWhyRXdrMzFucTNUemx3VVNJRWhSNkM0K1E4T1ErYS91?=
 =?utf-8?B?eDdFVjdZc05OZ0I4NklkOG8wREEyOVNwMlo2Y3pQZ3Z4SVFDb0Q0eVVCMFZD?=
 =?utf-8?B?UEVzckVpWFIrT0R4TEVSR0d1b1lVRk5KZ28zRW1BbldkbGFOY3JaeWtWaGpi?=
 =?utf-8?B?eXBhdmh6WTVYbE54U0htcnEwOFF6cGlXcVRrZ0hYV3VYNkNNV0tZRHhTc1dw?=
 =?utf-8?B?ZEJBV3VBOFl5OTJmMUdPY0hsWW5Hb253bjA1RDRuVzVpRmhTM3ovZVhlNWxk?=
 =?utf-8?B?ZytjR2o1TlU0QkxIYUJzYWhXL0VYeGZ4dU9tdWdYai9hQzI0QU1nRFRDeFpP?=
 =?utf-8?B?cjNvcUlCVzJZK3ZrSTNnWHFXSElqeFJ1Q3lCbm9RcGdHS0JLUWVCamNXbDd6?=
 =?utf-8?B?cDlBQ2RIelYzTktYMjcwcWdlSjFka0xoQlA0c1ozbW5qOFNrT3BsSm1wNTJl?=
 =?utf-8?B?T1JPNUord01NdjAxbXFQTWI2K1ZNTVh1RGNwV0dZa2w2S1hSU0FwUnJNcFJw?=
 =?utf-8?B?RmNwZ1g4eUg5TVF3a2RBZTBGaGd3LzVrQTRRMTY2SVlpK2FDdTZobzZHTjA3?=
 =?utf-8?B?KzllMmZqd2VKWEhXM2xNcDNLMDd5cWY2QUJjNnBpS1UyQ3hnOUgva2NkWWEr?=
 =?utf-8?B?czNHRGpYTnpGVTJGRjJteVJpTGU3OXFYcHRLb2Z5M0UremVmSDN3eG1TK3Zm?=
 =?utf-8?B?U3RZbVNzRUxIUzUvMlZPZXFON2VSS0FpeEFjakkrUWJXZUtsY0pwV3BjVXJo?=
 =?utf-8?B?TGZWdHBnZ2ZLUzYxZURRb0lkTUV4Tm12Q0JOT3lnNmpaM2FTS293L08rRWw1?=
 =?utf-8?B?NnhpSWdtenJObzF2MXJOZkJ3cExCYUFFZ0FGaFBZQUM3N0FMN3BEcklxZGxU?=
 =?utf-8?B?ODVqUVlSdllDck9oelVCTEVXSVZqZzI1QnJIUlVGN29zc1plVTgrZDFYL3di?=
 =?utf-8?B?b1BHRlNCeWgycnBOUDBrRUV0ZnhDc0VKbE4raVUvbytKSDN3OGhMdmdYOFdK?=
 =?utf-8?B?RU80VzZvZEtXOHBtMGlxTGNUNnJCc2hXNVJUcThUWWpSRTJhR0cwcjdJYnY3?=
 =?utf-8?B?a3B2OGpLVnFIU284b1RSSWNGTGN4cFdiT1BnOE84alR3aGlCMWNDa1pOMmpE?=
 =?utf-8?B?VlBrMGVldkw2SDE1ZDNYT1QwQ3p0cHVDYm4yWDVSbnR1RUdhenNjYmphelhj?=
 =?utf-8?B?UTVDYkswM1hYMzVmWnpSUGEvK0tkMVpid2c0VXJiZEd3eDBxZDlROTEyelJW?=
 =?utf-8?B?dFA2R0VFYTlldjN3SlBwcXBXaHJwUHEvTHVaRER1Ym5RM1Z4UXF4ck5ycmo0?=
 =?utf-8?B?MERYRTY3b3Zyb2FDaWE1R2lBaHBTM3dwaUtWY2pMZ0p1NGZyRWl0WDRBODMy?=
 =?utf-8?B?TmZpeTJ3cnprQm1rT0F1Q2tJV2JtZjZuQXpUeURwOENITVBqTVFnNENVdkdo?=
 =?utf-8?B?NUFLblhrU05WVnFtcWNWcmlGbWsrUlFvUVV2VUxkZFl0ekhzSHNkVkJkdEVF?=
 =?utf-8?B?TkFUcGphemRpTFdGUWp3OFl2d0hQU05mZndMSWRuMXcyMDh4VWVWOVI0Qk5V?=
 =?utf-8?B?b3BYaTZTUHVSNE1LcnVWcUxWQzFlZGRiczZEMmlYN20vanZyTzhNYmlab01E?=
 =?utf-8?B?aVhlcjNITW4rU2hsbEZHamxlOGFHd2tldHFCWUtIVnlFOGdsSHhQZGU4UnhE?=
 =?utf-8?B?RWZnOFcwY1ZDYUl2cXpqMzhDVzZyWStaeERsWWFZS3BXcGc1cVNidTE3TktR?=
 =?utf-8?B?U1BUQUhIMEhFV2xhaVBlZG1CWTU1RHFLRi9TckZJa0RlWHJ4MjRGQjBOblRN?=
 =?utf-8?B?ODFzbWZZMDd6RFZETEgrYWFQZlhtRkJLaWp1T2FXbTdhYVhUWmxNY2QzaUVj?=
 =?utf-8?B?eVVOUk9FTlZpMW1DQlREL1puNm5sNjNrZzlOb1p5VEs5TzRRUG5BMUpFMW5Q?=
 =?utf-8?B?TDk1bm5wSUFhMGxKcjhKZ25ZYzJmbVpXTzIwVUVoYithak94bmtWUDNvWmdY?=
 =?utf-8?Q?k1oohE5l8uEgDphx1h/ZxLSvT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 155baa0b-e7a9-497c-951a-08dbb2c8b756
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 13:12:14.3244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XdqXdhe60oOb816JJ3fvXPb53JjRYIjnm5Sy1peilg3yfFPVbRLrSTK+A95oMdh1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4269
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.09.23 um 13:47 schrieb Karolina Stolarek:
> On 11.09.2023 12:49, Jani Nikula wrote:
>> On Mon, 11 Sep 2023, Karolina Stolarek <karolina.stolarek@intel.com> 
>> wrote:
>>> Update Makefile so it can produce a module that consists of TTM tests.
>>> This will allow us to test non-exported functions when KUnit tests
>>> are built as a module. Remove the tests' Makefile.
>>
>> I'm asking questions instead of making assertions, because I'm not 100%
>> confident, but I don't feel like this Makefile could work right.
>
> Questions, assertions and comments are fine, I'm glad you're taking a 
> look at the patch :) I'm not 100% confident either, so I welcome 
> suggestions on how to improve it.
>
> The problem is that TTM tests try to test symbols that are not 
> exported, so I have to compile all the files together into one module 
> if I choose to build KUnit tests as a module. The other option that 
> I'm considering is to make the tests are builtin only. I'm tempted to 
> go with it (for the sake of simplicity), but I'm trying to get the 
> module option to work first.

I have to admit that this looks pretty awkward, but I'm not an expert on 
the Linux build system in the first place.

Would it be an option to build the unit tests into the standard ttm.ko 
module and let them run whenever that module loads?

On the other hand if this solution here works, why not?

Regards,
Christian.

>
>>
>>>
>>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: 
>>> https://lore.kernel.org/oe-kbuild-all/202309010358.50gYLkmw-lkp@intel.com/
>>> Closes: 
>>> https://lore.kernel.org/oe-kbuild-all/202309011134.bwvpuyOj-lkp@intel.com/
>>> Closes: 
>>> https://lore.kernel.org/oe-kbuild-all/202309011935.bBpezbUQ-lkp@intel.com/
>>> ---
>>>   drivers/gpu/drm/ttm/Makefile       | 18 +++++++++++++-----
>>>   drivers/gpu/drm/ttm/tests/Makefile |  6 ------
>>>   2 files changed, 13 insertions(+), 11 deletions(-)
>>>   delete mode 100644 drivers/gpu/drm/ttm/tests/Makefile
>>>
>>> diff --git a/drivers/gpu/drm/ttm/Makefile 
>>> b/drivers/gpu/drm/ttm/Makefile
>>> index dad298127226..6322a33e65ed 100644
>>> --- a/drivers/gpu/drm/ttm/Makefile
>>> +++ b/drivers/gpu/drm/ttm/Makefile
>>> @@ -2,10 +2,18 @@
>>>   #
>>>   # Makefile for the drm device driver.  This driver provides 
>>> support for the
>>>   -ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
>>> -    ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o \
>>> -    ttm_device.o ttm_sys_manager.o
>>> +ttm := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
>>> +       ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o 
>>> ttm_pool.o \
>>> +       ttm_device.o ttm_sys_manager.o
>>> +obj-$(CONFIG_DRM_TTM) += $(ttm)
>>
>> Does that not lead to each object in $(ttm) becoming its own module?
>
> Huh, yes, that is what would happen here. Not good...
>
>>
>>>   ttm-$(CONFIG_AGP) += ttm_agp_backend.o
>>
>> Does this not create a ttm.o with just one object, depending on
>> CONFIG_AGP?
>
> I just left it as it was before my changes.
>
>>
>>>   -obj-$(CONFIG_DRM_TTM) += ttm.o
>>> -obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += tests/
>>> +ttm-tests := tests/ttm_kunit_helpers.o tests/ttm_device_test.o \
>>> +             tests/ttm_pool_test.o
>>
>> I'd preserve the one object per line syntax. It's nicer for the diffs in
>> subsequent updates.
>
> OK, will update it in the next version (if such comes). I just 
> followed the style of "ttm-y".
>
>>
>>> +
>>> +ifeq ($(CONFIG_DRM_TTM_KUNIT_TEST),m)
>>> +    ttm-test-objs := $(ttm) $(ttm-tests)
>>
>> Isn't the -objs syntax for host/userspace programs? And if not, doesn't
>> it lead to objects with exported symbols being present in two places?
>
> I saw it in use in other Makefiles, so I followed it. As for the 
> exported symbols, I tested both builtin and module configs, and it was 
> fine, but it's possible I missed something. I suspect that the 
> variables are first expanded, and then processed by the Makefile.
>
> Many thanks,
> Karolina
>
>>
>> Confused.
>>
>> BR,
>> Jani.
>>
>>> +    obj-m := ttm-test.o
>>> +else
>>> +    obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += $(ttm-tests)
>>> +endif
>>> diff --git a/drivers/gpu/drm/ttm/tests/Makefile 
>>> b/drivers/gpu/drm/ttm/tests/Makefile
>>> deleted file mode 100644
>>> index ec87c4fc1ad5..000000000000
>>> --- a/drivers/gpu/drm/ttm/tests/Makefile
>>> +++ /dev/null
>>> @@ -1,6 +0,0 @@
>>> -# SPDX-License-Identifier: GPL-2.0 AND MIT
>>> -
>>> -obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>>> -        ttm_device_test.o \
>>> -        ttm_pool_test.o \
>>> -        ttm_kunit_helpers.o
>>

