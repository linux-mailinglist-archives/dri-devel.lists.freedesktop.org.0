Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AB2C80397
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 12:34:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7F310E222;
	Mon, 24 Nov 2025 11:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="vDW2YlPr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011053.outbound.protection.outlook.com [40.107.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45E010E222
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 11:34:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jp6/O4j6pZSMqmTb+yQZ11pf+PfNOElT3QmFdRzy+OpdQtJhH2zT1ibCd9fJmtGK1cq0iOyy0QmC3QQ6B6aAODdzh8KkEfWELFapciBi595rpj7doSARdRSKxW8UTAhXhOvn1vcs2TZnHY3nJA7KT5xN68tpGxnvCD+Cs0kHzk+QjjM9wEOi0+z5rF6CD+XbajMWJpzbzf7/VbYigFzVZSRtw5urlMV6xvlC+w533mKpiPLCzLaOCtGDBR/5yF+bNOxLK3rqLOm9T5xpaemVAE4yNd/Hd+ooauLEDCJIHtmUHZ5GFIsL+EN+xkWd0El81kVV1Q0+SoFN1im9mo3PUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQvp4WZl4U661jPAnIr3XcLET2X8V+G3W/hkxZZsBdA=;
 b=CrJGXTBN+6RLg3fSf/dFrE/oH9dGODHgurBHLnxHbXofFf4cZhBkHDmOwpx45oE9qDcnOYtK/YVGHyEOMfxM2wGzPp+qmK9M/KznQcb9RW+Fw13dT7gURrnWvg94oSDrcKlN3cAxy5au/zlbv6iCU5/QlLfHHzShXZ9W2oKRR5Ai9NRMQRSGMtPieYnpikuHNJryLM0+R6YWFOhGYwGa0BDBV//taD5ZXlSVmc/wNZVh2jnCr3sLzTO2NsbYoxZRbYdUV8uFRnkIL25CNysvzP1uJOQTBRDdJ2bWY87kBSaP/8CnAmGtDnMD+u0yVZnzvXORmPjeteRbZSV8vW3wEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQvp4WZl4U661jPAnIr3XcLET2X8V+G3W/hkxZZsBdA=;
 b=vDW2YlPrrhq7bTjqP3swAAvGzUF/ALGocx7hkc+JQbqSb/CymHrLxgwo/my9OUXLnfgcZm8a4/8wsVbc1QsjHzpIau96VnyeZ++dafzPOqYEwT4jMDnp7/2nv1B9Seyo3qeM4F0l82SncziGkJM+CQv0Osqes3/ix3MyMXwqt6g=
Received: from BN9PR03CA0878.namprd03.prod.outlook.com (2603:10b6:408:13c::13)
 by IA0PR10MB7602.namprd10.prod.outlook.com (2603:10b6:208:488::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 11:34:43 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:13c:cafe::a3) by BN9PR03CA0878.outlook.office365.com
 (2603:10b6:408:13c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 11:34:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 11:34:43 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 05:34:43 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 05:34:42 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 24 Nov 2025 05:34:42 -0600
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AOBYace1877379;
 Mon, 24 Nov 2025 05:34:36 -0600
Message-ID: <647b88e8-4985-410d-89ac-aa575e174f95@ti.com>
Date: Mon, 24 Nov 2025 17:04:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v9 1/6] drm/bridge: cadence: cdns-mhdp8546-core:
 Set the mhdp connector earlier in atomic_enable()
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
 <20251120121416.660781-2-h-shenoy@ti.com>
 <9a041a93-c004-40a9-b94e-ae3fce339145@ideasonboard.com>
