Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D387D847495
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 17:21:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 139E210E7D8;
	Fri,  2 Feb 2024 16:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KWxniq+6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6074610E66B;
 Fri,  2 Feb 2024 16:21:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7prWDVAa5Fy/H+uvRuFiC7iLnSlIumDObZ72X7n9knyI2uqko4+6yIctEe0iKtj3Fa9r9WxGUoRKcsBF7QzjbeGj5APU/QRpfCuMuga9mveqk+JPCR5WMYcNqCt71f2VdWxvMw7FgGrR+r5g2/FZpC2y0CMER0OOOQMH6t7vIt/mHxyF97IZ25GZ8gViaFS/ZGmQAa6DSoUjEym1BIrR8qd69JHXOHpzKRr0SfoqpZwhA/uEvCqx7kxMhdHWqxB0aHbfMmhBStJglbEqTycGE7rY4mBJR/GGdOk9DApo0KUQxpY9agH7p110pPo4gwFQK0wWFRpnWPf5VttXyhnXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcS1ewfbzPPr7dW1RsF7tEc6EdIi17/Rr/UTvDHHhMU=;
 b=T3QuZqQunQVifvY/Oz49Vn2tudM7iqbnKngcjKiTwcmb6oNQA8dPAh/io/576YFMASQC6DRIYUXp6MFcPr8xtEHhKm/2UEhjOKL/B0+JyAknBNxnmHBFayIe+IIhQxEuptxwlkP8bK1BGSpeNj2tN4FkpIpbEnyXbrh1/EhDGLlFZYQ2yBJOegSCKG+3xPYSBcyTVUP7WcybQJMwod3kX0kAujlZ1C/iZw9381SSjjj0t6mSgwTUkJ5a6TapAipVrCa6NEt7Lp2zFONzIaAXMTmYoH1LW4GVP6VqO9NwD4tfAdNgXLapB3mOSN8Waf1feulcgUCvS+7F1bHiWBXw3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcS1ewfbzPPr7dW1RsF7tEc6EdIi17/Rr/UTvDHHhMU=;
 b=KWxniq+6YHFrieg0zqwSoxno13QEWmzZHgTa/y1z0CaqTZFgC+p/1tBajPzjMwNvFCcPtu2qdQvKDyR/Ygka/l+cs4UMQwPgW3cW8oBg7nSOY2e6TYXizzVWfwaxRK2LJrS9p2A22TVZlf+F1EjDr1snf5QMLt/csAeyHJvrrFk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW4PR12MB5644.namprd12.prod.outlook.com (2603:10b6:303:189::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.12; Fri, 2 Feb
 2024 16:21:01 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64%4]) with mapi id 15.20.7249.024; Fri, 2 Feb 2024
 16:21:01 +0000
Message-ID: <0b94b25a-9ffa-41a5-b931-ad84e1892d36@amd.com>
Date: Fri, 2 Feb 2024 10:20:58 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: add panel_power_savings sysfs entry
 to eDP connectors
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Hung <alex.hung@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240202152837.7388-1-hamza.mahfooz@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240202152837.7388-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0230.namprd04.prod.outlook.com
 (2603:10b6:806:127::25) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW4PR12MB5644:EE_
