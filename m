Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AB7C8040F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 12:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6988810E225;
	Mon, 24 Nov 2025 11:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="bdaTPU8o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012028.outbound.protection.outlook.com [52.101.43.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80FD10E225
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 11:46:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h19Z7ryfOf5TFU5kr85L30nKs6Lv3D7bHAfCqXWfVwjUXS09tMzj0x7G/4MkCtNfl70vUOxoD0XXEZPKrkAdDIVN/NZX2S1UVsODDDkBgQRDQn+q0dZq4JpX/KK8bPMSJCTzK6CSVlQybpFOmnPI+Bhh0B5XGT5i6DZWw1LL2G4PAGFBgf/k3scB6H2d1weigzz5cE19i/ZNeq+q/Ylzte+o7AFyLMNj+w1wJuxTNsRMiIYpU64bMFy2cvxbuN5yHr51QPr5MhP7FkNbG3nem2vIhU51CRqvQkqxTZLioI5BWQ4kKqEdsMhi7QYL7C6nFxdAqBgZ7Jsbg798Ep2/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tT0CpqoF2wseuvW3kgadVuuhHHn9DeDn+MWBui82UUo=;
 b=a9jePk7detI5j/1xrIHL+s2ZBTUNAtjOrN+yeBfLv2oCvkG14rGLgMCiS6432DPXTNzPuNlYDiXGEg1DkUYBCUBdJlg6za4EhtQkFOuOao+BuJQn6T0Tg7VH8W0lu2/hNF5fdaaq7GxP0DzyfbwtJTpM1Y+EYTo7FKnWrjcP1nf32vyV9tqGliQCzOsCB/CthsfVohYkT4/+tKnLKv38BB3n0fvHlPhde1w8HJXXrNyJARL2F/zJNCicUkdTua1Em4IvjC0ATtPs4ahu6bW/a3SjhsP5z+dOmLvZOrsv3SPxZAYakbg/RpxypOIn36F4kSvN+BdYJgkTMlII+qgeQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tT0CpqoF2wseuvW3kgadVuuhHHn9DeDn+MWBui82UUo=;
 b=bdaTPU8oMKXlPmxjFBFbmQNcNY8Uwt/HiMpj30fUCg7Q6JjylaVIQ10LzHSkHYw3Yr1bpF+7IgYZyJX9BeW4B7q3ORqx7b0vh+VnrwIGSxbi8pbbqsaIaXxxPgJ0G/CMVS+f24D4hPM43TtpKWmcaRcoQi25b05RTxsl4w4elmg=
Received: from SJ0PR05CA0156.namprd05.prod.outlook.com (2603:10b6:a03:339::11)
 by DM4PR10MB6840.namprd10.prod.outlook.com (2603:10b6:8:104::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 11:46:46 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::3) by SJ0PR05CA0156.outlook.office365.com
 (2603:10b6:a03:339::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.9 via Frontend Transport; Mon,
 24 Nov 2025 11:46:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 11:46:45 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 05:46:39 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 05:46:39 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 24 Nov 2025 05:46:39 -0600
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AOBkWCL1850038;
 Mon, 24 Nov 2025 05:46:33 -0600
Message-ID: <0fdcd88c-7940-45f4-98e1-39ad84f63389@ti.com>
Date: Mon, 24 Nov 2025 17:16:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v9 3/6] drm/bridge: cadence: cdns-mhdp8546-core:
 Handle HDCP state in bridge atomic check
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
 <20251120121416.660781-4-h-shenoy@ti.com>
 <b6e44d61-7704-48fa-ba03-ba1a75e8a4f8@ideasonboard.com>
