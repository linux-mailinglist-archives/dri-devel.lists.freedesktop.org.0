Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A424826834
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 07:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162B210E183;
	Mon,  8 Jan 2024 06:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDE410E188;
 Mon,  8 Jan 2024 06:45:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiFQYGr//8KoVcWsexq7H9netGjNDO4lV6oe7zPCULWJOY5s7MqYT0+gG3tmcHBJk7jbVHSckNs6m7S64iKYZ4L64XNZctZ+Wk91drX4qJ46NeldAwnB+oD2T238IKWCZBxOx8Hs4Dj1k+26Mvpd1MT+UfoEUT8+QkUzeDcp/T0TNcXskqrLf/sG34/Q7wOtoQ+T7J57Jn6W2veSvNMrdjx89rtklheDRwGJ0GRwJZw2rLeddX4gDnnLExVT1EimJEg5sdpp2HoamGa01TFtaCTgTuk3256Ef4Ezsb37YZr3IkBD3Br9LjzaFdwDHPkDYOOSyYEa51YG/zOEabLZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atAiE1fxIaR6BbnSkuiGgZsTu2ZXrOoGPJjP2K0KUgE=;
 b=gesKfTrH8pJ+HCvQLzQoyCLnCFD4uapsHqOjJp2uN/Lg8QeFWe8pq9qj24SL7lI/2miIDiVJq4AFNs3rg5bU6GZwt1CIyoMeMIk+nLwb+NCGS+V+sO33yWpqTQSveA3/ZjRcfl5k84h34YVj5vNVDOOU28F3v05xB08qwmr4nxkdBpD1G1mFFpzDnmFMsdschJu21SuHOU2ajSA6Ps81XDY5w+1BE5CF9AXN08cb1d8p86QCxza51UrlBVKA3HkMv8eF4MdoQotTzQr+h62rQaFs8nFDNRggHJVSh0n4SN01WJZ1G6LIf1n9SAvstJVBz82s6bjn7x0E2lmPKy9f7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atAiE1fxIaR6BbnSkuiGgZsTu2ZXrOoGPJjP2K0KUgE=;
 b=ML/wyvtM6IyTDW1rFDOP1ygXTqSsKObcdQNf7gfOoklZaER1dlAPnEDIatdRNcs3y4uPyKYTNvEb96hudxkUTvnqYz1DXgAC8EUfySz6LeacA9BCkIMwPnaJaWdVLo5Jc56c6dOAkHYilhUr+sS2xGbfdTh5zH971nRbH9s1hg4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4389.namprd12.prod.outlook.com (2603:10b6:208:262::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 06:45:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 06:45:13 +0000
Message-ID: <c82fbab0-1ba1-43cf-9f31-57d365b2baa2@amd.com>
Date: Mon, 8 Jan 2024 07:45:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] Refactor radeon driver to use
 drm_gem_create_map_offset() instead of its custom implementation for
 associating GEM object with a fake offset. Since, we already have a generic
 implementation, we don't need the custom function and it is better to
 standardize the code.
