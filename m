Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 796364A89C6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 18:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE9710E5FA;
	Thu,  3 Feb 2022 17:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD2810E91A;
 Thu,  3 Feb 2022 17:19:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AU7mT3Sdf3NasQawgww84Bwjf5e5XHtw9Gxujn/7RMgGC6Co+0lnE8LQ6BRx6O+8B656WnywuOYaprDwtVo3aFvQf0vwvfhzhBRQeiN0EJVqclguOsc2a9j+zwU5THIngB1yHi0dBI/mcVCoBB4vGHF5XaLXGYr6GaV8UPf6P24PrZqQtVYtk0w+GEjzpwYAiDdrqw9sJ4RHUk0SuDZ+8JiKTNn+W9nnvF0RT4imFh5qJCcXaZ+i9kH4aNukAbzDfmRnU6YrLgsz+0wz/wHFWsAfziA7BfULe0WhyOXRqeWKsYdQNgkVubHa8UspNOLhNnatV1AAHXuUWikrK0r4/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YtauCLpNzcfdKolB+ZrXtHU4Nq4MhykS5SAxmDe2wU=;
 b=mDVlXDT0uIv1G3bvy7s7JnhK7d7oRBlLvX4JzFtjm+yPAY6QdTduYwGmxafu9sX9cZLGF4f1XM1ztQbKi/bVGdTCTisdoEi6LpRBLFSwa2enH+5KP3UV+hLKHp5ASEeULbhmnElYMBcuLVyW1Cyl7Tn9Bu4xidh7U3nQMe9ZGS75Ob2gLjQy9oqQR/02SE4tmBx54kKDdpq2ViJY+i0s/3AcbtnDl/s6IlkZbKt9wa/9tpQV3PKxsHX80nHKrAfzF9pG1qaNDePpbPZhw/HSVBfhcowXJ9kwWBQ1sVTvRaeJwL2q0jTq101tPLa3WWw0tGoyEmpzYuCUS0u1dcdn+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YtauCLpNzcfdKolB+ZrXtHU4Nq4MhykS5SAxmDe2wU=;
 b=TYAU/TZAVFibJjZkHk7fYo8gMPr6YcOxoOV3DJt2BGnENc2AwudYQG4/YZ/RqM18VW/PVE5AynHRCyofv29zuJmfkyxZSMxCPpVX57+9MQLPRAQwgGAXy5FhaaNeOv9erAfikR6bWGShgyirqwq58WPpgZA3V3ebbhl5l519HjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM6PR12MB4140.namprd12.prod.outlook.com (2603:10b6:5:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 17:19:25 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%8]) with mapi id 15.20.4951.014; Thu, 3 Feb 2022
 17:19:25 +0000
