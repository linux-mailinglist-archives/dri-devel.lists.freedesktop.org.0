Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B0BC674C9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 05:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F03810E00C;
	Tue, 18 Nov 2025 04:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="ka+Dh7ma";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012062.outbound.protection.outlook.com [40.107.209.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEE710E00C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 04:54:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7xY1ZPxjIhOlvDP/0/cm0VR6KYWLydTSI5upKaXwoozjBnLkJn4GhmMIrwxGNg/6N+I9DzyODbEsl7FXY7lm5iE4QBo+EpbV6YS67VoFxcEgy7bHg3Ma5+Lk1hMKIIDGq4POMl02AzaHdzvx/z80bL8J2VNr9IL9rmbfa6KNtwPhQQSfcwlWPVyTgmtzjogUki8Tl6OJ+64+mARbotnCslcBbPNM802fIXoSgAvu03XmcCV2jIiZKOknMItjOR3VnTR/VF6aYmW4uQZIhQnsUpq8/iu+uyIxEghjaHCeLc959iE7V6jGa6X6bqJq7N9to4FLm6+C8RPcJxU+579bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xzx/atYe8Y3+EVMz32LJed0woJqjC8LdqYamO4rrtWA=;
 b=f1W4l2JGTvtbx2SH8AFvYgI78jR+qnqkoiG+mgFhnNVQMKRZoMmuVSA4Duu7LcHhDqgFf1vDVcBZqo8Td3AceGGLLAWxhLil7ahEGF0zayEkmztJBMoCVLWdMyi9GfDQQ+8GPZANiLkiFaP27nWYL4bbODcmKSayBMofqyKeoQeiqe2rkf38gyY+aqtcW63f5fKTaQojnXFVDtuQXQWjX/UP8WMO1RdlGtXNKUxIQZ2rGSJnY8VNpOxG42xJs/2HE0nBChempcTXFqni+4uPmQhri+HLdX3rejqs0L3AD6GqrzNxivmiTdM12iTWeFmof+cdVQ2yF6d1/al93Njffw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xzx/atYe8Y3+EVMz32LJed0woJqjC8LdqYamO4rrtWA=;
 b=ka+Dh7maOrVQyzEl4o9wyDOuhpTZEDBfQXURrL+AqDp6WGMnHaW+NaYbQ6Zfv3L2qkNM6bsYRZbfrGzBV2Ylnl+Wulkn37u2kcNf7021lXlJNyRh833E08ig/BnS6gRxeyHeeSIxcKOl6d82z/lYOPOjyk+gPiGclG/bw/TEC1M=
Received: from CY5PR14CA0029.namprd14.prod.outlook.com (2603:10b6:930:2::10)
 by IA3PR10MB8563.namprd10.prod.outlook.com (2603:10b6:208:571::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 04:54:55 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:930:2:cafe::ca) by CY5PR14CA0029.outlook.office365.com
 (2603:10b6:930:2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.23 via Frontend Transport; Tue,
 18 Nov 2025 04:54:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 04:54:53 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 22:54:51 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 22:54:51 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 22:54:51 -0600
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AI4siiu3697475;
 Mon, 17 Nov 2025 22:54:45 -0600
Message-ID: <30a0040d-2ced-46bd-85db-f92dfdc9e347@ti.com>
Date: Tue, 18 Nov 2025 10:24:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/6] drm/bridge: cadence: cdns-mhdp8546-core: Handle
 HDCP state in bridge atomic check
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
References: <20251014094527.3916421-1-h-shenoy@ti.com>
 <20251014094527.3916421-7-h-shenoy@ti.com>
 <3a05be44-97f6-4c0f-b565-0f70947d7fff@ideasonboard.com>
Content-Language: en-US
From: Harikrishna shenoy <h-shenoy@ti.com>
In-Reply-To: <3a05be44-97f6-4c0f-b565-0f70947d7fff@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|IA3PR10MB8563:EE_
X-MS-Office365-Filtering-Correlation-Id: 7beeb4c9-bcb7-4025-44b1-08de265e9ce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nzd1WHFnek1hUTYzbkt4eFlDRy9DcVcxOGJJWnFHNWNxWCsvS2NoTHkweVl4?=
 =?utf-8?B?R0s4Skc2UzFoZGRNVEJDSVJsUlNHNDVRUnA4TTZOb1dLMXMvS29ENGdIMXp2?=
 =?utf-8?B?SWlTL1NFcUhOM1doajhNZTdrMzh0S0gyajRac2E4bmFXUlRIVUwxZ3luYzRQ?=
 =?utf-8?B?RmxRcm10ZVcyMnFKYllablpTcm5CeHcxd2tBa1lBNW9jS3IrZWdZTHd1NlBW?=
 =?utf-8?B?bVNyYk5tcEdaQVZqdlRpWnFmdnRGeXlBSVBoYkhqdy9GNCtSK2hmVXRkelpz?=
 =?utf-8?B?Y3NTMnZhK3NMOFl3L0w2KzdBS0Z5WnRJclF3Y3pJZXJGVVE5c1B4QVJRVFRX?=
 =?utf-8?B?SmtqbEhMaWt2MXdZUXJNSUF4YmlnV0xscUdvREJaNlFVU0tBRDllbXJXdVVl?=
 =?utf-8?B?dFhhcHJMTkdvRy81dWhjTVdLWkp1VXRwWkJWMndNVnM5UWZtVUp0bEdFS2w0?=
 =?utf-8?B?YlNOWnU2Z1l0UmZ0MnlKZTV4S0JoYXc5SEt1MDVzNGo3T3VuRkR6MGNtR3li?=
 =?utf-8?B?Sjd0elV3a3NNZEJNeWt5am9nVmVlSnRKbS9sUjVvZGxXRzhQMWZRZTh2N056?=
 =?utf-8?B?UDNyT3lWbkMxSENnUnBlVm5ZMmhLeGU5a2NxcVhuSytVZUlyei9zUHFWOFRQ?=
 =?utf-8?B?Qm1GVUFnR1A2SkpiODd0UGRhaG9JVDRYVFBrTEJMb0Q3RlN3WFFYT2JSYTZB?=
 =?utf-8?B?Sk51VUc2SWJjWXRaaVVrV090d1lWYVJ0S1VadTNTRmlWSDc4TmZVdjdlNzNE?=
 =?utf-8?B?ZkZnTi92dGtSUEhQOW96UEt3SWRPM0pjV0JnSUZrV3MwcFJFRkNYSXdnV29r?=
 =?utf-8?B?YTNPRmNTZjBTY2ZzMWY1OHo2Sk0xSURITWt1TlRWT0p4d2VFMDhFZWkvMG9u?=
 =?utf-8?B?aDZ5ZTM2NEVVbzdBOXJEdG0wejI4b2sxdUk0NFhKeVJnNzRoRWVHNGpRUEpp?=
 =?utf-8?B?VjBJcngxR3Z2ajJIci9OREdjYzllWWR1Rm9RNXVYVm1BcE11OWpidEFkRWtM?=
 =?utf-8?B?NTYyNThkSDJyWGZNQ3VYYWpyWlpCT3QzTGtNNzZ1TUU1YzY4cjlxaWY3c0lV?=
 =?utf-8?B?d3FCUStMUVpnenR4MHNhNk01TUZmUTFxSDNSdUhvNHlwTnkrMjBsS3FzNE5F?=
 =?utf-8?B?L1pzRzdzTW1NclZFd2pXNTY5TGY3bytXVkdtRm95cTRlOHZGbTVEemtHdzZZ?=
 =?utf-8?B?OWJrdXh5OHQ1NVZZYm82QXJ4eUcrNzg3U1FoZ2tNNUtFWHBCKzhQTmoyWE9o?=
 =?utf-8?B?aDNyZWdrQjRvbHJyeE5GTlVUV0lXOTBtREZRdjhkaEEvRktzUG9SNmdUcEEr?=
 =?utf-8?B?Nm1JeWtUaWdRc2N3eUlhUmNXdVNpclZYckpkWXppVzNLQy9yNzliWHhrblFr?=
 =?utf-8?B?NXBDTytCL0FXT3F5dFhGT2NLVmRUN1R2L2pWaHFaQ0QvbjdDYlRLOGVZUmt0?=
 =?utf-8?B?VFRuM3VZS3o4MEhNZ1lXdGxFRXRZNEVxclNDeXZFWnMrN211d21YSlQ5WUdx?=
 =?utf-8?B?N0JZVUJyUDNISW1JS2gyaG5iZVJoYXo2cmt4d0EyaVBTT0ZGdTRBSkJXdFJV?=
 =?utf-8?B?MGoySDV0bFJRdG1CNDB4bFJwSnA0M2plWVJ0M0FuSHMvMTJpMldZaSs4ZlNs?=
 =?utf-8?B?SDFIUStwTkMwbjlaNDZ6eGhBMDRiL0tuQS9OZzd6VTN5ZkJMVmdFNEJ1NkNl?=
 =?utf-8?B?MFl5UjBLZGdkbW1yNGpMaE5zNFlybTJpbWdoWk1YNCsyREhoWVVHRmk0UStL?=
 =?utf-8?B?RHR4VEVFNDFmbmFwL0liRUU3NGNYcEQ5eFo1VmdjbzFNZ0p0Mm9FTHEwVzhY?=
 =?utf-8?B?WDVEY3ZqZEZzdlBMaENjK1NWWlduMXdTR1hIYlhGbnhyNnd4ZWpZbm9SUUVT?=
 =?utf-8?B?TDhuSUVEajVJVmVicTZKN3E3aWY0Lzd3WXdYK1cwZGdoOFVwZmpiM0habm5P?=
 =?utf-8?B?TDMyNUJ6WXBaRXhrT2dUajJLZ0xIb1FjaU5yS0xKczgzU2d3c0ZLT3VDc3pN?=
 =?utf-8?B?L21qYnNicXdEdDk5elRBUHNkck9iWDZmOEF2enU3U29JbFg5YUxxUXM4TjUx?=
 =?utf-8?B?UDdvVmdwUC9VRWRrcVE5ckNqOXoyb29qeW5TcXd0Nk9RZTRxU3dtOSsrVlJj?=
 =?utf-8?Q?glP8=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 04:54:53.3307 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7beeb4c9-bcb7-4025-44b1-08de265e9ce3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8563
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



On 12/11/25 14:52, Tomi Valkeinen wrote:
> Hi,
> 
> On 14/10/2025 12:45, Harikrishna Shenoy wrote:
>> Now that we have DBANC framework and legacy connector functions removed,
>> handle the HDCP disabling in bridge atomic check rather than in connector
>> atomic check in !(DBANC) usecase.
> 
> This sounds odd. The patch is only adding new code, so "handle the HDCP
> disabling in bridge atomic check rather than in connector atomic check
> in !(DBANC) usecase." doesn't quite make sense.
> 
> Afaiu in patch 3 you removed the HDCP code for !DBANC, and here you add
> it for DBANC.
> 
> Correct me if I'm wrong, but HDCP support for DBANC is currently broken
> in upstream, as the HDCP code is only for the !DBANC case?
> 
> Isn't this patch then similar to patch 2, which is a fix for a missing
> feature with DBANC? So should this also be a fix, and perhaps be moved
> as after patch 2?
> 
>   Tomi
> 
Hi Tomi,

Thanks for the review, yes will update the sequence of patch and move 
this after patch 2 and also will add fixes patch.

Regards,
Hari
>> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
>> ---
>>   .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 23 +++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> index 06ac5c2ee78f..120eb7ffe20c 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> @@ -1962,6 +1962,10 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
>>   {
>>   	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
>>   	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>> +	struct drm_connector_state *old_state, *new_state;
>> +	struct drm_atomic_state *state = crtc_state->state;
>> +	struct drm_connector *conn = mhdp->connector;
>> +	u64 old_cp, new_cp;
>>   
>>   	mutex_lock(&mhdp->link_mutex);
>>   
>> @@ -1981,6 +1985,25 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
>>   	if (mhdp->info)
>>   		bridge_state->input_bus_cfg.flags = *mhdp->info->input_bus_flags;
>>   
>> +	if (conn && mhdp->hdcp_supported) {
>> +		old_state = drm_atomic_get_old_connector_state(state, conn);
>> +		new_state = drm_atomic_get_new_connector_state(state, conn);
>> +		old_cp = old_state->content_protection;
>> +		new_cp = new_state->content_protection;
>> +
>> +		if (old_state->hdcp_content_type != new_state->hdcp_content_type &&
>> +		    new_cp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
>> +			new_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
>> +			crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
>> +			crtc_state->mode_changed = true;
>> +		}
>> +
>> +		if (!new_state->crtc) {
>> +			if (old_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED)
>> +				new_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
>> +		}
>> +	}
>> +
>>   	mutex_unlock(&mhdp->link_mutex);
>>   	return 0;
>>   }
> 

