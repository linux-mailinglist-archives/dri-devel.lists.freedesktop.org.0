Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD5271A021
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 16:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C5C10E551;
	Thu,  1 Jun 2023 14:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF9E410E15B;
 Thu,  1 Jun 2023 14:34:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gczYBgu6/WI9dnxLQZ3HGl8HWFuWzctqTpiwPDHFf1bNdh9xVwIqfd72TP342FAULiExpAKysfojBiBW+jjBwscgm4a4PIWka5LjF1mCLGSFPbRTvGLn4Z1ao+1CRJPIHv7cZPx6uTad3Qe6SYNKLU3KvtbPUfSprWOjwRWBtg5zbXMIw9MtaIjMCwMnVmhbNmIJ27m5XrpYHwpzE5rzHzTTmjay2jXCeQm6ZnG+EzbZC1BEtJfRrFW8CnLMBHOQkSNQ84ugzHuupgegCBwzvcPndDBBryQnnmtL0p518lJWkLDRF4CzbP+kaOrwAOxhQW7I8lPAxrAcQAxyS/iajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4byVYc3piYLFHOMuNXRNYjzoaRWwqK9pc5O9hghsaL4=;
 b=YmSGivTu4EpnKvOLurGNCoYV1fOEtzUfpAqcI2PSXQDHIXaULYTGg1+7TgBzQAwTZVxX3kBl0HDMFsdcUn3IT+GjLIVKDDhmYzWzkcF4e950l+FY/V9N2AYy+o68n/NBBJGDv6oH37JmkcBclQsCQLoR8ZSiPWND8VBMQvZ6fQcQ7+uQt5gZQhOyD7zLd2MR8CBq5TuSduybRuCaZ/MWCevWsgTBIWe6Mg0qR/SYvGfkUC41srdAqnT5CPQnfxHWeMxNJaPAfvcOiWxZy5v7dBXfjHn0LWfCcrh7Z9ImhLbYZffgyJcq++tWKuZHPNFlBah1vSNfNJR3UnpudvghEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4byVYc3piYLFHOMuNXRNYjzoaRWwqK9pc5O9hghsaL4=;
 b=lb280PJHdhJHrn8lTQXk7sMLilNdJG8NetzeBx+mlyDF+1lGndlgV0VMEVQ4QMVQgqi+MoRFFyzS583YL+cDDUXhu275/MGqb1wRh8un8up91nEeMwb6IR02aDUlVIunT8EWAJo9DFowkk4VxGg+ZNpdYMjtZIctF2Wizr+Ahbk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB6636.namprd12.prod.outlook.com (2603:10b6:510:212::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 14:34:05 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::907f:26e2:673a:2ad2]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::907f:26e2:673a:2ad2%6]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 14:34:05 +0000
Message-ID: <81371d0d-5093-5aa8-f757-2f11f24366eb@amd.com>
Date: Thu, 1 Jun 2023 16:34:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/radeon: fix race condition UAF in
 radeon_gem_set_domain_ioctl
