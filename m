Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMF8JYxIo2l//AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 20:57:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13B01C79B6
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 20:56:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0122810E053;
	Sat, 28 Feb 2026 19:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3Sg+NR8w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013046.outbound.protection.outlook.com
 [40.107.201.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2C310E053
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 19:56:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkvRlwrl8bdffy65kwNHkbhPYC/uYx/qaD6MvPv6/1Q2MJVxgsV2xRrjUUyb6J7m0YZtxC4241e8FicMfOCzNxhh6wdDwi/174+g76O61uByUAYyjcQpYNLPcuL1aHXKqqs5CVlKzE6nBYZr0vjw8AK8/dC/j+rirJNFU6s5dlhw4kCcRif1umxz5aNoeUQ2h7yABAM3ipolOSgXf2JmewG2xsTgQtOFZBGZUaRf5wW+AG01LIAmDpnN4HfKcPivBEkdcSyhWQvI3yDtbdgGMzO5MzojK5PV/9yK/GdR68u31HvCGxB588J/7Dv8vXzwgyHzPo5pKMry3lDuldtyRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSwoRLol3FU2fDgeh6OiFlCy0rZBTCF0Ih2FOKX7uhc=;
 b=Ec84zFmwTA6Vgu0oQBZtYiRKhxSMu6UNsDVzVNsbr0/FUd3444GkXLE61AwpnPqBXAV1xTKSTAFH4xgPI0IH89zgNcgc7Ji+qL0jWvGpXjT6dX+cZjVsDlVflwFngPOAwQjPQR7/IZL5x+Htg9hImHWKmZ8YI309m8wtQa5na5kzliQj3m6X6E3X/3osxYV5CFT0UgVKZM8ucHcaO1yqaDz61OjzLihnEpuhyXK5pHooniyhp5x4CLXUqzhSaX8KfbsrdGXlrPw6daYfcB6qQ4MkdCtqL9XTl6zLmf+G5Qu7SP2EcbUkOQ2vM29m3cPk3Laqeq0K6/eESv4cLn0+9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=amd.com; 
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSwoRLol3FU2fDgeh6OiFlCy0rZBTCF0Ih2FOKX7uhc=;
 b=3Sg+NR8wFNM5enbrRzhutGE3FtvesgWZs9LIrqNiUstVHvaAupbvuxXjCtVqEsVxUlspUrSmUg91SHRv4/W/qHqTLgSzKmJQlm3eqULzcyoT0TYaOqwICkIy0R/ZT7aqjB06Kx1ltfUvI3SpjVmnt2l3/KBiwFZFeAr/AXeXp1g=
Received: from PH0PR07CA0029.namprd07.prod.outlook.com (2603:10b6:510:5::34)
 by LV2PR12MB5776.namprd12.prod.outlook.com (2603:10b6:408:178::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Sat, 28 Feb
 2026 19:56:48 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::9e) by PH0PR07CA0029.outlook.office365.com
 (2603:10b6:510:5::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Sat,
 28 Feb 2026 19:56:47 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Sat, 28 Feb 2026 19:56:46 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Sat, 28 Feb
 2026 13:56:44 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 28 Feb
 2026 13:56:44 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sat, 28 Feb 2026 13:56:43 -0600
Message-ID: <85172fca-e400-c542-772e-704bcef0a5dc@amd.com>
Date: Sat, 28 Feb 2026 11:56:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] accel/amdxdna: Support sensors for column utilization
Content-Language: en-US
To: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 <mario.limonciello@amd.com>, <airlied@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mamin506@gmail.com>,
 <mripard@kernel.org>, <ogabbay@kernel.org>, <simona@ffwll.ch>,
 <tzimmermann@suse.de>
CC: <dri-devel@lists.freedesktop.org>
References: <20260228061109.361239-1-superm1@kernel.org>
 <20260228061109.361239-3-superm1@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20260228061109.361239-3-superm1@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|LV2PR12MB5776:EE_
X-MS-Office365-Filtering-Correlation-Id: 510b911b-67cb-46d8-f6c5-08de7703811d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: a/aRHSpNtycme2PamoUful53xr1Oqonoufo50Ao9UnXz+0kSK9XNhhER6vW6sPgmc2e/YQygQM/L2hRzjLHUSfWyfDEFJKdwGnotPsBg7IyhStB+nDsrkjG2WuxSIqmU4RQKr4VSYfLE21v+9Hdq9BH7nze9IjNFLlNbivxzbgfkFuP9n3UkkOv4drwtX2238MPoLeAb9gDvZGVZC77vf6aI3ZxGGj4csQHhPcFoJalahotmPqEh1loWijtaeRxXh4C+xOkHl703IHjtilfbeV/lOQL9zz4gFkvtmKvxEdPQyufyzA1f+uYJao/a5JUb3GAGJzvWl2ldfdIlJXneSozjLFDDpydaj/FwSKvUmFAF39fx18KZ2UwknJLxIOQWoh0fxh2v4Jubcv2ivWJa0c8HvlfE8rzwoi5FE5KktVtHaBfgqqlcrxBvfg4sfsHy2cSEC4y+KNYpbBM1UvxLuL136wMkTSpXYHL0f9Z4pufw/M3kbfpBbMIJlQVkA+FLvTc+pvmPXX+LPOK13iMRU7yvfjrmydRgVOCnlD0NrNHaixzQG67RsCHLb0HlFpnVauLGnJWmGMPWq82fSKS2Nclkj1ie2XtKuu3wOs9R48KQg1X+N3jXQh8n8GmcdxCN+qCtT8oL/gyRyhGoNQv95+nB32aikK2oZ57rlzLCVTfELuBziL7PyY5bThixYWHKIy9gKMCdHwCInkjYXqrwLX3/C/Io0/tUEgudUj/Y4nBr+kUmYCwQYoG4P2XQk5B9S76AUQsEwJE5dXPSWC3wNhuIXIn2ktBVNitseQtk/rS0STtQ9Qj+SQSoCa9Q9cOxGHDa0wAcmVhqXyxa+J8gdQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jAoAYpnhyl4Q1Gp/fknrrJa8HpYDNUhRpdYVZ28reK5We3myW1oTLQYua6bsOsnnxPJgxOJHt3iQTulunE4AjdlwhSQrNGWscrildkPt62a5GRvTDb+ICVCgdhRVWgzXOtfx8vQ/Ac17aDMZbioM798RLzbmIEgl7xYJxnKxvwMzLwycXfe4uBwua0g8FvHnalPlAoLiSr//DL6usQ1SLZbX+eivjwhPqq9BTZGZYPdyBcLVD+2XGBSCEj06chnWV5Qej9ND6+0SQlV+LKy5wWJSOcGJ1A2V3RtKKz+g9lhREBR15mtxa4Bd3iTo5ATnHu6OzcwMeMDjKsbK2+QXvveWnQJuDXX+VgxRGEP3udKgco5Dm61dl1+hq+LfZVtllNvKYYxKuO7K3VQQqWZ26guCNYzW0bCS142mmEa1L8C3bL2n8Jrtx4vre2I5izKs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 19:56:46.7140 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 510b911b-67cb-46d8-f6c5-08de7703811d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5776
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:superm1@kernel.org,m:mario.limonciello@amd.com,m:airlied@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mamin506@gmail.com,m:mripard@kernel.org,m:ogabbay@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,amd.com,gmail.com,linux.intel.com,ffwll.ch,suse.de];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C13B01C79B6
X-Rspamd-Action: no action


