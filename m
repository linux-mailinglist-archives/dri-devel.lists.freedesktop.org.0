Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A15BC509489
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 03:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1229F10F35C;
	Thu, 21 Apr 2022 01:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6690010F35C;
 Thu, 21 Apr 2022 01:12:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGryj4ojxQdnaub6wxNVKzo/8T1X5A81FN0B6WkYyvde3U9akHkyGpnMsdGm511EMIzfE8nabcQ9ZNZubX0uVEJfbOfm0Pvh5mDInFHK5v9BS59aOyb7wIaK3ZIKc0T9sbJM3RUNsYwgakW3GcGTr5Gt7hnGt4KWja8NNGZrLGoIdifiMf+Ws0ztBlDT7uEh95pHUrCUnvNfXEzeSCoy6opXU56EClIx/dUOJ9yQAHLDW+xTEiAStTfldBla9n6cYSmL8kvrzbW+qi20QbPSvSkof/gPFQLtaL4LMqBYqlYdyhfhm4doMVmfKKu5hHZ7VFK1FOeDtMNkFJZPPwm7Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grs12KwqIPlMt3BpNAX5p0GnOMUWzXTcb9bbGY0q2hY=;
 b=lnnWKvAC2oI3H+QOKgtbilTO/mXsg4WCDMwOI1yz4+16JO9yyqwSJ2TjBOaXbcy4pc/kTpLRglNIacXTBcfLxypJLMIzFCCvsFopG3ZAp1O3w/6WkC5N5+6QuSJt/dn7amEpKsI6Ph6vVAULTg7YmYIN/pemFM8wlWjZQ50GidBAbALu1dEjvCXblu/6V6Mr7tM/CNIWj3ZM0DCzHlea1N46K5wlElaZWJ5v2yZIVdsY7sgqhYYF6gfWpBU1CBw4O2POyWPbxeRSw0T82G3spVC0P6BtYWUlpxu071v0mU2uii6hHZ7EtOpq/Ws/IPcP7x6qNlvMwcD0CLOOf3/OVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grs12KwqIPlMt3BpNAX5p0GnOMUWzXTcb9bbGY0q2hY=;
 b=32EM1V0M4IAB8iHDaIs4syBlR0hrhRaRKPDKia6pnWIlcHNztNvUG74ptj6B1nP/E0PwK/il0TvO3fdX49s4Q86a2cUtSd6gOJ/69faNLvvSzQ5FRyKiNjKfc4ZluNlnknPPoQl/nyBSRvlTDRIpXUFzRs2feK0qVMsSKTq4dO8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4526.namprd12.prod.outlook.com (2603:10b6:806:98::23)
 by CY4PR1201MB0072.namprd12.prod.outlook.com (2603:10b6:910:1b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 01:12:11 +0000
Received: from SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::8515:3855:bed9:3f05]) by SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::8515:3855:bed9:3f05%9]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 01:12:11 +0000
Message-ID: <237da02b-0ed8-6b1c-3eaf-5574aab4f13f@amd.com>
Date: Wed, 20 Apr 2022 20:12:07 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCHv4] drm/amdgpu: disable ASPM on Intel Alder Lake based
 systems
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20220412215000.897344-1-richard.gong@amd.com>
 <d4ba3998-34aa-86d2-bde9-bc6ae9d8d08d@molgen.mpg.de>
 <CADnq5_MgvcGPWf2gYn_3qCr+Gq1P39tvv-W-o8NhivvMpMwUBA@mail.gmail.com>
 <91e916e3-d793-b814-6cbf-abee0667f5f8@molgen.mpg.de>
 <94fd858d-1792-9c05-b5c6-1b028427687d@amd.com>
 <efc1dfd1-2b54-aee5-1497-4b800a468141@molgen.mpg.de>
