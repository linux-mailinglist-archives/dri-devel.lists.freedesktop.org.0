Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4978D83F41F
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 06:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A416210F1EB;
	Sun, 28 Jan 2024 05:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA8310F186;
 Sun, 28 Jan 2024 05:38:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjD+dkEcR75Kv6JzvPJLWhzCwlfl3mxreVPyDeljtSFTayVx1GRBAEcU9u/dDAGu0MjT8QEqDVJnr9NeTs8BEwkjhEeOwN9iELeX0lRi6PUbJk1mgmWUAisV3XalHHP9AWHnLEKWlAhsQ/D7gaIyMJQrusEs2T4BXt8OgEF2H1wkUFkslGmxv/lLGYq0brgy0r7opBfBd/zJQDPxtVC759+ZLVFGIa+cn5zhLLbZC2npTLMlSToEAIt+ghj8eeovw30yXQwA9v1SvHHKUJF38NVYsqj+weh2mXMnbIMpSdPAHlkRbWLo3Eqk2E01MwmIP6o6npcjCXRq9SECFnLzUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qheq8SiHYSJy+xlflvbKnnsiqtoSUXKSs28gSxfcAg=;
 b=UoWmoTD0aQr4/lKDRvQtcW3MyT8w1Pj8DbDJ7/23LPxcvNJ+HXKLz3v29AFS3fYz8+3V9DwCbTJI3hqiNqr4HsxM0+eRfrRcvbRvhqIGvYbrQ3uxDFZDfoWBEBZfMWSvLIaTq1ScNjNWPbr5dB4faPLFYBmZolgMvRc0+LSBagaXeuOfxEBtoqCCp5qAMChPdbPQb5SuEGHeBs6/z25L+KE2j8vuH1O+Bt7f7Gcyr2zrX/1xl7xLlZv+blPNw3mFKh+JCv50qcYD+f5LcxV8oh3cs5tmGEI5hxFGGAqPNZTjG6BPsONkiyIjR5T5kGbwYZF7mbBV67UDHwLRwfz57w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qheq8SiHYSJy+xlflvbKnnsiqtoSUXKSs28gSxfcAg=;
 b=X9kRzy6UDus+sWOVIbA2L06KkLei8TmbF00XyUjTux7+SaM0LaE2Vn0u45T1UH7SjbJ07VFQ6wHq1edHVNmYZpy2ioANifDyOiJIIaog/QXYNfGdepS2LyArKmHEc1MmsdX+tS1YV1rDkGTlL2ijTIqJNgH6ex63vSPbkY/m80w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS7PR12MB6118.namprd12.prod.outlook.com (2603:10b6:8:9a::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.28; Sun, 28 Jan 2024 05:38:31 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64%4]) with mapi id 15.20.7228.029; Sun, 28 Jan 2024
 05:38:31 +0000
Message-ID: <1162e59e-3f53-4c84-b186-bb2f4642216b@amd.com>
Date: Sat, 27 Jan 2024 23:38:28 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: add panel_power_savings sysfs entry to
 eDP connectors
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20240126222300.119292-1-hamza.mahfooz@amd.com>
 <1b8de155-4788-4c12-9c40-d45e508a526c@amd.com>
In-Reply-To: <1b8de155-4788-4c12-9c40-d45e508a526c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR05CA0068.namprd05.prod.outlook.com
 (2603:10b6:610:38::45) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS7PR12MB6118:EE_