On 2/27/26 22:10, Mario Limonciello (AMD) wrote:
> The AMD PMF driver provides realtime column utilization (npu_busy)
> metrics for the NPU. Extend the DRM_IOCTL_AMDXDNA_GET_INFO sensor
> query to expose these metrics to userspace.
>
> Add AMDXDNA_SENSOR_TYPE_COLUMN_UTILIZATION to the sensor type enum
> and update aie2_get_sensors() to return both the total power and up
> to 8 column utilization sensors if the user buffer permits.
>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/accel/amdxdna/aie2_pci.c | 27 ++++++++++++++++++++++++---
>   drivers/accel/amdxdna/aie2_pci.h |  2 ++
>   include/uapi/drm/amdxdna_accel.h |  3 ++-
>   3 files changed, 28 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index a2e586512e26c..1f11822f0bfda 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -787,16 +787,24 @@ static int aie2_get_clock_metadata(struct amdxdna_client *client,
>   static int aie2_get_sensors(struct amdxdna_client *client,
>   			    struct amdxdna_drm_get_info *args)
>   {
> +	struct amdxdna_dev_hdl *ndev = client->xdna->dev_handle;
>   	struct amdxdna_drm_query_sensor sensor = {};
> +	struct amd_pmf_npu_metrics npu_metrics;
> +	u32 sensors_count, util_count, i;
>   	int ret;
>   
> -	if (args->buffer_size < sizeof(sensor))
> +	util_count = min_t(u32, ndev->total_col, 8);
> +	sensors_count = 1 + util_count;
> +
> +	if (args->buffer_size < sensors_count * sizeof(sensor))
>   		return -EINVAL;
>   
> -	ret = AIE2_GET_PMF_NPU_DATA(npu_power, sensor.input);
> +	ret = AIE2_GET_PMF_NPU_METRICS(&npu_metrics);
>   	if (ret)
>   		return ret;
> +
>   	sensor.type = AMDXDNA_SENSOR_TYPE_POWER;
> +	sensor.input = npu_metrics.npu_power;
>   	sensor.unitm = -3;
>   	scnprintf(sensor.label, sizeof(sensor.label), "Total Power");
>   	scnprintf(sensor.units, sizeof(sensor.units), "mW");
> @@ -804,7 +812,20 @@ static int aie2_get_sensors(struct amdxdna_client *client,
>   	if (copy_to_user(u64_to_user_ptr(args->buffer), &sensor, sizeof(sensor)))
>   		return -EFAULT;
>   
> -	args->buffer_size = sizeof(sensor);
> +	for (i = 0; i < util_count; i++) {
> +		memset(&sensor, 0, sizeof(sensor));
> +		sensor.input = npu_metrics.npu_busy[i];
> +		sensor.type = AMDXDNA_SENSOR_TYPE_COLUMN_UTILIZATION;
> +		sensor.unitm = 0;
> +		scnprintf(sensor.label, sizeof(sensor.label), "Column %d Utilization", i);
> +		scnprintf(sensor.units, sizeof(sensor.units), "%%");
> +
> +		if (copy_to_user(u64_to_user_ptr(args->buffer) + (i + 1) * sizeof(sensor),
> +				 &sensor, sizeof(sensor)))
> +			return -EFAULT;
> +	}
> +
> +	args->buffer_size = sensors_count * sizeof(sensor);
>   
>   	return 0;
>   }
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index 1bb88711bedb3..424fd6d852191 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -48,6 +48,7 @@
>   })
>   
>   #if IS_ENABLED(CONFIG_AMD_PMF)
> +#define AIE2_GET_PMF_NPU_METRICS(metrics) amd_pmf_get_npu_data(metrics)
>   #define AIE2_GET_PMF_NPU_DATA(field, val)				\
>   ({									\
>   	struct amd_pmf_npu_metrics _npu_metrics;			\
> @@ -58,6 +59,7 @@
>   	(_ret);								\
>   })
>   #else
> +#define AIE2_GET_PMF_NPU_METRICS(metrics) (-EOPNOTSUPP)
>   #define SENSOR_DEFAULT_npu_power	U32_MAX
>   #define AIE2_GET_PMF_NPU_DATA(field, val)				\
>   ({									\
> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
> index 9c44db2b3dcd4..5bd13f4435f55 100644
> --- a/include/uapi/drm/amdxdna_accel.h
> +++ b/include/uapi/drm/amdxdna_accel.h
> @@ -353,7 +353,8 @@ struct amdxdna_drm_query_clock_metadata {
>   };
>   
>   enum amdxdna_sensor_type {
> -	AMDXDNA_SENSOR_TYPE_POWER
> +	AMDXDNA_SENSOR_TYPE_POWER,
> +	AMDXDNA_SENSOR_TYPE_COLUMN_UTILIZATION
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>   };
>   
>   /**
