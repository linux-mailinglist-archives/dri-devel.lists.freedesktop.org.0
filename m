Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E58850FF9C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 15:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1EC910E157;
	Tue, 26 Apr 2022 13:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D4110E157;
 Tue, 26 Apr 2022 13:53:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=REXcdnB9TyyloKR4E3Xd9rjoUvKLaYtzc/QQIHwEKdyT7EObGZYpyPP+LCVyhyV2MPUncjoUtOKvRJdWAKUyLneL4dMBIYpvky1DFvAYzrOLp9zfEooKz3Wfp+Vuj5CnBCf9Y24/5lGCJjdrHzRbzv5NZHChMwZMDRKidIX3mlANw9a+fOGBhjPX0PW1c8+99vCINfr9Ea6OPf8TQtM4NfFtC9Pet3Vph0EhcsLvnPtIT6YRW6p502tbbgXG/KajQyJCo+CpAdH7SeDzPtZxhVBAC9mKBMyK+Xd5iIvC3y/BHlByAKaV5SEBg3M3gUN/DSdW0G0Xi6gBfIWwA8vfhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BF2KzYgCablwP47d4neBSayo/Rm5+cKCPZnrmtajTOM=;
 b=i2CYgzAqWFKbWTnui0xiXBq52ggsPw8FIjC/cxeFt8gnN6N3cTpdL0hePQizzVf711k02P0oval8R6kAvfL71ZS3cnL6psZDetFz3v7YHb9wP6zfTgqLKtpxT+1q+n5xEcRD4doZh7GlQ6f0h3ZCn2Y4Jh9PMUmHIue3hFjxYp8NImcW64ofvlmsTSib4g8TjAe22YZltMaHooDAvzsFEESRkYBfC3fqKpioKRuC77jX7DJTpsx2btPvRvd0O5tUZ1ctdxLLGYrpGBWquDBlvhu+enwdOB1i+OC5SlP+Vp0UvtEtm31Qw3jI1Uzdwr2BsRnzgswPgNX1YPiotcetrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BF2KzYgCablwP47d4neBSayo/Rm5+cKCPZnrmtajTOM=;
 b=WQra2n6fxBZ4crUsN5QK/HX1IxYYUbSdaCdF6zHZgk+NnE/z1pJZoXAKDCBzk9EWLSr8Fi3IhHdc+Ju1Yv9Lxbnc5hPA3PO1f449hia81pub1dgfOBIezPh0wPVqIQxmVkZtxZJXlnvecAeIAWrnBU94izrehFI72heh6rHKOsw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4526.namprd12.prod.outlook.com (2603:10b6:806:98::23)
 by BN6PR1201MB0097.namprd12.prod.outlook.com (2603:10b6:405:54::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 13:53:20 +0000
Received: from SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::8515:3855:bed9:3f05]) by SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::8515:3855:bed9:3f05%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 13:53:20 +0000
Message-ID: <5adfe067-dc00-6567-e218-c5c68670cf5b@amd.com>
Date: Tue, 26 Apr 2022 08:53:15 -0500
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
 <237da02b-0ed8-6b1c-3eaf-5574aab4f13f@amd.com>
 <294555b4-2d1b-270f-6682-3a17e9df133c@molgen.mpg.de>
