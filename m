Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 428D679A856
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 15:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E360A10E2FD;
	Mon, 11 Sep 2023 13:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2E010E2FD
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 13:43:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZBckzBPkD0pxyXjQJ/Ym/f3OfuQL4d7cB17Sb+YZhZZD2E0F+jjgVV0v7MIf3uCVSlULrJ4f0zKTPYmO4MOWbPDh5hN6YNVWRhIwl53wh+qb1+xI/DYKkFCNTIspThHvgkUHKqjnJTw+mwZz2k5hUdYOG+HNpas22R+54TOOK+tJwMrmq1l30IBc/5a7OsXwJrrqLa+RfJQAdAkBSboWnIEAVyudPPWHq81NwjTZc9xIdOEVmAgORrszSgG8DtzNcC+fsMjGpkNj7HkgyYrTrQ0vJgIG76AZ053BfOjUNZmbRtwoqnK20AyrBURe3rEP6WL8dm4HOPOMcfWzhzI4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7IRQLh8YS4jkNrU9444WNy7ehmpkl03rpRQYyqVFfQ0=;
 b=cbWusL6f1GdawbqymXlpEm2rJu306siGy9hLVNckGB4Y8/Ei54Py6ADcabIVW3F5XXzm4e3eIeA+L24plu6yL4bOJbXDaX2EBnIDjOJVC3fmdDJYSve+CMNzK31mweLh+vgVez3TSnQYRh8uxvtoOdK6fL4XSpMHFXKxB1Vls7gMzKc2Jd86HHdCqgvBGNssKhLhl3St9G35jajfb7fK72ukRA08N65LoKoWkrFTWxYh+GjpRWusyvowFlj6/kuXcPgjF4/pDz99azKsIwPsbAyZnCExxLvnZMIIPOfDklX57gMWtH/bZJadQVXt0x3eKUQKzd4mNQ+S9ryCd5eDFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7IRQLh8YS4jkNrU9444WNy7ehmpkl03rpRQYyqVFfQ0=;
 b=s9ramdUrfQldzOF6YLohv37TVSVsCUTvxcjdBAbIqLct/LODu32KerRI4V/7nwy0fAgfCKwqgLzOEYJLYJ9vOdJraQyirJ0WujQ10decBlJQjMGAt858OEuJAp6lixl50qKY0Wy8GBzkSvsjiVv9n9lyD26i99Wzrp1Ku2PJiQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH3PR12MB7665.namprd12.prod.outlook.com (2603:10b6:610:14a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Mon, 11 Sep
 2023 13:43:04 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 13:43:04 +0000
Message-ID: <69110ad5-0c6e-ab90-90f6-78a133af183e@amd.com>
Date: Mon, 11 Sep 2023 15:42:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 1/5] drm/ttm: Update Makefile for KUnit
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org
References: <cover.1694422112.git.karolina.stolarek@intel.com>
 <3782fd55e8479296daab7041430fe7b0848bf621.1694422112.git.karolina.stolarek@intel.com>
 <87fs3lf0ht.fsf@intel.com> <60ffa6fe-4750-c864-9012-7a047a0f1c3b@intel.com>
 <4080bd92-d10e-4cb3-fce4-a76892834baf@amd.com>
 <99ef9f6f-a84b-fa4c-8a33-a214b4b9695c@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <99ef9f6f-a84b-fa4c-8a33-a214b4b9695c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0232.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH3PR12MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: 7007de35-74c7-4876-13d5-08dbb2cd05c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ksRqIY9EtUXOkBw2P3+ZP7DIgUO8s8IfoS0wuE8toqlfYP56mX+T7iMoZgQJ52M4nrTGbuSc6t/G+TUPBS64vZh+v784KFKvCgQ4h1Z21ttk4rgz3KiDCrBauP4ZamrCqMe632JsAls35CGVxTERsTBd8vvsrkWHwFuC0ecZMtn1R7Zx/tcmXNR+nVOxdkmuRFae9gs7flUVY7xo4/ZVekea9fK4cFySSJ0u3lIudH8HETmUUVHPnH0lmaWMeE+WOF/PU18F6LmTTMmpNiKkxgov9hm99HF3s81p6CGycgb+5HxOQNlYxqXGGfp8rx6i47JFjCxBNO43TtQwiF7UDghKspBBsT5rr8nwpIEa6MjNIDnrkqEj+w+8taiBWHY/qbr/k9cYOutpptzCJ2rc6bxcnU53jH8T3pwa/l11ziGfwWBkPK2DzaFb+SUxP3DM0TxqiIRzinAd54q65qKjnkJ0LLrV3iqFHm8U2o5yrMS6o5G6QFFt0r90KX76UgSll6VyE0uJv2qqSFGAvDbduc0rkGsDna1bCOQMfVP+xrSyl9iMT6yR1fmSRxEQGqAJ9As9pN0T67LNNARrpW0JWpUUmGVh1Xoo103LfEc8cKb/286ruCAzdXzkmTFy/Gg7hOaZMUk6nexV3CzkGuEiFWv//PZFimpt+q3t6dm//ozqfnYsEGBJvFwuYM1PpLaW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(396003)(346002)(136003)(186009)(1800799009)(451199024)(6666004)(6506007)(6486002)(53546011)(966005)(6512007)(478600001)(83380400001)(2616005)(66574015)(2906002)(26005)(15650500001)(54906003)(66476007)(66556008)(66946007)(316002)(110136005)(5660300002)(4326008)(8936002)(8676002)(36756003)(86362001)(31696002)(38100700002)(31686004)(41300700001)(66899024)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2s5UlVKc0t2UENUMldoK3p5NlUrb2x2ZVlmNkVmYXFrVDNHOU8rWHNSdnRL?=
 =?utf-8?B?OWJtMUtwekE1VHBKRWFUTmdDcnBJdUVwOUFObDE4RUdrTGJ4cHJpdDJKMW5y?=
 =?utf-8?B?SG1PaTNNRldQbkduakszaU5nQWREYTE5MUNib3NWVGF5ZEFTL2pVWFZJWGNp?=
 =?utf-8?B?SUVlMHhpTWQ1TkRJcVN5R1ZYR05MTVZMSGozaUVDZ2FEVStZQWg2WXZlSWMr?=
 =?utf-8?B?dzZ3Nkl5amhaUy8rTEdkbjRXOHZKdmdBRzdWVWt6Rk1JelR1NWdxVjdEc014?=
 =?utf-8?B?cCs5UlRKYWtMSmJ1UjJLNURtajM3NWFqYW8wVXVmb3QySVFLOFZqTXBDNVVU?=
 =?utf-8?B?a2tENUhlN3E4VGE2aVJIdFNSN1lLVU84dlFCQjBqWXNSVjhaelFNOHBDcmJ4?=
 =?utf-8?B?endlMjBOSnovQ3EvRWMwMkJYZXNTR0lOMk4vMXVhUWtZK3R4b2gzZVJHeGU3?=
 =?utf-8?B?R0s0M0JrRFY1MnhKM0xWTDZSc0Ryb21BbWc1cEJhcEh6WDVzbDZKaTJnOXlk?=
 =?utf-8?B?T1hibllINzRaL25ZR0Y4UXBYVC80MVRSOEU4WjJOWSs4WkZmRlFRVjNRbWFx?=
 =?utf-8?B?QTRic3RmbE9JbXY2aHR3czdUZk51RWVyYldtTTFCeFZJRzh1akptL2h4UDJT?=
 =?utf-8?B?ZTJIT3JWNWVuSTZwRXI2aUVPckszdmZKOG10dkJ4d2J1ekIyVFBTTEwvYnBW?=
 =?utf-8?B?b0d0SUs4ZHVYUWhNL1YwS1JmTHR2RytjTE9VN2lZV2MxL2loRE1sb1dBeUJj?=
 =?utf-8?B?TnBXL1p5L3JJa3V4a3lCRVErSGFreEVFck5FY2RRN3lTeUJ6UFM4MDl5ZWRn?=
 =?utf-8?B?dEhVdjArbXJyRTJRQ3QvVVl3dDczVUlsR2xQeFZiQzBNeUg2bm56RWc4Nnkz?=
 =?utf-8?B?Mnowb1doK2Y2YklBcC90dzIrbUR6c0Y0Mmh6MVplNnVYOHpaZ2VYc0p4SHdG?=
 =?utf-8?B?VlB6R2wvd1hNVjNGY2VYOUtMZEh4QVhHSTNDNERFMDlCenRlaXdjeEJ3ODBX?=
 =?utf-8?B?OVd4dEk1ZzQveExPWDM0d3RndnBEYktNUnhpWTE2Z091c25ucUIvOEkrTkpk?=
 =?utf-8?B?UmZ1SjI3a2tXcy82ZXJhZnRYTkROMEFvczU2bWdZUDRoc2JWcG9Vck9QTGIr?=
 =?utf-8?B?YzFPWmhtMGFWOVNpSVJ0UnNNbVk4WGNqNEl2b2pmWlV2NURqSXczVzB4WnNo?=
 =?utf-8?B?ZWxDSXBRcko0TkEwc21DeVVHNkJZZldOa0VENEZ3ZjdPWFAwNHNXMTU0MXFr?=
 =?utf-8?B?dnB3UWZmV0IwdUY4Vm1VN2NueGt5L3VGS1VSVy9ydFY5TWVmelRXZEEyNzZ1?=
 =?utf-8?B?WkpVOXAvM2pCMFlEMUFqNlhxaVd4MU0zTUZzOWFwb2x4dDU2akJXcG9JMTln?=
 =?utf-8?B?cXdDU2x1ZlY4MjI2Q0RRNnVJUWVVR2Y4ZDJWaDcyOHN1RDJqakZQWDB0d1VB?=
 =?utf-8?B?U0VueVBERmQ3NW1sQllOOFhpMjRLRVJORlp2NnJlVUVNRkpoTnYxUU4vV0Y2?=
 =?utf-8?B?b2tiSTBYV3g3ekdDWk9oTHU5cjFSSGozVmQ0UXhneHpzQlJzZGlDZWt3UnNN?=
 =?utf-8?B?YmVaa1p3SFZVOGJWU2F0R2ROcWlkN1FtV25xd0NYWEVBTUE1aVFWTVE4ZEts?=
 =?utf-8?B?REFqaXBid0d1L05jeURJVHpCb3RQUlJJY2toV0NHY3lsdnZzY0I5OU5oOXpO?=
 =?utf-8?B?SldpMCtCeEt5RFUwcGQ3U2Z6ZVpvcC9aN3R1WEM3alcrYjl4VjhKNXhMMmNy?=
 =?utf-8?B?WUY3UFcyNmhpbWUzNytCY20vQmk1UlprTW1RTU8vYUNmb256T0QydzU1b1Z2?=
 =?utf-8?B?aHBrSEZWdS9YZlVEcXJxNzBzOGxhSW55dFFqbmVpV3lMeE9EclZVZ2ZmUjFV?=
 =?utf-8?B?RDBvazJNQlpTN0lpSU5tQ0J5RFd0U0xrRmd1aVRyOUkwQWVwbHpCVVhrdTEw?=
 =?utf-8?B?eEdmZFJhNzA0ZFhBL2tpOFdMV2VXU3RReWp4SmlJU0dyRmZTNUZ0V21uRmt6?=
 =?utf-8?B?UFdkc29EYVRNYXlEK0xFdjJHenV0OEdLdTJFa3Q5SEt5ekhwQjV2cTI4UFJL?=
 =?utf-8?B?RTl4SXE3L3lNNDNJTzBoK3VjMjBJaitPY0IvWkRWVHFscDFhRk9makJRb3lK?=
 =?utf-8?Q?Aco1wwOtVnukEhYh2CCPM3U4N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7007de35-74c7-4876-13d5-08dbb2cd05c4
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 13:43:03.9932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5h4FVsURcZmzU9z1/WTKP3ixdXY8Xjb2Ir2DwZoMEpsYlcnGDlmge2jkxZ5BNOHm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7665
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