Content-Language: en-US
From: Harikrishna shenoy <h-shenoy@ti.com>
In-Reply-To: <b6e44d61-7704-48fa-ba03-ba1a75e8a4f8@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|DM4PR10MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ba14959-15fc-493d-be7f-08de2b4f252c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGtGVERaYkhsUjJ1SnIzNG9sTVRQL3pyNEZVNnhaKzNNTGVvUEpCMzhIdkRQ?=
 =?utf-8?B?c1p6R1JhS3dIMDhqaFRlcGRHNThCNGx6S0ZmTmpiSEhBQW9ZOS9zUFZYcXEw?=
 =?utf-8?B?VHU0NWtWN2pMK1ZGNXNzODh4SXk2a09aVExvY2dIdnhvaktXemxQKzFrTnRi?=
 =?utf-8?B?MW42MGZBUWl5ck1wcnJpTm4rYW9ubVdxdDV3dTBINnFJdkVYeVU5U3NlMFVV?=
 =?utf-8?B?N0tqNVc3bDc2Vy9pUmNmcE0vT2xlWGhiWk8yYVRScm1WZ1R5MngzRnJhUW9Z?=
 =?utf-8?B?MFBSYU1janB5NnQ5MVNmSmxiOWphQldBK0xKeVdjbkJZT2lMaVMvZ1lZNWFr?=
 =?utf-8?B?UVlKZmxMNzRNTmZSbklyZ3JpRk5YSWRrYnRXLzd6QkI4aXBqVlFuZzBRb0JR?=
 =?utf-8?B?ZUxvOXhyNmpaSTJwVGVwNG01K1FKNGpydXkxaFBHV1g0R1NucDdnZUl3MFhG?=
 =?utf-8?B?bVowdjE4ZFJyZzBidm9XdUZtczFIUXJwVldBWXdoNDdRK2pjdmpLTEp0bmU4?=
 =?utf-8?B?THFKOHVJeXdkT2M4a1lMUnBrMmcxZnJkbWR1L1paNW8rOFI0azlvaThESEo0?=
 =?utf-8?B?cnZBY3hWcGI2T09Gd0hpT3ZzQVpwdDRtQXdUMm5QYVRkY3FrWnB4clRya1pO?=
 =?utf-8?B?ZXBmMVc2enZ0a3RhMkl3U2R3c3hyck4yTDB4cXdaL0xZbjRFYzdLcVJkTEJX?=
 =?utf-8?B?QWE5UWlYVHNscGsxb0tWa04wS1prTXd5cEQ0aVpMUHVYb3pYYmpYRXBNVDlu?=
 =?utf-8?B?V29uUW9KOFArR1FIT0FVV2J3c0xtLzUyVStQUGdOcnFvVXN6QUVaUnZ6RVNi?=
 =?utf-8?B?c3o4eVVFVTdxRkQ4VUR1bVZuSTNra0w1VjhSdSszakQxUDVkUjJDMWkzK1FG?=
 =?utf-8?B?R3JGZ0t0ZG81TjdiTC9oL3k3Ly9pd0VZSDlWeTJhK2RHcXVoTGY5OVpzbDRy?=
 =?utf-8?B?M3VEMWJmME1idnB2MW9uVEtyVG83WEo3WWE1bmxERmJlWThHNHl1dFNWbFpD?=
 =?utf-8?B?Y3duVlIxTjhxS1pzVHB2cU5QSWM1SmMxS1U2dVZCS2JUVVE0YTFGMFBacnRv?=
 =?utf-8?B?a0wybWh2ekxWTTNjUVNyQjl2NHBkNmlkS2M2SklRVnJBR0ZzMnA4V3FreW5r?=
 =?utf-8?B?WXJ0eFB4OG52QU0yQXRpU0tLNG10dXgxTmxaVXg5eWxUc0s4dHl1YWw0VWc3?=
 =?utf-8?B?cDNuUi9wWnlLRW1NK0ZBelpWazhwc2UzOHJCYnpxVXF6VXQzZDFsWkkxdFpY?=
 =?utf-8?B?SUtHWG9saXI2b3pCZVJwOVZTRk9PT2wwaXBsMUF0U2ZZNTJDQzRlNjJKcVpr?=
 =?utf-8?B?SWtGOWQyNEhJci9DbzB5bUkxZklnbUtjSDhxUFVpNERVVFFQZHJPbm1CV3VR?=
 =?utf-8?B?RTltTjQrK0tLOVMzOEd3RU1KOGxES05EaVY5N0NIWHk4WjJuTGpIakU0b0Zn?=
 =?utf-8?B?TUtUckVTT2d1UkthTjhLUzA3TGMyN3l4N2FPcHpTTWk2UGxqVUFDbHBsUDZh?=
 =?utf-8?B?MFhkb0FQejdqWUM1S3FBbmd0TnB4SE5hYXc0M0MvTzlodUF3WkpCQmE5MS9p?=
 =?utf-8?B?UHl5YTZkYkdxenZReTVaL3pQQVFMS3Q2bktiTE00YUduMnVrSE1DcGV4OW1B?=
 =?utf-8?B?aUtxL0hEbGhodlFYdnlXRzY4UmV0TWhFU0liOXp0ZjJDUXdoNE9jZ2NnMmZy?=
 =?utf-8?B?Z0dUQkJKV0g0K2J5N1BlWWhZMTFhYy9kaE5odThwRGhOaVpMbSszMHEvWXNa?=
 =?utf-8?B?Z1UyazRaakVWeVFqS1FTQ1k2ZVZaYjlPRVdTWUVpRFJtdFFra0VZZDBab0Z3?=
 =?utf-8?B?d3lEalJyd1NLNXU5NHFTWUNreHJ2MnhveVhJdk9ETVVXNHF3R3pTU1FlWEFx?=
 =?utf-8?B?NDVjdDEwaEZDY0pzTnJYQ2YzbXZ6NHJRMXROWkQ2eFUxZTloNk5zRW8wcFNr?=
 =?utf-8?B?WUw2SDhRUkNSMXp2cm9RWDF2WVA0UGFCL0Jla216dDRwaUV4SllMYjFjd3lE?=
 =?utf-8?B?ak85WE5Mai9GeTZZTEVOTVJxQlV0YUMxd2NLNzM1MU5BSmNMRzVqRWZ1djJ1?=
 =?utf-8?B?NjkrelhubXdGbE5ZN3JrNytCK0xMS3JabllLRUVCa1VnVThTdCtVRHcvSldM?=
 =?utf-8?Q?8ILU=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 11:46:45.8278 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba14959-15fc-493d-be7f-08de2b4f252c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6840
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



