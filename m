Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6086D3916D8
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 13:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D50E6ECBE;
	Wed, 26 May 2021 11:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EE66ECBD;
 Wed, 26 May 2021 11:59:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgL6TUKaXl94AKFK46YmMMM/m0gI3ViasAa0hIo+i+JKOJ6iMpTD9bz1FtsJI3BiZ+8UA5eBd60FUbUwbxS4MRHBHAI2pCocS10hbWgeDRKty3VD9Taris0yTl3oqpAMV9NPUk9VVZTN+thC90yvaar14hsV1ZT1ixNQMM6tF7jMSLPEUvGGT+ROB4P9xVZ2yRgO+WKVjWDKnhNM9QCfBHq5gA3nPti31V/jmuLlnv3rd/YLloAVGks1/rzsDLfuolCXAtYoNF/+TusOVQs7HVzTQ0DL3BsIkhO4faTSdk1YWchmD5tE0ULxBVeuSqhUpMro0IAEe8+4bAboc6hnaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsy08kn1VROKtfc0HRxoVYHtU1Fw47/XMQB/ow8VYn0=;
 b=heS7IfGGuANTQwFKkwBZc/spT3W3vQ58msgu5JQDbKhfv57J22B6B5uywdg7ZSMFR/ry6KeW4S8eqgzAiz1J7LwK7U29CdjNX85rlYisA4gFKLhrTTcuCGty4q3DMDlg8M7zJltxNUJCRYCdQV2caQEDQrBfgaR22l32H1edAKHmJb+oHeJ/UkLM2PfSqSVbUOXL1pcFgKOrY0mRUBfCjoSHMSRRCmmZT5hz7pDjBqOwhQws02jLnt53a6mb7GWb945eRHOn7GxADcdCxMJd1SBMzdieFSI4toaIReH42/VrC8rDUkkEZMDrgde2lNq2+8NXeGop4bSsOUsBAHjn2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsy08kn1VROKtfc0HRxoVYHtU1Fw47/XMQB/ow8VYn0=;
 b=E1z0WlhmDSCD9jIHYXdC1FSZ9daSsa5JpjVfS3LWRp56J/kyeaWL1hgcUpOaWUo2+AFmGzK1KAFybb8ePUgHaD8A5CbAUQnPdkxUxCPTK389PUwaY6J39YLChYHZ+xsgWdkF9xqYAvvUmLOqOJ9rHEsd/5tFZ5rD71D/8rjUydY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4518.namprd12.prod.outlook.com (2603:10b6:208:266::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 26 May
 2021 11:59:42 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 11:59:41 +0000
Subject: Re: [PATCH v4 0/7] drm: Clean up mmap for TTM-based GEM drivers
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com
References: <20210525151055.8174-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3e9a7a18-16e1-ed4e-137b-1065108dedf6@amd.com>
Date: Wed, 26 May 2021 13:59:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210525151055.8174-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3ecd:562c:67c6:4afe]
X-ClientProxiedBy: AM0PR01CA0095.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::36) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3ecd:562c:67c6:4afe]
 (2a02:908:1252:fb60:3ecd:562c:67c6:4afe) by
 AM0PR01CA0095.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Wed, 26 May 2021 11:59:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 029a4e41-cd94-48ee-e53c-08d9203dbeb1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4518:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4518F42323C9153F5D65310C83249@MN2PR12MB4518.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GwC3AOKC7I2etp4MbSY4CuQXae1PuvxmOAZ8CdmCTGBUCWFtMRjP9S4g575DM+FInpUKd9Vzpo+t9qZu/r5YUP9ZwQMaDsjwJ3mQ1VZ+kkfGZSRoEIYOC8A+gFL5JYGJXShqoxFbskC+ZtWvUHmodfbs3CH8WfJDZ5L+uV6+nwBFPEu3RS4F+AZntwBYt79t//SSc4SpD/a2WvfibbzTuAVRSqohR2mT7KOnyKcjfvG8qVRKR4OqmtS235Wdv2n8RcOd/I1Dbb4j0hH2PozQQRdoIeTrjhd6MbqRITcQv5TV/IQs3pEioz52AIPTM5ZsaavvCXoeTS2KkQGjARhVRbr+ZRMXNo59Xfr6sIPQ08Ui2LhJ5qPgtTd6HLVNeTE+RR/iN6QRLJXJbJF5E2I0/LfImHdilMrTyt0v7O31Yt2o6Cjgtxck4Dg06AWSrNUAZ+0DSmyobQ9IJG8XtvLWZbQK0vgnbMxcCl4ZWHs9rYB0oiD2FDGDsAgFQ5ONVysHRXK1EnfECfZvCkWFv/zK0szkEtP/mkAORO44REJ6yWxvK9dVMnFo0IEG/CIkxmEkzj55brQJ52T+GXaOUBmLtE6+dfdtmyLgSTHWPTrxBkTyXtSVWEz/ZV3GpKRH89cpaE9+mtch8ejE4QbT27o92/SQ+EmAi6EoWAwtMNKMrq9LVUjgrVKj7vSSJ/FLu3jrAwsOwY0OGmRNDKqz51R+Hw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39840400004)(66574015)(36756003)(7416002)(966005)(6666004)(2616005)(8936002)(83380400001)(2906002)(31686004)(8676002)(52116002)(4326008)(31696002)(316002)(5660300002)(66476007)(66946007)(66556008)(921005)(16526019)(478600001)(6636002)(86362001)(186003)(45080400002)(6486002)(38100700002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ditQU3Z1SERSZCtMbmh5RUJrSDY2Tzk4bEtPSVVtMDNkSGdZNDBYVHo5Umhp?=
 =?utf-8?B?cFFQUGFBdE9ibC9yZ3ZRL1YweWptTENVdG0rd2lpU2N4b3RnQlE0dWppRFhH?=
 =?utf-8?B?dnBzN0xPN3Rlb2xMNG94NDlsdWJrMThWZTJUN3EyZmJ6WXNwRWlxRFpPVEJl?=
 =?utf-8?B?VDRFeWdvaE12YVdmRDJEc0hlQ09RSUFpMnpGZ2ZvT1QyRkU3Vk84bFJrcy9a?=
 =?utf-8?B?cEZMZDJ3V1dLem1TWXBzN0pZajdnTTlWK1BQbWtQa0lwWmc4ZURUTE9NNXR6?=
 =?utf-8?B?MXF2TzJMVGZITWJod2I4MGEzbzVrOXVFZ0hza2lCcjhhNnRtanh5VFh4T3kw?=
 =?utf-8?B?bnc4Q3RPOG1qK0tpcGlWYXc0N0xkSkxDcEpHTXBKdlR0UG1wa2ozbkZ6RUVN?=
 =?utf-8?B?bHphNm5PS3ZRdkRpNDdWSzZLTUM2aEt2NVhLeUVNOUhOYi95UDUvOWY4STdW?=
 =?utf-8?B?SDRHQkJNZnJCUmVheDhxQmJKUzk3U1NhemYwYk4yWFZmVDJJOG55Q2pEMUJ1?=
 =?utf-8?B?WGRXR2FuaHhVUDl2bmhEM2FSYlorRTVEY2c2MERTUCs2bHNGMHdVa1hNK1Nx?=
 =?utf-8?B?Q000akZGTnlJNXlLWjIweHA2N1ZnNVNjczQzaHlCZ3ZWUXBsYmhxRzN0NkpL?=
 =?utf-8?B?S3VNRVh4d0d6UktGUDJvaDlmeWp4eldDMFpjNis1T2lBL1U5bmxmVEk1MDFX?=
 =?utf-8?B?U0gxTjJaa2FkT3FjL0ZtU1RlYlhndVNzVkhTOXdJajgyV3Q1ZXhtY0hsV2g3?=
 =?utf-8?B?ZERVUWR1eVlXcG9MOGhkU3l2eHoxL1J4cy9mc3pUcmx6ZU1QZDdydEZ1b1Bs?=
 =?utf-8?B?emNxc3RVc0lGQ0o3Z2h1OE5PajJQQ2VGWVRHT21pM2NDdlhnRkVTUUhrTFF4?=
 =?utf-8?B?TmxKUXVSN3dNTjEvMjBEMlp5SmtpKzlTMytNMmhobDdnUm9FaUhFMkhoV2Zy?=
 =?utf-8?B?dGNTcnRGUUJKRHlPdnU2SllSbDNKaGlpM1RxUnY2cU9sUDVLY0JLYmpXSndQ?=
 =?utf-8?B?d0RxVXluczd2QStnMmNlWlBjL2JRUnVhTXhEbHloWW93OFFLaVV0YnhjMk9F?=
 =?utf-8?B?TUpSNVNPUkNCMzZJa0p6SDNpbFFPc3ZNc2hkUkcrYm5ialpMUXZLZmI4WDRG?=
 =?utf-8?B?dXZtNllmcmVFOXZ4TWFrR0ZabXVjRzJyWm4rcGJjNllHTVlUWm1pK0Q3bExE?=
 =?utf-8?B?QlJYNGE5dEZtNWdFSjh4Y250V1lKS2d5VFZTckYzS0RyQ0JZNE1LRVE1M2Qv?=
 =?utf-8?B?VG9MTUhmSTdDZ0FYUzcxazkvNDNXRHprTCtlVU9kNXk4aFoyMEVWRnl5Z0FW?=
 =?utf-8?B?aENxZWo4TzBicU1JSGd1TXg3dkYvMlVoeUFXazliazhJMzRTR2wrWkUyL0RB?=
 =?utf-8?B?TkdDQ1h5L1JFcVVHNlNZTktvT25WOGxmT1M2VjVwOUVKR2hRZUs0RTVtY3Jt?=
 =?utf-8?B?dGNFZnAydzhYZnpVUkpxR2oxYS9mMS9ZNmNkWGd3UmVNNUhjTTJUUTV5NXJT?=
 =?utf-8?B?Wjc4Y2prWEVxbGx5aW5tRE9YMHNVZC9CRkRxbjVkMEVzVkM0K0JvOGtsSEln?=
 =?utf-8?B?d3pxcG5uQU9qclFlOFNXWFc2TWJ3L1J2elc2bnpQSGR0Z2JPZzdPWGoxbXJM?=
 =?utf-8?B?enZNaTY3dzMyQXQ3bmhqZWdHUHZMaGlBUi9FbTBjcGdTMFVISGxxdG95a0p1?=
 =?utf-8?B?VGFDUkJQTC9FSllaaUlmcjFjdTNCUytPRWVqRTRrODdnNmVnQTk1eldpZFdV?=
 =?utf-8?B?enJHeWozUUU0cTJqSVBQRXVWak5aQjl1SHhZWUNUVjFqSnZHOXE2VHVqb29G?=
 =?utf-8?B?ck9QNno0b0ttYk41d1JHbmJUNDZUWjRoMGZOQStnOHNsaFBvekhLZVMrd3E0?=
 =?utf-8?Q?l0pGZAi96JCQA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 029a4e41-cd94-48ee-e53c-08d9203dbeb1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 11:59:41.8366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8MD+sGXfzuB1EBOxmufJz41V5TX7PdYdFBb/uhdY1BuYh7QdB8Y0wOZtHMkbZCs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4518
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
Cc: nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patches #1-#4 are Reviewed-by: Christian König <christian.koenig@amd.com>