Am 11.09.23 um 15:33 schrieb Karolina Stolarek:
> On 11.09.2023 15:12, Christian König wrote:
>> Am 11.09.23 um 13:47 schrieb Karolina Stolarek:
>>> On 11.09.2023 12:49, Jani Nikula wrote:
>>>> On Mon, 11 Sep 2023, Karolina Stolarek 
>>>> <karolina.stolarek@intel.com> wrote:
>>>>> Update Makefile so it can produce a module that consists of TTM 
>>>>> tests.
>>>>> This will allow us to test non-exported functions when KUnit tests
>>>>> are built as a module. Remove the tests' Makefile.
>>>>
>>>> I'm asking questions instead of making assertions, because I'm not 
>>>> 100%
>>>> confident, but I don't feel like this Makefile could work right.
>>>
>>> Questions, assertions and comments are fine, I'm glad you're taking 
>>> a look at the patch :) I'm not 100% confident either, so I welcome 
>>> suggestions on how to improve it.
>>>
>>> The problem is that TTM tests try to test symbols that are not 
>>> exported, so I have to compile all the files together into one 
>>> module if I choose to build KUnit tests as a module. The other 
>>> option that I'm considering is to make the tests are builtin only. 
>>> I'm tempted to go with it (for the sake of simplicity), but I'm 
>>> trying to get the module option to work first.
>>
>> I have to admit that this looks pretty awkward, but I'm not an expert 
>> on the Linux build system in the first place.
>
> Neither am I, and it shows :)
>
>> Would it be an option to build the unit tests into the standard 
>> ttm.ko module and let them run whenever that module loads?
>
> You mean appending the list of tests to ttm-y, depending on 
> $(CONFIG_DRM_TTM_KUNIT_TEST)?

