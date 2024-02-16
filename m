Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8E9857E5B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 15:00:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F262110EB97;
	Fri, 16 Feb 2024 14:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aZ07qCt5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD97610EB90;
 Fri, 16 Feb 2024 14:00:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dy/etnGJkpilJP+9yx9JAdGIVO106iSwBQPtZfwBcUGZo3kv7JZrFMeCB954Zr4NG4ETbfsd2sDZ79pHCpIFm+DAWOhmlMP6plgXKNkLO9q3Nod273d4SfwWGFW2Exef4adiTltiqHVgEisxbR7bQ7O8UgKEFg70mSWQfVkBraGTTqHknYX85B2GnBvP2oSD5TyVqHBxFbiDnlfm/iQX7LkJFeYds5bd66WDuYlEogyAuHXLP9BPQPA2cZbmM5pyimSSusEMp8mG2QqXqF+BjmcI0jbSn8wXXQyP5I3MOoWOrPfZdCPjBOUdwZ9wcvKuWh9u08bkTkBq8ZxQW2rvyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gRPrF8RIDFdtyKDd5EBOyIx8xNVl+rgtoZCzouaxig=;
 b=VqY7R2L/5Wkdxwy0NwuVYA5s3wgPGsdif2pIWSa5rWST4YWiXfNYlJ5sgjIhESwdBWn3r/R62BEgykKBquUExWTZftAZ2Av4rWaosBCUJ2DvNi10qcC5l0OXKVdfSuD79fG3n3oNvlg6IKPNvgOSMEMt91Ig+l0BBjpUuEtB44WfSt0hMmusEy3rIAo3cl7dQgwpWtAlF4C0/GJQFID9wCWt8NdspZRBfP8BLlVVlO8kxtum3tzDleIrVba/pmLxgilW2KiOmIQoMzqWCPgK0K5BU0V3h85MfGE7LalAoEvaF4sPstwIEHMIHzyubsLnjy7lXc/q4kd62LNptPDMEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gRPrF8RIDFdtyKDd5EBOyIx8xNVl+rgtoZCzouaxig=;
 b=aZ07qCt5zzKZEemS9ZAumkiV+Z4JAT+CiDex/8NXW541hWBJhq8tXpsRpCWmD5upMswBmqUV3zFp1C/bpDix1N5KRPfNaMiMGS6TTJNvaidym1IGvng6lFBVD51DyEO6m3lIvEKW0dI5uhkrPUCeGSXW0HLhknM3uQ2HiEY6/Gc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SJ0PR12MB5471.namprd12.prod.outlook.com (2603:10b6:a03:300::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.14; Fri, 16 Feb
 2024 14:00:36 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::3301:dfb9:528a:1fa5]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::3301:dfb9:528a:1fa5%7]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 14:00:36 +0000
Message-ID: <b52d47d1-7748-4560-94a6-520c82eb3fa2@amd.com>
Date: Fri, 16 Feb 2024 09:00:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: add panel_power_savings sysfs entry
 to eDP connectors
