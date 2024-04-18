Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 128E68A9371
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 08:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8033B113A4D;
	Thu, 18 Apr 2024 06:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="r/UpCe65";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41438113A4D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 06:46:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4LRLAyyxNwe1fZK59qRyKewvZQUJtJwALO3DIvcR0RqDE5xBvyfFlYXBT2OLX+eVtLfbuOSiQg9wfA7OJrqxTH1KeasaThKWvlW2GI7T9JKnljSoxBQvppcPAb+MGXswJDB+2LFA8VwWh3N3LuUDQogYrOoqMf9aYfQBZByL3r47z3Vz6U6k4TOTN6ETOaC500zvtQS86i71K2UHkWUYj3bz8DNskM9AxFuDovVBWvyfmrhnD3mc1BPkx18zCCH5be9Y1d4DndQt5LKecBg8+d2/m7IpIpGdXk5YqH2SiN31v6ZGBK2NonrL/L9Fo8fwgmif36StylkQ07uOlhgBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TARrtCyDCfzkoT0VW9l2Z8qCWst5hEfR07nQejtsTFQ=;
 b=fMf2paEpRpTwH3cjCPCS05ymrKEDr+gOaXhJEmE8otVspPueVevDnB05oJirFi5+xpGpmMfkVQpgBhJ+97DhX/nmOi3iSBM031ecZ9I7zwWSGkxFIfSIIAbdfFby0Jtc1va+x1HpIzw6adje4sB8xcUr8IkqMpaRXRdGwqKnoRfzIHQ2d6ppz1dOyNFsLoFmvedeBM+REH7JheO4vqZHr4RB1Uu88NERpIzTU2uGYRn03qT1ctugog4Zy7BSavjzzMhh7JzPu/cVYrCAykBIMcTCU+0NIzy+JWUoIXh1EOUwFbRYPYfgWqq5l/M84GbAMVxawomzsZA7ByJDkcuVLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TARrtCyDCfzkoT0VW9l2Z8qCWst5hEfR07nQejtsTFQ=;
 b=r/UpCe65DDNQnNwOFnkg+vCI4BPpsRlJ0RcWSErtRz+A+UY61GFWGohqni+jjmuFFdvKBvbeCiOO66WrJPnaUiBu6VKh3EM2gUW4YxY3mCNI8w/2AqkzpbzimbuPRLgmXzcSAdIY8n4MSXmn71tQm/i+zVd4MM8Y9T0ha66tXgk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by CH3PR12MB9023.namprd12.prod.outlook.com (2603:10b6:610:17b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Thu, 18 Apr
 2024 06:46:16 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::f7eb:b717:d637:dcf7]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::f7eb:b717:d637:dcf7%6]) with mapi id 15.20.7452.049; Thu, 18 Apr 2024
 06:46:16 +0000
Message-ID: <d4209754-5f26-422d-aca0-45cccbc44ad0@amd.com>
Date: Thu, 18 Apr 2024 08:46:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
To: zhiguojiang <justinjiang@vivo.com>, "T.J. Mercier" <tjmercier@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20240327022903.776-1-justinjiang@vivo.com>
 <5cf29162-a29d-4af7-b68e-aac5c862d20e@amd.com>
 <cc7defae-60c1-4cc8-aee5-475d4460e574@vivo.com>
 <23375ba8-9558-4886-9c65-af9fe8e8e8b6@amd.com>
 <CABdmKX2Kf4ZmVzv3LGTz2GyP-9+rAtFY9hSAxdkrwK8mG0gDvQ@mail.gmail.com>
 <e55cad9b-a361-4d27-a351-f6a4f5b8b734@vivo.com>
 <40ac02bb-efe2-4f52-a4f2-7b56d9b93d2c@amd.com>
 <4fedd80c-d5b6-4478-bfd3-02d1ee1a26e5@vivo.com>
 <aab5ec51-fcff-44f2-a4f5-2979bd776a03@amd.com>
 <2ebca2fd-9465-4e64-b3cc-ffb88ef87800@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2ebca2fd-9465-4e64-b3cc-ffb88ef87800@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0038.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::9) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|CH3PR12MB9023:EE_