Content-Language: en-US
To: Min Li <lm0963hack@gmail.com>, alexander.deucher@amd.com
References: <20230526123753.16160-1-lm0963hack@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230526123753.16160-1-lm0963hack@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB6636:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c832bb5-0494-4052-4d62-08db62ad406f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EalTvypGyVlpEctFuv7RZ7Ttfoj8GaUbLeF0QF45NX60DtoPQ8A0dqUmkQGlzp5QE6FF/BJYMqF9gZ2rAwJzICbBIuQEk2nfNASHpNPKesbseN8MTzZjOvHd6RC+c/RNUnZHvu3MzjlnVtX68wJ+JezbZeEQhkMWojJlnMrdUYGeykZK2CfLGaVUhpUMRAquHKl90dZ8inpWcnNxHtklaYKtOdwgX+5dfrr2aWBgHbD5UauPl23PWF8xYjVaPne+oSLZkXUi9NnIuKDCkwKBRfp7uomQu/Fi9ITvnTgN9Bc8zQrc9KyM4looNLjuphirrv2jHChp/RI6968PhZ4rJmLa9ga/q/kg0g5S8PHZIUYyJvYCY/0g6C0wR6eppm7OGuq1+27iy+nXW+VuYtkLcnGr9LwXonTQ7w+ylozXagJEPpXgIfUIp9v9N0AppZiNSzzjo7ITlADmP6hy0u+mcd3IhAQSFO3JJcKTP3eWjZ+vGL4RQesMnd0wUeEdMKNyWbivDbXFkATZcsgUAAgRS4tA9Wimhlz6Blu0D3QxLV86/l6GIwoIbbSbvPZqRtPUDJpRST0SOcL16HaeTtDe6/WJLGPqBU5mSw8DUsIwSy2AyiKM/zX+71yutsXWWjLR/Q2wm6suxwsps7pnHrT+Ag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(451199021)(6666004)(86362001)(2616005)(316002)(2906002)(6486002)(36756003)(5660300002)(186003)(31696002)(41300700001)(83380400001)(8936002)(8676002)(38100700002)(478600001)(31686004)(6506007)(6512007)(4326008)(6636002)(66476007)(66946007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTdCdjkrTXhxMHh2bVU2NFFwZlREYU9wdFlJYklJbTZ0TEZxb29LUFVwajBD?=
 =?utf-8?B?REZBZmxWWDRETzBNOCtEVWUrVnZBVTBzWTV4Sm0yaTdZN2F6ZFVUNEU2T3Nr?=
 =?utf-8?B?N3R3Y0I3OHRHZWQrcmpFbmZMSjUwcmtJU0Z1bS9tbjg2eGJoaXM5MmRpZ2lw?=
 =?utf-8?B?UVRXb3JyU2ZMS2xsZFpMWmdDNWRmMUZzRzdpUlRoeFhIcGx3dmR6WWFIaG9Q?=
 =?utf-8?B?NlJnYllOVEZlTHhDWGdJQmVIYk9UNHZKMTR3T0FZMVYrcklNcXorS0RQam1t?=
 =?utf-8?B?dHk5SDdaWWRyY0FTZjUrNm1lQVpLUGtSeGVGMEx0UjRvbGVQV284ZGJIeS9j?=
 =?utf-8?B?dmNlRytzbEVpOHVmVVhrMEJ1d3NlTjMxYnIzSk51R1M5WjBqT3UzWHVJMkUx?=
 =?utf-8?B?MUdabnM5eFFsZ1daZ3JrUHNnRFRBRm9aUXB4cG9DRzY3dG03eExYV0VOTFRq?=
 =?utf-8?B?VUNXV292Y25JS1R3c0tBc09VZ2Z4VWJTUzUwZ0tpZ1JpRjVZeFBDeDBwTXRy?=
 =?utf-8?B?Y0liV1ZnOVZzWDBVcVNyQnlKeEZEZ2RzV2VZTWc1K0I1ampSa3ZXNVZZMEhp?=
 =?utf-8?B?N1gxbFZTZWM1cWxkVDJkYlJ1MkU4UXVKNTJYVHNndWtFeStrM2ZHOFFERy9G?=
 =?utf-8?B?UVVnRi9vRm1GVlpiNEhnOUpybGRYYWZPMnR6TFY3RXAveGg4Nm1wWmo1TzZE?=
 =?utf-8?B?NFNjdW4vMisyS2ppQlVHRlBSRzFEdG1GZ0lxME53MU4zMWphNU9sVHJXbjhD?=
 =?utf-8?B?MS9SNlY1YmRQM2hSVnExQnNBMHNRc2NRdDF2c21NeldiRDk2TURUZk1UamdX?=
 =?utf-8?B?N3Byb0lTT0V4WFBtaTcwS3lYaUZmaEFLem84NlAvbUdNQ1VJdlROaUtuOXoy?=
 =?utf-8?B?d2I0WG1iWmlKWENJeWloK2ZZcnhDUXpzeTJycGd5SGFGeWNlMVhqYUJqa0Iw?=
 =?utf-8?B?Q3VtZXpIaW9aSmZEdi93N3lQYXpWODFidmZ6VkdCRlhyVHNDZStiYk1ZWHA2?=
 =?utf-8?B?d2F0akZFRjJCS3FNS05QSWN5NG15M3l4cFRXOVlCUUVXWnRmajlDa3BMZGVh?=
 =?utf-8?B?R2s4ek1ZczM2U1Vsa21UczEwM1NJcTlnVmNlYzdCVnB3VG0zeXZrNTRsTGt2?=
 =?utf-8?B?eWxVNUhUaFBHdlZpb1MxdEl4dGxSWjZOejlIZFA4eDJ3UUROOEVhU05JSHUy?=
 =?utf-8?B?SURYSGEyWEFMOW1HYnBxSTFWS3ZHL05hVnREcjRyL1N0ai9oSEQ2M0lLOGJj?=
 =?utf-8?B?d0h4ZzMvQ3Y2SGVyY0NaeUdaTHJCNjBOaHMrTlAzSi9jK2NuS3lIditmeWpq?=
 =?utf-8?B?VGpNT01naHc3dFJPOVE4a1c4Mk5hTlptV2J6VVlYZnVTektna1Yva3BKYmtH?=
 =?utf-8?B?WU1QUnU0VWhaT0FyU2F1RjJucWs1amNiQ256eFJpRzFwLzF1dktKaEczdmhG?=
 =?utf-8?B?WDFFS29DV005SWs3dDYzWnE3b3BmeERqejl5UktjR0d5SGxVY25FYzN2UlVC?=
 =?utf-8?B?azQzeDRNVDhqMjFiKzRRa1hKMDJxZWxIOVB3VWZrb0dhQlNFdkhVd1dmbDZK?=
 =?utf-8?B?VStKTDd5SEc4cWEvdGg5bURSVHpCa0N2bmlFZHBMbDNSN05OUCtNMFU4cVBP?=
 =?utf-8?B?cG9CcDJ0dmR3Zk9DeDB6ZE5qUTlKTWh3Nm83cFExV3NDRUsvanl2R2hYSHcz?=
 =?utf-8?B?cjI2RE4wWi9xWXNIaGxORCt0bVdPckJ2VmZYVHh1YWR2Y3YyWDB3NzQrcjEy?=
 =?utf-8?B?TE1QcWZTc2ZMM3BWT2JUbi9nR0J5T1ZxeDFWdUF2NmtyeTkyQTNFQWVlUkMx?=
 =?utf-8?B?MEI1NHdSZ2Fuc0V6elhOdm9BSXNCMVM1dkFqd0M5ZjN6T09QOUtPaFNObllM?=
 =?utf-8?B?RXJPY1l0NDh4ODhvcnlCSm9sSitUb3lEb2dlN3hFYndhVUlONzZna1NuTHNj?=
 =?utf-8?B?U3FzNlVUclhXRXdzc1pMeTlMWExtM0ZackRad2NkUGp2Mm9ROTNSalROeVk0?=
 =?utf-8?B?S0FiZHZ5cnZscnlROTVFWVgrUWN6dUVFbVpiSUFwZFVwN1NqT1ZhMGdxUzhJ?=
 =?utf-8?B?Mld6ZjQybUJuWlRQOHVOSkVZdEU4Y0hCeDI3NnVpV1JFODZMNUZIdHFrMW5B?=
 =?utf-8?B?YUpPZkJLZ2puQVRDa3lrU1U4SDBra2tnMk1Zdi9DTUhWenpFRE9lSDJEY2I4?=
 =?utf-8?Q?AEzFvh6dTpSz0zAJPJ6QiDk8aBB5vgSXU04GTkDJKVAV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c832bb5-0494-4052-4d62-08db62ad406f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 14:34:05.5681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Cb2IuamGLVNljb7NxHuy4GKGZicOhjrZMNtbMXmBxAvpf0sIBaTtTKhN+J8XXS+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6636
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.05.23 um 14:37 schrieb Min Li:
> Userspace can race to free the gobj(robj converted from), robj should not
> be accessed again after drm_gem_object_put, otherwith it will result in
> use-after-free.
>
> Signed-off-by: Min Li <lm0963hack@gmail.com>
> ---
>   drivers/gpu/drm/radeon/radeon_gem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index bdc5af23f005..450c7cbdd28a 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -478,7 +478,7 @@ int radeon_gem_set_domain_ioctl(struct drm_device *dev, void *data,
>   
>   	drm_gem_object_put(gobj);
>   	up_read(&rdev->exclusive_lock);
> -	r = radeon_gem_handle_lockup(robj->rdev, r);
> +	r = radeon_gem_handle_lockup(rdev, r);

This also makes the robj unused which the kernel test robot also 
complained about.

Please remove that local variable and re-submit.

Apart from that the patch looks good to me,
Christian.

>   	return r;
>   }
>   

