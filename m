Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0B551720A
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 16:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB24110F0E7;
	Mon,  2 May 2022 14:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D7A10F0E7;
 Mon,  2 May 2022 14:56:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZVB3JmpjfyDYp3Y+MwQcZNhTruVNTegAyRK9NwkSJUa4XoT3DtfiBqDsQABmYJbPf6f6wujeMJF7WZ6wFq57n6kV+B85T147zqpwWXK1A2VIzXE2uquL/0BEV3sFUiQP3hMzGNXHYJ0Q6WyGq05ubD9SchhpdRdudFNlbjfgQycRPA4qEloEAsESNYgPWUICB5MQVRVCjc9QYowk9oTAWdlCMJHR3lcMi+m55WrUesniJStXbw2a998AGdbUM2iEzCIWpPUDq3SozsHcFEzyJA18V8y5Qm0FqVpJvwT/c9FKfz9GIAOaqs6zUWNMdTzarWh73xxAybBi4h5KHqsZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f19Hvv6ohCbZM50V+dNU96oJQqBPReVz6ZtcldeqBWc=;
 b=lY4Tx6ez8Xw0QvD1ukdgpA4UypqQF2HKlxMx5Epf0l5WqCB526tx9jKuRNtXnyGoSWu/aPSnU49hSTSTae57ApAivm6oxHEc9sLX7+OWMf8a9DTu1FhjAeT7sAd1tKt7VcaIiw3lAfOD1i6jPytT9gZDSDAxIU/cdSZrnUuynro3khWUsByXIxc65lMi9CuyVaR6NMNiAGErw3XIyxXUGL7JBKzB1/Xk9qWMzsjCl+wMuAsNLi3eXk9AkbTM1D0lfq9pNMm9Y7lEh3rFR6zC4Yx98JHf+FeVKymTCWmgI76Ti0b1mH24i8Fbx/qPLjxMWTUE2P6wGyMPTciwr1V/Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f19Hvv6ohCbZM50V+dNU96oJQqBPReVz6ZtcldeqBWc=;
 b=YmC4lrde1xYiW5OzIwlE66mJEmZxOHBxct6k1Bv2z/y5s7ufCGSmZwDujFbs0TqmnzXfKOdtlT/AqvLM7ej2GVgw57RGhMj9X8Kg/JgSjiTIO0MN37jo82mEKlFgmjIoNU3rHAUyNh2NQbIh1DzW4MgzydMKNNnZK4FcyIF7jG8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4526.namprd12.prod.outlook.com (2603:10b6:806:98::23)
 by DM5PR12MB1660.namprd12.prod.outlook.com (2603:10b6:4:9::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.18; Mon, 2 May 2022 14:56:29 +0000
Received: from SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::89d2:6db0:5fc9:cc03]) by SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::89d2:6db0:5fc9:cc03%5]) with mapi id 15.20.5206.024; Mon, 2 May 2022
 14:56:29 +0000
Message-ID: <6977b3d5-0aa8-3d57-c9ad-0742bdd3dc8f@amd.com>
Date: Mon, 2 May 2022 09:56:25 -0500
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
 <5adfe067-dc00-6567-e218-c5c68670cf5b@amd.com>
 <543a9e76-ca90-984b-b155-a0647cdeacff@molgen.mpg.de>
