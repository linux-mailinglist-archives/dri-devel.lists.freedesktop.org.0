Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1222B096F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 17:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FC36E10B;
	Thu, 12 Nov 2020 16:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490E06E10B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 16:04:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0sMfmQ5w9Tb3lQtjS9DJI5gyGgBVe2eCItP9ZozsP2EpTsKEPY4DzUaO9YycvyFakxEBVlTANWMDgPZbwXav3nv1xzWLTsR12GtCISHWNhKLrtW3ToxGNI9vTrDwDOYlk8CcI53Qpknek1VGytin4mZvWEfnUUL3w/ZIEXf/GbzfH0bIhEYiwuNaJIYmVeGZwaPXhW+lwaY+3gqMB3OZTHNdiQSHVrZhU4Te9s2r9lq88Lt1JDajD6Ppo5JWfxx5JeRt+cNoCIveNxE0E+Ko7yxHcdUwbn51XUItc6HvEzWZo3hpLtPStZ+tLJJ47TpomFDq5kym/P0EWOpAIlruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKEDLIIfbYxri+kMz7g63NO0PsGcH90vVuikmUvEes8=;
 b=mkVqy2bPx+Geq8hBqF9BOYRXrMk9m1OMLBsWTFpoe7enatXLhHHVU8iPSpg8PH68vWNMuIoJ4PKCeDdJRB0u3KGeC2+aWN6Or2uxp0JzqNhkeO+iI4awyYU2NQzfjh3XhGIBKq4cYqzBblACokfysukaP1//trM4n6ns9SSQdJzW+hXwYiqaMfEYcwaCZQOQ+/ffmj4d9oI+o/ojVyqmSsNuCNFcCY32jzQZNdgPp11zKuJpIL5M82e/iJD/krC/XE1Ha2fR8QdWUpxCYkud5n2cHPZYBAu7emM8VwLSj29kxESOMy29qbsyXDyIqpEVD5p+ATuO8EQFDcyfoIrGLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKEDLIIfbYxri+kMz7g63NO0PsGcH90vVuikmUvEes8=;
 b=g086FslMhnJI36D8K25OM9B30X61t3gNM6NwhR6zpBVnvkRDmtuY5klT5Y6MeVdE18kUKIb7qoEAYZMfGVghWbcg14z7G1+wODriiXpVmUYQT4pMOSGs0SCDrQxEYy969O3HZ1xvfZQeLSbJk1HLXbZkM+qxAHQc8REAJO9cvgc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB3019.namprd12.prod.outlook.com (2603:10b6:5:3d::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21; Thu, 12 Nov 2020 16:04:39 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 16:04:39 +0000
Subject: Re: [PATCH] amdgpu/test: deadlock test for CZ family and RV family
To: rajib.mahapatra@amd.com, Alexander.Deucher@amd.com
References: <20201112153536.85696-1-rajib.mahapatra@amd.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <10ebe86c-a710-26c4-3f40-60649e81a831@amd.com>
Date: Thu, 12 Nov 2020 11:04:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20201112153536.85696-1-rajib.mahapatra@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:31da:32c2:75c6:daf4]
X-ClientProxiedBy: BN1PR14CA0026.namprd14.prod.outlook.com
 (2603:10b6:408:e3::31) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:31da:32c2:75c6:daf4]
 (2607:fea8:3edf:49b0:31da:32c2:75c6:daf4) by
 BN1PR14CA0026.namprd14.prod.outlook.com (2603:10b6:408:e3::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 16:04:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ae883bde-cafa-4d92-f2a8-08d88724a89d
X-MS-TrafficTypeDiagnostic: DM6PR12MB3019:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3019FEE8EAFF4F0981F96637EAE70@DM6PR12MB3019.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eOaMoOzOlXKHVb2HRlFDcWcrWLfacBPSAgIaH2rST+VSy5ANG+FEleqd61o1AAUxfF4oKaGmCfHuu0KfHGLeiQKKqxOhDxx9uATUOYeoVfKams/UdIYK90dQnJqj4jg9x2mFncbB/1/NqsV0vfYI7yQ60M+yCLos3Unl5vPeKX1b8YFORGTgTqv89Y3QVSPAA3B9Bs2DnT2OvpG/QZCGZY1Gm06LWzScASYJrW4ml0a4Gv3nLNRq7970uoolnGbpVx2kIKN2i5sOINdh9d4mCewFU54/gzZNGUaljrz89ekuBRUTWifzCnF8S0FkWU3q1TyAAefIP4yS9JoQ5gZMyR7IgfSUNJ74fZ16nqdY2vxYvFvqEIQQkeN5ZlCbhER7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(2616005)(66946007)(53546011)(6486002)(8676002)(83380400001)(31696002)(478600001)(8936002)(36756003)(2906002)(52116002)(4326008)(86362001)(66476007)(6636002)(66556008)(186003)(316002)(31686004)(5660300002)(16526019)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YVVzRXhBVkVPVnJFUzV2MDQrUTlDckdNNnExU0pmZ2VQbTg4NnBiYTBXaFBM?=
 =?utf-8?B?SXlydU4vaE8xRWxxMTNXbUhDV29PejJUV1c4S09VcWE3d2ZGaXZLQzRCYTF1?=
 =?utf-8?B?dnY0RURJQk56amFwTW1EK0twMWVZUWNMVGx1alJCZzVVVWZESU9rL2NCM3ov?=
 =?utf-8?B?RGJBSnd4aWx0Y3FFb2twUmdndG1OVkdaaGxCWmtuZk5kRUNVK2NjOWllNDJk?=
 =?utf-8?B?bUR4aytPRjNsOFRsSjhnb1dzVUpNSW9mVzUveUtkSjNqVFBrczVtZXYrN29F?=
 =?utf-8?B?ajQ1TzIwZkNIT005aGF1VnMzQ0xqQndDczE2bFR4SkhWV285V2dwQWltQmcy?=
 =?utf-8?B?TFZ2ZHp0eFBIZkQzZ1QrTWdGZ0pYN25ZVFJLeStnQmtVZmRMblFJZ3AzWFhj?=
 =?utf-8?B?Zm81aVZtc0U3TzlXMDVvSEUzU2J2QlFWWkR2ays0UkJzcTdMWlBtRWI5UnRa?=
 =?utf-8?B?Y3dPUTF6eGpXbXROQlVOVVJnQmFDelJpT05ldmcvYzV3RWZEOUVqMFMzZ1hG?=
 =?utf-8?B?NFg0b1FZbXUzLzMyN0l1citWd2lVQ3ptVXhXZXBzVjhYVHc5K3FQYWNwc2I1?=
 =?utf-8?B?T3l5QXJUUWN5d0ZiSHBWN0FZOXYyY05PVTFHak5WRVo1eGlmOVJBTm1SY2hF?=
 =?utf-8?B?a1RFZzlRYnBjRnRJSHpmSkR4ZGl4MkIwdEdCNEhWUXY5TEJpck8ybkRtVG13?=
 =?utf-8?B?RDFPc3BQZllYTkZPSHFsSHFBeXFXdWxJUndyMTBSTVNFQ3hLQmpFV3lpeEtn?=
 =?utf-8?B?dzdDb2tsdmtOcmFQY0lOMFRKbG13THUyUVZ5L3Z3WGcyTjIyYktpWlpYdnVI?=
 =?utf-8?B?VWR2a0M3UjFoZDlWWEpkT1JQZGRkOUdwUkV0QWNUazkxVXZ3bXpwUDBHZFpn?=
 =?utf-8?B?ckMxWDh5WndYUmttY1dueHJoK3VKaWhDaDZnWGhLdWtZalpkT1Yxd0dmODQr?=
 =?utf-8?B?VFBCNWhqWUhmN0dMdStjNmxEZzRWOWxva3IzQ29YMjN4dmxQdHJubzd6bXRK?=
 =?utf-8?B?czRYS3Yxc2pVb21uWnNLVFJSV3k5QUlBQkJ2RGJBMGg2MFFFKzBhVmxZS3ZM?=
 =?utf-8?B?VnhlRVZueERUU24zV3NJYnpMLzE5emQySGdtWjd6TWZMUHpCYnZxTjhiU0JS?=
 =?utf-8?B?aE00dkE0VmNzWlVWbmd4Mm5XMFAyV0NWU0hnWi9aYllBRjlvR3VXZTdGeWF1?=
 =?utf-8?B?RENTaWdUNzJrcUZyYytuYktleW5xZHlVYW9RNG0vcjNkVmJvcGdQcFZmc2t1?=
 =?utf-8?B?QmlxbFo0NXdkRGN1UUx5d1RHNUF0WVcxRWhidW4wdy9jN3gxQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae883bde-cafa-4d92-f2a8-08d88724a89d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 16:04:39.2740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4bgq5h8LUsXZQK7nsLVU2lGuoWgwDnMshYfqGFoTrKAHUaPZLY9MtXkf4Xp1HreHaU/DiN7DlCSbFAIcFDUoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3019
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Andrey

On 11/12/20 10:35 AM, rajib.mahapatra@amd.com wrote:
> From: Rajib Mahapatra <Rajib.Mahapatra@amd.com>
>
> It enables the test for RV2 and PCO, whole GPU reset is not supported
> for others.
>
> Signed-off-by: Rajib Mahapatra <Rajib.Mahapatra@amd.com>
> Change-Id: Id51605d07b334ecea7a88b3c95fdd57008a4458d
> ---
>   include/drm/amdgpu_drm.h      | 15 +++++++++++++++
>   tests/amdgpu/deadlock_tests.c | 18 ++++++++++++++++--
>   2 files changed, 31 insertions(+), 2 deletions(-)
>
> diff --git a/include/drm/amdgpu_drm.h b/include/drm/amdgpu_drm.h
> index be84e43c..bb7ded25 100644
> --- a/include/drm/amdgpu_drm.h
> +++ b/include/drm/amdgpu_drm.h
> @@ -995,6 +995,21 @@ struct drm_amdgpu_info_vce_clock_table {
>   #define AMDGPU_FAMILY_AI			141 /* Vega10 */
>   #define AMDGPU_FAMILY_RV			142 /* Raven */
>   
> +/*
> + * Asic Rev
> + */
> +#define RAVEN_A0 0x01
> +#define PICASSO_A0 0x41
> +
> +#define RAVEN2_A0 0x81
> +#define RAVEN_UNKNOWN 0xFF
> +
> +#define PICASSO_15D8_REV_E3 0xE3
> +
> +#define ASICREV_IS_RAVEN(eChipRev) ((eChipRev >= RAVEN_A0) && eChipRev < RAVEN_UNKNOWN)
> +#define ASICREV_IS_PICASSO(eChipRev) ((eChipRev >= PICASSO_A0) && (eChipRev < RAVEN2_A0))
> +#define ASICREV_IS_RAVEN2(eChipRev) ((eChipRev >= RAVEN2_A0) && (eChipRev < PICASSO_15D8_REV_E3))
> +
>   #if defined(__cplusplus)
>   }
>   #endif
> diff --git a/tests/amdgpu/deadlock_tests.c b/tests/amdgpu/deadlock_tests.c
> index a6c2635d..3be99dc8 100644
> --- a/tests/amdgpu/deadlock_tests.c
> +++ b/tests/amdgpu/deadlock_tests.c
> @@ -126,8 +126,22 @@ CU_BOOL suite_deadlock_tests_enable(void)
>   	if (device_handle->info.family_id != AMDGPU_FAMILY_VI &&
>   	    device_handle->info.family_id != AMDGPU_FAMILY_AI &&
>   	    device_handle->info.family_id != AMDGPU_FAMILY_CI) {
> -		printf("\n\nGPU reset is not enabled for the ASIC, deadlock suite disabled\n");
> -		enable = CU_FALSE;
> +		if (device_handle->info.family_id == AMDGPU_FAMILY_CZ) {
> +			printf("\n\nWhole GPU reset is not supported for the ASIC, deadlock suite disabled\n");Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> +			enable = CU_FALSE;
> +		} else if (device_handle->info.family_id == AMDGPU_FAMILY_RV) {
> +			if (ASICREV_IS_RAVEN2(device_handle->info.chip_external_rev)) {
> +				enable = CU_TRUE;
> +			} else if (ASICREV_IS_PICASSO(device_handle->info.chip_external_rev)) {
> +				enable = CU_TRUE;
> +			} else {
> +				printf("\n\nWhole GPU reset is not supported for the ASIC, deadlock suite disabled\n");
> +				enable = CU_FALSE;
> +			}
> +		} else {
> +			printf("\n\nGPU reset is not enabled for the ASIC, deadlock suite disabled\n");
> +			enable = CU_FALSE;
> +		}
>   	}
>   
>   	if (device_handle->info.family_id >= AMDGPU_FAMILY_AI)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
