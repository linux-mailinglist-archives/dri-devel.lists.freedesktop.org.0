Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897B3A73A9C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 18:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76A110E08C;
	Thu, 27 Mar 2025 17:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="v8i7uPL/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6773410E08C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 17:34:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uextY627Dlf3YqjiV2aeJarse5OyCNV2Lpp0bpjXfMtEc15VWsCYKzV/+7RMPXJt6uYyv+RPJenZOt76NZpBUfVfdDpnmNHxPnlVimVwSkyIsjCPQJwK2WLD5u1gY/uP5O6EpaBtOGRuJebce1M2D0Qw0uxiuKmLcsyDQKNFnljjohnjz20OH+f/8MfwGkx2VaW5UcYF0xrYfuBKj8t4lJUbN3SIdfJxtKqZEY2T0Ja9/I82CZLnxdOJaqp8k14JuQZoVuOfnGWNcUy0UORD6qOPEiTVYBARweZQz5Ru83W7dhrxcJGDWFvdMImHHQz2Qmj9/KiCLVP+qgDU5qDQTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ANKWYFo3shgoiYksf1dxkXyV0xhsBqVe5rJ6HxnotHw=;
 b=waXz6m0Dsx+oS+2Bx7+Qz9PspJfPuDjNU094xjdS+DELYNsFgfThTcccTwbglAX/lrH1SZ6Dpo/S//uo5BMsF/CeA3jkStKro1SOMM3IqFjB3BknB0mJmV6kSo3U1VPZAkK7Qsr7L0+ihoaKAlAEFSS41mPZUix6r7pn1fXE6KYiGHy9xS2Ifi5fpxvek1T+4zxuf1YDic7shC0pE2osz2gteXGmT9A17QXnWpczyrSkgRNTTKfii7g1VU26H+jIIW4QzOrdMOzSJcgatmeXX7YTQ85IurPMCNqPM+S0Hd0bIWZ+ti+Gc5BmRkAVGu1HyFx4rRSTcXHIfSSQfsCSpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANKWYFo3shgoiYksf1dxkXyV0xhsBqVe5rJ6HxnotHw=;
 b=v8i7uPL/3vuJ0N2uZLg7xOhsk5znEQXcf7+Z9sW7Q/MDVpvzEo/B5XYF8GoSy3SEKr87z8whDH3aWVOnGkVwQObVqNQXUTeWdy5x4iKnwlW4OXdYclL0WhGRLwd7ZIhmgYdosvF5I+1TkmvxnEPqn7v7DpQGX8dOdgHYsIYZmb4=
