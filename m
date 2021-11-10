Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0B744BC1D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 08:29:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C746FF21;
	Wed, 10 Nov 2021 07:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376DD6FF21;
 Wed, 10 Nov 2021 07:29:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcUNZickBioDEhR8apvio7SeLw64jVN12Iebf8wNTj52qlpBjxXi30CbxpTYm0HcdZ9cIWTnLIJHnbTj2rE7N+to4/2JeSnqWGBwiZRcAvhK4T1JjkkHMT58E8TTUXz2JQ5vvNKmFiHFZ7OJa6Cu1zPiAKIlM2SP9C8aNn/3554vnAO5NBVEniSGvIf8f9YDdUOgp5Q04/j/D8a5gpkTpz5X18nSrEqobfvmvEvcxGafcITN8xvbKcPIAQPK8sj5rqrfh+Iwv+CCwTKHZpN5whAJ0kn2yGasE5i0nk/hbLi1woSE1oXDY7bXH1O544Fd7we7s4IMVWgz6nKW8jQT6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GBBstL0DSL4sYoGnI2XxYUSrrBPDB/XHt8R6vs5dzI=;
 b=OrQ2FTGutXqvfnFZIBb8Wnq2+0VeeyuAx1y+lfoRtQbHy1r4KWQPlOjgzoRodSuuLXuOE4IRPcgSjIdIs8oH8y17o9GI8J0YssxRltxRrdwGb9K8ZlaBMUb0gXN9YQROr/Fu2SHkTPClndpOryynLm2Ol8PQX26FXfIhhQ1l7+nw1yCByscrHUjd08QDahN//FZNrne00eSNEx30TWZaZ37PJ4LeiT9z/jLOqmZ+rfDK7m94lz+hsnSygttW+0tND+Ud2luRM34zd3ksuIh/XfIByo2kj1gA8RvtnnXa8GkfUIt5jIwNOFStJhQR1crrEAyvkxqJaHwI+una167UCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GBBstL0DSL4sYoGnI2XxYUSrrBPDB/XHt8R6vs5dzI=;
 b=d/qUe7B3YjgjLQAMptWRPdJkbYloJ7EhT14WRL3Vdopkygolxvg2stkAZJQ6Hvr93EQ7YEJPq2ALHjsyxXIflAuunARLnhnnPF9ouFk1DWko0K4n080dKl7HCfzwKDrAD8Sqfz0cDNjqBJpYkgoHd7KuOwjD+B1Vw5aFNUdkAII=
