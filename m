Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C70ECA0B126
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 09:32:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB3F10E4D6;
	Mon, 13 Jan 2025 08:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="k0BGVTQu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2195110E4D6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 08:32:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vN50ptXy4IiQVwkOZRvbPr4qHswh2JpuV/Q1EbJVYIV3wYKx4gDwMNjjGvHHMP3u+WaozlTVL2ohvcP1HKQrRjFv/v5zRxd8xLwW8bq/rBimiVEk1+AYXyBN+goV02jcVgw3zcVL7FXJcvFj5MTIXgWE/DgqmhXv2UD9yOkEXTOvJq3qskX7MwP/7f8kI3DbU1nL3S4fL9FJYl/9DBowAW2j2GPFBZIQoERsBHy+gXl1cRByRI+9/+iLsKaSSO9iqe/zorgEIPUVseGCnFpGPlqmcto5rNKb7gJXKpCe5YBXh1jVl7au3B4rF/8+3VhgrAcrAHfCM1oKHfdD8WXbDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSIxknlnWubbgOZtgURnlECApe22t2Cq5/wPgcPfzRA=;
 b=cSn3LkT2p3Bsm3wtd0Kvj/PFLRlsmYzqqN1UP69PiBdhxRrxAvlw9icbJtV/+SLp0jWu669UiMnGFj5MJtWtFKCLBdyHx9WJoI6BrcVs7HvB513AcTGZ5bXiS03B1yEex1N2i98zkk/J2dgLQgYLsIzP46hCjRexnkf2aDekLYmcgmfXpilYHiO6cDywwBHY82S/FVi46eBMh9ocdVwlLRl5BXeY/21BoMJzD96DZWE6DUq8gV25okN5S95x8FKCpziznlUUpejUuVY6mEhEQ7lZ9XlVpPNKkvJF0AOAyYuT6WP8Q9rpuI62lV6DvSJj5D4ngxxjwT/W7RaqGxvLMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSIxknlnWubbgOZtgURnlECApe22t2Cq5/wPgcPfzRA=;
 b=k0BGVTQuqaT3E88j1Y8lxv/0oxecrmM3NMa3hga+oq4KFvuu9sGHe49W2odAKcMnF1Zz3Uo/FAMsgRoq0jVyjnlVR+wV7zq4hQIwn6YOEiQyRm45H1zZyjMLJw9MISG4HYkrCZ6gEDu4m9TNx+m3afSTJZ3bNarDooewU10u99Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6726.namprd12.prod.outlook.com (2603:10b6:806:255::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 08:32:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 08:32:18 +0000
Message-ID: <ede4dabb-d3e9-45bf-8e56-aebbb8a37ae5@amd.com>
Date: Mon, 13 Jan 2025 09:32:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Fix amdgpu crash upon suspend/resume
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Philipp Reisner <philipp.reisner@linbit.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>
References: <20250107140240.325899-1-philipp.reisner@linbit.com>
 <942c02f2-6496-4406-a73b-941d096aadfb@amd.com>
 <CADnq5_PAG662SODmS8cSg7jcyh8ZQRgcWMtgjx5RZbuUE7j3Og@mail.gmail.com>
 <6a17b4f1-5b5b-4226-b3c3-4dfa3f3c3811@amd.com>
 <CADGDV=Vfnqmdn9Hdo9e3Av66NeZD1j1iijsEnP8Dqwakey5epA@mail.gmail.com>
 <3c47ea32-eeb3-47f1-a626-5868457469ab@amd.com>
 <CADGDV=UCd3d93NtppetkrgG+pE-0EoxxXQMwjgiZPbvRBStKiw@mail.gmail.com>
 <3c6e53ae-6998-47f8-ae37-9e68553ad918@amd.com>
 <CADnq5_Md7XWOHSru-0gR8xys3nwG4whSng-LcxafG3SiC8G0qw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_Md7XWOHSru-0gR8xys3nwG4whSng-LcxafG3SiC8G0qw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0222.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: f6783887-e1de-40ae-0ee4-08dd33acca4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekRYM1N5TjBNaFYwdytUcTZIZG4vM0lYL2t5K21GdDJCWktmNTdNNEVBT0hT?=
 =?utf-8?B?K1hNa2IzWUpJWG9DMTNqaWpwRnRnbXBoaE5pQXRDU09JNXNQc0V3NGVBanF4?=
 =?utf-8?B?TTgvcW5BNk4weGlsTHhTYTFjTmxNQm44WHY3MFpmTDJlckV0ald6eENEbnVV?=
 =?utf-8?B?bE53RGFXYjlTb0tiVFFQWTQra3dZWEFSNytidmJ0M3o0enFCdjZlelJKMEly?=
 =?utf-8?B?eEZGQ2JGSFJyYWx2eEh3T0daSlM1WWk5REsrd0R2d2ZCb3kydmdubWh3b0dE?=
 =?utf-8?B?eXRxbkg3MkFxL0ZTTCtubEc0VjAwWmFPN0pvSWQ2ZEkxZTRDNmFGaVU4MkN6?=
 =?utf-8?B?RmFTUXpDQ2ZSWE4rL015ZmpEbUVZSTVteXg1ZEVlV204akRSUVFHbXhCcDB4?=
 =?utf-8?B?OGR2c0Z1SExQYmp6LzN6a1BpanhlczV4SklQOWJGZ2JwL1NCVUZ3Umw2cnhy?=
 =?utf-8?B?UGtvTVA5ZGNYUXNRV1lON0U4dkhPekRrS2RCZUN0ZDBqNG5SSnNqT0dCaG1P?=
 =?utf-8?B?bmU1Y05aYUlqOHEvY0JneTRNMDA1aCtnbHpUby9sUEZwVlRqc0tuWktFeHVn?=
 =?utf-8?B?cEV6OUZERUFwRkw4ZVRPTmQ4cGZLdm10R2U2aGppekRBUGo4QkozU3Z1WmlR?=
 =?utf-8?B?MTZQbTJZZW9pUjc5Q2tLcktGSU1rOElsbFdZbFowdU1iRktOZ2JlbGdQdk8y?=
 =?utf-8?B?Z08xUUM0eTNSelp6TmNoUEJpZEtHQlF6Ky9wbHpKcWt1VFVYbXgwRXErNUxJ?=
 =?utf-8?B?bVRoZkNYR1RsbFVUdUo0Z0s5c1U0UmR2N1dIQmRtMmZMNk9HYmVMR21leG1W?=
 =?utf-8?B?Zm9CdEZicGVRZS9vYTZSRlJCOHljYy9FK0xSNkY2MWdHcldoalJONjhpSFRO?=
 =?utf-8?B?R1IzR1pCc3k0dTkxK2lsTnZKSFJmdVpudThISFpETjBpSjdaK1ZITUZNV3l1?=
 =?utf-8?B?TnlST3prL1daMi9SekJKS3N0elZZaDRUV1pGT3dLdWdFOXNqVXluRzdnQzF5?=
 =?utf-8?B?Mk9oNVJuWHpMcUlJKzM4UVdzbms0YlVMMExhZFVRWGpzeXcyeTk1bHJ3NFhC?=
 =?utf-8?B?Y0U0NUp3V2lzQmhtSS91dFZrVnBta2Q1OGczSGNoVkVpMjZDbCtyUVJab2VI?=
 =?utf-8?B?NFlMd2ZZQ1RVUTJJQ2FZQUlxdkFtaVo5ZDlhVUtGcy9iZk1lNTVxUnFSL0F2?=
 =?utf-8?B?bC9JeEN0WCtGV29Hc25YTjd5bko4SU1wbndIdWY1WVpJanE4ZC9jcVh6elJS?=
 =?utf-8?B?UEtwR2RIU282TUM5NHNXNEE3eXdSaUJiRnk4UWNudkRYcFRIMTIyY1lCamZ5?=
 =?utf-8?B?bHFDWFNaVkZZS3NZekJwQTUyMXpyTlRxUmE5eVVoU0YrcHpJcVRvTDFtandK?=
 =?utf-8?B?c2E2NWJ5TzZiNGhCeUJoMkkyWVRxb3lpSmRzS25NY0NLR0JzamxEWWd2aWRL?=
 =?utf-8?B?RlJHNitiUHIvcThxNzFIckxKNWpualg3SWF5REZXYTB0dzcrTXZ1R3VEY2xi?=
 =?utf-8?B?SlFKNzBkYlQ1YXprNmNPb1Bsc0N2TGlIeEluMXI0bDN2MXhkbkdkOGxtMk43?=
 =?utf-8?B?NlNoZWRYZzV1QjhNRGNFbHY1LzBqbi9yT0NidmFGbUI1Vk5LbVN3bzRVN0Yw?=
 =?utf-8?B?NUpDMVYreWNGVUlrQXlpSnc0MXJwdkJiMUtXNk93LzZHTldMQW95UFhpcnVt?=
 =?utf-8?B?OTd4cGprWTNMeUZQQnpKQmhCbVJuMkpEOHE4RlcyZS9uc0EwUGhDN1JKVWRF?=
 =?utf-8?B?akVCTVVma0hKa3Buc29mL3o3YlA5UUJUTDV2UTFWZlRGZzNIUmM1bjRwYVZK?=
 =?utf-8?B?OTl4K0E3eFZzTUxocFREQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wmc5Vks2OHNlV3JBL1pPK1pWam1iQ3RmaS9kTWZYVVU4c1JzVmJSVWN5MURm?=
 =?utf-8?B?eHJPR0Q4akdjR292QldKekhtQnVTVHd2aTlMZ0NMY3dKSmxaTzVTMXV6Qnh3?=
 =?utf-8?B?KzcrZmVpaFpaRmlqZlB6dzNoeHlwalo0RnFQTnRPa1NvSmkyVG9zeWxaMHpz?=
 =?utf-8?B?amJIQk9oUmtXYk1uL2NabDBRdTExVUkxVWcwcTl5Rm1kL1FWbCtnV3c2bFZm?=
 =?utf-8?B?Q3QzTGEyMVdNZERVSDlWWk9XaGg0SEoyZ2lnazB6clRFVDFLWnlZMDJFWVFh?=
 =?utf-8?B?UVVLcy9OdnJ3MCtWc0k3L2dTMUJLaTVoK3UxaExNMWloNnJmaDMrTzlmUkRj?=
 =?utf-8?B?WWovTzNZZ3JBVWtxYjlBM01LVDVaY055eGxXbHdSZTZjYlBiQWxOclEzQW9P?=
 =?utf-8?B?eXBmbW50clFSV3hMeXlkZzdLTUI2K1NMa2ZZM0dkaVhDNnZyaWxmOFNkZzFM?=
 =?utf-8?B?anZoOG11Mm1wOTl1c1dudUs4WEdkcEtEUTBMcFJhRkVNZzFtb253RGkzbDM1?=
 =?utf-8?B?K0ttZkdXTjlFTXA3dit2RW1Sc0ZLNFRiQ0NxYlErZUMyelZuQTdiUVFxN3VB?=
 =?utf-8?B?bmVDd1p4ZTNyS2p2YlBvUmtUTmZFSlRyTGNQNHY4amFnNzlhTmF3cjFaTWI3?=
 =?utf-8?B?U1pOelAvbzJwNnM1NFJFUnVWYlZnU2dvOUtPZytTNW90S2JUSEZtWTZTTzRo?=
 =?utf-8?B?ejg5OEdCcStKcWoya3dnTXJKeWNYQnRYZjEzSG0rMTllQjhuUzRoNUI0VnVh?=
 =?utf-8?B?cFAySmUyL1JDc2RoVWNYRVZab3gyU1Y5ejRnZnBublBsb2liTVhjeG4zSWht?=
 =?utf-8?B?dnpzMStYcVV5N3FjU0djd0hzOERueisxa2Z6WlkwYkxZbTJIS0h4clNDazVL?=
 =?utf-8?B?V2U2Mm5DMjE1ZzhqU1ZVTVFuYWN5RXNyaFljcVJxUVhYR0JRb25VdzBYbXFQ?=
 =?utf-8?B?dU05MzdnNEQrcStiN2l0Z2ZqdVFEMW40UnRaenA4MTkvSm9zQlBlRVQ5M1Mr?=
 =?utf-8?B?Z3JpZmF4U3JuM0dBYWo4V2F3enVKRkFmcitxY21KUDFmbnpkdW5ZQ296VStp?=
 =?utf-8?B?aGY4S0NMNUlSYXRpWHkxNnpndk5oWFRvMHZaSk1PZHZWTFJKRldBT2hjVE1n?=
 =?utf-8?B?bEJLNWZqZ1hBSWEyUmorWjhsbTlBZkVrNXZnNVlLWTNockZoeVJLbjNPQlgx?=
 =?utf-8?B?ZVFLQ1lhK1JMVWNnSGJMSUVyR3FIeEh1c05DQ3Y5ZUpOb2Nuem9PR1hXQ1JK?=
 =?utf-8?B?YTRLVXczMUQvaUw1UEFHTUNIcGxDRHdEQWRkL3FwZFp3ZC8vMTE2b1ErQnJE?=
 =?utf-8?B?T05QR0xDT2taUFVKSHgrdVVUZmdnT3BWYXNTYUMrQkhYbURLOStNdGQyV1hP?=
 =?utf-8?B?MG5jSnhHTFowN05LNDBwREJ4TmxRQVFyTTdVZjVIb1hNZDJqbS9xNUp1T0hi?=
 =?utf-8?B?VTJYZHRwOGtkMHV2bkZab0h4OEhNR29pczU2cS9kZWRhZGhuaU93bVZDdGI4?=
 =?utf-8?B?MkhtejdmQlBtRWVhYUVZRlBTbU1vTnZqK2dTVlRqNWtMRzRTZ2hhM2NtUmgx?=
 =?utf-8?B?MkZFSC93UlBrOHZmVkRvMGwySldiM09hVXU2QkJsd0Q0RTc3NDlXa2lEWGgy?=
 =?utf-8?B?ekk5bmVPZXJUTHhaZmtreCtYNXZ6MGpQcmdhNXR2VUF4WTg5bGRDdlhOUE54?=
 =?utf-8?B?VGdCcXd5YWpvTVRWRlNoUmhsYWhHTlRzbkVSTE9hL3FPdFpSZmt1Y2JkdEkw?=
 =?utf-8?B?cW9XelYzK2NJUUhYcWlRQXc4OW8xMkZsdVZpNkNzUFlacUJwc0NSTkx2UnFJ?=
 =?utf-8?B?cVQ0V1BSL0RCSG9tLzV1V3luc1FhSzhMMnYweUkybEo2bjlDNFJVam5MMDAv?=
 =?utf-8?B?WVN6U1ROYnRvZjlLUm1QWmdTM3J0TlpKdlpGNjBxWWkzdXZGNVpuY0g5dDk1?=
 =?utf-8?B?Mk11ZXc2SmpWdWtUUk5EOVhYUVZxNVgxZVZ1RVlrcXBjZTF0MmxyNUd0SXlU?=
 =?utf-8?B?cGFlNFh5b1hhUE4xWXJ2WlVkRHJqVVJzUS9TUzN1dFY0YVFGajhzL3F2NFRj?=
 =?utf-8?B?VEVIRWg1L0hsOEpEOXkzWjlZOW1nRWlNUjhVbGFVRmhWRjRDUmlRTDZEVU5K?=
 =?utf-8?Q?uAU4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6783887-e1de-40ae-0ee4-08dd33acca4c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:32:18.0527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7GWDVPlE0zje8fQ7fjcx6I05M8m0NmurMxSHa4KG/DQo7sOuKjO0NcME/Mf7Cfw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6726
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.01.25 um 16:10 schrieb Alex Deucher:
> On Fri, Jan 10, 2025 at 9:48 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 10.01.25 um 15:32 schrieb Philipp Reisner:
>>> [...]
>>>> Take a look at those messages right before the crash:
>>>>
>>>> Jän 10 07:58:14 ryzen9 kernel: [drm] scheduler comp_1.2.1 is not ready,
>>>> skipping
>>>> Jän 10 07:58:14 ryzen9 kernel: [drm] scheduler comp_1.3.1 is not ready,
>>>> skipping
>>>>
>>>> That is basically a 100% certain confirm that an application tries to
>>>> use the device before before those compute queues are resumed.
>>>>
>>>> Can I have a full dmesg? Maybe the resume is canceled or aborted for
>>>> some reason.
>>>>
>>> Yes, of course. I have made the files available here:
>>> https://drive.google.com/drive/folders/1W3M3bFEl0ZVv2rnqvmbveDFZBhc84BNa
>> Ah! That suddenly makes much more sense.
>>
>> Here is the root cause:
>>
>> [111313.897796] amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_helper
>> [amdgpu]] *ERROR* ring comp_1.1.0 test failed (-110)
>> [111314.135761] amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_helper
>> [amdgpu]] *ERROR* ring comp_1.2.0 test failed (-110)
>> [111314.373786] amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_helper
>> [amdgpu]] *ERROR* ring comp_1.0.1 test failed (-110)
>> [111314.611722] amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_helper
>> [amdgpu]] *ERROR* ring comp_1.1.1 test failed (-110)
>> [111314.849647] amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_helper
>> [amdgpu]] *ERROR* ring comp_1.2.1 test failed (-110)
>> [111315.087658] amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_helper
>> [amdgpu]] *ERROR* ring comp_1.3.1 test failed (-110)
>> [111315.207293] [drm] UVD and UVD ENC initialized successfully.
>> [111315.308270] [drm] VCE initialized successfully.
>> [111315.447494] PM: resume devices took 2.306 seconds
>> [111315.447865] OOM killer enabled.
>>
>> I'm surprised that this works at all. For some reason the graphics queue
>> works, but the compute queues fail to resume.
>>
>> @Alex what do we do about that? We could return an error when not all
>> rings come up again after resume, but that will probably result in a
>> number of complains.
> Maybe return an error if all of the rings of a particular type fail,
> but if only some do, we should be able to deal with that.  We
> currently set up 8 compute rings.  We probably don't need that many.
> Maybe just two (high and low priority).

Reducing the number of queues would make the problem even more severe 
instead of helping since you then have even less chance of successfully 
resuming.

Currently we don't abort resume when the compute queues don't resume, 
but this leads to a crash later on.

The issue is that when we start to abort resume the end user experience 
doesn't really improve, we just avoid the crash.

Either we need to tell Mesa to stop using the compute queues by default 
(what is that good for anyway?) or we need to get the compute queues 
reliable working after a resume.

Christian.

>
> Alex
>
>> Regards,
>> Christian.
>>
>>
>>> best regards,
>>>    Philipp