Patches #5 and #6 are Acked-by: Christian König <christian.koenig@amd.com>

Patch #7 already has my rb.

I would say push that to drm-misc-next ASAP.

Regards,
Christian.

Am 25.05.21 um 17:10 schrieb Thomas Zimmermann:
> Implement mmap via struct drm_gem_object_functions.mmap in amdgpu,
> radeon and nouveau. This allows for using common DRM helpers for
> the mmap-related callbacks in struct file_operations and struct
> drm_driver. The drivers have their own vm_ops, which are now set
> automatically by the DRM core functions. The code in each driver's
> verify_access becomes part of the driver's new mmap implementation.
>
> With the GEM drivers converted, vmwgfx is the only user of
> ttm_bo_mmap() and related infrastructure. So move everything into
> vmwgfx and delete the rsp code from TTM.
>
> This touches several drivers. Preferably everything would be merged
> at once via drm-misc-next.
>
> v4:
> 	* rebase on top of amdgpu hot-unplug changes
> v3:
> 	* tidy up the new mmap functions in amdgpu and radeon (Christian)
> v2:
> 	* removal of amdgpu fbdev mmap already merged (Christian)
> 	* rebase on top of amdgpu fixes [1] (Felix)
> 	* replace pr_err() with drm_err() in vmwgfx patch (Zack)
> 	* several typos
>
> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F88822%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C782d195c5e8e4ca6351b08d91f8f4e90%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637575522662233381%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ZJ%2BIx9hFBXzQubYpEKcOngREtjjMKwaChyIonKSACFY%3D&amp;reserved=0
>
> Thomas Zimmermann (7):
>    drm/ttm: Don't override vm_ops callbacks, if set
>    drm/amdgpu: Implement mmap as GEM object function
>    drm/radeon: Implement mmap as GEM object function
>    drm/nouveau: Implement mmap as GEM object function
>    drm/vmwgfx: Inline ttm_bo_mmap() into vmwgfx driver
>    drm/vmwgfx: Inline vmw_verify_access()
>    drm/ttm: Remove ttm_bo_mmap() and friends
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 46 -------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h |  2 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     |  4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 55 +++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 75 ---------------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  1 -
>   drivers/gpu/drm/nouveau/nouveau_bo.c        | 10 ---
>   drivers/gpu/drm/nouveau/nouveau_drm.c       |  3 +-
>   drivers/gpu/drm/nouveau/nouveau_gem.c       | 36 ++++++++++
>   drivers/gpu/drm/nouveau/nouveau_ttm.c       | 49 --------------
>   drivers/gpu/drm/nouveau/nouveau_ttm.h       |  1 -
>   drivers/gpu/drm/radeon/radeon_drv.c         |  3 +-
>   drivers/gpu/drm/radeon/radeon_gem.c         | 49 ++++++++++++++
>   drivers/gpu/drm/radeon/radeon_ttm.c         | 65 ------------------
>   drivers/gpu/drm/radeon/radeon_ttm.h         |  1 -
>   drivers/gpu/drm/ttm/ttm_bo_vm.c             | 60 ++---------------
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  9 ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c    | 53 ++++++++++++++-
>   include/drm/ttm/ttm_bo_api.h                | 13 ----
>   include/drm/ttm/ttm_device.h                | 15 -----
>   20 files changed, 202 insertions(+), 348 deletions(-)
>
>
> base-commit: 28dddc0c90bc6464be4c5e3224a293c022564a4e
> prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> --
> 2.31.1
>

