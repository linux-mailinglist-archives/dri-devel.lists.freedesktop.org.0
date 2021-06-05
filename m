Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B6839C7DE
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jun 2021 13:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1476E4F1;
	Sat,  5 Jun 2021 11:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C566E0ED;
 Sat,  5 Jun 2021 11:14:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QENxU6Z/6//IGzHDS8zcNvPUxJlaZvIacdYOVAwDpT86+EtU1la0YFaFtBFuNk9VCifMB/VXgqChdezL+Eo6WC5ep/3CsGlCbQIT1NJj592e6VN01PeC3v1krl10VPiFrsS2+46afAsm/Thcsg9DXiFOBMHD54OrAPC1C0baKSfEtxdl/Nd6BiRBycybGtOCUPMLJ4KYMIPhDk0EYqWP7pTiXC+G8Ce2K2gh/S0HbVwV52wJpFAd2Ic3ZVAa2I5ngG0tBYuc+kIPssWKXiMJG+N/3+PDw9DfmRW2IAr6mNm12c2DgNAmqEHvLBmEEU3NHSg6OrymUtx7M8X+q+RZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RushpzilxKiUFAHqMI7sS+3JqbdEpyLgmPn8t5NcSmg=;
 b=T9DhvroETkxRPkXqjVxHnxmPx8/CTO/gY+YrQvwgv5+KSfNuBqtRJhbwzf4z7dm3i8wIrFdAwSBm/cemlf0J99K2kVblnEdOBgQw1/P/vIlCx0Zs//DAFBL1EdD/JZV4ZyiKmBJRaVoh7E5hhTqjd8fUAAmmx2rIYn3sCmRAThawedGoOdz+wVfvusL64AV5NH5/jFlX02COCNzsQyBfquAM4nLu7fmfiZPYmpEm75AXMKQNZP3+xwf1b3H+H5u4gBLApXNmcj0PEXFtI0JYnhtn3YN7f2c3IgdK/3kKwvAPwN5z3v+LOPq8Ld23DmKR00NZiJlIxoAamrXsZuiW1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RushpzilxKiUFAHqMI7sS+3JqbdEpyLgmPn8t5NcSmg=;
 b=X6qNHPjnnyNlZQtbFYz/WzC1PignF5FhzkBaygPQD88udGOPT4dFB2ciJsrLz39fmQXg4kJnHucZIpt1F59JrOFXnd+NGBtkOsHWPFh1unueCTBfcDqemV+Z+UJ1ILHxTqorCDRrN5XQmBCZAGKmAR/8OUbawN4G7ZiRwvxdNj4=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2449.namprd12.prod.outlook.com (2603:10b6:207:40::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Sat, 5 Jun
 2021 11:14:17 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4195.024; Sat, 5 Jun 2021
 11:14:17 +0000
Subject: Re: [PATCH] dma-buf: fix build due to missing export
To: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
References: <20210605002007.4153933-1-lucas.demarchi@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <282ab16b-b498-959d-97b8-a68222c6c14d@amd.com>
Date: Sat, 5 Jun 2021 13:14:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210605002007.4153933-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:8946:fd9b:10c9:6ef0]
X-ClientProxiedBy: PR3P189CA0050.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8946:fd9b:10c9:6ef0]
 (2a02:908:1252:fb60:8946:fd9b:10c9:6ef0) by
 PR3P189CA0050.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Sat, 5 Jun 2021 11:14:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f430d5e4-bb5f-4e13-de5d-08d928130eae