Yes.

> I _think_ I tried something similar, and couldn't get it to work, got 
> a bunch of "twice exported" warnings.

You might need to adjust module_init, and things like MODULE_VERSION 
etc..., but I would give it a try.

Thanks for looking into this,
Christian.

>
>> On the other hand if this solution here works, why not?
>
> Because it's complicated and, well, awkward. I'm still thinking about 
> a use case where we would prefer to have KUnit tests defined as a 
> module. IIRC, in CI we enable KUnit tests as bultins and run them 
> during the boot. kunit.py helper also defines the tests as builtins.
>
> All the best,
> Karolina
>
>>
>> Regards,
>> Christian.
>>
>>>
>>>>
>>>>>
>>>>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>> Closes: 
>>>>> https://lore.kernel.org/oe-kbuild-all/202309010358.50gYLkmw-lkp@intel.com/
>>>>> Closes: 
>>>>> https://lore.kernel.org/oe-kbuild-all/202309011134.bwvpuyOj-lkp@intel.com/
>>>>> Closes: 
>>>>> https://lore.kernel.org/oe-kbuild-all/202309011935.bBpezbUQ-lkp@intel.com/
>>>>> ---
>>>>>   drivers/gpu/drm/ttm/Makefile       | 18 +++++++++++++-----
>>>>>   drivers/gpu/drm/ttm/tests/Makefile |  6 ------
>>>>>   2 files changed, 13 insertions(+), 11 deletions(-)
>>>>>   delete mode 100644 drivers/gpu/drm/ttm/tests/Makefile
>>>>>
>>>>> diff --git a/drivers/gpu/drm/ttm/Makefile 
>>>>> b/drivers/gpu/drm/ttm/Makefile
>>>>> index dad298127226..6322a33e65ed 100644
>>>>> --- a/drivers/gpu/drm/ttm/Makefile
>>>>> +++ b/drivers/gpu/drm/ttm/Makefile
>>>>> @@ -2,10 +2,18 @@
>>>>>   #
>>>>>   # Makefile for the drm device driver.  This driver provides 
>>>>> support for the
>>>>>   -ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o 
>>>>> ttm_module.o \
>>>>> -    ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o 
>>>>> ttm_pool.o \
>>>>> -    ttm_device.o ttm_sys_manager.o
>>>>> +ttm := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
>>>>> +       ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o 
>>>>> ttm_pool.o \
>>>>> +       ttm_device.o ttm_sys_manager.o
>>>>> +obj-$(CONFIG_DRM_TTM) += $(ttm)
>>>>
>>>> Does that not lead to each object in $(ttm) becoming its own module?
>>>
>>> Huh, yes, that is what would happen here. Not good...
>>>
>>>>
>>>>>   ttm-$(CONFIG_AGP) += ttm_agp_backend.o
>>>>
>>>> Does this not create a ttm.o with just one object, depending on
>>>> CONFIG_AGP?
>>>
>>> I just left it as it was before my changes.
>>>
>>>>
>>>>>   -obj-$(CONFIG_DRM_TTM) += ttm.o
>>>>> -obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += tests/
>>>>> +ttm-tests := tests/ttm_kunit_helpers.o tests/ttm_device_test.o \
>>>>> +             tests/ttm_pool_test.o
>>>>
>>>> I'd preserve the one object per line syntax. It's nicer for the 
>>>> diffs in
>>>> subsequent updates.
>>>
>>> OK, will update it in the next version (if such comes). I just 
>>> followed the style of "ttm-y".
>>>
>>>>
>>>>> +
>>>>> +ifeq ($(CONFIG_DRM_TTM_KUNIT_TEST),m)
>>>>> +    ttm-test-objs := $(ttm) $(ttm-tests)
>>>>
>>>> Isn't the -objs syntax for host/userspace programs? And if not, 
>>>> doesn't
>>>> it lead to objects with exported symbols being present in two places?
>>>
>>> I saw it in use in other Makefiles, so I followed it. As for the 
>>> exported symbols, I tested both builtin and module configs, and it 
>>> was fine, but it's possible I missed something. I suspect that the 
>>> variables are first expanded, and then processed by the Makefile.
>>>
>>> Many thanks,
>>> Karolina
>>>
>>>>
>>>> Confused.
>>>>
>>>> BR,
>>>> Jani.
>>>>
>>>>> +    obj-m := ttm-test.o
>>>>> +else
>>>>> +    obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += $(ttm-tests)
>>>>> +endif
>>>>> diff --git a/drivers/gpu/drm/ttm/tests/Makefile 
>>>>> b/drivers/gpu/drm/ttm/tests/Makefile
>>>>> deleted file mode 100644
>>>>> index ec87c4fc1ad5..000000000000
>>>>> --- a/drivers/gpu/drm/ttm/tests/Makefile
>>>>> +++ /dev/null
>>>>> @@ -1,6 +0,0 @@
>>>>> -# SPDX-License-Identifier: GPL-2.0 AND MIT
>>>>> -
>>>>> -obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>>>>> -        ttm_device_test.o \
>>>>> -        ttm_pool_test.o \
>>>>> -        ttm_kunit_helpers.o
>>>>
>>

