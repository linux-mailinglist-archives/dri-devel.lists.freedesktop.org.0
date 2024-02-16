Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB46857DE4
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 14:43:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC26310EB64;
	Fri, 16 Feb 2024 13:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yDE/BKBX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD48810EB62;
 Fri, 16 Feb 2024 13:43:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRMwm4y8Ti3OmWdp5nxxrn+63doS1aBOjSuVpUSEehM32dVyfY5tJsiuvLndAT/qFEkLR186frV6gY3hE/SiDC3c8ducDqegzwoVK6BSSHWDsZFN+7tME4cLoIuoG1d+oQxkfxddOjrvzlOZB0jcVdmu2BUxTlTWSk/NmeGOwvpnFgr99QVONdy+O7Zfv0yARdDE5MXT2xKnSWBFMkGaPxLrq0ZnGN3pIjl6fKB7fPj9+iX6rnU/UZt9l8FoX2G1T5HFFgVdUAT6yFM2Hhd2dDI8btFvx42xt6JwdFDEc5hwxXrUNVgf2cvz82x3cA64dF8OJdgFR0rxWIwf2ZfGTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tKQmyDeCfRebiReA7Z+5zzw2sZSzF9AiWaykaE3Bqs=;
 b=b2X6S04/2nABWrlPyVAahXMdZHHhrc8QfJLrmCcC9V4dqoCADO9z3iyxtUDU8kPheSxeIH1n1/NJe14r/Q9wn90u3NLjisp9cszrcYzWX1Rth3MpbZJEbFNBEi543/QzeuSHgnhRVOTU/OV/kkz2On0SZlmEk/J8NiI4ho8KaCDGCCI4/VNfhPgNFksVVYr+8keEgXbCcN0j2wgMtQ1I+SzYoHM+gr5VFxx9xLQr/6aEGI7y2OD5kmPMDxJOAnWjdr2Z+9ZTuVG3hY7S/4YvZnK4L8RhI+GDht3X9JFGJy3VEEhchgiodCdi9O8chiTLtb8Kqt0NLmSq+9ezElt24A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tKQmyDeCfRebiReA7Z+5zzw2sZSzF9AiWaykaE3Bqs=;
 b=yDE/BKBXKr9B0SJ6tokhYtCI8zajI2Rl+u8NOBQ0/Ep0dbw/HgKd4xFu/HoNfzaquiUuis9yYEKNybDSztLNodDU8zXTAS+OTFuP0Kq2VptE5vPFSLzcHZASOuTCbWl5Jw8xI4qvz6HAKM/8mGKlVsIc9IKVDBvWmyo+W5BnLWM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 CH3PR12MB7594.namprd12.prod.outlook.com (2603:10b6:610:140::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.14; Fri, 16 Feb
 2024 13:43:12 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::3301:dfb9:528a:1fa5]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::3301:dfb9:528a:1fa5%7]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 13:43:12 +0000
Message-ID: <eaafb036-8815-401a-9c7e-986a85e3b100@amd.com>
Date: Fri, 16 Feb 2024 08:43:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: add panel_power_savings sysfs entry
 to eDP connectors
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: amd-gfx@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
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
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20240216101936.2e210be2@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::10)
 To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|CH3PR12MB7594:EE_
