Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9908E83E583
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 23:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2505D10FF52;
	Fri, 26 Jan 2024 22:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A4610FF52;
 Fri, 26 Jan 2024 22:34:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmNg/CapgeYmwwpyz0jNYDzS8j8MG79UlTeWmwL7eE3pFGFtZ2mQBWtjlGd7bLAKJ3OhWkyHvVnhxjzGgCqmfZv474/CmL497T+1xSUaaUs/9FIM8geZ9PMB6EGhypVDg6XOWVgeib3herN0sum9rrwcpsD2Lj9W6pA4i1B8Jej8lrmog2gHTaq/jbob1cV+gmUbhfxpLL+I1qiPRoHVJT4OHG/wyrn3lyusbX6Ri4kiVH6PuSO0kKyP9ORm0tYJ1wi+vKTwdcwZnmEoNj1dfLCTQiQWtd0Xl+QvcHmxv+j8bxvp0YihDdb9l1YCGq2f+PBT1a3bvjGEnJ52ShqU5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ATG1toL6hjG2NUuPiSo9MnBzpSinq1RmatEqTgkxP1Q=;
 b=fnSXERaGSwY9UMgqYSA8sT1PshECp/F6sKhH4pfdmXbT2izF9GVIKLEnvblUPQg+bpnI6b7h11/59yFWa7dhFpKjot4XdgyEmxQY6+1hWF/QfhrilLQ+CzRX6uVCx7BGe3ATJ2+dlMdW3LGYgm6uk8v1SYU3W/EEb3MXf8qAbmGUHieW8UEtP2uxNzM5jGU9UiiIUWrDNJwmQ6JCeNKv+15X4DFvz6R+t+PFDcOCaJywLxaCuDbueyAOAwohDjkUHXXFvvkQqpRE92tGl2m/NlHJrnHkr+tpMp97lXZziQwSkZy+DmSv0D1bSGbF/uDnsTEs4s6Ndo15bJDsabagBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ATG1toL6hjG2NUuPiSo9MnBzpSinq1RmatEqTgkxP1Q=;
 b=SCFVnjI/eLkWVlDnmBFPH27AxXp2IJ7AJlOhlJHprXIaosdfRMbmTxyKqq+reFW6+Zdtfaa6cRjq7TYmDYyQDpVooI8fGy012YC7L3B7NY+PzsbRaCpD7/fLYI9nWTkOoDtQU6RDRkfN6TfveVLWYuYkGsQr1bUvvrTRJr56VRs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW4PR12MB7438.namprd12.prod.outlook.com (2603:10b6:303:219::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 22:34:51 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 22:34:51 +0000
Message-ID: <1b8de155-4788-4c12-9c40-d45e508a526c@amd.com>
Date: Fri, 26 Jan 2024 16:34:47 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: add panel_power_savings sysfs entry to
 eDP connectors
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20240126222300.119292-1-hamza.mahfooz@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240126222300.119292-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0024.namprd08.prod.outlook.com
 (2603:10b6:a03:100::37) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW4PR12MB7438:EE_
X-MS-Office365-Filtering-Correlation-Id: 67cc7c27-28c3-4d0d-8538-08dc1ebf02be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xo01b92TKXoJbClgcdM2l49BbSBogBTBWDm863UoEIndfH0GwyzbHI1ccAVpxf84Kv+eWdOuLxrAQeL1yUdUsN9cpq35/PD9q39Ka/DrC1l8okmb77WeK2uoGAfCa9eQWGp9Q+FsW3/q5rnLWgoHzK6MR/wvfOzFh7PUGwj0STw8Nij3D5pkIF5kAtUQEq+KWXxhhMjlGGdxqVJtbqNf4CaFNu7FsoNIaZJDpfOrETcGNqdPAqkfX0WPNYPXMYatMV93lNKUQWB1Kff9+vby4QY35XZ+iOGZw+5cVXZNgCdMxlORn395fKGPKyaO6SG67ACRM4d+oepj4YgTFcjaqEyIiTpFC5uF/xFtdSA7oXrCVdFY+93+AvkAulGteITHAAlBRWio+HhzhY4rrZB1XgTth8j6VJe7aWUaa4kCA+BMrSBIkAkyYFoG0sMtbQTzG7F0896sLyd+9o4nOSnV9vtae6/HPTYmYDFim4jAQSMeYbwTmT8KRz7IDtV7xhb5XlqCmVWk8SuJ1WvY4jEu5rbD0tYDPB3YsEFPb/vxEHNZrm2zv9zMw7b1WeSdJC19GdaEYJ3sSqWyYdbkZJ5oW3XhZfY/Hh/rIUgixRXcnFBZL9Qu5HhSiFj1E1AKMTaTtOBZNDO4t4CSHaMFuddqGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(136003)(346002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(41300700001)(38100700002)(6506007)(31686004)(6486002)(8676002)(5660300002)(8936002)(44832011)(4326008)(478600001)(66476007)(83380400001)(2616005)(36756003)(2906002)(6512007)(6666004)(53546011)(26005)(31696002)(86362001)(66556008)(66946007)(54906003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEMyNkxyT2lUeUE4OUtCSWhVanhjUVBpOElkNFRORDJwemR0Qk9mQW5wbHl0?=
 =?utf-8?B?SXRGelVLNGxJOElHdTZFRHZabE1GWXBBSGRoUUJBcW1ER0cxQkNhLzJsblFp?=
 =?utf-8?B?WURYZ2VIaXhvQlZpZHc5bXhrdXk3aHl4QjcxWUpsMEJsbUt4bCtQSUpsODVF?=
 =?utf-8?B?Rld2c3FvU0JhSjhSK2F2V0VxMnJqcWhrQ1RDVG4wVEZHYlRNdWQ1Wko3OUFq?=
 =?utf-8?B?aTgvbDdqeGdJZGpIbjhHMXBxRFZUbStSWEN1NThRTXBZMjRkTS9vZ0tyeGNS?=
 =?utf-8?B?V2xqL2NzUU0rSWpuS1lLZk5QM0NzWnpYYjlkbkprZ3hTTTFjcDc3Vzk0Rnpx?=
 =?utf-8?B?cXJRYkRzOTBRUXQvUm5hbGxQZXdJZ1FSTlRBQ2hYWFhadXl2dktSME5tWWUz?=
 =?utf-8?B?T0FlenBhOGF1UW8yZFd5cHZpaFhaODFCOTgybTRQMGVXSnVFaG1wQnJJbnBW?=
 =?utf-8?B?OFlwdVhyOUo5MGYzdC90bHRhYmZOZWZHTnBOOHd4RnJqdGtPdDRsOTErN3do?=
 =?utf-8?B?T3JUMGNXQmJMaXNvZFlCYXQ0M1cyalBnbmx1ZkhvL0h3ZVdjcU92M0Z5S29i?=
 =?utf-8?B?MGJXT2s0V3Q0S3VvK240dmFZRUJXS3ZDNElYWUZYRGJ4SWtJN1FMcVVpY0sx?=
 =?utf-8?B?YlZpN2tXbnN1eWFtZ1BNcmE5UklFNVBIYnJaVDVZZXpSZlM0M0FnRGJlTS9k?=
 =?utf-8?B?UzRjZ2h4UlYxdGpuZWxpNEZEbjVKSVVyb2xTNXVLT29hWTdmbnhVSWIwMWlU?=
 =?utf-8?B?bXliVnJCL1NTVDlsZUNrQTNGU2FyNmwxT2pkUmhOak54aHhiWUwyZ1J5eno5?=
 =?utf-8?B?UWU3SFRab2E3YytORE1RYzljcDlielptMDhpankvWmlLNnpZdmlaS2lYbW5p?=
 =?utf-8?B?YjJuTnVwR21weUprdGd1MnpwT0pVdGJOR3FWdUtPak4wVkRRekV6K0sxbXoz?=
 =?utf-8?B?TUhaMitreXEzQ2lpWm5Pc05KYm50bGZIT3hEaVVGQjNFQmdFNE9oVHlvcE9K?=
 =?utf-8?B?NmoyZ21Mc3N2bE1qNzdUOUJNajJMd21jK0hYRS9BOUUwdGNjb1ZmcFZsTzFm?=
 =?utf-8?B?UTZSWWd3K1BmNy85TVY0WXF3eTY0RytBMXpiYkMrV3RubXl3U2dpNTh5N3ZI?=
 =?utf-8?B?cHJFL3FOeTY4ZnpFTmpHQm1XdXIvNG0wdmZtd204ZjJoZk81M3RudndGU2pX?=
 =?utf-8?B?R3N1TFljLzltNkk3Mjh5SkFOMlB0SzFtcWs4a01kNStlQUtHMjVYeFhOdzJW?=
 =?utf-8?B?NkVjVkkwVW9TM01xM1FuaVFVV0JTWFRFUFNROEdaY0tXcjBzVlBnekFvemx6?=
 =?utf-8?B?Qm52UkVCdERYUmplY2NVNFFLQkdXQ2xFOGFQZGZpT2xWMmFjaFYvRXdWeENQ?=
 =?utf-8?B?Y1ZnejBDNHB3d0I5M1p0T2pVeE9rcmd5QjU5bTljNlhpZS9XSmx2emx1cnp0?=
 =?utf-8?B?bE1NbktSZ3NCN2RtVWI1bjBTaEN5WTlVZ1MwRnFHaC9wdVBGWlpIdFJBZ1Zn?=
 =?utf-8?B?OXUyOE5KbmNHdkZINGpiVTFROEJnK2t4WHRvczM0WkthMy9uRTNSQ0RsbUtM?=
 =?utf-8?B?N0h2eXE0U09wWnB5Wk5YOW5OOEhVV1FMZEI3bFJDblIvVVhmN3R5d25NVjF3?=
 =?utf-8?B?WFEvZGw0ZGUxRUtYNzB5Qk1qU0I5dU1NQzhRc2gwQ3dUK1JFMUlyYUl1MEl0?=
 =?utf-8?B?U3dtR0U5WERGN0RFN2NhdExOSHRtUm8vWUdCSUFWNXJ2NmZ5dEptTmdrZC9U?=
 =?utf-8?B?Tm1WV0NJeHZEd1pqUkZIVEJPM3Y0ZHFRanBiM1M1ait4N2huRVQ5eHd1YzRp?=
 =?utf-8?B?NjFiR1Y4TFZlWWRtVWpuRnJoZk15WU92YTU0N1BITjZ1WTByVUdWREdmMU1I?=
 =?utf-8?B?NzRrT2FGQyszRWhNTXZQVW1manB2blpxYWlnaHlJMEJBRXM1VWVLcFBvTlR2?=
 =?utf-8?B?eVJZK0IrcmhSeXJ3RzN0dUhyWjBwbzk5Zm1SMTlHTTAzNU16cDFORVAxT2VP?=
 =?utf-8?B?eVZOMjBISzZxYThzQ2w1VDY2MVZoNlVCMzlmT1BBUEo5YUhBMThteWh0YTQv?=
 =?utf-8?B?aDRwTVJuUnE3blhEazBBaVFVbHlaVFFWREdmRkRJTkFzR09ORjBvbDRnQldO?=
 =?utf-8?Q?V55IkHF9xIHgou35oEdedFWO+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cc7c27-28c3-4d0d-8538-08dc1ebf02be
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 22:34:51.5474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6RSOhZ6FR0DWf+VaCXsXRKLYV0XwXbFAyr7Fylip/YyjNZzUw8MF1ufzE4WHOsANiCLqGNcXg83AW5c/YwVWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7438
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

On 1/26/2024 16:22, Hamza Mahfooz wrote:
> We want programs besides the compositor to be able to enable or disable
> panel power saving features. However, since they are currently only
> configurable through DRM properties, that isn't possible. So, to remedy
> that issue introduce a new "panel_power_savings" sysfs attribute.
> 
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 59 +++++++++++++++++++
>   1 file changed, 59 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index cd98b3565178..b3fcd833015d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6534,6 +6534,58 @@ amdgpu_dm_connector_atomic_duplicate_state(struct drm_connector *connector)
>   	return &new_state->base;
>   }
>   
> +static ssize_t panel_power_savings_show(struct device *device,
> +					struct device_attribute *attr,
> +					char *buf)
> +{
> +	struct drm_connector *connector = dev_get_drvdata(device);
> +	struct drm_device *dev = connector->dev;
> +	ssize_t val;
> +
> +	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
> +	val = to_dm_connector_state(connector->state)->abm_level;
> +	drm_modeset_unlock(&dev->mode_config.connection_mutex);
> +
> +	return sysfs_emit(buf, "%lu\n", val);
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
> +	return count;
> +}
> +

To make this more discoverable I think you want some kerneldoc.

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
>   static int
>   amdgpu_dm_connector_late_register(struct drm_connector *connector)
>   {
> @@ -6541,6 +6593,13 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
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

I think there should be some matching code sysfs_remove_group(), maybe 
in early_unregister() callback.

>   	amdgpu_dm_register_backlight_device(amdgpu_dm_connector);
>   
>   	if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) ||

