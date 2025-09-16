Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A69B59BF3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 17:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD78610E116;
	Tue, 16 Sep 2025 15:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="c1solSwc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013025.outbound.protection.outlook.com
 [40.107.201.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34DC10E116
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 15:22:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/dOogaaSYHfyRcea4ZKeQnc7ImCw1HG68DTJo1sI2P+rQUMtB+XlhzhnyQGr3INam7uhtHNH1voqZmjgYi9gNhcBtduM6D2yzZfg9PuoLEkG+sWC8wtE9RTg3TlHKisW0UGjxVwA9mvIFmjOFKM6W8xS1WVzx5vsCx9pg2ycHcMfMRY7+4YPHe2IzL1yKQjpAxuD+V0Lg9zofc2SqJ5h5cASZIBF5VsuTdc/CceMQ/UYWEVoKxfEYV9w6fj1vh29XFU2dTPamaOWilnbcgCtvsknCfBDXAedPPFE7pqu9uMvC11+RU9I/aXokgWiZ5K79slgTQhyyko3/R5rf1N/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wO6cgMnR4J3x278iSejRTZIEsSZoDyMlj1fQP26A0JY=;
 b=LHCl9pNb5WiRihtwj40phFSS1SbrCGDU/wfZT0hoDA9cjNBdlWhNUKjtTaJBRsDY87MC8/F1SDLkpEOPBJAFiSl0+9ZcNCG7muy9SRiWNcPRxLLdGVBQ7k/gRmBI+6yacK4la0Kw+8JrdV54xRYoyfyDwKqa5jAvpafxMDj6NhPf5GMGgj406Nwj+aeDNQZ/6Ju6fldZGnAz7BO3pyIpY2h0peaUcgaqse6ZT6T69cOKjGOQ4xxzFSgk0v/3LUicxCqv8EkaZWt1JmwBRHfb51Cpp9Rct9zrH3bfk1s2+RqmlHypMn/R8PEebevqqH2S1UAmCHdLvRF4CoIpDlpgVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wO6cgMnR4J3x278iSejRTZIEsSZoDyMlj1fQP26A0JY=;
 b=c1solSwctSYZzJC2JBS5reMJuk8d+QGiF+DNVChUYTz3FF6dbqefUCp5r+xQuKjPU2UWG4/AeiSyq6ab4ASP9WAnyujJVW6Dn5X1ux1NMGb3lDVIcy+NaJbmgIGqAr+t+8/bBIJaPUCRfQWsQBxlT/zJhAC3Nml0AZ6ialjCvaU=
Received: from MN2PR03CA0012.namprd03.prod.outlook.com (2603:10b6:208:23a::17)
 by IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 15:22:14 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:208:23a:cafe::eb) by MN2PR03CA0012.outlook.office365.com
 (2603:10b6:208:23a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.22 via Frontend Transport; Tue,
 16 Sep 2025 15:22:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 16 Sep 2025 15:22:13 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 16 Sep
 2025 08:22:13 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 16 Sep
 2025 10:22:12 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 16 Sep 2025 08:22:12 -0700
Message-ID: <fc2bacc5-4cc8-bfc0-dc26-449da5a28c6e@amd.com>
Date: Tue, 16 Sep 2025 08:22:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1] accel/ivpu: Ensure rpm_runtime_put in case of engine
 reset/resume fail
Content-Language: en-US
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <jeff.hugo@oss.qualcomm.com>,
 <maciej.falkowski@linux.intel.com>
