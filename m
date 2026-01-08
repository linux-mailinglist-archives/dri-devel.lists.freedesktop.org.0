Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A8CD05A2B
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 19:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CA410E376;
	Thu,  8 Jan 2026 18:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZOij5C5P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012052.outbound.protection.outlook.com
 [40.107.200.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF95110E0BC;
 Thu,  8 Jan 2026 18:46:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dEWBid7UEqduD+iUTOiMHpzj9lqO/CpIBGTXyWKnJNh7DnU42hYQ2zkcys6/PKaXxNWob37tSEAskHlE1abGCn6KTAqc84KRpn0iXjEhIB3idgcGcFne//KSLUZokIo5fcmCX4iNb51qCn8GdwHXOOu5+kIJFxleM5L7m382dSsBZoCMa2W+RiYuBuu+Uc6UOkohFdJKfj80LJGkmyJ65jJP037awbMkU7wAF4OWW5387N5vHuflWEWGJGmagtxyaoa6p5BYOkkfktG1cdHRFwRPkYadsHzlpkAyMFsTSWF/TiaTwij+OO90wHWTHqplB37+8bDdf65HNXLLW70waA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPrUd5y4CoQT3tjVbKqKfwUxiEkYIunGbp0KoOUbQiw=;
 b=dy0B2kFQacsCapqMk7k9MhWRjsvMjOFxboC/ITV0WDxR4jSLdopvmqw1vdVIIfNcCO1W85sX94SiQiZbhFqjJVZlzYoAF1cPhnIMid33pfxAEudTXXx+e3p5lhbOaQvq9lRX4wg9GwsR1Y9PRjO/GeeTcEERxmkACdhEQHH93m/ocEGIbSmjyqDX7WTgTZS3XreJAf2B+zmHw7bUGYKhxO+Kbj9AFF2R5DBK5+31geXN9DBoAZATn4HjmiD9FOaRTDPbWYWZdpPgl5KNJa06HJv4cKu1eUB0wZZw+Be0Hms2PBcX4+BDB4Kz9Dhqd3L5p0CfO8WAVCEX4Xo6O8Pdgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPrUd5y4CoQT3tjVbKqKfwUxiEkYIunGbp0KoOUbQiw=;
 b=ZOij5C5P1ckw6n/xzSyjdbAHEAOLveeu+wHwg8ZrsF6iOZewE9G7+/TA7RNZUorHE7B3U3ylJh1HlXJ/0XThr/NkoHzFZ2QPR/TYwMRmRFmCjqw10F1rVtYZS835kf00041CPbR0kxvNXvbN3FXOOfolItRvOocCKLrb1TmyjIc=
Received: from BY5PR04CA0015.namprd04.prod.outlook.com (2603:10b6:a03:1d0::25)
 by DM4PR12MB5964.namprd12.prod.outlook.com (2603:10b6:8:6b::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.4; Thu, 8 Jan 2026 18:46:07 +0000
Received: from SJ1PEPF00002315.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::70) by BY5PR04CA0015.outlook.office365.com
 (2603:10b6:a03:1d0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 18:46:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002315.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 18:46:07 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 12:46:05 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 10:46:05 -0800
Received: from [10.254.94.127] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 8 Jan 2026 12:46:05 -0600
Message-ID: <7bcfdb56-2e9a-4d38-a0df-f941907ae4a8@amd.com>
Date: Thu, 8 Jan 2026 13:46:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amd/display: Attach OLED property to eDP panels
To: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <amd-gfx@lists.freedesktop.org>, <harry.wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>
References: <20260106170017.68158-1-superm1@kernel.org>
 <20260106170017.68158-3-superm1@kernel.org>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20260106170017.68158-3-superm1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002315:EE_|DM4PR12MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: 425b40c2-9318-4cd9-889a-08de4ee62f42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|42112799006|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkJSRzZDSVljYTFMWUVPeWRDbXR1d2FWWXE2c0dLcE1BTWpwcjAyN0IrQk9K?=
 =?utf-8?B?OW9LdEoxTmVZZWlWY1prQlorNys4Z0dZZzdhbDRCWHAxcjdkT2YzcDFOVGlT?=
 =?utf-8?B?NTBoNXBuNkhEQ0tETFdaRHF5eG9hRldSRC9xRFhOKzlaUG5rYUp0eUt1dVpQ?=
 =?utf-8?B?R0xZTmpwRjVCZUN2TURLMFNKZjdoL1dFckJ5YkFuNnY2RFN0emZPb1QyeWJo?=
 =?utf-8?B?ck5UVElHZFd2Y2pST0lPNDdZQktkc1FOa1A5L29QWUl0dGVwN1NPam9oZXpZ?=
 =?utf-8?B?cFZVK3FYUEwrTktPVldXOXlHQ2FTYnhmYU5tN0QrSmhtUytoOEgycWVHbG5C?=
 =?utf-8?B?WkN6OUc3L3dZaWozUEl1V2NlTUVOYVRjQ2JhR1ljWkU1MGtubzdBTURZV3B1?=
 =?utf-8?B?aFdHakdHdkFXOStYWEt4Z3Y3ZDRuV0xIZ2U0NnVQNlZQZ1Jqbk53V2dMWnhT?=
 =?utf-8?B?THdKbkpPVExzN3RmTllzRzM0SzNXSTNmTERQNzFKUVVodVRjTG9mWngxNi9D?=
 =?utf-8?B?NTFMcEQzYTRSTXNCRFdhL21sS0FBZTVZN1FzV2I3NTdYRExYdWdPbC9aT1Rm?=
 =?utf-8?B?b3lETEFHNG8xRTJocFJSMVI0ZlloejF4aHlXQTZQbFd1V1BBVlZiLzJRQ0FT?=
 =?utf-8?B?bGdHSW5LYU9rRXZzcFpxRWcyOXFKQ1BaeFJtRDZrT0Z3eEtsQ05Md0FSNTVl?=
 =?utf-8?B?dEkrZXhEMUVxaFA1cnFZays0RlhRenF4VHI2S3pTYWdqZExZZzZrVVVmbXVV?=
 =?utf-8?B?eDlDRkR4bm5mbmpXYWZJTmU0Qys0YkRSR0JsOHBUeS8rb3ZIVWxLVUJQcVlH?=
 =?utf-8?B?U2dBNllSa0VtVHUwWk5tOEdRRCtZbmtrdTYvcFFTSUhlRk1OeFBYREd2Qldu?=
 =?utf-8?B?bE9UMGF2Y1FKZG95NSs4V0M0UHBVWDNsRkJUblQ0K2ZPQXo1bk9IVEN5UEZx?=
 =?utf-8?B?a0hDRHRCZG16VmdGRWR2K1dkRERzNklKSXRSSWpWNnJielpkMnlIWHhlbzEr?=
 =?utf-8?B?dXZZNFArdWM4cjJSZTNBblVueWJHTU55eERFQ25yK0psejdXaXRhbTFCcDh2?=
 =?utf-8?B?KzdtdjM0VTEvL0NIQmhEZ3hoU2ZDL3dIdDZFdGJZelpkN2JHOTlMVXBkKytU?=
 =?utf-8?B?UCszZVpka1U2UlJ1NHhOakFtb0h6ZUhUWVQ0dnc2ajR0bHh2a3hqRzRVM0NC?=
 =?utf-8?B?T0xTdllkdHh3NzNUUEY3cmhCUW93ZWZ4ck43YzhRcWdzeFN5dmJzbGVqQzg4?=
 =?utf-8?B?ZFNzaUtWaE44TVdIUVhUTC9jSUlHbnZ3bzlqTlF1RDEwYklFdTFUWWg5UHcy?=
 =?utf-8?B?bVdOdEcyditwR2l0YUpJcUdxZ3lKTlA1bm83WUlySmZVWWFZd2xnS2FmMGdW?=
 =?utf-8?B?VUFRY0F0SDhrWjlmVGE0MFdmbjZyMG8yMGRxUXlUUXQ5QWFWbWJYTDlSYWlr?=
 =?utf-8?B?aTZKcUNDbU0rRmZxU2tDUlVUYlZhK01xQWp4Yk9jQjFoeTIwLzlDWDhBVG9z?=
 =?utf-8?B?N3V6bXVPYkdiUGlsT1ZVYkhvOVFXSXBqM1k3TGx4QllaWCs3WTBrWStkNGNV?=
 =?utf-8?B?M3YyOWRTN3FFUmU2UDBnbTZadWU5dlFqRnBGQnd6ZW5RN2lSMmxoTW1RQ3FP?=
 =?utf-8?B?VGJ4VXJGQUJDOGxqSG5FSitJWjl6ZEwySzR1MXVLQzBMRXdlckoyeFpVQU8x?=
 =?utf-8?B?aWZNWHNaUHlwSk1rM0k4MExLNjY3SHV5M3RrZTlqbmJid2FJNmFJdU02Vy9Y?=
 =?utf-8?B?SXJscUR4UjlpM0JvdnRwcEFOSnpvTENNdjYyeTlMMEF4dm1zUllLS3dxaWo3?=
 =?utf-8?B?a3R2SWZVUXExNDM4bnRCODJvaERLWWY2U1JOVUFiZ2JnSlVvNUFwYkhKeWFP?=
 =?utf-8?B?UnFIYUIwTnA0emYvdHhMazdTVlNSRWlBN1BONG95c2J1NEd2aVZhTDVnUGI4?=
 =?utf-8?B?RHcyVWk3N1p6WDg4QjhsYjVwQkJpNDRYQkViTGNERjNQVm5FazMyNld1UzNk?=
 =?utf-8?B?V29yekNBNkRpUzlZU1FIRUFNQk5FSVNlWEpvOC84MEdPUlNOK0trRnhiTXgr?=
 =?utf-8?B?d2dJcmlpb1FsS201aVZmandpTzN0eEZ3NDJSWG1BTFg2bWl2VjM1ZDVQUEp2?=
 =?utf-8?Q?VjHI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(82310400026)(36860700013)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 18:46:07.4190 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 425b40c2-9318-4cd9-889a-08de4ee62f42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5964
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



On 2026-01-06 12:00, Mario Limonciello (AMD) wrote:
> amdgpu verifies that a given panel is an OLED panel from extended caps
> and can provide accurate information to userspace.  Attach a property
> to the DRM connector.
> 
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 35dbc6aba4dfc..1cac5ebf50a9d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -91,6 +91,7 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_eld.h>
> +#include <drm/drm_mode.h>
>  #include <drm/drm_utils.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/drm_audio_component.h>
> @@ -3739,6 +3740,10 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
>  	caps->ext_caps = &aconnector->dc_link->dpcd_sink_ext_caps;
>  	caps->aux_support = false;
>  
> +	drm_object_property_set_value(&conn_base->base,
> +				      adev_to_drm(adev)->mode_config.panel_type_property,
> +				      caps->ext_caps->bits.oled ? DRM_MODE_PANEL_TYPE_OLED : DRM_MODE_PANEL_TYPE_UNKNOWN);
> +

I think we'll want to pull this out into something like `dm_set_panel_type()`, called after `update_connector_ext_caps()` and any additional bits of edid parsing needed to make panel_type detection more robust. I suppose that can be a future task.

Series is
Reviewed-by: Leo Li <sunpeng.li@amd.com>

Thanks,
Leo

>  	if (caps->ext_caps->bits.oled == 1
>  	    /*
>  	     * ||
> @@ -9020,6 +9025,8 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
>  	if (connector_type == DRM_MODE_CONNECTOR_eDP) {
>  		struct drm_privacy_screen *privacy_screen;
>  
> +		drm_connector_attach_panel_type_property(&aconnector->base);
> +
>  		privacy_screen = drm_privacy_screen_get(adev_to_drm(adev)->dev, NULL);
>  		if (!IS_ERR(privacy_screen)) {
>  			drm_connector_attach_privacy_screen_provider(&aconnector->base,

