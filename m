Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88475543931
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 18:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29048112AC2;
	Wed,  8 Jun 2022 16:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn2074.outbound.protection.outlook.com [40.92.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71327112ABF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 16:40:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgGbKfSuWbZOEyZ7wpYGXTbwH4n2x85erwHJWQa1nWe5PjMWtJLg1898ovhRMcm7M3fCgkSVHgNBh79vllUSjAAitp1nrb2HRvQctBmX94/4jPOWCy3FqXxPNVASvv4MXnnNH1pnMyI00XsMIWn2f69JLLUDFRo+uXbcjQ9P6YeE3ZcESVqiq1cqiQcUxfHlMXReQIzz8qyulXiIBVZ3AHjkjeg0Rt6/tTA1sZq4h6pNJickRomUXCNLGM771jSg8t7kbUR1cKPfvzS6n+N39drUEGI9diufTxagdq3phoSjy+C3byz3NGeck3HAMxVSMu3FwXWrQSpmoJW6npEvsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTq8lsOTUSKQb5bOfmJtaECWn/tLLrq/fEJjOF24vuM=;
 b=YzdByYQ0NpEMo3z6lP6CTGrVcF2bEXA3H2cU1PHOrSgtK6EY1GyYVJO9827DNCv7ATHlj4LIchwOOzTu+h95VnHtrL5UHHHj1PaNYkmvNTHPDaZAAtMW9gpa2m1uunLBU3zSLIxsrdY5mIrV5Fdyk4BODLWbO/uGzVQv7rzPOPZUyFq30lq8iv474RUNrEeyteGBe/UIq17pTczJ8faUpIZx/VRqkRSG2oF2qqvCeil84hB7WXKb42vdTTXFX0ixpbbvIUAe/4P3FeNhYPwFo5lmuZzXwU2E+ff0f4WWg2+M1P2JUuupByVe9w8NnCRWcGexZGzpWXC3BzlFhMuqSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by SA2PR02MB7530.namprd02.prod.outlook.com (2603:10b6:806:149::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 8 Jun
 2022 16:40:22 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::e179:40c4:4269:70e]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::e179:40c4:4269:70e%5]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 16:40:22 +0000
Message-ID: <BY5PR02MB7009AA50A0F7D570877DA646D9A49@BY5PR02MB7009.namprd02.prod.outlook.com>
Date: Wed, 8 Jun 2022 22:10:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/3] drm/panel: nt36672a: add backlight support
Content-Language: en-US
To: Sumit Semwal <sumit.semwal@linaro.org>
References: <20220401001810.81507-1-jo@jsfamily.in>
 <BY5PR02MB700935F5817128CB7C3991CDD9E09@BY5PR02MB7009.namprd02.prod.outlook.com>
 <BY5PR02MB70099A0E4C060E52284DCE46D9A59@BY5PR02MB7009.namprd02.prod.outlook.com>
 <CAO_48GH5V2-Z0cqGJoF68hzZjqhY6_aGxReSk+ByC_zrLWusYQ@mail.gmail.com>
