Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 937A6162659
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 13:44:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D781F6E9F1;
	Tue, 18 Feb 2020 12:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5493C6E9F0;
 Tue, 18 Feb 2020 12:44:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nD9bHvtmDN03i2Qczn9L/TUMvn6UgzI4NsdQ8wAKw6fkf2wuPYMOphx/gHGGLcHZGAgiipb28lpvY/OAmytIp6kUhdM7jBe4JVRR0/eM9A9JZu5CdAfTafDV3YvzuitzPyobCitAEbBzGFU0yx3y6wpTwUYh3lu8WaW7NRCJ7/pUDlUYzKDZBjIHRPalVRf9M2JmKD1yl+4pkKR8KZDF6UZ5n+wOOFCPMHTT9IIgNQ3aXDoLLm8eNC427faP13pLwnlNZSQ/t2cB1iAx46yLnC7DPm2vrNUrEcdoJmonZ71qKuLkBVp84tQ8DUGz1CMIBZyFP7pA8EOSKikNvD/Dbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50PlFQneZW2Z5FsbXyrvZgVAFRmriOumRmzZg6dmMpY=;
 b=nMpkEq7Q0KAser2sFRSHxFSF3Te0bp3N1N9akHz/Rg7przWmoSY+tRmv0Q4QLaftcqsDFWLPDp27ZSzmKC4J8bynLSFsjQJE6erDwnB0jyYIEK0WKOrUfW80DPVRSUuPGX0KX6s7rk/xVpuCHEJ8t4MJaHmnK0YUQ6zGPIWPViGAZT+HkCaXz1gnxkkej5tCqMzF9MFGmO+7rG7LQx5DSa/fxMWb7+Uc/1/DotJgc/adTP246yZrDMKLvnj1Ne6lpTdjFpn11LZchq4oH3vmkEY4Aex7pa8/hnjFpgzLqXFEID4YkkH4FwvFAadZKI/wQiXFnoUEnnIzGUcyDBoKnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50PlFQneZW2Z5FsbXyrvZgVAFRmriOumRmzZg6dmMpY=;
 b=B4qdiD0NNXTniftyycvGWJLJvpTcvQ91x5+9htOUzlOuYA3tl+ErnqLKAFAygS93HCDiO1YBnyD6c13oV+OBpCTY2Hy09F25AhwZdKl0qIGws9BZZ+RON0WuMCDJvCtVM63Tk8r+k9QJ5rrPW7WU8rB9Wg9V/XRKMYdHJUDp3WQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1851.namprd12.prod.outlook.com (10.175.86.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Tue, 18 Feb 2020 12:44:40 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2729.032; Tue, 18 Feb
 2020 12:44:40 +0000
Subject: Re: [PATCH 8/8] drm/ttm: do not keep GPU dependent addresses
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200217150427.49994-1-nirmoy.das@amd.com>
 <20200217150427.49994-9-nirmoy.das@amd.com>
 <c3a20c1b-0520-1995-7445-9e3f3ea77394@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9db59846-90b4-2b9a-8200-69297112693a@amd.com>
Date: Tue, 18 Feb 2020 13:44:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <c3a20c1b-0520-1995-7445-9e3f3ea77394@suse.de>
Content-Language: en-US
X-ClientProxiedBy: ZR0P278CA0051.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::20) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 ZR0P278CA0051.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.23 via Frontend Transport; Tue, 18 Feb 2020 12:44:37 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b3bcf854-f61e-4741-2d23-08d7b47051fe
X-MS-TrafficTypeDiagnostic: DM5PR12MB1851:|DM5PR12MB1851:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1851B6E97F7F9A3F4FCD22D083110@DM5PR12MB1851.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 031763BCAF
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(199004)(189003)(2906002)(36756003)(16526019)(31686004)(2616005)(66556008)(66476007)(66946007)(31696002)(5660300002)(4326008)(7416002)(86362001)(6666004)(52116002)(186003)(498600001)(81166006)(81156014)(8936002)(110136005)(8676002)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1851;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qBkfmQKbUW8lyxTxvefZ81g6LTNGxsk74Vg84dLLK+GA4hcTCMhV2+L2xs/qf6DD+lNjh4wYAEfy51HAisZXek+kJaHNgji/OIafr3OXpyQC25a6ObWVXnSU76Z227jNnQiPxY1WVNT5bE66QpQeaZ9vSvDLNprlSwc9BwUVcWQK0JriYP5kD3vkYPqb2AkRN35mD2Gl+VvLHC8AS+p0xrjPm3JrvvQ1X/csXjNdz8VK+EBZApOymq7h1C5JF+hdTsF9WR6AGn7STx2aqPyUnZLW7+Y2izqKqUJOIf07QhaCvjF47Y8rqJKSRlyiNzPRj6H35XliQ5l3YsXdH3wgAYMUIAMtSB5CQEyeZidjiY3aWGb9CPxfGUsAWT8vejcQNGOPofnD6HlSZ3zxUk/NPD8psvrHNM+rkqA8oUNn+mOyNJUT89l1tfdkJf0bdsLW
X-MS-Exchange-AntiSpam-MessageData: hamdB9JR5ySyDziYCDPjOcsvhMr1QDVJJMq+Ywgwv68S551HtYCWqPWGyoq0ONtfxTvE2CiEFIF+Nwolxm+eXKYZc4Vhdg+PXycwwxyRo7cAHNHfSKkCoUqOpqthotJxjXfnzo1sNiMn3OFTHV7n8+D14V//Qm+rh1xUWX9XJsZpt5ZVrsklXw46revSxgoz/wZsrJ5Iq5P6p8qWT5f2FQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3bcf854-f61e-4741-2d23-08d7b47051fe
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2020 12:44:40.3312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8VzAWiy8/dTW9viVUMVcjknzgi+hKVV7QKR0gYuvX3AxwM2Dpe0v/slTM2dCCXr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1851
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, kraxel@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.02.20 um 13:40 schrieb Thomas Zimmermann:
> Hi
>
> Am 17.02.20 um 16:04 schrieb Nirmoy Das:
>> GPU address handling is device specific and should be handle by its device
>> driver.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c    | 7 -------
>>   include/drm/ttm/ttm_bo_api.h    | 2 --
>>   include/drm/ttm/ttm_bo_driver.h | 1 -
>>   3 files changed, 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index 151edfd8de77..d5885cd609a3 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -85,7 +85,6 @@ static void ttm_mem_type_debug(struct ttm_bo_device *bdev, struct drm_printer *p
>>   	drm_printf(p, "    has_type: %d\n", man->has_type);
>>   	drm_printf(p, "    use_type: %d\n", man->use_type);
>>   	drm_printf(p, "    flags: 0x%08X\n", man->flags);
>> -	drm_printf(p, "    gpu_offset: 0x%08llX\n", man->gpu_offset);
>>   	drm_printf(p, "    size: %llu\n", man->size);
>>   	drm_printf(p, "    available_caching: 0x%08X\n", man->available_caching);
>>   	drm_printf(p, "    default_caching: 0x%08X\n", man->default_caching);
>> @@ -345,12 +344,6 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>>   moved:
>>   	bo->evicted = false;
>>   
>> -	if (bo->mem.mm_node)
>> -		bo->offset = (bo->mem.start << PAGE_SHIFT) +
>> -		    bdev->man[bo->mem.mem_type].gpu_offset;
>> -	else
>> -		bo->offset = 0;
>> -
> After moving this into users, the else branch has been lost. Is
> 'bo->mem.mm_node' always true?

At least for the amdgpu and radeon use cases, yes.

But that is a rather good question I mean for it is illegal to get the 
GPU BO address if it is inaccessible (e.g. in the system domain).

Could be that some driver relied on the behavior to get 0 for the system 
domain here.

Regards,
Christian.

>
> Best regards
> Thomas
>
>>   	ctx->bytes_moved += bo->num_pages << PAGE_SHIFT;
>>   	return 0;
>>   
>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
>> index b9bc1b00142e..d6f39ee5bf5d 100644
>> --- a/include/drm/ttm/ttm_bo_api.h
>> +++ b/include/drm/ttm/ttm_bo_api.h
>> @@ -213,8 +213,6 @@ struct ttm_buffer_object {
>>   	 * either of these locks held.
>>   	 */
>>   
>> -	uint64_t offset; /* GPU address space is independent of CPU word size */
>> -
>>   	struct sg_table *sg;
>>   };
>>   
>> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
>> index c9e0fd09f4b2..c8ce6c181abe 100644
>> --- a/include/drm/ttm/ttm_bo_driver.h
>> +++ b/include/drm/ttm/ttm_bo_driver.h
>> @@ -177,7 +177,6 @@ struct ttm_mem_type_manager {
>>   	bool has_type;
>>   	bool use_type;
>>   	uint32_t flags;
>> -	uint64_t gpu_offset; /* GPU address space is independent of CPU word size */
>>   	uint64_t size;
>>   	uint32_t available_caching;
>>   	uint32_t default_caching;
>>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