Content-Language: en-US
From: Harikrishna shenoy <h-shenoy@ti.com>
In-Reply-To: <9a041a93-c004-40a9-b94e-ae3fce339145@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|IA0PR10MB7602:EE_
X-MS-Office365-Filtering-Correlation-Id: 04b1a734-9164-4770-29ef-08de2b4d76ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|7416014|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eU52YnJHUy9LMWcvWWp0K3MvNkdMaHhVYkFUbkU2c2Ywdm1IZzlzd1NwdmVu?=
 =?utf-8?B?NGE0UkQzbkZCVk00QUNGYjZnUWhqQUI1TW9OTklRbWRJQkh0SzNaMkcwYjlq?=
 =?utf-8?B?RnlMYndTaVpGMWlYdkpEUWhvVXFYTjVoY2tBSjgyaHNZUHU4VmZVTWNDS09j?=
 =?utf-8?B?Rm83TlhBUUdaK3ZzVEpyWUF3Sk1EYjJUcVpMVjhaQmtrZ3JSc1h3bTlLeTh5?=
 =?utf-8?B?YlFuSmhzMC9vUkEzdC9DYitwREdaWFF0N2RkN2dXOU5UVXRDWS9hbElueVlt?=
 =?utf-8?B?K3cyYnRJbUVTZytyTVJqT1ZBTXYvTlUvQi9oT2FvUC8yK1IwT1JoR0hzV01k?=
 =?utf-8?B?dEFEU1lyckxLWGpWdE9nV1dSSU5qazhWTDhRVzFKRWVKeENNOFRmTDV5OElt?=
 =?utf-8?B?dXVTQlgxUHlkTFRBSFBkb1FpZzlwc2t0MnMydHErTzUyS2Y4MmdlZ3JadEN1?=
 =?utf-8?B?Z01pL0cyWDFqRExpQ2p5WnpJejh1WnlDSWZ1MFFGR21ua2o5UUpsUlUwL1R3?=
 =?utf-8?B?SHdHYUxFdVpUUjQwTFBjSHNWN2pON3hqdjNvWUt4QzlaeE8vQUQwbFZJVHNU?=
 =?utf-8?B?dWFCMnZJcmNoTFN3Rm5JRWZOQ2d1NVRRMWJ5Y2hQL1NMYnp2VjIzdHhlbFlL?=
 =?utf-8?B?OUJzT0pBVWprVWlLNkJhbS9STW9LNGZjUGRqRVJwWVd2YlhtVzExbmtLNkhz?=
 =?utf-8?B?Tmhwd2h5bHJ6cHhUUlNhTWh2QWZXN05ZeFpPeUdON3pUTFArU0I2VGQ3UHBD?=
 =?utf-8?B?alN5RnZaZ0ZaSnpraWRScXc1UGx0Y1JIc252b1NMbnNMSThqa3AwZUNmd3Yw?=
 =?utf-8?B?UEJTTHFJOWE5UzR2R2xSZTBFRk1yQWhjMytGckhTcThuNGtGYkJCRStRUnNl?=
 =?utf-8?B?aUZoZWdjM25Vd0dCWHFuRjVTdlg3NmZHWmZ2dC8yOHl2VUswdWhqdlZ1Q0lP?=
 =?utf-8?B?Zk9FZFVnd0duTXlQdWg4Y0hUMVRyTFBtY21XS21xcnQ0ZTIwY2RDK1NzVlpx?=
 =?utf-8?B?Vy8rcWtzaVN5RU5pTXRHZm02aEI2Sml4dUlzeDRaajlsa2RsQUE5Zyt3QTFB?=
 =?utf-8?B?U1orMEpXcFhJL0hOOS8xc2p5L1M5cGZRK3lzT1Zuam1icENnN29XU0JFREhw?=
 =?utf-8?B?YzBtNG5MNWtHeGlFOCtCYlJZRW9QbDdGMEhoZXJqaDJ0VUJFMVFESE1SeVRS?=
 =?utf-8?B?bVhVYW5rbG92WjN0MHNxMGc2bG5KdS9mR2Z1WXIyY3lOSldlY3Q5bTdOeVV0?=
 =?utf-8?B?TXQwbTFyVDVRUEphakxWZzVZSUhaa2Ezcm5WWFRGdzJIZW9LcW1nWDBMWGxL?=
 =?utf-8?B?SkZ5dytrMkpJWHhxQVE1WGoxWCtwYlhGdGY2OW91dWQ3K25FaVd5dWRmODEr?=
 =?utf-8?B?TUVPa1I1ckxYUWFSaUFpWU1FVTBLYjRxNjM1cjFVcDRPWkY3c1dYVzZiSzdh?=
 =?utf-8?B?MTJyRGYvVU5uZldmSU5UQjNQZVpTLytJSUN5RXhLSXRaOFU2QXlWeHQ5Rk5m?=
 =?utf-8?B?eVUvT0lKbDNDRE5HazhGRG14bVNyMkNLdlJTU1krRFViajR2d3lqa3hMd2tn?=
 =?utf-8?B?UVRiU1ZaSUxRQk4xcjdZdmhJSTFFajVYRWFYOGMyUUR4NUNrVXZISitpTkV2?=
 =?utf-8?B?dWlsWEVGVyt1ekkrYmVNeGI1elN4M2tCbzgyditjQUpJWjVzOGpwNXQ5ZFBJ?=
 =?utf-8?B?cXNJLzJjWlcxcmJITHplUnF0TUlTSVFTMUM0T0cwdWExbnl2eUtwdUFyTG9o?=
 =?utf-8?B?ZngxanpqS3YxVUw0Y2NhTjUweU9sZXJiaDBaUC82MHZCYzBmbmR3aHcrVUJ0?=
 =?utf-8?B?Z2hJSFplcWJ0NVIvejBKS1N3Z0lyMlNobXdYaTBRb0EzWlhYOFJXWGIwS1dR?=
 =?utf-8?B?MXlsa1ZsMWExb0tvdnNOZ3NNa2YxamNwdE45c2JBWXpIRzJNK0xKdEhZeEVi?=
 =?utf-8?B?RE1HM2xINVRlMm9JVVltM2laSlkrY3pQWnVRcDc5VzFjUnVXNDR3SFhtQTdz?=
 =?utf-8?B?YWJGRGQ3SzFtZTlIYWxaTFBWZm11ajBaZHl6MkFzK3FEV0xJV2lydk5Id1A5?=
 =?utf-8?B?bHVtMG43ZGVJMVM5YmsyMGs5dlVhVkN2c1hlbVlzSU52M0tIaGJYd3Rhd1Zv?=
 =?utf-8?Q?VEGw=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 11:34:43.5554 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04b1a734-9164-4770-29ef-08de2b4d76ae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7602
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



