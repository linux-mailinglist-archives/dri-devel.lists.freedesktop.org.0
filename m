Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A1ED0C0EB
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 20:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FFC10E93E;
	Fri,  9 Jan 2026 19:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iW3XWIzB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010071.outbound.protection.outlook.com [52.101.85.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CAC10E93D;
 Fri,  9 Jan 2026 19:24:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m4BEezx4hr3FBgBQE+YOhs7Av97avN5V5uI5kOOKJnv/u7TGK73AbYc8HM4lOtZ26orQUAcKtWwumDCZIRrvNbalFpRJt6K7y/ssKMgVI5egv7ElT7idb9fZxYM14qVLqiRlGeVX04lEO2L+6Q6gdtLWt/WF61NOqnK5mlWgLrZtWcaZTMqxS7jhZ0E9wLFtujugr4DXX/q3OMiwkjDgToCPFqA6jX0EMcWmvTgUNb5w2cRlySvjv616+2+gcp8cnO/4jQsOQn8RNfLS9kHpTK38yiBI1ujL2EPkhToMU84Q5cUYBS3osGQO1FpCZwWUfUXUTo+K28Sl8znXPYxMcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdoHr9u56DRjqjXhVeG1eqZ7XPopP0RJ6CEMg9tSB6w=;
 b=CWJ8aBkM/pzRhvhal+MgvA3fbLF0EV7rcaXNPOUSX+CreKfuXwxUAX8LzHMcNfLlQ8IA5Nvgw4doL1LAuRpz5N4Xbr2eqTIY4Z6ewHqoTsqH+mtRT7GtRrXgRaS6pGn1K5uIFPZCQcvA6J9WB6AsGO8WNWEUyArww0HWBfvz4BbcbiBCtCFgOdukTMk3je9my0CF4mYeOGuLAvKCPSj5zhjlABdR1rLKxikrlfK8tdPvT05AK9+W1XVPpiJzTdgHmKdJbI1cIZFHXvduGK29I/2ReB1DPuyhMNZEa6SI6c1WjZ+XOEXvxh7xmsrSFqK/QbTtrZM2mnZII/ehL2CkMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdoHr9u56DRjqjXhVeG1eqZ7XPopP0RJ6CEMg9tSB6w=;
 b=iW3XWIzBuWW9ha/DMEXN2qCLPq/E1ehUGNX/EIKJ/dkARJBQGtnr598O64U757utpzXWU2V109o7TB9KEPpfKptW2MzDDCpbtpuF8tGzaUGTlJxyyrwIs0bR7zZ/hzKqxe5EEwUEHIEX8liVoFS3vZ186qHctAhASpdplrhiPJk=
Received: from SA0PR12CA0006.namprd12.prod.outlook.com (2603:10b6:806:6f::11)
 by DS0PR12MB6414.namprd12.prod.outlook.com (2603:10b6:8:cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 19:24:31 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:6f:cafe::ea) by SA0PR12CA0006.outlook.office365.com
 (2603:10b6:806:6f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 19:24:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 19:24:30 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 13:24:30 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 13:24:30 -0600
Received: from [10.254.94.155] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 9 Jan 2026 13:24:27 -0600
Message-ID: <a2b22837-5867-430f-8e7b-37eba3357ad1@amd.com>
Date: Fri, 9 Jan 2026 14:24:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm: Introduce drm_crtc_vblank_prepare()
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <jani.nikula@linux.intel.com>, <ville.syrjala@linux.intel.com>
References: <20260109192027.116325-1-sunpeng.li@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20260109192027.116325-1-sunpeng.li@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|DS0PR12MB6414:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a61d969-3c83-41f7-cdf4-08de4fb4b662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|42112799006|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEE3OWxEdURud0VHSWNKbCsxa0RlMldydnp0Yk9zRVFhQVd2b3pOampxLzZU?=
 =?utf-8?B?cW9pZjJNUWcvRmJFaCt6QW1XZzlJcHhjazdrREsvQytIcVFFcVlSWkZiRUd0?=
 =?utf-8?B?SExNWEh3S0hQMGZzUUtwNFZGU1FkMUNDaHBLUFZsRXcrTE5iZzJ6dUczSlZp?=
 =?utf-8?B?S1RaQWdvbmpXc05MV21wSFRMUld3OE9jUEU2cVhoV0VKb3kwQ1dPRGNpRldX?=
 =?utf-8?B?c240ZmVVdkE4dlJCN1M4UkNQTlh1UjM0a0RCWVdVTzhHTE5CT2dGQmlHa0p2?=
 =?utf-8?B?NG4yb0xLWXMrbUR6bmlrdmxYSm9MSHlKQUh2UkF3Nmlub3pYWW9BaHQrSExV?=
 =?utf-8?B?QWRwa2dOcDBIdmRNMEtDRVVrVGdWL25tMHJaS0NjNUpJeU01ait4V1FrMEZX?=
 =?utf-8?B?OEZxNVlsUWlaZUtxY1NqTXN1dThIZHNzcVRaamVsNGdqWldBREo3MDgrbWRs?=
 =?utf-8?B?bllxdHowQS8xVDB0R281WHNoWUYzUmk5VVlhdjFyYlcwYWhhK0laYXAwMVE1?=
 =?utf-8?B?MWRnbHg3aFVibkZWNkhRK05TSHV5c0paVFFPNWZOY2RVam82dHNnZUtrQzZv?=
 =?utf-8?B?bTM5TEZlNU9tbHA4OVNVazZNVjZ5R2U5OVdNbkZKeGs4Rk1hcjJUUXJGMWx5?=
 =?utf-8?B?RS9PbE14aHdYQm1YL21sdmVYWXNBSk5XbUx5eFBYMExibEVjK2dkSUV4YXA5?=
 =?utf-8?B?Qk40Vm0yMDA4cEdwcE4xaEN5b0liUEh4WVRtQnNwQXdNTG1XUkZyWWg3V0Iy?=
 =?utf-8?B?QVVsejRhblJlamYyU3N4a3lrQWpGOUFxL1ZUTnd6dUl0Ry9QY1dIQUxDU1NQ?=
 =?utf-8?B?OHdTRzRvVTdOa1gvbi9ZM3pmSUJsTkRPY0ZYZXlYZnp5WEsxb0V6WU1tbXZs?=
 =?utf-8?B?bEREMmtYWTNacitOaFpacGhmMytVdElVRHQ2NnIzMDRGWEVWYUdEemxjbVRD?=
 =?utf-8?B?ZTdYdDZmMVlrTERKZkpZYktuRlJPSmtUZFc3UmtEQUtqN0ZUdDFjRkQ0R1Zz?=
 =?utf-8?B?cFZFZ2Iza1hxcE1IY3ZUYkQ3V2R5cmFoSlVhb0V6cWl2c2h1T05BRDFzMG1R?=
 =?utf-8?B?dUtSOE9JWVlQNjFvZzRyZFZJSE5WQmFtTTB6VHp2c3lPWFBtV21XZUxrSUZE?=
 =?utf-8?B?ZEMvWjA2aEhYcHVIekFOVTlSTlR6KzlIRTgrVUt3M2l6V1NaMk9RN1YxK0ZC?=
 =?utf-8?B?dVJqd21GTXlLRFV5YUVaOXlpc1ZZTXl6V2NIaEdHUjdmNVkwcnpjcEhlN0wx?=
 =?utf-8?B?Yjl3TEF3TlFocTlLdnZ2cmtxRHcydi9INmVRQWRrdWRiLzVSZVpwYWMxQ2lu?=
 =?utf-8?B?VUJ3Y3ZOZUtncVZIbURSeHMxU1lxaWtYdmtpRzZTcTByYTRBQnl5eEFtV2dM?=
 =?utf-8?B?UTdjZ1Y2dVlCOHIrcVhsTGxlYitoVUthQVdaU3RrWUNoRkFQc1dpRU1BdCtL?=
 =?utf-8?B?TUw1MHp5OG9LcHJ1VVZVQjhxNE4xaDlXRGZBQ0l6QkRSbFdmbXpXR2pqTEt0?=
 =?utf-8?B?d3dhVDRlYVFVYmtKT1JTeFkyQ3dsaVNmaEtwc0s1RDdUNWdYa2tNLy9keHNR?=
 =?utf-8?B?WU9URXN2NmhOVGlwQVlxQm9UeVdXcXRMbndIRDVXZE0ycTRkVEpIbjZEUlYr?=
 =?utf-8?B?aHN6L1NPNFlsdmRPUkx5Sm9uOHd4UStLMDk5Vkg2OWNmQWw3L0NjcUlCSUtv?=
 =?utf-8?B?YmExUUdqK0JaWUFYZWFwM0g4dEdXMEs4dFpPcnh4SlRWamJuY3dTd1FHU3Ft?=
 =?utf-8?B?RmVkM0hDZ1JObitJRWtMWkVLN255bzN4RmI3ZnE3aDBSMzJWNyt1S1NWaXdp?=
 =?utf-8?B?bzRPMFczWlE4elBMMFlTWERLdlFvT3pNbkc4aFd1RTRZcXBmU1k4Y0lSWGxw?=
 =?utf-8?B?YmRzSk9pVzZxSnMxd0FpK0xpV211QjFMUHF1ekY3QU5JWURrRFJ3eERPem0w?=
 =?utf-8?B?dVFUS1ExMVp5QjZGMHg5ZzFwNnEvTyt1WXROdHNSdFBVWUF2RTNKcmhmaUFE?=
 =?utf-8?B?WTc1RzllRUpvYVBFNHpjeVlGVkM0NHg1TjVXRGNxQU5xc0lvY2lzU0tzT296?=
 =?utf-8?B?eCs5aUtMZVgyUTJCU1dVM3V0UENBVStISjViOUVieTFlckFhMHpnY2kzSlB0?=
 =?utf-8?Q?VeN0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(42112799006)(376014)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 19:24:30.5203 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a61d969-3c83-41f7-cdf4-08de4fb4b662
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6414
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



On 2026-01-09 14:20, sunpeng.li@amd.com wrote:
> From: Leo Li <sunpeng.li@amd.com>
> 
> Some drivers need to perform sleepable operations prior to enabling
> vblank interrupts. A display hardware spin-up from a low-power state
> that requires synchronization with the rest of the driver, for example.
> 
> To support this, introduce a DRM-internal drm_crtc_vblank_prepare()
> helper that calls back into the driver -- if implemented -- for DRM to
> do such preparation work before enabling vblank.
> 
> v3:
> * Unexport drm_crtc_vblank_prepare() and make it DRM internal
> * Drop warnings in drm core for vblank_prepare(), drivers can do so in
>   their implementations
> * Drop unnecessary crtc null checks
> * Check for drm_dev_has_vblank()
> * Rebase on latest drm-misc-next
> 
> Signed-off-by: Leo Li <sunpeng.li@amd.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c  |  9 ++++++
>  drivers/gpu/drm/drm_client_modeset.c |  4 +++
>  drivers/gpu/drm/drm_internal.h       |  1 +
>  drivers/gpu/drm/drm_plane.c          |  5 +++
>  drivers/gpu/drm/drm_vblank.c         | 48 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_vblank_helper.c  |  5 ++-
>  drivers/gpu/drm/drm_vblank_work.c    |  8 +++++
>  include/drm/drm_crtc.h               | 21 ++++++++++++
>  include/drm/drm_vblank.h             |  1 +
>  9 files changed, 101 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 5840e9cc6f666..2b9fa4aa48a1a 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -48,6 +48,7 @@
>  
>  #include "drm_crtc_helper_internal.h"
>  #include "drm_crtc_internal.h"
> +#include "drm_internal.h"
>  
>  /**
>   * DOC: overview
> @@ -1268,6 +1269,10 @@ crtc_disable(struct drm_device *dev, struct drm_atomic_state *state)
>  		if (!drm_dev_has_vblank(dev))
>  			continue;
>  
> +		ret = drm_crtc_vblank_prepare(crtc);
> +		if (ret)
> +			continue;
> +
>  		ret = drm_crtc_vblank_get(crtc);
>  		/*
>  		 * Self-refresh is not a true "disable"; ensure vblank remains
> @@ -1823,6 +1828,10 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
>  		if (!new_crtc_state->active)
>  			continue;
>  
> +		ret = drm_crtc_vblank_prepare(crtc);
> +		if (ret != 0)
> +			continue;
> +
>  		ret = drm_crtc_vblank_get(crtc);
>  		if (ret != 0)
>  			continue;
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index fc4caf7da5fcd..6ccbde921dde4 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -1325,6 +1325,10 @@ int drm_client_modeset_wait_for_vblank(struct drm_client_dev *client, unsigned i
>  	 * Only wait for a vblank event if the CRTC is enabled, otherwise
>  	 * just don't do anything, not even report an error.
>  	 */
> +	ret = drm_crtc_vblank_prepare(crtc);
> +	if (ret)
> +		return ret;
> +
>  	ret = drm_crtc_vblank_get(crtc);
>  	if (!ret) {
>  		drm_crtc_wait_one_vblank(crtc);
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index f893b1e3a596e..8e3e21d734075 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -112,6 +112,7 @@ static inline bool drm_vblank_passed(u64 seq, u64 ref)
>  }
>  
>  void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe);
> +int drm_crtc_vblank_prepare(struct drm_crtc *crtc);
>  int drm_vblank_get(struct drm_device *dev, unsigned int pipe);
>  void drm_vblank_put(struct drm_device *dev, unsigned int pipe);
>  u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe);
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index bed2562bf911b..41681a3d96b15 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -35,6 +35,7 @@
>  #include <drm/drm_vblank.h>
>  
>  #include "drm_crtc_internal.h"
> +#include "drm_internal.h"
>  
>  /**
>   * DOC: overview
> @@ -1421,6 +1422,10 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
>  		u32 current_vblank;
>  		int r;
>  
> +		r = drm_crtc_vblank_prepare(crtc);
> +		if (r)
> +			return r;
> +
>  		r = drm_crtc_vblank_get(crtc);
>  		if (r)
>  			return r;
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 42fe11cc139b9..b8a967a4ba7e5 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1208,6 +1208,32 @@ static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
>  	return ret;
>  }
>  
> +/**
> + * drm_crtc_vblank_prepare - prepare to enable vblank interrupts
> + *
> + * @crtc: which CRTC to prepare
> + *
> + * Some drivers may need to spin-up hardware from a low power state before
> + * enabling vblank interrupts. This function calls the prepare_enable_vblank
> + * callback, if available, to allow drivers to do that.
> + *
> + * This is a DRM-internal function, and is a thin wrapper around a driver
> + * callback. Drivers are expected to sequence their own prepare work internally.
> + *
> + * The spin-up may call sleeping functions, such as mutex_lock(). Therefore,
> + * this must be called from process context, where sleeping is allowed.
> + */
> +int drm_crtc_vblank_prepare(struct drm_crtc *crtc)
> +{
> +	if (!drm_dev_has_vblank(crtc->dev))
> +		return -EINVAL;
> +
> +	if (crtc->funcs->prepare_enable_vblank)
> +		return crtc->funcs->prepare_enable_vblank(crtc);
> +
> +	return 0;
> +}
> +
>  int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
>  {
>  	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
> @@ -1306,6 +1332,10 @@ int drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
>  	int ret;
>  	u64 last;
>  
> +	ret = drm_crtc_vblank_prepare(crtc);
> +	if (ret)
> +		return ret;
> +
>  	ret = drm_vblank_get(dev, pipe);
>  	if (drm_WARN(dev, ret, "vblank not available on crtc %i, ret=%i\n",
>  		     pipe, ret))
> @@ -1489,6 +1519,9 @@ void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
>  	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>  		return;
>  
> +	if (drm_crtc_vblank_prepare(crtc))
> +		return;
> +
>  	spin_lock_irq(&dev->vbl_lock);
>  	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
>  		    pipe, vblank->enabled, vblank->inmodeset);
> @@ -1796,6 +1829,13 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>  		return 0;
>  	}
>  
> +	crtc = drm_crtc_from_index(dev, vblank->pipe);
> +	if (crtc) {
> +		ret = drm_crtc_vblank_prepare(crtc);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret = drm_vblank_get(dev, pipe);
>  	if (ret) {
>  		drm_dbg_core(dev,
> @@ -2031,6 +2071,10 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
>  		READ_ONCE(vblank->enabled);
>  
>  	if (!vblank_enabled) {
> +		ret = drm_crtc_vblank_prepare(crtc);
> +		if (ret)
> +			return ret;
> +
>  		ret = drm_crtc_vblank_get(crtc);
>  		if (ret) {
>  			drm_dbg_core(dev,
> @@ -2098,6 +2142,10 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
>  	if (e == NULL)
>  		return -ENOMEM;
>  
> +	ret = drm_crtc_vblank_prepare(crtc);
> +	if (ret)
> +		return ret;
> +
>  	ret = drm_crtc_vblank_get(crtc);
>  	if (ret) {
>  		drm_dbg_core(dev,
> diff --git a/drivers/gpu/drm/drm_vblank_helper.c b/drivers/gpu/drm/drm_vblank_helper.c
> index a04a6ba1b0ca0..fc5915acfa7f3 100644
> --- a/drivers/gpu/drm/drm_vblank_helper.c
> +++ b/drivers/gpu/drm/drm_vblank_helper.c
> @@ -8,6 +8,8 @@
>  #include <drm/drm_vblank.h>
>  #include <drm/drm_vblank_helper.h>
>  
> +#include "drm_internal.h"
> +
>  /**
>   * DOC: overview
>   *
> @@ -61,7 +63,8 @@ void drm_crtc_vblank_atomic_flush(struct drm_crtc *crtc,
>  	crtc_state->event = NULL;
>  
>  	if (event) {
> -		if (drm_crtc_vblank_get(crtc) == 0)
> +		if (drm_crtc_vblank_prepare(crtc) == 0 &&
> +		    drm_crtc_vblank_get(crtc) == 0)
>  			drm_crtc_arm_vblank_event(crtc, event);
>  		else
>  			drm_crtc_send_vblank_event(crtc, event);
> diff --git a/drivers/gpu/drm/drm_vblank_work.c b/drivers/gpu/drm/drm_vblank_work.c
> index 70f0199251ea0..252f60007781b 100644
> --- a/drivers/gpu/drm/drm_vblank_work.c
> +++ b/drivers/gpu/drm/drm_vblank_work.c
> @@ -113,11 +113,19 @@ int drm_vblank_work_schedule(struct drm_vblank_work *work,
>  {
>  	struct drm_vblank_crtc *vblank = work->vblank;
>  	struct drm_device *dev = vblank->dev;
> +	struct drm_crtc *crtc;
>  	u64 cur_vbl;
>  	unsigned long irqflags;
>  	bool passed, inmodeset, rescheduling = false, wake = false;
>  	int ret = 0;
>  
> +	crtc = drm_crtc_from_index(dev, vblank->pipe);
> +	if (crtc) {
> +		ret = drm_crtc_vblank_prepare(crtc);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	spin_lock_irqsave(&dev->event_lock, irqflags);
>  	if (work->cancelling)
>  		goto out;
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 66278ffeebd68..e5cf232d604c9 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -871,6 +871,27 @@ struct drm_crtc_funcs {
>  	 */
>  	u32 (*get_vblank_counter)(struct drm_crtc *crtc);
>  
> +	/**
> +	 * @prepare_enable_vblank:
> +	 *
> +	 * An optional callback to prepare driver for enabling of vblank
> +	 * interrupts. It allows drivers to perform any blocking operations for
> +	 * hardware setup that might be needed, and thus is called before any
> +	 * vblank spinlocks are acquired. It is called unconditionally,
> +	 * regardless of whether vblank interrupts are already enabled or not.
> +	 *
> +	 * Consequently, this callback is not synchronized with the rest of
> +	 * vblank management. Drivers should not access spinlock protected
> +	 * states here.
> +	 *
> +	 * This callback is optional. If not set, no preparation is performed.
> +	 *
> +	 * Returns:
> +	 *
> +	 * Zero on success, negative errno on failure.
> +	 */
> +	int (*prepare_enable_vblank)(struct drm_crtc *crtc);
> +
>  	/**
>  	 * @enable_vblank:
>  	 *
> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> index 2fcef9c0f5b1b..c91384ee2617b 100644
> --- a/include/drm/drm_vblank.h
> +++ b/include/drm/drm_vblank.h
> @@ -301,6 +301,7 @@ void drm_vblank_set_event(struct drm_pending_vblank_event *e,
>  bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe);
>  bool drm_crtc_handle_vblank(struct drm_crtc *crtc);
>  int drm_crtc_vblank_get(struct drm_crtc *crtc);
> +int drm_crtc_vblank_prepare_and_get(struct drm_crtc *crtc);

Oops, please ignore this line -- a remenant of a previous idea that I missed cleaning up.
- Leo

>  void drm_crtc_vblank_put(struct drm_crtc *crtc);
>  int drm_crtc_wait_one_vblank(struct drm_crtc *crtc);
>  void drm_crtc_vblank_off(struct drm_crtc *crtc);

