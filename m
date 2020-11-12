Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D25C42B0B22
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 18:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A256E2D8;
	Thu, 12 Nov 2020 17:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3826E2D8;
 Thu, 12 Nov 2020 17:17:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxffhTqsaKmK7CYuPQ3kwHmiZqFABW32EoQkosrRlYYisSVQJRkyPk9YrNwJwrgUpFKRw3o9XE+jUqNgBgJDwD5HqZYoMh+nccMqIG4Jf4sOLL1RDMPXeSNeCjnDuQ/UIekisOeEm5MmYBsxYOYY6UivU+n2GNxBidC9xTtdJP43pe5+Nn5uzKWeLsuvXD8OxmowgdZ/wsqReQD3LAmMCDeKK12q0AR3XyU/rqtVEgoex/VHKuy27+w5r0MW6gjHPqRB/AyvCyXrD29GOA6cLUHRcK7GrrMjCiFwo8r1iFDNqw9nVCKObiacgM4ain7b8AwxJvg4y9zSJn/Kefr6vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmA1f1xcpTZmpdOewYg8Dcn/oNlFEoN9gaba4/olAlY=;
 b=dWVavdrHw7+wKSVEdBFfPEt9wdUB+/2XE00JUd/xpWENmlZhQgorD7b0UhrQ94odijkptmQLSBwmyVta+7fzd0yTSYRHZS7/chJLpdb42e0q5uXy7+RqT+sNGWWDxL02+ugTjXMmb7FIEQqPDU3mUER/MxG2MY2dG+slky+9YEl/WgfBWbup4/I5CanhXFhj7kHFbTYsulLDlw6bpWIoc/ZVIyBW1Ts5R0NYCxDNsfMVvhTepmbfJfjqHfGCkQCVoAq5a7iMUcIkn3yqLJlY+4T7ffupmSYX8Z3ljSOFnYedTknnThxRImP3NbYSiEPmlzg/uVyKLVrqoS0YSNDQRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmA1f1xcpTZmpdOewYg8Dcn/oNlFEoN9gaba4/olAlY=;
 b=OH2WJJwlpHKcrkftRiY2Yy+HdBh01Kw1HC0iyLzdQxdZwAjCuM8r9l4xuXlzvVhDQWyopxVBjU1tNDhsBrnKJ2MGHAlT637+8cXNhgU2uIXcpJ7MdL29Lhf5z9mOhN54A83pjsdr92Nn1p6tVUdIoZDMZR0ftukU6wOHYZCxyJI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 17:17:02 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 17:17:02 +0000
Subject: Re: [PATCH 4/7] drm/radeon: Pin buffers while they are vmap'ed
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
References: <20201112132117.27228-1-tzimmermann@suse.de>
 <20201112132117.27228-5-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3daf9b24-034a-9791-ce30-9f5eba66e7c1@amd.com>
