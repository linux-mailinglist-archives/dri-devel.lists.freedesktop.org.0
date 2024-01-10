Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E75382A1E4
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 21:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D047110E65A;
	Wed, 10 Jan 2024 20:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE6710E658;
 Wed, 10 Jan 2024 20:15:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1iWmDgjWSFO6CszmH+htC/k3PxjPvhUIoxrHLdrZcPa3gu8smyFIVDUWKC41cPXSeeoEafyOoNW4kUNqqBZ952uQ3+hrUq5V7QUftw9tW6aoTokqzY3DMdX+ugc3dAnY1Ztl4yVkkq1T4ienh6HOpIgG8EqIh6QPGmn99womPs/pIVAtZiTvi4Jl8TvT4syt3IieyQgZNz1la882cOyL5+O9E9IKLXPQgvInppr8ddPfwcrBJBYW1Yxekct+bEm8xLnXaHS+Y4e/6M0qAIqA4YQt1GSr9F9nJeWeSoB5cDH9byqtjQRvgeteYAarvkvMbgN5uRHbZRlf1PqoJkpcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qv3vOZGEIkluUnrT6xgc5CgefqPT5SQZlauUhxY0lG0=;
 b=IjbUT6bfbVSlseN9f0/w89wOywP37Idee4k0W0CVPbBaQaBIwSzF1rqTMuLXXU1s3OawdebNA6/r61FvBevKJkqDNpjZV21wbimt2NDfdvyzJ/mNk+qr3SjhtwmN2bDUIDLXq8E00BOpwTArjMMmcDV8fMlrjCUacWXDqz0zAReRs4VKageagwUN5Wh2SUcuh2OtuB6a5qRgydG2BUxQx7d4rb/5/Y7GncjhXhiMyKNP27W8LQeonI7Hnqi+8OebZOmkhUxBX6+mce4zSmjN3r88kJgcJyOJHv4S43i9lAO17estvInsNP8Dso4UTyqVYZ5T9xVdrKydHgk+RjWtMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qv3vOZGEIkluUnrT6xgc5CgefqPT5SQZlauUhxY0lG0=;
 b=QeOLvMU3lmp4G2fQythn7SArqhWw0AYTf9MndZwUO2jm111ZrzGlFTFrkLwl4ZzzXZvTT15VsDfoqs4q9kqW1uWEmtM1W7pOXz0hrdcLsUIVncQZoRefcU8ALw1dSmSJ3/0EmgRl2WsN8kdqIDAGVSGbkfmla4rT8UM+d72Dz1Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DM8PR12MB5398.namprd12.prod.outlook.com (2603:10b6:8:3f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.17; Wed, 10 Jan 2024 20:15:28 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5358:4ba6:417e:c368]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5358:4ba6:417e:c368%6]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 20:15:28 +0000
Message-ID: <5c4d7bfa-a1d2-42bb-a304-5a796a5d26fe@amd.com>
Date: Wed, 10 Jan 2024 15:15:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm: enable (most) W=1 warnings by default across the
 subsystem
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <cover.1704908087.git.jani.nikula@intel.com>
 <1291306bedfd6297d4bf0fca5daa5bac46dde1ad.1704908087.git.jani.nikula@intel.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <1291306bedfd6297d4bf0fca5daa5bac46dde1ad.1704908087.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::14) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DM8PR12MB5398:EE_
