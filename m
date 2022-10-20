Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D1360601A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 14:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B0010ED97;
	Thu, 20 Oct 2022 12:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7268D10ED8B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 12:25:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCPPHSaXMA5Bjk1XDzDsfkoGxJyQVMNLGACS3NHvKl0QJqmAtA7iOILUlTEb4JRPXP7zaKdT0iCIj78HIPr4yhSmZt1UlN7rw7qv3fx+oY5/ZY1FZvhOJ/qK7ejgBYzyfvq4lekGMcHrPcF1CIOo5RkcjIzeou4LirnBbztjH3Leco+lYZlKzmo/ZeqGPn2FIIf16251FsiMr6X4MD4gKnC04ybXGex76NIEzN1dOnuNkHCOXoW3JX0g93jR0+ykLKsJRS674uVX+NlYZB9S4Bnczea0jJAICxtMxg8iZxEQa1gVVAuxYd4RZm931IJh5p8RXdkenyeo1hLzL3ojQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npBryycEAPw6Nhr74MvynXOB6aFpahDpgdMKcKyHBcY=;
 b=FsHJKziteV6spLZyH98/oT6aN8AxjPs/6UAOOrIIu1zrJyaORj7nfRMKyZDWftyhKrYgFeFwlWL97sMmCjE7mn0MsvtJ0nYquTwWYCBO1kYzpSIG1Bda9lYWXpJs5WYRb81zttPvILg60mHkD97qVh8GJeELcYSfRK9TG2AQB4cTkygeIWOhzPAcaKgUfHggP/MB5Ezemtt3nSS3yc0ESTHIU4iaRx3kIE8BEvya69G7r3isBdKVYWKrQq8rhzyWW00QiLMmu7k4QoOSaMj5DVkcPzf3XOoVBRzgtxp3JR/S/+ZJ4gIfNnjGLeqxTlpoUXT83Mop4Rx5mrB11lgg7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npBryycEAPw6Nhr74MvynXOB6aFpahDpgdMKcKyHBcY=;
 b=rTgbVIkwzDIgOFuX+1Mm+AS9ommeQCRJ1Qn1xoTHXNT2fPsVePpr/Fo8qY0E9xG9JFxBJ2Dnd+BQkJVrVJrEyVFo3drGWE/gOt75+7mZLCfzuMYpTjQGr+nz7FW7sC1A3XI50c/5iaXG60cSgH3FOOEX4vlWh24ab/fgvlN3WFRi1dVmBv2PjnSUtWbah7lx+QhEYRZj4p6FP3bPbaGjGX5qoQGZMEjM5K97ci1+e+cZTFkVwA5t44tY5sa31OOajmRKVliE7reFhxrgvzMwx/sAPLSFbsgXjjcq8unXsn5XBogbAPN3iOffK7RAJk2f9OCS2jKKbxubtflC64Ak/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 BY5PR12MB4129.namprd12.prod.outlook.com (2603:10b6:a03:213::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.34; Thu, 20 Oct 2022 12:25:33 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66%5]) with mapi id 15.20.5723.033; Thu, 20 Oct 2022
 12:25:33 +0000
