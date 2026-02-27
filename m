Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDhgM8a2oWm+vwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 16:22:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AF71B9AD2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 16:22:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803F510EBBE;
	Fri, 27 Feb 2026 15:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vZtjEz5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013025.outbound.protection.outlook.com
 [40.107.201.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECB710E19E;
 Fri, 27 Feb 2026 15:22:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6BuCRbhtrL8l2E08bNaMz9g06HVSeaTvBMwNiB6+qPEVNRTbSXWCZQ1w9GcoSqRd03rT382aH59pfbrIZR1pXnkoxDYCFdBg50D6cXY/EWOoE/yP0+AL+2alEEorNui6tQGRqC9hw+c/FZql5J2tngj1PqKaKZy6iPZtECDtz01AIGXQ0HnTZEEfIkj3SWNg7qp2olh1hBOuN6l8Rdv5SCdYQVLo7BhZ8SH7mnQZ4lcvGKOtDFLvnAQ2TcL0dRW2iZvDObN3x127jbfapLOd2FgiWq2SJRT82PQz/qnnOJCMm9OYMsVfxzFbunzkCft7qzyuWwo9FjRrfMQvFdHkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCxAZ6SDkcezgV8MT7Vg6ldknipCPNXQ3ua9UwCXdDM=;
 b=l6aOF/+XFIbKBoxdl0qn7qnwZvUNngvJdEXu10cxVgjKS8G/CvWF5LOpRwMUNwZ7DucsUVJ8Xjq1fYuNRY6/eYmHNaQXuhsm3IjHH8ZLtf3zEDTkTPV0RdscQS4iv1ngfkOAcn7QBuM+EquFg6HNcukPSfAw8ZJo5qR/2PifPK6b+5p0/h3BxyGdctowj1LDCemJFxUXbNAgrR8Dne1EdmNPdqxZEy18Uaglho923rpya/etyPDs+nofuokq7UzQC8wg4Fma8so1yyskzmsBd5SJbFa7t4k6eUqe5g2Nu6cFWEF6/ECIJTcO9lbgPuNzSCZKG6G0DVIQzEgwefVM8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCxAZ6SDkcezgV8MT7Vg6ldknipCPNXQ3ua9UwCXdDM=;
 b=vZtjEz5AI1FvFrN5VIQ6OxhRYi9q1o6f4kWHbL6CZHemQdZJSZbL/Pfum/yzNJvXvqt4JoDpiLu125m995Ft+m0YC9NbuiPNxGzotUi2HE11gs/MHSOoDmQDbwCh3opLpf96kHhw5tgVbWVtNQMI9yINDWN55KppRc+0VsWJOy0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB6777.namprd12.prod.outlook.com (2603:10b6:303:1e9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Fri, 27 Feb
 2026 15:22:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 15:22:36 +0000
Message-ID: <62c3dd75-0ecc-456e-a4b7-8999b6dbe9aa@amd.com>
Date: Fri, 27 Feb 2026 16:22:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon: Test for imported buffers with
 drm_gem_is_imported()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Alex Deucher
 <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
References: <20260227133113.235940-10-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260227133113.235940-10-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0403.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f5958d-c145-45ac-3b35-08de761408ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: ttmJ7jIUMm1VrJheHNX4kuPvSrk8Q3YPennVkGU8hEMlF13CmA1Yaf4NP1tppwlxHUHKi2HrVzI9nQ26AjYQw5QUFn7i0ZpA5UCRIExUSQU1Z24I5nokw38un2dQ8VwWZp9V0vv/4cAfxuiq+TDxJL9tLsR10Ego6uYtgUnoN9PTehCnKGe9rdoBRg6QRNYbP0gaxTLhnGrUrmc6BTwHNhCYMs+h8dwJ5h1Y3uXH0GNO16sHyFlzmzf0emEPTK9O1ipgew8nGCcVPQ+/u4PldLFzvwR/JdZ8V6aqs6vq2MADv9nAVcY4OZZghx9SqxsFN52IUIcyTrnYFrRIO00sNJ8KNAzgjwQis+wVlas/UwYSF1D40KBXEvBEFeKBKmQySR5JiV6/o+SELLwsPC1YHLOaJ2RrR9Y9CFrHi5/E/Q4A1MfUbQ/Rp3hhAV9vXUkF8bY4lEHBcl9SyrI6dE5wq9n2omv8m8Y1Dp1rTXgCW+rQwef644sbvnr2tYSi9Bco8na+YGUlj+sizzf/PoPxd9rtiT7v/XR1cf+TwdXWaSMQ8ty3AfOwnqVqQfMiBgdKB4Ij3h1tKWTY6flRenzb6SAReEW1373lusF/sW44sYFyEVIZONCbWBHWKvFuNC+Hwn6bFDktbenKSNk6k2MSNcsd+NaNAehftVkbKcB910+MIMLst0KuGF/U9MfIU90GnkEBXLyzdd6rQ1NcTaevDrVctvQgYz2lFZ8nXbsBKBk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y09sMzlzdS9CYlU0ZUR2bUpJUUxVV3k3TEdnd3FxUHZ6UzVQWlYveStnSzVY?=
 =?utf-8?B?bVA0QnJCbEJWbDdIYmd1WFZCb2dPTmhoZFhoSkYvL1Z0Y09XQTQxTVpFTUZJ?=
 =?utf-8?B?ZXM2Y1h6UW5DY3NtR1A0bThFRXEvcjF0TUpNV1g1STVPSjVQaTF6cUxLKzhW?=
 =?utf-8?B?T24xdWt4b1VxczJlRCtVa285NHpCbEhIZXU0NWNQM1Q3bHQvUSsyVGhVYll3?=
 =?utf-8?B?MEJnK0JlTTN1Rk9CaDJMZmxTREN0VnJ0TkgyTFZHK2I3eWF6STN4QVdIK3ZD?=
 =?utf-8?B?VkgzL2VjYThCYmZpSVk4amp4K0lUcmc4bmk0QktjVmNkN09jTEZPaUwzRjE2?=
 =?utf-8?B?VGIwQ0MyZUorR1RydGYwbXM2b3kzSS9xMnZ0aTRVOHF6eC9VZzFaMExMV3NS?=
 =?utf-8?B?QVJYNWc5SDd6U1BXVUdRYnZJWjFIN0dXVXdzM085M0w5MG1XNVZoL1FUNm5s?=
 =?utf-8?B?MkkvZm15SHp0bTRHYWg4S0R3L2tqY0kvRHdERjdpQnJsMU5YR2J1SkhwalNW?=
 =?utf-8?B?RmNzQWVBS2NEd3RVM29lYUNYMEpNU094S21YM29sbTQ1TU5NRzlaaXVTbE54?=
 =?utf-8?B?NW82M3pXVXFlOWxUc0JkblV6Mi9EUUo0bHY5cHNPc2tnaW0xa3BVUE5lMTFR?=
 =?utf-8?B?KzlWSmpIRlB5VHY0bG4wNGRNUExIUno2YzlrcDJtdmhxWFFTRndSanB6OXVG?=
 =?utf-8?B?S2tXYnRyRkdqRzBZdExBb0ZyUWQ1V3NYSDB4U3JvZit0WnFOTkNnTW5qckwv?=
 =?utf-8?B?bU45Rm1TSUFDb21MNFBEcVRGb09sRW4wSEdsdHFPeFRyR2FlemdxVmsyRXo0?=
 =?utf-8?B?N3ZXY2JKRHJITW1EYnBac0lVaXNoK3VaNERLRmlydlg2R3ZWa2xzQ3poN0FY?=
 =?utf-8?B?WnAwdmRlc2RxR0hkZGM3bzVYRVc1RkliZzd2YXVXN0wyeXRmb1ZvTFdDandI?=
 =?utf-8?B?TFErdkJqTnp5SlZyZGl6b1RVYmtCRHRxUjc3ekxHYm5wM2VrdUdpeXZxWFdU?=
 =?utf-8?B?alNWSkRiem40TDJRb25NelhITXNQN2hiSmdiZHFUa0s5V2dHbHk3OWw1QXI3?=
 =?utf-8?B?SDN1aXQvQkgwOU5ucFRwR3V2cG9adHpMK21XWTRMRW9jTlV1a2I5MEs1OVpB?=
 =?utf-8?B?a2d0ZFVNczNTRmtiMFpZRWtTMUE0d1Y1bURCRStFVWZ3enJjUEZlTDVyNXUw?=
 =?utf-8?B?d3B4WUlqT2JjQ25PU1VSMGJlL3d2U3ZqQlFRMVk5akVoaXBYQmlNTDJyalBD?=
 =?utf-8?B?bDJBbm53SWtCYXNyRlorcG05QkZ1RkwzdE9Gd2NjYlUwaVlBanV2dlpjdjNC?=
 =?utf-8?B?dkFVbVB0TW9oTmR3ZjQ1dkRBeVNMNWVoUG5ISHdXQ293R2ZkWlNnZEsxdWVp?=
 =?utf-8?B?Q2xsTHRlN3RmaGhQRys4K2JLcU03bCtuK1ZJNWxTZ2drUVdCSkEvandxWkRL?=
 =?utf-8?B?L0kxVWpibEVPOVhOdU5EZktKZ1ZYdU1iZHVYZ1QwV05adktvYUh6S2tud3FB?=
 =?utf-8?B?YWxVSmlQSWM0aUFEL0EyUVU4NjRrWkFZVFlVWUxjZEJqdkpOWVBZcWsrdXht?=
 =?utf-8?B?YndaT1Z6K09NNDFCRVBqdFJpMlplVlBBV1JIVjQ2REtMVkc2TGwyUG1Fc2cx?=
 =?utf-8?B?bGR5WGdoOVdzUVYwbmhqMjlWU3R0cXhwRk9oZENyZytsZERCQ2RQU0h0V1JS?=
 =?utf-8?B?YzQ3dFVoL0NBQ3VkcVZZSllJRk1jQUxXR0IxVmU2QlYya2R0UzdRWGliNyt4?=
 =?utf-8?B?OWZaMSttV2svT1BuVEVUM2o0U043am44eitjZXFhZGIxRTZVamFyN0pBM0Zn?=
 =?utf-8?B?YjJVRDdLL0l0dDBLdFZNQ2FSY09Sd2RvRVB2d0tLQ09yRVJOWnN4Y05wMzQy?=
 =?utf-8?B?QjY1MlJXS2Vma2NvdUhrSHI3aE5YKzgrc09LaFBnM1ZtZi8zU1RvOHVNYlRH?=
 =?utf-8?B?Nlo4bElycGRjczNDZkw3RFlzUTZza1FQUTBWNlNnNnRhZVhPd0pUTmdUUlFy?=
 =?utf-8?B?S1E5REFxcGIxR2x4dC8vS1NFMmVjaUhOK09YeWVabWRLTVMvSWMvbStxNERT?=
 =?utf-8?B?bDNBTXBFdFZaWk5uRHBUbEl6VjRaK2JQbUdQT2RPanJjQlBZYUpPL3BHaVpv?=
 =?utf-8?B?eWZ1WkpQVTV5OXF6QWtXNHkycUVRQXBkK0sxTWJPdHBqOU9ZMEJUWHVqY1lo?=
 =?utf-8?B?UHhWTnFMT3NSZFZWQWVRK2FCcmM2K2svZWViZnUybThGQlpodm9iUldwYWhU?=
 =?utf-8?B?ZXk3Yk1BT0ltNG1TM0FVdjFLaGpqZU5HWVEvcURnQThPUnhERjVsOStiaEcy?=
 =?utf-8?Q?cruzhdvnTV95lCeh/U?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f5958d-c145-45ac-3b35-08de761408ea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 15:22:36.0950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEaVUt1RwMWXp5q8aaMs6bUqnGuXhXUsNxvv4iKsj5zY1vLawbi4Jd5JWau3zYKZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6777
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[suse.de,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:email,amd.com:mid,amd.com:dkim,amd.com:email,suse.de:email]
X-Rspamd-Queue-Id: 29AF71B9AD2
X-Rspamd-Action: no action

On 2/27/26 14:31, Thomas Zimmermann wrote:
> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test. The test itself does not change.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: amd-gfx@lists.freedesktop.org

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/radeon/radeon_display.c | 2 +-
>  drivers/gpu/drm/radeon/radeon_object.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index 5c72aad3dae7..4002a85cba3b 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -1340,7 +1340,7 @@ radeon_user_framebuffer_create(struct drm_device *dev,
>  	}
>  
>  	/* Handle is imported dma-buf, so cannot be migrated to VRAM for scanout */
> -	if (obj->import_attach) {
> +	if (drm_gem_is_imported(obj)) {
>  		DRM_DEBUG_KMS("Cannot create framebuffer from imported dma_buf\n");
>  		drm_gem_object_put(obj);
>  		return ERR_PTR(-EINVAL);
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
> index a0fc0801abb0..2d958272d810 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -60,7 +60,7 @@ static void radeon_ttm_bo_destroy(struct ttm_buffer_object *tbo)
>  	mutex_unlock(&bo->rdev->gem.mutex);
>  	radeon_bo_clear_surface_reg(bo);
>  	WARN_ON_ONCE(!list_empty(&bo->va));
> -	if (bo->tbo.base.import_attach)
> +	if (drm_gem_is_imported(&bo->tbo.base))
>  		drm_prime_gem_destroy(&bo->tbo.base, bo->tbo.sg);
>  	drm_gem_object_release(&bo->tbo.base);
>  	kfree(bo);