X-MS-Office365-Filtering-Correlation-Id: 754c7d25-d363-4743-9e48-08dc1218e38c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U1nbg0WWyH70zn6tmKg8uA0FYMOn6lz3ipLlK3iQGSKXW+I1sHwVtYfOYjokNVsV+NKDdq05tTYXnNKfnGFa+mF/uK0GnbXJ5FVDUHmIB4nWJGms5VElFN4kC46U2zTnvP7C/opHfao7yFavzow1IEjKwOpitqIfOtMPW5oQpdoiMMyu5JJ4Z2d30UbG/Ml7xTtjwRe8mbvOOi67T891/BgaEfeH9YXZLptUmEpINuULmT0xxQ0CQuspQLGk0DwL5wpshcqCXjFAhy9aIHEgAaXsTAs/H34cUEbY5/aabS5jp7COW3Cmlxj/sSzsunJsQtKwRGZqveGM5G9bD0HKT4aZT4YKiv+1rOmz2i+TeIH6FWZeFsTwim/wKw0s1TzDt3gfHlH19NYcnjso148IkBNv+9C86jJkjpXJqxHeSmmtiFx0aF0TfpY7Ikpw+esM52InUauIFOu3jfiGTIOFjAjzXvQem7jlywlOnejv3jAQHNXF+NiOr7fw07ySKLIekWKo5yTSDc35WP5F9wgYNMGHEFqrnJkzCeYJx5YoYDKX74u+yLtKwm28EIZLm4KTp1kgxINvzz7sa71+nm/GajUpfCxEpNq7uWcmFToOrXgwjw6LhTXqm+2/O71nyb53ZSSG7oobVneBVCaTfUa670JSuGbVHbn26MiKz2j0IBR16XaBjHaaCXwPN/cQm7oo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(366004)(396003)(376002)(230273577357003)(230922051799003)(230173577357003)(451199024)(1800799012)(186009)(64100799003)(7416002)(5660300002)(36756003)(44832011)(8936002)(8676002)(2906002)(41300700001)(38100700002)(478600001)(83380400001)(6506007)(2616005)(26005)(66574015)(6666004)(53546011)(4326008)(6512007)(66946007)(66556008)(31686004)(66476007)(316002)(54906003)(86362001)(31696002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWRzNFlTWE5WOHFNOXg4NG1MWG9aQ2kzKys5VUdJRHZGVnVpdHYyejZEai9x?=
 =?utf-8?B?S0hsekM3ZFVCRklNekhOS2lVRHRwdVZZRjl0cGtldE5UbFA3cDduWUtZRGZK?=
 =?utf-8?B?em5rUmoyc3o3ZkllNEJQK05CbVROWVdscGlCZ0hyVzBuU1dlRFdHVzJuRENx?=
 =?utf-8?B?d0E4YkE2ZnBTTStZTUIwU1FOV1NUOUgwWk03eEhVNmNVQ3ZsUnFXRDNOK05k?=
 =?utf-8?B?elZVaEhOV3MzVjNhTkZkVXZhOEFuMDMxRVlyaGk5eDNkL0hZWkpwUFg1SE5u?=
 =?utf-8?B?emZXSXhlQWRRV0p5WFMvdXZHb3QyUWFrbkhTMzF3L1BXeHFxRTJiVDBpVXRC?=
 =?utf-8?B?cHJFcXNBTy9mbEp6QitPSjdlN09WQjkvVWw0WFMzNjIxR3FxVDVGYTFydzN6?=
 =?utf-8?B?aFRpRTFkTTE5eE1abTJ5MzJkVW83NjY5eHNoZ0xtTGJJdTRCMGlKS3l3NUFj?=
 =?utf-8?B?V1hSUlJ0OGtkblU4VExZeTgrbzhmUmJwZFZmUjRZajlvYXNEbE4xVmRjRXZI?=
 =?utf-8?B?K1NjSE5NUXNQSmRGNkw1dCtxTHBGWVZjUVJpVzZQZEQ4b3RXWTNHb1RzVXNx?=
 =?utf-8?B?QXlJdWVIams5VjlBZEtnckJxMkMxOFYvTVhUd3RXYTJwV05XQm1FNHVMbkh1?=
 =?utf-8?B?R0VHdStCenFRUWQrdFA4TXFQY3I3dWNTUlBtK2EzZXBQMW55N0hHN2pkWGpU?=
 =?utf-8?B?TWV0RVpTZkZSRitnUEY1eE5jSkx6TGsvN1dESnovZDV6bExSakJqN2doNFNp?=
 =?utf-8?B?aFhJQzJlc1ZBM0xMdHRiaVJKT0l5SmNsTTNsOTR1cnFUREl1aUNqa1ZFN1Rl?=
 =?utf-8?B?Q0lvK1lFY2hDdlllOS9tZTNBWEFGT1JXYjdzeHNHWjdlUEpBRWY2dzFqSnBk?=
 =?utf-8?B?NWMrbVBkYmE2UGFiMDFnZTZZRGpsZ2pVY2tHWkdGNFI2dzVRVXdaMUg4QUo5?=
 =?utf-8?B?dGw5cE9HSi82elphTXAvVDR6VWhRTVI5K24rY1FJbWNhN1pIQkloL2prYW02?=
 =?utf-8?B?OVc4TlpvVC9vOC9ESjBpTTBaSFVBbE5hc3ppRyt1YmtyL1Z6UTZ5RnlCbkxq?=
 =?utf-8?B?QW5BRHpVR3NKNnZTeG5PcWVCSDdvblducG1oVEtWNUZ0TC80Y2IrWGJwbTBJ?=
 =?utf-8?B?MTVKYU5CejN5ME5WclRGdFdrNm1mb1Y5VndmUUxDZnNxU0NrTHlpZ1htdmhi?=
 =?utf-8?B?KzZ0TnV5N2MzZlV3RkYxOCs2azFLeURBNTNFWUozUDRoaC9TUDdZTDJiS3J5?=
 =?utf-8?B?RDI2SlN4cFVTZ1lUZGROQlZQbnlJNG5raEs2bElwM0svalZ5bEZFbTJ5SWov?=
 =?utf-8?B?dW0xOTYyMUVtRFhyTWx5ck1BZExLZkhqUGZzSjRTRy9MSjloMlNKV2Z4WkVt?=
 =?utf-8?B?SVdUaFZ5K01mUmlBbVdBMm5ocExvZldEd1dLdVpNT3UrRTFTYlczdVFIU0hE?=
 =?utf-8?B?NjFwKy9CbzFPWmY4RGVPWGNsRXAycE56TVFESGcwTVI0VjJ6VGJOdC9tNU5W?=
 =?utf-8?B?bFdJN2xKREJnbzVDQ1BvVkZxVXBBVWJsQStTVHVjY2FZNnFYSjEvUk96bnRt?=
 =?utf-8?B?U29SaFNtU1N3T0hoZkdnTWZIczJIclpINFhROStFWWhYYlBHUzAydlFJcUZO?=
 =?utf-8?B?YUgyWHBGekF4cFVLbTBDWlBzeFg3MGNHL1VtdmFSempjQll6aVhZYTNNdzgv?=
 =?utf-8?B?WEZ2NWFYSGhvMnNsZlF6c3E3RGZmSG0zZ2tIZmdYeTIyR3ZDN1JkdzVGVlA2?=
 =?utf-8?B?YjE3TFVtUXc0Z25heUpRM2IwYURpd1VBNDRWQXVrSHVMclg2eDlMclNCdzVT?=
 =?utf-8?B?ZUVMelV6V25KQWRwUFlFQ3diK2FPSnBwZHlsVTlxcDlwVWEwejR5WVdHNWhS?=
 =?utf-8?B?enpSZytSV21jRk5KVHg1a1F0TFZvQytZOGdjTHdKWkdVVmVnMnhXU3N1WWlz?=
 =?utf-8?B?RjF5aXB0Z2g4amlKMVYwbEdtTS9kUVlidmdpZTU1eCtQclBmWWYzMVNzSTV3?=
 =?utf-8?B?SWg0cGJZUktNTmprNmF3SXRwK3NNSnhiOFFjK0sweHhIUEVBV2FZeWF0NUFV?=
 =?utf-8?B?L1hMK2tPRlJJQ3BGTklZM0dVaVVkeFprVDB5UzMwdU1SM2Z0TngraGxaQmdL?=
 =?utf-8?Q?aUad+5GwZfmOPk1MVhkwXbWan?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 754c7d25-d363-4743-9e48-08dc1218e38c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 20:15:28.7560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2RRtTU+s9fUGYXyTOtsjcdaxGcTFtjXEv7MPiEIvAkPqLqugHmDgPZlW0fs+aQtmydWGSATfyFM1BeuinH96Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5398
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
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Thomas Zimmermann <tzimmermann@suse.de>, Karol Herbst <kherbst@redhat.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org,
 Xinhui <Xinhui.Pan@amd.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Danilo Krummrich <dakr@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/10/24 12:39, Jani Nikula wrote:
> At least the i915 and amd drivers enable a bunch more compiler warnings
> than the kernel defaults.
> 
> Extend most of the W=1 warnings to the entire drm subsystem by
> default. Use the copy-pasted warnings from scripts/Makefile.extrawarn
> with s/KBUILD_CFLAGS/subdir-ccflags-y/ to make it easier to compare and
> keep up with them in the future.
> 
> This is similar to the approach currently used in i915.
> 
> Some of the -Wextra warnings do need to be disabled, just like in
> Makefile.extrawarn, but take care to not disable them for W=2 or W=3
> builds, depending on the warning.
> 
> There are too many -Wformat-truncation warnings to cleanly fix up front;
> leave that warning disabled for now.
> 
> v2:
> - Drop -Wformat-truncation (too many warnings)
> - Drop -Wstringop-overflow (enabled by default upstream)
> 
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/Makefile | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 104b42df2e95..8b6be830f7c3 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -5,6 +5,33 @@
>   
>   CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
>   
> +# Unconditionally enable W=1 warnings locally
> +# --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
> +subdir-ccflags-y += -Wextra -Wunused -Wno-unused-parameter
> +subdir-ccflags-y += -Wmissing-declarations
> +subdir-ccflags-y += $(call cc-option, -Wrestrict)

It would be safer to do something along the lines of:

cond-flags := $(call cc-option, -Wrestrict) \
	$(call cc-option, -Wunused-but-set-variable) \
	$(call cc-option, -Wunused-const-variable) \
	$(call cc-option, -Wunused-const-variable) \
	$(call cc-option, -Wformat-overflow) \
	$(call cc-option, -Wstringop-truncation)
subdir-ccflags-y += $(cond-flags)

Otherwise, you will end up breaking `$ make M=drivers/gpu/drm`
for a bunch of people.

> +subdir-ccflags-y += -Wmissing-format-attribute
> +subdir-ccflags-y += -Wmissing-prototypes
> +subdir-ccflags-y += -Wold-style-definition
> +subdir-ccflags-y += -Wmissing-include-dirs
> +subdir-ccflags-y += $(call cc-option, -Wunused-but-set-variable)
> +subdir-ccflags-y += $(call cc-option, -Wunused-const-variable)
> +subdir-ccflags-y += $(call cc-option, -Wpacked-not-aligned)
> +subdir-ccflags-y += $(call cc-option, -Wformat-overflow)
> +# FIXME: fix -Wformat-truncation warnings and uncomment
> +#subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
> +subdir-ccflags-y += $(call cc-option, -Wstringop-truncation)
> +# The following turn off the warnings enabled by -Wextra
> +ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
> +subdir-ccflags-y += -Wno-missing-field-initializers
> +subdir-ccflags-y += -Wno-type-limits
> +subdir-ccflags-y += -Wno-shift-negative-value
> +endif
> +ifeq ($(findstring 3, $(KBUILD_EXTRA_WARN)),)
> +subdir-ccflags-y += -Wno-sign-compare
> +endif
> +# --- end copy-paste
> +
>   drm-y := \
>   	drm_aperture.o \
>   	drm_atomic.o \
-- 
Hamza