Message-ID: <9b79d517-f242-6619-5f13-eee65f01c57a@nvidia.com>
Date: Thu, 20 Oct 2022 13:25:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] gpu: host1x: Avoid trying to use GART on Tegra20
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, thierry.reding@gmail.com
References: <ee0278cae0443d4ff407d6db38f4d9b33d477e8f.1666200021.git.robin.murphy@arm.com>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <ee0278cae0443d4ff407d6db38f4d9b33d477e8f.1666200021.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0557.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::13) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|BY5PR12MB4129:EE_
X-MS-Office365-Filtering-Correlation-Id: 7efab9cd-971d-49a0-4d8d-08dab2962eda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ALn6AVaAPDqB/JwrwrsSRJBaS68VUGUPIe+FaHFTTS/fzEPJkitBDGZEIJV9MWwtA/ww2lXRsQFlB2Pewa22lujKUMRBM5ojXsk6YIQ+vvErl16HtRlkLgVz26b5UwTtsTPjZm5gfDV52aIJHJA3Pwm3XI1f5NWeccTGyviHeqFlTB8y9CYrRP4yW28RZGwBxa+0ZHt+oLbC0gDWKtK96y+v+dAkBI+5lL6bI0SudDDT3xzN2c39nQMpbMOoRcxE3sWgzkvEEkbVgE1h6HlIuFp8DKIaqdH5rHfozj91+LSgVxbX9VHU2HRorCZW/eIh2BOvz3YAi6Nufj3i6ZS7ich0SGiYn3UlNbA97Yu9LFxOIw98rlto//mppBQEdySaePeEY34u0fAK+jWBgVGNYZM6tBg5XMozFoVClrqZhO4Kb8gQC89KtjV8cBR7E+xjMTml+G6t9H5eIUrQ9HGgUm22tBjq2Cqs7JCRqyma+ryruWXRxf9kQY0TWLKhmIDBBRzNJXaC9a43qxk1Xbxa7/Ksl/h7Nrva6Tf01Lczss18NP4nOj0/wSR+A09akkyiZ2fy62O6J6a+Q6eUcWMTLQ5us5TL63f4WxzlIhSGU1ByaEolZGl2WHZfM1SZPsXoYmjTeMY8fnzosG4nBaq3Z9DPr2UCj9IiqxifCFrxFd82affVYFXqJKAhJ5GPqot3A+NM8lR78MdKQh83+CNr67xNJEDNFeo9DWHe7lzff3nlwrRgP6qPxziHcVuJVyHylZn8ooicMTHsv5BTxHHibWWtt1lYi+v2ckKf9pXMwQimIsOva6EqrPBt8UaspOb301O4vJd5ZnWkuYrsmYKmCTwY1EK+86/aIOY8/q30Cps=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(451199015)(31686004)(478600001)(83380400001)(86362001)(31696002)(6486002)(6512007)(53546011)(26005)(66476007)(66556008)(6666004)(55236004)(8676002)(6506007)(316002)(41300700001)(8936002)(4326008)(36756003)(186003)(2616005)(2906002)(66946007)(5660300002)(38100700002)(32563001)(45980500001)(43740500002)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGNaMkYvSjNaWFJYQkx6NElqemdCRFl3Q2dNaUhnMHRMTHFOSFpKT3ZrcVhS?=
 =?utf-8?B?T21hYmx4NHpGeXh4MFVMTWErWTJIZmtBYzVjOFJTa3FJVzZpU2lWcUJpUnZK?=
 =?utf-8?B?KzZNNnhCMlRWSHBxelRvU1lTdkNtT1JkVDdGVHVmU2dzL0IveUJvZjZ6czI5?=
 =?utf-8?B?Vm0yZGx6cWRrL0xzM0RPOFVIWFQ1T0lvRzBuU1BKejBVU1ZZYUpRWnVJd28v?=
 =?utf-8?B?MmFLekZHNkpKdW82NG1ncnhlTktBS051bEY1ek1UVXgrdmxUNUMzUU5rQzFJ?=
 =?utf-8?B?WE9Rajh1SHNxYkgyejhZd0tBclo2dEJHV3EzQU5nNE94UVlXejExSmlEYktq?=
 =?utf-8?B?Z0pkcUdtT1BMYmRDc0VYSTFkRm1Jakg2YUVDZjlZa2FiM0R4N2VOMnNLMGJZ?=
 =?utf-8?B?TXRKaTEwWGlCY0tZM0ZqZHIxMWlpUEEwclBqWnRtZ3d1MTdubVVGUXBTVURQ?=
 =?utf-8?B?ZitGL1c1RGVWU0JNbVFJT0RGVE14R0FkKzR2dnVIOUxjY3ZpbUcxc2pvQVYr?=
 =?utf-8?B?YmNIUG9aVjRyQmE2OThyeWRKa2VuTEJJb1hZQS9namZOVThKNEU4a1pDZDZp?=
 =?utf-8?B?a2xHcW5vc1RqMnc1WHZoTXFZd3FrVCs2QkphTlYwck80QTZUQytWelFtWTh5?=
 =?utf-8?B?dlV2Zk1NTkNVbWQycG1PMW1KSXJmNkZlZlhEN1ZDMlVMMnR6bjNRb2MyUFls?=
 =?utf-8?B?MTg0aXpBbkZsZFovd1lOL3RmMG41cE1zYW50UzJON2xYQ3kwakJDL3lyRlVz?=
 =?utf-8?B?aEd0a0VCejd3TCtld09ud3VvUTR6SXlzdlZSMnpZTm5PTlJ1b1VnYUlMdSt4?=
 =?utf-8?B?a0ZwL2ZrNDZKcXJUMDdwMTU3NW1UZFZaUUpOdHRibWNaS2JlK3l3Wlo4S0lh?=
 =?utf-8?B?aG5tQnpFWUxaWjYrK1AyTFJ5anRwdU53d0JZNVpQczN5UmRnZ29yOTdBa3NG?=
 =?utf-8?B?ZGtoQzlac25KUmpHK0MvVTh3Rm1URUUybjd6YzdPdHVIYWxMRGxFZHpHeDBT?=
 =?utf-8?B?T0QvNEovL1k4UjhSNXVLWnlCT3ZFbVlTbHA1UVl4Y2hvMmw0d29yd2oyYzkz?=
 =?utf-8?B?ZDAxak55dnY4UGwwNERQWDJNOXM3TVlpUlpjSlVBR2tOMXJnQXUzeUEraG0w?=
 =?utf-8?B?aHhRRWZQMW1vdkFtenZxWVFaT0wwaXNqNjMwN1FtcTl5eU13cVBhNUFGditP?=
 =?utf-8?B?dGZiRVkxODFoejU4RkdBM3I3THRtL21TOXU4S0VTT1VkOVBGdzg3QjhDdmRX?=
 =?utf-8?B?NVd3OHY3MGpxOEVLNm1KaExENVZSeTNZUHV0cnl6eXR6TzA5b1Y3Qk1XYkw3?=
 =?utf-8?B?VWRLRGdwdkRhSXFHSXhkZE9pL2JzaGZYN3A0N3JJUFRyQU9ndFJyL2dsOTVz?=
 =?utf-8?B?ckthQm1DRnQ3Y3ZXS3lZbERKc1Mvby9qejdxa1JrbzZxUnpsUW5LUG1HZXpp?=
 =?utf-8?B?WTRhVkZpbjNMK09rMHNXblFKMEYwU2RCenBpSVF2cnZKRVZFZjQyUkYrUm5D?=
 =?utf-8?B?Qzg2SjFaOGE3YmRISGdKYTdBV2VYNDZ4RTJCZVRRdXEydGtZNDM2ZmQ2U0lT?=
 =?utf-8?B?K0l6OWM5eEVjUVlXSUZVUE9uVFI1RDR5Q2hCSkFCL2pYTDNaTFdscnVTZUtT?=
 =?utf-8?B?TDBqU3NVNExOUmxZMVRvSk5YbC9TWTFIQWUyZXdlQzV4cmcrWVcvMWVpRVJw?=
 =?utf-8?B?L2ZLM3BYOTVLeGd0RTdHNGE4ZDIwMmF6TjA5OVNFRUhpNGVvb0NNL3Y1RENq?=
 =?utf-8?B?ZndVckVwTmNLRHJBdzhjVXMwWnFLK0xSWm8wek5Yb3ZlSW9wS3ZEQldsbjEz?=
 =?utf-8?B?blJtT1UrL0M0cEFyVWxwQ055RTNHVVVOT2cxdHo0SmxoMGZITDIyTlVybGJ6?=
 =?utf-8?B?MEZvb2ZHWkdkWUl3WHQ3dXJObWo3THYrVUo5NWtLMkUvSm9IRVJHcmZSRzAy?=
 =?utf-8?B?ZHBQcXduaVNUVUpjek0xMWovWlF0RGI1aUxuemhRQlJpWC9kSHNVQjFzZFU1?=
 =?utf-8?B?SkpmWTYyeEpoV0ZwMGNkWjZiNlQrSVJqYlE5dllxR1pIZmpBUFp6UTBxREpQ?=
 =?utf-8?B?dk0zZERZZFQ1eklGZTJwZjB5M2ZselVtS0QwSWt3VlZvV1lsOTZLdjE2YUVq?=
 =?utf-8?Q?NgyXJ8PnqjZI/FwvMHehgazxw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efab9cd-971d-49a0-4d8d-08dab2962eda
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 12:25:33.0211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xfq60HV1kMGs440DucfRqUHLYD6HeyXZfqM0W+3xu2H7OuPgfcVGQmWksUr5bZlzXKc//tikeQ529SHbVb2Xbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4129
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
Cc: Dmitry Osipenko <digetx@gmail.com>, iommu@lists.linux.dev,
 linux-tegra@vger.kernel.or, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robin,