Content-Language: en-US
To: Dipam Turkar <dipamt1729@gmail.com>, alexander.deucher@amd.com
References: <20240106141422.10734-1-dipamt1729@gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240106141422.10734-1-dipamt1729@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0235.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4389:EE_
X-MS-Office365-Filtering-Correlation-Id: ad30f7b0-5128-44ab-ebeb-08dc10155d94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 21rf7eTHU5nOYSlykLoCR+0T+vGgPS/fOZ62zc5e8cic9PKgEST79dqBWZonFPzrDoEbuu4HQxJ7i97LWCf0xaMsCvbzPdIfAAV5AaQXA8/qS3VCHw80/N6/JnmUCPmkoZyIqzxspGo6z5WfiJX+mci2aj6hy0ekClbSGkdnepauGrPOtDUJZrjdktFaSCqRw+9mU5ZWB/szPGhWuofxG5XO1tBe7iFs2nyeQL+mBRog291BysK5NMzXtGsvtpwtVSZ3//EdE/kPigvjL+keqjKpf02crOv9cC9GcOLJuqCoKyYuieXmsto57WuazQVX4VnWAwz44VYyLoIxcSsUFJN2KNuRGMHBjf232zR40LpY2Q09VBp83m988X68d/OmJm85vJx91WXp+UGUDhwxP8lYfCUZtZBlj+PwdQEapXb18U7hatpb3827jT71n1O1Up8bfz5zivPQk0ip6wm4K2ht0RvDBdKSmLfuGh3/LSbLi0rLks5/hWE2L4dNWRhKuXPnp9CnodGg90/GogOmgvnlUqap//c6yAQUpJMR96DqWBsMgWYjJE9BS62qR3uAPDF/uhkAKaqiZ+1ZlbyGYOcfya52Yac6/ryyF0KjsvaOEHfEAsXgPerSsJ5zRB/tsuczsydJkOFwfOsSKMPYmduwQbMLktyKc6CX/eDbce2UjpMpUIfGF+I/QPpCvLuZ2rsuUDM+wQf6f9ZI6w0ksg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(396003)(346002)(136003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(8936002)(2616005)(26005)(8676002)(6506007)(316002)(6512007)(83380400001)(6486002)(31696002)(66556008)(66476007)(66946007)(41300700001)(86362001)(6666004)(6636002)(478600001)(36756003)(5660300002)(38100700002)(31686004)(2906002)(4326008)(41533002)(219693005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXIvMm9nS05CdjRZNW9XRFRYR2crOVphaTl4Q3ZWbWdmNkJySVdFWEhTQ2J1?=
 =?utf-8?B?WlpEY1ljbkU2UmdJMDhPc1c0VkZCTFB2clhKRXlETklpZ1YzZEpQSGFvd1Jm?=
 =?utf-8?B?eld3TXpFRWVyb1dvSDhqQXBRUkM2cjFLbzYyMDVpTStYQTQ3VmV1enJPcDlo?=
 =?utf-8?B?YTVwUGZQQjdWaFVVWitGYzJsdkNNdE1oZGVnWFJnV3pSREpCYnFYYis4dzZi?=
 =?utf-8?B?SXYxU0VDd1BVTlpLTGd4Z1dxcEd6UjJNalVmUEFxLzNia0Zaa1MyTncvTzhz?=
 =?utf-8?B?OEpmNzcwM041RFo0cDN6OFA4WklDeXNTcCtRWWpwdm9VNHlhVW9TQXNRYzJu?=
 =?utf-8?B?YzlEVzJIYkkwcU1LYmh1UnY5YzM1cHdiUlZGa1pPU0s0d3VmQlpKejYwSGVh?=
 =?utf-8?B?b21Mb0dTcDZDakVPOElkSWF5MmNsSnIzVzNNdkU2RVM3UEFlTHBWcTZwcVJQ?=
 =?utf-8?B?bm9DeTBuWHVSdnNDaWpVSDR4a0NLVGhCOS9lc1BlUUg0M011MG9FaEdlNnFO?=
 =?utf-8?B?RFZ0ZUlBZEFQYWRPWEo4ZHBtZEE1WTBuME5USmhXQmFDS2tZa29aektGaW5u?=
 =?utf-8?B?MkdXUVVFWXdqTzlQYkdhOVRPOEN3WXlnTEtRMEozUTVTaDFaTkFWM3MvK1V0?=
 =?utf-8?B?R3o1ZlNiajgvcDlMK28rL1FzcGllWHNuQ2pFZW5pelhtTENBY1RSamhxTzJi?=
 =?utf-8?B?SE50eHo0TXYyWVdXcUtoa0w3NmNrTWxuSUFiSTZRS3Q4TWt0Y2JMdTUvclpw?=
 =?utf-8?B?emJkb29Fa1NNZGhzZmxBL0U5eUd6SCtlU2YweVlNZk0yVW0rMllvZ2hYL1Y0?=
 =?utf-8?B?WkhMYXVNSzZwNmdHNEdWMlliYVEvUnI5VEQwelVnZW9xaGx2cHozZG5QZENk?=
 =?utf-8?B?eTBWL0RXbTB1THd6QnlseWM1R1ZMNkdSWlRnMFl6SlU0RExhU1V5bGhMRzAr?=
 =?utf-8?B?NDBtcUI5cTRYaEJwNzNTSmU4Zko4cE9ZQXZCNnF0Um9BVWFXU3UwZm1FZ1hH?=
 =?utf-8?B?dUx6QmxJZFhKT1V4QUJBczcxckpid21od1ExVVYxNnlEWlNyK1UxTDhtekUw?=
 =?utf-8?B?Z1dTYVl6M0E1di9paDM5S2x5TDY4MHF5YlZ0UEFiSENFblg2Uk5jMHowb0JZ?=
 =?utf-8?B?alJzMkkvcDg0amoreEMxWjNVcjhYb053UElFLzFMTUllc3daSlQyVnN6ZUcy?=
 =?utf-8?B?cWtNRDlmR3czcDY1TkZpUktEcmhJZi9UN09tZUNVTVhDVWlod2NFclQvOThr?=
 =?utf-8?B?a0x2ZnlpSEt2TStlZjZQNGEway9Vc0VhcHBSM2RON0NYSG0zVnFHbnpxYkRz?=
 =?utf-8?B?c21uTk1Ob2lVUVo0YUtCYU1wVkl6dGFQQUhSY0VJajUzenIwajN5N1JQTklJ?=
 =?utf-8?B?RGZXRmtvUnBEOU1DQm8ya2pmNisvclJCRXUvNlRvaGM2dFE4S1BmL2NHMzds?=
 =?utf-8?B?QmZ5YVYvMkU2K3ZwZWF6UlptaTFCNnpvaER4WWN4d1F6Q00zOER4YUpoU25T?=
 =?utf-8?B?cFA0b0U1YlpiS3BDYzZXUGYwQXdGWVg4d3cycU9tZlBGTEViUHVPWTQxZTdP?=
 =?utf-8?B?dWdLSEdCR1FodjRmcS9vSG5xcXV0NkhiNEJCd0Ria2JxLzUyeU1qWWoxNmY2?=
 =?utf-8?B?UlN2NEErSTByVEJVM2lGQWdlTGxHRlM4d3FheHYrYzF4d2pvT2Fuc0JlcnN4?=
 =?utf-8?B?Vmw4YndrblVON1UrMTZpQlRxSEJzUi9DOVdvbTNaczNqT1cyZHRybk1hVGhr?=
 =?utf-8?B?RGQ1OWhnK3UzbnV4azZWTEN2U2dxbElFL1FRK2ozcmkvU05nUDNKNUlnV2Q2?=
 =?utf-8?B?dVpMdXd5TVJMNTJ2aXBrSVgvU2ZZTThOUXU1Ui9CRXlWL0t2dTRPK2xUejBD?=
 =?utf-8?B?OVN0Y3ppdFkvbmxHSWsxZVpzUityTjNyTnFVUzB3UG90bjczTWQrOXdTbThw?=
 =?utf-8?B?dUxuakN1R3dZeVdCNWE5SE9oMStySnBPbW9IdW1wTmZwWjB3VWRlbHV3em9V?=
 =?utf-8?B?QmJGNHg5NllxM3ZxTjJwRGQrTmg0WUwwUWxyQWI2c3krSE8rVmRPeDlOYmpx?=
 =?utf-8?B?VTN4VEtJTWJNMkxHVFJGTFdZK3RDRlo5TzVGMTk1a1hwUEV4dnNjYmx0a3Rz?=
 =?utf-8?Q?MpmwwN4ZMzs/kYUSpUYjx0/bw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad30f7b0-5128-44ab-ebeb-08dc10155d94
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 06:45:13.3078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jImhtLqLufzlmYIIlsXBo7QgJo+dk1FPVaGIyUkUQerKjDyFL8a/gyNC1OAHIui
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4389
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
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.01.24 um 15:14 schrieb Dipam Turkar:
> Signed-off-by: Dipam Turkar <dipamt1729@gmail.com>
> ---
>   drivers/gpu/drm/radeon/radeon_drv.c |  2 +-
>   drivers/gpu/drm/radeon/radeon_gem.c | 24 ++----------------------
>   2 files changed, 3 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
> index fa531493b111..f590ed65ffba 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -578,7 +578,7 @@ static const struct drm_driver kms_driver = {
>   	.ioctls = radeon_ioctls_kms,
>   	.num_ioctls = ARRAY_SIZE(radeon_ioctls_kms),
>   	.dumb_create = radeon_mode_dumb_create,
> -	.dumb_map_offset = radeon_mode_dumb_mmap,
> +	.dumb_map_offset = drm_gem_dumb_map_offset,
>   	.fops = &radeon_driver_kms_fops,
>   
>   	.gem_prime_import_sg_table = radeon_gem_prime_import_sg_table,
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index 358d19242f4b..99794c550d2c 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -31,6 +31,7 @@
>   
>   #include <drm/drm_device.h>
>   #include <drm/drm_file.h>
> +#include <drm/dem_gem.h>
>   #include <drm/drm_gem_ttm_helper.h>
>   #include <drm/radeon_drm.h>
>   
> @@ -480,33 +481,12 @@ int radeon_gem_set_domain_ioctl(struct drm_device *dev, void *data,
>   	return r;
>   }
>   
> -int radeon_mode_dumb_mmap(struct drm_file *filp,
> -			  struct drm_device *dev,
> -			  uint32_t handle, uint64_t *offset_p)
> -{
> -	struct drm_gem_object *gobj;
> -	struct radeon_bo *robj;
> -
> -	gobj = drm_gem_object_lookup(filp, handle);
> -	if (gobj == NULL) {
> -		return -ENOENT;
> -	}
> -	robj = gem_to_radeon_bo(gobj);
> -	if (radeon_ttm_tt_has_userptr(robj->rdev, robj->tbo.ttm)) {

Well apart from the obvious typos, the missing commit message and the 
mangled subject line this also removes this important check for userptrs 
here.

This in turn is a complete no-go since it can lead to kernel crashes.

Regards,
Christian.

> -		drm_gem_object_put(gobj);
> -		return -EPERM;
> -	}
> -	*offset_p = radeon_bo_mmap_offset(robj);
> -	drm_gem_object_put(gobj);
> -	return 0;
> -}
> -
>   int radeon_gem_mmap_ioctl(struct drm_device *dev, void *data,
>   			  struct drm_file *filp)
>   {
>   	struct drm_radeon_gem_mmap *args = data;
>   
> -	return radeon_mode_dumb_mmap(filp, dev, args->handle, &args->addr_ptr);
> +	return drm_gem_dumb_map_offset(filp, dev, args->handle, &args->addr_ptr);
>   }
>   
>   int radeon_gem_busy_ioctl(struct drm_device *dev, void *data,

