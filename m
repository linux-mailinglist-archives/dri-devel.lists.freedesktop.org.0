Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBGcAP72pWl5IQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 21:45:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4611C1E0881
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 21:45:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3C410E5BF;
	Mon,  2 Mar 2026 20:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NJM99vM/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012064.outbound.protection.outlook.com [40.107.209.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458B110E5BF
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 20:45:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TDiUWz005JVqVUimtyoBBQ4NY5cZYp6VHjluU/J1IqKX9h/ynfpz5DF7nGKUiTpBAEHhq+qi8YeBSL5Cz88QxCp3hcR1yGM2h1uMC6q/e2p50i4D3YIL6p9X6WFSRHdXpjE20yIxAPMVw7mywH7kOdQkp0cdsgoMOqTI6A/sTSMRmULqgKuBz6WuurmwQrxiSW03K2qgS21nvFMgwgs5i1K9IzmAOwm5hFK20doFkXdIrQACCJPBXxcUkoyvh0DyviDiEqeDnK3W9jriqGFchrfzEdlkBPO5VkBGQlqz/voHP2WDZ8jB/STaLJnhMwtP8Mv6gYEwoO4i/gI56KhdOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qI4O1itc8gmPHH9zQ7Rh2PZKgh2UCSKS6wq/8mpVI5s=;
 b=bYLgShTAqcpUcENbbuX6kvJqCyXfCaa0GmKU1cQdgnKJzm6ZHMBjkJDNdDdTGUvJo9TW010SyXJJhhlZnlNRf2VDfnyzBj2mmugv9q47OjzdipYpfFl74biycuyzRhtlcyYuvvoFdn8qeSsIJqVgobHa+F9C38lb9m1xhZrCo826JD1OcnZGE3Lv+I8P2xknvGnwdPsMjc509nP0BLFusLJWbGLREIdlHOO9Bv4yejeMKOJ36aH3CGI5HlAryZbMcAjJrlE+ogVDK3CbK5Q8Ly5CCZ5QrslJAbLumQnslKIV5chvXphHz76WW7vZ9OggzIUiEQJjCof9Dl1B3cqPUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qI4O1itc8gmPHH9zQ7Rh2PZKgh2UCSKS6wq/8mpVI5s=;
 b=NJM99vM/Y9lv6ysG769XUKrtdhs5DYmcI8IojiAM96N2BDKDYaR+IaZuoMCu3dW7NtVft7iU8BkK5hvWrG/q8k7rZAJfsDpSoEewuP9E2wtTN12Kp4108OriPr/zpuKYNxrFDDjaItTON09Wv5Yn0nHSLYxWyRySsU0+IMqWNXM=
Received: from CH0PR03CA0090.namprd03.prod.outlook.com (2603:10b6:610:cc::35)
 by CH3PR12MB8481.namprd12.prod.outlook.com (2603:10b6:610:157::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 20:45:38 +0000
Received: from DS2PEPF000061C8.namprd02.prod.outlook.com
 (2603:10b6:610:cc:cafe::14) by CH0PR03CA0090.outlook.office365.com
 (2603:10b6:610:cc::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Mon,
 2 Mar 2026 20:45:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF000061C8.mail.protection.outlook.com (10.167.23.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 20:45:37 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 2 Mar
 2026 14:45:36 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Mar
 2026 14:45:36 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 2 Mar 2026 14:45:36 -0600
Message-ID: <630aba31-94df-08d4-07d1-93cd05715b3c@amd.com>
Date: Mon, 2 Mar 2026 12:45:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] accel/ivpu: Limit number of maximum contexts and
 doorbells per user
Content-Language: en-US
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <jeff.hugo@oss.qualcomm.com>,
 <karol.wachowski@linux.intel.com>
References: <20260302202207.469442-1-maciej.falkowski@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20260302202207.469442-1-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C8:EE_|CH3PR12MB8481:EE_
X-MS-Office365-Filtering-Correlation-Id: 979d4a71-2cbc-4881-7ba3-08de789ca89c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: n2NBgl2dYuFcynelOj2VS99Wa8yPSfAfg0Xc1iGjoE5l537KKgDKVMyKvHClbvI/zFxj+P3YFo2WRfsOVhvibsWf4cqB/PfovgyCL2meFm73wtnwynyy7Z6l6JFu5jqfxw1dVAKTkwL4VMooMYmIR64tWRZ/ywE1z7mlwJ1HgoC4OXraM+51ibbpYzZGRceyJsbah6SrCioNOM7j43DUZP4qb81QeNNt3PcSkwZeX8Fe3XgwTqIICn7Vou3faqki3tBIe7M7AW6qJekWj1OcyJlEj+HNBiR3Y18EmYj93tdB4ujCQNJnc9g3OOOx1I7iu8l5/T3LkACCxfxTW5bT6NbHeeuKap6B4P/puMJb0kEUVY5YMi95O4mMN2fSFfsDL03cYYV2k6SGZhfJq/r9x46K2bNfPmZPxzn8fA1/v7CIAPRGV3yOcrZyE0aHyN4BO/MdZ0oB1fn8m6IECIT+VGiAun8YtqNjuSF1bbt7zUscwJTh8Sczg3WxablQNGc2aE9esOV/xJIJz3YiYYH7dtbh+nJ3AADDque67sk8jsScwk34fbY8fymDOU5k5ZLihgABiGjsVRTOgZ9p1hUFegY+l0jbVZmilFWoUgBuyBXTtMdFfxgpfQdQlcqQ6WxxNHZKua4vZwEhUMNuZDXdqdPwUvv6dYnJ7e9vhCfCjPg+DT+fpngRpvY+qbxPcD3f41iB2OyuyQb57xk+EN9AxUpp6oIFUExMbxf3GdV+1PhJ3HNIP7LiAOhpJ+QlSurQOZgawIIx+dahdv4+3itvLs2B7ZjbiHxpvYXZxd2sKmrleLYNQsm7x6YOr9yZ5+hn6kGnL3xQfBIlTWWcIDa+tg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qASjZBvX8mWDxvra4F0cmCT7WieMUb1fnNlx6bh+CkzHd2h3z2a5N0lEel3+YMd74X1Tobw8Qci9mfGNFb2r62s7+4RCY3jZIga5+hQbXQI/g1tWsoAkeF1Vkilwwm1Y3Raxjo3bSzTBQiWm29JmIpM9pwMEXgQxBp27qgPW83VNu/Er2CvkZKP8AhK0Kf9Y1nqyctWdH9Es3hJf64JLQAEWUy/CHFdmaDWrwlsaNU0J2rzb7sZbbdeYsttJ3itkE3GZnqI60nOKVINMxO1u5RKTHAYoVFCrU3aMyZjVixL5/bywycxQIbg3y6VsXbnCQFKjabkI97fZ8RpPmM4v9+I+bP1EDjcBxQ6cCMWfshdE62JkjecrAWWUF1XRVKMW3j/nbjSbT29SRdWJZk15DLxmRaaKS/L6zcq+Ia1Tmsbm8jdV1HwfaNW2ollwDIn2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:45:37.1344 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 979d4a71-2cbc-4881-7ba3-08de789ca89c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8481
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
X-Rspamd-Queue-Id: 4611C1E0881
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maciej.falkowski@linux.intel.com,m:oded.gabbay@gmail.com,m:jeff.hugo@oss.qualcomm.com,m:karol.wachowski@linux.intel.com,m:odedgabbay@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,linux.intel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action


On 3/2/26 12:22, Maciej Falkowski wrote:
> From: Karol Wachowski <karol.wachowski@linux.intel.com>
>
> Implement per-user resource limits to prevent resource exhaustion.
>
> Root users can allocate all available contexts (128) and doorbells
> (255), while non-root users are limited to half of the available
> resources (64 contexts and 127 doorbells respectively).
>
> This prevents scenarios where a single user could monopolize NPU
> resources and starve other users on multi-user systems.
>
> Change doorbell ID and command queue ID allocation errors to debug
> messages as those are user triggered.
>
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
> v2 -> v3:
>    - Refactor to use kzalloc_obj*() due to treewide rework.
> v1 -> v2:
>    - Fixed off-by-one error (Lizhi)
> ---
>   drivers/accel/ivpu/ivpu_drv.c | 94 ++++++++++++++++++++++++++++++++---
>   drivers/accel/ivpu/ivpu_drv.h | 26 ++++++++--
>   drivers/accel/ivpu/ivpu_job.c | 36 ++++++++++----
>   3 files changed, 136 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index 5900a40c7a78..dd3a486df5f1 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -67,6 +67,73 @@ bool ivpu_force_snoop;
>   module_param_named(force_snoop, ivpu_force_snoop, bool, 0444);
>   MODULE_PARM_DESC(force_snoop, "Force snooping for NPU host memory access");
>   
> +static struct ivpu_user_limits *ivpu_user_limits_alloc(struct ivpu_device *vdev, uid_t uid)
> +{
> +	struct ivpu_user_limits *limits;
> +
> +	limits = kzalloc_obj(*limits);
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
> +	if (!limits)
> +		return ERR_PTR(-ENOMEM);
> +
> +	kref_init(&limits->ref);
> +	atomic_set(&limits->db_count, 0);
> +	limits->vdev = vdev;
> +	limits->uid = uid;
> +
> +	/* Allow root user to allocate all contexts */
> +	if (uid == 0) {
> +		limits->max_ctx_count = ivpu_get_context_count(vdev);
> +		limits->max_db_count = ivpu_get_doorbell_count(vdev);
> +	} else {
> +		limits->max_ctx_count = ivpu_get_context_count(vdev) / 2;
> +		limits->max_db_count = ivpu_get_doorbell_count(vdev) / 2;
> +	}
> +
> +	hash_add(vdev->user_limits, &limits->hash_node, uid);
> +
> +	return limits;
> +}
> +
> +static struct ivpu_user_limits *ivpu_user_limits_get(struct ivpu_device *vdev)
> +{
> +	struct ivpu_user_limits *limits;
> +	uid_t uid = current_uid().val;
> +
> +	guard(mutex)(&vdev->user_limits_lock);
> +
> +	hash_for_each_possible(vdev->user_limits, limits, hash_node, uid) {
> +		if (limits->uid == uid) {
> +			if (kref_read(&limits->ref) >= limits->max_ctx_count) {
> +				ivpu_dbg(vdev, IOCTL, "User %u exceeded max ctx count %u\n", uid,
> +					 limits->max_ctx_count);
> +				return ERR_PTR(-EMFILE);
> +			}
> +
> +			kref_get(&limits->ref);
> +			return limits;
> +		}
> +	}
> +
> +	return ivpu_user_limits_alloc(vdev, uid);
> +}
> +
> +static void ivpu_user_limits_release(struct kref *ref)
> +{
> +	struct ivpu_user_limits *limits = container_of(ref, struct ivpu_user_limits, ref);
> +	struct ivpu_device *vdev = limits->vdev;
> +
> +	lockdep_assert_held(&vdev->user_limits_lock);
> +	drm_WARN_ON(&vdev->drm, atomic_read(&limits->db_count));
> +	hash_del(&limits->hash_node);
> +	kfree(limits);
> +}
> +
> +static void ivpu_user_limits_put(struct ivpu_device *vdev, struct ivpu_user_limits *limits)
> +{
> +	guard(mutex)(&vdev->user_limits_lock);
> +	kref_put(&limits->ref, ivpu_user_limits_release);
> +}
> +
>   struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv)
>   {
>   	struct ivpu_device *vdev = file_priv->vdev;
> @@ -110,6 +177,7 @@ static void file_priv_release(struct kref *ref)
>   	mutex_unlock(&vdev->context_list_lock);
>   	pm_runtime_put_autosuspend(vdev->drm.dev);
>   
> +	ivpu_user_limits_put(vdev, file_priv->user_limits);
>   	mutex_destroy(&file_priv->ms_lock);
>   	mutex_destroy(&file_priv->lock);
>   	kfree(file_priv);
> @@ -169,7 +237,7 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
>   		args->value = ivpu_hw_dpu_max_freq_get(vdev);
>   		break;
>   	case DRM_IVPU_PARAM_NUM_CONTEXTS:
> -		args->value = ivpu_get_context_count(vdev);
> +		args->value = file_priv->user_limits->max_ctx_count;
>   		break;
>   	case DRM_IVPU_PARAM_CONTEXT_BASE_ADDRESS:
>   		args->value = vdev->hw->ranges.user.start;
> @@ -231,22 +299,30 @@ static int ivpu_open(struct drm_device *dev, struct drm_file *file)
>   {
>   	struct ivpu_device *vdev = to_ivpu_device(dev);
>   	struct ivpu_file_priv *file_priv;
> +	struct ivpu_user_limits *limits;
>   	u32 ctx_id;
>   	int idx, ret;
>   
>   	if (!drm_dev_enter(dev, &idx))
>   		return -ENODEV;
>   
> +	limits = ivpu_user_limits_get(vdev);
> +	if (IS_ERR(limits)) {
> +		ret = PTR_ERR(limits);
> +		goto err_dev_exit;
> +	}
> +
>   	file_priv = kzalloc_obj(*file_priv);
>   	if (!file_priv) {
>   		ret = -ENOMEM;
> -		goto err_dev_exit;
> +		goto err_user_limits_put;
>   	}
>   
>   	INIT_LIST_HEAD(&file_priv->ms_instance_list);
>   
>   	file_priv->vdev = vdev;
>   	file_priv->bound = true;
> +	file_priv->user_limits = limits;
>   	kref_init(&file_priv->ref);
>   	mutex_init(&file_priv->lock);
>   	mutex_init(&file_priv->ms_lock);
> @@ -284,6 +360,8 @@ static int ivpu_open(struct drm_device *dev, struct drm_file *file)
>   	mutex_destroy(&file_priv->ms_lock);
>   	mutex_destroy(&file_priv->lock);
>   	kfree(file_priv);
> +err_user_limits_put:
> +	ivpu_user_limits_put(vdev, limits);
>   err_dev_exit:
>   	drm_dev_exit(idx);
>   	return ret;
> @@ -343,8 +421,7 @@ static int ivpu_wait_for_ready(struct ivpu_device *vdev)
>   	ivpu_ipc_consumer_del(vdev, &cons);
>   
>   	if (!ret && ipc_hdr.data_addr != IVPU_IPC_BOOT_MSG_DATA_ADDR) {
> -		ivpu_err(vdev, "Invalid NPU ready message: 0x%x\n",
> -			 ipc_hdr.data_addr);
> +		ivpu_err(vdev, "Invalid NPU ready message: 0x%x\n", ipc_hdr.data_addr);
>   		return -EIO;
>   	}
>   
> @@ -453,7 +530,7 @@ int ivpu_shutdown(struct ivpu_device *vdev)
>   }
>   
>   static const struct file_operations ivpu_fops = {
> -	.owner		= THIS_MODULE,
> +	.owner = THIS_MODULE,
>   	DRM_ACCEL_FOPS,
>   #ifdef CONFIG_PROC_FS
>   	.show_fdinfo = drm_show_fdinfo,
> @@ -592,6 +669,7 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
>   	xa_init_flags(&vdev->submitted_jobs_xa, XA_FLAGS_ALLOC1);
>   	xa_init_flags(&vdev->db_xa, XA_FLAGS_ALLOC1);
>   	INIT_LIST_HEAD(&vdev->bo_list);
> +	hash_init(vdev->user_limits);
>   
>   	vdev->db_limit.min = IVPU_MIN_DB;
>   	vdev->db_limit.max = IVPU_MAX_DB;
> @@ -600,6 +678,10 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
>   	if (ret)
>   		goto err_xa_destroy;
>   
> +	ret = drmm_mutex_init(&vdev->drm, &vdev->user_limits_lock);
> +	if (ret)
> +		goto err_xa_destroy;
> +
>   	ret = drmm_mutex_init(&vdev->drm, &vdev->submitted_jobs_lock);
>   	if (ret)
>   		goto err_xa_destroy;
> @@ -717,7 +799,7 @@ static struct pci_device_id ivpu_pci_ids[] = {
>   	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_PTL_P) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_WCL) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_NVL) },
> -	{ }
> +	{}
>   };
>   MODULE_DEVICE_TABLE(pci, ivpu_pci_ids);
>   
> diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
> index 5b34b6f50e69..6378e23e0c97 100644
> --- a/drivers/accel/ivpu/ivpu_drv.h
> +++ b/drivers/accel/ivpu/ivpu_drv.h
> @@ -12,6 +12,7 @@
>   #include <drm/drm_mm.h>
>   #include <drm/drm_print.h>
>   
> +#include <linux/hashtable.h>
>   #include <linux/pci.h>
>   #include <linux/xarray.h>
>   #include <uapi/drm/ivpu_accel.h>
> @@ -43,7 +44,7 @@
>   /* SSID 1 is used by the VPU to represent reserved context */
>   #define IVPU_RESERVED_CONTEXT_MMU_SSID 1
>   #define IVPU_USER_CONTEXT_MIN_SSID     2
> -#define IVPU_USER_CONTEXT_MAX_SSID     (IVPU_USER_CONTEXT_MIN_SSID + 63)
> +#define IVPU_USER_CONTEXT_MAX_SSID     (IVPU_USER_CONTEXT_MIN_SSID + 128)
>   
>   #define IVPU_MIN_DB 1
>   #define IVPU_MAX_DB 255
> @@ -51,9 +52,6 @@
>   #define IVPU_JOB_ID_JOB_MASK		GENMASK(7, 0)
>   #define IVPU_JOB_ID_CONTEXT_MASK	GENMASK(31, 8)
>   
> -#define IVPU_NUM_PRIORITIES    4
> -#define IVPU_NUM_CMDQS_PER_CTX (IVPU_NUM_PRIORITIES)
> -
>   #define IVPU_CMDQ_MIN_ID 1
>   #define IVPU_CMDQ_MAX_ID 255
>   
> @@ -123,6 +121,16 @@ struct ivpu_fw_info;
>   struct ivpu_ipc_info;
>   struct ivpu_pm_info;
>   
> +struct ivpu_user_limits {
> +	struct hlist_node hash_node;
> +	struct ivpu_device *vdev;
> +	struct kref ref;
> +	u32 max_ctx_count;
> +	u32 max_db_count;
> +	u32 uid;
> +	atomic_t db_count;
> +};
> +
>   struct ivpu_device {
>   	struct drm_device drm;
>   	void __iomem *regb;
> @@ -142,6 +150,8 @@ struct ivpu_device {
>   	struct mutex context_list_lock; /* Protects user context addition/removal */
>   	struct xarray context_xa;
>   	struct xa_limit context_xa_limit;
> +	DECLARE_HASHTABLE(user_limits, 8);
> +	struct mutex user_limits_lock; /* Protects user_limits */
>   
>   	struct xarray db_xa;
>   	struct xa_limit db_limit;
> @@ -189,6 +199,7 @@ struct ivpu_file_priv {
>   	struct list_head ms_instance_list;
>   	struct ivpu_bo *ms_info_bo;
>   	struct xa_limit job_limit;
> +	struct ivpu_user_limits *user_limits;
>   	u32 job_id_next;
>   	struct xa_limit cmdq_limit;
>   	u32 cmdq_id_next;
> @@ -286,6 +297,13 @@ static inline u32 ivpu_get_context_count(struct ivpu_device *vdev)
>   	return (ctx_limit.max - ctx_limit.min + 1);
>   }
>   
> +static inline u32 ivpu_get_doorbell_count(struct ivpu_device *vdev)
> +{
> +	struct xa_limit db_limit = vdev->db_limit;
> +
> +	return (db_limit.max - db_limit.min + 1);
> +}
> +
>   static inline u32 ivpu_get_platform(struct ivpu_device *vdev)
>   {
>   	WARN_ON_ONCE(vdev->platform == IVPU_PLATFORM_INVALID);
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index fe02b7bd465b..f0154dfa6ddc 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -173,7 +173,7 @@ static struct ivpu_cmdq *ivpu_cmdq_create(struct ivpu_file_priv *file_priv, u8 p
>   	ret = xa_alloc_cyclic(&file_priv->cmdq_xa, &cmdq->id, cmdq, file_priv->cmdq_limit,
>   			      &file_priv->cmdq_id_next, GFP_KERNEL);
>   	if (ret < 0) {
> -		ivpu_err(vdev, "Failed to allocate command queue ID: %d\n", ret);
> +		ivpu_dbg(vdev, IOCTL, "Failed to allocate command queue ID: %d\n", ret);
>   		goto err_free_cmdq;
>   	}
>   
> @@ -215,14 +215,22 @@ static int ivpu_hws_cmdq_init(struct ivpu_file_priv *file_priv, struct ivpu_cmdq
>   
>   static int ivpu_register_db(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq)
>   {
> +	struct ivpu_user_limits *limits = file_priv->user_limits;
>   	struct ivpu_device *vdev = file_priv->vdev;
>   	int ret;
>   
> +	if (atomic_inc_return(&limits->db_count) > limits->max_db_count) {
> +		ivpu_dbg(vdev, IOCTL, "Maximum number of %u doorbells for uid %u reached\n",
> +			 limits->max_db_count, limits->uid);
> +		ret = -EBUSY;
> +		goto err_dec_db_count;
> +	}
> +
>   	ret = xa_alloc_cyclic(&vdev->db_xa, &cmdq->db_id, NULL, vdev->db_limit, &vdev->db_next,
>   			      GFP_KERNEL);
>   	if (ret < 0) {
> -		ivpu_err(vdev, "Failed to allocate doorbell ID: %d\n", ret);
> -		return ret;
> +		ivpu_dbg(vdev, IOCTL, "Failed to allocate doorbell ID: %d\n", ret);
> +		goto err_dec_db_count;
>   	}
>   
>   	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW)
> @@ -231,15 +239,18 @@ static int ivpu_register_db(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *
>   	else
>   		ret = ivpu_jsm_register_db(vdev, file_priv->ctx.id, cmdq->db_id,
>   					   cmdq->mem->vpu_addr, ivpu_bo_size(cmdq->mem));
> -
> -	if (!ret) {
> -		ivpu_dbg(vdev, JOB, "DB %d registered to cmdq %d ctx %d priority %d\n",
> -			 cmdq->db_id, cmdq->id, file_priv->ctx.id, cmdq->priority);
> -	} else {
> +	if (ret) {
>   		xa_erase(&vdev->db_xa, cmdq->db_id);
>   		cmdq->db_id = 0;
> +		goto err_dec_db_count;
>   	}
>   
> +	ivpu_dbg(vdev, JOB, "DB %d registered to cmdq %d ctx %d priority %d\n",
> +		 cmdq->db_id, cmdq->id, file_priv->ctx.id, cmdq->priority);
> +	return 0;
> +
> +err_dec_db_count:
> +	atomic_dec(&limits->db_count);
>   	return ret;
>   }
>   
> @@ -298,6 +309,7 @@ static int ivpu_cmdq_unregister(struct ivpu_file_priv *file_priv, struct ivpu_cm
>   	}
>   
>   	xa_erase(&file_priv->vdev->db_xa, cmdq->db_id);
> +	atomic_dec(&file_priv->user_limits->db_count);
>   	cmdq->db_id = 0;
>   
>   	return 0;
> @@ -313,6 +325,7 @@ static inline u8 ivpu_job_to_jsm_priority(u8 priority)
>   
>   static void ivpu_cmdq_destroy(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq)
>   {
> +	lockdep_assert_held(&file_priv->lock);
>   	ivpu_cmdq_unregister(file_priv, cmdq);
>   	xa_erase(&file_priv->cmdq_xa, cmdq->id);
>   	ivpu_cmdq_free(file_priv, cmdq);
> @@ -380,8 +393,11 @@ static void ivpu_cmdq_reset(struct ivpu_file_priv *file_priv)
>   	mutex_lock(&file_priv->lock);
>   
>   	xa_for_each(&file_priv->cmdq_xa, cmdq_id, cmdq) {
> -		xa_erase(&file_priv->vdev->db_xa, cmdq->db_id);
> -		cmdq->db_id = 0;
> +		if (cmdq->db_id) {
> +			xa_erase(&file_priv->vdev->db_xa, cmdq->db_id);
> +			atomic_dec(&file_priv->user_limits->db_count);
> +			cmdq->db_id = 0;
> +		}
>   	}
>   
>   	mutex_unlock(&file_priv->lock);