On 19/10/2022 18:23, Robin Murphy wrote:
> Since commit c7e3ca515e78 ("iommu/tegra: gart: Do not register with
> bus") quite some time ago, the GART driver has effectively disabled
> itself to avoid issues with the GPU driver expecting it to work in ways
> that it doesn't. As of commit 57365a04c921 ("iommu: Move bus setup to
> IOMMU device registration") that bodge no longer works, but really the
> GPU driver should be responsible for its own behaviour anyway. Make the
> workaround explicit.
> 
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Suggested-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>   drivers/gpu/host1x/dev.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index a13fd9441edc..1cae8eea92cf 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -352,6 +352,10 @@ static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
>   	if (!host1x_wants_iommu(host) || domain)
>   		return domain;
>   
> +	/* Our IOMMU usage policy doesn't currently play well with GART */
> +	if (of_machine_is_compatible("nvidia,tegra20"))
> +		return NULL;
> +
>   	host->group = iommu_group_get(host->dev);
>   	if (host->group) {
>   		struct iommu_domain_geometry *geometry;


Thanks for sending. I gave this a quick test, but I still see ...

[    2.901739] tegra-gr2d 54140000.gr2d: failed to attach to domain: -19
[    2.908373] drm drm: failed to initialize 54140000.gr2d: -19

Cheers
Jon

-- 
nvpublic