X-MS-Office365-Filtering-Correlation-Id: 22b5e6b4-e07f-4487-138e-08dc240af245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xs5ZdwLQhmK6kTpqXr8itQoSgJim59tQhYU39R8IGMWU8tmjVIqvnCFj0r3pe67BYRReRFyZ1Lni7RRqKVOY1E8XlYRCWEF1bN4H36VPeczUF4WY3wtBubwc5DAsethnL5hRSHBJtNb5H0h80ya8isGA4t2nb4T4K+QeA+9NuDYmuihIKbtZUA/+DjCxz7iguX7fSHOXjxzWS5yqBR65vNiE4YftvBwCRDdP+9gvDA8jtOGtu+9X112YQVN9lERp0hFVJiMgHO7LgwcuffVhBapMTjCDVxSxknNrjFNC3ECUxTxddAo3bWwEzD1v0/pnS80aezHatHlbDVgpXbhIArKPOB7qav5fiqWd+96UDSNNMHIyezXTBxgEBlX9gvYdSxSsmKLLWWleG7X++Pljr+WX2o98glNcAW09+zh9ytirNvqGNTw1Sj5Wd8njU812rY3NRcDTiKAMzmtQWut4ZSpaDqyxofciUqI3nW1gIu3WfPJifA2xA2sCN0hHHOnraB9teduEJJg5MxAR9jHUI2+CKtINsbsbAr8eA7infbrCBoFYxxqYvQX/I0bcSGnKAh/k9xBDKhas7lpddckG8bgxIn3GxXvSuOG6FZhuWtTNp9mGIynyPmH13neN4qqibW4OFU6I9lyh1Wm43VLnKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39860400002)(136003)(376002)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6512007)(6666004)(6506007)(53546011)(26005)(2616005)(31696002)(4326008)(8936002)(8676002)(316002)(66476007)(54906003)(36756003)(66556008)(44832011)(5660300002)(2906002)(66946007)(86362001)(41300700001)(6486002)(478600001)(31686004)(83380400001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVpkTGNHZ0tUTWFMb0RJVVlYUkUzUGZkVjlkWVdoMmYwVERkbTh6S2gzd2Q4?=
 =?utf-8?B?K1hYMGRnSVZSaksyNE5NczZmY3ZCa0xscklGck9yRmtWaitaNDlMU21MOE8z?=
 =?utf-8?B?YkNCVUdaL25KRmE4c0grZnUvT08zUldGQ0dOMkxsb1JyQmxuU2FjdW4xa0Fu?=
 =?utf-8?B?bS9xRTR3eldVVjgydG9raFVNZGY0cU1SeWMvWWEzVndzQnZxR1NqZzVId01a?=
 =?utf-8?B?dHVvYmNqck9QTEVEclZHalppU0t1cHhMb0RBdnBZV2UwRHlUSE5tUGRZQkl5?=
 =?utf-8?B?U0szUmFwZ1IrRk1obU9lclhwelR4NWlOcWowSFZZMk05SnZ2U0FEaTB0b01Y?=
 =?utf-8?B?ZWJXVWFqdlk1QjFHdDIxdW9adEZkNUN2enk4dUVHcnNZa2s4c3VzbDhZUjFw?=
 =?utf-8?B?b1FoUlBkdzJwOGo1K2ZZU2FwUkZ5QXhqcEhVWDdHTnl6dXNIUW0zaVJ6ZHls?=
 =?utf-8?B?QUhsWFFNQS9BTHhBOHRJR2c4MWpYYStQYUlyMDJkYUJCYytUZ1VTdk9uL3dI?=
 =?utf-8?B?aHJkSXc3cTlISElvYTVxaUh4MnVoMlQ4YjhqVTdsOVVPSS85RFNXSHViVzY2?=
 =?utf-8?B?eGh4U2lROFF0dDY2NmtpN0dHK1BFdlVPcW1YbDUrY0p2UmVHV1RwSVhTQjBM?=
 =?utf-8?B?Y3BhSTh5WSsyb3VKc3VyeitVNWg3MG9LT2xHYW0xSTJZNEgzOXNNMkk0VENa?=
 =?utf-8?B?amN4a2UrSFI4M29WUjh5RnhCK0VlczZlbmlNZWN6T0Fhd0RzUU9LcTBQK21O?=
 =?utf-8?B?MytSblhPc2N6eGNkSUQ0VitQY1F0ZGJ5eTBSZTI0ZW9uMWV1czNLcS9Sd0hp?=
 =?utf-8?B?aHY3QWtSUXhnc2o0Nzk1bG5DV2s2Z0dpbU5KZWlCalRodzMvQVA1QXh4R2Jz?=
 =?utf-8?B?K1c0MEpyT0U2anpkZnpadlArWi9EZDltYmpNTEFYWWlMRUF3bjlidVhRckdH?=
 =?utf-8?B?Y3phYVpuaFFLaW1ubUQxWDJpZkJlcnorUkN1UW9SRnRqWHdMVzFsdU1HUXVU?=
 =?utf-8?B?N3RhdFB4L2EzWnZwdXgwdEwzblVKOVJNbWozdUkzanhkN2pqTnhua21hVXpx?=
 =?utf-8?B?UVhNQms4dHJ5K291UnRrNGpaci9ETXVZRHFlYitudnpmanc1Yy9lVnJqdUls?=
 =?utf-8?B?eWdBSmlhbElINFBJTjd4Z25pODBvMTdRZ3UxUDFKQzBkM0plckxaS2hhK0NT?=
 =?utf-8?B?bmZoQ0ZRcmkrTktpc01YU1o0Z056WEdvQnY3d2Q2SmZmTnRMRUc0aGJUWVdH?=
 =?utf-8?B?MGg1WDRtazRaN1RjZm9lbStrdXA4YVJlSWxOeDlhVUpJUzY4QThsSDBtWmtN?=
 =?utf-8?B?cDFsZjlWcjZJeHJycFRYSEJDdnRwaXNHdXk1OW93TXcwZU9XSEVNM1pYV1Fp?=
 =?utf-8?B?cVFrdmVRdHBQN2lja3dhYVAzMWNoaG5uT296R2tpalZ2WmhDenF4cEJzUzhB?=
 =?utf-8?B?TFEyZkgvVm5lNGw2bGhkc0ZIRExHamlkR1RkdWgzSThsMm1IRzRjdDJoZlRt?=
 =?utf-8?B?ZURoTHArWWFQUFo4U3FIeHRGSDF1bDdPU3RHSkZCUkV5ZkFkZlh5eVlsMGZ5?=
 =?utf-8?B?ZVFtL1RNeEtzOFhiMG02bUMvZFVJSXFQN3ZvZnMzaldScnp4bUhpOFV6TW56?=
 =?utf-8?B?akdTK2pOcHpORzlaRTgyMU5oZ1ZGK2xNckR0S0toU0tTekNsVU9ONTRFbmtj?=
 =?utf-8?B?MXdoZ1RJbGFEQmZjL1R3aHVoMnE5dTNQWjBzUE4zeHF1MjVaR2hyZ3g5OUFE?=
 =?utf-8?B?dk5mZDBISEhQT2JKb0FqRVZ4akdwUHo5NFZMSVdtYXkvdGlEK3lvY0tPY2x3?=
 =?utf-8?B?ZkE1c2p3OVV3bjEwRUE3aXRkQjA1cmhuT3kzWFpvSXZCMmx4T0x2OWI1S3Jn?=
 =?utf-8?B?bjQxdWZ1cUhrYXRxNFA4VUxuQ1dBNkdBQW1aRWI5Z1NLVnRRUm13NlViVEFl?=
 =?utf-8?B?OXF1RkV5c3h1Tlcrb1ZWOEN2aE5NOVoxb2Y3ZVN5YVZVZ0FCZU5iNGJIalJI?=
 =?utf-8?B?NnlDK1ZHQ2g4Q1FoOS96TFZ6amxRWjE3Q0FzbDhSVzBtd2NJYWw5MllXc01W?=
 =?utf-8?B?TVlkMDVJTWtNZjNieWh5dzVVNVpZdjdmbnJZZURHT3RwR28xV3ExekphYVVh?=
 =?utf-8?Q?3r3hIrbiaL5UpuglyXTt86r+C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b5e6b4-e07f-4487-138e-08dc240af245
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 16:21:01.4260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OIvzMHeLoHfYxHGuOEtBvh7SvTpnDDadGrfb9e7vaeCuQnZSqkASgYXGun0HfAtUjcYqHul3XAixDfU9nYryWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5644
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

On 2/2/2024 09:28, Hamza Mahfooz wrote:
> We want programs besides the compositor to be able to enable or disable
> panel power saving features. However, since they are currently only
> configurable through DRM properties, that isn't possible. So, to remedy
> that issue introduce a new "panel_power_savings" sysfs attribute.
> 
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Tested-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
> v2: hide ABM_LEVEL_IMMEDIATE_DISABLE in the read case, force an atomic
>      commit when setting the value, call sysfs_remove_group() in
>      amdgpu_dm_connector_unregister() and add some documentation.
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 76 +++++++++++++++++++
>   1 file changed, 76 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 8590c9f1dda6..3c62489d03dc 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6436,10 +6436,79 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
>   	return ret;
>   }
>   
> +/**
> + * DOC: panel power savings
> + *
> + * The display manager allows you to set your desired **panel power savings**
> + * level (between 0-4, with 0 representing off), e.g. using the following::
> + *
> + *   # echo 3 > /sys/class/drm/card0-eDP-1/amdgpu/panel_power_savings
> + *
> + * Modifying this value can have implications on color accuracy, so tread
> + * carefully.
> + */
> +
> +static ssize_t panel_power_savings_show(struct device *device,
> +					struct device_attribute *attr,
> +					char *buf)
> +{
> +	struct drm_connector *connector = dev_get_drvdata(device);
> +	struct drm_device *dev = connector->dev;
> +	u8 val;
> +
> +	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
> +	val = to_dm_connector_state(connector->state)->abm_level ==
> +		ABM_LEVEL_IMMEDIATE_DISABLE ? 0 :
> +		to_dm_connector_state(connector->state)->abm_level;
> +	drm_modeset_unlock(&dev->mode_config.connection_mutex);
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +
> +static ssize_t panel_power_savings_store(struct device *device,
> +					 struct device_attribute *attr,
> +					 const char *buf, size_t count)
> +{
> +	struct drm_connector *connector = dev_get_drvdata(device);
> +	struct drm_device *dev = connector->dev;
> +	long val;
> +	int ret;
> +
> +	ret = kstrtol(buf, 0, &val);
> +
> +	if (ret)
> +		return ret;
> +
> +	if (val < 0 || val > 4)
> +		return -EINVAL;
> +
> +	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
> +	to_dm_connector_state(connector->state)->abm_level = val ?:
> +		ABM_LEVEL_IMMEDIATE_DISABLE;
> +	drm_modeset_unlock(&dev->mode_config.connection_mutex);
> +
> +	drm_kms_helper_hotplug_event(dev);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(panel_power_savings);
> +
> +static struct attribute *amdgpu_attrs[] = {
> +	&dev_attr_panel_power_savings.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group amdgpu_group = {
> +	.name = "amdgpu",
> +	.attrs = amdgpu_attrs
> +};
> +
>   static void amdgpu_dm_connector_unregister(struct drm_connector *connector)
>   {
>   	struct amdgpu_dm_connector *amdgpu_dm_connector = to_amdgpu_dm_connector(connector);
>   
> +	sysfs_remove_group(&connector->kdev->kobj, &amdgpu_group);
>   	drm_dp_aux_unregister(&amdgpu_dm_connector->dm_dp_aux.aux);
>   }
>   
> @@ -6541,6 +6610,13 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
>   		to_amdgpu_dm_connector(connector);
>   	int r;
>   
> +	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
> +		r = sysfs_create_group(&connector->kdev->kobj,
> +				       &amdgpu_group);
> +		if (r)
> +			return r;
> +	}
> +
>   	amdgpu_dm_register_backlight_device(amdgpu_dm_connector);
>   
>   	if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) ||

