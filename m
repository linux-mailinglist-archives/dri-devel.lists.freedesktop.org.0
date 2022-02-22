Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9DF4BF746
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 12:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52B410EBCE;
	Tue, 22 Feb 2022 11:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2085.outbound.protection.outlook.com [40.107.102.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EBD10EBCE
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 11:32:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gx8o1vlZNjoztZAiCh9HSylqOQxWdNlTB2ot/gjGGQZWHyaLUd7F4VWSKM/avaqYnwMrM4XIAl5J/5NEBNSzbiMqWAhJu5VX465VVuJH87QxEAqJ8XpkTNkQoUzcJxea3B6pJKl/qjHJfA2LUSv7oYlskNrWAJlpAPM5Pfht5TawbkW/cBXk+K3OUektd64lcQTHIPrx+osX1EdgdPwbk+vWYsTv42Sb+vwH3B/Ls/6Lu/Irt6atps7EWRkBO80ZT4PTaRchIHS1QY2zr2gDiMjgG03Ov3G5CsN3tGD73mB8aIsMqjhCNFPbKZOh421PGUboR0gXcqeh+85yiE8waw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kisqmumth/N9IQJTHlg1ARrd4zjM7DkfbO4F3169omU=;
 b=DhS8DeAFy3T5bqva4+1jbeYucEQMtZYAUF/QGt73MFDYiS/Jhuq8UxpOWp6F/KKnxd0Je8WDqzfg0q2F/ajwdIYYwHEKSpbaTkQXJD3PyQaFZtLBOUcGmi11mfuufgxQJXmDlt4VHguCi1v7tMF+qMrDRz/J3kzVpsdvs0aFcRQ+fJgilsv6hx11Y+rECLr6gNn4YeTaoMxeXk6YYW39mKlhOQdkU3Am/yX2ff9AYqFQY3e4InBJQoe64T0UJv1SnyD32kCZUGCitB1Pkdhi9neC/T1NMfoMJAQHG0XPdv0JYqNtmMK9QxVjcFzXGm9diUj1ssW+o1rYwqIvLY2yyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kisqmumth/N9IQJTHlg1ARrd4zjM7DkfbO4F3169omU=;
 b=CPXvoTCww9nmkHQgOwtq4UE2fOJ3H6xXiZiIJ+yJ4l//svKt5loXXKiRoETSF/wVB5S9NoyJ3sx1k32I/4o8xtzSPa58gokPzXps9i5wrlGljBnn781swsQttt9hT46nOzRZiVzWWiR26pue1RDcCF1FVn/6AgCq/zUl3qPGVXk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB3033.namprd12.prod.outlook.com (2603:10b6:5:11e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Tue, 22 Feb
 2022 11:31:58 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.5017.022; Tue, 22 Feb 2022
 11:31:58 +0000
Message-ID: <e867e419-fa9f-e67f-bbfb-5261874c9d29@amd.com>
Date: Tue, 22 Feb 2022 12:31:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] dma-buf: check the return value of kstrdup()
Content-Language: en-US
To: xkernel.wang@foxmail.com, sumit.semwal@linaro.org
References: <tencent_22C6C2E595DEFED1417A98A5736539482809@qq.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <tencent_22C6C2E595DEFED1417A98A5736539482809@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0087.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35bbb069-8481-4002-b1a0-08d9f5f6ef7a
X-MS-TrafficTypeDiagnostic: DM6PR12MB3033:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB303351E3617590C86FD1F63F833B9@DM6PR12MB3033.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iHyPGgGwWzeKt6EcICs1dqybLpPo2uX/r7zzBjGghuc9COT3OkcTSBW9o30OojVkTmJ9FLGCGw95KueIEulA/fiS37nmreNLSQPXydzHNpc17oEaPafEPE1QQHlk9xz9LSqZr/BvybPak23qvH6g+gMIr9ETLM00hazJ8no6X7Kx8PVhpqW3QmGLGK5Wwr7mt+cSOX2SqJsJkx52B2ILwSx/tQwq4fWFWK+Z7SHWXlADBb7NRbpixETjLTjiif+XlNDNSuklYq/F92cM2JC1Lwf6fFGqLFMl6BjPh/6jz7eclENFoLTFYMrdUFwjAdHaHmVQsdPsYXI6Jsh+ZZdMej4YUoxhYVQMVwT3g8Qp+XTmQUO5BfHyb7ASdgF2VVuoCFDxk8SDKjoNA0l5p3TKN/dXGly/EOcSV07g3OMf/0s44op6rQNOrYy1OJX8IrZwpE7Tn7mEDsHQULyDLyN6MynaeZZu90rdDeUZ85P+EohEaN3E84DfXreFh5fs/4Uvxs9DHd4RvNRqYIfhcQ/9RKYDcbt6LQ6/cOp003GJ35iHVIklt9jobm8pzT1xkkPrFLvrOmfomwlSxqg3xPcfzxcyhfMNLrbqIm/hI2U3rq2BiyCXy54lQRRnORcSVC3C8YJI7zcye3Iw2jDaHz0kLyKkbB9wKeSDgEOVEtCNwjWVqmcAzr7BE2HFP5EHEKwg50ihuml8MC7T3HtYTVBVzn4BX3lnXRkQueLDc6IS4nYKf0hFNVB/BrRhtHDPQraenx8eWIGzfBhf+z2J4sqTeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(66946007)(6512007)(66556008)(6506007)(2616005)(6486002)(31696002)(6666004)(86362001)(66476007)(508600001)(316002)(8676002)(83380400001)(4326008)(38100700002)(66574015)(5660300002)(31686004)(2906002)(8936002)(36756003)(4744005)(48020200001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTNndUp1a0FqRWlXZUsxV0tYRFJsZzF1R1lmeWlVWXZjWlJpalZCSndTeXJW?=
 =?utf-8?B?cGUvaCtDNEYzRk4xdmdsdTQ0WU9uLzlYeHZ2VkRwUkM3aDNTTUcrQU9yN25t?=
 =?utf-8?B?N0hTU2FqR1JKSjBBRGVyRVBBSjFRYXJOL2l1UkRjOWtGVDd4UDZoNVRKdzNE?=
 =?utf-8?B?Sm5qUDJibElwenZNM0VGaTI5NjBNemtDVXk5djlVdGViTFFsTDFqeXR3NFhP?=
 =?utf-8?B?U3IydHQvMlhwaTlqL3JJdHBDZUlOcisrczRTQ0VlV3dndU83enZiZ0VLRk9v?=
 =?utf-8?B?eUNkZnptS010NW1oVFJ3eWJwK3JDWTBiUkxnaHgvU2JqdzFmOUV0ckIrQmx4?=
 =?utf-8?B?N09xRjB2V3ZCRmpOSThKekZQUHBQY2ttMFlUWVdZZGFrUlVtNXR3U25HM3JR?=
 =?utf-8?B?L2NMblE2WDJOT3ZoNjVWZEs2UFpOSWRUV2J2OHRFeTNCMG5DdGZCRUlxQ2xC?=
 =?utf-8?B?aDlrQ3NtVHYxcWpxSmcxUDB5M3RaSnV1OXZWdDU2c2RnbWtDNUY3MWhJaHg3?=
 =?utf-8?B?aGdtRklhY3paZjlTS1p4OTR3RTFwS0U1RzVkdUZ4YUF1ZndEZURCR3lVRnV4?=
 =?utf-8?B?eGZpS2kySTNvZVF2cE1tTWRXYU1JcDVrWmR6aUV1NVNJTjB6K0h5ZUJkWHBr?=
 =?utf-8?B?WmYrQ01sNHM1VlVTMm9JVG9NM1g0SlFvVDFlWk16S0YxTHB2d0ZmajI1QVlD?=
 =?utf-8?B?dUNwOUMvUjdlRGdEWHE4NVRzUU1lNStqL1g4eDYwMGxNcitmZzN5VS80ZTJt?=
 =?utf-8?B?UEx5Qms3dGU3OGVXZ000ZXp5Z2RDbm8wRGlzdWdESGltaW1TWWQxWlViR25m?=
 =?utf-8?B?SDd1c1hEelY2TkpNQVR6R0hBbkFwb3F5OGp2YjJSQWZZQU5JSWFnWnIxYzl0?=
 =?utf-8?B?RHlPWlVyWElvb2krM3FPQ3Fid2xLeHN5UnhtSTF4VzdCSkVSaitIakVoMnlS?=
 =?utf-8?B?SmRROUQwSTFvNlJmeUs1cUw3blIwOTAva1lRci9jWFBIS1lTbTJnWEpiMU9G?=
 =?utf-8?B?OVE4R0wzam8vTHNjLzUyaC8yMEtWQThMZDBsN0c5eHFER05mcGNRbTFSaWty?=
 =?utf-8?B?Nkx1emtFWnB4Q1BKQVp5OGh0Z0dUdFdSNjUvSWhLWDYxYi94c0FoV2Z5a01w?=
 =?utf-8?B?Q25SRUdjdUxUVWxaUjEvbUZ5SktoOHhic2lrTk1GeDU0M3pUZ0lya0E4QTRF?=
 =?utf-8?B?MGQrSmFCUDR2eXdkWVJQWXdVUUZtcTI3OE0wUkI1MGlBaEUrRWhqSlZudTd6?=
 =?utf-8?B?dGlRbnlWZFQwWGRHUC9JMDF1eFJGbWVCUWhYZW5QbWRLTy9BZms3R2Jwb2FJ?=
 =?utf-8?B?aXpyc0NuZjlNZFhkaVhaYTJHQ3lYZnp0OXlNamdGTlMzeUFVTE5Ja3VuREta?=
 =?utf-8?B?SG1ZMmZBK2xSMjZhM2dUczlHU1dHWDZhcEtiVWNWN0lBMVFvQi9CM2k0d0FI?=
 =?utf-8?B?TWZ2eEhmSGpFaVBJM0V0RE1qYXFHNGw5REN1VkJjOXBuNEhCaTF4VTRnUDhD?=
 =?utf-8?B?RXEzZGc5Q2R0bSsvYVc2ZllPZm42R1A4VE4yRzJlRGpXOG9reU50dmFtK2px?=
 =?utf-8?B?RWwwdjFuU3ZOKzVPeFFySVVDWXpCeWE1bXJBZ2YyUmN2MVhXSmh0V0E2Mkpk?=
 =?utf-8?B?VldnVHEzQTlZdzBHOXRDQ0N1VkdpN2ZZck1sQkllZjA4SlhtcTNiSmJhL0tI?=
 =?utf-8?B?elRmLys4bjB2UnN1VXFncWh2UkhKdHpQa2VuQXlBeFlveWxzelRFSHlqUm5R?=
 =?utf-8?B?YldWaEhnUSs4ZVhFYWNYcWNJYUxiUEJYblFUWG55TWpVUld5eVZGOXpBaXFG?=
 =?utf-8?B?YzRLK1pydEtjblV5ai9TbDNkQkozNjNIQlBzNnRPSUxkTEUxOHN1YmFDWDVT?=
 =?utf-8?B?UVVIN0xrcTByQzRmNDNwUk9YQ29FeWZzMXZpa1JjUmVVL3c5L3FYTFhaVlFz?=
 =?utf-8?B?cG1ZMXlHVEZmbUN3QlhxY0dBRDgwYzN6K09SYktOcDNtYlhJaXBvcVNXZFcr?=
 =?utf-8?B?Wk9EUkJTMVpFVTF2UHpzRmNxc0dHT1NjRkM0NWFwbHZOSlpRYzhKS1ZVemVM?=
 =?utf-8?B?RCtkR0g1SXpqKzArbm9OUlRERzhFclQ5YlFmclZqZktFWFRKM3dkbms5Y200?=
 =?utf-8?B?aCs0TW4xVTdUUkRYREJLTlB5S2JBdEhLQlhld2VBWGI0cmdyNlV0Z1F5eXVW?=
 =?utf-8?Q?0AIJ7IJMpKPP8oeZC85OS54=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35bbb069-8481-4002-b1a0-08d9f5f6ef7a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 11:31:58.0378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6QaA2ZJ9ZvYC3pPbKcQAPTvyC4ICrGoc+D260qw4V3RKMBrdblOl6mrnoYRp0VyN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3033
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 22.02.22 um 12:30 schrieb xkernel.wang@foxmail.com:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
>
> kstrdup() is a memory allocation function which can return NULL when
> some internaly memory errors happen. It is better to check the return
> value of it to prevent further wrong memory access.
>
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/selftest.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/dma-buf/selftest.c b/drivers/dma-buf/selftest.c
> index c60b694..2c29e2a 100644
> --- a/drivers/dma-buf/selftest.c
> +++ b/drivers/dma-buf/selftest.c
> @@ -50,6 +50,9 @@ static bool apply_subtest_filter(const char *caller, const char *name)
>   	bool result = true;
>   
>   	filter = kstrdup(__st_filter, GFP_KERNEL);
> +	if (!filter)
> +		return false;
> +
>   	for (sep = filter; (tok = strsep(&sep, ","));) {
>   		bool allow = true;
>   		char *sl;