X-MS-Office365-Filtering-Correlation-Id: c7607c50-5e8e-42f2-4aba-08dc2ef53824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hfHeZm8fIVr6XTebqIAMiKOna7PWmPHQeQ8BUm/pKZSn7gJ2UkNzxeF2rs0NT3eKhGDC2c2T/YzdaruQGSnXUsTLuyzEzOf/QVuzYbIpUNeiIF50AfefCrPQJrQn2R3y1YzapN2dIihVoaj8GV3DRnZ1KkwyQ1AqVkaAl5uIugmAWAFO36QmI3Qc6rvoZAVjHYt+L9ffKRUJgoWE5si9EVJ7Km1AzzbhpYiuH7+vd3jgnzyGdWBOJTwb9Ny9Um9HoQ1oI184zpAZU/BfzReyNVKbXYRO3mzoTpiazbbHDKzOwkWLF1FS0PVq5cTGF0PUSHOxkIVYXe9LauhjqrjmalyYqodDQtS0X8FEYjiHo8v1Wp25caq8W9McOA8U7MAKjkdNLE2l9tOssvHi24IF0QpCibz0NPGjYPm4dvo/8o119pHnC5OpcV1ZmQVuNBfpdC+SxGvYa2NT7+rrGYuL37E+w8h4FXtZbQ+MyC/7UdoLr1fupL2hkdp8MLMXWFTeGnP91kvD6z4kuUSN6je8+y+veJ+7FgAq2/SdwCpnWB6d7P3CzG9f63RebVpF6Gnb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(5660300002)(2906002)(44832011)(31686004)(83380400001)(26005)(8936002)(4326008)(66946007)(8676002)(6666004)(316002)(66556008)(41300700001)(478600001)(66476007)(6916009)(54906003)(2616005)(6486002)(6506007)(53546011)(6512007)(31696002)(86362001)(36756003)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHpHd3p3T1RwMHJtU0Qvd1hta2VzOU9kdmhRRmJiWGtaM3NrZjV3c1JwTlE4?=
 =?utf-8?B?Ukh5R2tRdmRvVitzK2xqallhNmhXSUg0U1k2RFJPbGpGOWR5dDZ5MGlGODhY?=
 =?utf-8?B?bm1tQU1QcDF3U2c5a3cxUHRWTWo5QkJLMHIwT1hqL2VEa0tRNDBKRTJwYlRt?=
 =?utf-8?B?M2xiNWEvcEl3OEl6Z0ZlcnBMbkxSVGNJbWJIMkZTMlMzWmVVbDdJanFRbE9H?=
 =?utf-8?B?UVBzR0NtMTd1RC9jbGFHMHNrMS9XMDlBM3BwamgwdzZRVWZDbkVFK1VCa3gx?=
 =?utf-8?B?V1oxYWZZODBlVmxQNmpqZnRTaEFhZ0pXTlI3d29vU29odnhnU01mZ0o5SzhY?=
 =?utf-8?B?b0F5RmtXS0FRSVFJSlVsZllvUndIZ200YmRxQThmNE1vVDBLZmtMVWVDSVZS?=
 =?utf-8?B?TURrK1FySFgrdjFmR0c0RFFZWHZmTEk2bTQ2eG1mRGpJQVZtVk9WdG91ZnFE?=
 =?utf-8?B?cW9PVUFxdjVzMVE1b2VDOW5DeDlEUHNlbTFJVFhtWmQvQVl3TEN4M2hJdmI2?=
 =?utf-8?B?dnRwZlhqWDdTSXUzMFQ1dnVFUGFRTHNTSEozMmxQNUF4MEs3R1NkZ1NOOHRQ?=
 =?utf-8?B?M0kveGNkSWFDQ0Q4d1RZczMrSXg1UDFhZ2VMbVU4Qzl2Y2t4SVRtNktYOG5E?=
 =?utf-8?B?MGxLS1BwWm9WQlRveDdmRkozanRtV2k1K3hGTzdDRm5Vc0hhL3VyenhwZjlG?=
 =?utf-8?B?cXd0RkxmR1gwRVliOGFwaGN1K0hPVzlSSVlLRkdabitFZzR5WDZlM0EzeExq?=
 =?utf-8?B?TnZaamdnT1FvYkpXem5vcjlpUk5zcmNicHlGSzcxWEY1cGdXUS8ySVBQV3k5?=
 =?utf-8?B?NFpxV2NGVzBPQkRYSmF1elY3MXZPbm5xOUNsdEVleTlrc0pkUWhqdVpoYStu?=
 =?utf-8?B?aEMxb0ZRRDhxUnppdGR6UEtoUFdLUXVBUDl4QVhxZ3dqVVY3WUxBYU9vK2pu?=
 =?utf-8?B?VEErRGZycWtvSnZ0aVpoWitFRVpQZnRxKzNiZ3FpaUpLSU03Z25wZmZGTjhJ?=
 =?utf-8?B?U2h6UzB3dkt0UktjSVMrdUJTUUlRbjZwOERsZWM2MW9VMGdaZ1BmdWNrQUVN?=
 =?utf-8?B?bGY2NjJUcnhUVWFyVWV3bk1pdUpRYldmZU9HeWc4cjJtbUpsdjYyRlgzYVZ6?=
 =?utf-8?B?dmdsd1VRdkFYejF0akl3WWQ2bVNoVUJzRzNoSm5TcHgyWEdWQ2syTU5Vbjdx?=
 =?utf-8?B?dlV5YmQ3Rjg1ajJJTlpSM1J3RjA0NURiaWFKaFBRVUdndEIzT2FmL3huU0l6?=
 =?utf-8?B?VjVlM1FYMFJQWjRYK2VLU0trY2ZqUDVzQVkvY29EUjUzZWlDN1lWTjFXajdJ?=
 =?utf-8?B?YXpCZWRtUjhIbmtBWEdvZVFETjBpOTdUV0xTVHU5eVBEM0lmNkhvRHkvREpN?=
 =?utf-8?B?VTk3elIxVXdCRmJmQ0pHNlpGdnZGQzRWRTNhMXFndGlGSXJCVHVTUzJLOFlE?=
 =?utf-8?B?aUVNaDVNdnhuMWVjVDBaYnN3Q2FyRnA2R0xjVFpoYzlBdUxpeGpVb0VBMnV5?=
 =?utf-8?B?NFZhZWJuMHJHR3lMSWdJSHZvZFJlcWtDKzBXSjF3WUt3MVovNDVKSWk3R3Rk?=
 =?utf-8?B?WnR6V2VmK1BJQm9TQmxpRnY3bmpubS95MHJQTXlHbi9mMU5YS0UzQUV1NUVa?=
 =?utf-8?B?VEZJUHFhRHVmYWZvaDZseXFlSTZpViswSUNiUXF0eGdrM3ZTdmNYWVJMZWNx?=
 =?utf-8?B?ZFVORkVmZHp6bE43VDJONldMYW9PYng1RFEwbXBBanh1TEw2cU9WdVZIUzU3?=
 =?utf-8?B?VWlDZG5UMTBWVG9wWFJsb0tJWlBYVmxRNlhVbTZBNDFaM3VWRWZ4RXRPOHgr?=
 =?utf-8?B?RzIvaC9XbHA0VVZGUnFQS1NnUWRNendWNHhJdjJ3TUFxdHZUSENySCt4cHNI?=
 =?utf-8?B?TGh5VkJnZXdrYVZIVE1jQWw5RjdBWjhSVitFM1kyZ1VlVk5IZVVoU0lSUmpn?=
 =?utf-8?B?VW5BNGw3UVpvZlFDdDgrdXZKUWEwa2U3aWltaUkzQjZZRVE4NjNDRlNiaVFt?=
 =?utf-8?B?WHpFNHVPSkY4eXlPb1NqTHEyRjRFVkdJaUpSTXRJeVpCbDVZZWFQck4wRUE5?=
 =?utf-8?B?ZWlWQXdDa24yOHl3V2pqanV6cjhkcjhmQmduRnU4UzZUWjRkblArTlBwdW9x?=
 =?utf-8?Q?1hXaVSf5KNbrpnaCvsalr25dh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7607c50-5e8e-42f2-4aba-08dc2ef53824
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 13:43:12.4973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fp6wraoGRurCdA44IOBeyYIPY4Giz546I3hqLx01nc5vJPRm5pHB/WuTiEb409mXYYT5C+YrXw9+0VY2pMWyWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7594
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

