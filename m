Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 901BF4BEB77
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 20:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C77310E43A;
	Mon, 21 Feb 2022 19:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711AA10E3E8;
 Mon, 21 Feb 2022 19:57:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8WoTcJ/yex71065fH9U0nrlUnSk8LjxzK6qP5HqthVfD3dTNxJOJasozOu8IAUPzpweYSiK1p5VG5P0Htkirt+Pl2wvLopiwFWbXnKSsCe604zZjZcrXHlfvJDJ2Zkabiz9a+4zbdoim36iLy0+12+fGaL0u7qdNcAkg5Dhj3o0aJHjsBGRvG64bDiSH+0uYOqWTQBx+QUFyThEkTr2Pryv9X9y/LPs0VL3tw6k6xl6XP0rGFb9qeeP4tyg4NUIgqLNWZfObak7WglSn4F5U22qpvOq/9Z90g5OBNEZkPdESXP+nIN5WNhktqdA/SpAgkDMrP7imhjoYw7lcSkVBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlHGWCfDCJ/eIdiuR2ED17FISKTaoH/KTQdUZYE2Q7A=;
 b=gHYzo3MdiO7Q0l3hG6zGJcbJkBsgyXG5asX7rDe9j/S5OZpa3jiw2ROStBAFnkoyVAFqhzxgsDNs0bfo6y6/r47bpBD1mT0rkc47lOXqFm6edLtGYxeP7fVVWvrXpbNfnVjoVIIgL+Sp1oHgmpYRZ+0Gs1DAS5MJn1XmOD54pMrygmNdkYPE1Y26scR0eH7j6dnjbALOEYc/5Fyz27stsgQKuuKd6odiObWbyYLiaOf4VTtjpnpHxnUGAWytZl1DAbAra432C5wvY/m2VTmhHRRvI6CpSNB5n4/jLbsWiIRu3WUrT2fU8Jy4n4Bzx+VA//07Dz3gMJxI23iYiO93JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AlHGWCfDCJ/eIdiuR2ED17FISKTaoH/KTQdUZYE2Q7A=;
 b=sb7joJCd+g2qJcm/QF2nCVpxyvgSv7Eu8lQmrdD0i0GqN/CFSemaMqaXmEhbslmd+y7Honq1k3h2DzBf3GZGR/Zyk0msbiCQ36mlHo5Rwqh0UAh7tTXg8vvL23GG6HUs0swknQQgzUZufX+Hpc2B6RRV+QwFI9T0rsaEl1t0/3A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SJ0PR12MB5439.namprd12.prod.outlook.com (2603:10b6:a03:3ae::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Mon, 21 Feb
 2022 19:57:27 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::7587:626e:3703:9db8]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::7587:626e:3703:9db8%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 19:57:26 +0000
Message-ID: <84e354ec-cfbf-a23f-ddd5-417d6f029873@amd.com>
Date: Mon, 21 Feb 2022 14:57:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] drm/amdgpu: fix printk format for size_t variable
Content-Language: en-CA
To: trix@redhat.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch, guchun.chen@amd.com,
 Prike.Liang@amd.com, Hawking.Zhang@amd.com