Received: from SA0PR11CA0010.namprd11.prod.outlook.com (2603:10b6:806:d3::15)
 by SA0PR12MB4445.namprd12.prod.outlook.com (2603:10b6:806:95::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 17:34:45 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:806:d3:cafe::9d) by SA0PR11CA0010.outlook.office365.com
 (2603:10b6:806:d3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.44 via Frontend Transport; Thu,
 27 Mar 2025 17:34:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 27 Mar 2025 17:34:44 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 12:34:44 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 12:34:44 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 27 Mar 2025 12:34:43 -0500
Message-ID: <8d7f0b85-2fce-c679-1b45-d6c36016b649@amd.com>
Date: Thu, 27 Mar 2025 10:34:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/ivpu: Fix warning in
 ivpu_ipc_send_receive_internal()
Content-Language: en-US
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <stable@vger.kernel.org>
References: <20250325114219.3739951-1-maciej.falkowski@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250325114219.3739951-1-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|SA0PR12MB4445:EE_
X-MS-Office365-Filtering-Correlation-Id: 51afb323-92cc-465f-5d73-08dd6d55a9fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXI5bEJzNXJueWRBN3cyYkd1ZU8yK0ZLTFpjeGlEK2x5UTVVSWJTdjB3SGI5?=
 =?utf-8?B?eG5lUFhuU2dhRUkrd0RtSVFCdTNKKzRzanlWbmd0d0xiQnphYmtGWTNWdzZQ?=
 =?utf-8?B?LytFRnprRWxLQ0kyaDVDS1lTQmI0WTJtTENiZEkvNEMwRThoWTNvSFp6TEQx?=
 =?utf-8?B?R2ZpSmI1YzhuM0NqaHR1SzlpeEVDc1BtUDJNenMweEtOQlB2RkxtTEVHcGVE?=
 =?utf-8?B?aWdCVTZsQThYQ0h5ZHRuaGUvT2NzUFY0aW52QXcrRzRwOHdXOHE1MklYVmQw?=
 =?utf-8?B?MzZZMFU2bERQbjMxVmZNRXpZQjl0eWhiM1BsT1pRV2hRMFhxWG5kdUlTWTFz?=
 =?utf-8?B?NlBiRTA3YmJNdUt3Q2lJZGRzSVRmczJwUUF6VUtodXJYL3Bzc205TDJrNEhv?=
 =?utf-8?B?c2poNjZYR2phQTljZXkvV0VpMWUrUjVta3NaT0xEVG93Y2ZVOG91UU5COE9M?=
 =?utf-8?B?ejVGRmhyVERiY3ZRTWFFZXhaYk1SbFE5MVh6emlSNmU2L3hhVGZ3RTZNakx1?=
 =?utf-8?B?dDhyejJHbVI5ZlNteWRjSGM3RngwQjNoMDhKbUtSV3dQdVVFUTFodSt6b1hi?=
 =?utf-8?B?a2ljQVRhN1hpQlpkNHBYbzhBOVdKbmd0Qk9JMEFQbkFEZklwTmU3cUxkQ0pa?=
 =?utf-8?B?SklZd0lmL3NuTHBRbU9tVTVRRXZjWjIxWTQ1Zi9rU0Y1by9WWFY0VElvYWJk?=
 =?utf-8?B?anZpUi9pMTJYakN5RG5sejFzdlpBaXNEYjdLZkZJL2tmN1FoczVmN3c2RWNw?=
 =?utf-8?B?S1l5M3VUMFI2NTVDZXN4UnlGTnVONDI0Ui9KRkVPcUZub1hGS3pjU2xreE9o?=
 =?utf-8?B?S29ObWJWQ3ZFUStoU1o5ekp1ZER2aFE5bittMUFjeDBGRjM3bVJwVldoSmYz?=
 =?utf-8?B?b0R3YWYySno1aTVmcDQ1RnF6TXBMWVRaelgxeGtMVXJ6ZDg3TkRjZnVqK2Nt?=
 =?utf-8?B?ZEZIRHVRWDFzS2ExbnZScUNzZ3VsOHkzMG9kU3AzaGx0TEg3OExsWXBKNjAw?=
 =?utf-8?B?WG1qWisrc0VpNmYvYjh2UXpvZ0U2RTJpMWZzVUxLSm5Ld3BvMDNUR09DQ1di?=
 =?utf-8?B?OUVKS2FVOEVRZXhsWE9pMGVKRE03NEF2bllTaDZlYllITjcrby93VXhBeHFD?=
 =?utf-8?B?Wm4wRFN0aGpDY2hpMVRlb2d6SjBMVnozSVBvak1TbXNXS2Yyd3hLTEhWS3Vh?=
 =?utf-8?B?aVpaTW1DK015d1RSVElxY2E0a2xPNFB1RmZKV1lPVVFrYkw5aDV1ZDRDRlRi?=
 =?utf-8?B?QWphWmttT3V5RGNFaW9mM3ZDeTl5TXh4RXlSbjIzQ1dGb3AwbGFLVzNpcm1Z?=
 =?utf-8?B?TjVvcTlDZks4TkVzbHd1YXRlQ3ZldnBYcHFSdjRHYnNVSktBaTYzS0puUGw4?=
 =?utf-8?B?YVdNOTdDQzZIZytuMG5yUWx4TkFnSnV1RHd3cHFUYXNsUWVFaG8zMFpGSGFl?=
 =?utf-8?B?OVU5dVF1ZkNVZWtoanMzZmh4bEF1SEhKVXZQMDhFQ3YwSFR1TlR5dGJaZUFU?=
 =?utf-8?B?UDllc1h0ZmpCQ0lSSkZERGh1anVrUHluYVk3N2IzSjdBUytQdzFWbTVtb3ow?=
 =?utf-8?B?T2pFK3BCTEVxaUZtY2lJTlBZMTRZcld1d1p1S0pBUlJkalZjQkhVVEJIV2Nm?=
 =?utf-8?B?WUY2TVJ2enpUYlBtVnF3TXF1Q2hFU3FUdTJtczNpa3pWNmYvOTc4bk85TXNq?=
 =?utf-8?B?R1o5YmNrT1EzMjJEekw0Vzl2L1BhZnE3dm1LeFE5dHdvZFk3YXN4RVI3T0RO?=
 =?utf-8?B?MnFPbFFFMThGSjhubUVDMWIwcUltaWRIOXMydTc2R0p2SW8wanhzdUhYMVll?=
 =?utf-8?B?c2oreHZHeVhTSFNOVUY4ODIvQ1hPQUx6dUQyOC9wNU1rczBERXlqRnNyWmZs?=
 =?utf-8?B?eThVZ0dLNUpQbFcyL05VbUl1Q1c4c2VPQmk4SlhWTXpVclJVcXVpSEtDL0VN?=
 =?utf-8?B?Y0twRW5Xa2RuaTRnQUI2TXRSQ0dFUkhCWk53QXBPQ1lTTE1TRWFPRkFYSWZ0?=
 =?utf-8?B?b2JMa1J1ZHVoL3g0bEU3dE5jTHdaa3lQYkkyMGFZamprcGN5U2wxMW5xRVBB?=
 =?utf-8?Q?xy1xkZ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 17:34:44.7455 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51afb323-92cc-465f-5d73-08dd6d55a9fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4445
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

On 3/25/25 04:42, Maciej Falkowski wrote:
> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>
> Warn if device is suspended only when runtime PM is enabled.
> Runtime PM is disabled during reset/recovery and it is not an error
> to use ivpu_ipc_send_receive_internal() in such cases.
>
> Fixes: 5eaa49741119 ("accel/ivpu: Prevent recovery invocation during probe and resume")
> Cc: <stable@vger.kernel.org> # v6.13+
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_ipc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
> index 0e096fd9b95d..39f83225c181 100644
> --- a/drivers/accel/ivpu/ivpu_ipc.c
> +++ b/drivers/accel/ivpu/ivpu_ipc.c
> @@ -302,7 +302,8 @@ ivpu_ipc_send_receive_internal(struct ivpu_device *vdev, struct vpu_jsm_msg *req
>   	struct ivpu_ipc_consumer cons;
>   	int ret;
>   
> -	drm_WARN_ON(&vdev->drm, pm_runtime_status_suspended(vdev->drm.dev));
> +	drm_WARN_ON(&vdev->drm, pm_runtime_status_suspended(vdev->drm.dev) &&
> +		    pm_runtime_enabled(vdev->drm.dev));
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>   
>   	ivpu_ipc_consumer_add(vdev, &cons, channel, NULL);
>   