From: "Gong, Richard" <richard.gong@amd.com>
In-Reply-To: <294555b4-2d1b-270f-6682-3a17e9df133c@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0036.namprd03.prod.outlook.com
 (2603:10b6:610:b3::11) To SA0PR12MB4526.namprd12.prod.outlook.com
 (2603:10b6:806:98::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0218428e-f7d4-4729-bd8f-08da278c1f7e
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0097:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB009726DD2792E534F3BE9DE395FB9@BN6PR1201MB0097.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cT8DbLaatH8nnQOv/aZJYWeogeFdBB6hWAwE9FKPiUaSfCUlfNa5XVy+AwuJIMbNCNuhU+Tlk1WTqPBJr5QsDWdoi1zK2+CmJPDvLtHWY2VdHwWE9HX2Bo/xPwRQjekQZEsiEy5Q2nKFxMqdC3UzZXHkyUCmOF01XULukYfQL4uD36hssXjlQBfLLW7zlnnlxur2Nlq6wJgFFWHNgMMH7UE7wz0wS2lDYZ4qGI8PrMPTSvA0DeC8heQBqsg74a2ZCwh2O4ZD/xwZp36tcEGWXL/kM1Jx7G6jGBZxwvSkutdQc5i/T07mWFSI7P87scxiJprcduSdFWNcbJz70ZITg/4Pxi1v5lgodQ1LLHfii2jn5MXbnUrfHkO+mvMtaBSHLySLNeSr0fnPa0+WFwnw83j/lLp5sQwgkf4+j3W3vy/dcxKVG70iFk6FBJohGjxOthtUvDVNLqlS7DVLZw2gL3N/m0b9IUgYiIXJal+8VoX9bzXeFvXH9QJaOBHSE9rfcr4k8i1fqsRbLzUl9Uqh8dnc4dxYuf/2ftD+YvM9cRHzc/IxuuN6j1afTaeEdfMVTKW8/T5g29Sheqf5IIB9XaZIP73FbJOiLGvUg9lwelVwVlfPqRfaDFxZPymsiRCbC/JS4yJaICyLsW77V8Ic0KgsAb8VoOdzN4lspPc7EdXheQfO1u6cPe28LX6wlUHB/6XrRf1oTj1XkNlc65guyX5lWQUkECb1RQllT3Qj2HCIFicpdU6GfA/Wg5yofbwvjPFWFmR2NpnAlBb4MkWpLMtDeH1H1BjA9iOcBUl+WhehA840wC6ddbI26g9qpDVl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(6486002)(2616005)(5660300002)(6506007)(53546011)(8936002)(31686004)(83380400001)(186003)(45080400002)(966005)(31696002)(26005)(86362001)(38100700002)(6512007)(6666004)(8676002)(66556008)(4326008)(2906002)(508600001)(66946007)(66476007)(6916009)(316002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDV2UUdsSmdPdmkzdmphR1pETnZrMkFDQzN3bnc3VTRQcEJVUG9iRnVuS2Y1?=
 =?utf-8?B?TXJUVkpSS09pQ015enZzalpPNllpZy93SnNTcjhQN2pDZUJWOE0rSHhxYmVn?=
 =?utf-8?B?UGVrODlqbmJhMTR4cTJ5RXdMejlUdlMza2VkOVp1UmpHMGRnbmd5V1FhSlJI?=
 =?utf-8?B?d0x0SjVOSHZiaVRwbmdoTkFheVZGUFFMeEplazhwd3hsRWZCR3VhQldqbksv?=
 =?utf-8?B?bFpmM1h2Slg3VWVNY3Vjd1FxZmJnc01KNittQ2M1SGNzOGx1NFZTZ3ZnMzVM?=
 =?utf-8?B?dThtUUNLMTlyNWg4Mm9SNzdybnVUYngvRTlYSzZad1BiS2ZEL1JGMVRSWlBI?=
 =?utf-8?B?S3psZ0hVbjRKWW9ndml1eGRRVWtkZHVnK2oxUDZvSC9iQXZQOEUwcWxCOEhr?=
 =?utf-8?B?OVA2UDVTK2xBejhNRDUwcUVFaEswLzZYV1RmcXArc1pOWm4yL2U0RTBSRzRh?=
 =?utf-8?B?ZDZUVEowdkNudTMzdjROM1l0RU5sSWpFQ2xjTXJHZlM5TDlBQndJZWlhdGpV?=
 =?utf-8?B?UysveW94WmRKb0hVNGl0NmVyVEh6MnNGTDUzYWJxcXFRL00ya3RJNDl4Z2lo?=
 =?utf-8?B?S05Mc0NiVkhFdkk2OUEvUWJObGdCdm81REhBakFhRGVoaDR3Y2VPdGNEYUJX?=
 =?utf-8?B?S1E5ckhHL2VlQnA1MkQvSHkzMDFmYWpwN1d6cE9qZHhRbzQrNVRPWWtoT0VQ?=
 =?utf-8?B?SFBJaUowbjVkNkl1UytmTWoxVW5MakFZbUc1TXZ3dUVya2R1dmtKMzI5SnZH?=
 =?utf-8?B?eFlvclhNaklTb0dZOHEzb2czVUJORloxdG5YQjZqOG5nS04xc2l3UTZoVU9y?=
 =?utf-8?B?S3hSQ0k0MmhrUUN6ZjdJNWJiS0xQekkyZzgwUDNKejA5OWdaQXFiOVVMWEJ3?=
 =?utf-8?B?N1BaSW9ySWd5RlRsVFhVUHo2Yng2K2lvRGFickpvWFpLb25CRTVjaWNmN1hW?=
 =?utf-8?B?NEl5ZGZNMldRNk1ZcXlyR3dlMUFuZGF1QUVjUlRlUkJvSmR1dkhNdmNDWk1X?=
 =?utf-8?B?QS9GYkxvbXpUMm5yQ2xDcXVGYy92WFhSUm91QktwUjdkVVlXRkhVT3BtNzBa?=
 =?utf-8?B?bTArZmdWZytzcnJmcGNFZ1pCYXFENEN1QU81STRtUVNBMXVDYloySW1USTdP?=
 =?utf-8?B?Mm45WFVabmdWV3U3Vm1JSjhPQVJBUWJaWC9CUUR0VmhnamNmeDkwY0pBc0NJ?=
 =?utf-8?B?VlRSN0o3RUpXek5zL053Z1NSMEpORlZDWThKMnNJS09wRG4weWllVmNtaVIw?=
 =?utf-8?B?UmVrQ2JQaFA3WWpFOW9EcVFmVXNCRVZBVERWVWU5cDR6M01hRzhPRGJMR3Ey?=
 =?utf-8?B?QjhlZXkycFhYTUFadXZuUlJPZ1E1QVVTUWdMRjR0YUhCUFpkelJ5M0ZQTVBG?=
 =?utf-8?B?WDAvTjlaamVUTno0Y3p2b0djTmNNekZMblBxQkNjbnkxRUZUKzgwQkVjdWF3?=
 =?utf-8?B?MUkwcDRFOXZkdTNwWmRIRkpyemlmaDM3UlZVR0syaTlFclpiOE1tZThUR3Vx?=
 =?utf-8?B?d1ptWjlzaXB6aUtjQzNhNXBqcC80V3JsSFZlTWV1WGRTZ2J4ZjJ6S0RxYUMw?=
 =?utf-8?B?RHp3ZzIzMWNsSFFtQU8yWXZhVHNzcG9oUWVKMkZVNU9yVWd0eDFJYjh4UkNm?=
 =?utf-8?B?SVNBS0NKN2ZKaVczM21DSGVudFVTb2NCUjVTSnRnc0hRUlFsK1RWcmJSTkxq?=
 =?utf-8?B?OGJRMkVsM1ZrTEVtRld1Zm9LSFFoV256SEN2VERaN2ljeVcwL2pZeWE5YmVu?=
 =?utf-8?B?dWNmajZpdGUyaUdyaUgyZ1RlTUI1WUN4SkRDcmtwaU5qQ3podisvZWRuMXlT?=
 =?utf-8?B?elVSY1R6N2VGRTdkTHpaVVI2ZjBqeTZtcEF1QnJjUHF1K1VzUGJUWk54UlJF?=
 =?utf-8?B?QnUxVE9Hcm12YUdjRkhJZmhmU2ZYRElVRWh1a2JVbVI5dWoxS1dRUmNXKzB5?=
 =?utf-8?B?dUc3dnlxZFJ2amUxTHRtZWdrZUVNNXA0L1JvN21pMHpJenFkdTJ2U3lZMmcr?=
 =?utf-8?B?YzVFVFNtVmNFckhkSDJsTmtxSkcyMGRVd0dEd3hjKy9TRWdXMnMvZFRJMGY1?=
 =?utf-8?B?c2FLYW45R210eERrdFJRM0ozTlgrUVA1QXk0bmhPNW5VZk5hRUtFNERWL0c2?=
 =?utf-8?B?WFJla0x0MWRORGRuMFpwcHduc0cxSDFVTHlnS0hFaStHYzVaUldBazFmUTh5?=
 =?utf-8?B?SVBoa3lxL1c4L2szODAwbHR1UnowUmt0NGhNbmVERmVNdmd4d3hmV014c2ZP?=
 =?utf-8?B?YmZpOE9jZGZDOWM5ZDM5UU96ZHA3RjhzRkI4US80VGx2NGx6Tmp1emRYZEVX?=
 =?utf-8?B?Ykk2OEpWOTFXNXd5OWlWNnRDUURCa3dCdDlzQjFTbUdZMXJyK1NIUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0218428e-f7d4-4729-bd8f-08da278c1f7e
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 13:53:20.4588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0MRoHT7Z3PJb2BzFFeq5HBRz2WlgMpiNh9A4oTkRBlKTOBSE04fpwX5342h91Xli5+GUb0wBtxmg8eKSxwY8/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0097
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
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alexander Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

On 4/21/2022 12:35 AM, Paul Menzel wrote:
> Dear Richard,
>
>
> Am 21.04.22 um 03:12 schrieb Gong, Richard:
>
>> On 4/20/2022 3:29 PM, Paul Menzel wrote:
>
>>> Am 19.04.22 um 23:46 schrieb Gong, Richard:
>>>
>>>> On 4/14/2022 2:52 AM, Paul Menzel wrote:
>>>>> [Cc: -kernel test robot <lkp@intel.com>]
>>>
>>> […]
>>>
>>>>> Am 13.04.22 um 15:00 schrieb Alex Deucher:
>>>>>> On Wed, Apr 13, 2022 at 3:43 AM Paul Menzel wrote:
>>>>>
>>>>>>> Thank you for sending out v4.
>>>>>>>
>>>>>>> Am 12.04.22 um 23:50 schrieb Richard Gong:
>>>>>>>> Active State Power Management (ASPM) feature is enabled since 
>>>>>>>> kernel 5.14.
>>>>>>>> There are some AMD GFX cards (such as WX3200 and RX640) that 
>>>>>>>> won't work
>>>>>>>> with ASPM-enabled Intel Alder Lake based systems. Using these 
>>>>>>>> GFX cards as
>>>>>>>> video/display output, Intel Alder Lake based systems will hang 
>>>>>>>> during
>>>>>>>> suspend/resume.
>>>
>>> [Your email program wraps lines in cited text for some reason, 
>>> making the citation harder to read.]
>>>
>> Not sure why, I am using Mozila Thunderbird for email. I am not using 
>> MS Outlook for upstream email.
>
> Strange. No idea if there were bugs in Mozilla Thunderbird 91.2.0, 
> released over half year ago. The current version is 91.8.1. [1]
>
>>>>>>> I am still not clear, what “hang during suspend/resume” means. I 
>>>>>>> guess
>>>>>>> suspending works fine? During resume (S3 or S0ix?), where does 
>>>>>>> it hang?
>>>>>>> The system is functional, but there are only display problems?
>>>> System freeze after suspend/resume.
>>>
>>> But you see certain messages still? At what point does it freeze 
>>> exactly? In the bug report you posted Linux messages.
>>
>> No, the system freeze then users have to recycle power to recover.
>
> Then I misread the issue? Did you capture the messages over serial log 
> then?

I think so. We captured dmesg log.

As mentioned early we need support from Intel on how to get ASPM working 
for VI generation on Intel Alder Lake, but we don't know where things 
currently stand.

>
>>>>>>>> The issue was initially reported on one system (Dell Precision 
>>>>>>>> 3660 with
>>>>>>>> BIOS version 0.14.81), but was later confirmed to affect at 
>>>>>>>> least 4 Alder
>>>>>>>> Lake based systems.
>>>>>>>>
>>>>>>>> Add extra check to disable ASPM on Intel Alder Lake based systems.
>>>>>>>>
>>>>>>>> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
>>>>>>>> Link: 
>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1885&amp;data=05%7C01%7Crichard.gong%40amd.com%7C5990a9e58af0438b80c308da2358d216%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637861161666341691%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=Ka3NSmXuyji%2F%2FRdH319aFk9ya5UytU8lq3FhiuMd%2FcU%3D&amp;reserved=0 
>>>>>>>>
>>>
>>> Thank you Microsoft Outlook for keeping us safe. :(
>> I am not using MS Outlook for the email exchanges.
>
> I guess, it’s not the client but the Microsoft email service 
> (Exchange?) no idea adding these protection links. (Making it even 
> harder for users to actually verify domain. No idea who comes up with 
> these ideas, and customers actually accepting those.)
>
>>>>>>>>
>>>>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>>>>
>>>>>>> This tag is a little confusing. Maybe clarify that it was for an 
>>>>>>> issue
>>>>>>> in a previous patch iteration?
>>>>
>>>> I did describe in change-list version 3 below, which corrected the 
>>>> build error with W=1 option.
>>>>
>>>> It is not good idea to add the description for that to the commit 
>>>> message, this is why I add descriptions on change-list version 3.
>>>
>>> Do as you wish, but the current style is confusing, and readers of 
>>> the commit are going to think, the kernel test robot reported the 
>>> problem with AMD VI ASICs and Intel Alder Lake systems.
>>>
>>>>>>>
>>>>>>>> Signed-off-by: Richard Gong <richard.gong@amd.com>
>>>>>>>> ---
>>>>>>>> v4: s/CONFIG_X86_64/CONFIG_X86
>>>>>>>>       enhanced check logic
>>>>>>>> v3: s/intel_core_asom_chk/aspm_support_quirk_check
>>>>>>>>       correct build error with W=1 option
>>>>>>>> v2: correct commit description
>>>>>>>>       move the check from chip family to problematic platform
>>>>>>>> ---
>>>>>>>>    drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
>>>>>>>>    1 file changed, 16 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c 
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/vi.c
>>>>>>>> index 039b90cdc3bc..b33e0a9bee65 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
>>>>>>>> @@ -81,6 +81,10 @@
>>>>>>>>    #include "mxgpu_vi.h"
>>>>>>>>    #include "amdgpu_dm.h"
>>>>>>>>
>>>>>>>> +#if IS_ENABLED(CONFIG_X86)
>>>>>>>> +#include <asm/intel-family.h>
>>>>>>>> +#endif
>>>>>>>> +
>>>>>>>>    #define ixPCIE_LC_L1_PM_SUBSTATE    0x100100C6
>>>>>>>>    #define 
>>>>>>>> PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK 
>>>>>>>> 0x00000001L
>>>>>>>>    #define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK 
>>>>>>>> 0x00000002L
>>>>>>>> @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct 
>>>>>>>> amdgpu_device *adev)
>>>>>>>>                WREG32_PCIE(ixPCIE_LC_CNTL, data);
>>>>>>>>    }
>>>>>>>>
>>>>>>>> +static bool aspm_support_quirk_check(void)
>>>>>>>> +{
>>>>>>>> +     if (IS_ENABLED(CONFIG_X86)) {
>>>>>>>> +             struct cpuinfo_x86 *c = &cpu_data(0);
>>>>>>>> +
>>>>>>>> +             return !(c->x86 == 6 && c->x86_model == 
>>>>>>>> INTEL_FAM6_ALDERLAKE);
>>>>>>>> +     }
>>>>>>>> +
>>>>>>>> +     return true;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>    static void vi_program_aspm(struct amdgpu_device *adev)
>>>>>>>>    {
>>>>>>>>        u32 data, data1, orig;
>>>>>>>>        bool bL1SS = false;
>>>>>>>>        bool bClkReqSupport = true;
>>>>>>>>
>>>>>>>> -     if (!amdgpu_device_should_use_aspm(adev))
>>>>>>>> +     if (!amdgpu_device_should_use_aspm(adev) || 
>>>>>>>> !aspm_support_quirk_check())
>>>>>>>>                return;
>>>>>>>
>>>>>>> Can users still forcefully enable ASPM with the parameter 
>>>>>>> `amdgpu.aspm`?
>>>>>>>
>>>> As Mario mentioned in a separate reply, we can't forcefully enable 
>>>> ASPM with the parameter 'amdgpu.aspm'.
>>>
>>> That would be a regression on systems where ASPM used to work. Hmm. 
>>> I guess, you could say, there are no such systems.
>>>
>>>>>>>>
>>>>>>>>        if (adev->flags & AMD_IS_APU ||
>>>>>>>
>>>>>>> If I remember correctly, there were also newer cards, where ASPM 
>>>>>>> worked
>>>>>>> with Intel Alder Lake, right? Can only the problematic 
>>>>>>> generations for
>>>>>>> WX3200 and RX640 be excluded from ASPM?
>>>>>>
>>>>>> This patch only disables it for the generatioaon that was 
>>>>>> problematic.
>>>>>
>>>>> Could that please be made clear in the commit message summary, and 
>>>>> message?
>>>>
>>>> Are you ok with the commit messages below?
>>>
>>> Please change the commit message summary. Maybe:
>>>
>>> drm/amdgpu: VI: Disable ASPM on Intel Alder Lake based systems
>>>
>>>> Active State Power Management (ASPM) feature is enabled since 
>>>> kernel 5.14.
>>>>
>>>> There are some AMD GFX cards (such as WX3200 and RX640) that won't 
>>>> work
>>>> with ASPM-enabled Intel Alder Lake based systems. Using these GFX 
>>>> cards as
>>>> video/display output, Intel Alder Lake based systems will freeze after
>>>> suspend/resume.
>>>
>>> Something like:
>>>
>>> On Intel Alder Lake based systems using ASPM with AMD GFX Volcanic 
>>> Islands (VI) cards, like WX3200 and RX640, graphics don’t initialize 
>>> when resuming from S0ix(?).
>>>
>>>
>>>> The issue was initially reported on one system (Dell Precision 3660 
>>>> with
>>>> BIOS version 0.14.81), but was later confirmed to affect at least 4 
>>>> Alder
>>>> Lake based systems.
>>>
>>> Which ones?
>> those are pre-production Alder Lake based OEM systems
>
> Just write that then: at least four pre-production Alder Lake based 
> systems.
>
>>>> Add extra check to disable ASPM on Intel Alder Lake based systems with
>>>> problematic generation GFX cards.
>>>
>>> … with the problematic Volcanic Islands GFX cards.
>>>
>>>>>
>>>>> Loosely related, is there a public (or internal issue) to analyze 
>>>>> how to get ASPM working for VI generation devices with Intel Alder 
>>>>> Lake?
>>>>
>>>> As Alex mentioned, we need support from Intel. We don't have any 
>>>> update on that.
>>>
>>> It’d be great to get that fixed properly.
>>>
>>> Last thing, please don’t hate me, does Linux log, that ASPM is 
>>> disabled?
>
>
> Kind regards,
>
> Paul
>
>
> [1]: 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.thunderbird.net%2Fen-US%2Fthunderbird%2Freleases%2F&amp;data=05%7C01%7Crichard.gong%40amd.com%7C5990a9e58af0438b80c308da2358d216%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637861161666341691%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=HYlNdeVKxSWQto%2BWGAoUc5etFwhdlyTUoox71SQjCtY%3D&amp;reserved=0
