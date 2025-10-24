Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9E7C07FD3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 22:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A8810E159;
	Fri, 24 Oct 2025 20:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZxTRmEl9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010009.outbound.protection.outlook.com
 [52.101.193.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803C310E159
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 20:09:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+chxJXKBt9mOKdCC7tosJtTbs1dWmCHzPWZB+jDO5l7rFxiIRmFaS4iTCNfMiKBDLIYEa6c3b2uDtvlEyfsMIkXBmY8GFOLIz+cg3HJ53N9wzHPuw6EkSqh0885Y+yK2K3+t1N8GmFkahmkAtvRJ+RTV3BflyBVYxPTcxzo2fecPO0memxVn2RHTvkY7TNLZKBMkAab48MQlnYiydhb9IHC+nL44VXcDaa1loa3VKpow+6oU3fzGoC89/FA5NDAIrj4JeIYjSyN0vrxXrD70xtQ46pdARmgRbXY1I6ocLc1VV+br2S2blOxcZ/uSKInl1PqSG0+s437oOJ6Cy9dDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjkIOOyR7r1dzSoMhPvBmBUhItKePMloBc5uBJtJfWs=;
 b=x+YfX8fa0OdoIrjB2+85Nz94eQZypsnCPOqjNWK2uqV5YWj51w9kuC9l3qYuviarOx6/WF8WHSGuRGAOUBWzyMO2AmwruXI0/J5V/MG8a3Vom5i33y3SJIS6rlmVHrOJ1YRFPLk2+wt8lndmt7k4aZ5CFQkEiOe1tx9YlvrpMBWv2mAKlr00jPAx1Loxd6qUI6+7tJoMW4DELm9Fe3kNV1p+9DoOQyTzIgW8RLXVxcUXs9+ElaA+pqpee4fqmozh2fvF/dN5xgtduKNhmXjbUBklOdt/99tgLQFOnwJVmO5A94II/jyDS94uVhVF4yw0mR82NdW50wVDut5V3xE0Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjkIOOyR7r1dzSoMhPvBmBUhItKePMloBc5uBJtJfWs=;
 b=ZxTRmEl97wVp0QLlhk43WGl9HlB/AzOuuYTjDhvBrEIin1XwmaWNkuyFSEVPSVy8WjtyVetzk+T0LDoZ88QAmHIPxDr+Ifs2WBOxOS4azCFRk6rHXR4cPdkORWHVHbk0d9Y1gKbeBINC9sD4CC323r7UjBat6TYziIMDnxFr/t4=
Received: from SN1PR12CA0053.namprd12.prod.outlook.com (2603:10b6:802:20::24)
 by SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 20:09:25 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:802:20:cafe::dc) by SN1PR12CA0053.outlook.office365.com
 (2603:10b6:802:20::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 20:09:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 24 Oct 2025 20:09:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 24 Oct
 2025 13:09:24 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 24 Oct
 2025 15:09:24 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 24 Oct 2025 13:09:23 -0700
Message-ID: <0b9eb27e-b178-cfc8-5591-f1fb4b0595d3@amd.com>
Date: Fri, 24 Oct 2025 13:09:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/amdxdna: Fix incorrect return value in
 aie2_hwctx_sync_debug_bo()
Content-Language: en-US
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dan.carpenter@linaro.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251024162608.1544842-1-lizhi.hou@amd.com>
 <69e9de18-4553-474d-b7b0-d3ff3c2efbc5@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <69e9de18-4553-474d-b7b0-d3ff3c2efbc5@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|SJ2PR12MB8784:EE_
X-MS-Office365-Filtering-Correlation-Id: 44f751a4-9696-4ebd-d84a-08de13393a8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUxXMitZNHRScFRsb2k3RmZyUE5IeCtJK1RFQjVFV1ZrbTU4REQ3bFp3RGs5?=
 =?utf-8?B?WWJndDFnL3BLN2FCRmFPR1ZTbXh4dGp2b1h0bUIxRDRJMVgyR0RBSHUvQ0pm?=
 =?utf-8?B?Mi9NQlUwS1I2aHlhV0pqSEs0elQ3WFhHVXA4QjlJQkR4ZCs3d0xLZDVvKzdi?=
 =?utf-8?B?bi9LaWpFSFd4aTg2TDM3UzFpdXZDaE91Q21NNENJcGYwdjJPSm5BZ3VCaE81?=
 =?utf-8?B?SzNjNG90ZjFZeEhZSjJWVG5kWDM1eXA2TWttZkY3M2E4MlFFbWhGM29veEdF?=
 =?utf-8?B?bFhpM2dKTjVIUSszcFBVdUJ5TnVTeS9kYXJVSnRmR0J5cUdDSHhaQXlMWEZ3?=
 =?utf-8?B?c0liOHZ1ZzE4L2d6OUwvL0M5TnBCRTZDVVI3bDV3TUp4Zi9UdWlFNC9Yektu?=
 =?utf-8?B?REhqYkJQb0lBaU1pWG5hN1VDUFpBSHJCNTgwVmI4dDlIQTlrcGZkbWlhQVFQ?=
 =?utf-8?B?cnZmNnRVMmM2TXZESkVpQ0NydG5tNEVkOFB6ODh0U0Z4a2VGcFVCVEhxeCtU?=
 =?utf-8?B?Zmt1MUVzM0ZDMEtMeDVqOHVKa1R3L0toM2d1dm1tc0N4WlpHUGlRREZWQkp5?=
 =?utf-8?B?cUNiTm5XK3U0TUprZFNyNlVFZm83bnAvYXA0Mlk1R0tmN1BSUGM1MWtHSDFF?=
 =?utf-8?B?ODJMd2VNd0xaaVY1Y1RXYUkvbmpaemg1U0gxVzF2WEZqa2QyTzVhbWlVWmJK?=
 =?utf-8?B?L3Zybk41Y1lqQkJJTHVSZHhCRi93Lzd1TGNHYUF3Yjh6K0lZc1FPVkJGWmkx?=
 =?utf-8?B?djB6MnBoR3o1R3ZlQ0lNSmFvY21VU2Q0VDJXWXE1UTJubmlGLy8xcWNvZVQ2?=
 =?utf-8?B?Rldhd2V3T1F6ZTNsbXdqaTVFUzMvYXdweUJLclBqYVZIN0Y1eFZFOXpqd1hC?=
 =?utf-8?B?VUlETHN0VWd2NSttd2xCelVRalpMK2sxR2dESlNhdVBDakErTENqYTlmUXV5?=
 =?utf-8?B?RU53emdDejE4SHl5OXpKempnT0ZBSDhCQVhIS092S2pYd3kyUG90aU8vNURU?=
 =?utf-8?B?S25YTklxdDJUVFpVNTNrY2N6RHZXbGFiWFRjc3YvZG4xNkFJZVRncjF6UUJL?=
 =?utf-8?B?eXdXZXdreG1YdzQxcEk4VVc2Y3IxdmFNeTlXTnhNYWdrajRQUENzQXh3aGI3?=
 =?utf-8?B?RzJ4NDQwVFhGdGYyRWJVZGhUbE40TGxkT0NsWmhsL29GcUExRkJiWXM0eTlX?=
 =?utf-8?B?bnRjYkZ3QmxOTXhuZkE4bTFhNUlxM3BzZ1hHWmZlQ1FYVXJFUGhBY3hJQzlk?=
 =?utf-8?B?QVdRczNPS2RpZGsvMGpKK2RySUpVYTBuamozYkE5NUR6VVFvUDBEeHdTUS92?=
 =?utf-8?B?SlVtSmh3NEtGV010UkFjMnhZeVk5ckEvbjNFQThPWENLdis5eHJSWU9hRU5Z?=
 =?utf-8?B?VTFFQ0x6TzhtU0ZBOHVmR2lDeWlqUDIyWkthQWYwNGJOb3hGdlNud243SWhL?=
 =?utf-8?B?c1AvbFdpd3gxUzM4RlRmMC8xTW1SVmFOMDBtV2xUTU1TaUhHYXNBTVQrWnpn?=
 =?utf-8?B?eDJGT0llZU04TjFsczRkQlhhR0VrYnlscjVNSTI4V1BDaE1NYUpqVHIraHFZ?=
 =?utf-8?B?WUFqMlpudGxJNXdEYjZnT0xaM0hwSjZiOTBKMXo2RlVnaGxXOGxmRUtDSlBG?=
 =?utf-8?B?eU02Z0E2S2lIV29ZZGt5d1BaeDZnYksrUzN3RTFPdUhDQ0ttdDVJQndHSjJn?=
 =?utf-8?B?aVdveGJBVFhHSXVxQXZuVDVGbWNld0FRdTVsSTl2UGZyY2VPS0U2bDFxZ3gw?=
 =?utf-8?B?anl0T3QrMkFFRVRwWUZNbndmcC9vNTNNMXp4bXdhd2k4SW5nRXEzWDROR1JR?=
 =?utf-8?B?WmRpc2FBV1F0ZHByaFFJZkx6c2gwT0lTcXl6c0FQT1FoSXNOdnAzZURVaDJS?=
 =?utf-8?B?Vnc2SEVxVndvQlZ2enYyWVVyUmR6eHRPVTZxZFUra1oxSlA5T3d2VGEyMURo?=
 =?utf-8?B?THZRU0E4WG51UUVZdTU0bE9icWljUG9GYmFpQUhYbHpWdTY4azNxVzFPOEE5?=
 =?utf-8?B?RHltVFJuaXA1VFFQcTFYMHR0RVhlWlJvak1YVElJaEVMK3NaL0x5YW95SG1l?=
 =?utf-8?B?R2V0U3dWdU9PSThtcHlzMWp4OXZINTQyM2lhVC9SSEpnN1NhS2ZTdkFWY3Nu?=
 =?utf-8?Q?EPSc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 20:09:24.8849 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f751a4-9696-4ebd-d84a-08de13393a8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8784
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

Applied to drm-misc-next.

On 10/24/25 11:06, Mario Limonciello (AMD) (kernel.org) wrote:
>
>
> On 10/24/2025 11:26 AM, Lizhi Hou wrote:
>> When the driver issues the SYNC_DEBUG_BO command, it currently returns 0
>> even if the firmware fails to execute the command. Update the driver to
>> return -EINVAL in this case to properly indicate the failure.
>>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: 
>> https://lore.kernel.org/dri-devel/aPsadTBXunUSBByV@stanley.mountain/
>> Fixes: 7ea046838021 ("accel/amdxdna: Support firmware debug buffer")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>>   drivers/accel/amdxdna/aie2_ctx.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c 
>> b/drivers/accel/amdxdna/aie2_ctx.c
>> index 63450b7773ac..c6c473c78352 100644
>> --- a/drivers/accel/amdxdna/aie2_ctx.c
>> +++ b/drivers/accel/amdxdna/aie2_ctx.c
>> @@ -879,7 +879,7 @@ int aie2_hwctx_sync_debug_bo(struct amdxdna_hwctx 
>> *hwctx, u32 debug_bo_hdl)
>>       aie2_cmd_wait(hwctx, seq);
>>       if (cmd.result) {
>>           XDNA_ERR(xdna, "Response failure 0x%x", cmd.result);
>> -        return ret;
>> +        return -EINVAL;
>>       }
>>         return 0;
>
