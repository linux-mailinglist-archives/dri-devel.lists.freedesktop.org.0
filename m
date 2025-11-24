Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1704C7FA5D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 10:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9277910E1F4;
	Mon, 24 Nov 2025 09:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="prhojyDH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010002.outbound.protection.outlook.com
 [40.93.198.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE14810E1F4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 09:30:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/ipHWx8/Y9g5RBg2RwVHpA9SKpDf7l+E75fXdgJtLuLoyxRdVWGkVo49NXMPZ1OEz0Q6V46jQ+DzHpOxoUeGpAey8qHKDbgD+ZZZ3BbqGg80x2nVtufz1/Z+GVIkBM5Qa4yP0SgsH/I/44UaXIQMYNN2v5xV8Fe1HCl0HJK3NmGB1tpBm1X9wAuayNWYjzaT62hYPwgwrV1ZcYEoOuwLnKAtGLXuFv6kZtqyTf0gCwYIr3Fbshhw31uivqbczPI+e4A+G2Ok9nEcjdKPdm59b4F8/rMDbnS5w2NYYEXDopSRfba/d8nQSPXWctBXNmse36p/pGS095oZUWaK8yUlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=325KReVxIXk0nsTEN8rBoT3WmziETWUO+adXCXCCUrE=;
 b=EUcU87JFLFamT3Dm+JI8r2+y4KIKBpr1Yu6O2iM/qK7Tw/Z4fPAdbvTyRLVPDpTfFHMA3xZpDizWnve260+s+DePGmbRxVZRZK5Lul1j30GEvToaq5AuHNtgzz4ddjOt0NWwNf2v8zzmSHqQTbPQFJ2kvN6knPKpBul5X3PQG5NVV8YF6nGR66kFvFmOLz99xRg9EJujIAGZUarWTSgAE90T8pa7n3YPdsN3MZPAK9dfw1cNCJ7nsYYTe5I6SHbxI2fjP1Md2k6YxZ6QdI645q49p2fRgbhLYLo7rflibxesAthnRGS7swdGMXJpgmRMoSn7oCPtr+2X6g1/axJsxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=325KReVxIXk0nsTEN8rBoT3WmziETWUO+adXCXCCUrE=;
 b=prhojyDHDIXkluokQnMpwHpycze/Pkv2BgiC2EREi7GVbycPmp8c35lE37pD3IPyjXI1sxPh3D6oUCAwGZazEp3ks6h1CYOq8owEdz3Rbgq43aeIOAWBxUeH/eQGxLHMwxnHz2jgn+OmJLAWxoxcA7sYpLO4aHNMiGKe6lk9AwU=
Received: from BN0PR03CA0042.namprd03.prod.outlook.com (2603:10b6:408:e7::17)
 by BY5PR10MB4243.namprd10.prod.outlook.com (2603:10b6:a03:210::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 09:30:56 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:408:e7:cafe::3) by BN0PR03CA0042.outlook.office365.com
 (2603:10b6:408:e7::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 09:30:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.0 via Frontend Transport; Mon, 24 Nov 2025 09:30:55 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 03:30:53 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 03:30:53 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 24 Nov 2025 03:30:53 -0600
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AO9UkJQ1683050;
 Mon, 24 Nov 2025 03:30:47 -0600
Message-ID: <1863b264-98fe-42c6-ba0a-c9e1ba74774b@ti.com>
Date: Mon, 24 Nov 2025 15:00:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v9 2/6] drm/bridge: cadence: cdns-mhdp8546-core:
 Add mode_valid hook to drm_bridge_funcs
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <Laurent.pinchart@ideasonboard.com>, <airlied@gmail.com>,
 <andrzej.hajda@intel.com>, <andy.yan@rock-chips.com>,
 <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <javierm@redhat.com>,
 <jernej.skrabec@gmail.com>, <jonas@kwiboo.se>,
 <linux-kernel@vger.kernel.org>, <linux@treblig.org>,
 <luca.ceresoli@bootlin.com>, <lumag@kernel.org>, <lyude@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <mordan@ispras.ru>,
 <mripard@kernel.org>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <s-jain1@ti.com>, <simona@ffwll.ch>, <tzimmermann@suse.de>, <u-kumar1@ti.com>
References: <20251120121416.660781-1-h-shenoy@ti.com>
 <20251120121416.660781-3-h-shenoy@ti.com>
 <8c97c5e9-7705-4368-a3a9-45e209582c3f@ideasonboard.com>
Content-Language: en-US
From: Harikrishna shenoy <h-shenoy@ti.com>
In-Reply-To: <8c97c5e9-7705-4368-a3a9-45e209582c3f@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|BY5PR10MB4243:EE_
X-MS-Office365-Filtering-Correlation-Id: 558b4c21-bcb8-4f1d-66f7-08de2b3c2b69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|7416014|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZU1PcHlrbXBKRndpV3pKVGJPbU9OMVIzY1duanNUdjllSytmbUg2YzJDa2wy?=
 =?utf-8?B?aUgvOXZkTFF5OUk1MHNWRWlXckk0NE9JK1lsS05XS1B5ajJ0UGE4VzFvYmps?=
 =?utf-8?B?akZwUUhDYWVialJCdVpHYWxhK2dyZWx3WTZxUnBtUExEWmFFT0NERlRsekpk?=
 =?utf-8?B?bWh3V3ZtdW9XZzVOd0E4NUo1UDNEcEJZdUtiOGdqSzhPUlVhY0txSkpObHoz?=
 =?utf-8?B?SElnbVBycWltQnlpQmFjNGt3b2RBL05PK1hldDRBTnc1OWdicFNodnpnZnZ6?=
 =?utf-8?B?c25OV0VCYzBoUW01R0FIR0JUZk5Ia29TK1FuSEpILy9RSVF4RzNJUE5YS0F3?=
 =?utf-8?B?SlRGMldtbGZCaTduSFF6eXRoc1d4dFVtWE5EaW95M0sxNU1YOWhjYmxNMHdr?=
 =?utf-8?B?VnJxWHpjekZ3SUNLL1hiOHlxVnFkdEpONHplNURKVStPeTJYZEc4SkViQllv?=
 =?utf-8?B?ZGZJS1dQbVdPL1hXazRmWkRmbTluRkRxVGYvNnlTZ0pmdENQVFg1TEQ4TzZ1?=
 =?utf-8?B?UVVURDBkYUs5VnVCRU84YWhMYzRCNmE5aVE1WnFWbzk4dlFsNlEwSEd6dytC?=
 =?utf-8?B?YXg0ekIxanQrTXNxUVJ4eGRPdlZEdDF6bGZTMG5sMWwzdEIrUHZkN1lUd29W?=
 =?utf-8?B?dlprWUdvWWsrOHdFeDZRZVU0R1piY1ZNN0lIOFF4K3NwRE1EMENyYkQ0ZXNN?=
 =?utf-8?B?ZVJoQk5mUUwxek51eGVCNTZEODVud215V1dpa2k1Qk90Rk9xOWRtMWJTSWhX?=
 =?utf-8?B?RlpRNnVyWDdKMGZnNTMxRFducGJMZkp0U0NrUFBTQUg1SFdSd1A0QU0wYVJi?=
 =?utf-8?B?Y2d2dFl5RUpLOHVEakpSZUNvUXY3NlN6WW16dzk1MktxNXVKSkNPQm0rYVUx?=
 =?utf-8?B?OXFkRGlZNmVxdVM5cWFSRmoxdElOSVdXT2dQMzNFeTUvcW1Ka3BHR25YeS9j?=
 =?utf-8?B?UFdQWWp3VVNFWGFNL2hwVGcySlZoaWtSbXJaVDNRdmttS1ZmMHZtUjBlZFJk?=
 =?utf-8?B?bzVRQnFLdmRpUXZOWGZhSTBaRUFFWjRYUitSYmtOY1RoSEU3ajlQdHd2Mmgw?=
 =?utf-8?B?bDJGbWJaUHJCaVF4QXgxaHBBNDA2UGxIMnJhVmN4bWo4OWpMQ09CU2dWNTBy?=
 =?utf-8?B?U2VOemdWYkk2UiszQ1J4RCtaRWliODBQdUhtK0MveUpGOWttMkpPMUxocXl5?=
 =?utf-8?B?Ykp1emIvTTZlMHh4NWo4QTRSNURYcW5QUForNk02OXp5VlUyZ2dMV2gzMSs4?=
 =?utf-8?B?aGNNKzJpVXNQZzJaTi9kQXdHVkpDTUZUTkU5dUdMK3N0MlR6WlZZVW5EM2Jz?=
 =?utf-8?B?WXQ5MkpqK20wdWViajN6L2lMYU9TZitRZlRhZkppRTl1Qkp6WksxdEg2TlRM?=
 =?utf-8?B?aWVmMzhlblhQaXpSMk4rN3gwbmxJMkdXbVp4TnNKUGpUUTZXK2NhYzVTNldW?=
 =?utf-8?B?UjJTT1FjQVErVTNSV3F0eW45ckxCREJUVDRTS002YlF0Z1BPMGFaaWJrTHdp?=
 =?utf-8?B?WFFYZFlEYVJiR0t2b3RvbkN5bFRnanNGUnIzZXJlMFdOMTZhZHZoSDkweHU0?=
 =?utf-8?B?T1pEakhBeVlybys1Vm5zT0lWMWx5NTFtRUpVbGVVWTQ1Q1VDSnpFc1RXVjNr?=
 =?utf-8?B?UG1BdHJOQzBwYTNpbG1pT3dCMTFxS3ozOEdWcHQrZmZvekFSSVk2WmFsMTdj?=
 =?utf-8?B?YVpid045SmZDWnZuNnRrQko5VHR0WlFuVExFdThLTWdYNis3bHZmandaQ0hj?=
 =?utf-8?B?NGRpcFhhOXRRWWQ2cVJZTEplT3ZuSWwrQUZKSG02L3Y4UlJ3OWE5QWVhRVR0?=
 =?utf-8?B?K25kZHFzbzBOQWtsendjVVZLN0N2YWtxYXhOK2lkN1BobnNOYkZVT0tSelNR?=
 =?utf-8?B?aGFrcmdFaC9ieWJ1c0hJMmVlVGVMYnZnWVNCanZiRXNlUXluVG94Tm9zQTc4?=
 =?utf-8?B?bW11THIyV3NSbkwvZS9DMWNwdTNaQjhEcEczYlF2MmhEaHN5M0Z3Z2FsdE1Q?=
 =?utf-8?B?ejJwNG5hdG9mMSs4VzYwQmRoTHZIL0x4KzBUaUZ3ekxodHBXRndXSENqeHNJ?=
 =?utf-8?B?Zk1mOFJxUG9LMDYvZ29NYUpjSmdYeUJTWVJSdGlJWWFhQWFoemFkK204cHkw?=
 =?utf-8?Q?FBgg=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 09:30:55.8332 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 558b4c21-bcb8-4f1d-66f7-08de2b3c2b69
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4243
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



On 21/11/25 18:13, Tomi Valkeinen wrote:
> Hi,
> 
> On 20/11/2025 14:14, Harikrishna Shenoy wrote:
>> From: Jayesh Choudhary <j-choudhary@ti.com>
>>
>> Add cdns_mhdp_bridge_mode_valid() to check if specific mode is valid for
>> this bridge or not. In the legacy usecase with
>> !DRM_BRIDGE_ATTACH_NO_CONNECTOR we were using the hook from
>> drm_connector_helper_funcs but with DRM_BRIDGE_ATTACH_NO_CONNECTOR
>> we need to have mode_valid() in drm_bridge_funcs.
> 
> This looks fine, but a fix should always explain what the issue is. What
> is the behavior without this patch, if DRM_BRIDGE_ATTACH_NO_CONNECTOR is
> set?
> 
>   Tomi
Hi Tomi,

Without this patch some modes which should get rejected based on 
bandwidth requirement will not be rejected as mode check/validation will 
not hit 'cdns_mhdp_bandwidth_ok'as with DRM_BRIDGE_ATTACH_NO_CONNECTOR 
flag set we use hooks from drm_bridge_funcs.

will include this in commit message.

Regards,
Hari

> 
>> Fixes: c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
>> ---
>>   .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 20 +++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> index f3076e9cdabbe..7178a01e4d4d8 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> @@ -2162,6 +2162,25 @@ static const struct drm_edid *cdns_mhdp_bridge_edid_read(struct drm_bridge *brid
>>   	return cdns_mhdp_edid_read(mhdp, connector);
>>   }
>>   
>> +static enum drm_mode_status
>> +cdns_mhdp_bridge_mode_valid(struct drm_bridge *bridge,
>> +			    const struct drm_display_info *info,
>> +			    const struct drm_display_mode *mode)
>> +{
>> +	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
>> +
>> +	mutex_lock(&mhdp->link_mutex);
>> +
>> +	if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
>> +				    mhdp->link.rate)) {
>> +		mutex_unlock(&mhdp->link_mutex);
>> +		return MODE_CLOCK_HIGH;
>> +	}
>> +
>> +	mutex_unlock(&mhdp->link_mutex);
>> +	return MODE_OK;
>> +}
>> +
>>   static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
>>   	.atomic_enable = cdns_mhdp_atomic_enable,
>>   	.atomic_disable = cdns_mhdp_atomic_disable,
>> @@ -2176,6 +2195,7 @@ static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
>>   	.edid_read = cdns_mhdp_bridge_edid_read,
>>   	.hpd_enable = cdns_mhdp_bridge_hpd_enable,
>>   	.hpd_disable = cdns_mhdp_bridge_hpd_disable,
>> +	.mode_valid = cdns_mhdp_bridge_mode_valid,
>>   };
>>   
>>   static bool cdns_mhdp_detect_hpd(struct cdns_mhdp_device *mhdp, bool *hpd_pulse)
> 