X-MS-Office365-Filtering-Correlation-Id: ef0750dd-0b95-4ebe-c1a6-08dc5f733ec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzhXKzhxUFZwSVJWbUEweGR3YUY3TVE3ckhjUklEYTZ1ZEQ3VUQ0WDVGU0Jl?=
 =?utf-8?B?MTY1QVUrNGMvMElKaitvcXB1eFZ0R0NaYmlTMGFTR0wwM3d2MXpDWEhSbkhx?=
 =?utf-8?B?aUZ2YkZPbmZxMUR4WWYzelRuSEUrcUJENUZIay9HaXlzb2dQU2tYekc0TWFt?=
 =?utf-8?B?L3M4alo5M1IyRjE4eldjdnpUR1lIOTloYmo4NTdNYmhLV21WZ0pFYU55VmNy?=
 =?utf-8?B?c2ZwTnJSdFN2MkVzSXhUWlFZeDJidGt0SUx1Y0gyVTJyNU1JQ0hGVE82dXhP?=
 =?utf-8?B?Ui9TeUNHSXlOKzJJRmRqajQzWkZFZ3FlUHpycTJ2UTdjbHF6YUdOZVlsblRN?=
 =?utf-8?B?bkp6eWtxWjlEM0N5WFFzM3kwZjdxMkVHUm4xVGFQM1dzZS8wSkduZVlTU1N6?=
 =?utf-8?B?U2NJa3ZmYjB5Z2JXc3o4UE16clpDTk5JVHVic1RhNkc5TXZYY3NhQ3A4UU9P?=
 =?utf-8?B?OGdvditGaXF3VSs5WFBuMk01d1FmQWY2dUVIS21RdGYwTjJITlR3blNSemQ2?=
 =?utf-8?B?NkdvMm5OWVNaKzQwa1FVS0RObzVwQXcxMGZwQktPbG5ySFBHN2RnR2JkNkFR?=
 =?utf-8?B?cksvZXlHTllRRnUvMHhudHVKVzdNUzNzdXozb2dEdGpzQ0QrSGwvNVcwWCtT?=
 =?utf-8?B?VFN4L0xudUlJVzhpQmZ5dHBzWm1CL1hJNzBIb3VUL05vc1grZDkzbmFKVHNE?=
 =?utf-8?B?Z1R5aHpabkJ3S1JaUHFRbmI0Z3VpMjgrOUhUK0RQUERpbzR3SDZOc0QwUmxB?=
 =?utf-8?B?S3NpSW1iMVVmbnphb3BlOUNaRi83djJ1SGpkejJSb09BTTVyZE1qSWZoNm1r?=
 =?utf-8?B?bHlnc2tNcGloOVlPMWxVb3BJN0xmWmIwQ3hpV3laTGNzTW5pZGZDVVJ0ZDZC?=
 =?utf-8?B?KzJuakkzbnVxaWRTYXlkaEl0dEcyRmxGZjFYTnZzTXhONlN6VGpxcnp6dWtU?=
 =?utf-8?B?RFRpd2txRkw4NkthcW92TUk4dUcwRnBUSDZpcWZNRDZma040eXZSVzNTNVhK?=
 =?utf-8?B?T3lVaEY3SUt2OW10SnhuVkJjbk9rcjA0SlcrT3VOL0VPS1hQYnMvUGw2Z3NY?=
 =?utf-8?B?NklQa1Y5SWFXZHA5eUk1S0tGcDlBRFc4OWdNM1FtaDQrV0dDQTFBOTBkM2Zh?=
 =?utf-8?B?T3lMVWZ3VCtlRHNNa3FJMXNrUlY5RjI1amhmVkRsdkZkMlBXNjUxYzFUOCs1?=
 =?utf-8?B?OUlYSHkwWlF0bTcwbk1RR2ZXK202T2FFdUxoazNibFE2dWlwekUrN3BIaDdx?=
 =?utf-8?B?MWFDZzcySWpSbjRJR1pLWFFvckFpN0tlNjN4bzAyRXZtMW5zVkRzcjZyOG1D?=
 =?utf-8?B?S0V6aUdZVW1ud2dLbzZURGREaWxoek9rUGJPOCtTdVhCYkNhTXEvUVc2cE5Z?=
 =?utf-8?B?SmIvc2RPOW9zKzM2Z3FsRUdVV3QvYVRWcFpZOE1DUjhsaHRJTUdLT3pEV00x?=
 =?utf-8?B?WFR0bkZDRGIzL3FGNWlPWmVqMFRrRWFkYmQ2UmFUVWZjQldzNkY1cG1ldmRr?=
 =?utf-8?B?QWFuN3RGeG5pYkZQVHVLcUUyU3Q3UHNEMFlUOFkzSlNTc1RwYzhQYjRsUHFy?=
 =?utf-8?B?QzYwcnQxaG8zTHpGSEcyem1QRk9NTkN1UWhsTkhrM2VVVTg4UEpyQnZRcHAr?=
 =?utf-8?B?S3NLeVhUa3pUSlovb2VidmE2V3l1SnBFV1JVTy84SnNTZzhYYkFzcE5ZNHBV?=
 =?utf-8?B?UjdldFloU21MdnJIekV2Yi9PVWJ2cU0xajdDWTE3eUx4MVZGczVrZkN3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGVZMDRiYitseE9oOW1PM1YrejNyc2lERlE1M2VKZFQzbFVCbDhwUnJ1djRo?=
 =?utf-8?B?MUJ6RXptRlpPZUYrdktzdmZnNVl3ejlhR3F6bkxJdFhTaG9vdHljbzNXSGxW?=
 =?utf-8?B?SkFINnVPakVwZkdWZll0UnlWekp6UnI5c2x4YjlXL0pJVGo5dGNiaVNRMUVy?=
 =?utf-8?B?QjJ1dmhxMGJ3VmtremQvQmJRV1htYkw5Qm0yYWRhd2hwb2o4RVN5MWxPWGNN?=
 =?utf-8?B?VGU0VGpNNlZ2Mmt1bGRxLzMzeGZTWThRcU1LQWlkSjFRZUE1K2sxNEorVWNv?=
 =?utf-8?B?YUdhTzdqenFPd1JGMjZUcnpFaS9mOWVmTXZPYXNpeHNVNDE3b0VJUm5jdmla?=
 =?utf-8?B?b3FQa0FxdGg0WUhRbXN3SHh4UE56UStwOGt3N2tDVlBpNk5CVlVvSmVPRy8y?=
 =?utf-8?B?WXFKd3BxZTNMUW5IQW1GamdXQmI2bWF3QTYzSlVSQ1M1VFFCUjR3L1drQnJD?=
 =?utf-8?B?ZSt5dzI2dHAxdmcrK1U5RTZXWEtRWjE2WVk2UE5BemhhVmZuaGtPL3krcmtJ?=
 =?utf-8?B?N2orRnkyckNIWHFBVFVTb0VuNmhqWHJuN3E2emE4LzBjdUdwbEdEb2g2Q2Zk?=
 =?utf-8?B?elgrZW50U25ZL0pGSWZWdFNySG9DSmV6S2dVWFhpT0cvR1BzUDNMZkp2bjla?=
 =?utf-8?B?TFRPQnIzck9XbUdZbFdRTVhRYzVleGFSNUlPWEU3SmZsV3I1MHNVTWVUcUMw?=
 =?utf-8?B?MVZ2YVBYNTQxZUU3T3MzQzd2NXZmS0xEUUxldHFDaFhTdHpJR01kcVVCTkZx?=
 =?utf-8?B?ayt6TWlHN3hKeU94dXdCZTFiR2FUcmlOeDgzVTdnUmIwcmd6YkNMOGVkSVVr?=
 =?utf-8?B?VzBlaUlpNTB1MFQvSHJibC80N1ptOUVGbXZIcWtnMktFVVR1dW4wS1NRUUxx?=
 =?utf-8?B?d0hPUmVNVEx2R3U0cjZOcytGeGtxTC9lRWFpNlJPMEp3dnVoVWtjTGpOMjFp?=
 =?utf-8?B?bjFIeG43RDl3aDRlelBzZFkzOVpTTVFsZWljL1ppRHhUamhXNnpQYmN5dFBH?=
 =?utf-8?B?ZSt0U0dvQmFXNkFyd3BWV2FRNEVOWWpybUtHdjlpanB5ODgrSXhsbW9RUnZL?=
 =?utf-8?B?VXgwYjIrRkNsVGNHamNiQkc5SDc2ZExVU3NDdEhaS3BLSVlGcjY4empoSlNR?=
 =?utf-8?B?cUkzanpXWmpjYkZzd2Z2OE5zUlFkK1JRZW9rYVp2SDFXYWVwaU9RODAxYXlT?=
 =?utf-8?B?anlMajVYUUlZajFIdFRhTkRmV2hIUFZEWlNKZ3Y5WnRRVXFnTmRWaDdZU0Vz?=
 =?utf-8?B?NjlLM0wzMDV4SHNIbmp6SE1kT2cvbmszY2EwdHM4V201RVRsT1c0RHA3aEoz?=
 =?utf-8?B?ZEtGc21WVzFwSmN4c25iMnBRZ252Zllrb0F5NTcrWXdva3c3ekljcDFMS0Iy?=
 =?utf-8?B?Z2NaNEt1UzZRMGJQQjNxVzdqeHJFTThiMW9lczBQNDMxV0NPOEoyQlNySVdI?=
 =?utf-8?B?eHNNalVkbE1OeUZwMEQwYkhEVkJQZU1DMEx1UXQ0UFVjb0pON3dFOG5JZ1Q0?=
 =?utf-8?B?ZWJTZlFQTVNtQkJiTDR6TVVWYmwyQ2xuQnlPYjEyMzdpa3VuTFhUYzh2OWFn?=
 =?utf-8?B?VURKdVhzSCtxS2dOMDY3RVdLT21wUmRERTJVd1hGQTZVRFA1TGdyT0VWTVEr?=
 =?utf-8?B?MGJKNGxBQWgrUFphazgxWXJlTlZ4Yi9pQ1E4UkpmZGZaTXRsRk5Fa2l1cFYw?=
 =?utf-8?B?aTZvcDdaZFFoV1o0L1RuMXpDcnQrcmFEWllSTWdDNnNMOXd6TEFEMkxKa1d2?=
 =?utf-8?B?bWpMOUU2YkhQaFFDaitCUlNhU0w5K2V2S01sZktFYW1Fb2ljdk5ncWVhblg2?=
 =?utf-8?B?Z1VXZ1p1YWlkZlEvaS9LT3E3QkZ3SVhNODNaQk4wYzM5eTdITlFGOGZYdFhY?=
 =?utf-8?B?dzl1UUNycU5zT1lWUmtOZm8rL0Y4L21MUzhhb2c3TmFmNHFhOUxxakFkSEo4?=
 =?utf-8?B?QlVzeTNMZ014MDVoeWFqc1pMQzdzNW42UUFZeUM5UTV2eE1XTU9PZnM5aGtv?=
 =?utf-8?B?TlRNbHJXWjYyMG9ibUlIMjRUbmdrbkU3SWt1MTFENmhzamlRZFlrdGVJVGYr?=
 =?utf-8?B?UGVxSHJvdXBoMEt3VTRrMXN4dkNEN3hqWU1xaC94OVlEUklPY2k1T0JqSldn?=
 =?utf-8?Q?Y9IivweqMQOM6Rjal1V1K8te7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef0750dd-0b95-4ebe-c1a6-08dc5f733ec2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 06:46:15.9665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SGH65eWGuKOkKAh7WbK5lVN+x/Zdy53towuLOY6CotaM1gF9kRo9vjBONLEtuBmF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9023
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

