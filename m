Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77637B1ED84
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 18:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AFF10E1F5;
	Fri,  8 Aug 2025 16:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p65bAeWw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2042.outbound.protection.outlook.com [40.107.100.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691DC10E1F5
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 16:58:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvChaytiWy0papHpVMtv9K31+0Yez8XI6meDmvqdyOfvQX1+6na3/kVSZCahfn937yUfryeAUGljPmAZs8oLY8AqgUU0ALZ7NVvj5WuKfFYT83HY3kAPpxHVJCC3Cq0ZWjTqRodyWFMEHE0gszZ0MvHo3UdpEhH2JW0fBQVUI+9cZ14sGA0/KhojYI+Xht63EKM8HEk/yzis3fSJPxiynQM++P6Md2gDbyD6yqQRippOX83pMnHeu/WOW7fSgij1fYHIufJfMVcMWbRjTnDj+tSueASAg65MxJbJtuvKtHlZthU+wjMQBfiGqt77ZC/aX7rHMwtFcy7FKnWVsrB2FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFiMCWa5tBlv1G0upOfLwRWhe3N4kYLcGPXO8jbEnrs=;
 b=HC3Z5B0dlguo3uLTj71YAjPO3iqEVrEond/qiBrY77KYH/9mBKCd9gJ9K46LPwMNASJoHV3WPBpXQt3UyEbTXbyuRpL6mruz1fth95gXh/ukSk7ek74FHGgAfawwsuXVWk4B9n1R8F+l1fwIfJNHMD7VgzKGrHe8CXOtMydvfPLhxyWK/ugzgC25cNa+jPplftSvQgOTzxhYbtp942NJVr8L40Eqf4wW+FfovDKyBvBuxmsDg7qj+EOZixBtzH3YTrq7n29n7exh9mb3DT4sanRRYrpzHfoAhgjY9chXWHNC7z2mTviYu6y2uV3XxI23SPpFucj2LMr+TrSz++zsXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFiMCWa5tBlv1G0upOfLwRWhe3N4kYLcGPXO8jbEnrs=;
 b=p65bAeWwsO4nFdnb9xHi3c6FWaGrh+yZLODuCxLxV/EQMx1KwM8xdFnL2BjJUgiOGqieuZXYrX9qNdYTSbY8hGU7uzFJcMRXngxhaJSXVSSI6irtKixZJ3/gOhZVMQEgkAcQqYSvRFzQd+0ZSDBtbcO28Y8bruCLRDfymjAPZKE=
Received: from DS7PR03CA0081.namprd03.prod.outlook.com (2603:10b6:5:3bb::26)
 by SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.17; Fri, 8 Aug
 2025 16:58:52 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::ff) by DS7PR03CA0081.outlook.office365.com
 (2603:10b6:5:3bb::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.16 via Frontend Transport; Fri,
 8 Aug 2025 16:58:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Fri, 8 Aug 2025 16:58:51 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Aug
 2025 11:58:51 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 8 Aug 2025 11:58:50 -0500
Message-ID: <9fc13293-8c3f-a49c-088e-bc341b60f113@amd.com>
Date: Fri, 8 Aug 2025 09:58:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/ivpu: Remove unused PLL_CONFIG_DEFAULT
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <jeff.hugo@oss.qualcomm.com>
References: <20250808111044.328800-1-jacek.lawrynowicz@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250808111044.328800-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|SA1PR12MB7272:EE_
X-MS-Office365-Filtering-Correlation-Id: f7b3b417-8c29-4152-93dd-08ddd69cda0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnFycTVVRkVzelhDVEY3UTlUbFVNOUpWdXJOelh4SThIQTA5K2NzU1haVExm?=
 =?utf-8?B?QklRSzViamlKTXdITUpqNEFxY0RnZUpCQUZkYXhhaE5WdXZZREZTZCswTU9p?=
 =?utf-8?B?SVZPTVpxdHFjaS9UY1ZHejlwWmJFbTBPZzZuS1pkRWhtdW5oZUJQRGJLWU1a?=
 =?utf-8?B?K29EV0xldlZwR21kSDFuVHpmamk5RDhXN2djbXdtVVFHZGxEdnQzUy8xZjVm?=
 =?utf-8?B?VTRvc1dMbUJGekJnbHA4TnhoOXh4WjdIcG9xVFQvc2tBVmZWdGtRWWxXY3hs?=
 =?utf-8?B?eVh2SkpMYm5YYkVIbDlZMkI5dFgvRG4va3NJNWpTL21Zcm1wTDVud1hhbHZx?=
 =?utf-8?B?aDNQQ0dRZXd6NFM3dHBCRk9MaUl2NERGcHgzdFU3b0lzbSs1ZVRTOWwwT3lM?=
 =?utf-8?B?SlZZOFZZN05yRFVwL2d2bGdwRE1kMjlQYUJGem4yNXRrWWpiK1o0WmNYMk5l?=
 =?utf-8?B?RUVzUUlCZSt1YnNBYjJESjRwWWxsczdpUkxwMTQ1N3dVZy9vUVpDOTM5K29u?=
 =?utf-8?B?emNrMWM0cXU4RWJOTnRjUWFpMWpWbDFQcGszWW9wTTJUNFBUcVFWVjNXNy9p?=
 =?utf-8?B?TWQvU0xJT3lnTG1jRjhSRXArRWJvV0Z6R3FpRDdWcldmemQyZXZYQ3hmMlhT?=
 =?utf-8?B?Mmo3SktoV1VlNTJuMVl3b21PS2psK3JZQUZmYTNoZUdqOW5qaDcwN0dRTStz?=
 =?utf-8?B?QUxieXN6WFRBQXplRk5vVXRuU3llOWJLYXBoT0Y3QSsyZGx0bk1MQ0o5aFpK?=
 =?utf-8?B?NGV4bkY3SHROMzFkUlduWkIzWndsVHM3cm9WZmVWdEFENzRPbEJ3cGJjTm9G?=
 =?utf-8?B?UnpJVkF2YTQxamFCUEFGV2dPQnNPbG55RWliaEd4WjRZWDMwSjVxQWI0czAv?=
 =?utf-8?B?SXRaMXZ4N21ZTDI2M1VaVUdMQ1NWMFRPUTF3Z0VJY0tGeGcwMHdVaGlocElE?=
 =?utf-8?B?ZzlyQkl1bUN3U2hNMUNETGh6VWNoek1NQnA4cWpmVWEyQjBEQk5ybEt3OHdL?=
 =?utf-8?B?WHNBRWI5SXZ2cElrb2pHUWl3cjBCNjQ5cGh4aFdVY080bGdTMXJrclNwZ3lW?=
 =?utf-8?B?Y3dqUXdES29tejlmZWV5WWpWZ3lnQmpaaFRWTVdqSmZZeW1qOXJzbFBtTER4?=
 =?utf-8?B?SUxKcTI2UlpHdlV6WUZ3UDFXN0tMSndSZGJMQThmWjFURGpqRjY4RFJFc0xj?=
 =?utf-8?B?T3prY3Jnb1FOdlZzazdacUVNajFDdE8vTzRySVFNMGZvQS8vTVZkZlZoaUx5?=
 =?utf-8?B?dFpOUk0wV21nNnFRTlVWUW9FOThUSUU4YnFQSU1VNVNkTHRTNGprU1hBM3FB?=
 =?utf-8?B?R3llOGQvSWVJOU56TFhzaFU3NHo4MkdUS3p4RE1adGtrV2JwbDRmTEN6SVVl?=
 =?utf-8?B?VlllZGppd1A5M0RGRTQ4Ym5ody9xS3ZTN2pWclhGMTFUazVMaGdUS2pWLzhS?=
 =?utf-8?B?cWswa0Zkd3pIbU1KNEYvZ1I3aVErVExmeHp1S0lJakZZTUJ2S3JvUnlvOUpO?=
 =?utf-8?B?VjZZMGhuUWdocklZV2RIUkNlRVFRQ092SHF5SVNLcUV3M2ZjMlk3QWJYb1gw?=
 =?utf-8?B?RElrbC9NNXRTRVk5TVBkSFNKOHpPanhpZW5uR2xMOStuUmd3ZkNsMXQyK0dz?=
 =?utf-8?B?ZW9Ic05OQmhXbk5IaUFOTEZVUTMvR1BuZDZ1N3U3QUdJUXFEZGlMWUt4Ujl3?=
 =?utf-8?B?NTFWUXlaTHhYRVFYS0owcmZDRzUrYk9PTzVjVjhibldza1Y4b01qK29jNUIr?=
 =?utf-8?B?cTN4YWhBdUZtZEdHQjV3dHY0UmVEVmlUL0JLZFVXSktPTytRQjFNY0tPMGRG?=
 =?utf-8?B?NEtiWnVwWWI1SzIvNmRHMklUZXlpU0QrRjRsQ29aWkI3TjZwK1dkazM1VGRC?=
 =?utf-8?B?UDI1S0hDT01yR0oyeCtmVkpxeXZrMnRyMjZwdEN0SEpVbzh3Z1ljLzBaSFFa?=
 =?utf-8?B?MStuekhOTy9wbTVmek5HUkdNWnBkRzFWNjlUOUZKV3M2QTZ2WFBQd1JoV3lI?=
 =?utf-8?B?RlJ2Y1QvQm1GQjllNnc1SUhNeWZwK3Nwb0JsYTdkMnRSNmdxYXhaTjR5NG0z?=
 =?utf-8?Q?VNP6ir?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 16:58:51.7163 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b3b417-8c29-4152-93dd-08ddd69cda0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7272
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


On 8/8/25 04:10, Jacek Lawrynowicz wrote:
> This change removes the unnecessary condition, makes the code clearer,
> and silences clang-tidy warning.
>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_hw_btrs.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.c b/drivers/accel/ivpu/ivpu_hw_btrs.c
> index b236c7234daab..afdb3b2aa72a7 100644
> --- a/drivers/accel/ivpu/ivpu_hw_btrs.c
> +++ b/drivers/accel/ivpu/ivpu_hw_btrs.c
> @@ -33,7 +33,6 @@
>   
>   #define PLL_CDYN_DEFAULT               0x80
>   #define PLL_EPP_DEFAULT                0x80
> -#define PLL_CONFIG_DEFAULT             0x0
>   #define PLL_REF_CLK_FREQ               50000000ull
>   #define PLL_RATIO_TO_FREQ(x)           ((x) * PLL_REF_CLK_FREQ)
>   
> @@ -303,7 +302,7 @@ static void prepare_wp_request(struct ivpu_device *vdev, struct wp_request *wp,
>   		wp->epp = 0;
>   	} else {
>   		wp->target = hw->pll.pn_ratio;
> -		wp->cfg = enable ? PLL_CONFIG_DEFAULT : 0;
> +		wp->cfg = 0;
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>   		wp->cdyn = enable ? PLL_CDYN_DEFAULT : 0;
>   		wp->epp = enable ? PLL_EPP_DEFAULT : 0;
>   	}