Authentication-Results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4457.namprd12.prod.outlook.com
 (2603:10b6:303:2e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 10 Nov
 2021 07:29:37 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 07:29:36 +0000
Subject: Re: [PATCH 1/3] drm/msm/hdmi: fix build without CONFIG_COMMON_CLK
To: Jackie Liu <liu.yun@linux.dev>, robdclark@gmail.com, sean@poorly.run,
 airlied@linux.ie
References: <20211110070950.3355597-1-liu.yun@linux.dev>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7389464d-3f1e-d947-9d65-e8636510a3ed@amd.com>
Date: Wed, 10 Nov 2021 08:29:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211110070950.3355597-1-liu.yun@linux.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6PR04CA0055.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::32) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:fa11:45ae:fadf:6269]
 (2a02:908:1252:fb60:fa11:45ae:fadf:6269) by
 AM6PR04CA0055.eurprd04.prod.outlook.com (2603:10a6:20b:f0::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Wed, 10 Nov 2021 07:29:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5eae1ff1-4e88-46c5-2563-08d9a41bd937
X-MS-TrafficTypeDiagnostic: MW3PR12MB4457:
X-Microsoft-Antispam-PRVS: <MW3PR12MB4457B3E3EF1423BAB6A7160883939@MW3PR12MB4457.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sL9wdM/swi8VL55p56RotpC56ZRdeQWx/oi442PG6idqOfqffddLnJkQa3p4KlL25oS2mrY/z2e1534qQNQGXa+3LoVw+22GhkOnaesr07tfOdCOV6k6wK3rtOlk0dDQ7LAXmLA4LmcsBALaEaftZnhv9UaxGNsnbwLS8vlkxM44fD5Z1Yi2ki5eEUJUMbgwXoW8gP85OatuEF2itkIgbl+xmigjGB3MsP87i9pPNWiVKUL83d7KQSrMHsAkzLx1puJr4jHA8npAaSuNrxVRuF+NlRtDSCApsPhbESKg8tyMLqT4pqjJT43wN1EmdYRrrV+TTtjTovJVn+8ZHyYofuS5f7NQlYY786u3XLHtRfCWQ+2V7OmOkJaU9LEblpFExSurU4TBd7Gd5RbiTGfU9GhORkyJFtLeoXHWR5sVZWkkzo8dwXAG/hXr168QZy3sURfiQMEZkGKy6dno6kG4UYvQVbgccflKUJp8xvXV9NVlLCgmHb/Kf3ZJedQPRjnzMy9+WwzrbzOKy0vEQ5ML55jPT+Dhby6/oYtfy73nZI7zW1pZS2pbuRCMaprrGCG6m0IlboZPr5AaHGsqyVNjT45LWlazcGqNf90qYCOqYRDVNklYFrQTd6PmpoTMurXRp2pkqyDvf0cJiQZiuuQ9nmdZqR1ZO8X44T7MoTlNiLX+eX4KZ646tBUlax1dgnxER2PfiPe2vEBc7TzxlVXVkMJJS3KAfFDTBrY5J4VmVCiuIp1fzoWGwZotggJ1XU37
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(86362001)(66946007)(508600001)(66476007)(186003)(5660300002)(6486002)(66556008)(316002)(31696002)(2616005)(31686004)(8676002)(8936002)(2906002)(4326008)(36756003)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmJrNS9KbkVzY09rMXlTank0RTFkNzM1aHY3NkVrNzlKRjBOd08xMjJEY2VV?=
 =?utf-8?B?aEdGRTdPdTFPQWg4MXVsMGhJZFBHdW4xWjFuMkdqdjB4MDNTd3dlQjRwSGkw?=
 =?utf-8?B?TWkzaXE1RG0wMjZ4MWtGeDhVRkJHcjBVMTFHWThab0FiMEVOR2V4b1gwT1lI?=
 =?utf-8?B?UHNNZEJqaTY3bFZwc3kyRmhlcWxRbGVkRytNU29nZFpjWkVBS3VnV1pOdVZn?=
 =?utf-8?B?eFg0THlEVnVjNEx6U1ozQUF3REt3RU9BUGZURUlkM3QvN1FMOVp4WmE4UFUy?=
 =?utf-8?B?UllrUHZ0YVhCVGExdGhjNkRtYkwreURmNUJ0SEdicFIxWW9rYlVQWEVRTlRB?=
 =?utf-8?B?THRYV2Y1dHZUYUVidkRwbVpiU0JFbmhzWG50Z0lBS0JjZjA2UmVkN1pIcVR1?=
 =?utf-8?B?ZGZQclIwZXA4cVBKRmFKcUEzL05JcjNIZHRVMzdBdHRLZmtmdnBERDU2L3lj?=
 =?utf-8?B?UWtMaCtQYy9uVnlzMHZFdnhSSWhDUzhRSERLYUdJbndpUG90ZVJ1c2hwOVZJ?=
 =?utf-8?B?WFp5eENHUnFacG9EbVJmZTZwRHRrMWlLMjM3WVNWVlRoYmh0eTdYLzZYektH?=
 =?utf-8?B?WmJTdUFEYjErN0VPUFdWa2dYa213eSswenk1US9OYmY4OFZYeHJUSTRVWXlB?=
 =?utf-8?B?TjVIMDZmdFdFcjZ2UnBVVzdMMmlPQnZLV050RnFDVjgwOTRzQWV0NkwvZkIx?=
 =?utf-8?B?VTYwRWl1empGR1crODNMSHhxamxWcGV1NEtSM1J0SVlxc0MyS1hVYnQrSGN2?=
 =?utf-8?B?eXEwckdqZDJ5T2c2TzZiZ20yaC9JUVh1Q0hoVXYzRXhVZzNJNmYrblVxVDJD?=
 =?utf-8?B?dng5RFVHVVQ3VzBhVWdOYitiS3VFWFRwNCtsUTdDejMxWjBMaklRNFg3V0wy?=
 =?utf-8?B?amJoQmtoc2VrbTZlQzV0OSszbkJGdm9RVWJEZm4rcHRPUTk5TW1MNU5WWjZN?=
 =?utf-8?B?cVk4VEk3RExybG4waWhIUXVTOG1KbHZMdU56cnNHUXY5U2M2U2RRU2hMK3Z2?=
 =?utf-8?B?SGlKMjcxRk1xY1JIV2krVWJuMG13czh3K3JFQjlmMVdReDZEV2cwMy8wMVVj?=
 =?utf-8?B?WHNTemdTSm0vdGtNaVhrZTBybWQwUyswWjhDMUYyb0pzZEVWYU92WHBob2tz?=
 =?utf-8?B?ZWwwaW5OeHFZNHBVMG9GMHpnZjIyQ1FYVkVmT2ZVWkcrYmRxc1dyV2tyU0Jw?=
 =?utf-8?B?QUlnc3c3YW0zdkw4M1ViMEM5b0VmTER0U084RFZ4UE5tVGtZMk9HcS9tdXNB?=
 =?utf-8?B?aDFRbFhjQVQ3eVFsaGw4c3F5aWsrM1FnVjl5TkRRQVZvblg0cTcrLzN4azNV?=
 =?utf-8?B?RUlORG9aME1KS1NqT3Y3L3pDNVFoU3p2cnpNTjU2QklycG9iMVJjZWpRdG5W?=
 =?utf-8?B?RENLS0NENlFLVGQ4aTNBK0hJVmFZQmxzN0F2S3ZvOFNicE5sRVF1bWNQVGdY?=
 =?utf-8?B?cHJpVkhVYzJ3V1F2UDhNcFBjTkI0RzllbnZjV3NiZEoveVBjbllldlI0amVl?=
 =?utf-8?B?eW04UUdmc01PQWhWZWhSemtkNllCWi9HUnEvTlZqZUJRQ2hIeE1lK3dRM1Uw?=
 =?utf-8?B?Nm5FQk9SZjd0YXVEWnQ1NTVZb3kwVGtJQW1PaWdNUnczWk43TmJoM3g1emwx?=
 =?utf-8?B?ekhJdjFPL3dUelZnVjVJbjZGVnhCckJMM3Bvc3AwNkdBaUlqY0dtcmlsamNM?=
 =?utf-8?B?K29oMVIwcEp2RG9jMllsUmpGYzlYTnRzOEVlNzZXbWgvbURyaTJ1VldmTXc1?=
 =?utf-8?B?SlgvZ1lBM1AwdTZ2Q0NReW96UGVvN2JlM0JYTTRtWUpQNEMxaWY1cDFrVVVY?=
 =?utf-8?B?MjY1aG5kR054TWU4QXFxbFkySVo1OVExV0ZTQ2FJWG45TWxmRU5mUFAwVkR2?=
 =?utf-8?B?QUtUbDQwWk5PRWgvQVNJSzJOUmMrVjZaSmQwbXpiMW9iMStzYWV3NEExbGds?=
 =?utf-8?B?OFdGTmZISTVjek5lSHl6Q2JUTklvYjhwenRlMzdFL0F6M2JCd2ZyREhyNGd5?=
 =?utf-8?B?Vy8zdmlneXZrVTJjUU9WZnlMZDJFbUFtbEwzY2M0MDlLa0JRakdLUGFnTWpo?=
 =?utf-8?B?M29ZYWZPd0Z3aU1FWm1BdmJzWThiSFBPaGpFaG5TYzFJMDlJT1d0ZEV1Z1E1?=
 =?utf-8?B?eXU3eHVoMkNEeVNKWkl2ZHRROXJNK294WndZK1ZyaVJ2NFhpcjdUK1FEQ0tm?=
 =?utf-8?Q?ZTQYDktlBPzBS6x1urJd2oY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eae1ff1-4e88-46c5-2563-08d9a41bd937
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 07:29:36.7047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mqktocryNnZxANtyhWcD44yTtLzdesxBcuLtahq1lIBZNtuxe4+1+rzGBwUTgxE/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4457
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
Cc: architt@codeaurora.org, freedreno@lists.freedesktop.org,
 chandanu@codeaurora.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.11.21 um 08:09 schrieb Jackie Liu:
> From: Jackie Liu <liuyun01@kylinos.cn>
>
> HDMI 8996 PHY/PLL support need common clk. avoid like:
>
> [...]
> x86_64-linux-gnu-ld: drivers/gpu/drm/msm/hdmi/hdmi_phy.o:(.rodata+0x3e0): undefined reference to `msm_hdmi_phy_8996_cfg'
>
> Fixes: e17afdceb4f2 ("drm/msm/hdmi: HDMI 8996 PHY/PLL support")
> Reported-by: kernelbot <kernel-bot@kylinos.cn>
> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>

Since it is probably my fault that you stumbled over all that stuff here 
is an "Acked-by: Christian König <christian.koenig@amd.com>" for the 
full series.

But you certainly also need to maintainers or Dave/Daniel take a look.

Regards,
Christian.

> ---
>   drivers/gpu/drm/msm/hdmi/hdmi_phy.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> index 16b0e8836d27..84d7f79f1aa8 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> @@ -192,8 +192,10 @@ static const struct of_device_id msm_hdmi_phy_dt_match[] = {
>   	  .data = &msm_hdmi_phy_8x74_cfg },
>   	{ .compatible = "qcom,hdmi-phy-8084",
>   	  .data = &msm_hdmi_phy_8x74_cfg },
> +#ifdef CONFIG_COMMON_CLK
>   	{ .compatible = "qcom,hdmi-phy-8996",
>   	  .data = &msm_hdmi_phy_8996_cfg },
> +#endif
>   	{}
>   };
>   

