Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F096A857F6C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 15:34:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DC410EB5D;
	Fri, 16 Feb 2024 14:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lPJmKbxe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C8710E44C;
 Fri, 16 Feb 2024 14:33:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wg1eipjYPcrboO5hikk2zW/8A6vlW2l6r9lPhPQBrqEvH9JJNjLw0pZbxjNdM7fhL1YPmEfmfuyrPnwOqEmTfItMFjId9uzQrURiEonkoClRHEMg4Lo6CGPxyDLBF1dbIigQ+Vx6s4btSW6RpIbtVI+QqBQNZlkjfiAafTCGNLJ8Bd8NZD2ba6ZCDFTECYaMiuk+D7cQxrQHzpR5zH/5wBUebVdo7xdWVHjNF1SQh1ZqWbSq8E0dR6mJDUMgR7p/QDnneckTGWrEBWj69FV3VF3B0Z2GXe7IIw2QAwtfkaCw5IkPekvLVNWN851kXgihjjgUiMf6y7ukKVhL7kYD7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFVhAunchAkTmYVql5K2/oEO15MRr+ap4bcrovN59CI=;
 b=l6sfH7dC2ddqWn4Wk3SoZVKCt53fdFMVB0DrvqkKoLvyed83HV3qM4yxBdyIBNnCBXP3JnKN42oajluWiq6ERXSOCRs+3iyyLEa50tCFQq0JHVKSJmmJS3dm/cTuD3gFfG9V3oOfdFrCDKDztonuMbSjh9T+2R5Hawj3/zmFCbTcJwgZ+z9ZDdhF6wAjvnj6ZXy0SY6C4hWOh4RcrWI9tZpw6fEGS0gnKUj45XH0TEBlGvZ/uA02+uc7q2Ood2y2eNF33zwbyDK/fFaPfjJZwr8Xx96+zh7HWwZ3U54T8Y8pBlSyfzHF0bbYnifld0kUYgVSAiCqYdzMU93ZM8SPcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFVhAunchAkTmYVql5K2/oEO15MRr+ap4bcrovN59CI=;
 b=lPJmKbxerdy/Guh299Ib62dkh/TJBSK3mOyOQ2ulUf9FrXkPJactopkLu5eZ9xsn2eTIgTHwtHuJxHNs3qv5UYS+319k9bXlt/l4cBL2GOm/O2XI+8bqVhFje9a2CM6WaroIh14Ki8EIqIdEXGjz53onPoB0G0PAsEW2HrGSSKU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA3PR12MB8804.namprd12.prod.outlook.com (2603:10b6:806:31f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.14; Fri, 16 Feb
 2024 14:33:52 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3f6b:792d:4233:f994]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3f6b:792d:4233:f994%6]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 14:33:52 +0000
