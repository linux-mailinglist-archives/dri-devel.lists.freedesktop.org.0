Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA1A856BA8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 18:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEA710E2EE;
	Thu, 15 Feb 2024 17:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="czuK4BaR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2071.outbound.protection.outlook.com [40.107.102.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC04E10E2EE;
 Thu, 15 Feb 2024 17:55:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A93gn1jrB1qtluY0Pn7opGlfIHpuI0u0+RAlwlJ57Fmmp8ck6jYXQIRZa2cs1T9TuDSR0R9fe5phER3OxjF6I/snURMCD0jNP+gghhlyY+MKCaq+g8Ri+ueRquFVoSXKyhAj5VNhHnNL+mbavfJ/4XZcE2zrC7iGxrlbSEWrtrjWJ6qkpNXtKiw61Squ+jGW/imGNZWwJiP9+OfiPjx7dJm2/4DhXi8TeMzaBghT09bVu7CPqwwxwagOMLuXmoOw8dZzObbvSXPOpe6xejfkpDNEQCC4HVlbEUhNCThjuut+M2rmLxh0H+j9akKUot837NEHM0oUpAagMNz4Rh+Ieg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDCe6dLJWMGRbrVpf9iiIoZsa8RGE41ln7bGvyzXwEE=;
 b=Kihsw7osQEiZCdsYJNa1e04YE2KqoC3fL5+ge3j35wOZzeFeOhT9z1z08qvJALo7SMk05rUB57pPFxc4WjnIYFgry4BPwVLxG7QHtqTA2wj1VJlM8UfeCy3FN5ier+rgSVMbuiXKZNFkCaWCZeCNZaVYuLMl0Sp6vbLimgxbrSa1VDOi5lWPm+47h/ehLOSfzqfCrcVU+Yu8/95uEEv8clk5QpizGEa1JjCJrmPL/dZwREscHAuk0msjDkWrg1yQt4esZjWtGjyXYXxnJmPNlgEHrpFGQDGxDFWLnQa/A0AKDfXnBKUgwNr0CFmoPGI+GzdcbsjTjTnqGd4OK20XUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDCe6dLJWMGRbrVpf9iiIoZsa8RGE41ln7bGvyzXwEE=;
 b=czuK4BaRXT5f6e0hASQu6rdyjjAaz8pI+7IHsAXku718Gk9v1L9r1wy6N3T3jrYyAmEJOm4g6LyF7GhvHRYPScGGCDtFyh+MZSBQQN+dTr+sVVqFzdtXtYlv0YauJe1FGq+FrEWm/DOkKuWrLwk6mqAl7aMVkcL/pSYbAMox+EQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CY8PR12MB8411.namprd12.prod.outlook.com (2603:10b6:930:6e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Thu, 15 Feb
 2024 17:54:59 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3f6b:792d:4233:f994]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3f6b:792d:4233:f994%6]) with mapi id 15.20.7316.012; Thu, 15 Feb 2024
 17:54:59 +0000
