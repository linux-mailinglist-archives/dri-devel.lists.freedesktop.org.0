Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D6A7FDBDE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 16:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591E410E621;
	Wed, 29 Nov 2023 15:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E382310E61E;
 Wed, 29 Nov 2023 15:47:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZBJslGr/pcA9Kd/YIUIPM2fipkqltdxxMz+LyrtxiPlCVQAOpoGMDar1SPZ/M2Cao9LzBYNI/pRm0JtOaRwJwTZE316JwNOdo1Au5HTEOOcOt8P9V/kY1EW2oq6vkyuF9A1blOUbFH5xnOz4UGoP3ETYEqzSHTBvDc7McdwMfviMLe55BxoH6AH+/Yx6PBlxecMP+NxmQDz+JBKNia+OBUKRH0F5DCqDmZ0L6BjOT030FCxU/HAQf5T3OlFOpv78bskB2pj1NSoZHbZKjCVYb0g7KVDVKzBzMfv05DVqFLJRgCuaNhJIRqsVnJA+lTmB93wIHesyBhWaKRtvtEMBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6vgPGDbQonGhBWAulF+FQmHqBd6TSDIuASpIPuVMJI=;
 b=B9JxHHc6ATqD9ix9Ciww2PFi04BK0AHZX13qaRK4EWBbwc7osNvEJ40EJ1HC61q5p0h+J55oY1ndINI47vpFuAIAPFWE5WJ0W+hJHOmSzE4MiuLe/+WejdAmSxMCLGFL6Y1PnbzEl/0/P2G0cWWnn1Vnh6joMNv9PaZP0/CZsJgk2+6lm7GDcTidJILKUw4J5MgeJycaAYeQZSBAd0BJTZkUpSzOaNs1ytUrXj1j/sE0MlBMoyxZZ8NFnS7k/+oohwj/jGLW1iVfnrAQssHMXZyabJZ92gRCTojBfFw4bKZNy6MGTQVmK8PPSzapYh7fqoh9YG4d6oEnXPr+bW+DmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6vgPGDbQonGhBWAulF+FQmHqBd6TSDIuASpIPuVMJI=;
 b=Z7lzvmQlyzX11FNnhc42FxWO+mhoVuLRscfHVW53uw8JnMCWuhULciuBEgU3c8dChng6nGoFPlR1wvCZ7tVqRyZ5Ie2z5t2NCnp2KiuwJ2ozg7bI4rt+Z18o7acnf5T2RgICtajMfgsktHndiof1ujdYUsXHaRs785hxASB/kVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB8828.namprd12.prod.outlook.com (2603:10b6:510:26b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 15:47:07 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7046.023; Wed, 29 Nov 2023
 15:47:07 +0000
Message-ID: <6a26b0c9-cbea-4ca2-bc16-79ed53e3a6fe@amd.com>
Date: Wed, 29 Nov 2023 16:47:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon/r600_cs: Fix possible int overflows in
 r600_cs_check_reg()
Content-Language: en-US
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20231129152230.7931-1-n.zhandarovich@fintech.ru>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231129152230.7931-1-n.zhandarovich@fintech.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0364.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB8828:EE_
X-MS-Office365-Filtering-Correlation-Id: 96142bc1-2c90-4b77-560b-08dbf0f2712d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SehQAPsnJhTpteid9CpfmVIP35Z+1JKMSiMillteMWxrDw9eSpFJBuhOYcAFnk613mfYE4MVoWWodier6sLOpcclMksuWgYWI25omdb7cS9LLmTAsr6VUDquRPWFoelZIVG3bzlN/wudridgmcvv7q3BO6djxT3+61bwi3Get4D0ge2boqGZq4jbnN012ZUaXxs3ppbXnSkdhe8OI4gk1qWXRTYhMZZZAGzuTPYirOSjUyv26oxAR41Fk3m3jaSbWacJpkKfGzutvDWEW71bXEPu0Z4+EduG4MjJcapOXyaSEOXIP0ky3AM1sIiXqUgcUofLBTeUjjx5JbVXcaCUK+xdUCMoMirwAKhY1VKJUHSm7CuLEic474TEvcKiTU4s9tqPeBHt6vo597AaTzbxYl8FtOgvrN/O8BG24acb4009NxPLCdBNM95WegFVlJSmHBEO520+waVY/42WGPu9+dpP1hppcTHqkvnqyLa1dSLiYMmumc96XM1AmGH1wchVQMqR675ADMi6PJdBMvayqBMBZwfrx+cka5Z7AFN5ANAvliKxaEm8sRp6uj/1kYHPyKmHKCYjOhllYmCmq0vkue8a7Tyx7EWSy81UQv6Lit49ByDkZeP2WEtU9WLzMfitbr2dbyL1Lc4OEBkGJxc6Xw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(366004)(346002)(39860400002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(41300700001)(38100700002)(36756003)(31686004)(83380400001)(5660300002)(2906002)(26005)(86362001)(2616005)(6512007)(6506007)(6666004)(8676002)(4326008)(8936002)(31696002)(478600001)(6486002)(6636002)(316002)(54906003)(66476007)(66556008)(110136005)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDhpaFY1bGRyT01TVE82b1FkYUpYbS91NVIyVGNKR01IZTgyMUppTUZXeU5N?=
 =?utf-8?B?Q3RFN29nOERzQXJoT2dMTTIwM3hhU3NmM0RLNUVMRVRwdFRDZzY4V3BJYUpM?=
 =?utf-8?B?NGcyYWhrdFZZVnhPSlhlUm1wOC9WdUFNQXNGcEpoeGpTNEVzSHpxYVFsQlFt?=
 =?utf-8?B?L0dVMFRWcVZnRUx5OHZwS1JvdFV0c0VMMEZ6aWtLcVJndm9hQ3dzUTg4UW9N?=
 =?utf-8?B?Qk16K1dqUURSUC9vRVhJSGRpdnBuSFAvcmEwVk55Qy84ZjFEd0hQU1RLdXhp?=
 =?utf-8?B?TlIvQ1p1aFB4c0hyTmtmelpwVXdVd0dSUlFFNE9jVHhibkRmZm1XTTl2Q0RI?=
 =?utf-8?B?OEZrYkNHRXRGVHZKbUZ3dlhnZ001R0NzeGhDbUo1Vm9LeTJKTHc5UUNtVzBW?=
 =?utf-8?B?N0F6QXBSNCt6bGFHeWhjQkoySUpLNTQwaHNIQjVYd29aR25XalJuV1hJSHdU?=
 =?utf-8?B?UXhHNElGRDRSQXFwaDhWQjRvbE1EZWdweU1EdnE4NGlGY1VRYWlZOVAvcEFi?=
 =?utf-8?B?c1FNREZsaktvbmpPRUFmZUZ3aEVCM0sxWFQrTUVOT1IrVFNMUzZlRUNzUDRY?=
 =?utf-8?B?aGFBcVdrNzhmNE9seWd2U2pkVmkyWTFGT2g3ektIQWdlUzZTbnBhZXh1T3Zq?=
 =?utf-8?B?QS9RdGE1OU5pZmwybVgyQlk4NU5iNkZnVSswQjhFWGJvT2thdzc3Rmwzd09v?=
 =?utf-8?B?YkJRRG0wT0dzZ1JWU3hyWXNRK2lSdXlLcS9lWFRDWWZzaW9zNk5OVEIwWkdy?=
 =?utf-8?B?eisvV1JaUU0yc1p6ellZYy9TMEExUlRmSmlWdmlFRUgzRGVobENxU0dOWFFM?=
 =?utf-8?B?d0pjLzUrYllQY055ZFRETnFXaHpSSWFtMUtkVmRxbk5nZTZNK1VkdXg4ZldS?=
 =?utf-8?B?bndaU2pyYk1zLzUyNVVmb0xCejlZa3NKcUJsTGZmbkFONUJYaTVlejM1WW53?=
 =?utf-8?B?WFFuSTNEY2ViWFdXNkcwMVZGSWQ4ZUVjbnUyemc0b3BoZEo3UENxc1E0akhW?=
 =?utf-8?B?bWxkVUorZlJUOThmMmZJY25QY21MTWtMTmd6bXppbVZMQU90Qy9DWWZRTjcy?=
 =?utf-8?B?Y2xVUHJVaXdaVU9jaEhxMmV0UFJnNjkrL3ZWWStuL1VBeXQzdFdRc1htVkRH?=
 =?utf-8?B?OVFETVRHek5vLzBNRFEweWNMU0pNOTlHaSt6enAwekhxdURtVnFHbEZ2d2hF?=
 =?utf-8?B?bmpUQUZ3MUZQVC83MHNsYlExQ1oyVmRuZmVnQ1J1b1NtQWcyTWJRanhUUTla?=
 =?utf-8?B?OElUZnhrVjFaNW5od1hSSk1jUmhpTjF2VGc3WU9qK1VSQzRBWFRCOGlRUTBH?=
 =?utf-8?B?bm51REljTmY2UzhFWk5EQ2hQcWpmaStoUktSUFRjU3JnOW1xRWx6MkJTMkkz?=
 =?utf-8?B?bTNTdmVVOVZRbmF6ZmVrc2ZJOVBrRy9TTTBVeDVGQlNaOEdpejBMREFWWlZM?=
 =?utf-8?B?VTA2WlIrWmpmN3A0aXJxVFU5N1VJV0tadW1XMFkrRzN3THlBenNKbzlDY2Ux?=
 =?utf-8?B?R2VZN3dKRjdmOTYwSjVSMkd5N1JRYjFRUHNvUzUwSlhXakFiTXB4R1B5NSt1?=
 =?utf-8?B?Rlp4dG5sN3UrcnBLZFIrM1VMNk9yc2NzdlowY2M3amdSOVRFSDRGeE90M0Rx?=
 =?utf-8?B?OHB5K08wZlNUVUtVQ1pJK1EvMm1vUUJialFBUGZlcVZBcHN0OThCVlo4cFMy?=
 =?utf-8?B?eFZOWGM4NXJlbHBPREQySlVScTNEOWFyVkg3REpyT1cwSTN1TFRsaEpMelJy?=
 =?utf-8?B?V3Y1b3FPRDFtWG9Rcm5ORlRwU0dyaXFYc2JnTkpTN2dkOVFKWXVUckc4Y3o4?=
 =?utf-8?B?bEJtUG1FNEwvUXVMQkpHc2tIVVJoUTNnK0JPSmZwOFNPR2RBM1Mva3dxcEYr?=
 =?utf-8?B?dExERzdxVE9maGttOE1DVzJvdDFRS1FmSDRvRXoxU05HZnNKT243aEdJMVhO?=
 =?utf-8?B?dzM0dGZKWHZUWjFralFLTG5Xd1lUZEZuSHVYNFVuNnpncFdHbDdpR2trWC9R?=
 =?utf-8?B?NC9iZmdrcm1TWWIybU5aL0ZDZW54WjFxbDdKOTFwUUxTaTN0eEtDOEtNSjIz?=
 =?utf-8?B?NnArMjJVaGYwQ1JCVkNaN1BHaUNxY2hTeDVIaTFiRzhuT2U2NWF2b0VCZm0x?=
 =?utf-8?Q?24ZM5zjPx8OU9L5G4fM/9EuVC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96142bc1-2c90-4b77-560b-08dbf0f2712d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 15:47:07.6288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bX1+X9bOPhM8AeUL0w3/9oQXYHaxz5AkGdrc50RkCfw33phT1BKmuJiPDlPtqRTe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8828
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.11.23 um 16:22 schrieb Nikita Zhandarovich:
> While improbable, there may be a chance of hitting integer
> overflow when the result of radeon_get_ib_value() gets shifted
> left.
>
> Avoid it by casting one of the operands to larger data type (u64).
>
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.

Well IIRC cb_color_bo_offset is just 32bits anyway, so this doesn't 
change anything.

Regards,
Christian.

>
> Fixes: 1729dd33d20b ("drm/radeon/kms: r600 CS parser fixes")
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> ---
>   drivers/gpu/drm/radeon/r600_cs.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/r600_cs.c b/drivers/gpu/drm/radeon/r600_cs.c
> index 638f861af80f..6cf54a747749 100644
> --- a/drivers/gpu/drm/radeon/r600_cs.c
> +++ b/drivers/gpu/drm/radeon/r600_cs.c
> @@ -1275,7 +1275,7 @@ static int r600_cs_check_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
>   			return -EINVAL;
>   		}
>   		tmp = (reg - CB_COLOR0_BASE) / 4;
> -		track->cb_color_bo_offset[tmp] = radeon_get_ib_value(p, idx) << 8;
> +		track->cb_color_bo_offset[tmp] = (u64)radeon_get_ib_value(p, idx) << 8;
>   		ib[idx] += (u32)((reloc->gpu_offset >> 8) & 0xffffffff);
>   		track->cb_color_base_last[tmp] = ib[idx];
>   		track->cb_color_bo[tmp] = reloc->robj;
> @@ -1302,7 +1302,7 @@ static int r600_cs_check_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
>   					"0x%04X\n", reg);
>   			return -EINVAL;
>   		}
> -		track->htile_offset = radeon_get_ib_value(p, idx) << 8;
> +		track->htile_offset = (u64)radeon_get_ib_value(p, idx) << 8;
>   		ib[idx] += (u32)((reloc->gpu_offset >> 8) & 0xffffffff);
>   		track->htile_bo = reloc->robj;
>   		track->db_dirty = true;

