Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86999B58617
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 22:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667A710E56E;
	Mon, 15 Sep 2025 20:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yBA96gVz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011060.outbound.protection.outlook.com
 [40.93.194.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB1D10E56E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 20:38:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yuZG8hWjOzHcO6yAfgO+Wthl/5lD34H2lj/hl3hl55ELzOR6PARkd9kh5VQ7NWoSJft4CSabem+0L+zbuB88tRcVT6vYK2AnultBlFNeJT/uOiuRJbxBiijhkq7PJU3+UK2eoRqxleUhogvGUf5BJ99lsj+FBbAICbTUn1D1sC+W9ZBKe9GlyqJqSxNm3wRGQj7XZS+GH8rWmMzK8qlPNdeLyP5uKI1zdSoRgKDewldrNuYQo0hPoCSAMQGu1z/nqCP3sxP34jiVEmftz1esZJFBYQZ5x/ysZq1I+3Gr0K8Ym3i3lZb5vZJzOJ3R1NzyiRYFlSVt0ifoVtig8yLjZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkoGzyyGLEpb9Bgccy6TT0zNXbt7nezqujHAmIHVKfM=;
 b=f2VRQIYsEFHyGRf5pli00bbz6/wKhKlQKE3X7GV9Kvv92Uv0AuV7fjH/ZZ4p1qweDAbz7Nk66WlxWQNl1iAqhYkJ0YJd9j99J2ngRd0H45o3JtmeZA8xOCz36OxKhKmZwdcYwYpJ/8jD5RxzT7rInJLvBXYyFab5hxpBUbebgl4ovo4MjzuCekP1EaBPlE3HySSj7U/iHzSj59zDirhs6xJedfzwqyug2W2IMLfa2gXs5G5sLKd0mR6lz3IKRX8c2Pfs1AHphb1yzUgYrm0OndTrmEtknj8/CnVVmJdwVcFv/xSQ1RfHUMb9ASpmQ1xvFYMDcsijnK2XprGjC1EHxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkoGzyyGLEpb9Bgccy6TT0zNXbt7nezqujHAmIHVKfM=;
 b=yBA96gVzavJF9DiXSGA8IMvlgs1DKZ76iH2HIKvfyL84FszottC4WW7X2pp9XU0DwGUMtEZVOAK5WjUr5AiwNwaVGSEWiM7vMCxVxVRDwcWkkh1b00MCoC7h9LFduzF4gaVGAaYdCVIIUr4emEKIzBztl0jlGaELWinHJ90BuDQ=
Received: from BL1PR13CA0271.namprd13.prod.outlook.com (2603:10b6:208:2bc::6)
 by SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 20:38:48 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:208:2bc:cafe::49) by BL1PR13CA0271.outlook.office365.com
 (2603:10b6:208:2bc::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12 via Frontend Transport; Mon,
 15 Sep 2025 20:38:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 15 Sep 2025 20:38:47 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Sep
 2025 13:38:47 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Sep
 2025 13:38:47 -0700
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 15 Sep 2025 13:38:46 -0700
Message-ID: <4d8257fb-ea52-3d92-d240-7f072bdddd26@amd.com>
Date: Mon, 15 Sep 2025 13:38:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/ivpu: Refactor priority_bands_show for readability
Content-Language: en-US
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <jeff.hugo@oss.qualcomm.com>,
 <maciej.falkowski@linux.intel.com>, Jacek Lawrynowicz
 <jacek.lawrynowicz@linux.intel.com>
References: <20250915103401.830045-1-karol.wachowski@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250915103401.830045-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|SN7PR12MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e31a1e7-5e85-4cf4-6588-08ddf497df33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHFNZGR5ZS9rZ3RjdlB1bFgxR2NLbVNGdS9XbGMvWnh5dy9NeGN4K0ZrV1cw?=
 =?utf-8?B?ZTNMSEFwY3NxUTlidmFpQVJYK0pkOXZ6UnZpaEVVUUhodWxCalNVTHVsMG9p?=
 =?utf-8?B?RG9VQTVPUTQwZTZuZTFRNm9tQ0hqaUVPNlZSK215UEQ1L3JHb3EyK01VUUYx?=
 =?utf-8?B?WGxpMXMzdm9xY21Gd0NIWUJoVmtOMHNWNml2V1YwelU5WGZTcUVzY0FPNUpo?=
 =?utf-8?B?ampLcXdweFl6YTVzR0l0c0hjUXl1M210RndVRmxzak5UMU1oM3MyZnpKSVdt?=
 =?utf-8?B?c1NLdzRxNjZkdDZEMHdBZnFaRzZsM0lBbzBtdGpuL3B1WkwrcnR3SnJGNFdp?=
 =?utf-8?B?dWh5MVV0SVdpSERSdXc2cE1PSENKaFhvZ0lhZ2tpUitQWDJkajdRdjJFUm41?=
 =?utf-8?B?M1laQ2s2bm9UMzJoekFhbjRrR3B4cGdyNk8zSGF1dGVVbFZ6cHo0a1hLdDN2?=
 =?utf-8?B?UnlZNFVsRlVNN25ZM08vT2hPQVVXUzBzOU5sTExTWEp0azFRWTE2aUJSdCt6?=
 =?utf-8?B?QmdlL2V3TUQrczJQZWRVTjdBaFJlQjZXdklyczJLdWViU2lhUWQ0Zkc1bjQ5?=
 =?utf-8?B?bHhWa2ZMWlFpQVhybEVNNElxSk1JaXNEQ1plRUYvKy9XS3NYVDF4ZUVpbU8x?=
 =?utf-8?B?RXNzMlFJSm9qYnlCRGpnbkFPeVlCcU5Ea3d1VTcyakJ2VS9OYVppeUVBdFBG?=
 =?utf-8?B?WmpJMys2VFFLaFR0T01TNnQ4YWFSLy9QMHlJZ3N5MVV2R3ZlTVhNUllRekV0?=
 =?utf-8?B?MzJTSGdTOTFXL1A4TlRjL1lWTUw0RmRYQUpQK2tzS3pLblpsVEJTb1JWWlA5?=
 =?utf-8?B?MGJEbXZQMHVNKzdFSmcrOExqMWhFRnU0Q2tQUXNVMDR4Z1l2VWhPT3lHdDJ4?=
 =?utf-8?B?MjlhVkcya0JMc0EzWDNMc2NBOENsL3VNRm1zSzRqSFAxTG83bUtDT0lwWTd2?=
 =?utf-8?B?UVRTTzhNeEk3OEFRNUVIOE5WelhFOU9JdSs4d3d3NlgybGs5Q3BYblVPd3Q2?=
 =?utf-8?B?TXRPZmVtSlBaM0ZFdUFtSzFuWHh0WFgzMmhRUlpXRDFQejRsaWFlR0s1OVpr?=
 =?utf-8?B?RWZjRjRWN3NMd0IxSUxXWHZpVjRMYXM1NEFHTWcva3RxOTA0OUNUT1VyenRY?=
 =?utf-8?B?RFJhK2N0YmJMMWZhOEtkckRvTjl3UWhqVFFDay9FSFU1RmtqZG5pQlJQZ0tG?=
 =?utf-8?B?d2RsOEZVSXZyVTN5Qkp4LzRQejR5eGhjMXoyeXRtdE5zNlY2QnZ1RktmcDVw?=
 =?utf-8?B?VDZGaFhqQWRpYlhyZEJ0S3pXY3oxZVZQeFBJek5sd1o0cU5xM211U0ZRZ21o?=
 =?utf-8?B?UXM4OTNJTEZjdWgvZlF1ZytTc3cvZWhPYWxyL0dtM3hyNUwydjUzTUpwMXdN?=
 =?utf-8?B?eDIzUVlzelg3VVhnLytmc1JTR1B1QnFHRndNUjZSUlZqNTg0ZHl3bkk1WXBz?=
 =?utf-8?B?MnQ2Zkl5TFhmU3A5SDA5b0M5NWdsRWdRVGlPaXNuc0ZPQ2Z1d3k1T2dUaExt?=
 =?utf-8?B?ZGF0TitjYlNQL3B6K2cvand5VnpacUcvYWh6THEwa1RqUkQrK0hlcWxQcCs1?=
 =?utf-8?B?U3JDWUVGTlN3dk5ZYmZoeno5UDljN1VGK0IwSExYaDd2ejZpOEpxZngreWFu?=
 =?utf-8?B?blFCcmtLR3UrNWV2MTJZcmMwT1dCV01penlnZnduZkV5V0Q5QjYrdURvQWJV?=
 =?utf-8?B?RkpsYVU0VEw0aE1iVUxMTWdLN1hPck9rQWVYSVNsYWpHaFVmQVJJTU9pNUFL?=
 =?utf-8?B?djVXK29FN2pMRmFhdVNqbTJuSTZ2UWdFY0RLcE1DZ09Sc0V3aytDNWNQVWw4?=
 =?utf-8?B?WURPbm5tcHpWZWFsbVdSV1dzSG1GaUJ4K1RWaDlkekQ0ZEhSUThDcWJCMmIw?=
 =?utf-8?B?cHhGZ0Uzb0pKSkxJRnVuV01lM2lBYndWY2Z4SXN6SXNCWUhTL2lzNDRyMDJr?=
 =?utf-8?B?bmUvdmNqak5tNmcwblJQZlltU3lZMlRjVDNkdnNvVThldG9NaWQ1R3J3UG9I?=
 =?utf-8?B?dkk2dUNuQUhCZUNUZERUWlBmcDh3cnZ5Y2hLcU1iRmRWUjZKMXlKTWRuckhM?=
 =?utf-8?Q?aj9mfq?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 20:38:47.7985 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e31a1e7-5e85-4cf4-6588-08ddf497df33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6839
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

Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>

On 9/15/25 03:34, Karol Wachowski wrote:
> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>
> Reduce code duplication and improve the overall readability of the debugfs
> output for job scheduling priority bands.
>
> Additionally fix clang-tidy warning about missing default case in the
> switch statement.
>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_debugfs.c | 38 ++++++++++++-------------------
>   1 file changed, 14 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
> index cd24ccd20ba6..3bd85ee6c26b 100644
> --- a/drivers/accel/ivpu/ivpu_debugfs.c
> +++ b/drivers/accel/ivpu/ivpu_debugfs.c
> @@ -398,35 +398,25 @@ static int dct_active_set(void *data, u64 active_percent)
>   
>   DEFINE_DEBUGFS_ATTRIBUTE(ivpu_dct_fops, dct_active_get, dct_active_set, "%llu\n");
>   
> +static void print_priority_band(struct seq_file *s, struct ivpu_hw_info *hw,
> +				int band, const char *name)
> +{
> +	seq_printf(s, "%-9s: grace_period %9u process_grace_period %9u process_quantum %9u\n",
> +		   name,
> +		   hw->hws.grace_period[band],
> +		   hw->hws.process_grace_period[band],
> +		   hw->hws.process_quantum[band]);
> +}
> +
>   static int priority_bands_show(struct seq_file *s, void *v)
>   {
>   	struct ivpu_device *vdev = s->private;
>   	struct ivpu_hw_info *hw = vdev->hw;
>   
> -	for (int band = VPU_JOB_SCHEDULING_PRIORITY_BAND_IDLE;
> -	     band < VPU_JOB_SCHEDULING_PRIORITY_BAND_COUNT; band++) {
> -		switch (band) {
> -		case VPU_JOB_SCHEDULING_PRIORITY_BAND_IDLE:
> -			seq_puts(s, "Idle:     ");
> -			break;
> -
> -		case VPU_JOB_SCHEDULING_PRIORITY_BAND_NORMAL:
> -			seq_puts(s, "Normal:   ");
> -			break;
> -
> -		case VPU_JOB_SCHEDULING_PRIORITY_BAND_FOCUS:
> -			seq_puts(s, "Focus:    ");
> -			break;
> -
> -		case VPU_JOB_SCHEDULING_PRIORITY_BAND_REALTIME:
> -			seq_puts(s, "Realtime: ");
> -			break;
> -		}
> -
> -		seq_printf(s, "grace_period %9u process_grace_period %9u process_quantum %9u\n",
> -			   hw->hws.grace_period[band], hw->hws.process_grace_period[band],
> -			   hw->hws.process_quantum[band]);
> -	}
> +	print_priority_band(s, hw, VPU_JOB_SCHEDULING_PRIORITY_BAND_IDLE, "Idle");
> +	print_priority_band(s, hw, VPU_JOB_SCHEDULING_PRIORITY_BAND_NORMAL, "Normal");
> +	print_priority_band(s, hw, VPU_JOB_SCHEDULING_PRIORITY_BAND_FOCUS, "Focus");
> +	print_priority_band(s, hw, VPU_JOB_SCHEDULING_PRIORITY_BAND_REALTIME, "Realtime");
>   
>   	return 0;
>   }