References: <20250916084809.850073-1-karol.wachowski@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250916084809.850073-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|IA1PR12MB6460:EE_
X-MS-Office365-Filtering-Correlation-Id: dd44a231-36f3-4bba-e76b-08ddf534d051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjZ6aERURGNFN0VmZDhaQXRaZTMveEpvNlRHUERPd3VTNFBEVGNLa0FJdjIx?=
 =?utf-8?B?Ty80Y0l0VXd0a3ZIYUhTYXZhaFY2UTIzdDNLT2JwbEd1N2NnMmFJa29DREZt?=
 =?utf-8?B?YTdjUi9kTUJTcEUrdmN1OVZTMkxsc2UwVWdSd0h4dTRqOXN4Q2lERVVGcTI2?=
 =?utf-8?B?b0hPT04yYlpFQnpaUlRkL3hOK2t2MzdTTGsyTElDTW9CMjhZc2Z2cTlRQzdB?=
 =?utf-8?B?ZHBCRUhIQmVZTkdCSFNoVjZMdGJzVWZ0dFhLYnR1RXo2bzNkM2M2L0d0ejhm?=
 =?utf-8?B?enRFMVc3QVpHTWVvUHBFQTltanhSc0E3ZmxLSHJUNTJqQ0VYNVlEZVdESUwv?=
 =?utf-8?B?d3lUVmZlS1BpUVU1YkJxaE1UbmhKVjRYWkpCVTQyYjNXUmx5RGwxU2V5dC9K?=
 =?utf-8?B?Y1JyZnpBRE1tZTZzbnlBd0tZWTJyY0ZmTlVPeTYyNGUwVTU2QithR2U4NlBB?=
 =?utf-8?B?ZDlaUUZSaFFkR3hlT0pKSnh5TGtmTWdHRVE2U0tiR3pKNUl2UHVpRWlvb0F4?=
 =?utf-8?B?UG1nL002TjZEWFJqZEFkT2xYbFZYbG1HV29VNlhqM0UrY250SzJyVGhzMnRR?=
 =?utf-8?B?Z1hVbFQzdWZtakNZVGRaeFZrVFp6bU8xbG11Uy8rUXBEczlYdjhDSktYNlcv?=
 =?utf-8?B?N2dndU1nTGl1dHc4R2NUS0g5QXJKalhNaG9zY0JGM2xYUE5qb1UxTkVHNU9B?=
 =?utf-8?B?OCsxazBpUlkwb2s3NTNFVEh1czhya01BSmVLWWYwNUJEUXArYTNnNG00cDFY?=
 =?utf-8?B?TFhmUGM1dW1Lem1QUS9TZDZWMWF1VXR5RUZaVlNXWmZuZDZNdnY0aVRyS0xx?=
 =?utf-8?B?bmdYWTdqUzdBSFI4Ym9XMVVGRXl6Qi91YUJ2RFg2ekpCc0psbUlpTllyZUF5?=
 =?utf-8?B?R1hzbllMNUVXQ3FYYXdEWjF4YTk2RFJBRkpoY29hK1hFYUtzeFd4RW1pemZB?=
 =?utf-8?B?ZmlOTWdaM3I4dDZMSzhrNk1ENTNmNFJyL25mOGxFblpQVDlWUWlLZ2dZU3pB?=
 =?utf-8?B?bzlOYW5YVmdoVzBVYzFVZVRHRG1lQkZBSXgvdU02QzkyemdRQmg2NFcwOGNI?=
 =?utf-8?B?Z3l4RFhIa3NyYU5OZy9LVEJZcktIRGNOZmZWcGNrUjB0WHRucXhic3QxcWhm?=
 =?utf-8?B?WG5YejFwb3BUQ0F1K2d5UjdKa3AvZjNHT0hmMy9GQW16L1pNQzJGVGlWaktO?=
 =?utf-8?B?TlBQQWtHZ2xjUHNXTWhtZWlJNHlKSGxlc1JGZmx2bnMycWpKTWdmRE9aSmk3?=
 =?utf-8?B?NlNGRXNTdHN1T3kvL0VVSm5FOVR6aXkxaWh2UkxrSjhFWkV5OG0rbkJOeFpP?=
 =?utf-8?B?Tll1WXpiWWpuRTVVdExkUXlyclJpcm1rb3Z2OFpLKzQrckl5T1Fub3J4eWZn?=
 =?utf-8?B?WDExM0pucXM2OFl2OERpOVdUUmlFMklJMGNnSHlpVERwaEtLV3pMaFEzL05h?=
 =?utf-8?B?dTZscHR4V0dPZXluZk03Witrc004dnZvTGdJT1ZJRnJMVlQ5NWprRS9GalhR?=
 =?utf-8?B?NDhhL29aZFBQUjU0eDJPTzJEdGxzK1pxSWFUNjhyRlp1aVErZ2sxamJoOW96?=
 =?utf-8?B?bHJCS0JWcHdyNEMyRUFUZzBhRFhoeW5SODBBNGpFL2hWbFJaTVo1dWp6bVNs?=
 =?utf-8?B?RnVyUUF1WDBjY2RoRFRkQ3ZpblhCL21mVWFia2toNWNJbFlESE5hcWgwckYr?=
 =?utf-8?B?RVgxRy9nQjFsMUtjajl4WTd2c3llczV3ZWVsOVpIUXRKSk53bGZBa0FweXBO?=
 =?utf-8?B?S3grYmQvYUR1UUxkazRlajUzTFdWOC82Z25yZytaTnE2UWFXcThPc0Q2VVlh?=
 =?utf-8?B?dDdaUzZLOG5XSW5UVTlHVUFlbWxoTFVjT2NNcjNsTWNQNlhFTGN1SG9kTWlJ?=
 =?utf-8?B?aWNlalR5ZUdUQWZsdHIvNjV3L0dUYmZNU1QxRkJYNHovZXpmNHB1NmNZNUJj?=
 =?utf-8?B?K0xKdEFwMUJoaFNqOG9iVUJQUTVhbUMzYmY2UmU3UjNsVHJZWnlBVVJGdFNr?=
 =?utf-8?B?U05DbjFOU3RIM1dHWmI0cmRFczNaUnpRK3lOR1p3ZkttS0FYY0FabkNTVERo?=
 =?utf-8?Q?gNpuBr?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 15:22:13.8169 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd44a231-36f3-4bba-e76b-08ddf534d051
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6460
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

On 9/16/25 01:48, Karol Wachowski wrote:
> Previously, aborting work could return early after engine reset or resume
> failure, skipping the necessary runtime_put cleanup leaving the device
> with incorrect reference count breaking runtime power management state.
>
> Replace early returns with goto statements to ensure runtime_put is always
> executed.
>
> Fixes: a47e36dc5d90 ("accel/ivpu: Trigger device recovery on engine reset/resume failure")
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> ---
> v0 -> v1:
> Added 'Fixes:' tag.
> ---
>   drivers/accel/ivpu/ivpu_job.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index 521b7ac6e35e..044268d0fc87 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -1050,7 +1050,7 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
>   
>   	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW)
>   		if (ivpu_jsm_reset_engine(vdev, 0))
> -			return;
> +			goto runtime_put;
>   
>   	mutex_lock(&vdev->context_list_lock);
>   	xa_for_each(&vdev->context_xa, ctx_id, file_priv) {
> @@ -1074,7 +1074,7 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
>   		goto runtime_put;
>   
>   	if (ivpu_jsm_hws_resume_engine(vdev, 0))
> -		return;
> +		goto runtime_put;
>   	/*
>   	 * In hardware scheduling mode NPU already has stopped processing jobs
>   	 * and won't send us any further notifications, thus we have to free job related resources