References: <20220221173737.3725760-1-trix@redhat.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20220221173737.3725760-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0070.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::9) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f408acd-5f6f-44cd-50da-08d9f5746268
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5439:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR12MB5439EAB153D6770DCF03C1CF993A9@SJ0PR12MB5439.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pwk9gEPHzUBHBM6VEapk9sFjXePeXMYwCOvHadhTcv5lrphii/5CJyn8HhYDx2GdGtT7pKYhp624HTFHpRFOwPsPhnEPtl0h8/LLxD0/GnJGY7RgJkuaj5k83fhDWHaQKW+nQ62bc+7MYAQDaYB//wEA4EKzMDiUbQVhl6m25HkFIZSB6nWbuSCAt/h198hHV92tcflNbmn+328S0bMBnaRY8Ps/6vssHbv3R0tJGyU/QYYGYXK1BBQth3tJ/19ojp+Dh0/lhEm12PAWc60jxJBsQewbDAneme1u23laGSwsF90Laor2lHZ4XpCLTYzC+BG5M0ul6SimUD6pah/Uwl8IJadrHIiOdZoJ0+OgtyQC3eQVZhyv7PGa4HK21ijZ8iL4xUISnVI6XEOMdTUBw3yN5626jsu/O0rWEWdy7oEyjoIq2GS80EeDGU2wY4dNUucJtihONsVcLWXeDfauiw6aDEalZk0Zb4mVHxCNiP05du/aIJxOb2MN6qjnwHkuC+uW9grWNFWHbxAqNsVP0GlUPEClHapnyaWb50TsTO2nBkLnUFB9bojegNXBe4y51FyQb3Gb/+mRAKSNjKPdK+JI8Vn6O2wou6jPCU0i6wEkWZzOxI4vYdE+NqFUWYaOTkvs4qXcddmflvgMA9py4mRg/FWwB2jq/3g4jZe6pSnumjr0KEjmDdYGH+jOkfm06/7FFEVW4WDNMT4DmY9aZajNfRWqNdZRuDt0MhCbl1A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(186003)(66946007)(66556008)(6512007)(2616005)(6506007)(26005)(6486002)(31696002)(6636002)(316002)(508600001)(86362001)(6666004)(8676002)(66476007)(36756003)(44832011)(83380400001)(4326008)(38100700002)(5660300002)(31686004)(8936002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUc1RjVlVWFaS2JvWVBTTlc5TEdPeS9rT2ZGLzZZNGxLTE5YWTZES1RxdCt1?=
 =?utf-8?B?K3kwOXBqU3oyVTF4TWRoRXBtR2dIdFI4WG1TWEwyQS8zNXBvaWlQRWRKTTVs?=
 =?utf-8?B?V3ZFaSswYzd0dSt6dkhtUkhRVDZrZVQ5SkFpM1JpQzhhb2lRREsyc2N6dTlK?=
 =?utf-8?B?ekV3a3FHRS8wUzdFeS9GMklxSVRWL0szU05xUk9EYjE2aER4QUdSaWxXWG5J?=
 =?utf-8?B?MUhkRUY4NU9FMW1UU2dYOUtRYzJBQmY4TGtiU2pLK2dHdjdlS0xvN0NWejQ3?=
 =?utf-8?B?L1YwMUNZWHUzQWtJTDNyQW9IVEpySk9iOFh2b1gwb2dZQUJyaitBV3ltRE5u?=
 =?utf-8?B?c3VRTGpOY1hjcGpTemV1RW0rTFg5eFBFUnJVNWtWckljenF6WE1NWUR2Tm9K?=
 =?utf-8?B?WGg0SWZVV0VQRUtEVEpRZ3dOQUsxMURPekVkcVp2S1lENnFDV1BtMnJZZ2p1?=
 =?utf-8?B?UXRsN0loVUhDNkhuZ0NmYkVFaVFZZmZheEhYWWJTWlpvRTFvcmVSbnpBOFYv?=
 =?utf-8?B?UDNoazFqK0h6SGhTazl0M3V4dWczWmdiT2xLVHowVzVSZHdvYkphMjZIQk1S?=
 =?utf-8?B?Z0w1ODFud21VdUR6RTJhcVZPUi9TWEkrK2F6TGhkN0hiREVjMmlOenU1QzJQ?=
 =?utf-8?B?SUVKekFZK0lQRGFabUNoSzV5VUYxbGhuR1RaczhjMzE3d1ZISXRuOWNrU3VX?=
 =?utf-8?B?Z0hKMVFZbC9xa0hDSnpZVmhXbnkyMllUTGpRYkRPdW83cmR1ai9STmV5ZXo0?=
 =?utf-8?B?U2FUN2VtZ0E5SzdBWmZjdGxlbHVqc3JPc3VaZ1p4RnJwSlViTnVOMFJ3dnF5?=
 =?utf-8?B?a3UxcmFzMnEvOXdBN1F6K1c2aHh4SllnU3dEQ2FmMVBoTXB4M0g0N3F2b0pk?=
 =?utf-8?B?K1UwcnJPcTY5UDVPYXU5UW8xTDBqbUN3SDNYM21kTFF3ZnJKS2hxVjVsdnBF?=
 =?utf-8?B?ZTNyU05GZ0hrQ3N4SXpkM2lUdzBSTWlrMkRsN2lzNFhOVmZXNnNDaTkwS2dM?=
 =?utf-8?B?WEttV0FiT0gwMzVwaUpBUmhrMVVvNGlhdVRCaW1mUjlLY0FkVzBTOWU3elQ2?=
 =?utf-8?B?OTFzbHJpVUwvTXJKYmlZaktDYWRFY0s2L09SdDY2U0ZFQkFDT3hFUHhJWXJr?=
 =?utf-8?B?NjJ3MjZLMzBGMlNaVHNlK21kdDJhY3ZYQ1ZNcitNbnZ0ZU9ZR0o1Qm1mZGpx?=
 =?utf-8?B?U0lOa3pkMGhSbWE5MzBqRzZ2QUkrVlI5SVBObGpoZ1ZPU2JGbUVSWDBRUnBJ?=
 =?utf-8?B?eUlLeENtK25Md2VKNC8xR3pJcmRocFdtUkgxdmpCVVhvTVpCanVJb1JlNS9a?=
 =?utf-8?B?QnJnVUVFVkl5cVFnc20xdXRBRHNBNHBmcGNLcUNrK3BOWWd2UGRyQUppS0dk?=
 =?utf-8?B?R0RFZzA5NG1JcjNDb1F4NHllN3ZiL01SUlV3VCt2ejRWaUtVaUppeHBIcUxp?=
 =?utf-8?B?STM5NzFWKy9PdUxJWmFuamtad2tTR2x5NUJNMm9vc2hjTDd5bFFDWXRoVjdp?=
 =?utf-8?B?c0J0NkQzQWdCZC9lTGRmekZSSXg1WkxnR0NvbUlCcjJTNzJZZEVibStaU2pa?=
 =?utf-8?B?L1lOTTdMS00zRVByVjJZY3hWRGYwMUg0OU9leFg1c1pQejlIY0tLd0NtUHdz?=
 =?utf-8?B?Si9ocy9FeVlsdE9lSVMyaVJDT1M0Q2wrTnVWRVoyK1hCK1Y4YVlubXZ2YW9I?=
 =?utf-8?B?RXNaNnJBZjV5WmhwOEFXcG94ZkNoa3VMeVVqZFVQM1g3T1BHN2c2TlBuNG5I?=
 =?utf-8?B?emhqRlVDbVUwM3BJdHlFMWRWMlhtMmpRQnRBZk1UdktLNGZ0R2lidkpPMUM2?=
 =?utf-8?B?OTdwaHA3L0ZqeEtzTFRzaU9qNm1vcW50ZTRBWk1BbnFrU3JPZzc5akp4N1Bq?=
 =?utf-8?B?MXBFTjdGTzFQZmtUZEhRZC9EMVRhbHVEQkNibDVYUGNvSVFJM2lKMG5rTSs4?=
 =?utf-8?B?dzNKT3F3K2kzOVQ0Tld1MFI4UmRtQmlhSjFOTWdkWmJ0VDk1M21vWXFsRm1L?=
 =?utf-8?B?RE5KUVZZTC9CWHp6Rk40MkcwQ3V6R3c4a2NsVGRncWxWRnlUdll6WDM5TXJx?=
 =?utf-8?B?S3FOZkFJdUlWSXVsUTBuUWpvdU9VTi9zWUxZT0tQK0ZFZis0MjZSMWdTOEk2?=
 =?utf-8?Q?/i4I=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f408acd-5f6f-44cd-50da-08d9f5746268
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 19:57:26.8150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: skpICfcb/XUDT4Z48z4j75J21JaKjLCei/4GWv8ozYw8NAG4GK6+tuMo8aJ8kZLm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5439
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tom,

