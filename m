Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD0549C956
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 13:12:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8802810E805;
	Wed, 26 Jan 2022 12:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBB610E805;
 Wed, 26 Jan 2022 12:12:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKe0f7m0nurlOqGnHDelbhFA5qhlqkSXGL/aGG1wmHbOALGMrR/tPtCMQdmljk6DavZL+oOCeJiy1XnzLKBuupfpLKTW2I/QgxIzzum73HECtOBrRGiksUlv3iJzMhH0PdqQD2tKYtyjEgSwiq5astLh+GNLN5+deEJSbcHBW21zc42pcFhFN3ZyuG5icG1kMFd8zZg0rDNMu5Z2M4SDY8lXmmgO4FWih48QNJ+bYnlj1Fo8DMniwQd78VCae8mk+/4YOGl80Y5T50ZDdF9yxiyMa/mlZ7tdkEuHhhBArHXrzvOOeWpz+wS0A8KIGxmlvWU8eMXWHfcQo1+asI5ckw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSNXkPMEQdJUJiWkKmkobk0mf1E25RxWMDBR3hHWaTs=;
 b=cuNDqXMsm90TRTeG4L312idXB/5BeHBaeUZVgsqDuywsn0X0eBjNStfEDoHoXFAr5D5bHvQEwlsyU/YUzSgGWIsxyoPbRcg0o1zrSdyiNrXjsZHFPbleKIJIwZsxXQynZ1sB2oJsF7/sOWI5D2Cs6QlpQjru4RDQPdMK2ydANxt/Y5outVC5cbg03TUPgJ2vX56Lw1qG2sSmA0FjhhQLJ9/w+y03jPdLUz+4BUiMpDxIICfsHIpnxZ2Okw59CctwhqtKuF1KVtoQWM7lsEuXQiD/TYsHBEOVndZGsOJVb/mA/sKOAjQrl73RHBVUP+Yx99rBwaoAE8I9019qfp2zcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSNXkPMEQdJUJiWkKmkobk0mf1E25RxWMDBR3hHWaTs=;
 b=wO8RsboqWduRnpvO7zge5VKQm//DxW1V3pFwOLvhDXjKHMZzJZY//R2PRs+VHV1QtUBsjJchKHkU46tBmvlrCJPC0V8k16rqqfp83b96iogxWfBuXi1VK02hZgvS6wShvazg5RhBMfy+86IpRFZFFHpXEXPrBXeWRWO+lQu5EF8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB5544.namprd12.prod.outlook.com (2603:10b6:a03:1d9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 12:12:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21%5]) with mapi id 15.20.4909.019; Wed, 26 Jan 2022
 12:12:27 +0000
Message-ID: <e4426f53-43d7-8329-d746-b008b8afc83d@amd.com>
Date: Wed, 26 Jan 2022 13:12:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC v3 08/12] drm/amdgpu: Rework reset domain to be refcounted.
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
 <20220125223752.200211-9-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220125223752.200211-9-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0012.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a664b1d-042b-4b21-af37-08d9e0c51e85