Date: Thu, 12 Nov 2020 18:16:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201112132117.27228-5-tzimmermann@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR03CA0040.eurprd03.prod.outlook.com (2603:10a6:208::17)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0040.eurprd03.prod.outlook.com (2603:10a6:208::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 17:17:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 81488b26-3726-46a2-4130-08d8872ec500
X-MS-TrafficTypeDiagnostic: MN2PR12MB4206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4206FA7AC3D6C494B0D9A73183E70@MN2PR12MB4206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: deqfF8OE8wPlrFb5nokm+vJlSzARESWi3KTRW0UrvUvzKdRf8Y+1lzJDGCZvVULzwiHWqI0FQ9rn7SgfMH+2me74anJxYR3882FBMzb3N8Mf4McP19Yn+mWxjF/xVUteUe2FbsVZ9Z6Ux5iaNSE50WDhoQP/4bn0HTSEwh0TiiZphjeo7BkY9v9xvW76LQbe37MO+yiOQaREn1E6GLbnhuLjmFpjOFPuN3AxtEyV71vsRed9Wqq3w4YyvdIRVtb/xd6hu1HPRowXbTjjDoeJVOnaPOFdgVHeLVYQScd5Reb2KiCulNZegNmNICrQduZYBVZabQypvvjUXb5Ktb4bcNphd0KmuLdtpu9+oPhVozl91DJSQy4NNUYgBMVsQhmP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(366004)(376002)(136003)(396003)(16526019)(478600001)(4326008)(66556008)(31696002)(36756003)(66946007)(2906002)(5660300002)(8936002)(66476007)(186003)(2616005)(52116002)(316002)(6486002)(8676002)(86362001)(6666004)(31686004)(83380400001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RGZURlhGQ0ZTb2VzUWwycTUyVk10UnI1N2ZvU3BQYzJFS2plcld2NUl5dTYv?=
 =?utf-8?B?bUwvTWFWTTlUbThPa210QWpxR0dhZzNZR3JWczM5VFd2azRKTUpUME5iNFIz?=
 =?utf-8?B?c1hDcTZRdWFxT3dXQUhlSE42Y0lMdnRudDFrTnBQbkFad1hBOSttNjhxcVhm?=
 =?utf-8?B?dFZCY29TVmwrMGpGdHdNWVNXOU4xRk5KRnZNdUtMZHFPQVoxM1plMUE2bUtq?=
 =?utf-8?B?cHM0Tjg5cURsYUtiN3JvOUVrT00wQVhDNDJPZVBOejlwYUVtOGlwaG41cHp1?=
 =?utf-8?B?dWFFNXRtZ05GTXlmb3pPMkdPbGs2Znc4YW1tZjhEMzY1NWI5NEVkdFN3VHBJ?=
 =?utf-8?B?L3drM2h6VUVEeFM2T3hDK1VjS1RVTks2b1BnUzJLdXBSUFJaVWlneXp3TmZI?=
 =?utf-8?B?ZXZseG5LbFZ3VnhjajhPZzE2Q2g3a2tyckY3b0hndWlkeXM4MzdHWUlYaEti?=
 =?utf-8?B?anZIOThoeXovM0I4OWtBTjhtOGhTM05vQjFiQ0d4UVNDZzF0dFNXV0RUNTky?=
 =?utf-8?B?Mi93a0gyakpuckN5bklzOGw4L2JLQ3A1WHVGZ1lieW5PS1JQUlE1QlI5SUc2?=
 =?utf-8?B?bFhQMDhOS3dvcTNhVmh5dXZyaWVUNmZVWXFwS2FLdmFVSjJqbTI0dUtKanRD?=
 =?utf-8?B?bHptVEJUei9RKzZ5ZE9rOHRoMzZMdW1RTG9DWkJIaDNWc3FZOHZwUXcxdTBN?=
 =?utf-8?B?SXlaZnRXSitYaVV5Q0hRcnRCVFdRRUxZY2VXUkZhYkF4L1VvUURRemJzNlQ0?=
 =?utf-8?B?aXZ3WjkvMEpMZWdocjlrU0hEWnhqUFFocWgxdXFKem9nMG1KUWQ2Wmpxc215?=
 =?utf-8?B?M2tldFFQZ3ZKUjUyTnBuUVZhcDZIQ2kzblRoS285UnNLWXJ4WmZkMnFBU0Fn?=
 =?utf-8?B?UmpNNXI2cDRJY0IzcFFFWUszdHRpRElCdjcwOEVxd0gzMi84WGZMTGVGNEp5?=
 =?utf-8?B?VVhBWXI0Mkp0NUE0Y2NSTldiaDZvNWVINmNjbmVGSGMxVTdDVmw2MVBjV2c3?=
 =?utf-8?B?VlhMZFltTm1qTE9JRXhXRmRyNWFQOWEyYmxsZzNZeUo0dlY5NXJ4UllCa0Jr?=
 =?utf-8?B?T0tTUllZUVpBSFRyZGRBZzZtNUVqUURFaXE0MFp4VzYyUmsxdkhONVM4RFJv?=
 =?utf-8?B?dHoyNHlVRnQvd0xHVlVENTAxN1ZGeXBTNzBnOHdjc2RWQTF1V05mUG4xeUQy?=
 =?utf-8?B?UmhTNTVuUmEyL3p3bnp5eHIwUnFVelpMSFpJTzJPb2w1T0U0cjRPK1JyS25T?=
 =?utf-8?B?OFg5RnZBT1VNUlVNSzJMZWpnS0tOQmhvNnI2VXFvV0xJTTZKZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81488b26-3726-46a2-4130-08d8872ec500
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 17:17:02.3104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jJQsQtDZCDWQ/tpr71aEdAX/lQe89fwZBCZ8s3iCfnUP2bih/arFaLMPf8qXwu8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.11.20 um 14:21 schrieb Thomas Zimmermann:
> In order to avoid eviction of vmap'ed buffers, pin them in their GEM
> object's vmap implementation. Unpin them in the vunmap implementation.
> This is needed to make generic fbdev support work reliably. Without,
> the buffer object could be evicted while fbdev flushed its shadow buffer.
>
> In difference to the PRIME pin/unpin functions, the vmap code does not
> modify the BOs prime_shared_count, so a vmap-pinned BO does not count as
> shared.
>
> The actual pin location is not important as the vmap call returns
> information on how to access the buffer. Callers that require a
> specific location should explicitly pin the BO before vmapping it.

Well is the buffer supposed to be scanned out?

If yes then the pin location is actually rather important since the 
hardware can only scan out from VRAM.

Regards,
Christian.

>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/radeon/radeon_gem.c | 51 +++++++++++++++++++++++++++--
>   1 file changed, 49 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index d2876ce3bc9e..eaf7fc9a7b07 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -226,6 +226,53 @@ static int radeon_gem_handle_lockup(struct radeon_device *rdev, int r)
>   	return r;
>   }
>   
> +static int radeon_gem_object_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
> +{
> +	static const uint32_t any_domain = RADEON_GEM_DOMAIN_VRAM |
> +					   RADEON_GEM_DOMAIN_GTT |
> +					   RADEON_GEM_DOMAIN_CPU;
> +
> +	struct radeon_bo *bo = gem_to_radeon_bo(obj);
> +	int ret;
> +
> +	ret = radeon_bo_reserve(bo, false);
> +	if (ret)
> +		return ret;
> +
> +	/* pin buffer at its current location */
> +	ret = radeon_bo_pin(bo, any_domain, NULL);
> +	if (ret)
> +		goto err_radeon_bo_unreserve;
> +
> +	ret = drm_gem_ttm_vmap(obj, map);
> +	if (ret)
> +		goto err_radeon_bo_unpin;
> +
> +	radeon_bo_unreserve(bo);
> +
> +	return 0;
> +
> +err_radeon_bo_unpin:
> +	radeon_bo_unpin(bo);
> +err_radeon_bo_unreserve:
> +	radeon_bo_unreserve(bo);
> +	return ret;
> +}
> +
> +static void radeon_gem_object_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
> +{
> +	struct radeon_bo *bo = gem_to_radeon_bo(obj);
> +	int ret;
> +
> +	ret = radeon_bo_reserve(bo, false);
> +	if (ret)
> +		return;
> +
> +	drm_gem_ttm_vunmap(obj, map);
> +	radeon_bo_unpin(bo);
> +	radeon_bo_unreserve(bo);
> +}
> +
>   static const struct drm_gem_object_funcs radeon_gem_object_funcs = {
>   	.free = radeon_gem_object_free,
>   	.open = radeon_gem_object_open,
> @@ -234,8 +281,8 @@ static const struct drm_gem_object_funcs radeon_gem_object_funcs = {
>   	.pin = radeon_gem_prime_pin,
>   	.unpin = radeon_gem_prime_unpin,
>   	.get_sg_table = radeon_gem_prime_get_sg_table,
> -	.vmap = drm_gem_ttm_vmap,
> -	.vunmap = drm_gem_ttm_vunmap,
> +	.vmap = radeon_gem_object_vmap,
> +	.vunmap = radeon_gem_object_vunmap,
>   };
>   
>   /*

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
