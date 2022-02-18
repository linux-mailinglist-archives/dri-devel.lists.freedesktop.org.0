Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 419C44BBD79
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 17:29:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631B910F296;
	Fri, 18 Feb 2022 16:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2040.outbound.protection.outlook.com [40.107.243.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D8810F294;
 Fri, 18 Feb 2022 16:29:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HyMNNQMCGLBJdHEz9rP6huFfLy1kHwaXFS+t+rl3W9tYhCTP8vi2wGKwMK8iU71rpBjBHLPV4RceMl7GRY1oBASxAe5861uMGfTT3+Qb1jti0EBMhwwuiKqJhnqE3W4BeyjHXov6imxwqpAKRc3C6yTE5c+EM7t3Bsrm1K07lNmW7NTcBfsnVdCX6YYwXjfu5GqQDcHNkDzgIKmZhgHG2J+lMVr49lO44vbC6dsC/jwjxOB/u0aOPFyTJKRD4Pvm53+yF72Rv4eyxNW9+W+VBp5vmk9Glub5LMF6v+IHJBT+wUvbrVadG/PidkM3gTawNpBTLH9QM1X18QOssA6l8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yn8dLJgmRLb7bXzYJsrYh9hnHbnA2wNMFN4gaU1Vkow=;
 b=ELY9HC3fvtsZJzhTlBdN/Q55eiofl52+9Rt0+SVT/5sQXmz3hAJN2O1VCCu1OWQfIivBPYHjKDyKZ921DjDXxRyXMJ92GeCScHOTr6d4MxCDVGWjY/z77A9LuGUqnv3cRMaQ6XXUybwmIvLFp/PeO8hAwX7iau+oGV9RzKPQccaEPkGDcBLKlmfNuyyvhc9o+uvkzMfxaj7mVbxqlkHb5IKD1wm/LM9+dLksP2EsvgD8kFrjJBB2k3YJZUlZLLU5ard68EOm/YbhWf7DbpzdANwhY+FAzprpogdVz0u7GBEbHhBEZuIE2TqTgCKgpn1pj7BYtZyT8ky95IIwb+7C8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yn8dLJgmRLb7bXzYJsrYh9hnHbnA2wNMFN4gaU1Vkow=;
 b=Yo55OYespZ/Iu4p8cgrVJ6v8PYjq/1yL40zgmlrA5BZZYwe0XdwRNZwRl5R4+J8fyq9Y9RytAJXfeuJJ6q0UT+WfukiTq1M8LUL0ivzk8ZoSDj/EW3ppwaOPzS+K0f+P418RkbEfqOyLzFjuHMHsSxbdZShZ46az3anikYBchmM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4845.namprd12.prod.outlook.com (2603:10b6:208:183::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 18 Feb
 2022 16:29:34 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.4995.024; Fri, 18 Feb 2022
 16:29:34 +0000
Message-ID: <0eeaa0b7-7ae6-c244-cfcd-86333d8f9b8b@amd.com>
Date: Fri, 18 Feb 2022 17:29:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdkfd: Replace one-element array with flexible-array
 member
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>, cgel.zte@gmail.com
References: <20220218030943.1905838-1-deng.changcheng@zte.com.cn>
 <cbc80795-af46-21fd-dc9f-ce932be76d4f@amd.com>
 <ea7d5e53-c008-4833-a24c-a17522ce96b5@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ea7d5e53-c008-4833-a24c-a17522ce96b5@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0327.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9665614f-e6e8-44d6-9459-08d9f2fbd929
X-MS-TrafficTypeDiagnostic: MN2PR12MB4845:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4845A89A88474BB4D7FCCA5883379@MN2PR12MB4845.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WFY4vzgdXClbctG70P5K2n37ZBscpx2MBGIImC3pOiwC/sh3KAYWFFv3rVEiYHjmD2OoFCv7TmA5ouihI3N2p2539BS8unH9DiQ9iyX/OanBHO9emenbdqOE9F4OvsRgKauLqyfbohN2FdczRDqWl0sjcZxfgg0ShOEb+at6yVubIUtmases97srCbs5mu6hPRWNLXTpUxw+h0lkpQT2ulDo1IlYoCvW1n8bpkx9Tufm5T/QAxBo7UPbwBW3CTcjR8uREv4AbOATNDkCfJeIOhwamkoLogsxpMSWPhbWM9QMxU1/sG1c46b23f+0434W1Wqk1GNJAYoQg1wHwlEVYD1jPU8lPq8wZCzT6ekLyHkcAHoHTZT5qfgnbLlqRU3qOtvOD/SAR5q2dkW9ASGr6zIZRWuFLDkJuKPSjdA2N1aG7QkfVh4K7M3I5VWap68t7wGB+lGVpvEZuO4B1eoNtTJKrpwWvlbodZX/JFFhgDK8yWI/48ySttH4Rc+oannQmxZggHWlfR70UzcM116KvBPUaDuYLp/c+rR3LnSoIp2VoEPC2D/55XgpABPAO2QCGug6xl5xdUrAA0P0HiTpSlWWdHRY6ZrCHXaGHMPw4qS7IQjYEuqCNwTzwdSdQvxx6owb+EWKveRih2Mb6e7KMgzqXYut1JuAzxhFUfdin5RVEswxD1WD/YRGkU45Z6nuEEKM/BnyNpmUoN62qYXdJWscAjlPH9+iVyaeVx6uu8vdlL8t0yPA3OS8EjPRdeQVeZ5V+rsC1LC0PJ4WH7FajpiEL8lVgMggvHX5TwwJN3Ui4ZUVH5XjFKa1YWJbBCJn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(966005)(4326008)(38100700002)(6486002)(508600001)(6506007)(8676002)(31696002)(66946007)(66556008)(6666004)(316002)(54906003)(66476007)(2906002)(31686004)(66574015)(186003)(36756003)(8936002)(5660300002)(2616005)(83380400001)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVRMamRqNnpTNUdhS3huTE12dDVuYlJ1b2pOY045T2lIS2p0d3BxMHl2K0wy?=
 =?utf-8?B?RnkyYzVuVStHL0gxQjk0VVhTNkNPK04wSDhJTTZoYVRrNCswRENDWWNQcDcv?=
 =?utf-8?B?bGlqMjMzeGRmcVNIQzRjdTE3d0xnSlJETlZsZ3BiVUZ0ZnFsOWtRaWtpZWhO?=
 =?utf-8?B?aFpUZzIyVE9UNHB2T0FTNlFGNHZBbWtiS0pmWThQaHJGV2w3Yk5wUGw0WmYx?=
 =?utf-8?B?KzZycHJEZFlSN3FBVThMS09SNUYwY0FEeEdzSFdrUVQ0VDdOQVIxcDFDNGxZ?=
 =?utf-8?B?UGV3UVRNbDd2NmROMWxJMVRETzRFOG9FMmRJNTZkeG1Yd3BVQTI0Q0cvb1Vw?=
 =?utf-8?B?aUNITENnSFVCWmVDYUdxRDBFUjM4a1dGREM4TDNUTHlna2lWMU9KWHhDYkVt?=
 =?utf-8?B?TzVJV0J6bXdkZ1NCL296cSsxVUNQMTdlVmVSOXRpQit5Uy9ITUo5MTVIc2g0?=
 =?utf-8?B?OTFZV1NYcVhkdG5sZkM5MVpEMHByVVRzaUg3M1pMbm5XSDlvZVlzT3JkcFZz?=
 =?utf-8?B?S3Y0TEpDaGxnTHArb0M0MEpSZGo3QWZNc1dtcktwQUxTeVBHSlpNbUkvdHJr?=
 =?utf-8?B?RHZ5MG4xTGI2QzJXUkw3bjJUSitSYkJLdDR4bno4TGpxRk8wYnZIUVFENEVz?=
 =?utf-8?B?RUxEY0NiMmxDa0NPY0ZwTFFMei9DbnJqeHRrS3RZUXhkdlBjaXJSRGF3SXRp?=
 =?utf-8?B?MUxmY3FKa004RHVVZEFWaXRuK1VGaVhqQ28vNTJhVVVUSC9KbEV0bjA1WDJB?=
 =?utf-8?B?K0UxZnRUMUpaR3kzRDU4N0c5V1ZrRUtTN05MeS9xTERMTnU4WDJUaGdaeFgz?=
 =?utf-8?B?VEZwWW5xYWhQano2YVNvR3J5ZUU3UEhkQitnbkJ6NldlU3p0MzFNOHVVSThj?=
 =?utf-8?B?czZjandMdTBJeVJ0a0RiTW01ay8vc0xIZTdCaVAwWVl3d1ZPT3d4eGRieDlo?=
 =?utf-8?B?eXdJM25KaFFaSkVLRmQ0VitqamJpSXluZkdFWFkvWDFZakpmTGhNT29XWllT?=
 =?utf-8?B?SFRaUGFJRkZMWitvVWlXU0tQZHdlZDVCRlhscFQzRlp1WXFYOTVvY0EwR1p4?=
 =?utf-8?B?enhNb3o5RlJFK05OcnAxbERBMnRSQXNuc25tL09CZDlNYk9OdUMvSVJESDd4?=
 =?utf-8?B?RklYZmZsN3VBN3AxWTFrNFFTQ0hFYXRSQUZTa2UrdkVuUVhRYWpvN0N1S0ts?=
 =?utf-8?B?cU9iQTNoM05uRzlKSzBBWWxsN1lWTEI2UFFKaVNHRVJwS3A0dUV0M1ZBRmNR?=
 =?utf-8?B?UHlEa0lrTU5KVVFNaUR4S1JaeXg4aXJINEN0TXNqTnU4c1Zya09jUjczZlJX?=
 =?utf-8?B?Mm9wRW1zT3cxZnBqNzdSK0dGcG9yNHZzZ29hYW85bjUrWVJNY3YraXN5akhI?=
 =?utf-8?B?Tkx0NmU5dzR5V2pqcjVBNkh1YXNIVEhjNHRrdUFIT1FhTjJOYm4yK2ozb3NW?=
 =?utf-8?B?YzYzNVpwdUhzQnF1MUhIS3RLbW9hWlVjZUljRUlKaG5MNTlSTEYva0hOaDFY?=
 =?utf-8?B?Wk5DZElxWi9iUGcybkpjd2s3UVIwM01OWXphQ1FYNXpiQSswQk4vNk5qM1RG?=
 =?utf-8?B?YWh6VU53ZEJIRFBKTDltOWFRdFBHWE15L0JLU0FLaCtwTy9qMHpWT0o2T2NI?=
 =?utf-8?B?UHRNT2ZDbStnOWhiWWNLNEhBSUV0aHM5WUoyTjkzSTVqekVLUmY2ZUtRQ0lB?=
 =?utf-8?B?RWlHemUrZExVVDRSYmNIbjV6cEYrZDRmbDNlT2Y3Ry9kenl2UytDTjlTTjk1?=
 =?utf-8?B?a01rOVlDNzJ5bHBGUVF1eU9XdVNhVDFvYmoyalJESXVFUDBkSGtCVjdRWGVY?=
 =?utf-8?B?ZmZEUXZuVHZkVndCNENhQUlaUUpzMW44ZVhBLzNWWERNRGlnVlpzYWhCdzNs?=
 =?utf-8?B?WldZdXFWVUJoN2Z1cFVTcDRyVExHWEo1YUxwbHZjaHVtMTNqcWhnNmR1anJX?=
 =?utf-8?B?bGcrOG1Uc2JtU2h4Wjh1cmNiM1NoNGRXY0NrdXcway95czZ3WGlLd3lHcms3?=
 =?utf-8?B?NHVEdk84U2RIV0x2ZnFiK3BQOElLdGowaVNyMTVTQjlPaFJnK2FxYnd3bVA4?=
 =?utf-8?B?UUZFVlAwNVBuZkVwS2IzWDFYNXB5UGxQTHpLZ2doL0N4ZStXaVUzajBXRnVU?=
 =?utf-8?B?OCtORHR1cU9ZYmdLbEltNjVBQWdsWTJ0S3ZJTUt3OWtxMG9nUEdjRWNENE1C?=
 =?utf-8?Q?cPdAane9G8Ju/i5bY9BEXVA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9665614f-e6e8-44d6-9459-08d9f2fbd929
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 16:29:34.5760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2qNKS6WB684UNov05ByzQKkRMhSAeFtX1v4UL9noI0odm5A8qlAfYBN5ZVFi1rH7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4845
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
Cc: airlied@linux.ie, Zeal Robot <zealci@zte.com.cn>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Well in that case somebody could argue that we should probably remove 
the structure altogether.

Regards,
Christian.

Am 18.02.22 um 17:15 schrieb Felix Kuehling:
> It looks like this structure isn't being used at all. So I'm OK with 
> this change, in case we ever use it in the future.
>
> Regards,
>   Felix
>
>
> Am 2022-02-18 um 02:47 schrieb Christian König:
>> Felix need to comment as well, but I don't think that this will work 
>> that easily.
>>
>> By changing the entry from 1 to 0 your are also changing the size of 
>> the structure.
>>
>> Regards,
>> Christian.
>>
>> Am 18.02.22 um 04:09 schrieb cgel.zte@gmail.com:
>>> From: Changcheng Deng <deng.changcheng@zte.com.cn>
>>>
>>> There is a regular need in the kernel to provide a way to declare 
>>> having
>>> a dynamically sized set of trailing elements in a structure. Kernel 
>>> code
>>> should always use "flexible array members" for these cases. The older
>>> style of one-element or zero-length arrays should no longer be used.
>>> Reference:
>>> https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays 
>>>
>>>
>>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>>> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
>>> ---
>>>   drivers/gpu/drm/amd/amdkfd/kfd_crat.h | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.h 
>>> b/drivers/gpu/drm/amd/amdkfd/kfd_crat.h
>>> index 482ba84a728d..d7c38fbc533e 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.h
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.h
>>> @@ -310,7 +310,7 @@ struct cdit_header {
>>>       uint32_t    creator_revision;
>>>       uint32_t    total_entries;
>>>       uint16_t    num_domains;
>>> -    uint8_t        entry[1];
>>> +    uint8_t        entry[];
>>>   };
>>>     #pragma pack()
>>

