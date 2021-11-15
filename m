Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EA6450908
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 16:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267746E8B3;
	Mon, 15 Nov 2021 15:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AC46E1B5;
 Mon, 15 Nov 2021 15:56:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6I2azK+yep7yDssOJJA7cgrguESrjZtbEv61D8qa2ePRJR/+pJgDyvfml9eYobi55hMVTy1+5UTWAgxantVq10W0q+/I6Z5ek9KFy1+isBA2AsbyH7rv1JnuP/8y3752Fay0sXVWWG/eoVgnUiIUpuWCUofPNQAe6bORdtih/JzVuDg+zUX+ZZoGkn/5y9ZiHbo66Z9p5NCYAJolBoJSjUVtyiEFasRvNGvzIic3NLqoDp4Gf/6T6/1QIy/GrbLP6fezr6N3a2DA0AOX84GeAMs0w2vhSGbhv06nHq4qYJXFnARlQ/E8CeC4CQ9SGMqAAmYktp0cjEjlyYzfTsudQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yyGN9muCCrM1WEjjpUlrbqWcMKwGyBn0yBFvHGyI6w=;
 b=ijhuSDhEVpqqIDeF/3lBc+v7NCu227sGOLPm69CC7xi/YmtGv1kSlfJ4IveLQDoto4zeinbc1riN5pKqBRuOavekaAnG4kD+Rr4XwnvyJ4qSpb3quLAqPjXifAkkoU9PsFvZz11gma075Dw7AtvRZSa2snTnBm8LmX3BT0Ze/8S/PWhZPGXUwIc7LvUBwpmS8X+LhtbiTIFICwiG6p7qsq6Z8QCVbQZjHXcieP2xQAld6N/Y+viXnnJgxNTTNC5UAcaa68SgMihkLyjWT/6IYqFsNWCMHVnPIxHDIIfKb/NiQRtpk3Yesd1Tz0DIef7kki1iSP3xGr7LtlCycfSpfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yyGN9muCCrM1WEjjpUlrbqWcMKwGyBn0yBFvHGyI6w=;
 b=hBziqlBZpZriO1CFCi5ZOOg6NjdwxjjMxh7HrbjD7RmVHr1b3lwxXOgN62Htu7YVwYtn3ZbREPVsycet+9QA42RoZfWEJFbf6gcTmNKYyYkBh0BIISGu/80+aWN6K/GT+eQFPJ7Wt31FwPAFJU4AiRIRNWDTj42ZSKRpF5ivRB8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5112.namprd12.prod.outlook.com (2603:10b6:208:316::16)
 by BL1PR12MB5238.namprd12.prod.outlook.com (2603:10b6:208:31e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 15:56:31 +0000
Received: from BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::b077:a0b3:ec59:19f3]) by BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::b077:a0b3:ec59:19f3%3]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 15:56:31 +0000
Subject: Re: [PATCH] drm/amd/amdgpu: fix potential memleak
To: Bernard Zhao <bernard@vivo.com>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>, John Clements
 <john.clements@amd.com>, Jonathan Kim <jonathan.kim@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Evan Quan <evan.quan@amd.com>, shaoyunl <shaoyun.liu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20211115025901.2598-1-bernard@vivo.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <50ed4525-dbe6-1eac-5b83-4233a18a6176@amd.com>
Date: Mon, 15 Nov 2021 10:56:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211115025901.2598-1-bernard@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::23) To BL1PR12MB5112.namprd12.prod.outlook.com
 (2603:10b6:208:316::16)
MIME-Version: 1.0
Received: from [192.168.2.100] (142.118.126.231) by
 YTXPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.25 via Frontend Transport; Mon, 15 Nov 2021 15:56:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3a6bd07-f129-4ee2-bde4-08d9a8507d47