From: "Gong, Richard" <richard.gong@amd.com>
In-Reply-To: <efc1dfd1-2b54-aee5-1497-4b800a468141@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0147.namprd03.prod.outlook.com
 (2603:10b6:208:32e::32) To SA0PR12MB4526.namprd12.prod.outlook.com
 (2603:10b6:806:98::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afb5facc-f521-4c6e-8bd3-08da2333f66f
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0072:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0072C10A2D9D62514E5AD83495F49@CY4PR1201MB0072.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wMqAdmFdy79IPluMZLMi/APq/symBDstTtJ8Gp1wfZfiRn9WZbQUL5oDHda9NdfjvKOG708TxtsJi8UWa6eHOew7z1w7wbSlFgrP+RhR9tT/2lcgAIXA0ob6nRIjrPHQmVduWECAa2rj+Qo24xvjIf9EEwtcnanSa+12PPipA9tkznaLfnxi44RkDjzVvxI8HE4mAOKPP1DE4/L0c2tSQro0jrWQpPRZoO2cZSetoTay04KiVZquzETzxzDoWxa5atq78/w/7C0HTxdjZF5VdAvIHVxnGBJu7TNzpGwj6FCrPN0b4eCaO0t531agjOD/PSqg/qX1z+FQ3XP5995uNAAQDW2UPhRI9Kq4NAhxc+HfCmJEustP7CbbzOVWBM0AbDaJ4eoqZT3sEA2CvMgQrDjanzI2BgP+pNUnhaQCcnssQnLwYjskPM46mVEc1aFMLmrlyJjXQ4RDSoxtmHas/qL9cxwSrSOiihXiZwH75fKjYhejyGJhoYRiXCR6h40c3L7ibsXqPzHUjJy05VQ89JGubDGi65NdK9r84HJ+y/81XLpjrftx3hlkMUuPJpLnf7AZ5FdAoLLfcShd3v+tHSRWOaOo3d+ZhVJOa6/K9gp7nJmbUPvqkKfgzxkqEBY0Pouls4vNjJYiRQLi1EmcdeMwPWiFKWGkKAlRE67qR/qYM4k7Nc1IRj1+7YqtTPMBVlexuM37PHvIYhPhyC1Jtxad8QSh2RQqLlF9TWCFZG7ee3E+ySQGgWtoKMBf3nFh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(508600001)(31686004)(8936002)(966005)(5660300002)(6486002)(8676002)(4326008)(54906003)(316002)(6916009)(6506007)(83380400001)(36756003)(66556008)(66476007)(186003)(66946007)(2616005)(53546011)(6666004)(31696002)(45080400002)(86362001)(26005)(38100700002)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEtEVThmWUkxSU5Jc1JuSWZFbCttR251QVE5c1BEMTNQazA4c1JJQjN4TXVN?=
 =?utf-8?B?RTZpUkNGTkFhdi9HckpMK0dadHZ0SnMwa1dOZVlOdWxxR1BtVEhLamZ6eVBW?=
 =?utf-8?B?SmF3cEMzOGlGYm5vd2hON0szeGhZN3BlZ3FXc3Yxck9rc01zS1VpWmZiRWNR?=
 =?utf-8?B?MjlpQ254R282Ykxqci8vbmIrNW93MGpidHhkS0tzWHpjV0NnaGtjSzAzajlu?=
 =?utf-8?B?Zkw0YWtSZW1JSUVhb0w0UTNtTTU2bmZwd1NTUUYwdEpVSGhsRUNXbzB6Z25t?=
 =?utf-8?B?dlBSYlFES0RjWE45MUtQRlZhWXAzQkwzMUNwa2pqZnlJMXlPTjh5ekovYWlz?=
 =?utf-8?B?Rm9id2FSS0t3V25PeS81QjZYUHpOQXJ1NEdkcVo4SlJKcW1pQ1BGd0U1Sllh?=
 =?utf-8?B?UHBoYVFuTW04VFJKblFuM1dhbE5jN0FBK0xZZCt2SERNamJUdnVVREwxT0ha?=
 =?utf-8?B?ZndlOUpqN0tKNWFrdzFYSXRTNGdLNVlFOEVHOGM5TFpEcDI4NXpXU3A4SHhW?=
 =?utf-8?B?VSt2elM2NkNIZEg3S2U1UmNQU2N6YVh6cEljSGtYQUNTQW5WYVI3VE42bU1D?=
 =?utf-8?B?WkJBaFdMbWVBOWxTTW9NQ1gzcEczK3gxalFFcUhpWUxva29Bd3hjL0VENjlX?=
 =?utf-8?B?YjNvbGZVdUgzdUVuVS9STGVSS2VYNERyRlhZZTdTN3N6T3BIUHdPTmFFRS9l?=
 =?utf-8?B?ZFdpT0t2eXc3ZUVZS2EweE1FdFdubGlKTUI5ZlQ0NTBIdXJFdEN2cHZIWUFz?=
 =?utf-8?B?Vk9SbmtJaXl2TWVHVUN1S0ZLWXQwMGJqRjdqaVU0ajZQMk1nOGNwRGJ5RHZz?=
 =?utf-8?B?SGRZOFo5N1ozaTUrNURIRGhrdkhsU29TT3NXY29zeU1oL2tJNXhiWXVOTU1X?=
 =?utf-8?B?d0FsQVZ6TndCYWlwRXI1L3lacENKYmNMdE9tcFo1amErVVVKTTZHMzh5dzZS?=
 =?utf-8?B?WktIb1o3RzB6RWdYdFpHdmNhTDlvdXJYUWtSN1ZLNmJDNUpJYnFvdU4rRmxZ?=
 =?utf-8?B?aGJ5REJmZEw5dnJhR3VsdkEzM3lLUmFqZHk5eVlmU2dWbUprSlEyTUM1REM1?=
 =?utf-8?B?UU9nUUJQbEt6K2tpd3NkZHFpVnBacU9iMkV5ZFB1TGRRV3hXSUF4U3ZYVThO?=
 =?utf-8?B?bm5uSXN4RytWZ3pJS3cyTndWYVhJSXJtZE9qMlpMREt6U0VGWS9jb3dueUxF?=
 =?utf-8?B?TnBPT05lWVdTb256MkUrNUhzQkhISnV5amxNRGpJdXUxTFRyaHdDSzBFZGJk?=
 =?utf-8?B?bUlLdldVdTR5SWZUbWJxUUtVU09VVys1em55VU1oTU80UUI1ZmZkT1hvYkg1?=
 =?utf-8?B?OEJYcnRrYS9TR1J6UTBuOVBYN3QrejIyU0k5UTJteVpOWEMyT24xWENvcG1M?=
 =?utf-8?B?VWFIdXRGb1hxMEp5VUdDSmZ3cGdHaDBMM05NOE1ZSU83ZHdJRnNLY2hYUDFI?=
 =?utf-8?B?RGxDN25OUHV6RDV6OTkyN0ZPaUIzRDVzR0JzMDV2WE50N0NJOVlzcEh6alR5?=
 =?utf-8?B?YVF2eXNyd2ttaytSSmw4andIR1BEOG9kaVM1a3FvM1AyTVg5VThuVDgwaTEx?=
 =?utf-8?B?dmRVNCtGM2JnR2VCT0hJR3A1aXFZaVN5dHlHVHNXUHlEaTl1eTUrNVdVdjAv?=
 =?utf-8?B?QThvdVlMaUpVdEh4WTUrQXA0TkplNk9DZWdKRWRuaFFQdVk4M0JLRDdvTkxR?=
 =?utf-8?B?S3dsRWtqNm5wOE5PUTh1SVMvMkxEZXVaSndhSFJadWFQVmJvbEJtSEEybzBW?=
 =?utf-8?B?TUU2VWE2RDg2eXNma1RZTk84M1Q5Vnh3aGtocVF2cTBoTlFGSFVyS2xYVnNp?=
 =?utf-8?B?N09ZeHU4NlBCT0tXQVlBRjZzSWpKY3Zaajc2dFlYTm00d2hrQzgyZHBiWFZQ?=
 =?utf-8?B?U2RtOFlqOHBkZjFGSXJZU3R0SzZydytsVG5WVGhlSG96ZFhkeTZYelh3bVNG?=
 =?utf-8?B?aFozZll1R2xPWXlSTE9mSUEyak05RTUzTjhCeVAzakM1M2djT0R5OWRIMmZ1?=
 =?utf-8?B?Q1pIM1VJaGEwdHpxUUZhWFJwNDVsSEVwOHNSUlFvS1pvT3JPRFU0SmxkRVVj?=
 =?utf-8?B?ZUFkb3I4c2U2ZDYyRnRFVnJCc1orRmt0M2llQkhFTWFpcnJvM2MyVU9HMDhu?=
 =?utf-8?B?YWswYTZHZlp0dExURXYvaUFacTkzaGw3VmFoRS9VZ3BHdThCNDVSZWd5NFBR?=
 =?utf-8?B?Z3RIMFpvTE9FM1k0WURCdWFBc2RHTG9jdEZST2l3OVRTYkxwRzhMSi9zQXd6?=
 =?utf-8?B?eVdWSFgxelJ4MzJDcHBOWUpUWGpzTTUybHplb3ZtZEl3c3lMZit3ZHRvdkJ2?=
 =?utf-8?B?OWxWSlBMaEF6b1dXb0lCbG04Qkx3ak1kZE9na0QyZGFFeStuV2RqUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb5facc-f521-4c6e-8bd3-08da2333f66f
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 01:12:11.3029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iTcup8uTsGF+M/LZRdNOcOlFG3Arb8lWzxsY7IX9sQXxwg43xZOnfNdWn6J4xacZY7cmczJPlh8gkAmmRNin/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0072
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
Cc: Dave Airlie <airlied@linux.ie>, Xinhui Pan <xinhui.pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Alexander Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

On 4/20/2022 3:29 PM, Paul Menzel wrote:
> Dear Richard,
>
>
> Am 19.04.22 um 23:46 schrieb Gong, Richard:
>
>> On 4/14/2022 2:52 AM, Paul Menzel wrote:
>>> [Cc: -kernel test robot <lkp@intel.com>]
>
> […]
>
>>> Am 13.04.22 um 15:00 schrieb Alex Deucher:
>>>> On Wed, Apr 13, 2022 at 3:43 AM Paul Menzel wrote:
>>>
>>>>> Thank you for sending out v4.
>>>>>
>>>>> Am 12.04.22 um 23:50 schrieb Richard Gong:
>>>>>> Active State Power Management (ASPM) feature is enabled since 
>>>>>> kernel 5.14.
>>>>>> There are some AMD GFX cards (such as WX3200 and RX640) that 
>>>>>> won't work
>>>>>> with ASPM-enabled Intel Alder Lake based systems. Using these GFX 
>>>>>> cards as
>>>>>> video/display output, Intel Alder Lake based systems will hang 
>>>>>> during
>>>>>> suspend/resume.
>
> [Your email program wraps lines in cited text for some reason, making 
> the citation harder to read.]
>
Not sure why, I am using Mozila Thunderbird for email. I am not using MS 
Outlook for upstream email.
>>>>>
>>>>> I am still not clear, what “hang during suspend/resume” means. I 
>>>>> guess
>>>>> suspending works fine? During resume (S3 or S0ix?), where does it 
>>>>> hang?
>>>>> The system is functional, but there are only display problems?
>> System freeze after suspend/resume.
>
> But you see certain messages still? At what point does it freeze 
> exactly? In the bug report you posted Linux messages.

No, the system freeze then users have to recycle power to recover.

>
>>>>>> The issue was initially reported on one system (Dell Precision 
>>>>>> 3660 with
>>>>>> BIOS version 0.14.81), but was later confirmed to affect at least 
>>>>>> 4 Alder
>>>>>> Lake based systems.
>>>>>>
>>>>>> Add extra check to disable ASPM on Intel Alder Lake based systems.
>>>>>>
>>>>>> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
>>>>>> Link: 
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1885&amp;data=05%7C01%7Crichard.gong%40amd.com%7Cce01de048c61456174ff08da230c750d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637860833680922036%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=vqhh3dTc%2FgBt7GrP9hKppWlrFy2F7DaivkNEuGekl0g%3D&amp;reserved=0
>
> Thank you Microsoft Outlook for keeping us safe. :(
I am not using MS Outlook for the email exchanges.
>
>>>>>>
>>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>>
>>>>> This tag is a little confusing. Maybe clarify that it was for an 
>>>>> issue
>>>>> in a previous patch iteration?
>>
>> I did describe in change-list version 3 below, which corrected the 
>> build error with W=1 option.
>>
>> It is not good idea to add the description for that to the commit 
>> message, this is why I add descriptions on change-list version 3.
>
> Do as you wish, but the current style is confusing, and readers of the 
> commit are going to think, the kernel test robot reported the problem 
> with AMD VI ASICs and Intel Alder Lake systems.
>
>>>>>
>>>>>> Signed-off-by: Richard Gong <richard.gong@amd.com>
>>>>>> ---
>>>>>> v4: s/CONFIG_X86_64/CONFIG_X86
>>>>>>       enhanced check logic
>>>>>> v3: s/intel_core_asom_chk/aspm_support_quirk_check
>>>>>>       correct build error with W=1 option
>>>>>> v2: correct commit description
>>>>>>       move the check from chip family to problematic platform
>>>>>> ---
>>>>>>    drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
>>>>>>    1 file changed, 16 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c 
>>>>>> b/drivers/gpu/drm/amd/amdgpu/vi.c
>>>>>> index 039b90cdc3bc..b33e0a9bee65 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
>>>>>> @@ -81,6 +81,10 @@
>>>>>>    #include "mxgpu_vi.h"
>>>>>>    #include "amdgpu_dm.h"
>>>>>>
>>>>>> +#if IS_ENABLED(CONFIG_X86)
>>>>>> +#include <asm/intel-family.h>
>>>>>> +#endif
>>>>>> +
>>>>>>    #define ixPCIE_LC_L1_PM_SUBSTATE    0x100100C6
>>>>>>    #define 
>>>>>> PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK 0x00000001L
>>>>>>    #define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK 
>>>>>> 0x00000002L
>>>>>> @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct 
>>>>>> amdgpu_device *adev)
>>>>>>                WREG32_PCIE(ixPCIE_LC_CNTL, data);
>>>>>>    }
>>>>>>
>>>>>> +static bool aspm_support_quirk_check(void)
>>>>>> +{
>>>>>> +     if (IS_ENABLED(CONFIG_X86)) {
>>>>>> +             struct cpuinfo_x86 *c = &cpu_data(0);
>>>>>> +
>>>>>> +             return !(c->x86 == 6 && c->x86_model == 
>>>>>> INTEL_FAM6_ALDERLAKE);
>>>>>> +     }
>>>>>> +
>>>>>> +     return true;
>>>>>> +}
>>>>>> +
>>>>>>    static void vi_program_aspm(struct amdgpu_device *adev)
>>>>>>    {
>>>>>>        u32 data, data1, orig;
>>>>>>        bool bL1SS = false;
>>>>>>        bool bClkReqSupport = true;
>>>>>>
>>>>>> -     if (!amdgpu_device_should_use_aspm(adev))
>>>>>> +     if (!amdgpu_device_should_use_aspm(adev) || 
>>>>>> !aspm_support_quirk_check())
>>>>>>                return;
>>>>>
>>>>> Can users still forcefully enable ASPM with the parameter 
>>>>> `amdgpu.aspm`?
>>>>>
>> As Mario mentioned in a separate reply, we can't forcefully enable 
>> ASPM with the parameter 'amdgpu.aspm'.
>
> That would be a regression on systems where ASPM used to work. Hmm. I 
> guess, you could say, there are no such systems.
>
>>>>>>
>>>>>>        if (adev->flags & AMD_IS_APU ||
>>>>>
>>>>> If I remember correctly, there were also newer cards, where ASPM 
>>>>> worked
>>>>> with Intel Alder Lake, right? Can only the problematic generations 
>>>>> for
>>>>> WX3200 and RX640 be excluded from ASPM?
>>>>
>>>> This patch only disables it for the generatioaon that was problematic.
>>>
>>> Could that please be made clear in the commit message summary, and 
>>> message?
>>
>> Are you ok with the commit messages below?
>
> Please change the commit message summary. Maybe:
>
> drm/amdgpu: VI: Disable ASPM on Intel Alder Lake based systems
>
>> Active State Power Management (ASPM) feature is enabled since kernel 
>> 5.14.
>>
>> There are some AMD GFX cards (such as WX3200 and RX640) that won't work
>> with ASPM-enabled Intel Alder Lake based systems. Using these GFX 
>> cards as
>> video/display output, Intel Alder Lake based systems will freeze after
>> suspend/resume.
>
> Something like:
>
> On Intel Alder Lake based systems using ASPM with AMD GFX Volcanic 
> Islands (VI) cards, like WX3200 and RX640, graphics don’t initialize 
> when resuming from S0ix(?).
>
>
>> The issue was initially reported on one system (Dell Precision 3660 with
>> BIOS version 0.14.81), but was later confirmed to affect at least 4 
>> Alder
>> Lake based systems.
>
> Which ones?
those are pre-production Alder Lake based OEM systems
>
>> Add extra check to disable ASPM on Intel Alder Lake based systems with
>> problematic generation GFX cards.
>
> … with the problematic Volcanic Islands GFX cards.
>
>>>
>>> Loosely related, is there a public (or internal issue) to analyze 
>>> how to get ASPM working for VI generation devices with Intel Alder 
>>> Lake?
>>
>> As Alex mentioned, we need support from Intel. We don't have any 
>> update on that.
>
> It’d be great to get that fixed properly.
>
> Last thing, please don’t hate me, does Linux log, that ASPM is disabled?
>
>
> Kind regards,
>
> Paul
