Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB49C4D2C9C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 10:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3E810E2E2;
	Wed,  9 Mar 2022 09:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DC410E328;
 Wed,  9 Mar 2022 09:56:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJ1fSiASFDX1EsNx9WSYhCUbo6fHurjlNpVDAR79BHGkHYIUbkDyCJW0gbf2b9wRNZBELWlx04ZCs6i336oe+YdsC/2/usl+IIYwMAEwCsL4VD5saq4v/zaVHZSQV2NVJsWd6EvX3Bo6H+QHbIF+PvP1JBli00nkrFAwRt87JUb9djmpr939VojGj9iLjfe9vVKz9tRNiUiYj+FURVOFi8aWpKBgNC5C72eqbll8ZW0natHxnlZDidUd2/dwWjS3Baa9jqfjFFzqrM7CsXXk8PbbCMAP41auqq/ekgfMwy0jMihcjD6mbGbrJpkwWX8UITdqCBN9Sx5cEE9m3Uv/Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lc6HofnqTfUNRcI96bPpOL6u0aqi7G/aa+IEPKVeFfM=;
 b=WkardptFfjCYHfs13+nXgKiURcANvFAK9y1w2Q4ic1LaBG9jKIjuKwSWjuNTCnhzl83ASA/ieiYukLFNf8j4Xysl/YzOtAQ50c7yVholEY5rHcxFtqyY37IzuAtC9FKoUkZ4Bgko3Uz2fN6RamXEunLrzvHSDkPCv//CdK1wHjFFslq+4wL6M7G793rjtKy9v56PE0Ejj6bj8BXJKarkvlQLpjHx8tFTlUkWsyMvAZHP+zfLDFjHmiNXl/cp1S03J/4zsbH2BuzjhYitGI7HfSzz9YWoK0Nw0gKXGH29na+u4secgjSQRloYym7dmXVgnHYEczIAyAupJQHOh9i2NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lc6HofnqTfUNRcI96bPpOL6u0aqi7G/aa+IEPKVeFfM=;
 b=Xt7HzJrQ4Ljq6RDqvg7FE14LqCPMp1WosWlanrRCvs6U1orpIFsQ5T1CZ9o/M4Uv1mAtQYr7sUkkhqwwVMW71nu8GU6KkIv9m/VMewUJgnNhdg/yM2j3qjRheVvPgbCzk4ThHKppQ7EG2FmbWCOU0VkFHEyOXdYSU0/ywHjRKUc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) by
 BYAPR12MB2823.namprd12.prod.outlook.com (2603:10b6:a03:96::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.20; Wed, 9 Mar 2022 09:56:11 +0000
Received: from DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::bd9c:14f4:486a:1356]) by DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::bd9c:14f4:486a:1356%9]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 09:56:11 +0000
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
To: Shashank Sharma <contactshashanksharma@gmail.com>,
 amd-gfx@lists.freedesktop.org
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Message-ID: <589bca3a-6f44-39bf-1eb5-1cb2628e4fee@amd.com>
Date: Wed, 9 Mar 2022 10:56:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220308180403.75566-1-contactshashanksharma@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0036.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::49) To DM8PR12MB5431.namprd12.prod.outlook.com
 (2603:10b6:8:34::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a92f213e-aa96-4143-9f15-08da01b30a26
X-MS-TrafficTypeDiagnostic: BYAPR12MB2823:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB2823E0D9BE5714CD6C76278E8D0A9@BYAPR12MB2823.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e2TFs1iWcGl7JhXXKg+2PHqEgPoxfGxn/56iq/2WUn8bSdyFe/hhSGHJecxTMI3g9YwtVYZhVz4xB1Z83AatxFpDA3v/uk1UiVwd9aXocxd09IrxtbFElHUF57rtDzikRaWPa8TebAqFe0Fil+p1hK1nJuIbWoXoNe7Hu5971cYzCeLs7e2M8Ll6e8zYY3nooUo1KUUnu+PfzKyWpyzisqZzwVyZqNNSR336+MmsBFh78fIYJGUKWtNrNAWgAy458mxssiueDXov8lq+EZcKQSSk10eB45vQ64geRmWLgZoiqUPd5SRutktoh3b2310areU/+3BrW4hEcAzpn0VqMpV5bvqQNybd5yxFfawAdGy/e8dsIWKfZkqne8iTe1YEOMF2LNF3YJvDzujt9kHpkiwwUIKQl+3ceU8Uz2aumV9mYfRYefQE3ZC8Pyu5z1j2GuLzijFIs+mz8S0NPVLkjTUcP3Qa5wLfISwUEXipdme5WFrUltHKLHBlMFa+SThVsudDX+C0zjB4e5ilL+gH22nTtE6GbpMAVolgsUxGMacTctZfqu4i4ik/BHucmAzxGhORmf+HNisrB2zdXjCUPrrC+b8vAO3HXRYZYozlAPNOY+c9OR8CN1OzHUXSkWIJjtg3n5wz0C2VayGBvNaRvDEfWpGgDOUzviHXu0irGH00A7s7bAAfv+weCXibC3axdLsJuxkPpDfnbnNDVrrAJMZt3FDLXnluUEiuLME3oMk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5431.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(54906003)(6486002)(2906002)(8936002)(36756003)(31696002)(316002)(6512007)(186003)(2616005)(26005)(86362001)(5660300002)(53546011)(66476007)(8676002)(66946007)(4326008)(6506007)(66556008)(508600001)(6666004)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S205cTY4WUpycHAzSUdnUVd5SFhURkJ1OSt0THZXM1A3bnlxZ3lzdVEzaDhn?=
 =?utf-8?B?L1YvMWZPVHR3amlVSERRRTVPMk5YeC9ORlZrMEFzZmQzNmxMV2JRQWY0WGJP?=
 =?utf-8?B?bVZPZ0VoMmErUkt1ZThoVlRLdDVrR3R2L0FCL2dhTVVXNVFiTGg4RVl2OXNm?=
 =?utf-8?B?aXEvK1dVMFhJTHl1OXRtTzFodW55TkxwcE5ZaWhzVjNWeUFrSk5xK0JiaUdj?=
 =?utf-8?B?WTJnT1RqdkNMSkczOXNxampaN1FOaVZNZnRaU0VTQ0pOTE14aElmYkVJa2li?=
 =?utf-8?B?eTZsWWlheVovSTZlOFdiNHdyWlNVZ0hSU2xXbnE4d3I2bytuRUpaL2hHdENO?=
 =?utf-8?B?dCtmanVSUjRhRmY1N1ZGSW5XZ1NmNFMydm5WcjBaR2VCS0ZIc1dMVU9mL1BT?=
 =?utf-8?B?WFZiTFlmNWtoazBMQVJSSzBOSmhZUHMrdWxlTXAySnRVdDQ3YnNVM2Q5b2pG?=
 =?utf-8?B?cVQyVzVKTXZZSGdYQTFWM2x2SG1TRTdFN0N3K1AvcG1WeDhQaHRpOWZGRU43?=
 =?utf-8?B?RDQ2c1FLY0NYM1gvYm5YbVVQYkR5NHpWajdUWlo1OEVaTWR4LzRsQXkzZXhk?=
 =?utf-8?B?QngwUFpzdk40V251d1NhY0wrakdxb2UyMVJVQzRFam9KeEVBL3lDbFFXY1lW?=
 =?utf-8?B?eFF4NlpOVlRObnc4c1pkbmR3cThMaFZUVWpwZ2xsbTBvdXFqeGwzRlcrcVR6?=
 =?utf-8?B?ZzZhNGk4aGJtTG9rNThlTFVSUVB1ZmxDZ1F1VTZBdndJc3VkNm12ZUpta1Vx?=
 =?utf-8?B?Tnc5MUlRSHk5b1VSNmppSTFibTFHM24zK3gyK0JDR0ZCVDk0a2FlbFF3SEp5?=
 =?utf-8?B?OHhmUS9Nd05UckYzdUFmbHVLVFdUSFlPWTVrK3NycHNrNEo0bitoZFViMzJz?=
 =?utf-8?B?bXZnMWZYL2JlaXB1VElxL0FPdWRza250MXR6ZjV2ZzEwZFRLN3BsUDBseTha?=
 =?utf-8?B?bGtGVTNaU2xnMHowdGN5MDh4ckFxb0Ivb0haT2dWM05pVDkxb1dwSU4vZjQ1?=
 =?utf-8?B?bUJBc3BZMkxhOGIwcmtwbGI1dVpmQkV1RWFYKzYxV1p3MmhxZXNNM1lNRTIw?=
 =?utf-8?B?bDJiZUx4VkoxLzNtc3d3YlJvVnI1NmgwMDN2ZitkeDJiQVZLZFg4M0ZzWWlr?=
 =?utf-8?B?NjFLV2dOVlc5TjBldzFmOHg3QmExWEpkbUVNMFJXVFJUVmxwdHR1UW04Qnpk?=
 =?utf-8?B?MkNLcjN6aVJGUlI2YWNYZkg2WHE0RktzMTR3cU1Kci94cGJxeTlET3VkRzRq?=
 =?utf-8?B?eUtrOXpFeHVXajUrbHh0Ni9wZDQxa21zZGc5MzlzcmdqM2xsUFN1blcyTlNT?=
 =?utf-8?B?L3ZLa1RDYytiNWEzVXc5MHpybUw2QitiaXFGUHg5b2RyWGx4MkJBZjdsZnV3?=
 =?utf-8?B?Sm84LzY3N3VBalBTVmllY3YzUXlRekpPeGdDTVkwZEZleDZDWkdLVjM5eVRj?=
 =?utf-8?B?eU80OTZFUGZpTDdyNk4wZTFWU3JySFBtVGw2VEhqbWVnOW1RbXJaL0dpaWpu?=
 =?utf-8?B?UEM5dS9YOUQxU2hoQ29GVmZ3SDZ1cXVCbUd2VFN0NXdicmpXL28zUjUzNXFm?=
 =?utf-8?B?VjlpbWFwTTBhM0NlWFdkdTJMSVdsYkZhNDJIOU9wNWV6b0JNNzdjVU5rVTl0?=
 =?utf-8?B?REFXU2FFVmEveXA1RUd2NHE2Q1RDZ3Bpbmc1M29NalRPR3ZIWWFyVDc1RVFK?=
 =?utf-8?B?ZHFCbzhDK0VSTXl0UVBmV25nRyswRm1nSytOVC9PamwxQVZ6MXFLT2JSeEtP?=
 =?utf-8?B?TlI4SXlENm1CbnQ5WC82a2dWak9IUzlPdU0wSjJWOFhWSW5jak50Q2lBbjdx?=
 =?utf-8?B?ZEo4ZFpQWDh6VHpRTjRueklQQS9wc1Q3YTBvNUlmbmdPYTJRSnpoaHJnUUNS?=
 =?utf-8?B?d2JJSTd6ZTlaNG5Gck9iNnlxQ0NLVVRLTWlBdzZHUk5ENzZUNmtsSTFRM1J5?=
 =?utf-8?B?RlV5Yk5IL3B5b3RXMms2ZUt3ajl4RUpOeDNrT1RselV2bUxiTjV1Z1VuejZ6?=
 =?utf-8?B?R1VPd3J6Rk9sd1dzTFkyaWVSdTdLWXRxVTE0MTc4WHpFemVVR0g3cVIvaG9v?=
 =?utf-8?B?bnVaMTRFMTFQZU5pK3Nscng1RTBobGVVSzd4RjhqZnExa3ZDRVVqejliNWRh?=
 =?utf-8?B?OXAzMUdPc0tJQzRYaGNHRm5idnEwdG4rSkJGSDhYWUtqQkpHa1lQUmlwSytt?=
 =?utf-8?Q?YLGTun4E7CZU7P5W4+pmYhU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a92f213e-aa96-4143-9f15-08da01b30a26
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5431.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 09:56:10.9610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2Pi58VT1CCOo5z2xRWx++xlQ2xY5J3KGvs9RgLGrTqhdnchSIh4DcEm7fWPHekwau5prtQ8bMpeUJsn/3Bofw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2823
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
Cc: Alexandar Deucher <alexander.deucher@amd.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 Shashank Sharma <shashank.sharma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Shashank,

On 08/03/2022 19:04, Shashank Sharma wrote:
> From: Shashank Sharma <shashank.sharma@amd.com>
> 
> This patch adds a new sysfs event, which will indicate
> the userland about a GPU reset, and can also provide
> some information like:
> - process ID of the process involved with the GPU reset
> - process name of the involved process

Would it be possible to include the app parameters as well?

piglit has a shader_runner test application that can cause hangs,
and it's run like this:

   shader_runner 1.shader_test

Knowing that shader_runner caused the hang is not really useful
without the "1.shader_test" part.

Thanks,
Pierre-Eric 

> - the GPU status info (using flags)
> 
> This patch also introduces the first flag of the flags
> bitmap, which can be appended as and when required.
> 
> V2: Addressed review comments from Christian and Amar
>    - move the reset information structure to DRM layer
>    - drop _ctx from struct name
>    - make pid 32 bit(than 64)
>    - set flag when VRAM invalid (than valid)
>    - add process name as well (Amar)
> 
> Cc: Alexandar Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Amaranath Somalapuram <amaranath.somalapuram@amd.com>
> Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
> ---
>  drivers/gpu/drm/drm_sysfs.c | 31 +++++++++++++++++++++++++++++++
>  include/drm/drm_sysfs.h     | 10 ++++++++++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index 430e00b16eec..840994810910 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -409,6 +409,37 @@ void drm_sysfs_hotplug_event(struct drm_device *dev)
>  }
>  EXPORT_SYMBOL(drm_sysfs_hotplug_event);
>  
> +/**
> + * drm_sysfs_reset_event - generate a DRM uevent to indicate GPU reset
> + * @dev: DRM device
> + * @reset_info: The contextual information about the reset (like PID, flags)
> + *
> + * Send a uevent for the DRM device specified by @dev. This informs
> + * user that a GPU reset has occurred, so that an interested client
> + * can take any recovery or profiling measure.
> + */
> +void drm_sysfs_reset_event(struct drm_device *dev, struct drm_reset_event *reset_info)
> +{
> +	unsigned char pid_str[13];
> +	unsigned char flags_str[15];
> +	unsigned char pname_str[TASK_COMM_LEN + 6];
> +	unsigned char reset_str[] = "RESET=1";
> +	char *envp[] = { reset_str, pid_str, pname_str, flags_str, NULL };
> +
> +	if (!reset_info) {
> +		DRM_WARN("No reset info, not sending the event\n");
> +		return;
> +	}
> +
> +	DRM_DEBUG("generating reset event\n");
> +
> +	snprintf(pid_str, ARRAY_SIZE(pid_str), "PID=%u", reset_info->pid);
> +	snprintf(pname_str, ARRAY_SIZE(pname_str), "NAME=%s", reset_info->pname);
> +	snprintf(flags_str, ARRAY_SIZE(flags_str), "FLAGS=%u", reset_info->flags);
> +	kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
> +}
> +EXPORT_SYMBOL(drm_sysfs_reset_event);
> +
>  /**
>   * drm_sysfs_connector_hotplug_event - generate a DRM uevent for any connector
>   * change
> diff --git a/include/drm/drm_sysfs.h b/include/drm/drm_sysfs.h
> index 6273cac44e47..5ba11c760619 100644
> --- a/include/drm/drm_sysfs.h
> +++ b/include/drm/drm_sysfs.h
> @@ -1,16 +1,26 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  #ifndef _DRM_SYSFS_H_
>  #define _DRM_SYSFS_H_
> +#include <linux/sched.h>
> +
> +#define DRM_GPU_RESET_FLAG_VRAM_INVALID (1 << 0)
>  
>  struct drm_device;
>  struct device;
>  struct drm_connector;
>  struct drm_property;
>  
> +struct drm_reset_event {
> +	uint32_t pid;
> +	uint32_t flags;
> +	char pname[TASK_COMM_LEN];
> +};
> +
>  int drm_class_device_register(struct device *dev);
>  void drm_class_device_unregister(struct device *dev);
>  
>  void drm_sysfs_hotplug_event(struct drm_device *dev);
> +void drm_sysfs_reset_event(struct drm_device *dev, struct drm_reset_event *reset_info);
>  void drm_sysfs_connector_hotplug_event(struct drm_connector *connector);
>  void drm_sysfs_connector_status_event(struct drm_connector *connector,
>  				      struct drm_property *property);
> 