On 21/11/25 18:11, Tomi Valkeinen wrote:
> Hi,
> 
> On 20/11/2025 14:14, Harikrishna Shenoy wrote:
>> From: Jayesh Choudhary <j-choudhary@ti.com>
>>
>> In case if we get errors in cdns_mhdp_link_up() or cdns_mhdp_reg_read()
>> in atomic_enable, we will go to cdns_mhdp_modeset_retry_fn() and will hit
>> NULL pointer while trying to access the mutex. We need the connector to
>> be set before that. Unlike in legacy cases with flag
>> !DRM_BRIDGE_ATTACH_NO_CONNECTOR, we do not have connector initialised
>> in bridge_attach(), so add the mhdp->connector_ptr in device structure
>> to handle both cases with DRM_BRIDGE_ATTACH_NO_CONNECTOR and
>> !DRM_BRIDGE_ATTACH_NO_CONNECTOR, set it in atomic_enable() earlier to
>> avoid possible NULL pointer dereference in recovery paths like
>> modeset_retry_fn() with the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag set.
>>
>> Fixes: c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
>> ---
>>   .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 29 ++++++++++---------
>>   .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  1 +
>>   .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   | 26 ++++++++++++-----
>>   3 files changed, 34 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> index 38726ae1bf150..f3076e9cdabbe 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> @@ -740,7 +740,7 @@ static void cdns_mhdp_fw_cb(const struct firmware *fw, void *context)
>>   	bridge_attached = mhdp->bridge_attached;
>>   	spin_unlock(&mhdp->start_lock);
>>   	if (bridge_attached) {
>> -		if (mhdp->connector.dev)
>> +		if (mhdp->connector_ptr && mhdp->connector_ptr->dev)
>>   			drm_kms_helper_hotplug_event(mhdp->bridge.dev);
>>   		else
>>   			drm_bridge_hpd_notify(&mhdp->bridge, cdns_mhdp_detect(mhdp));
>> @@ -1636,6 +1636,7 @@ static int cdns_mhdp_connector_init(struct cdns_mhdp_device *mhdp)
>>   		return ret;
>>   	}
>>   
>> +	mhdp->connector_ptr = conn;
>>   	drm_connector_helper_add(conn, &cdns_mhdp_conn_helper_funcs);
>>   
>>   	ret = drm_display_info_set_bus_formats(&conn->display_info,
>> @@ -1915,17 +1916,25 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
>>   	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
>>   	struct cdns_mhdp_bridge_state *mhdp_state;
>>   	struct drm_crtc_state *crtc_state;
>> -	struct drm_connector *connector;
>>   	struct drm_connector_state *conn_state;
>>   	struct drm_bridge_state *new_state;
>>   	const struct drm_display_mode *mode;
>>   	u32 resp;
>> -	int ret;
>> +	int ret = 0;
>>   
>>   	dev_dbg(mhdp->dev, "bridge enable\n");
>>   
>>   	mutex_lock(&mhdp->link_mutex);
>>   
>> +	mhdp->connector_ptr = drm_atomic_get_new_connector_for_encoder(state,
>> +								       bridge->encoder);
>> +	if (WARN_ON(!mhdp->connector_ptr))
>> +		goto out;
>> +
>> +	conn_state = drm_atomic_get_new_connector_state(state, mhdp->connector_ptr);
>> +	if (WARN_ON(!conn_state))
>> +		goto out;
>> +
>>   	if (mhdp->plugged && !mhdp->link_up) {
>>   		ret = cdns_mhdp_link_up(mhdp);
>>   		if (ret < 0)
>> @@ -1945,15 +1954,6 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
>>   	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
>>   			    resp | CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN);
>>   
>> -	connector = drm_atomic_get_new_connector_for_encoder(state,
>> -							     bridge->encoder);
>> -	if (WARN_ON(!connector))
>> -		goto out;
>> -
>> -	conn_state = drm_atomic_get_new_connector_state(state, connector);
>> -	if (WARN_ON(!conn_state))
>> -		goto out;
>> -
>>   	if (mhdp->hdcp_supported &&
>>   	    mhdp->hw_state == MHDP_HW_READY &&
>>   	    conn_state->content_protection ==
>> @@ -2030,6 +2030,7 @@ static void cdns_mhdp_atomic_disable(struct drm_bridge *bridge,
>>   	if (mhdp->info && mhdp->info->ops && mhdp->info->ops->disable)
>>   		mhdp->info->ops->disable(mhdp);
>>   
>> +	mhdp->connector_ptr = NULL;
>>   	mutex_unlock(&mhdp->link_mutex);
>>   }
>>   
>> @@ -2296,7 +2297,7 @@ static void cdns_mhdp_modeset_retry_fn(struct work_struct *work)
>>   
>>   	mhdp = container_of(work, typeof(*mhdp), modeset_retry_work);
>>   
>> -	conn = &mhdp->connector;
>> +	conn = mhdp->connector_ptr;
>>   
>>   	/* Grab the locks before changing connector property */
>>   	mutex_lock(&conn->dev->mode_config.mutex);
>> @@ -2373,7 +2374,7 @@ static void cdns_mhdp_hpd_work(struct work_struct *work)
>>   	int ret;
>>   
>>   	ret = cdns_mhdp_update_link_status(mhdp);
>> -	if (mhdp->connector.dev) {
>> +	if (mhdp->connector_ptr && mhdp->connector_ptr->dev) {
>>   		if (ret < 0)
>>   			schedule_work(&mhdp->modeset_retry_work);
>>   		else
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
>> index bad2fc0c73066..a76775c768956 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
>> @@ -376,6 +376,7 @@ struct cdns_mhdp_device {
>>   	struct mutex link_mutex;
>>   
>>   	struct drm_connector connector;
>> +	struct drm_connector *connector_ptr;
>>   	struct drm_bridge bridge;
>>   
>>   	struct cdns_mhdp_link link;
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
>> index 42248f179b69d..5ac2fad2f0078 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
>> @@ -393,8 +393,10 @@ static int _cdns_mhdp_hdcp_disable(struct cdns_mhdp_device *mhdp)
>>   {
>>   	int ret;
>>   
>> -	dev_dbg(mhdp->dev, "[%s:%d] HDCP is being disabled...\n",
>> -		mhdp->connector.name, mhdp->connector.base.id);
>> +	if (mhdp->connector_ptr) {
>> +		dev_dbg(mhdp->dev, "[%s:%d] HDCP is being disabled...\n",
>> +			mhdp->connector_ptr->name, mhdp->connector_ptr->base.id);
>> +	}
>>   
>>   	ret = cdns_mhdp_hdcp_set_config(mhdp, 0, false);
>>   
>> @@ -443,9 +445,11 @@ static int cdns_mhdp_hdcp_check_link(struct cdns_mhdp_device *mhdp)
>>   	if (!ret && hdcp_port_status & HDCP_PORT_STS_AUTH)
>>   		goto out;
>>   
>> -	dev_err(mhdp->dev,
>> -		"[%s:%d] HDCP link failed, retrying authentication\n",
>> -		mhdp->connector.name, mhdp->connector.base.id);
>> +	if (mhdp->connector_ptr) {
>> +		dev_err(mhdp->dev,
>> +			"[%s:%d] HDCP link failed, retrying authentication\n",
>> +			mhdp->connector_ptr->name, mhdp->connector_ptr->base.id);
>> +	}
> 
> This looks hackish... What's the point of printing the connector name
> and id anyway? For MST? And if we don't have a connector, is there any
> point in doing anything in cdns_mhdp_hdcp_check_link() or the other
> functions that have similar prints? Or why would they even be called?
> Are they ever called if we don't have a connector?
> 
> I think for now, it's simplest to just drop the use of connector_ptr
> from the prints, instead of these odd if()s. Or assume that we do have
> connector_ptr, if the driver is designed that way.
> 
I think we should ignore hdcp until connector_ptr is available, as hdcp 
work is initialized in work queue in probe, and a delayed work is 
schduled every DRM_HDCP_CHECK_PERIOD_MS, and connector_ptr is enabled in 
atomic enable so connector_ptr needs to be checked at the start 
respective hdcp functions.
>>   
>>   	ret = _cdns_mhdp_hdcp_disable(mhdp);
>>   	if (ret) {
>> @@ -487,13 +491,19 @@ static void cdns_mhdp_hdcp_prop_work(struct work_struct *work)
>>   	struct cdns_mhdp_device *mhdp = container_of(hdcp,
>>   						     struct cdns_mhdp_device,
>>   						     hdcp);
>> -	struct drm_device *dev = mhdp->connector.dev;
>> +	struct drm_device *dev = NULL;
>>   	struct drm_connector_state *state;
>>   
>> +	if (mhdp->connector_ptr)
>> +		dev = mhdp->connector_ptr->dev;
>> +
>> +	if (!dev)
>> +		return;
>> +
>>   	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
>>   	mutex_lock(&mhdp->hdcp.mutex);
>> -	if (mhdp->hdcp.value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
>> -		state = mhdp->connector.state;
>> +	if (mhdp->connector_ptr && mhdp->hdcp.value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> 
> Earlier in the function you check if there's a connector, and if not,
> dev is NULL, and there's return. So the code can never reach here if
> connector_ptr is NULL.
Yes agreed, this is redundancy, will update this.
> 
>> +		state = mhdp->connector_ptr->state;
>>   		state->content_protection = mhdp->hdcp.value;
> 
> The only real thing this function does are the two lines above.
> 
> So I think you can just :
> 
> if (!mhdp->connector_ptr || !mhdp->connector_ptr->dev)
> 	return;
> 
> (or something similar) at the beginning of the function. Or should it be
> inside the connection_mutex, this one is a scheduled work...
> 
>   Tomi
>
Yes, will take this approach for handling connector_ptr in HDCP functions.

Thanks.

> 
>>   	}
>>   	mutex_unlock(&mhdp->hdcp.mutex);
> 

