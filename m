Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4121C80406
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 12:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3A110E223;
	Mon, 24 Nov 2025 11:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="St/47C4o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013001.outbound.protection.outlook.com
 [40.93.196.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D452E10E223
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 11:45:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cScB1EjtXA6gVFGCdLWjbd8ztrPRtxab5p7JGeaW1OZTP4nCf5eO/wXZNzFo6mJzM3IeIX0kgAaoBZdI5yop9XjbMj3z5fVSbH5symmfubtsiViTrq2QTLPhdePaFsIhcT3KpyfMyEqjxVcuReX3nZpzte/XPvEncsMu5XNOnPLlR+V+EzOOUdlHy0goBw06b7Vujdg/ibTYlVjoDngexnM/PX7feI+f4LwbhzF6QftXF1fY0IFlGiwODgAUxxAxeszf4lQWbFvxGQ6JCyZsbcDleAzL+czcYdf5rY9selTybyR3WdT4CbzSumV2biqOKGYzR5e6vyjdbiLMd1AYBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6RTsW8buP1+FkGMG8CYH9uiMg+XGyHNObHRXjSCJII=;
 b=Ts152BS4RZ2suHm8+TOeJkDn07gp/7cFbvQz8s7gu37BRjUsKAqfFKlZBrH8BQDs0wWu8SZKOAO2NSGXZX4yM+oeScR36EwwYb5qvU5Gx2pxJ8yYXl5Fmbkt+drOM6i1AflxdeeChC4caoXgUwPyk41QfUGzJwxxjUiKz0p7kLqVjVipwkfRnqjYKdz0ppZOS7uKKwrHWMBA2ZbKJLcyctO71au9JGAeyOLasgdWd+tYM8SNJF2nXtaG9ilMWhud/oG42GpiL8Xw5HbbhQuC58lXoyQYy0y4OGKxv9ISH3/kODUYcUAMSBFfXsEV795Q1XnxNCvxi0uMo6U9j6Ju8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6RTsW8buP1+FkGMG8CYH9uiMg+XGyHNObHRXjSCJII=;
 b=St/47C4oXsXl/2oKzk1B7TGv/S+5QxjAKwuXR3rUEIPo5uuEqEN1UMYWy3mMhZX/cUPfY5VkO4zOsTXdvzDY6yeWQDculIFMnsHhMg+/AdU9V9puq09oa/8uYFLX3jRHTTbhB0bZq0l3gYfncXMlpfTkwASL8geb1v8bvTFfOFo=
Received: from SN7PR18CA0015.namprd18.prod.outlook.com (2603:10b6:806:f3::6)
 by DM6PR10MB4202.namprd10.prod.outlook.com (2603:10b6:5:222::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 11:45:00 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:806:f3:cafe::c2) by SN7PR18CA0015.outlook.office365.com
 (2603:10b6:806:f3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 11:44:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 11:45:00 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 05:44:59 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 05:44:58 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 24 Nov 2025 05:44:58 -0600
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AOBiqsq1847343;
 Mon, 24 Nov 2025 05:44:52 -0600
Message-ID: <c5b98cba-80cf-4659-9e3d-f11bafbfe0b9@ti.com>
Date: Mon, 24 Nov 2025 17:14:51 +0530
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
 <6a696e33-b855-4fc7-8325-304a009ed001@ideasonboard.com>
Content-Language: en-US
From: Harikrishna shenoy <h-shenoy@ti.com>
In-Reply-To: <6a696e33-b855-4fc7-8325-304a009ed001@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|DM6PR10MB4202:EE_
X-MS-Office365-Filtering-Correlation-Id: 911907f9-32f4-49c0-d0eb-08de2b4ee62a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|7416014|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjR4eVYxLzd1S0pFbnlaS3M2SkR3Z1VuN0FJS21MdVdJZm80NU14dExVWWcw?=
 =?utf-8?B?MUQ2c3MxTkNOUTBtQzJRUVc4VEpCOEFYUUltQ1ZsV2NERHBVQjRhQVNSZWJT?=
 =?utf-8?B?VE10UzI4WVJ4em8wcG5adm5ndU9SMnhFUEpnRFpoZyt5OGEzQUxEeWJxdlFL?=
 =?utf-8?B?Q25XbGRGMWVGM2lZV2VIRU8rT05uUERFY2JWNDlaVDBXbGlLRUlGYVZwRXR3?=
 =?utf-8?B?MW1DUlo4K3pwMXVUUDV6YVlieTNrSDk3UW9FN0l2aUdLZkVXZlZSSSttN1FG?=
 =?utf-8?B?LzBkbnRvYlM5OVhJWFBWRVJkMEE3aVpBa29ML3E1TFRRQXRzRE5OT0xmTGkx?=
 =?utf-8?B?YWtEY0tqa1BDVHRNLzhOMkllaFpVUWVVZkM4T3pmMUpNVmphTkVwZThSQXZ1?=
 =?utf-8?B?N25EWXBwSEVzeUw0UDFaZjZtUUlrbmdnOFlzMFlmY2RKSDRUUi9NdForMC9a?=
 =?utf-8?B?Y3BGMWZrdjJvcDlpZ3p3cXc1M3ppZXZzRi9oZjR5M3NHSThFK2Nhc0R6aTd1?=
 =?utf-8?B?V0daaFcyZUhMWkRZUEQwYUJLOFRsK2lZZEpIOFJoMDE2eFNDWWdoWUR5ZS9h?=
 =?utf-8?B?WFgzUS9RaXZSdmNiaUlUcnJHL1N3RC9nbVNyRC9YM2w1ditvaXpCNGFiclBX?=
 =?utf-8?B?anN5YnQwWHZIYi9TbzJjbjZIanZ6dktvRnNWM054YWp3QlIxUTJPQWx0OTBS?=
 =?utf-8?B?aTI4V2N4c3RRaEFMVk11VG5oMWYrOXVYVGRla2NLSXY1L0kycjdSSjhMdVIv?=
 =?utf-8?B?akNsNm0wdWN6eWJZQ0UvbVRYbTV4bTNEQ3NyQjQ1MWZEZDhSdStkd3NBTXYz?=
 =?utf-8?B?RG83WVRjblZqcno5ZmNHVlJ0bGk5QnBBb0pBaFJvNjdWY3RJSHhIamw2VWw4?=
 =?utf-8?B?WmdDM2U1M1g4Yk5tMkFYdmxHUE5qYTVQaFROWlh6TVVaWkVBOTBGamJlWWFG?=
 =?utf-8?B?MjBkS3Q1V2Z2aE9EUENvQit2L3hYeEc0am8wSWQxTGpoRGw0OGw5WVJyV1V1?=
 =?utf-8?B?RkVVY3ZMWGt2UlFVM2g2SzkxL0wxYVRhaW1UczkyLytOZnR4bjlhbVNLMm1V?=
 =?utf-8?B?VG4zVzhDRkU5N3VabklnZEkzaEcxRlp3d29yaW0xdVh5NXRQUlg1RjVFTjNn?=
 =?utf-8?B?R04yNnAxSjRHVnZtU0l6eVBZeVZFUW5ZOVZ5ckhwVG9WMThWdy9FZkxFMjRv?=
 =?utf-8?B?MmtYYy9XRzZjQUhRMVRIeEszRjRrdTR4OWZLSmx1c1FoaldRb21sMERPMGRE?=
 =?utf-8?B?YzNOTjNEMUFCMWdJNEhLaDJLRCtDN1RSUjhMMlR1dmt2WEtwMjVKZ3RWc21v?=
 =?utf-8?B?RWpnQWRkSE5PTWI4cWFqT0M4NFFUYy9kSTZ4Sk5pWlhTc0ljeUNTOHhMTzFB?=
 =?utf-8?B?OW5IVDZ3RUR6ZWRxaG1GVTJGUjJBaEVDSjI2bXdoa1c0YXJDaVZNbERCMUZJ?=
 =?utf-8?B?Z2lWZitFakRLUFFycHdqYm1UM1k0VVJGaFhvSC9hVklPUDF2M0VFMGpFdC9X?=
 =?utf-8?B?RGlqK0pOMGsyUWV0ditwajNQZzNsaXR3WWNSTlVUMEZVSXZ6NXU3NW11YjlR?=
 =?utf-8?B?Vzh5Mkh0bFl0OEhVK1NoaGxPZ1FHU0syTGh4VENFd0ZUMTZDU1R2TFUxRStI?=
 =?utf-8?B?N3R4d0N5cDdOQjhSOVpTL2RIS2k5TTRVRDBMYUhXbFAxK0haWmJRMUo1MCtJ?=
 =?utf-8?B?eWxkM3p0M1N5T01KQmRDRkIxVnhHNE81bzRMMnJ5eHFLSGFPNWRuNnBYdkpT?=
 =?utf-8?B?djFrVmN0T3IvY3AwM01ab3RyMGRxcU0reTE1K21aN2FUY0kwemtkMjFFTHo0?=
 =?utf-8?B?UmMxdlFCMks3TmpzdUZsL0hTYldmbzNXcnM0OHZlbzdPcXMwZTJGaE8vVStQ?=
 =?utf-8?B?LzR2NjhZd2J4UksvcXRIeUtoQnRNT0JDUTM4WmRNNkFoVWROalJadk43Q0NU?=
 =?utf-8?B?NGw2Nys2SzcxWGpwQ0lKaDFoQkhwRFo3cVRVQ0JDcHZEVUZtYU5LYU1jdjY5?=
 =?utf-8?B?amdhMjBzMzlibGM0UkpxVzRLeFVKVk05NlNGOWdCL0FDeFdaRlRGOWM5UnE1?=
 =?utf-8?B?L1ZFMUc3dVNGWjViTlNrN1FERG9leUdCekRWRUlCbm9hQU9ScWJFQXkrcXNl?=
 =?utf-8?Q?7/c0=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 11:45:00.1478 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 911907f9-32f4-49c0-d0eb-08de2b4ee62a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4202
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



On 21/11/25 18:42, Tomi Valkeinen wrote:
> 
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
> 
Hi Tomi,

> This code looks odd, and there are a few other similar if-elses too.
> What does this do?
> 
> Correct me if I'm wrong but:
> 
> With DRM_BRIDGE_ATTACH_NO_CONNECTOR, connector_ptr is set at
> cdns_mhdp_atomic_enable(). If connector_ptr is set, I assume we also
> always have dev there.
> 
> Without DRM_BRIDGE_ATTACH_NO_CONNECTOR, connector_ptr is set at
> cdns_mhdp_connector_init(). If it is set, we have called
> drm_connector_init(), and dev is valid.
> 
> So... If we have connector_ptr, connector_ptr->dev is always set? So no
> need to check for the dev.
Yes this is correct, will remove the redundant checks here.
> 
> But overall I'm confused about the 'else' block. Why do we have these
> code blocks that (in the current upstream code) check for
> 'mhdp->connector.dev' (I think that's checking if the
> cdns_mhdp_connector_init() has been called), and then, e.g. here, call
> either drm_kms_helper_hotplug_event() or drm_bridge_hpd_notify(). I
> don't understand what is the idea here.
> 
For the else block, in code I can find some explanation in 
cdns_mhdp_irq_handler function, but not sure of reasoning behind the
'else' as even in 'if' condition check is for connector but inside the 
block drm_kms_helper_hotplug_event is called with bridge.dev.

> Also, in the above case, the code checks for 'bridge_attached'. It is
> set in cdns_mhdp_attach(), after calling cdns_mhdp_connector_init().
> So... If bridge_attached is true, we always have a connector if
> DRM_BRIDGE_ATTACH_NO_CONNECTOR is not set. And if
> DRM_BRIDGE_ATTACH_NO_CONNECTOR is set, we never have a connector,
> because it's set only in atomic enable.
> 
> So the 'if' is effectively checking for DRM_BRIDGE_ATTACH_NO_CONNECTOR
> flag? It still doesn't explain why we need to check it here.
> 
>   Tomi
> 
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
>> +		state = mhdp->connector_ptr->state;
>>   		state->content_protection = mhdp->hdcp.value;
>>   	}
>>   	mutex_unlock(&mhdp->hdcp.mutex);
> 