From: Joel Selvaraj <jo@jsfamily.in>
In-Reply-To: <CAO_48GH5V2-Z0cqGJoF68hzZjqhY6_aGxReSk+ByC_zrLWusYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [/+uiMSMIzM/YwDKuS5twXfvn8lnsW4BSMf9duTXUzqGa9NQtSWtCVUQRUobYS5ag]
X-ClientProxiedBy: PN2PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::15) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <f0332a86-2499-941d-cd8a-b2c0823b409e@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7627f12-71ed-4720-5251-08da496d94c4
X-MS-TrafficTypeDiagnostic: SA2PR02MB7530:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8rsZTXWdZfWzfHpsxtu1t3bmHpr7IxMsNxrSJM1fanPwbDV7TUKuu7NVkFQN1lsL2jLaNgRW2kLH13qYZglqyztg4+Uz/mj9jHC84vvikueHtN7qeUtBatg8G9zqPUWd9nH6weNP/uD4W4Js5ZUDnlSa+U80HkHES0C5gFo45MR/QkkyqimmPP2q240mv6k6fHKc7D3emB/+HPJ1f/Pd8VQPeYegf9pmCO9jUNEQyqwuHlaO2lB53grUOl5Uco3HXZ77zRDcz7qwYHmZnzCQjvD0jksC0tJ7IwNhUHWWMfkgqSFxelowaaOEX9APKBHPl2m0TLShmKIvknsJm398ZDevEc+5Yt0pXGfFVhgG3ROlvrgo+ir0z7w08haCsokmRAYrgkZ3knUVqQsbkhVPHcGPnMqyV0Z/sT+FCa+AEUcxbwB+t13CtiqkzEy37P4iAA6Sf4FY1XwQ1qdXTWNE8LiKElb5RdvL51sK3oRxlJH8cjXOmGPmb7N1pBrnjyhGhxdSrCXnOx+luAtdDEV9MMgkDP8lIwQSKycel5Z+ca3tmvbGGitkl4X5ExFJPqANjNTaJjv4ngWew5BI4Iocfg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTIwNjVmdzFZSWJtWXBQS3c4bXJHK1E0eXp4M04wc2Z1UjVZYnFoMEhwcXVq?=
 =?utf-8?B?cFJPWGp1YUcvcm5hN2hkZVk0cEFhNHFBemxWRXVqNWcvQ243M0QwZXpkTDht?=
 =?utf-8?B?WUdaMDRIMEFiOE82UlpYOENlZ21xYVFaZmhUSHNPM1YyL3pkcENsMGJUV1dR?=
 =?utf-8?B?MzBsTDYyd3ZHUDFnNVphT1VvVUVFRjMzMzZydklSaTZvK3JWT2ZjWWdJVmVu?=
 =?utf-8?B?Sm5VbzhYTUo3Y05NcGkvTm9uanExWC8waTZsZFdjVTFlQldXa0QxRk5NMjRa?=
 =?utf-8?B?c1dsbHRtOGlWT0hGT3c0dnYrenhYRHNFdGl4TldmK2ExNmcweHpWaVc2MUpO?=
 =?utf-8?B?dURoU2FQVFRnb2toaGlWVFR0Yys1VHpiQ2Q3MzU2emN5TFdOMDlsNUJCS2xP?=
 =?utf-8?B?N0ZRclE0eHY4RlFVeGxMc25jUnJHZm9mY1dLRkVpZjZteUFEYU9LT1pIa3Fl?=
 =?utf-8?B?SjNCU2YxUCt4QmN5UGtzK2VNVmxxWGdaRElKZ1pFN0dMOTA5SDdDMnJ5SFR3?=
 =?utf-8?B?TlhRVWJpdSsxejE4VXV2UEV2eXQwVGlCSHJUMVYvMDRZV28zdnBwb2ZOZEt3?=
 =?utf-8?B?WkUyODR0VlZnNnVjM2VlZXVqR2FvQXhLdFpoMnBFRnZVZW5SeWFUZ1ZjNGha?=
 =?utf-8?B?T3QwOXU3Sko4bGR4bDFjTXZJa2hDTjJDdElXWW5ZMmR5dW55cThjYkk5UjFH?=
 =?utf-8?B?Rnp5VEt4Q0NqaGtNU3JnbDNhUmFKb3dRTVo1emdIRUtQWjFPa2JZUmg0bHQ4?=
 =?utf-8?B?U0ZpNTdYZWluRENremg1UUltWFltRE90YVl3VE40UVBXWlFUTzUxb0NKOHYx?=
 =?utf-8?B?VDlyR2ZEdytScWF1azhVTUMyMUlvQ2wrR2U5RjdYWWJiL3BQWjF2cDNvN0Mr?=
 =?utf-8?B?L0l5SzNkQUk3dVdidEcxblBKUTVUclI0azVIOTZtRHRXQXJEY1hCSTBZbzE5?=
 =?utf-8?B?ZGlUNVBObTBuT3lNUzIyMm0yYzBzVld0ei82SGFDVTQzVllLYmNIRUFPcldM?=
 =?utf-8?B?MjhocUp2K2w5c2R3OFBDOGZhR2E4Q1FERDhJUTNlRU90cGh3Unk0ajk4ZUg4?=
 =?utf-8?B?MFAzOTlGUlorVkY0MFQ2azdXaERDeWYzQ096UnVCeTdSTGxIRmVqWlhKS2JB?=
 =?utf-8?B?QzBHQkFYL3lBTzhjVW5oajdmZVlKRVY3Nkp4RXB3eWpvMUt4ZzFqcllDTk9o?=
 =?utf-8?B?UDRFb1hobFZ3Zm9BbkgxZURvdmxiWTNqQUlrYjJiYkl2S1kzeklWTFNsQ3li?=
 =?utf-8?B?MjRPOC9pdnkvbEx0S3B5VGd0YUhrakVaeUxUbDJlT2xWWjRMbWo1VytaZUxq?=
 =?utf-8?B?MDVtbm5iY2xJbjZGL1YrZExsSFFXdjlKNWpObHpCYlBBdVFOeG5PenJJcEhD?=
 =?utf-8?B?bFROdVM4SElOL1d0NFJDamw0V2xpNU1QRjlYRlIyVEJrQnhsRHpBUW4vckVT?=
 =?utf-8?B?L0Npb2VaZTZscTdlTzF5dEN1V2JGVHlTQkd0cWlWVUpaQU5YMm9RRWY2eVgz?=
 =?utf-8?B?U3JZVGVnYVZaSUtNYlRZbTRvbzlSYkJnWWRBTFkva25waFBqL1B6SHBnSk5k?=
 =?utf-8?B?Zzgxa3JzK0FXUTA4L1ppd2FaQ0hxOU1JdkQrMTRzOUJMM0FxeGthdGVIbmVt?=
 =?utf-8?B?YlMyK2hPWUp4TFl6VFNjWEJsZDYzRzE1OFkyaFpYaU1va3Rva3I2eVMwcHYy?=
 =?utf-8?B?TGl4cENidDVkSkd6eENHaUxURzNRS2lkbUFDbS83WE5WYzRTRGZwejM1cE5j?=
 =?utf-8?B?ZXNrQXhIUUY2bjlrVnhvZjQxN1BXdzV3SEZNOFg4ZVJWTitKNnBFL3VXc09M?=
 =?utf-8?B?L1FVeFBWSVlQWE1LZlZSYnhyZWZ1VSt5WGJKV0RoV2lkSVRhYlRxb0VRYUpS?=
 =?utf-8?B?eXdMMS9qZmRZZWNjQjZPSTI5eDJYaG1LN3lLQVBDdHZDWGpCTThXL0ZCcDBE?=
 =?utf-8?B?YnAyMjRzZEJtckk3OWc5amVHOGh6VklVTk0xVVlYSmVZUS9YeDNkNHVHb1Ax?=
 =?utf-8?B?ZnRvWG13aklnPT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e7627f12-71ed-4720-5251-08da496d94c4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 16:40:22.8596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7530
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
Cc: Amit Pundir <amit.pundir@linaro.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sumit,

On 08/06/22 22:00, Sumit Semwal wrote:
> This is entirely my fault - It somehow missed my radar, and I didn't
> queue it up. I will push it via drm-misc tree tonight. Apologies
> again!

No problem. Thanks for the update! So it will land on upcoming 5.19-rcs 
or 5.20-rc?

> Best,
> Sumit.

Best Regards,
Joel Selvaraj