X-MS-TrafficTypeDiagnostic: BL1PR12MB5238:
X-Microsoft-Antispam-PRVS: <BL1PR12MB523815EF12E3D3EE37BBCE1D92989@BL1PR12MB5238.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eWFVFbzd4nOfspFXJyzOLE13Ht+/u7kUfuE/BJ5d4b/U5ZuVtgfl8pOrWbOYJvi6//6s4jkIBLaXEnfeAG0dOKRQUB5JBKXygjvvWpzo867rcagGvMOL5cBsovN2VDuGuyfwobz5OEbAU1+uSKS4SHI+USWmKyHQxnVH2gW1QvlLRHhd+e1dDLiBkUQ79Emz8oyuQYAN/t54TEvU8K9lNZ29NrNuItTUye5VNE27pZKl10qbVcovBwCLrKIDEOe6cIPKdO8a/+5eQEwq5Sqr4RpK9WU28wx6fW2RIWGw+N/ZqegWVo7/2tbzEveww8jpFnmQLgVApPLkA7edd5ExY+Hk6k7xa+UPNBMz621XVVkfYdpeHnOk50UjCKLqL0P4J1ZdWInHAx2H0ibaCdFxIfg6iOYm863vmDpSqGCQNFunrVZHwKw9Yj1dFc/lTiNL3F3JX/yNF9xTcMeVg8Lm4s59Q5R+ipwLX6UYJrs6vWVCHIGSL1gTa2GTEbbQjXFMwi+yDEXSuZRIjgDOboL7nGctb/RxZPRMJ7Y9T3abXE3UeIdCpLsoTkniw8opVs+mCSq+Xbx0o+81qRorAmHoZKuB1/QfUAjwSttzfDVaVfDIA8dvYP4hwZc0VDTuyC7Gz/+MwPMU9HPMHs4v7qWtn0pBUkWqZE68UW+vhHhduRrU7zZjS4hCDKXnmZiO4ZOXvf9z7rBIKjGYYJqyxSBZTeFmBwilgiOf1gUSbuzy400CxMQevWau0FRaRRjYtc7A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5112.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(4001150100001)(38100700002)(6486002)(2616005)(26005)(86362001)(4744005)(316002)(956004)(31686004)(186003)(44832011)(5660300002)(16576012)(921005)(508600001)(110136005)(66476007)(36756003)(66556008)(31696002)(66946007)(8676002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2o4R1FYS3A0SzFXVUlVVE0yN3dUTi9WR0FpU2dHWml1aEJVYng4U2s3QWFK?=
 =?utf-8?B?eFFUVlM3UlVycTNoa0lIV1o1V2szemJVSXRJWnprZGFmU1ZEamlObHhqN0NL?=
 =?utf-8?B?dHJVV0ZyWFdCOTdvU0t4Vm5uTmM5NC9lYUMyb0xJN2FpVSs0VmpLMm5iR01T?=
 =?utf-8?B?TDNycWEwbHlmVVArc0FwQ0U2UW95ZzMyL1l3bHcyQnI4SE9tekpnOVR5cG1J?=
 =?utf-8?B?R0pMSWxlbmg1dGdSS01HUk81elVBc0JVbVVvcDE5NFFIdzdaUXdza3RoTStF?=
 =?utf-8?B?clZrcEZ2dEYzNWFlcmV1VFpHZUlqNDE5T1VVWjU1QlV6dk5jaEFMR0NyelQz?=
 =?utf-8?B?ZGR1Yzh0anJTSk5ET1FPbnJVS2x3QjNDalU5R2luRU5PSFZtUG1KdkFQelRS?=
 =?utf-8?B?bGNyekl6alVTbDJNTWR0N1RaSG52Vy9GM1RuY2VvSnRQT1hXTjhxTnlxSGdi?=
 =?utf-8?B?N29xWE01djNiRllOa0V5M3JMTElGWlkyY2Mwdzd4M3B4TFNvemp2Qk9RWGZu?=
 =?utf-8?B?M3dBakdHdk9Rd1JxS3FockFodjZVeWY1T1JDd3hPdzkyYWZwUTVsNDVscjBx?=
 =?utf-8?B?ZHk5NjhjSGhxaVNHaFU5b1E5VVU5Mit2V21OWlVOMlloYnJvMEM4U093SUU2?=
 =?utf-8?B?bGNreGgxWTFQS3Y2R3BTSnhhcFh5Rkp4TFZPODhIOUFqTTZMemZrMWptUUlT?=
 =?utf-8?B?UnQyUGJSdFJkMnZVczFaTUJ5Ly9qUStPeXZUMzc3eW5Pc2ZZMCtJdGtDSG1E?=
 =?utf-8?B?SXJybUZsVWNHdmtOU2xKdWxWSlRCVWpZQWRHQWZSUHV3UjJLTlJhTXRQc1Bx?=
 =?utf-8?B?OE9YUEZFSFhIYlh1alZSdXhId0U3aHpRa0t3aEQrTVM2dXZYK3BoclMyYnlL?=
 =?utf-8?B?MFZkL09yZmFlemdXS255R3R1MVBlaWg1dTltWlJoQUFUbjFaakl1WUtWbm1m?=
 =?utf-8?B?TjQwazNKQ2YzSzZqQ1BubUNZcHE2azVxNEsySlJ3TktYZk4xbjI2Rjh2MHVm?=
 =?utf-8?B?bzJJQXc1Z0huQ2hoWmJuL2VFYVQ5ZFhVKzdheTd2eTZiblA2c2w4VTB6SWsv?=
 =?utf-8?B?SmR5UmR0bCs0VW8rbDNQcS9yOEU5bEtZN0x1Nmg5bnF5UEduek55NStHSXVq?=
 =?utf-8?B?MXRnbnBjOXJQc0dENDRZTzBvc3R3d2hWK0dhWUdYOVlkR3hxWjU3MDNQNlli?=
 =?utf-8?B?Z0J3Zm1tbjVIZWE4NEpNdWVRWENWM1lqZWZUVDJDYXZKZ3NlVDZCWTFZV1Zt?=
 =?utf-8?B?TDA1R3kvbmlkZzZINkE1bjQwZm5vZnJhK1JCbTdFRlJGS0tOSVR3eUlBbjZ3?=
 =?utf-8?B?TjFsTW1uZ2c1Q0xtY0ZucjVrTGxLOU5zbVNmbmlPeGcwOGVsMnhnUXlxVjRm?=
 =?utf-8?B?ckZiUGFRaklzYXk0RUZTRktBU0hGbEdkSlhvZnZkNmpxUTdVZVhsS1Jid3RB?=
 =?utf-8?B?c0xmNTQ3ZXRDdWF1K0ZQMHdCT1p1UjZEQ291UlZvekcyWWN3TDAwRmVEcHk1?=
 =?utf-8?B?enFsRWRxdGhHbGlyOVFEVTdNSU5rNG5BN0J6NitaYVZXMkIzRHYwU0hCYUY3?=
 =?utf-8?B?elNIbDQyaWVOMzc2VkFraXRNZzJwekgvZ21UUkVMQnNQbFdHNDBXcWdBcFlV?=
 =?utf-8?B?NUpVb1BGZWxCRzdnQXVsV2txckhCWnZrWXlqblUxVG1lMWEvWkUrSEpXYktL?=
 =?utf-8?B?NUtYaElYN3lRcjJUb1R2T2lnUGFCTUJqNjd6dnVUVWtYVjlsTWhXQklFR1k3?=
 =?utf-8?B?Nk1EZWVMaTl1MlQ2YnlPMnc2bVhoMkRSa0pNd1U4Z0hwTFlrbHBiYXVndVhL?=
 =?utf-8?B?SjRya1pHUmlGZnkyV1NWWkphUWJQMDhpcnBNbUhnd3ZVdWsvN1cwbC9Oc2dC?=
 =?utf-8?B?YXk2WmFYVGpSczUzdWNDUHhXT09rRWtLQTgwbkRGcytHMWV2eVVrWmRHRzVL?=
 =?utf-8?B?S21obHpUVHlFa0xmeHMrN003K1JhM0htaEVPdVZMeG05SlJ5RHhhdzJra0Uv?=
 =?utf-8?B?RDZsaXNVK0EvVmR6MjQ0ZXc1bUFyclJrL2FJdkJ6TXJrYWdNVXJRNUZtdnhI?=
 =?utf-8?B?YjhpTHdNdC83ZUZ1Wm5ad2ZKKzJMZW85MzNENjhYNEt2S0cyZzBlN2crandU?=
 =?utf-8?B?c0VDUGVZZGptK0JFc1lseDBnTCtoTk9oZ1ZaOW9uQ2NNS1RXb0Fkd1UyQUMy?=
 =?utf-8?Q?oJEnN+xWT2APba9QqB6IOdY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a6bd07-f129-4ee2-bde4-08d9a8507d47
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5112.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 15:56:30.8303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3bqrN+Ncj2ka72raF3UFhcvSQsjCmbmkaC9WemhCQ/0fSfTLNJ+KqiFFWz+J+UIoO55VDuKg/yA+/59TBUVuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5238
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

Am 2021-11-14 um 9:58 p.m. schrieb Bernard Zhao:
> In function amdgpu_get_xgmi_hive, when kobject_init_and_add failed
> There is a potential memleak if not call kobject_put.
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> index 0fad2bf854ae..567df2db23ac 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> @@ -386,6 +386,7 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
>  			"%s", "xgmi_hive_info");
>  	if (ret) {
>  		dev_err(adev->dev, "XGMI: failed initializing kobject for xgmi hive\n");
> +		kobject_put(&hive->kobj);
>  		kfree(hive);
>  		hive = NULL;
>  		goto pro_end;