Message-ID: <82280a39-4e1d-41ee-82fb-758ceed953e4@amd.com>
Date: Fri, 16 Feb 2024 09:33:47 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: add panel_power_savings sysfs entry
 to eDP connectors
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: amd-gfx@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Hung <alex.hung@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240202152837.7388-1-hamza.mahfooz@amd.com>
 <20240216101936.2e210be2@eldfell>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20240216101936.2e210be2@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0144.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::10) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA3PR12MB8804:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e87c63-7762-4398-96d2-08dc2efc4bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2T0ZWczJO/je3ZkEtmIj9jDASG7X8DMVLKFxyBL8Al40PvaXkG08EDqmga2ZteSJ83VJIueiD46U4BD3HNkkVwYDmqcinhsSpXwv1rq1XVG4DFFDIA3/z+9H4mKh4XRw/wRiZHuhfuKXAUYnIkGKCcNa1oJfFyW/SEbHirapOMQ9gPU4i1q0XzmdmuCfPYUN52+laqNBWpnFEiTAdUSTeXHmEQLdKCA/J7WuUA8RLtvqTsCxm2eplQZ27bJBXcGMDB+BUV3L/l2Reo87eAWuv468qg/zL3R/swt4nrE54XZqOpbC7NOwrBA2wESlejrMVl5tGnG7PwfJlXZakws60g1eDk3AUj92luyETf1r6uKJK8LPDFmoz6sXySekoD8W0tPMb2FkJS8SJW2zTkkFpNnNlgs78nb5i0CIXhCnkrXaHIz4N799aFqmuaYNx/I3H89V86eRqj/kiYClMsAeTsVkjhDAz9UJXyEaoNiPKUmaqRbchcKWM5zNyzqVuzibdtpMbqgkRMiLXXNwV7h+6ROZ7b5mu6BdGrKG+hN3hRj9rPL+K04TKlyv5wO24Szt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(376002)(396003)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(8936002)(4326008)(8676002)(2906002)(5660300002)(44832011)(26005)(83380400001)(2616005)(38100700002)(36756003)(86362001)(31696002)(316002)(66556008)(66946007)(54906003)(110136005)(6506007)(53546011)(6636002)(66476007)(6512007)(6486002)(6666004)(478600001)(41300700001)(31686004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHJqeVJrSzBYZXJtZVNCL0ZkRUp5OW0wSFM4RkVLVmRkOVkranRwOFNMUHMw?=
 =?utf-8?B?SHRGQkFKU1JxSXZWblV6QzVLNEh2cDdvekd3Q293cnMzUWZpWFpBcjU5aFhr?=
 =?utf-8?B?Q0pheTR2NEh4T3Y1cGxwWUVrcEdieU1ISERKTExZbWVwVE1JNjlPR3c2MnlY?=
 =?utf-8?B?dlVLUGVYRndtMnJHaHl4QlNoTHZnRnF5dDYxdmRXOFpoanFTS3ZZZmlQL3Bm?=
 =?utf-8?B?UTFRV3VEa2dhQVhyaEcxbGdpMzR3TUNtcUFNUlFoM3ZvRmwvNXdER1dxTjdq?=
 =?utf-8?B?MWZmRXcweTViMVNvdWU3bGNOZ3hMdC82L2tISHEyYzhRblZmN1ZSbFRPejBp?=
 =?utf-8?B?RGY5T3c2dlV6bE5iR1Mxd0NBbGRhWGVyRmY4MFVZbHFyd0J0TmcrWDFaejZC?=
 =?utf-8?B?ZDhpcDlDNloycUJkWEdwTGFvTWNFLzZaZTh4dE9zMlo3Z0psUEJpS1kxd1ZJ?=
 =?utf-8?B?TWJCUnFKd1B4dDRqcmpqZmtLUmY5OWdSdER0SHdDcTNlcHZReHpmTDByQWdT?=
 =?utf-8?B?RVZGZVpPS2xCNkZQY1RQS3QyNEJjcXNvZDY4ZGJuSHEyNFR0VUtLNTFVNVgy?=
 =?utf-8?B?NmxNRHBCSW15NHFNWHl1RCtZWnFaUm00bUhaeFBDclJWdVNOSm9HQ3J1cVEr?=
 =?utf-8?B?dTZyWUplYithTjk3SzNReGEzSUIxdjZuQnFnRnRNTXZMb3M1MVFFQzZiNHNE?=
 =?utf-8?B?amFjRXpVcU5yL2hocUlkQ2RJWTViaUV0SzN5SVNtOGpha0EvRU4wdTlRb1Fa?=
 =?utf-8?B?ZE5CYmp4Y21zcjIvWXRRd2lxVjhoZGtDVUN3RUZpcTZGK0R5NGVITFZUNHZ2?=
 =?utf-8?B?YWs1UjZjOW1KVUsyMkR3WUg3a3lhME9zOXl6NkZOVmtraXNRaEl5d0VkbXU3?=
 =?utf-8?B?OStkM2J5WEh6WmpGZStTaDAvL2lFZzJ3aS9ob1hva05SaEFBTnhYOUxRSVIz?=
 =?utf-8?B?Ty81VmQ5V3BpSE0wazlHdTRodzkzSENwcmQ2cUd1R2V1UXVLSlV5cGQvek5W?=
 =?utf-8?B?ZngvYlMvTktuZUtaUnV1Qis2cjBoeEdlWjhzYmNzOW5tRjJGc0FZYmVMVHNS?=
 =?utf-8?B?emRLSXZhQzJMNFdMSHZKd1ZrQXN1K1RxNzhCSnlJeXpZeHJIU1FVaGNXSEVW?=
 =?utf-8?B?NURoVTIyZjl0aFFsLy9kK244L3Z3bjZGT3c0a1R3WEVKeEl6ejRxU3M0a3ht?=
 =?utf-8?B?bHhHejVvYW40SkFETFQwSXBFNU9iVDdRdTYrQ2hZZmJmRmNWL2pBa0J4UUdv?=
 =?utf-8?B?eEkzWnhqYnNPcXdsbFpWem9uaHV0aFA5NlZtRjJ4VlRyaGVSM3dHYXY0czJE?=
 =?utf-8?B?MEUvdjZGMlRpN0V2ZjVxSHV5MndvK1VQdTlGRDZGRUFUWlJ0M2MxcVcvMit0?=
 =?utf-8?B?bFhGK2tXdjN3Y1NmWnppY2FPOTBFN1FQalc1VEVsNHJXZ3dhNW91cWM3akI3?=
 =?utf-8?B?TnVUY0NZa3BEZHRUNnAvU29DUmx5UHFLUm9haURXbzBPUjZ1L0ltcVlpRTF2?=
 =?utf-8?B?ZHBQcnhIV0poU1QrK21ZTmxBYnNvOTFlUkdjUnV0ZVUwRkpVMWtFZGxSV3NY?=
 =?utf-8?B?NTVGbUVXTWpKQk1scW5kRkdSK3dKam0wT0FSRmYvZ2JURzJYK2RzZU5oMnJB?=
 =?utf-8?B?MGV0ZnlnUnJtTUtDOXVuaUhjU2RwdXRveWNIM0xEekJjWi9vOXd5ekRMWHFt?=
 =?utf-8?B?M2k2ZGpTdkwxNGR6VUgrVFdaRTJkTDlDaXpaRTRCdnJvajhDV2liU0luYVN6?=
 =?utf-8?B?UnRUNmhQM0pIRmhQaHlLdGhIS0hEYVFGUGJmNjhKSTJsYUFWREpFNXE2azRr?=
 =?utf-8?B?cHhpU1d5aERWMnpOaER4NGp6RGJlUDlzbU5yajZ4a0J6TVNlVW9YNHF6Si94?=
 =?utf-8?B?a3VWT3h5TjM2ZDBIckF6OWt5UFgvSVlEaXRkajdrT09LOUlzM294RGE2L2NP?=
 =?utf-8?B?U0pYN3Zmc2NsZXNRL0R0TVhlNXpLaUZwYzNEUTZWQ1g3em9helYrNWlINk15?=
 =?utf-8?B?SS8xSENzSzBBbTBaZVdFbXpqUVE1b3I5ZVY3RE82aWxDTU5tTkc0NGV1OTFW?=
 =?utf-8?B?aHpaU0Zwd3dLandPcGNvZ2ZKTG1jRDBTSXJONGtZYWx6cWtnT1FVZnJHTEdE?=
 =?utf-8?Q?ZhdIkXDzgazRtxW+n9fqAFPcP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e87c63-7762-4398-96d2-08dc2efc4bf4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 14:33:52.2649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6HJPRzRyU/QbydENJ5xyLRshYFQPQwQ9ynHQXuj+b3MoYpTy/wpV9HWZc2WM4oEW1R9AEMvMNq70m9dZsHwtMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8804
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



On 2024-02-16 03:19, Pekka Paalanen wrote:
> On Fri, 2 Feb 2024 10:28:35 -0500
> Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
> 
>> We want programs besides the compositor to be able to enable or disable
>> panel power saving features.
> 
> Could you also explain why, in the commit message, please?
> 
> It is unexpected for arbitrary programs to be able to override the KMS
> client, and certainly new ways to do so should not be added without an
> excellent justification.
> 
> Maybe debugfs would be more appropriate if the purpose is only testing
> rather than production environments?
> 
>> However, since they are currently only
>> configurable through DRM properties, that isn't possible. So, to remedy
>> that issue introduce a new "panel_power_savings" sysfs attribute.
> 
> When the DRM property was added, what was used as the userspace to
> prove its workings?
> 

I don't think there ever was a userspace implementation and doubt any
exists today. Part of that is on me. In hindsight, the KMS prop should
have never gone upstream.

I suggest we drop the KMS prop entirely.

As for the color accuracy topic, I think it is important that compositors
can have full control over that if needed, while it's also important
for HW vendors to optimize for power when absolute color accuracy is not
needed. An average end-user writing code or working on their slides
would rather have a longer battery life than a perfectly color-accurate
display. We should probably think of a solution that can support both
use-cases.

Harry

> 
> Thanks,
> pq
> 
>>
>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>> ---
>> v2: hide ABM_LEVEL_IMMEDIATE_DISABLE in the read case, force an atomic
>>     commit when setting the value, call sysfs_remove_group() in
>>     amdgpu_dm_connector_unregister() and add some documentation.
>> ---
>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 76 +++++++++++++++++++
>>  1 file changed, 76 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 8590c9f1dda6..3c62489d03dc 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -6436,10 +6436,79 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
>>  	return ret;
>>  }
>>  
>> +/**
>> + * DOC: panel power savings
>> + *
>> + * The display manager allows you to set your desired **panel power savings**
>> + * level (between 0-4, with 0 representing off), e.g. using the following::
>> + *
>> + *   # echo 3 > /sys/class/drm/card0-eDP-1/amdgpu/panel_power_savings
>> + *
>> + * Modifying this value can have implications on color accuracy, so tread
>> + * carefully.
>> + */
>> +
>> +static ssize_t panel_power_savings_show(struct device *device,
>> +					struct device_attribute *attr,
>> +					char *buf)
>> +{
>> +	struct drm_connector *connector = dev_get_drvdata(device);
>> +	struct drm_device *dev = connector->dev;
>> +	u8 val;
>> +
>> +	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
>> +	val = to_dm_connector_state(connector->state)->abm_level ==
>> +		ABM_LEVEL_IMMEDIATE_DISABLE ? 0 :
>> +		to_dm_connector_state(connector->state)->abm_level;
>> +	drm_modeset_unlock(&dev->mode_config.connection_mutex);
>> +
>> +	return sysfs_emit(buf, "%u\n", val);
>> +}
>> +
>> +static ssize_t panel_power_savings_store(struct device *device,
>> +					 struct device_attribute *attr,
>> +					 const char *buf, size_t count)
>> +{
>> +	struct drm_connector *connector = dev_get_drvdata(device);
>> +	struct drm_device *dev = connector->dev;
>> +	long val;
>> +	int ret;
>> +
>> +	ret = kstrtol(buf, 0, &val);
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (val < 0 || val > 4)
>> +		return -EINVAL;
>> +
>> +	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
>> +	to_dm_connector_state(connector->state)->abm_level = val ?:
>> +		ABM_LEVEL_IMMEDIATE_DISABLE;
>> +	drm_modeset_unlock(&dev->mode_config.connection_mutex);
>> +
>> +	drm_kms_helper_hotplug_event(dev);
>> +
>> +	return count;
>> +}
>> +
>> +static DEVICE_ATTR_RW(panel_power_savings);
>> +
>> +static struct attribute *amdgpu_attrs[] = {
>> +	&dev_attr_panel_power_savings.attr,
>> +	NULL
>> +};
>> +
>> +static const struct attribute_group amdgpu_group = {
>> +	.name = "amdgpu",
>> +	.attrs = amdgpu_attrs
>> +};
>> +
>>  static void amdgpu_dm_connector_unregister(struct drm_connector *connector)
>>  {
>>  	struct amdgpu_dm_connector *amdgpu_dm_connector = to_amdgpu_dm_connector(connector);
>>  
>> +	sysfs_remove_group(&connector->kdev->kobj, &amdgpu_group);
>>  	drm_dp_aux_unregister(&amdgpu_dm_connector->dm_dp_aux.aux);
>>  }
>>  
>> @@ -6541,6 +6610,13 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
>>  		to_amdgpu_dm_connector(connector);
>>  	int r;
>>  
>> +	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
>> +		r = sysfs_create_group(&connector->kdev->kobj,
>> +				       &amdgpu_group);
>> +		if (r)
>> +			return r;
>> +	}
>> +
>>  	amdgpu_dm_register_backlight_device(amdgpu_dm_connector);
>>  
>>  	if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) ||
> 