This was already fixed with this patch, and LKML was CC-ed. See the CC tags in the patch below,

commit 4f7d7cda90cbd7
Author: Luben Tuikov <luben.tuikov@amd.com>
Date:   Wed Feb 16 16:47:32 2022 -0500

    drm/amdgpu: Fix ARM compilation warning
    
    Fix this ARM warning:
    
    drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:664:35: warning: format '%ld'
    expects argument of type 'long int', but argument 4 has type 'size_t' {aka
    'unsigned int'} [-Wformat=]
    
    Cc: Alex Deucher <Alexander.Deucher@amd.com>
    Cc: kbuild-all@lists.01.org
    Cc: linux-kernel@vger.kernel.org
    Reported-by: kernel test robot <lkp@intel.com>
    Fixes: 7e60fbfbdc10a0 ("drm/amdgpu: Show IP discovery in sysfs")
    Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
    Acked-by: Alex Deucher <Alexander.Deucher@amd.com>

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 2506bcf36c870c..6c7ec058125e1d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -668,7 +668,7 @@ static int amdgpu_discovery_sysfs_ips(struct amdgpu_device *adev,
                            le16_to_cpu(ip->hw_id) != ii)
                                goto next_ip;
 
-                       DRM_DEBUG("match:%d @ ip_offset:%ld", ii, ip_offset);
+                       DRM_DEBUG("match:%d @ ip_offset:%zu", ii, ip_offset);
 
                        /* We have a hw_id match; register the hw
                         * block if not yet registered.

Regards,
Luben

On 2022-02-21 12:37, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> On mips64 allyesconfig, there is this build break
> amdgpu_discovery.c:671:35: error: format '%ld' expects
>   argument of type 'long int', but argument 4 has
>   type 'size_t' {aka 'unsigned int'}
>   DRM_DEBUG("match:%d @ ip_offset:%ld", ii, ip_offset);
> 
> For size_t, use %zu.
> 
> Fixes: a6c40b178092 ("drm/amdgpu: Show IP discovery in sysfs")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> index 7c7e28fd912e..58238f67b1d3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -668,7 +668,7 @@ static int amdgpu_discovery_sysfs_ips(struct amdgpu_device *adev,
>  			    le16_to_cpu(ip->hw_id) != ii)
>  				goto next_ip;
>  
> -			DRM_DEBUG("match:%d @ ip_offset:%ld", ii, ip_offset);
> +			DRM_DEBUG("match:%d @ ip_offset:%zu", ii, ip_offset);
>  
>  			/* We have a hw_id match; register the hw
>  			 * block if not yet registered.

Regards,
-- 
Luben