Content-Language: en-US
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
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20240216101936.2e210be2@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBP288CA0023.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::19) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SJ0PR12MB5471:EE_
X-MS-Office365-Filtering-Correlation-Id: 016fac1c-ba33-4d61-864b-08dc2ef7a651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E8wUFT/ZToZZJ0gdO7eVXo5JtjFLkflXk5p7sEKaRWIYiwOYJ6PvT1cE5+PkSz2DUoKiorXOCvs7qLd/d0lXq7nDznlwJ3jWxrB/3/AW9mFw2Q2DLMsfKgzVNbC/cT3NwVB2vXA2Uo++Ok1zI90DwDlmi6atgYH6huhW0irbIRCtfv11ZNBJy32ukLwshFrFm436Akq+o55jGfZ0kmJBiR8n6fBGJCx0wRwtLqiqzMoWzQ0Njm0m8oSxMOtDy54XUCJOiNOE1PVgeRS6viI7cX7YFyJkSRN0lyDEQ7psT8h8HZTuuVRy73QRfre7ohwE1UeNqkoSphyCx0QQPU02OJ7i80A99ly/9SIMYUY9riFXT8J8mYXLC8w4B0H/5PGlZUxYM37RSf/yW3t4hWr9dKRG2beMVkM+SNye0bQ9bh8jB3mlAYlL0SSCNu1NUv4tMHdAy7GCY2PBqcY0CsyTb/OYNXh72dUPQOWXonFUnU4VxV5G5+OFbUNS/fj3HmAiZT6D2F6PcD2LhHFM6RWRKcFYJezbIQN9e/sTVUdUzZ6BelhuBqRTqphRyDu6Vun7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(346002)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(36756003)(86362001)(31696002)(31686004)(4326008)(8936002)(8676002)(6916009)(66476007)(66556008)(66946007)(44832011)(5660300002)(2906002)(83380400001)(38100700002)(53546011)(6666004)(41300700001)(316002)(54906003)(26005)(2616005)(478600001)(6486002)(6512007)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmgvMFpJcjlJTXBKU2RrVnRmdjN6OXdBWnJjQzRJdXI5ZGRIcitpaVY2OVdT?=
 =?utf-8?B?WGZJNlNjMXlHUk1PSklkRmVaTitlQ0VBWEZXS0ZLU081T2lIdHRMbCs0ZnJR?=
 =?utf-8?B?WUlob01VWGlhaGdjczQvTnpYMFlqWUhPampkTXZIdFFtaEpvcVlMcXBjSEND?=
 =?utf-8?B?YUhjNjhBaHEvaGdkdWZCRCtBamkyRzJ1S0lEeFpuZGpWVklKbzgvc1ZpaHFz?=
 =?utf-8?B?dEpUQVlOSWxSNE1BQUM2Uy9ON21DMEVSMDhEVm44dHZabjZEM1NYakRSeDZa?=
 =?utf-8?B?RlhkM1dNcTdyRmR4U3FOQjhUSXFkUHJ4eEowbmpjQmRyYlNZaXdSN1ppWTBz?=
 =?utf-8?B?SjI0R01TQWZPTHZGMzZOcWUzT0hqOFEvU0NlT1pSUkd4VmJuL2xIU3JWaHBs?=
 =?utf-8?B?c1M4T1cxbjYrSlFsQXJmOURqYzVFbFlZQXNQWUVjbk9CcXczOUIwbUZ5aS9n?=
 =?utf-8?B?dExpQktRTlFvVFA4Z2hHM00wUnh1UG0vajBKTTRONVRtTW40TzY3bWtZMng0?=
 =?utf-8?B?WlJPVGswZXlsR3hkTzF3YVpZUUtpS09XS29hNG10b0JjWUs0dTJzNWhML3Zu?=
 =?utf-8?B?SUxNK29ncUNqRWNFM21oRlY1NjYxVWQzYUcwSC9CUHpIZklmRE1VeEhUQTJU?=
 =?utf-8?B?dGNJNHQvWmY4ZjcxNjhXOVFRSGVUUnRYNzBCVzRGTmJnUmg3UTd3QVdjMktZ?=
 =?utf-8?B?Q0VDeGNNamV4UDBmR0xBS2J0S3A2Z29SUktsY1pneThpMEVyVWNjODFnSjQy?=
 =?utf-8?B?QW1YNXV0WW9tS0N6anlhdmVPcjQzS1BiMzRpdFIxb2dnTnFKUDN4a2Zmek5w?=
 =?utf-8?B?UDk2cE1jaWxGdmhCOVl2R09zdmRtckhIa0pETHRWb213blZYT3BWazhrQXN4?=
 =?utf-8?B?cmhDTWpSYXRBQ0xLZWFLV1VENG9YSjJLMUpwUVVTUVZXc21MMXd4RG1aeHIr?=
 =?utf-8?B?UXd5T0JTT29RdHZLc2wxMkExeTdQeEowcnJqKzR3SEZNMTBwRzhlM1VWUnhQ?=
 =?utf-8?B?eVQ0QUNpY1FVUjJucVVIbHplU0FQeXRuQndDN3daVU9XNU1TVGdNL0E3RkVP?=
 =?utf-8?B?bzJIRkFxaWNFOXNqbGJaTUJ6L3RVcy8vbTZsQm5tOWcrcUtKUlFoeHVQbmFp?=
 =?utf-8?B?YWttSkVieTlpczZYTmhyMjlHcmppNkxIb29qSTFQNTFpcWZwSTFjMEoyV0x1?=
 =?utf-8?B?ODFsd25SZCs4Vm55WFIrY1ZRYWlLb3R4K0VobEVTcEFmMEFLdnhtR1VKWC9U?=
 =?utf-8?B?Z3pWK2VNS2FWdlY1Y0FmTHBzaDhQNTNnS1Z6YnBkZ0dXdWlwREYrMHA3K3RR?=
 =?utf-8?B?RVVvcjcwV0M3TFVvc3NhajF6NzRpSi8wclRmT2JsQmxjREQwTVRQa3ppdXZW?=
 =?utf-8?B?NW5sT1JrMTE1VXd4TlJwZHF0UGhaN2tneVQyQ0kwRUJ6UjA4bDZNaWRSb3NL?=
 =?utf-8?B?T0VUdUhSeTVDVGtCVC9jcWpORXZVNks5Wkc4bWlBTXdjZHdsRVJ6cnRTKzcr?=
 =?utf-8?B?MkowUVg4S0lzRkxLWXNDc1oyeSs5S01LMzc3QUFCZ3ZtdGg1eFI3K0wwUUZQ?=
 =?utf-8?B?VVZob3BoYXl1SU15U2FmRnpJaHlGTWxVZ1BuTk1jN2srbG52OTBsZWE0RFJR?=
 =?utf-8?B?eG9KOXdxbjlQSU1UalpkUzcvZTZNVG9RTVVVS0FxM2RGRHJ3ckM0WC9BV3hH?=
 =?utf-8?B?MEpPM1g4bjZiS1NaS21WaWZUdmxVZ0pkTVhYb0ovL0kxZUZEck04U2I1T2ta?=
 =?utf-8?B?L3BXYWEwYmtOckFLQ0l3Tmp2QzM4MGFFWlAwcDh4LzVvVW40RjFVWERpbWw5?=
 =?utf-8?B?c2lSTWNuWk94SmpaazR2NklOZU84TDBub0NzdmVDODZiMElHblB0NjJ6Ui9O?=
 =?utf-8?B?S1hocGtEZEp3cG9DN3UrWHN5d21QL2VSYk1KUU1GRW9pYXpqdGFrdHV6MFhx?=
 =?utf-8?B?Tjg1d2p2QTR0SjNMK3ZWVXZCQ3J5SjlmSzlCdnQ5YjRaV1ZqLzl2N0x3VmFt?=
 =?utf-8?B?TnBIa3pldDN5KzlhelQrNXlQYzJvUHgxUlBZS0NHcUFGQkx1a0RTUmRDaEFB?=
 =?utf-8?B?ZFlUWWtVYWZwRjVPaVRFQzJvRVNTT1EwQjIzdmxnbWNVVDVUU2I3V1R3dVhB?=
 =?utf-8?Q?J0NVan56aCKPGN+BSuIVmobKm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 016fac1c-ba33-4d61-864b-08dc2ef7a651
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 14:00:36.3400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RtO3nDGMiLWBZKStOGSe6Kvi6Bd0wKf4uRybEZzGyEZedJWQxY/tYMLb+TcOaOYxu5q1wAvtmppaSg1kHoVPpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5471
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

Also, to be completely honest with you, I'm not sure why it was
initially exposed as a DRM prop, since it's a power management feature.
Which is to say, that it doesn't really make sense to have the
compositor control it.

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