X-MS-TrafficTypeDiagnostic: BY5PR12MB5544:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB554446FF0D27ABA836EE54B483209@BY5PR12MB5544.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r86eYbv8k0/MlNeqM/pZrZ7OUwVKad9xURp3IyVaoUh729M1mQU1eXjlEossjregeRKW44UONSsegHsIYgbtynTfVYqx7CnRgriVl+BNHpOXfBUnjgiYmuV0CWpxXqHLzYVjXNLeX8IjiElUwcCzNHLiAl97OI13d4B5sReCv8Mnmsv9tNxteRIAQeCB38L0L0upACIF929kHNtFivE5fWxf1EjfCp6DjeShHe8bagbkK268mv176TTX7a+n67v3FiIpjzz4nF+pd0VS8iKTbr1c831z1nQWLCMOA35AUChK+qRnFGCwaPULlAePjP4KHVYbJAC8lFx57V4OnVrz5WOaPKVpYzOGBrJGOHO+qTnLWROY6UL9sBvjMAst/MOs14C3XEZVTxsSkBgJtiBtziU0IsjbAJjt/3AieVe57ekOnLzI8W3rOV7C4c9PA0R9iTjIKTG8KQ6F7QqEDzGWJctd/9HwI0YFkkS+ZK+U17+aKF7KUpHQodzRpZGjsUrbPWI53HVsh6hkqRJVUS0OzJLJHHemHUeip2jmkeRUmD5Oi67z0Kp7e+KbCei6ahwfAJrdJqpoVPZKml+yTe7gf1suHjVqwbylyH8ETVs7Z0+Q/s5VVngfqy9tEDbuSNRLdr4WZvOJWmoKFiKIGr9SNqWm4CnvpOLbH8IfivZJCuojUMYo+Zl73ky94Frazk+xkEFc3X1mZyPyqdoKfsVKBaDqfzRRpqCQZizZVEVQYrvu1ETKYy8l0ZQS36NM8N/iIZxkn67LxHSHcIO9PPgyRm/tXtOAaL9RddGyJnsOnSjd/QxQ0jpA5BV6relcB9TM4QGQRjUSaSLwucm1k96FlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(66946007)(186003)(6666004)(6506007)(6512007)(2616005)(6486002)(966005)(4326008)(5660300002)(31686004)(8936002)(30864003)(2906002)(83380400001)(508600001)(86362001)(38100700002)(31696002)(8676002)(66476007)(66556008)(36756003)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b29VWXBnOThLNkpSd25KNnRwdzdaWlRpK3Q3dlN0YlhsYnFMTlNNWUhNOEYz?=
 =?utf-8?B?bExHWll3RnY0NWlVT0pKUXdlT2pRMFdGOTU5akJHUWcrbllmMStzeXJlN0xq?=
 =?utf-8?B?Y1p2ZnJ2Y3dXV21YbUg0SGwxWkltaGlvbVpmcUErY1FlamJ5Yi9sallvYm5v?=
 =?utf-8?B?aTFHRFU1UE1RY2xxcFhjQWw3Unk5c0x4d1lNWG45VEpNWWtiSE5RZDcyQlV2?=
 =?utf-8?B?WnhpTlFLVmFuUThWTWdESVdSaXJMQThaOHhVU01wTFlrYlJmT1dmN0FJVVZl?=
 =?utf-8?B?dWcvMnVHbURCbzY0a01qVTF2KzNWSk1lTTFaMEdUeENaRGlxYndobzdhRUpH?=
 =?utf-8?B?V2V3dFBLWHlYYXNqV1RGcFk1clZCZGpaWVF5eHArWVVEaDhPTUI1VjFoZmJZ?=
 =?utf-8?B?eEt1L25jWko5Smw3bmJEOE4zNEtzRGRWNFBYaHJaVjByUmQ1cG9Wcm91bFlP?=
 =?utf-8?B?MEhIZjVVcVhhWVVzNzg3VGVsNmJFaDdUYTdKeXlMYlBmYVFram1mQlhFaTRL?=
 =?utf-8?B?Qms1NzZxU3NGL0x6N0hjTXZkc3JCaFVzQ0t2SVFtK1hvS0k2ZHFmQUtjUUNp?=
 =?utf-8?B?ejRZWTBVOTFYci82bkVrS0FQRVNiNElTbkF4cmkxWE9JWkxhWmlZYnY3NitN?=
 =?utf-8?B?VG45dUw1a25PQStpcnkzSjVMZ1F5a1FsRGU0Z216OFdITm9wWGxHWmZXbnNW?=
 =?utf-8?B?d3BkN3dyaWdNVEdNZEdGQ3lpSndmVi9WNU10bUtyTXZ4UjFIdHJTZkFTZ2hK?=
 =?utf-8?B?Y0drNDVrYmcrYXFXeldCeW9mNFlpNndIWElqYzJNaDlkeFdtZk5NU1ZyR1g1?=
 =?utf-8?B?M3VLVnVLRkJFSkdtZGxuTDZhNnhnbEFXZyt1Zm42aHdxdXg3KytmUlI1S2Iy?=
 =?utf-8?B?TjJtMGFYTHRPTW5IQStXL3VWRkNMTnE5KzhvdFpJaG54ZXN1bFpIL0ZjQlpB?=
 =?utf-8?B?NTg4WThrZDFzdjNLaThFcytWYXdNcjkxYlQ4b2dlc0lRa0FaRThFT2EybkhU?=
 =?utf-8?B?UGhFQ0xHWG91N1JOOCtFY09VZVd5SFliTnpYL3VENHpvRVdrUXB3ZytJMjAx?=
 =?utf-8?B?SXdDS1EyYXZkekR1ZUlEM1lneUlJOUErVitKSzdPOHd1ZjNHSzkvaUhUTXM5?=
 =?utf-8?B?Z1NkUy9xNFFGY0ZFbCthMXhOL0hkWUNaTStGcmNBVlhJOTRaQUlMRnpscm8w?=
 =?utf-8?B?UVJ3T3VrazJuOEIrM3VaWjlqR2dLTElyMjNUWWZaaWFldURCTVE3ZHBmcnda?=
 =?utf-8?B?THhHQjdLRzhnbDhVdDU2WlE3QkxsRmkvUFYzbktIbGdmdEozK2FwQ2VnU0JD?=
 =?utf-8?B?cGdaNlFzZ0FSaE56Q3F1dUtveWQ3b2ZpQ1JGdDRqdFlVVE1Oa2NreWFXUlJJ?=
 =?utf-8?B?SDlodmw3M2dqQ0dIa3Z2eExNQUdJeXFBOVFMWWU4U0dXSFVpdmpXVTEwUnQ5?=
 =?utf-8?B?aTZsM29mOVhBRHk2YUpGWGRQakJXYUFEcnBIeUJBQmNieG1sZ3lJRnBOWFBs?=
 =?utf-8?B?bkNmd1FVSlRiN2NvVjg2eHNFdE1oNmxDYlNsZERZRUNzcGlUbUo0eTZnM1Br?=
 =?utf-8?B?Zy9sZHBCT0NzcmtUaXJvamNXMVk4Qmt5ZFdVb1g4SXlYaWQrU1pTb1RVbHcr?=
 =?utf-8?B?ZXlGV3pFMklLVXVsaW9OQVFhbFo1WGI5RE90ZG5vNVR4Q0V5YjRoNm84TmZH?=
 =?utf-8?B?MnphQzZrSlB5SDQvcll0L0IyTDVlcFhkUHROcHl6WjlGbEFmSllESmpmSldr?=
 =?utf-8?B?YkIzc2hsM1YyYkNrMXFDRmswT0dLU0xKSEFQVW1sWXU2SW5jQzl3ODhST3Uz?=
 =?utf-8?B?bmVwMTQ1L2UvbHoydHVrNzFNRU5yM3crYktROW43bmNCWmZSaFBBTWlINDlk?=
 =?utf-8?B?Rk1mU1p1ajBVcFlJZlpCS1BvNXp4UGtNcGVtRlAvMDN3NlgvYWdHWTdwQXBO?=
 =?utf-8?B?cVcvaytzMm0rMTk1cUkzQldSMTV5cEhoTm1IQ3NMZ28xdmV0Rm5sUWJ2eFpK?=
 =?utf-8?B?dmlsYXNKZUZsaFJ6MDNGYnFRckJRMXp2RitIcFN3OGZDVjRCNUd3UkpRQ3g3?=
 =?utf-8?B?WFpNcjJHdURzUEl0dzkvRjQvRnBPa2pvWkhLVERjRGFWZlpSRE94ZlY1d3Vs?=
 =?utf-8?B?M2l0cUZvWTl5ekM4dlJ3MS9ucWJxdmx0bVhib3F4WHFtMHNyY3FGRzZwYWI2?=
 =?utf-8?Q?nL7/Oyk4w8H6S8COcSutAWw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a664b1d-042b-4b21-af37-08d9e0c51e85
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 12:12:27.6611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0ql+zZVGYKfARIZBRd0cjEIFvduh6Qr4f8ocCqNOITJWobgr+wmY34u0EPnggCi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5544
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
Cc: horace.chen@amd.com, lijo.lazar@amd.com, jingwech@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 25.01.22 um 23:37 schrieb Andrey Grodzovsky:
> The reset domain contains register access semaphor
> now and so needs to be present as long as each device
> in a hive needs it and so it cannot be binded to XGMI
> hive life cycle.
> Adress this by making reset domain refcounted and pointed
> by each member of the hive and the hive itself.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  6 +--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 44 +++++++++++++---------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  | 36 ++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h  | 10 +++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   | 26 ++++++++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |  2 +-
>   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c      |  4 +-
>   drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c      |  4 +-
>   drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c      |  4 +-
>   9 files changed, 105 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 8e96b9a14452..f2ba460bfd59 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -813,9 +813,7 @@ struct amd_powerplay {
>   #define AMDGPU_RESET_MAGIC_NUM 64
>   #define AMDGPU_MAX_DF_PERFMONS 4
>   
> -struct amdgpu_reset_domain {
> -	struct workqueue_struct *wq;
> -};
> +struct amdgpu_reset_domain;
>   
>   struct amdgpu_device {
>   	struct device			*dev;
> @@ -1102,7 +1100,7 @@ struct amdgpu_device {
>   	struct amdgpu_reset_control     *reset_cntl;
>   	uint32_t                        ip_versions[HW_ID_MAX][HWIP_MAX_INSTANCE];
>   
> -	struct amdgpu_reset_domain	reset_domain;
> +	struct amdgpu_reset_domain	*reset_domain;

Ah! Here it is, I was missing that on the initial patch.

>   };
>   
>   static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index fef952ca8db5..b24829096359 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2313,7 +2313,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>   
>   		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>   				   ring->num_hw_submission, amdgpu_job_hang_limit,
> -				   timeout, adev->reset_domain.wq, ring->sched_score, ring->name);
> +				   timeout, adev->reset_domain->wq, ring->sched_score, ring->name);
>   		if (r) {
>   			DRM_ERROR("Failed to create scheduler on ring %s.\n",
>   				  ring->name);
> @@ -2432,24 +2432,22 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
>   	if (r)
>   		goto init_failed;
>   
> +	/**
> +	 * In case of XGMI grab extra reference for reset domain for this device
> +	 */
>   	if (adev->gmc.xgmi.num_physical_nodes > 1) {
> -		struct amdgpu_hive_info *hive;
> -
> -		amdgpu_xgmi_add_device(adev);
> +		if (amdgpu_xgmi_add_device(adev) == 0) {
> +			struct amdgpu_hive_info *hive = amdgpu_get_xgmi_hive(adev);
>   
> -		hive = amdgpu_get_xgmi_hive(adev);
> -		if (!hive || !hive->reset_domain.wq) {
> -			DRM_ERROR("Failed to obtain reset domain info for XGMI hive:%llx", hive->hive_id);
> -			r = -EINVAL;
> -			goto init_failed;
> -		}
> +			if (!hive->reset_domain ||
> +			    !kref_get_unless_zero(&hive->reset_domain->refcount)) {
> +				r = -ENOENT;
> +				goto init_failed;
> +			}
>   
> -		adev->reset_domain.wq = hive->reset_domain.wq;
> -	} else {
> -		adev->reset_domain.wq = alloc_ordered_workqueue("amdgpu-reset-dev", 0);
> -		if (!adev->reset_domain.wq) {
> -			r = -ENOMEM;
> -			goto init_failed;
> +			/* Drop the early temporary reset domain we created for device */
> +			kref_put(&adev->reset_domain->refcount, amdgpu_reset_destroy_reset_domain);
> +			adev->reset_domain = hive->reset_domain;
>   		}
>   	}
>   
> @@ -3599,6 +3597,15 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   		return r;
>   	}
>   
> +	/*
> +	 * Reset domain needs to be present early, before XGMI hive discovered
> +	 * (if any) and intitialized to use reset sem and in_gpu reset flag
> +	 * early on during init.
> +	 */
> +	adev->reset_domain = amdgpu_reset_create_reset_domain("amdgpu-reset-dev");
> +	if (!adev->reset_domain)
> +		return -ENOMEM;
> +
>   	/* early init functions */
>   	r = amdgpu_device_ip_early_init(adev);
>   	if (r)
> @@ -3949,6 +3956,9 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>   	if (adev->mman.discovery_bin)
>   		amdgpu_discovery_fini(adev);
>   
> +	kref_put(&adev->reset_domain->refcount, amdgpu_reset_destroy_reset_domain);
> +	adev->reset_domain = NULL;
> +
>   	kfree(adev->pci_state);
>   
>   }
> @@ -5186,7 +5196,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>   
>   	INIT_WORK(&work.base, amdgpu_device_queue_gpu_recover_work);
>   
> -	if (!queue_work(adev->reset_domain.wq, &work.base))
> +	if (!queue_work(adev->reset_domain->wq, &work.base))
>   		return -EAGAIN;
>   
>   	flush_work(&work.base);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> index 02afd4115675..f2d310cd8d40 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -96,3 +96,39 @@ int amdgpu_reset_perform_reset(struct amdgpu_device *adev,
>   	return reset_handler->restore_hwcontext(adev->reset_cntl,
>   						reset_context);
>   }
> +
> +
> +void amdgpu_reset_destroy_reset_domain(struct kref *ref)
> +{
> +	struct amdgpu_reset_domain *reset_domain = container_of(ref,
> +								struct amdgpu_reset_domain,
> +								refcount);
> +	destroy_workqueue(reset_domain->wq);
> +	kvfree(reset_domain);
> +}
> +
> +struct amdgpu_reset_domain *amdgpu_reset_create_reset_domain(char *wq_name)

