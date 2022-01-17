Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1E24910D5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 21:05:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D01F10EBBB;
	Mon, 17 Jan 2022 20:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6CB10EBBB;
 Mon, 17 Jan 2022 20:05:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DobbKKYQTEqThgl77GDveWuyXBpYlf2CkJVF2KQfyGmFKahOhfP7GFUQqiY2xePhaVcLd7NblGlBe834ZIcUHt7AwTNrZWT5RP+m9XlEjwwidBDwWKxz3F87WSmClmeWgA1kEijn2ypZHN3HYcUB29A0JRZ+E1B1jDxndoc62y9EPbzfJD1zJdgv1czPrqf8terdqxPrSKhEoV8hk9Ky8NAbEHkc4wGLodQZnW68WivOxBasCTy/LWoCzJhPA7GanPkOF6o/cXiFPs63PA412QcVZXQXG7/yCsh+cuMnWTorJDP2MobBQEcJUv3AnvCChHbkWe8/D+e65JM0xCXldw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZUjAq6uk7zsUqiPrnxcicyMzVJhLQ+j9psHS8fv+Wg=;
 b=H0t8jFEUZDFggRn/c0JAZd9yFrhm3e5IS8aZRXDMoPB6fDHzkrh7S+rsMFw40gIXq6lntBfEdqZdApUYQto+dHuJaZRyo0a0pbbqg5Q4YA8aYu2pCZnLQEAWXCDfr5Tt9RMPPsn1Lw+k5sFYsA8gptny51pcfGUhaC7/8rX66RYFB4N0tfnFywKfJdds2kq7l4GQwcJIDGclSZ17sH0D/QbBKfPGL5RvZpOPkgNQweOZNdoGfAQ6D76Kb6LIMqZ2wKV2w3O+rk1XOGWJa8ZRsrRMeCgQR3T0flcEGplhmDJl3geh2WIOFMOj2cA2pMBhXA+pbEHNqF7NfzHepgccpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZUjAq6uk7zsUqiPrnxcicyMzVJhLQ+j9psHS8fv+Wg=;
 b=0rQmyo049B+o8zfrjIPDgRpCwJ4eYyKUCy/1qU52+6qu4/D7dAagQdgtrTkUhEVDBLI7HXVis1HacHhZ77n5lngAbm9ZHDRUFoJlezk5hEP7mOEq1/jtCNbgUKQ4sl2YblBBt9izjNsI4TzAMwxkH1ZE2fJnxDN04e865U9HOUk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM8PR12MB5399.namprd12.prod.outlook.com (2603:10b6:8:34::5) by
 CY4PR12MB1158.namprd12.prod.outlook.com (2603:10b6:903:40::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.10; Mon, 17 Jan 2022 20:05:03 +0000
Received: from DM8PR12MB5399.namprd12.prod.outlook.com
 ([fe80::9467:c769:4d1c:56f3]) by DM8PR12MB5399.namprd12.prod.outlook.com
 ([fe80::9467:c769:4d1c:56f3%6]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 20:05:03 +0000
Subject: Re: [PATCH] drm/radeon: fix UVD suspend error
To: Qiang Ma <maqianga@uniontech.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220117074731.29882-1-maqianga@uniontech.com>
From: Leo Liu <leo.liu@amd.com>
Message-ID: <581d4658-0f12-f355-0c4c-4b0da9b23d61@amd.com>
Date: Mon, 17 Jan 2022 15:05:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220117074731.29882-1-maqianga@uniontech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::22) To DM8PR12MB5399.namprd12.prod.outlook.com
 (2603:10b6:8:34::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 318d0b4b-181c-414e-a68f-08d9d9f4a604
X-MS-TrafficTypeDiagnostic: CY4PR12MB1158:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1158F183D1AA25696D1C27A1E5579@CY4PR12MB1158.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0VSoW1EUO6oODEqQvQIyg5Kfqc6TlOMnHoDghOQOSbHmZSNrxyWNOi1FAG+t6Sbn3b1qQ5k7ZOjWq/QgdN6DHELssD3hsa8464UIMkUkXrWKSlQM+nOyudIMTpl6KBKGe4Gw65yEz/xj53e2CCTuSaj+MgCCBV0jTYiUYcULdpcjrV972gt82egYgDjGdeVac6ban0Hmnf0w1XNvh11xi+exOyGbxcxMo4lmEhBD9NriGqv+n/Dcq2FBlz5WnACKcynwpA/DMny2xNH3/7IoczCWmvIz6cGRowxTi+xhg2jn6vHDrto9miX/YI6UMTKWOzKkw/nvkSCAgf3XNnBOyAdryIyRYmI6ebrXHNTadAzL6S9wkSlxA9I6GhTX6gouRUjQgjPCnvjw2yodqYgJSlrNzaOS0lY6g8iaVA/8UYSdguhIFm1Tf4ZkVAsn7Os6lJMs9tgUm227oLuk4GlkKP15cpq0tlXAv0207KHckERbX+m3nj4SKtQ7v5ZUu4w56ssq88BUSzFgHSoBh8shyClyCl/4Kn2LxgaUvYCLawBMEKrgixOTAwtz7WsMWbCFfER2NwgImeiHRwvxsjhkoOzdJy0UPEJxpXC9QJMRUERFpbDD4adxp6aW/bxvsq8wm/luW1ZctOxlLHJKX8CPjfWVQ/6lgObcPxK690wSUav3Q4JtEFHdAIwdJe+3wzsgd2/6Gdsz9i120V/X/+uTj+2MIMw5Ptl3pTZPZPWS20s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5399.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(53546011)(86362001)(8936002)(2906002)(31696002)(26005)(5660300002)(6486002)(2616005)(15650500001)(8676002)(44832011)(186003)(508600001)(36756003)(83380400001)(66946007)(31686004)(4326008)(6512007)(38100700002)(66556008)(66476007)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnVSSlc5aitrSnF3M3hIY3F6S0kySGljeEU4N0wwTFluRVhtYlNJWlo0MkJN?=
 =?utf-8?B?SlNYTUV5OU5hV1VMT0N3elZJYUN1Tm1UNnhBRm0wT0JPbmtCS2FQclQ0bEc5?=
 =?utf-8?B?SVFsNDRDUjI1U20xdWw2VERTc2lKOGxqR0ppVXlzUndodlFGb3ZZZ0trSGRJ?=
 =?utf-8?B?Q2hCYWNMYlZwWU1DVDNnZmo1N3p1NCtVVlBVSVNTWmlBZHV2dzFEMUdzdjk0?=
 =?utf-8?B?NnZ1RlFWVmIxZld3UW9OMlVaRXdVM2VEZlpNVkJNSVV6aEpIYVNjZ2dsUk9P?=
 =?utf-8?B?ajk5cmx2dFRpTE1HMnVxQXlkdEZHeGZ1blF3aWxkZ2h4NnBlV05XcTl3azZr?=
 =?utf-8?B?aFNGdkNGU1dHaXhBd0NxMTVzUnNTYU5hYTYvK2J2eWMrbVR2L1BCSzlldDhH?=
 =?utf-8?B?NWI0MkZrNS9OdkFIbHdva1l0R0hHK2lCVTk3VVFRRHp1cEZCWlZNMGV5OTFp?=
 =?utf-8?B?clh5MkhrdGNSVUFVcGNNNjBBNkZkQ0FyWDdITURLSzRVVkJuMkltSTlUVTRn?=
 =?utf-8?B?aE5GYlEyaDA0YjNzRWRHSG5BRjFJRUFrOUEvVERaRVNsVmNkTmdhenV1Qisy?=
 =?utf-8?B?M3FPTGs0ZDBwbk9XYXBSMVZWZmU5c2RGaFNiQmtSQkZndDFNeERHZmRmWmRr?=
 =?utf-8?B?ZUlEeFZlaW1hd3p4MkEwZC9iV2hrb0MwOS90M0hNQUtFdnlKdDd4SFEwSUpn?=
 =?utf-8?B?N2lONTJDOW5vOEtaaFZlLzYxOTJOalU4dGxEMXU3QUdDOFZZMjRseW5XaWQy?=
 =?utf-8?B?TDRzd0tzcmV6bGNvemRXR2hicE1OalRJV1RiRHAyeE1aSC96WXZ5djhtOFl4?=
 =?utf-8?B?eXpKaHJyYk9hT2xHTEd0anI5YUdKeHVYRU5kcEJJUGl3M3pxY0paNEZxYXNo?=
 =?utf-8?B?eTk5aURNV0M3UlczTHlZcWVSUmFzaVV4M3hqK0c5VTE2Y3hlK1Q5cEI2WTNj?=
 =?utf-8?B?eG1MZml3V3luaVhMUjBiQWE2NXUvZVZjZnRBZmdWZ1ZxUUJETjRlTXlHNEI5?=
 =?utf-8?B?R3ZQK0FwdUxzZTQ3eUc5TUNiQkJzREhOeE45RzdqZzkzZkFLTEwvSC9jcEpH?=
 =?utf-8?B?WlhXc3JxNzlNUTloLzB1dE1NWVdUa3NyVzNxZ0FGYjNvcldNOUZpREs1Zm81?=
 =?utf-8?B?WmNpTkg1bE9KY0pSZUl2ZWg5SkRLL2xVVUt3Q0Vsdk1GaTMxMzZyR1J3aXZN?=
 =?utf-8?B?OWtoRG1DSEFNRUlGL2JGcCtpVXIva3ZXalFNMmtUZFdEaTErZFRIVWxCTjNq?=
 =?utf-8?B?ejlyYlF3Z2RGTWR6M3pQSHpwN3BkYzRnOWJUaDBoY3pIakJvTDR0Q2pGMXEz?=
 =?utf-8?B?R3VlTGVDMmpKRjE1cUdWd2MxRGlSVWtkVXhldHFaK3M0SGp3U2VPU0tTZFhh?=
 =?utf-8?B?QXM2MFVISEluMnRmM2FVVkVVMFRzYk14VHlSc2dUNG5mbnlSM09ab21LVHBV?=
 =?utf-8?B?QmlqVVNIVXh2U1JCSllUWFlrb1pKTkUvdytkdGdVNHNlQ1F2ZTFUcUFoakJj?=
 =?utf-8?B?U0RrdU1LMHRZTTFyL2JOL3NwQUU3K3pTOUx1eUEvMEFCMGh5MUd3OXNMQ2Fk?=
 =?utf-8?B?OGNTZmg3WGxyMlpQdEl0emhUS0NBVXg2UWN0L1M2T0s2VzE2anQxQ25qRmVp?=
 =?utf-8?B?SHI3bFowOWxyOFZoWFIzVlJqem8wU3VWc0xhZzB2dW9CbSt1d0VYTzQ3SFh1?=
 =?utf-8?B?dVgxS2J5UDgwbTgvTGpXRXV5Q0t2QmR4Ym5ZeUZnVTNmand4d1RwNndjMkww?=
 =?utf-8?B?WTdOQ2g5dmp3ekwzZ0FlZVY1T1pWZjdXRzBTemhMYlJZYUNtcjdEeVBVTlhH?=
 =?utf-8?B?d2E0bGc0WkxTWXZqNkRPWmpTaWlJQmN6MCtzUVppOTFVNWtCRnpSQWpxVzZr?=
 =?utf-8?B?VzY2NzRuYlJXaTFiQVBiYXZiQmdXMFFMOU80dGQ1VWtiODVsMWFrNjNzbWk3?=
 =?utf-8?B?SmNYT2VYMUJTb2drYVZjU2NZQjVVT0YycStRS0h4cEVyWkl5SS9xdkNzeGp5?=
 =?utf-8?B?MHZlWG1yVmFjYTZBYjZ4U3lTV05GQVQ5Mld1OXRZNW9iQ2hUcjZFT1NUbFhL?=
 =?utf-8?B?cG1nVjhHR09BbVNOd29EblhPdU43cHVRQ1llTFpUdGg5OUJXVnc3YVV6aW9Z?=
 =?utf-8?Q?AU5k=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 318d0b4b-181c-414e-a68f-08d9d9f4a604
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 20:05:03.2226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pHjsoINx0ksRGjp438Tv0YWBclecunZmekHqckRmfSkg60xTEBfAMoWlEekPeLI/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1158
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


On 2022-01-17 2:47 a.m., Qiang Ma wrote:
> I met a bug recently and the kernel log:
>
> [  330.171875] radeon 0000:03:00.0: couldn't schedule ib
> [  330.175781] [drm:radeon_uvd_suspend [radeon]] *ERROR* Error destroying UVD (-22)!
>
> In radeon drivers, using UVD suspend is as follows:
>
> if (rdev->has_uvd) {
>          uvd_v1_0_fini(rdev);
>          radeon_uvd_suspend(rdev);
> }
>
> In radeon_ib_schedule function, we check the 'ring->ready' state,
> but in uvd_v1_0_fini funciton, we've cleared the ready state.
> So, just modify the suspend code flow to fix error.

It seems reasonable to me. The suspend sends the destroy message if 
there is still incomplete job, so it should be before the fini which 
stops the hardware.

The series are:

Reviewed-by: Leo Liu <leo.liu@amd.com>


>
> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> ---
>   drivers/gpu/drm/radeon/cik.c       | 2 +-
>   drivers/gpu/drm/radeon/evergreen.c | 2 +-
>   drivers/gpu/drm/radeon/ni.c        | 2 +-
>   drivers/gpu/drm/radeon/r600.c      | 2 +-
>   drivers/gpu/drm/radeon/rv770.c     | 2 +-
>   drivers/gpu/drm/radeon/si.c        | 2 +-
>   6 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
> index 81b4de7be9f2..5819737c21c6 100644
> --- a/drivers/gpu/drm/radeon/cik.c
> +++ b/drivers/gpu/drm/radeon/cik.c
> @@ -8517,8 +8517,8 @@ int cik_suspend(struct radeon_device *rdev)
>   	cik_cp_enable(rdev, false);
>   	cik_sdma_enable(rdev, false);
>   	if (rdev->has_uvd) {
> -		uvd_v1_0_fini(rdev);
>   		radeon_uvd_suspend(rdev);
> +		uvd_v1_0_fini(rdev);
>   	}
>   	if (rdev->has_vce)
>   		radeon_vce_suspend(rdev);
> diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
> index eeb590d2dec2..455f8036aa54 100644
> --- a/drivers/gpu/drm/radeon/evergreen.c
> +++ b/drivers/gpu/drm/radeon/evergreen.c
> @@ -5156,8 +5156,8 @@ int evergreen_suspend(struct radeon_device *rdev)
>   	radeon_pm_suspend(rdev);
>   	radeon_audio_fini(rdev);
>   	if (rdev->has_uvd) {
> -		uvd_v1_0_fini(rdev);
>   		radeon_uvd_suspend(rdev);
> +		uvd_v1_0_fini(rdev);
>   	}
>   	r700_cp_stop(rdev);
>   	r600_dma_stop(rdev);
> diff --git a/drivers/gpu/drm/radeon/ni.c b/drivers/gpu/drm/radeon/ni.c
> index 4a364ca7a1be..927e5f42e97d 100644
> --- a/drivers/gpu/drm/radeon/ni.c
> +++ b/drivers/gpu/drm/radeon/ni.c
> @@ -2323,8 +2323,8 @@ int cayman_suspend(struct radeon_device *rdev)
>   	cayman_cp_enable(rdev, false);
>   	cayman_dma_stop(rdev);
>   	if (rdev->has_uvd) {
> -		uvd_v1_0_fini(rdev);
>   		radeon_uvd_suspend(rdev);
> +		uvd_v1_0_fini(rdev);
>   	}
>   	evergreen_irq_suspend(rdev);
>   	radeon_wb_disable(rdev);
> diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.c
> index ca3fcae2adb5..dd78fc499402 100644
> --- a/drivers/gpu/drm/radeon/r600.c
> +++ b/drivers/gpu/drm/radeon/r600.c
> @@ -3232,8 +3232,8 @@ int r600_suspend(struct radeon_device *rdev)
>   	radeon_audio_fini(rdev);
>   	r600_cp_stop(rdev);
>   	if (rdev->has_uvd) {
> -		uvd_v1_0_fini(rdev);
>   		radeon_uvd_suspend(rdev);
> +		uvd_v1_0_fini(rdev);
>   	}
>   	r600_irq_suspend(rdev);
>   	radeon_wb_disable(rdev);
> diff --git a/drivers/gpu/drm/radeon/rv770.c b/drivers/gpu/drm/radeon/rv770.c
> index e592e57be1bb..38796af4fadd 100644
> --- a/drivers/gpu/drm/radeon/rv770.c
> +++ b/drivers/gpu/drm/radeon/rv770.c
> @@ -1894,8 +1894,8 @@ int rv770_suspend(struct radeon_device *rdev)
>   	radeon_pm_suspend(rdev);
>   	radeon_audio_fini(rdev);
>   	if (rdev->has_uvd) {
> -		uvd_v1_0_fini(rdev);
>   		radeon_uvd_suspend(rdev);
> +		uvd_v1_0_fini(rdev);
>   	}
>   	r700_cp_stop(rdev);
>   	r600_dma_stop(rdev);
> diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
> index 013e44ed0f39..8d5e4b25609d 100644
> --- a/drivers/gpu/drm/radeon/si.c
> +++ b/drivers/gpu/drm/radeon/si.c
> @@ -6800,8 +6800,8 @@ int si_suspend(struct radeon_device *rdev)
>   	si_cp_enable(rdev, false);
>   	cayman_dma_stop(rdev);
>   	if (rdev->has_uvd) {
> -		uvd_v1_0_fini(rdev);
>   		radeon_uvd_suspend(rdev);
> +		uvd_v1_0_fini(rdev);
>   	}
>   	if (rdev->has_vce)
>   		radeon_vce_suspend(rdev);