On 21/11/25 18:16, Tomi Valkeinen wrote:
> Hi,
> 
> On 20/11/2025 14:14, Harikrishna Shenoy wrote:
>> Now that we have DRM_BRIDGE_ATTACH_NO_CONNECTOR framework, handle the
>> HDCP state change inbridge atomic check as well to enable correct
> 
> "in bridge's"
> 
>> functioning for HDCP in both DRM_BRIDGE_ATTACH_NO_CONNECTOR and
>> !DRM_BRIDGE_ATTACH_NO_CONNECTOR case.
> 
> Same thing here. What is the issue? What behavior do you see without
> this patch?
> 
>   Tomi
> 
Hi Tomi,

This patch update the HDCP state in bridge hooks, as connector hooks
are not used with DBANC, so essentially helps correct functioning of 
HDCP by updating its state.

Regards.
>> Fixes: 6a3608eae6d33 ("drm: bridge: cdns-mhdp8546: Enable HDCP")
>> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
>> ---
>>   .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 23 +++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> index 7178a01e4d4d8..d944095da4722 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> @@ -2123,6 +2123,10 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
>>   {
>>   	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
>>   	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>> +	struct drm_connector_state *old_state, *new_state;
>> +	struct drm_atomic_state *state = crtc_state->state;
>> +	struct drm_connector *conn = mhdp->connector_ptr;
>> +	u64 old_cp, new_cp;
>>   
>>   	mutex_lock(&mhdp->link_mutex);
>>   
>> @@ -2142,6 +2146,25 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
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