X-MS-Office365-Filtering-Correlation-Id: e404e8af-5259-4dce-399c-08dc1fc35cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FIRVBN/AejC/PMWbuniYsUdbfpE7KdLsPqfRm2jYnR8jdrQXCOj9nr20m/2e6LM4fLkvc4dEJ+PyqCoeQgW/mhHaCyfBgFd2ElFpXY3AigoVrvNpxdTV8RnorWUlw4KuI8iuFF6Du5q+oj9DmKDBamSfDe7tTWfwm/+y9A8cqfGezj/hDklwfRH9ETbGPeG7+7r0hdqMPvX5G412kx53bZtWIlAu3A9WxKsJCxNrqyHzfmz/qMULML5amUhSATX2Y4eMdBdTfJPmGqMo7JWFE5xtIiauh1okJ4SE9/8P62frDjRDz8npuQqivNQ+FZITbq/JEpHDq7uN3wV7mY4+snJNn8FK4ywoubLRtfmI6ZtQ5JWfkQNv/THqzNAYw43mUOSPpERels7OQxEFkbjZgFGqhwqm6frok6QaGobzchuQfWDdPPvFutj0RIQva0pyj4vjwiQjNFqJqCqgKIVWMxkK/4GGIUyS4/6G0hCA7pXTjsP0k86Aeb70U5yiNiooeKca6Vowe9c2FUH2UJwc1n5SbnQoYXpLvkMyCIZoLRjN+gyIO6rjvlg0QyAPGaWCG7myS/AzVQPyuSr5NcErZkTqGyN0cj9GN/noj3mL+fOneHRTRKmM7s8XfVl1jkYJ2oNJ9uqcSdOJbmdJ2V5VeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(366004)(396003)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(2616005)(53546011)(66574015)(6506007)(6666004)(6512007)(83380400001)(5660300002)(44832011)(2906002)(41300700001)(478600001)(6486002)(8936002)(4326008)(66946007)(66556008)(316002)(66476007)(54906003)(8676002)(36756003)(31696002)(86362001)(38100700002)(26005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MSsrcmdwRDM1eHRySlpjTkZvOHR3WjlYTjRSU2xMTUExWDdpS1pvenIyOTI2?=
 =?utf-8?B?TkV2VkpkdEFOL2xrMGRtOWorc3g4UnRkUXkvOS9lVWZPU0FIeWJQTkRraDlZ?=
 =?utf-8?B?UjZ6S1hxOHBxQlNDSDF0MWR5QzJCN2drR0JMRlV4OEptdEFydXNheFVkRUtV?=
 =?utf-8?B?Q280VkxDV1hBbWRYcURyN2wrUDNUWHVjWlIzUkhtOFdsU29oT3lwV3FsQUp4?=
 =?utf-8?B?dys3VWppTjFHbXhWYStnTmFXT08xSHNkZjZHWG81dm5XTzd4R2dZZEVpQ3dT?=
 =?utf-8?B?c0w3SmdjRFVwVVBwb0YrZWRpQ2dhSHA4U1RwT3NmR0l3SEZySmYwMGJveGpX?=
 =?utf-8?B?ZitkdXc4bU0yb1NPbUxlcGlMWVJLelVhUlpEYVFNZnhJTlR4WklqbzRUUEZp?=
 =?utf-8?B?M0VqNjF3UFV6K255QkxuYTc5ME5jV3JBbFQ5eUg5VFBRVWN6UzV2SVpudnZI?=
 =?utf-8?B?cGRpUDNnSXFoZzhaREExbUVyM05DZk5GTTEwQk1mQjVxTHdLekVEMWtJM25z?=
 =?utf-8?B?cUxscnNkM1c5VStVRGVUUk1RUGRmMERjMGJoLzNnbkNqZ2p6a08rYmFRUzFJ?=
 =?utf-8?B?YitUMTRsaS9wcCtlUUdHSVdXS3ErSmRmMkxja3NJaklXTFdaOGt5NDhIOTYv?=
 =?utf-8?B?akZzblEyRm5UMk40ZFF0cDhHTk95SHplaDNncjJQcGZqVnFGemtQMWRiWTNv?=
 =?utf-8?B?S0k4bnFWL1lhTzNvM3prUldiWGlEQ1VVeit1b3RCUnpEcHJPQVF6eTJzYUwx?=
 =?utf-8?B?UVR6VExMVEMyQTM1OTU5clJDYnNOZVFjcWZnWUYwanBsYUZLY1J5bHlkb2JW?=
 =?utf-8?B?OTYxcjY2VmkybmROdGp1NzF4UjZtL0piZWZ1RDJCVUtxYXJxYXhrNEkzek4y?=
 =?utf-8?B?U3hINFVzdllWUGVoY1R6NmxhZndHU0tQR0dUWHF4QXlCcDh0eTZYN1VBeGxC?=
 =?utf-8?B?L081bHhHUkdYc25lVGhHaFdzajJyZVFkUWRDVHRMdnN0RzNhd1c1dFNhM2hp?=
 =?utf-8?B?QlRjSzBSK2pkSnEzaGpmNkJlQmVGQ0l4VmNjdjlsRUVRRy95TkMyN3hTb2VD?=
 =?utf-8?B?Tm0wWWt2a2tZdHlMWnA3dlNsZllacS9JM3Iyd1NOU0w3eEtmVU9TeHRFdnRj?=
 =?utf-8?B?V2hSbEZCT3c0MGtteW1KT3dpOHpVb2VqL3F6QnFkMW44NExwMDJUTXdxZVF3?=
 =?utf-8?B?YTRRMGliaC9SWWdSdjZiZndsOFBQZHVyQnhwTFdzVnZicnEvTTBubENjZWhP?=
 =?utf-8?B?NWZZbU1FVUMyZzNLWVlkcGpySnorSm5ncTQxdnBrcStNMnArbXpHWHczUjRS?=
 =?utf-8?B?WHNRVVFkdTloUjNYRTVoYnprYzhBRHNLcTNLbU9RNWdlMmlweFUxOUVaKzJK?=
 =?utf-8?B?djY0bVJWcCt6cEZJTEVhMVNVRWMyN0s5cExxR3F5VldENXVYWW9FQWZiZEll?=
 =?utf-8?B?Z0hiTUhEeWQwc1BsUzRwbmgxcysvdWhBaXJ1VFdEWWxVU2JEYkRwaDhqb05E?=
 =?utf-8?B?Njc4NGRNZE1sL2pKTStDUkgvWFFCSXZIYmRZRmlyZW1saXhvL3krc3EvOWxj?=
 =?utf-8?B?Um9EdUlOV2cwRHRId3NzYWZ4V1RCSXptNXVQc0tmNy9OZ293UDlMN0krVXJI?=
 =?utf-8?B?ekR2aWpsSWgvYTVnVVdLQS9CSEZrMXZvR0xDbGU3RXdGaTRrZ0gwbU84U3V6?=
 =?utf-8?B?KzR3Q0JHSXJGNWluNXpLUnM4MkRWOUhUUzJpcTI4YmZUVWFoNTBCc1RZdTk5?=
 =?utf-8?B?N1piNlVndC9PNkVYK0theVBEcGRtQW4vaEtqL1pYVnlDcGNJeE5IbXdZRDJt?=
 =?utf-8?B?WkRPK0xJQkx3dU1acFNSUWJtV0hOTldIM0lCWXpheEdzbTdFaU5melJ0cEVT?=
 =?utf-8?B?VndZcndZTStSMTZRZVc5NERiZHViUDBtZytDdUFmR1E2OVdTN0hud3ZuVXhs?=
 =?utf-8?B?ZXdER1BWbWYrb24rNjQ2Y1ltd0tDM0xNN2pnb1ZxVjFLNkxyanZtVHNhR0NJ?=
 =?utf-8?B?VmowMlVreHZBc25jRS9WeXNYbFRXVjFTTFBWWm5xNGx6VnlIRGZCR2MvbjRy?=
 =?utf-8?B?ODBBRlExQ292SWJBZG5BVG1yVk8wRGkrU0pSNFBTNy9ZTm1zN1JkQ1dBVG9J?=
 =?utf-8?Q?3nLHrHZx5dKcjt2gslCz5cYlr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e404e8af-5259-4dce-399c-08dc1fc35cae
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2024 05:38:31.4962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0E2eAWyNJJlpK+9T6P45foWK5KmGVIPVYeJWKoT8KDd6LNyBcLtNjeYnGeIZyx9pP4cJv9w8/GQDK8j5BLSHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6118
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
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Leo Li <sunpeng.li@amd.com>, David Airlie <airlied@gmail.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alex Hung <alex.hung@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/2024 16:34, Mario Limonciello wrote:
> On 1/26/2024 16:22, Hamza Mahfooz wrote:
>> We want programs besides the compositor to be able to enable or disable
>> panel power saving features. However, since they are currently only
>> configurable through DRM properties, that isn't possible. So, to remedy
>> that issue introduce a new "panel_power_savings" sysfs attribute.
>>
>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 59 +++++++++++++++++++
>>   1 file changed, 59 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index cd98b3565178..b3fcd833015d 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -6534,6 +6534,58 @@ 
>> amdgpu_dm_connector_atomic_duplicate_state(struct drm_connector 
>> *connector)
>>       return &new_state->base;
>>   }
>> +static ssize_t panel_power_savings_show(struct device *device,
>> +                    struct device_attribute *attr,
>> +                    char *buf)
>> +{
>> +    struct drm_connector *connector = dev_get_drvdata(device);
>> +    struct drm_device *dev = connector->dev;
>> +    ssize_t val;
>> +
>> +    drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
>> +    val = to_dm_connector_state(connector->state)->abm_level;
>> +    drm_modeset_unlock(&dev->mode_config.connection_mutex);
>> +
>> +    return sysfs_emit(buf, "%lu\n", val);

When the system is first booted up with nothing on the kernel command 
line, this emits the value for ABM_LEVEL_IMMEDIATE_DISABLE, which isn't 
something we normally should be showing to people.

I think you should be special casing it similar to how the store special 
case works.

>> +}
>> +
>> +static ssize_t panel_power_savings_store(struct device *device,
>> +                     struct device_attribute *attr,
>> +                     const char *buf, size_t count)
>> +{
>> +    struct drm_connector *connector = dev_get_drvdata(device);
>> +    struct drm_device *dev = connector->dev;
>> +    long val;
>> +    int ret;
>> +
>> +    ret = kstrtol(buf, 0, &val);
>> +
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (val < 0 || val > 4)
>> +        return -EINVAL;
>> +
>> +    drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
>> +    to_dm_connector_state(connector->state)->abm_level = val ?:
>> +        ABM_LEVEL_IMMEDIATE_DISABLE;
>> +    drm_modeset_unlock(&dev->mode_config.connection_mutex);
>> +

It appears that the ABM doesn't actually take effect by writing this 
value until the next modeset.
This is also reported by Dominik Förderer.  I suggested he try to change 
resolutions in his DE and that activated ABM.

So I think it's missing another call to flush out to the hardware.

>> +    return count;
>> +}
>> +
> 
> To make this more discoverable I think you want some kerneldoc.
> 
>> +static DEVICE_ATTR_RW(panel_power_savings);
>> +
>> +static struct attribute *amdgpu_attrs[] = {
>> +    &dev_attr_panel_power_savings.attr,
>> +    NULL
>> +};
>> +
>> +static const struct attribute_group amdgpu_group = {
>> +    .name = "amdgpu",
>> +    .attrs = amdgpu_attrs
>> +};
>> +
>>   static int
>>   amdgpu_dm_connector_late_register(struct drm_connector *connector)
>>   {
>> @@ -6541,6 +6593,13 @@ amdgpu_dm_connector_late_register(struct 
>> drm_connector *connector)
>>           to_amdgpu_dm_connector(connector);
>>       int r;
>> +    if (connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
>> +        r = sysfs_create_group(&connector->kdev->kobj,
>> +                       &amdgpu_group);
>> +        if (r)
>> +            return r;
>> +    }
>> +
> 
> I think there should be some matching code sysfs_remove_group(), maybe 
> in early_unregister() callback.
> 
>>       amdgpu_dm_register_backlight_device(amdgpu_dm_connector);
>>       if ((connector->connector_type == 
>> DRM_MODE_CONNECTOR_DisplayPort) ||
> 