On 2/16/24 03:19, Pekka Paalanen wrote:
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

To my knowledge, it is only used by IGT. Also, it is worth noting that
it is a vendor specific property, so I doubt there are any compositors
out there that felt motivated enough to use it in any capacity.

> 
> 
> Thanks,
> pq
> 
>>
>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>> ---
>> v2: hide ABM_LEVEL_IMMEDIATE_DISABLE in the read case, force an atomic
>>      commit when setting the value, call sysfs_remove_group() in
>>      amdgpu_dm_connector_unregister() and add some documentation.
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 76 +++++++++++++++++++
>>   1 file changed, 76 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 8590c9f1dda6..3c62489d03dc 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -6436,10 +6436,79 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
>>   	return ret;
>>   }
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
>>   static void amdgpu_dm_connector_unregister(struct drm_connector *connector)
>>   {
>>   	struct amdgpu_dm_connector *amdgpu_dm_connector = to_amdgpu_dm_connector(connector);
>>   
>> +	sysfs_remove_group(&connector->kdev->kobj, &amdgpu_group);
>>   	drm_dp_aux_unregister(&amdgpu_dm_connector->dm_dp_aux.aux);
>>   }
>>   
>> @@ -6541,6 +6610,13 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
>>   		to_amdgpu_dm_connector(connector);
>>   	int r;
>>   
>> +	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
>> +		r = sysfs_create_group(&connector->kdev->kobj,
>> +				       &amdgpu_group);
>> +		if (r)
>> +			return r;
>> +	}
>> +
>>   	amdgpu_dm_register_backlight_device(amdgpu_dm_connector);
>>   
>>   	if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) ||
> 
-- 
Hamza

