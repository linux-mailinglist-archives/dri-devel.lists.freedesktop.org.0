Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99AA98BABF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 13:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE5710E182;
	Tue,  1 Oct 2024 11:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TlQbG7ES";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFBD10E0C4;
 Tue,  1 Oct 2024 11:14:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SdgCDCB2ieL8ULhDO9BSpQdifCaKcdW1uQcGGX1IePXVdm7W517vYZdDh/ZTiaDrQvftW6gDLbyaUeid+IpWLfBNZ9vFPZpx0bYMbw5BI0roYmi3jFCxqvvbYoWJ7us9/p3T/llQpuwPIP6r1q4Gqle1EkdSgCCj+cVidPi/7jPDjlQerxrQqsJ5DhxgxSFdkb+Dd/4A+D4NoQ6Ph4ebG32QuceCHNnbaCKNw/uy1TIj46edRN50m4OrQPxEAMT+E0zXkceXhU2EUNA14ob+2h8pW7x4+blGp84Ca8GHdG6ML+QC+HeFJ3rig2JWBuILh4orfa2vDM+blhuv5RL1Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWbg0/OYiUFn4d1ytE7A18NeqXdBNCGGdkHWvH0e4aE=;
 b=HJBcwahgn3GtaV58Ztd6M/64wU3tbULp9FQfhfTvvJ05VHq+m8sqGHS9KCQ0q6LaI7oSD96bv3U3D9sRtU9iIPLGM/QHQV4rk9L2q9EpO7ORifHG2Y8+IYizI8zg0SPY8ViJ9/DIxXG4eJdg6lpSiw5w84qZNYRednmHOPY25HDKbt6wBKTdWvhMffCniMnEDbMVhlCHsKmfu71wfXoDnlJPYSeeo7nnTfFtUFFG/32ZmgSS9+S+jNzWJCHRhPO2ocP2fx+1jE3RuhEiIKhpsxUGPbrAel77WdGaPV8ZDoORma1bS/isuw9j73ia545EnIbl2fQ5YodE3jvvhEycFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWbg0/OYiUFn4d1ytE7A18NeqXdBNCGGdkHWvH0e4aE=;
 b=TlQbG7ES6ax0nLFwxO8NNRMYOmef6k8iIKYp7owNH8mLRt4nEsmvGRAgcf0SDYlpjtdlexukhenIfhg8jMekTApmt5NvOkuOAqYPDoKPC96dOPQyHEfYiMFkcuW06c3KnCSwfWinpff9sb4NM92UlMbiu2rGcRuxvIm7CPrIBUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4418.namprd12.prod.outlook.com (2603:10b6:5:28e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Tue, 1 Oct
 2024 11:14:40 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8005.024; Tue, 1 Oct 2024
 11:14:39 +0000
Message-ID: <7b3ea9a6-575e-4fe5-98d9-6e53803188fa@amd.com>
Date: Tue, 1 Oct 2024 13:14:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/pm: check return value of amdgpu_irq_add_id()
To: Igor Artemiev <Igor.A.Artemiev@mcst.ru>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Kenneth Feng <kenneth.feng@amd.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20241001105727.1582368-1-Igor.A.Artemiev@mcst.ru>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241001105727.1582368-1-Igor.A.Artemiev@mcst.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4418:EE_
X-MS-Office365-Filtering-Correlation-Id: d4e577bd-187f-47c3-8a5b-08dce20a3dab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a01yZ3hXaEI3VXg1VzZ2YnZ3TzQ0WU5yVkRDU25KYW9LNm5la1lrRytQcUlh?=
 =?utf-8?B?NnlXazQ2T0tOZFIyc1QrdHExcmFvcXdtQWdteVozZGQ5dUZIYXJFZXFLNmJT?=
 =?utf-8?B?V1JmZEFkYzdSQjJ4U2tZKy82T2NYM0s0WTZtNHFZTzJGSmJTSkd5eUVOL3Zu?=
 =?utf-8?B?QzUrT3lVdXRnbW8wODVVMEhGSFM3V2J2Q3pwOFd5UHFXMmRYMmQ1MGZSK3RV?=
 =?utf-8?B?S01RTGt0WVdvL1FlNzlkY09rN2FidXR1MlQxS2lLbDNzVDFJT1lHVlp3dThh?=
 =?utf-8?B?eVpsY3BucVpnSXNCbkNsRXh4SzlCOVBURkNNc24xeWduWDNwbyswRGVUTGlt?=
 =?utf-8?B?L0lWdE80RkVJL1MwOFhkeitFbWdxUFFGRkJFMGEvcVFrWlgyRVhPUU9aZG13?=
 =?utf-8?B?TEVHOGp3Ym1SSG1mVUd4TjN5dVpqa25VaWZHT3RKZWZiRkVlYlUxdldBbXZw?=
 =?utf-8?B?L3NBNWxNb3NGeVNqMm1KdUlhZmQyY2M2UlVUdnkwZTZXeXl6OUsrVTNCaUJU?=
 =?utf-8?B?TE1nSVdGbnZWRjlMcDdzUk5vNm1XTGt4V2FXc1gxTWNPWXVrb0duQVVOeC9R?=
 =?utf-8?B?Zk5EZTZkS0wwMTNsc3Zkc1liZXNOaU9KcC9qZW1ieE54UlVDUlp0enROODJt?=
 =?utf-8?B?eUJwRTFyTlppeWFrZzhxYWpxUmEwSmxqbnRyc2dEMHpKVzMxaVA4dzN4dEVt?=
 =?utf-8?B?anJKc1NkcmlFc1dTcDVJM0xGamdlbzg0d3F3eUsybDF6Qm1wcXFDU3JkNm1t?=
 =?utf-8?B?aEtwck5DczA1d3lCZEVrS1FlNGtUOVBGbjlhMWZQTTdIbHdML2ZnelppUjlG?=
 =?utf-8?B?QnIzVmY5bVpUQWpQT2dDTTFkWTM0dWJKU1dXcS9LU0NpWGZPTzhoZi9WNVNN?=
 =?utf-8?B?SnRlUWJvcEFkTXJNcmtGODJXRWlMVmhtVXNqMXJpM3hSaTlIT24ybTdlVm1l?=
 =?utf-8?B?R3JCL2VXL0tpVnNiaFlrTTVZMk5NdkZmVzNxSmJiRUg2ZnpYdjNBM2l0RlVs?=
 =?utf-8?B?RndzMHlmMWRxdENaRFIrMnNiU00wbjRUODg2SUlHMkZJUVVRRlhzbGZqZGZj?=
 =?utf-8?B?R3ErN1pwdzNGZStWWmhxUE04R211SFdTdEJGUUx1TVphMncvZ01IenpBYldv?=
 =?utf-8?B?T1NNZTJybWxSVDlQQkdObG5zVW9IOEdvRHdHNCtSTkdHejBlK3hENmJmQ1cy?=
 =?utf-8?B?eHlpYUNRclVoQ2lSa3JZZWJGNjZuK1RkTmhDZ1kyQzluTzVhZU40b2c4OEZi?=
 =?utf-8?B?MGRnQ1huOW9KUENEc0lJSFRoY250bVpzcVI2b2x2Q2V0M2YwbVpob0RXQmlV?=
 =?utf-8?B?czZ1aWMvNVg5NW4yMHFpU3ZSM3QvaWZOem5ZVUVrL2VHcHV2Q29IUVkwYS9Q?=
 =?utf-8?B?VHFEUis3ME8yTjI5bnBnaHVQOWNpNTBNL2JjS1JRTUJjZTIrS09uRkc1aUVh?=
 =?utf-8?B?d2NOZDdkYnk3RGIzeTlBL3BCQnpBU0F2bWNuZmNZa1NJZ29HdC9mc3hRdzhV?=
 =?utf-8?B?S3NCNXV2dlRZYVJJZDRSLzBQb25NbUtGclp4RjNxSzlLWi9tQ01iQnVyT3ZF?=
 =?utf-8?B?R2RnWGtyNVpqcGVsN2xPMjgwZ0xRTXFsK1NuaEpIdjBMREs3TXFYbjdGRXlk?=
 =?utf-8?B?SFJ0N0VNQkpIcWczc3l4Ly9kcE1ROFVta2VyMFJrOWJvWGQ2SjIzcVE4QVlQ?=
 =?utf-8?B?V2lhOE9qWnprS0piUG9McHdxOXdWZUxvQ2dWZlB5WEt2S1htWHZsT2VBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmNGenV4WW5mcnQ0N3FNdVdUMU1wRTdZWUVWUXdZbkN1OVE2eEhtMEZ6bnBD?=
 =?utf-8?B?ZWEyaWdzLzgzaDZCUi9hUEhNWFpjVlBHV2tlZzdiSlc5MHoyL00xODVYNEJI?=
 =?utf-8?B?c2F1ODJ3UlpsQ1BFUks4Zk1YUXJzWDFGZWlKWUZaZDRrSExDWFlDUG1SQ3g4?=
 =?utf-8?B?Z3hSakV1YVVkTlFEMjNSajlzVDFpNE84ZFJjRllVbkdCMTlDaStiRXFxMHFz?=
 =?utf-8?B?dXF0TWt0UkdJYUdRb0FycTRrdGprcThvQXc4K1QxYWp1bnVzTjI4Zkg1ek9E?=
 =?utf-8?B?QXluZnVsZHlIem9Kd1dWbXAybVJNMzZQbUo3YW1MNk5wL0JZaWEvSFdlRjBF?=
 =?utf-8?B?RjZUc3NkY3RENy96K0djTXdzSmpYM2w4bW4wRVJTWGZWRTB2QzJWTU02TVpp?=
 =?utf-8?B?MmQxemtmcHZhT2QvNWFnclI1QmZmZmtkalV6SVVJKythdmV4eXNsb3JiSEZM?=
 =?utf-8?B?S1dqUFBzMU1OL0p5QlNDWWlWV01IVm53V1JIb3M4YjhnbkdxKzBxS1JIWjE1?=
 =?utf-8?B?QkExaklYSG1YS1Vva1lWVVdJREtxdlllM1BGWWlMRXl6Rm1TcXdCZzBPNGFa?=
 =?utf-8?B?cVpQTXJWZEpxdU1WZVZuOHdQQWRXWStOUDd1R3VBMzloK2lsOWtsT2Y0dnRw?=
 =?utf-8?B?SVQzcjdDaWRXTDVDdm94M0FtMVF2V3E0TmdFK1VJcS9zd052RWVEU1JQYlZO?=
 =?utf-8?B?OWlCekVPRzlkdmN6ekY3dUZnNUpIR21oN3dJK0pqR2NIUzlFaHdna05nWXhv?=
 =?utf-8?B?aXNsTHU0OGEyR05VOE90QzVFbEhybTZlMll6TkdXNGxTekdtUS9PZUdMdVA5?=
 =?utf-8?B?aXovSmxUeGkzVDYyQ3J1NWdFWEhNUUFPVUc0THNLdk1ZU3F3aHlQOXo4Y1hh?=
 =?utf-8?B?UXZmU1BRNVB5bXFPNEZJRXlXOEo0YnB6c2xWVlpaRnpibWh4YjZweEJ6UllP?=
 =?utf-8?B?OG9aKzVjRHdSaC9RbkpsYndxTzRnOXBrUFl5ZVlydmtEeGI2aFgreXBjemFD?=
 =?utf-8?B?SVNCZHdjbDY1cXR1dkpJam1HMjlwOG9KTVowR1lXTytTMmhiVGtrbWNwV01a?=
 =?utf-8?B?aVNuL1N2MkVLL1RCVkI1dE1wZUZvRktyNVBKTUZ6YmluRGhNbTdIZUZxNWxJ?=
 =?utf-8?B?ZkhBVXpWNjZ1bC9mdy81d0pBa2p2U0Rnb2orL1NYaDIwdGxyZjUxNmxnRVl4?=
 =?utf-8?B?V3pjYUo1MG5xUWRYK2diVFFNK1FOVFJEV3crTm11NGtyMEdlNEpNeUdpRVJj?=
 =?utf-8?B?VDRkVEV3am5ZcjdhYlY2NXZKRzZtcUE1WWdGbXF2RVZUM3Jwb3hhNVdtMFR4?=
 =?utf-8?B?Q3pyRVhhQXZMWTlvZjBvOUUrOFdWbnZMR1Y3WGRXcm1rdjhLTGFYT1BJM3lM?=
 =?utf-8?B?cHc5Z2ZQWURiaDRTTERFeXVJR0Q3bzhIbEN0dXdDaVJDYzVKNm1vZWlMaGNQ?=
 =?utf-8?B?T3gxTmhoRW1JUXJXV24rRlM2NWZCdGhTUTYwcUc3ZWVzcW9UVkRtODJOaWs1?=
 =?utf-8?B?ZG04SGg4YU43ZFZLNVlJWDJpV0dMaEZMMjNEY0RHMkhiNmFvVFhrWXBOMktH?=
 =?utf-8?B?ZUJZNmY2UUs4dk9iQ2RiNFJuRVdmdVZ0RjJ2cXpvTHNnbU54WWk1aTB4S2xv?=
 =?utf-8?B?bnkxMThZekZjN0F2dm9WaGc2NnJzcHIyUi9xaEFhdzVKdjNmbXRHMzlXU3No?=
 =?utf-8?B?Vlllam1KT2JYNE0rVHd0QVFtZmpXV0JheFFQcURJQ2hBYXZDMk9RaWlSOGNM?=
 =?utf-8?B?eWp5SnlxS0dxcnU4dXAyVStrL3dhNjVEZEJxMm1VcE5lS2VRd0FZNGFmeXVJ?=
 =?utf-8?B?eDE1MTQ1QmpJYVdjYnpaSjJ1emUyamJ2aHhTNW9UKy9VdWNkZlVETFdRaXA5?=
 =?utf-8?B?NXpXYWF0TzhPVkY5TjgyWjZNa1BYY3hQbDV0MHNPZjcvQVErSERTVzBVMDJo?=
 =?utf-8?B?YnZVOFpZUkZqbjFQV1hkbi9oa3ZGclQ3S1ZuOU8zRTNBZUpUS3VaYXFQRHVU?=
 =?utf-8?B?UzlFMElxODd5cXFxTG1GVE01STFpR1hKNTVwcW5FR1FURkR4V3FWU09McUtq?=
 =?utf-8?B?NTFLRG92SG4wZnkrWkhmd3lYSFZTM0NhRERWbTM1a3prVWw1cm1FeDZrc1M2?=
 =?utf-8?Q?EsbX4vv5CTEBR2wBucLD/Jny5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e577bd-187f-47c3-8a5b-08dce20a3dab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 11:14:39.4514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnKEkXKdPQq/W5NnL5G1ebfN1XqxJoHVULrWKAeW5NsPCVQifCAF6AqK3DFF+RPF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4418
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.10.24 um 12:57 schrieb Igor Artemiev:
> amdgpu_irq_ad_id() may fail and the irq handlers will not be registered.
> This patch adds error code check.
>
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
>
> Signed-off-by: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
> ---
>   .../drm/amd/pm/powerplay/hwmgr/smu_helper.c   | 19 ++++++++++++++++---
>   1 file changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
> index 79a566f3564a..109df1039d5c 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
> @@ -647,28 +647,41 @@ int smu9_register_irq_handlers(struct pp_hwmgr *hwmgr)
>   {
>   	struct amdgpu_irq_src *source =
>   		kzalloc(sizeof(struct amdgpu_irq_src), GFP_KERNEL);
> +	int ret;
>   
>   	if (!source)
>   		return -ENOMEM;
>   
>   	source->funcs = &smu9_irq_funcs;
>   
> -	amdgpu_irq_add_id((struct amdgpu_device *)(hwmgr->adev),
> +	ret = amdgpu_irq_add_id((struct amdgpu_device *)(hwmgr->adev),

The cast to struct amdgpu_device should probably be removed.

>   			SOC15_IH_CLIENTID_THM,
>   			THM_9_0__SRCID__THM_DIG_THERM_L2H,
>   			source);

And the parameters indented to the new opening of the (.

Regards,
Christian.

> -	amdgpu_irq_add_id((struct amdgpu_device *)(hwmgr->adev),
> +	if (ret)
> +		goto err;
> +
> +	ret = amdgpu_irq_add_id((struct amdgpu_device *)(hwmgr->adev),
>   			SOC15_IH_CLIENTID_THM,
>   			THM_9_0__SRCID__THM_DIG_THERM_H2L,
>   			source);
> +	if (ret)
> +		goto err;
>   
>   	/* Register CTF(GPIO_19) interrupt */
> -	amdgpu_irq_add_id((struct amdgpu_device *)(hwmgr->adev),
> +	ret = amdgpu_irq_add_id((struct amdgpu_device *)(hwmgr->adev),
>   			SOC15_IH_CLIENTID_ROM_SMUIO,
>   			SMUIO_9_0__SRCID__SMUIO_GPIO19,
>   			source);
> +	if (ret)
> +		goto err;
>   
>   	return 0;
> +
> +err:
> +	kfree(source);
> +
> +	return ret;
>   }
>   
>   void *smu_atom_get_data_table(void *dev, uint32_t table, uint16_t *size,