Message-ID: <b97d5d0c-e54d-332b-73f6-3c5b0e6cf7a6@amd.com>
Date: Thu, 3 Feb 2022 12:19:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH -next] drm/amdkfd: Fix resource_size.cocci warning
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, daniel@ffwll.ch
References: <20220203050421.39285-1-yang.lee@linux.alibaba.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220203050421.39285-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YTXPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::39) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c475cdf3-67a2-4192-031e-08d9e739534d
X-MS-TrafficTypeDiagnostic: DM6PR12MB4140:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4140473AEDF88CF9ADD15FF292289@DM6PR12MB4140.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:393;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ZDGkOomw34QMFMgHwZIRYGIsmRqncHCgrIDUwnG7t7x1vUZttTgQxU3A7GlTG9NkljILJUVdVk9paigPxRxDtH09GvRtXiUpQVMdtUOQU8mUen+fII/S6gZ9U5Jt6x3tMuVbMRo+/kxb0Jf0r9YSkN1/wFN4ej8gtCL7gg12l6u2DzVbdr4T0YH71l+Uy5cH58dSgsS+2EJ8owVAR5D5sIyABb3AdTvA5jhzLwbCZGeY5iYSxkv2PN6Qf6MYOZ6BWYQXgvbrQM3FHTqccU3m7mv3IYV8+1hHfSHwySF4REF2+qRCfLoVexhByk/76tUnLGWIXAkWBSG4xNI2P1hXDXV0ohKgDAC3Drzq26DBJ4cvLSfN+jMNMNb9gTevxhJIStGWZp6c5WrxNyQHhagVah15zNjSpYMr5gM8busq5XgbhR1IDFoVoa1MxaP0eKyiTZMipeKOHZOlWIPgN6ocBKFMPoMbyqUb7bDwE1SzTbgoWuBybPMCwAa4ZY7wlbsq+xpPQ9GGLkEMcfijSwkv3PXdAVo4VJUjVd9i6QEX9CvtNzMGfVEMZ5qRwSv+B6hrGfrMpRV6LokcPtyv8UPaGMdHvhv7rM+rascIck4+ki6TiGEEM4a/+TRv+CjHIsPXTwx6b8WzUfI++PYLLD3I731+gthXDKpVCqzyA2BNni7ey2lpm1mgY6xDkKVdTVTh/KnjYTNgrBNSh/fUfvsMQlvOuX97oFk2CIwG2pzUGTQ8pEUrflg7iMXvoo+AzJ8YLJOVoy0QT3iM49qp9tadZ23xPtpkkj2Kz3FluIYUtu3ZP7Yu9IOTusy+tnPkyUIzAiwiduQUhPyhvmJ+PSF+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(186003)(26005)(8936002)(4326008)(8676002)(66946007)(66556008)(66476007)(36756003)(2616005)(31686004)(316002)(6512007)(44832011)(966005)(6506007)(508600001)(5660300002)(6486002)(2906002)(86362001)(31696002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDUwcnBkZEFDc0h1YmUzNTFMaGRSeDNUL0Ntb3M4UXl1eFJYYnNmSThDL0ps?=
 =?utf-8?B?dVpYckRhZkE3bHdrRUhjakpVUVFLenZwTXI3QVRFU2lXbjlBdXVlL3JpSW93?=
 =?utf-8?B?cUQ4MS9qVHN6bXZxWTJmRmk4RlgvT2YzakpBb3g5YUdVc3pVZTdBcm5VL21E?=
 =?utf-8?B?Zkd3QkIvbnZ0N2RJWXVKbjZ5Y2lyRFY3aDBVNXErbTQvb1F2NktJMmF4OHRB?=
 =?utf-8?B?Z0RnN25ZOTRHVW4yM1h2QW0yMjN2Y095UkpVcE5OR0dtZXF5dGZxbjhpd2JV?=
 =?utf-8?B?bVo4TkNUcUErNnVTeHlxcWYrOTRuWkh1VGNOa1ZEKzhUMnVxRTlmcUc0STFo?=
 =?utf-8?B?Uzl1UDBKSzQ5RkVyd25oR2RLWnRnSVNsMWNtTkkyZTNjRUxucmQvdW9Xa1d0?=
 =?utf-8?B?cy9FaW9UZ2lrSlJOL1RTOGptKzR1WGJTSnlPK3NraGZqWGt4MEpkaXNhUFdm?=
 =?utf-8?B?M28rVFlyVUdLSGppeGRnTVZQemJ1eWZVdFdxV1ZuUm0zYzliWHVNcEY3bCth?=
 =?utf-8?B?bkIvUXY0MUpIelRoZzVXV2JMWDViQXg5aVNPQXp5bElVR2xnMGVvYytpU1VM?=
 =?utf-8?B?bXJjdFl6M21LM04xT3VLK3VvRnI5UHk0ZEVhSStRajRwN3NSdHlhbWZrWTNh?=
 =?utf-8?B?UG9LSHRTWHdGYkRobmtzcCtxTkJpa0t3eWVaeDFvOFkwWndlcEVQOEppbDI4?=
 =?utf-8?B?aGI3dDU4S2tGUjRyaXI3K3NrZTkveUV1ZDlNb2VwUXgxeE1KSDEyeDUxUGVt?=
 =?utf-8?B?cG13QlZCZ3pBUy9QQVd4K2tYTzJLa2F2a3NOQXloaVViWG8yTjZ0M3F2anFB?=
 =?utf-8?B?blZrWE5hM2RtbFRQVHBGWHcrVFZ4ZGlkUTBiRFhVck5TMi9HS25IREpWV2NI?=
 =?utf-8?B?Nm93eWs3TEFGT1lwbWl1VGZIUTE2WDFOZUs2VGVpY3FEMzdtOUhWbVluUEc0?=
 =?utf-8?B?TWg5UkhuYWV4SGFKcGJLT0E2dDlwWk8xNHB5cjF0VHB5M1dqajNkanhUdmVC?=
 =?utf-8?B?MmZTUndFclFQOTlLQWxFQkJUWDVMZFFSM0NVQ0p1TERNZ2VDOUJlcHRCanZS?=
 =?utf-8?B?c1FWZHAvWXloYzhEblFsNC9MVFFoTXpvUEF0OGVFdTVYMTNtNytLa2NETzQw?=
 =?utf-8?B?K2ZMby9UNmtROXBiajlmVVYwNXRoemF4SUhLRkFSRmJyeFJXeVRIRUtsTlIv?=
 =?utf-8?B?VkJHV1dwZkRLUXQ4a3VFb2NPVTRKKzlXOTlJMDZMZlZpRnU0MSsxajlEVnRX?=
 =?utf-8?B?bFdwM3FPSjhFK1l6ZVVxZGpTc1J0WmRjQ000VkxjdW94cjh3c2hoMTBrSjN1?=
 =?utf-8?B?Yngyb1NNUy9YL21uaUY0bEQ1YjkvMS9IUWVlb3N6SjZQL1F2UzRxcStTUXZJ?=
 =?utf-8?B?OTNGMmQzNFdrMHdwVTVscityWk9vWXZic3UwNkF2OWs5RVpOY1k5V0ZlV3ZK?=
 =?utf-8?B?eFRxSUdzTW9vR3JMY2tFdzc0cTF4YnVpRmZvQ0FkTjJqcXRwRDc1eEhPaktm?=
 =?utf-8?B?dnNySzRhSmRyTCtZc1NzeW5JZUNsNHZjUnowMkFycDVqVHBuanhyZ0ZucjZv?=
 =?utf-8?B?Q1JSMDRaL1ZDMmVCWHIwSXJRdDdUa2ErUllJTys4cVV4ZG9VamE4dzV6SlJi?=
 =?utf-8?B?anB3cEhaanFRdWFNbkNRU3V1ZEthS0VKMkthVGFPVXViSEZGYjIyNHBHK0ZU?=
 =?utf-8?B?SXVHdkNzR0cyU21GK09GOVAydzZwUnc3cU50ZnpTanZhUHVRQ0dMN3dDamJ0?=
 =?utf-8?B?aFF3MWhtTmd6TUJPUDA4c2tSczNVMjNmZG1qVkJ2TkZJWkNpMWI5SmVmQStw?=
 =?utf-8?B?UG5xUGxxaEhmYjFwbEozb2kvWlBNT0s4U0QvZExYVEpQaWJSYXRkUkloeXJa?=
 =?utf-8?B?RlNad25jN2pCeDhVYy9iUEt0dnUvU1lBMVI0a0gwNGM0TVlyOGRBRURtY3hQ?=
 =?utf-8?B?OXluYTVobDVTYkhlOXY5WEZJRnY4cEh0VnNXWHc1RndnOStIZmtnSy9YUXZi?=
 =?utf-8?B?ZHcwWGFKVkI2d05YZlNPc0Jyd01VRENacmE1SEJMT1BRaGdLOXd6UnE4K2VL?=
 =?utf-8?B?dVdCYlI1ZWpVb0hVT1piMW5mTkZsRVBKUDNFdTVqYkg5OGtBakZ5Y0d6c3lC?=
 =?utf-8?B?Yk93VUZEaU1EbEhNUWk4ZXVaWHRIUGc0cFNmaW80NjRwUVZUVlhNd24rOXRt?=
 =?utf-8?Q?VUV91bF+qLY8qG7BWfffYJE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c475cdf3-67a2-4192-031e-08d9e739534d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 17:19:24.8233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dh33uWoB+jy4DpaBzAGqxRYQNEug2bOgIXFX1s82d+vVKmkbsJ7/Qa0IOLSpPhMFf9Oha0PKbbqzNZar4NYLyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4140
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
Cc: airlied@linux.ie, Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2022-02-03 um 00:04 schrieb Yang Li:
> Use resource_size function on resource object instead of explicit
> computation.
>
> Eliminate the following coccicheck warning:
> ./drivers/gpu/drm/amd/amdkfd/kfd_migrate.c:978:11-14: ERROR: Missing
> resource_size with res
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>


This patch was already applied in September: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0de5472a01804f43b7c8ddb1132bbfeb8b68674f

Which branch is this for?

Regards,
   Felix



> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 8430f6475723..d4287a39be56 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -975,7 +975,7 @@ int svm_migrate_init(struct amdgpu_device *adev)
>   		pgmap->type = 0;
>   		if (pgmap->type == MEMORY_DEVICE_PRIVATE)
>   			devm_release_mem_region(adev->dev, res->start,
> -						res->end - res->start + 1);
> +						resource_size(res));
>   		return PTR_ERR(r);
>   	}
>   