Message-ID: <b117ccc0-6569-4753-9cb9-c304f9e50d30@amd.com>
Date: Thu, 15 Feb 2024 12:54:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: add panel_power_savings sysfs entry
 to eDP connectors
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Hung <alex.hung@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240202152837.7388-1-hamza.mahfooz@amd.com>
 <0b94b25a-9ffa-41a5-b931-ad84e1892d36@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <0b94b25a-9ffa-41a5-b931-ad84e1892d36@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0328.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::20) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CY8PR12MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf1b3dd-963e-4c77-bd54-08dc2e4f39fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6COrR2U8otOsmv9P06YkAe7pd0pXVjHMDG8LyihcIOqcjPAV9NYjoGNHFTWXRu9MrgWgEHhVuQOeGqe9qd0jccYg1NyZyjpjILfl8g3RbXj4vwxB/hAQUm4fv38nnfKMpcpi9BNn9FFHfWvRNRJeyD2eT4YSaQ/zeP866i1C0/DaDDwnWzeFiZhFtpcdnmYuffo0T7kUSgj6sV5HtJov2wQThXd2svHsxAc3I0p3slhmph5WkNltOxP/fL+1PSzvtvDbfFH7/qycJIa9vLjNzE+fAadjtyijJpe/zCWoKru0PfxCOsTKPcz+MBucbbuHJ9m/VLfxCB0o+VtC4L4k7ccG6y1uEbDdkiBBrHvGb6EabU+SL8rpRL0uVuV5OSjZAZrriE/HtQ2xFbG3Nhe2bZWp3sPyhdNX1bhkizxxn29u7nHHNvxjc24rIjjlfQGYF0Z+RqqXOts2Yx4lSxzzPHmkZ8DQeYSWX51IpwBDd1eu8XDTdFMOwV2hAn1R0CmlGeL3cFnBdx1x+UqlDjiVhCfSYoOQElpO/dVidVGQPJpuVqjrPH5IRD5u0cF9Keij
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(39860400002)(366004)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(31686004)(54906003)(316002)(41300700001)(110136005)(66946007)(2906002)(66556008)(66476007)(4326008)(8936002)(5660300002)(8676002)(86362001)(31696002)(83380400001)(44832011)(6486002)(478600001)(6512007)(26005)(6666004)(53546011)(6506007)(36756003)(38100700002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2w4ZGZEN0JLK2Zpc3VQejBLWiszWSswd0d3cmFETWVaempRTGtHRjBmdDNU?=
 =?utf-8?B?TzAzMjg3S2tYeUZkWW1ZZUZQMG02djhJT3ZsMXh0VHYvRUxyKzRvY3VwdFNQ?=
 =?utf-8?B?cTRncHFMZ3ZWcXFhVkpSeXhuL0N6b3owa1pOMFN1eU1zQjJFRlFjWjlLck5i?=
 =?utf-8?B?YzYvVXJUSEVEb3ZwM1FKd3BMZ3dvS2hNZkJOcmFlRXd0bmVMdjN1KzhCQzBr?=
 =?utf-8?B?UFAyaGN6Yjd6bnpXVmY3QmhmS3ZMcGhITkhrT1BlejhLMHZXS0ZBVTU0dXFj?=
 =?utf-8?B?RktKRGd4VytLQ0JRZTRXbGdVRG1rVVZabDBCaFJ2Wm1FSXNzK3FxbkJUdk40?=
 =?utf-8?B?eUowQnlhS05maVJhUXMzZWJJTTZzVFBlNzRQZzBoNUNqN2tKT0dXbFF3K2JP?=
 =?utf-8?B?di9wVXZCSjFxT2VHUnZrQzBJd09PbjRvVUxsZ0lSR3Z0MzhHdDJ2M1RvSHZY?=
 =?utf-8?B?R2tnVFIxRnNLT3cwWmQwSmZGcWIvazRzcVpZTTZtY1lUdmZrVWVqRWZrb0RL?=
 =?utf-8?B?NzBZWVJpVmlhaU5ENVJNWGJiYkxUYUJxU3ZDM3dDeVp0TnZNc05NTVE0bmdX?=
 =?utf-8?B?Uk1IK29hejJhSHM5N2lLdXlaWG9GQ2QrZVVLTG9raFE3KzhJdnVzQmhGb0xU?=
 =?utf-8?B?QmJ3VnVRY1o2dkYzaXdoT0V0a0NTeVFUY2YwbVY0Wlk0Mno1ZEprSHNYeEFD?=
 =?utf-8?B?d3ErdUNjaHB5VEtkL2hyY0k2U0JQWnZDRytTbVBzMDBteDI3Mjk4cmYvMjVu?=
 =?utf-8?B?TElqU3lTZTBCWkR5QzlBSWJTZ29mdzBpeTdBSU80TE9kcXZLNFIzUDV6eVNo?=
 =?utf-8?B?dmFJQkxRRzE4UFhxR2xWZG03ZStIVWJKejF5OGh3YjgxOURXUkNtQldRUEti?=
 =?utf-8?B?L2EyUXRjWXVST2piZm5tU1Mya0dic2F4S3p4SUJZeVF0eGt6ZVdyNCtDeXJy?=
 =?utf-8?B?Q2ZZRnRHU3M0cjdaMzBzYkNOMllsZlpPNDViWHlZN2E0bmRrWk5yTUl5Mm1N?=
 =?utf-8?B?THhTN0xINTh1c2l0dTNJMk43aFNuUjlVWnVnSGhDWk1OMmY3MndqNmYwOHN0?=
 =?utf-8?B?cVM1SjlTRFFCRGY2NnlrSTFnQjdhaGFSb1B1UEVhZWhYNHdxeEpnTWRFMkli?=
 =?utf-8?B?MHVpM0FKV1YxdTlBeGtGMmVkOVhVdHNESFhqMEc3WDRmU0ozMEhSQStHOEl3?=
 =?utf-8?B?QWI5UU00Z3NkTjhFK1VEc1VkNlp6R0djY2VnenRMTlJFcUNaMW0xTHl6enNs?=
 =?utf-8?B?Rzh6eFlreGE4RERjUTJ3V2JnMDFkWHpMbzhuc2E5M1B0SHFZelJaZ05QVHF5?=
 =?utf-8?B?b0x3c3ZiYkJCS2IrbTB5Z1Zjd3VLb04vK2xzMjZwL1hKTWxVQXZmQ0JiOGVY?=
 =?utf-8?B?bEVBcFJDSnBrRys2Szg4VjloYThkV1gxdmNidldHV2F1cVRxcWk4TWpMdm1D?=
 =?utf-8?B?NHl3RFhKaXgrUzVjV1lUMSttT0x1bGZwS0tGVjNBWEVtRTdHaW9mMnhCSW51?=
 =?utf-8?B?c0wrV1pGMGt1eWxYTXprL2FqR3dRY2xZdy9lVWRMMmhZRG9weFlPU08xaHc3?=
 =?utf-8?B?RWJNRGVINzlaNTNGWE05a1ZmWVp4VTRDc3BHaXhWWFhIU2xBVjdLNVJqVndx?=
 =?utf-8?B?MEpnY1h2eTIzRWVnelFMY0g1MW4rTWxNb1dPQzRCbEJlZWVqbnJYWldYcVla?=
 =?utf-8?B?aERodUNRTml2aG1EczlWUzdjeWlmcERreVpHVmFHZVEzbEpkbTBmWVRFbnBP?=
 =?utf-8?B?Vys5eWpDWGJZNnZaYkJRTmFaVjA3VU1BendqdjliRmRjdllNQ2RLN1dEVzBa?=
 =?utf-8?B?UFNtbTBWenRNQlluVkkweHlSMlpGOTVYKzkwYXEzaHI3dkU0eFkvbTdDQTVD?=
 =?utf-8?B?dTJWZW5jc1pncElmVktDVXhpTUtOaytWRlk2bC85VEFSVEZpRkJTcmtLT2FE?=
 =?utf-8?B?ZXlNaG5VRVRlUHU2TnM0eWNJcjJYZWptaHhhZ2ZVU2JralZGOEkzQzhXb2Rv?=
 =?utf-8?B?M0JaSFAvYWtCRW5QWjVLVHRzSHBScGlwQ3labHJDMUlCZTBHdFliWVRYTkk2?=
 =?utf-8?B?UXd5b3ZlMzdTTU9mV3RIZE9zQmwwR1V4cEgxc2pLZTVXQkpxVllSYTEwMWlB?=
 =?utf-8?Q?DwkL/cRspbVbPshzA5S2LR8eg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf1b3dd-963e-4c77-bd54-08dc2e4f39fa
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 17:54:59.0945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RUgUzL3c0rCSRvunOLd3imn/xh4Wk/qTVF3pANFOq74fbYuYcoXzYa9Kxey8IUuxyXb8TThyIXcArN1yJXN7Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8411
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

On 2024-02-02 11:20, Mario Limonciello wrote:
> On 2/2/2024 09:28, Hamza Mahfooz wrote:
>> We want programs besides the compositor to be able to enable or disable
>> panel power saving features. However, since they are currently only
>> configurable through DRM properties, that isn't possible. So, to remedy
>> that issue introduce a new "panel_power_savings" sysfs attribute.
>>

I've been trying to avoid looking at this too closely, partly because
I want ABM enablement by default, with control for users. But the
more I think about this the more uncomfortable I get. The key for my
discomfort is that we're going around the back of DRM master to set
a DRM property. This is apt to create lots of weird behaviors,
especially if compositors also decide to implement support for the
abm_level property and then potentially fight PPD, or other users
of this sysfs.

I'm also not sure a new sysfs is a good candidate for drm-fixes.

Harry

>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Tested-by: Mario Limonciello <mario.limonciello@amd.com>
> 
>> ---
>> v2: hide ABM_LEVEL_IMMEDIATE_DISABLE in the read case, force an atomic
>>      commit when setting the value, call sysfs_remove_group() in
>>      amdgpu_dm_connector_unregister() and add some documentation.
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 76 +++++++++++++++++++
>>   1 file changed, 76 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 8590c9f1dda6..3c62489d03dc 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -6436,10 +6436,79 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
>>       return ret;
>>   }
>>   +/**
>> + * DOC: panel power savings
>> + *
>> + * The display manager allows you to set your desired **panel power savings**
>> + * level (between 0-4, with 0 representing off), e.g. using the following::
>> + *
>> + *   # echo 3 > /sys/class/drm/card0-eDP-1/amdgpu/panel_power_savings
>> + *
>> + * Modifying this value can have implications on color accuracy, so tread
>> + * carefully.
>> + */
>> +
>> +static ssize_t panel_power_savings_show(struct device *device,
>> +                    struct device_attribute *attr,
>> +                    char *buf)
>> +{
>> +    struct drm_connector *connector = dev_get_drvdata(device);
>> +    struct drm_device *dev = connector->dev;
>> +    u8 val;
>> +
>> +    drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
>> +    val = to_dm_connector_state(connector->state)->abm_level ==
>> +        ABM_LEVEL_IMMEDIATE_DISABLE ? 0 :
>> +        to_dm_connector_state(connector->state)->abm_level;
>> +    drm_modeset_unlock(&dev->mode_config.connection_mutex);
>> +
>> +    return sysfs_emit(buf, "%u\n", val);
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
>> +    drm_kms_helper_hotplug_event(dev);
>> +
>> +    return count;
>> +}
>> +
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
>>   static void amdgpu_dm_connector_unregister(struct drm_connector *connector)
>>   {
>>       struct amdgpu_dm_connector *amdgpu_dm_connector = to_amdgpu_dm_connector(connector);
>>   +    sysfs_remove_group(&connector->kdev->kobj, &amdgpu_group);
>>       drm_dp_aux_unregister(&amdgpu_dm_connector->dm_dp_aux.aux);
>>   }
>>   @@ -6541,6 +6610,13 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
>>           to_amdgpu_dm_connector(connector);
>>       int r;
>>   +    if (connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
>> +        r = sysfs_create_group(&connector->kdev->kobj,
>> +                       &amdgpu_group);
>> +        if (r)
>> +            return r;
>> +    }
>> +
>>       amdgpu_dm_register_backlight_device(amdgpu_dm_connector);
>>         if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) ||
> 