Am 18.04.24 um 03:33 schrieb zhiguojiang:
> 在 2024/4/15 19:57, Christian König 写道:
>> [Some people who received this message don't often get email from 
>> christian.koenig@amd.com. Learn why this is important at 
>> https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Am 15.04.24 um 12:35 schrieb zhiguojiang:
>>> 在 2024/4/12 14:39, Christian König 写道:
>>>> [Some people who received this message don't often get email from
>>>> christian.koenig@amd.com. Learn why this is important at
>>>> https://aka.ms/LearnAboutSenderIdentification ]
>>>>
>>>> Am 12.04.24 um 08:19 schrieb zhiguojiang:
>>>>> [SNIP]
>>>>> -> Here task 2220 do epoll again where internally it will get/put 
>>>>> then
>>>>> start to free twice and lead to final crash.
>>>>>
>>>>> Here is the basic flow:
>>>>>
>>>>> 1. Thread A install the dma_buf_fd via dma_buf_export, the fd 
>>>>> refcount
>>>>> is 1
>>>>>
>>>>> 2. Thread A add the fd to epoll list via epoll_ctl(EPOLL_CTL_ADD)
>>>>>
>>>>> 3. After use the dma buf, Thread A close the fd, then here fd 
>>>>> refcount
>>>>> is 0,
>>>>>   and it will run __fput finally to release the file
>>>>
>>>> Stop, that isn't correct.
>>>>
>>>> The fs layer which calls dma_buf_poll() should make sure that the file
>>>> can't go away until the function returns.
>>>>
>>>> Then inside dma_buf_poll() we add another reference to the file while
>>>> installing the callback:
>>>>
>>>>                         /* Paired with fput in dma_buf_poll_cb */
>>>>                         get_file(dmabuf->file);
>>> Hi,
>>>
>>> The problem may just occurred here.
>>>
>>> Is it possible file reference count already decreased to 0 and fput
>>> already being in progressing just before calling
>>> get_file(dmabuf->file) in dma_buf_poll()?
>>
>> No, exactly that isn't possible.
>>
>> If a function gets a dma_buf pointer or even more general any reference
>> counted pointer which has already decreased to 0 then that is a major
>> bug in the caller of that function.
>>
>> BTW: It's completely illegal to work around such issues by using
>> file_count() or RCU functions. So when you suggest stuff like that it
>> will immediately face rejection.
>>
>> Regards,
>> Christian.
> Hi,
>
> Thanks for your kind comment.
>
> 'If a function gets a dma_buf pointer or even more general any reference
>
> counted pointer which has already decreased to 0 then that is a major
>
> bug in the caller of that function.'
>
> According to the issue log, we can see the dma buf file close and 
> epoll operation running in parallel.
>
> Apparently at the moment caller calls epoll, although another task 
> caller already called close on the same fd, but this fd was still in 
> progress to close, so fd is still valid, thus no EBADF returned to 
> caller.

No, exactly that can't happen either.

As far as I can see the EPOLL holds a reference to the files it 
contains. So it is perfectly valid to add the file descriptor to EPOLL 
and then close it.

In this case the file won't be closed, but be kept alive by it's 
reference in the EPOLL file descriptor.

>
> Then the two task contexts operate on same dma buf fd(one is close, 
> another is epoll) in kernel space.
>
> Please kindly help to comment whether above scenario is possible.
>
> If there is some bug in the caller logic, Can u help to point it out? :)

Well what could be is that the EPOLL implementation is broken somehow, 
but I have really doubts on that.

As I said before the most likely explanation is that you have a broken 
device driver which messes up the DMA-buf file reference count somehow.

Regards,
Christian.

>
> Regards,
> Zhiguo
>>
>>>
>>>>
>>>> This reference is only dropped after the callback is completed in
>>>> dma_buf_poll_cb():
>>>>
>>>>         /* Paired with get_file in dma_buf_poll */
>>>>         fput(dmabuf->file);
>>>>
>>>> So your explanation for the issue just seems to be incorrect.
>>>>
>>>>>
>>>>> 4. Here Thread A not do epoll_ctl(EPOLL_CTL_DEL) manunally, so it
>>>>> still resides in one epoll_list.
>>>>>   Although __fput will call eventpoll_release to remove the file from
>>>>> binded epoll list,
>>>>>   but it has small time window where Thread B jumps in.
>>>>
>>>> Well if that is really the case then that would then be a bug in
>>>> epoll_ctl().
>>>>
>>>>>
>>>>> 5. During the small window, Thread B do the poll action for
>>>>> dma_buf_fd, where it will fget/fput for the file,
>>>>>   this means the fd refcount will be 0 -> 1 -> 0, and it will call
>>>>> __fput again.
>>>>>   This will lead to __fput twice for the same file.
>>>>>
>>>>> 6. So the potenial fix is use get_file_rcu which to check if file
>>>>> refcount already zero which means under free.
>>>>>   If so, we just return and no need to do the dma_buf_poll.
>>>>
>>>> Well to say it bluntly as far as I can see this suggestion is 
>>>> completely
>>>> nonsense.
>>>>
>>>> When the reference to the file goes away while dma_buf_poll() is
>>>> executed then that's a massive bug in the caller of that function.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Here is the race condition:
>>>>>
>>>>> Thread A Thread B
>>>>> dma_buf_export
>>>>> fd_refcount is 1
>>>>> epoll_ctl(EPOLL_ADD)
>>>>> add dma_buf_fd to epoll list
>>>>> close(dma_buf_fd)
>>>>> fd_refcount is 0
>>>>> __fput
>>>>> dma_buf_poll
>>>>> fget
>>>>> fput
>>>>> fd_refcount is zero again
>>>>>
>>>>> Thanks
>>>>>
>>>>
>>>
>>
>