X-MS-TrafficTypeDiagnostic: BL0PR12MB2449:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2449BB34094E8FD956FFC5BC833A9@BL0PR12MB2449.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RG3BsjI4bGTKgXxJtAd3aALNJZU/ObHCsrKfLbF++iyE6OyZKCHc8xrFV34hyRL62ihA77YYMrXIa3Ng4ab3WGWr3Y0Hw0u7ZVUBRMFcZzaPW9NC+Ej6hQkcL2W3yqDc9SFniREeNj0YDxkgGea4EkrJfmxqRAZCFgddeBNn0x7j7BJmifdF0nnyxdDRx+PC/9gqbkY9LiG1HjuMeESX3L6r5EMnS+u2LgvcQgeDGTZo2KfZEcPcmARiLB8LtgR35ZHpYgIZRYJddlxEr6Q9LmQRX+B4fd+w76OHypBzNiOlpIWib+w1N7sJBdEPB5Yia4zMvJM4rtKTFYvqkPwWNGAe8SoWjwCbWn/0vnvCw9RtcRAHvh4G9DcWquXe8wuMxOJO2smVMOnxMNf2JTdwITiL3M4QNwo0C81GXlLOAv5ewSXDbLXj8kRa3cRtQu5luAxinuPTVg1zTVhvDNxhfk3VXCXA/1GSyDvjrPvbYYriGMidpn9Isqn9LQd5yKtVfEX8iq2x94WcGb1aG3VFfFQS4j5mZBiJtmBlNmhVV8xV1cHrv3QB6rcPh6r/O2rYkAdzH29VU0cKhy3x2nB0WRqJN+K6lCJtzoSzArlDt4ymJ94QOL3HfxfrpJVmbU7PAEIqOpGMitf+PgoRNgw/kqdh9S6YEhGRGGY47aoCjKZ0XKZ4DJzDnmaVjFPHrDT6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(31696002)(186003)(31686004)(478600001)(6666004)(316002)(86362001)(38100700002)(36756003)(54906003)(2616005)(66946007)(4326008)(8676002)(2906002)(5660300002)(16526019)(66556008)(66476007)(6486002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TTNPR0NoWm95WWYyMjNpeThFVmVwcmhsbXI3dmRMYkxIb2tlWkdzMXZXQTdK?=
 =?utf-8?B?TTFYbkRuTmZNdmgzY0E1cDhUNHdpRndWUlBkZ2FualIzUUgxMzVvZ2FhYURh?=
 =?utf-8?B?c3FKeW1CRHBjclptclBBSFRVUTgxOGJGR0g0Rml3dE90RUdpMzIxMDFGT2pp?=
 =?utf-8?B?SVNuWGM3bGNiWW5VRHNEWm1mY2xQYzM5L01IQ3lZTksxanFTaEJ2amJReEkz?=
 =?utf-8?B?NW1URSs5akhVNFBBS0tLK1lOYnB1WWxST1ZnQW1ReWxLTFlNNlpkcGwrcE9D?=
 =?utf-8?B?cXRkWm9sOExtSWhiV0FjVWhVNHJVTy9ERjdGWUdyMXp4RUtZemtmc3pDV0Jx?=
 =?utf-8?B?Q3huUEpJOUFleStzUjRoOTgwRXJDMEY1U3Z0K0sxVFdoWjFFaUJKaHFvc3RQ?=
 =?utf-8?B?NHlqNlZ3aEFBZzVxYTlzc1YyVldpQ3FHdW81OXJwdzN3RWNCczZRSkpiRDV6?=
 =?utf-8?B?MnJTOFE2UStIampkcEVRdVY4NGtMRlNvdjJyekZQTTE1RmVTRlNTOGxCS2dv?=
 =?utf-8?B?OWhYck1qdUNiZWpRMHpRTTFOQko5d2pkamFYdmRudmJOd3lMOTJzREdlbERI?=
 =?utf-8?B?MUJVeWVzclk4OWpoVUJTamtKVC9PODhGcHBiRmRHTGNaSk1EWDJTeUMra3pk?=
 =?utf-8?B?K2pCaUlBM3FpeTJVY1BoOWhqbXVrYkJmZHZGMitKa3VwdlJNakVLdVFVTFY0?=
 =?utf-8?B?RTlyNkFmUlljTzU5Y0tPRjFvL2VlcGwrSTFGMWhZMmpjUldBcyt3bmhBRjVr?=
 =?utf-8?B?NXpVeFNDV3lDK1l5ZVFsTmZnRmVFdjJOU0VLNlBYbmlsTlc5RDhYaTMrSlk4?=
 =?utf-8?B?TkdiREx4UlRFWXUyRDFQSlZMV2QvYlZIYTdrYzczYk5iSENNUE1Jc0p3Q1Jk?=
 =?utf-8?B?UFJya2VwbGVuSDgxTWlNRUVnWnRsSGQ4cTZCNDdIZTUrZmJNYkFiN0E5a2I1?=
 =?utf-8?B?SlBkYlZrV3ZzMENmZlNoeDRRbEh3clBHTUtZS3BDQi9pWXlrdGN0NDRxejdh?=
 =?utf-8?B?UEF3VHhJZW9mdnhwUElCd2dEaU9PNDFmR2Y1ODl4QlNGdnh3ak9ubHUvNVFM?=
 =?utf-8?B?RUhHb0tjb0RYR2dkcmVQYWR3cUtQUk5MVVliQ1hhb2FFSy92a3NBeHI2SHZP?=
 =?utf-8?B?K2xDT1NKa0p5UnBvNUpCMHdWblNTTjdIUGQwTysvNVpJYUYvRnVESGFJdHFs?=
 =?utf-8?B?YzhZNW5BRnRpOXFuL3dPODk5ck9iTS9QdjFwOFBoaXk5QzAvT1F6TDA5aVUr?=
 =?utf-8?B?QysyOGdzU0tPNkpVbGpXdlZIODE5ZXYza0l1Z3dmNUlBdm9JbkhQZmtSZEFi?=
 =?utf-8?B?S0M0Ui81QzkvUGxuTjYwRlV5YmtSS281WERDY1lhSjRUWCtyYVR5M3V0OWsv?=
 =?utf-8?B?dHdyM0FZaG8ya1RRZGhjcG1uZ3pTUk1FUnVaazZDYVZCTjEyWFF5Z1ZtRE1X?=
 =?utf-8?B?L0ttU0llUXRoMlpManVoSXBsUHcxeEdPRlNGRW1SMWV2eWx2NW9lbXNqRWpv?=
 =?utf-8?B?TTJWWit5MkEyWHJpbUdWMzZtT3N3YVhUMURhTlZ1WWhhUklHNFJhbTdWMjZl?=
 =?utf-8?B?aXorZENPb3Z0SGNPY01CQnBOeFYyT3loMzVqMkZQSDRWOGxmTjcvTXNROUtv?=
 =?utf-8?B?MkdOSHUra1FzVjZ0YzRsMGQ1RERNQjY0UTg2U2JxUzRTUHVsdmdvUnZWMWFX?=
 =?utf-8?B?M1p0eWVVcEhYRXJHSURlSWpxSnlRaHhNVnlMamtub2o2c3dQc0RjQ09DaVJI?=
 =?utf-8?B?UUIzUDFGQ3lESEFqb0xwbXVjZXRuWXpRUURDYTFReWRTK0h0U2tnYWFlY2g5?=
 =?utf-8?B?ekNIcEkwQ1gwbHBTcm5FWFNNajJMSUhPNUR0b1NCZFBpcUQweEFOWE5jOWw1?=
 =?utf-8?Q?nzuD7bRiZbCna?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f430d5e4-bb5f-4e13-de5d-08d928130eae
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2021 11:14:16.7605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGq5mAsQY7cICrAFbYkA/nBlRBiNwKacO2RId9wdUyV29VKXkxq1Q0zPht91R5XX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2449
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
Cc: linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That was an already known issue and I've just pushed a patch to fix it.

Christian.

Am 05.06.21 um 02:20 schrieb Lucas De Marchi:
> Commit 0c6b522abc2a ("dma-buf: cleanup dma-resv shared fence debugging a bit v2")
> turned dma_resv_reset_shared_max() into a function when
> CONFIG_DEBUG_MUTEXES is set, but forgot to export it. That resulted in a
> broken build:
>
> 	ERROR: modpost: "dma_resv_reset_shared_max" [drivers/gpu/drm/vgem/vgem.ko] undefined!
> 	ERROR: modpost: "dma_resv_reset_shared_max" [drivers/gpu/drm/i915/i915.ko] undefined!
> 	ERROR: modpost: "dma_resv_reset_shared_max" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> 	ERROR: modpost: "dma_resv_reset_shared_max" [drivers/gpu/drm/ttm/ttm.ko] undefined!
> 	ERROR: modpost: "dma_resv_reset_shared_max" [drivers/gpu/drm/drm.ko] undefined!
> 	ERROR: modpost: "dma_resv_reset_shared_max" [drivers/gpu/drm/drm_vram_helper.ko] undefined!
> 	make[1]: *** [scripts/Makefile.modpost:150: modules-only.symvers] Error 1
>
> Fixes: 0c6b522abc2a ("dma-buf: cleanup dma-resv shared fence debugging a bit v2")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/dma-buf/dma-resv.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 3964df438505..6132ba631991 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -226,6 +226,7 @@ void dma_resv_reset_shared_max(struct dma_resv *obj)
>   		fence->shared_max = fence->shared_count;
>   	}
>   }
> +EXPORT_SYMBOL(dma_resv_reset_shared_max);
>   #endif
>   
>   /**