Maybe just amdgpu_reset_domain_create()/amdgpu_reset_domain_destroy() ?

Apart from that nit looks good to me on first glance.

Regards,
Christian.

> +{
> +	struct amdgpu_reset_domain *reset_domain;
> +
> +	reset_domain = kvzalloc(sizeof(struct amdgpu_reset_domain), GFP_KERNEL);
> +	if (!reset_domain) {
> +		DRM_ERROR("Failed to allocate amdgpu_reset_domain!");
> +		return NULL;
> +	}
> +
> +	kref_init(&reset_domain->refcount);
> +
> +	reset_domain->wq = create_singlethread_workqueue(wq_name);
> +	if (!reset_domain->wq) {
> +		DRM_ERROR("Failed to allocate wq for amdgpu_reset_domain!");
> +		kref_put(&reset_domain->refcount, amdgpu_reset_destroy_reset_domain);
> +		return NULL;
> +
> +	}
> +
> +	return reset_domain;
> +}
> +
> +
> +
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> index e00d38d9160a..cd030e63e4c6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> @@ -70,6 +70,12 @@ struct amdgpu_reset_control {
>   	void (*async_reset)(struct work_struct *work);
>   };
>   
> +struct amdgpu_reset_domain {
> +	struct kref refcount;
> +	struct workqueue_struct *wq;
> +};
> +
> +
>   int amdgpu_reset_init(struct amdgpu_device *adev);
>   int amdgpu_reset_fini(struct amdgpu_device *adev);
>   
> @@ -82,4 +88,8 @@ int amdgpu_reset_perform_reset(struct amdgpu_device *adev,
>   int amdgpu_reset_add_handler(struct amdgpu_reset_control *reset_ctl,
>   			     struct amdgpu_reset_handler *handler);
>   
> +struct amdgpu_reset_domain *amdgpu_reset_create_reset_domain(char *wq_name);
> +
> +void amdgpu_reset_destroy_reset_domain(struct kref *ref);
> +
>   #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> index 9ad742039ac9..5908a3f8208a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> @@ -32,6 +32,8 @@
>   #include "wafl/wafl2_4_0_0_smn.h"
>   #include "wafl/wafl2_4_0_0_sh_mask.h"
>   
> +#include "amdgpu_reset.h"
> +
>   #define smnPCS_XGMI23_PCS_ERROR_STATUS   0x11a01210
>   #define smnPCS_XGMI3X16_PCS_ERROR_STATUS 0x11a0020c
>   #define smnPCS_GOPX1_PCS_ERROR_STATUS    0x12200210
> @@ -226,6 +228,9 @@ static void amdgpu_xgmi_hive_release(struct kobject *kobj)
>   	struct amdgpu_hive_info *hive = container_of(
>   		kobj, struct amdgpu_hive_info, kobj);
>   
> +	kref_put(&hive->reset_domain->refcount, amdgpu_reset_destroy_reset_domain);
> +	hive->reset_domain = NULL;
> +
>   	mutex_destroy(&hive->hive_lock);
>   	kfree(hive);
>   }
> @@ -392,12 +397,21 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
>   		goto pro_end;
>   	}
>   
> -	hive->reset_domain.wq = alloc_ordered_workqueue("amdgpu-reset-hive", 0);
> -	if (!hive->reset_domain.wq) {
> -		dev_err(adev->dev, "XGMI: failed allocating wq for reset domain!\n");
> -		kfree(hive);
> -		hive = NULL;
> -		goto pro_end;
> +	/**
> +	 * Avoid recreating reset domain when hive is reconstructed for the case
> +	 * of reset the devices in the XGMI hive during probe for SRIOV
> +	 * See https://www.spinics.net/lists/amd-gfx/msg58836.html
> +	 */
> +	if (!adev->reset_domain) {
> +		hive->reset_domain = amdgpu_reset_create_reset_domain("amdgpu-reset-hive");
> +			if (!hive->reset_domain) {
> +				dev_err(adev->dev, "XGMI: failed initializing reset domain for xgmi hive\n");
> +				ret = -ENOMEM;
> +				kobject_put(&hive->kobj);
> +				kfree(hive);
> +				hive = NULL;
> +				goto pro_end;
> +			}
>   	}
>   
>   	hive->hive_id = adev->gmc.xgmi.hive_id;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
> index 2f2ce53645a5..dcaad22be492 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
> @@ -42,7 +42,7 @@ struct amdgpu_hive_info {
>   		AMDGPU_XGMI_PSTATE_UNKNOWN
>   	} pstate;
>   
> -	struct amdgpu_reset_domain reset_domain;
> +	struct amdgpu_reset_domain *reset_domain;
>   };
>   
>   struct amdgpu_pcs_ras_field {
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> index b2b40e169342..05e98af30b48 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> @@ -32,6 +32,8 @@
>   #include "soc15_common.h"
>   #include "mxgpu_ai.h"
>   
> +#include "amdgpu_reset.h"
> +
>   static void xgpu_ai_mailbox_send_ack(struct amdgpu_device *adev)
>   {
>   	WREG8(AI_MAIBOX_CONTROL_RCV_OFFSET_BYTE, 2);
> @@ -302,7 +304,7 @@ static int xgpu_ai_mailbox_rcv_irq(struct amdgpu_device *adev,
>   	switch (event) {
>   		case IDH_FLR_NOTIFICATION:
>   		if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
> -			WARN_ONCE(!queue_work(adev->reset_domain.wq,
> +			WARN_ONCE(!queue_work(adev->reset_domain->wq,
>   					      &adev->virt.flr_work),
>   				  "Failed to queue work! at %s",
>   				  __func__);
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> index 08411924150d..6e12055f3f4a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> @@ -31,6 +31,8 @@
>   #include "soc15_common.h"
>   #include "mxgpu_nv.h"
>   
> +#include "amdgpu_reset.h"
> +
>   static void xgpu_nv_mailbox_send_ack(struct amdgpu_device *adev)
>   {
>   	WREG8(NV_MAIBOX_CONTROL_RCV_OFFSET_BYTE, 2);
> @@ -337,7 +339,7 @@ static int xgpu_nv_mailbox_rcv_irq(struct amdgpu_device *adev,
>   	switch (event) {
>   	case IDH_FLR_NOTIFICATION:
>   		if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
> -			WARN_ONCE(!queue_work(adev->reset_domain.wq,
> +			WARN_ONCE(!queue_work(adev->reset_domain->wq,
>   					      &adev->virt.flr_work),
>   				  "Failed to queue work! at %s",
>   				  __func__);
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
> index 02290febfcf4..fe1570c2146e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
> @@ -42,6 +42,8 @@
>   #include "smu/smu_7_1_3_d.h"
>   #include "mxgpu_vi.h"
>   
> +#include "amdgpu_reset.h"
> +
>   /* VI golden setting */
>   static const u32 xgpu_fiji_mgcg_cgcg_init[] = {
>   	mmRLC_CGTT_MGCG_OVERRIDE, 0xffffffff, 0xffffffff,
> @@ -551,7 +553,7 @@ static int xgpu_vi_mailbox_rcv_irq(struct amdgpu_device *adev,
>   
>   		/* only handle FLR_NOTIFY now */
>   		if (!r && !amdgpu_in_reset(adev))
> -			WARN_ONCE(!queue_work(adev->reset_domain.wq,
> +			WARN_ONCE(!queue_work(adev->reset_domain->wq,
>   					      &adev->virt.flr_work),
>   				  "Failed to queue work! at %s",
>   				  __func__);