From: "Gong, Richard" <richard.gong@amd.com>
In-Reply-To: <543a9e76-ca90-984b-b155-a0647cdeacff@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR20CA0028.namprd20.prod.outlook.com
 (2603:10b6:208:e8::41) To SA0PR12MB4526.namprd12.prod.outlook.com
 (2603:10b6:806:98::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9aefbcec-d554-47e7-3a55-08da2c4bf050
X-MS-TrafficTypeDiagnostic: DM5PR12MB1660:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB16609FE54BC314E149F8529395C19@DM5PR12MB1660.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MIHSkBf/Xmb5mr14AozEm8afMMZn7TlFFMvN200pR2bLa9PxE4TMyBqgL82lfYuzHbUTOJ2HxiJ2gtFIbRmHgH3EsOmWIgRBT9yf8bFjXIzURJ4Lx92IU4/80KA1pJKwur0VXRxtHiI0vMmQadh9mHcIWezQoKCBTTjwxvUcbuOBY76+q4wCwJBxyCSYA9ndvPZ5UMHujwVPu0rvWv/7bBRaLYD0ljZ7cuecwcVFneqek4Rl+w0GHQo0t2iokS8YIcK9UB5aojrHkGUGO5Q38vQgGR+cg9l7sVSDM9wzRkpg7TALnchk+kDecmo9YWebgw0zG7GydwdcJJOvA1zjopNzRvEYS2pV1eLodE2LpUrGbBEj1DVsShgDj6H7fRwUoj7leD9aMPdlUurHXujvdw+1sbrrTsarhat7VreHI57AM5fNZEpk42Dpz5wQeaRkYsDE+kLh2cuX7lqd4DMJweeacDrCJv2z6g10rVfRlIBZ6h1SAM+JKRf0dYsGkO1gsp5/dM/++Y9VUcQg1UecI+VApwbrMTDl29cuTf/M3t2cZT8H+WEvMrYQaloIZrCdzDE9j4QXOsgp3Frmoa1EGdAd2giYO92dEKIxsHoc6DKHAlrn5S16wsSqIZ3t8CF48ok9pv+Cwoip65irPPkzIbxP2ZWgLdVEBav4Nq6IXgXkjC339OpzfzfFhFaVQ0xnhBKemhjsnjJG43jawKQD0X1fZErlNowCchjEOgHTg4bGLErKBHENsTlS85e/I93C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(86362001)(8676002)(4326008)(66556008)(66946007)(508600001)(66476007)(6486002)(54906003)(316002)(6916009)(38100700002)(2906002)(36756003)(83380400001)(2616005)(31686004)(186003)(8936002)(6512007)(5660300002)(6666004)(6506007)(26005)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bENYNG9DL2ZuL3lnQ2tMbm9lWVo5S1pISTlqdnVuZWIvV2ZIRWhLdWJlWGhG?=
 =?utf-8?B?R2tTbGhqUFMvZTBQd3c4VHZKTEZpT3kxWElBYWNVTy9wMGVEaEI0VTl0K20v?=
 =?utf-8?B?SzZtZUd2b1EyYm5FRWdJbmp4QVNVWWtFZk00aGFqVC82bFRyUUNvNGpsN0lD?=
 =?utf-8?B?OEFFd0lpc0Qwd1dhLzJ4b0Fob3hIcWxMZWtuV0JRL1NKUG1hWTBqcXRCeVQz?=
 =?utf-8?B?Y29qeCtRUUVkWXowR3ZNZk1wNUdJeHRuNThrWllIYlZpQmJzcm5GOVp0bEpE?=
 =?utf-8?B?OEwxU2FKRXUvdjNyTTc3V0l5aE0yZlZKSUxRMFl3TFYwK21jVm8yZGZtM1dp?=
 =?utf-8?B?YjJEYzRVMkRKODZkM1U1N1ZhbmdCOGY4RFYxVmlkY21tNTcwMnU0U0xNNUlm?=
 =?utf-8?B?Y2EvUVdQYk5ld3Q2UkJSK2k2U2Uxdk95WEdxWVBTWHluSTFLSXhzakVMcU5W?=
 =?utf-8?B?dkJ3bUZUc1duY01mQ28rU0dtWCsydjRiQUozNElDRCsxRzlwT2Z6eTZraXly?=
 =?utf-8?B?WE9nbUgrSVl5Nk9QKytWS0RwQjRxcUNTUUxVdkZraDFVWmtwNGlScmNyRG54?=
 =?utf-8?B?ZFNuMFRRK3RUVXNDdi9yYTZmNzQrR28yNm9sL3V1L0pNTzNpTElyNG45UDlU?=
 =?utf-8?B?a3BQR1BhbXBlWVRzTGVHRTFycW5FT0FvM2lCUlduT21rbzNaZ0puSWEyV3Zw?=
 =?utf-8?B?Y0RBT1JFS2lHMHdDaVVyb0RyeXc4YmdUeGlVaThLeklIY0ZZY2NNTGZzTndy?=
 =?utf-8?B?SWNQV2toYzlLa2FPditXZGljbUNCblRDSUtSb1ZlNlcxVnVNd3Y4YVEvTFp3?=
 =?utf-8?B?SVluZkx2SnVTamhqV09GMTR3MUdXTFRHSG0wS1N5M1AvdXFGSjM5eTlwRUV2?=
 =?utf-8?B?VEZvUGZkaGVGNk1FUjhra1V4VFFhVm5lbkhCTTRiQ0V5ZzJpNjNVbUFNWkNY?=
 =?utf-8?B?QWQyZUZIWjR3WXRSclFtT1Bza1VmMUFxY2dmcHpNQVE0UFdOYVBabkxieE1J?=
 =?utf-8?B?SFR1TnRBZ2Q5YzVJRTJMMTFBMFhvV3hQTjA1UTdsc2k3RmFmSVFGS1lab2Ft?=
 =?utf-8?B?TmIzenJnLzNKQ3ZZaHpWSk5Hc1JJTVJGUkpFUTlYenRMbkdTVUwwcmhMd3RI?=
 =?utf-8?B?akxvWGY2SG1iVjhYaEJoUGhKWDBzNE16c3dZYmJQVlBMN0Y3VGt1OHFoRGFl?=
 =?utf-8?B?UW03SVRha202bVBuRUt2Nk9WRzM4VEZXeHhNcW1EVUEySGJuMmVLZ3VTTXkx?=
 =?utf-8?B?SDBmRlB2NS91czZEaUNYSlhPeHFnQ2NSYlQ4ODhrNmR4eEJQMDVKUW1vVUdO?=
 =?utf-8?B?SlpqZ29jSkhMbzM2YWxGQVBCRjY0cTlOWWZaL1RaMFVrQ1ZWbjB5emNGRExn?=
 =?utf-8?B?aWhiYXhqb2hqS0habXFwS2tXZFVRQzRWdXNNbC81REwyRTRsVDhHLzh4OWNI?=
 =?utf-8?B?WExjanhQNTh6WEE5Tm41YWhMTnFoNTBzOTlxanNuOERnYWc0TzdUZjc1NU1Y?=
 =?utf-8?B?dXI5WVgwL284VVl1NUVxMm04UVRUTUhhNklidmtOQStpbDloYWNTVXVnQXI3?=
 =?utf-8?B?OHJncEZab0JWQ3dsb3JQUGtmRm00T2ZneVRKQ0szNTRCL1AxZEoraXRCRU9H?=
 =?utf-8?B?dXBhSzdhaWkrSWpUQmUzZHlVRGllalJWUm13MXJ3eTlaOUVoR0VxcWJ4azgv?=
 =?utf-8?B?R21IRHhHWU9aYTF6a1NrRnlXOGNKZTY2MjdrWGEzR25lMllCUmI3WXEwa1Js?=
 =?utf-8?B?ZG9SajJxVlZSeExWYjJOcVY5WW0wZGhVSlZLN2FVTUE2MUllK2xSUzlWb2VP?=
 =?utf-8?B?U1JRaGJ6QXJYODZJQW1XL1pMbFcxUTk2RzQ2TGJqOExUTWZVNUhWTmZIaFNW?=
 =?utf-8?B?RW9LdE0yVGVBQVNUdWoxUXd1d0tFUmNsRkQ1TWdZWXpqQTdQYTFRait3ZTI1?=
 =?utf-8?B?RTlNWExDc2F5NVdjVXFpWHhTWFFicUFYRWd6WFVhZUI5TmVCeUJ4eWltUmkv?=
 =?utf-8?B?ZnczUlpqMCs3N0laRlpib1BYWjJ0Z0lBbTNwYU5WcmNqZzRCR2p3cFRpYmpD?=
 =?utf-8?B?UHlGWEF1S2RCSGpxUnJPT0kvUEY2Q2VVa0FDdTRKMG8wTXNUVUdHWC9GWHlJ?=
 =?utf-8?B?aG0yS3NOSVh1bndrb01iZTQ3bHFHaWFwMXZWclgzZUxzbUVrVU1sTEtoWmlv?=
 =?utf-8?B?dDZGUkFodUErbXA3SmhZUVM5dGlVd0RDL0F2SmFCSi94TUZLMDUrZDBtaHow?=
 =?utf-8?B?WVpURGVVT2xscnkzSnh2SS9zaHFzREZ3V1BNL1Zjcmo2UFBUcE5JNFVMSjhj?=
 =?utf-8?B?VUhvb0VqQ0M1eGlPRWpTSE5Fc2tzeFN4S01FdDhPY3U5ZmVZTllUUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aefbcec-d554-47e7-3a55-08da2c4bf050
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 14:56:29.3711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQSif34cQ7mgOgTLVcbIbR2v4GzI+c9tNf+UxlekdcbEX/iqUvW9c2t0XVbs5x4z0PnVaBjo+1Obuqs7+oGrlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1660
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

On 5/1/2022 2:08 AM, Paul Menzel wrote:
> Dear Richard,
>
>
> Sorry for the late reply.
>
> Am 26.04.22 um 15:53 schrieb Gong, Richard:
>
>> On 4/21/2022 12:35 AM, Paul Menzel wrote:
>
>>> Am 21.04.22 um 03:12 schrieb Gong, Richard:
>>>
>>>> On 4/20/2022 3:29 PM, Paul Menzel wrote:
>>>
>>>>> Am 19.04.22 um 23:46 schrieb Gong, Richard:
>>>>>
>>>>>> On 4/14/2022 2:52 AM, Paul Menzel wrote:
>>>>>>> [Cc: -kernel test robot <lkp@intel.com>]
>>>>>
>>>>> […]
>>>>>
>>>>>>> Am 13.04.22 um 15:00 schrieb Alex Deucher:
>>>>>>>> On Wed, Apr 13, 2022 at 3:43 AM Paul Menzel wrote:
>>>>>>>
>>>>>>>>> Thank you for sending out v4.
>>>>>>>>>
>>>>>>>>> Am 12.04.22 um 23:50 schrieb Richard Gong:
>
> […]
>
>>>>>>>>> I am still not clear, what “hang during suspend/resume” means. 
>>>>>>>>> I guess
>>>>>>>>> suspending works fine? During resume (S3 or S0ix?), where does 
>>>>>>>>> it hang?
>>>>>>>>> The system is functional, but there are only display problems?
>>>>>> System freeze after suspend/resume.
>>>>>
>>>>> But you see certain messages still? At what point does it freeze 
>>>>> exactly? In the bug report you posted Linux messages.
>>>>
>>>> No, the system freeze then users have to recycle power to recover.
>>>
>>> Then I misread the issue? Did you capture the messages over serial 
>>> log then?
>>
>> I think so. We captured dmesg log.

make a correction, the previous 'dmesg log' description was not accurate.

I referred that to the kernel log captured via 'journalctl' after 
recycling the power. I should use kernel log rather than 'dmesg log' to 
avoid the confusion.

>
> Then the (whole) system did *not* freeze, if you could still log in 
> (maybe over network) and execute `dmesg`. Please also paste the 
> amdgpu(?) error logs in the commit message.

As mentioned in my "previous previous" reply, the user have to recycle 
power to reset the system.

When issue occurred, keyboard/mouse didn't work.  'demsg' and ssh didn't 
work either.

>
>> As mentioned early we need support from Intel on how to get ASPM 
>> working for VI generation on Intel Alder Lake, but we don't know 
>> where things currently stand.
>
> Who is working on this, and knows?

I have no idea.


>
> Kind regards,
>
> Paul

Regards,

Richard

