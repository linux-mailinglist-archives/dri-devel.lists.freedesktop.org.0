Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3911598CBC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 21:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83EC10E2B1;
	Thu, 18 Aug 2022 19:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3D310E36D;
 Thu, 18 Aug 2022 19:38:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AiA34PSk+g8pRKm3/lsry7xhnvQ6jrXKueM+6Q37PNzO9B2psZTns4/TayFOd9BGBxqqwjqFDPcW/t/MbVHypsX+aW7TtRDl92UpFiIx/JPTa/1C7jIGyZAJFz+tvaeu3o9Yb4I7jR7+uxrTEnMWkIvh+AfM8HKXL2AoR4J2OtYmnMDaouaLddJqwPahgaF/SeYC9rzXG/fXRhffZL8sFfFo1cw3PtWBwMa7c6KHjYafLpxDLGw7IUmW6U3DqmsNrDrNTqWhjd62wjiWT1k71Lw2v8/bIdM1gBeVYgaQpcQitNpx+JMX4VshAyiWmGRBlegQJVVXkzo9DyVhLszIMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+KCSnsZStiYZMJeitmByBQSpZ8byqtg2Mn2SXgQ/hQ=;
 b=S0TYvLyQT6VI5utahfFaYooDBS38Wf8lsb9qZa2yuwB3QZUuz/Rtt24/9MqP2CYXQLetNqqi5JwycmPKtx1E0+h1sSZo71FJndfR69CI64PtwW0lBA11fHiSg+jgpPajyEzTj7STAVoJqEcKrgUg8WfbBKyUFlj9En7RSdmm9YTaJfcNASv3Da9/MVTqfpBpIqNevEERnPKpWp7Mk5nSHaU7ZwndiK6nNuOgRT7NchleOAGioHzLShucldGSQumHFNEL8urHI09vUjpBxgVnRR+s4LINsdSdujEQo//KlNCmhXX48NFmICcCghgb5Sgg8YjRxCCnkvhgweacfGKHOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+KCSnsZStiYZMJeitmByBQSpZ8byqtg2Mn2SXgQ/hQ=;
 b=r3gb3WT5GYxd2roT4qcDPkQNRiZNdKEPw9tljyd8tXVPYaM4Y33kRsBhxDPSO33WfiUOHAzD1SXaTRSGIfxn7KDMFDE3I1ktkYa9d0qZBZO+VRLcEAT4w2mlWradG53wx/Hgq1K/BTKEgaKiLVhJLa1U5YrA8d+NN4iRQ4COyZ0fnTis8EuiXptWcdroRPuSCdIkUukUa75OGvBvzjOa9CD2CBiu/iCkug8p3l53VxA3RDYbAp59p7lDJe+bgh5iVppcrHu8TwEsdY7X+qfvBJwrRVq/Z76TvZX/Y6bpB1y3XdJ0/Rx013fk4ZDrQ97pyABhCB+ci6BuoesH6ueQrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 PH7PR12MB7139.namprd12.prod.outlook.com (2603:10b6:510:1ef::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 19:38:50 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6012:2e0d:2697:8b02]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6012:2e0d:2697:8b02%3]) with mapi id 15.20.5546.016; Thu, 18 Aug 2022
 19:38:50 +0000
Subject: Re: [PATCH v3 15/31] platform/x86: nvidia-wmi-ec-backlight: Move fw
 interface definitions to a header
To: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui <Xinhui.Pan@amd.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>, Mark Gross <markgross@kernel.org>,
 Andy Shevchenko <andy@kernel.org>
References: <20220818184302.10051-1-hdegoede@redhat.com>
 <20220818184302.10051-16-hdegoede@redhat.com>
From: Daniel Dadap <ddadap@nvidia.com>
Message-ID: <12cc48c5-b54f-1eb7-c268-beb98bce2a5d@nvidia.com>
Date: Thu, 18 Aug 2022 14:38:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20220818184302.10051-16-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SN7P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::8) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a464068-b3f4-4b00-b1c8-08da8151468c
X-MS-TrafficTypeDiagnostic: PH7PR12MB7139:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lzEfMFsAnkicdcekhDtlhvwpjMcTzsWmZ8rzH6Gp6MS6ND4swd47YD9ySSsXGgjzzMeWXF6IcYU0Dsz+JXpA8C47GUvRl9nm1rFwvSsJSuksRhKKmsDbgrJ0v3wonv51rHbguo/ICRtTuV6vxuN89Qa9pWE+yE/01J12BmSETxN6LFzV06Se2YiPQKvCtCD4RbSYT08JChFRzsAq+qE1u6LuytaTMcyM76/DhSoyX/n6Lab9cq7opICpXQMgI3KpzB5hQdm1EmkxSmo3aPiBU1O6VaVltIQedt4DmNyFhgRipgRjEyyyHeSus8Qn31NB6eM75z4hdgm+sjo51ENNxbi56tNAzC+T99/MkqYVd9AL7ELOGn/jyPQBBA0Klbb8QGV/sCRJLWCm5m8kZGlHCu1xcPslid4KYLrUGyo5CSSTDj2T3V17NGgWqKcTJY5gWTKp7xRbJbsqiMIQUYuGtsWUIRMGdHjcDpAo5oIqtekYeCihEL55YJLKv3oY2bmwkG1qQer+4M0K7ADuGMVM+YAYiBKaaGHqFbTGP0YN+dUitxCICUjpznw2lbEl+T+jwoTv8nJTBFTK2IJ67c0koAIfiq8dmUGA2cIULjKu7hm7gNgdpjQjPjUg/wkssoo0Cjd2eEPUzgQvNL3bX+SZVFpNj19qUSQmXPWK4WYc0Wice3Il0YvxdRnDTev1XNI6u4naKSzD+Zt7iR39Q1WgPiSh3iQgH7XjexY1IL76b9y7Zo3BEHTXiiioltP72AKo1gpMegnljYSSIaOCI9xCzRsy4Hp9HDxE/hqS6qr/iV7KmpWa/UIcc96fghKlSW6O
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2763.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(8936002)(54906003)(186003)(2616005)(41300700001)(26005)(36756003)(31686004)(6666004)(6512007)(110136005)(2906002)(8676002)(921005)(66946007)(66556008)(316002)(66476007)(4326008)(86362001)(38100700002)(31696002)(6486002)(478600001)(53546011)(83380400001)(5660300002)(6506007)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXdyYlRlOEhIeUt6TWVFZ3k3eGdIak5PUDQwTlpCbFpSTnl6ZlhNTGR0SVBu?=
 =?utf-8?B?OUpmcHZCMEszRnFhYTh0enE3YTV1bDNCT1gwUWVlanhQdHFTaW8wRjF3NnhJ?=
 =?utf-8?B?RzJWZVVEWXc1U2hmMmtXMjNJbGpZSXE1bDVHa3JUTE80eEZkL05pWENIc3ZR?=
 =?utf-8?B?Z2w1VHQ1TExIcm5TMXRxTFZXckVVVWYwZ1hESGRyNEo2SHZhNFhBK0pVRDJa?=
 =?utf-8?B?YzJheElUS3VRbDR2d0NPWjR2U3FZU2RNVmtZNExqVndqTTJ0UnN6WXJwYXR3?=
 =?utf-8?B?dW1seHh4MVRGeW14RkorZU5QaWRXVXNKejlpM0NFdW9idkJhbzg4N0o5b2c1?=
 =?utf-8?B?TlFseWJnditMbmpLaXF3R3dNSmxsdjN5WjJKU01zQ0I0VzhxQXBOdW9HSzQw?=
 =?utf-8?B?Mk5WekZmanRsM2FDZ3ptY1h5SUZIT291SzhDUHViRjMveHc5U1V2ajVYMGVk?=
 =?utf-8?B?V0w1eVV4Q00wTTZ2NzZDdlZMb29NWXhCVWh0UW9JaUFWUkZHaHREekIyQ1g4?=
 =?utf-8?B?MWVFZGpubURabHZrMGxvRDdzd2M1TjhtREFFVUxFT3h6MTNYTW9oWDJUaG4x?=
 =?utf-8?B?by83Wkdib21wZHNkdTR1V0hRck5yR0JlYXRXYm42N0dDTUhqTGNtS3o3anI4?=
 =?utf-8?B?OGJGRlg0VlZNb3JYMnJiYi83bTl0TDB6eE9UQ3R5aGtKR2Z2YjhDNXc0YkJQ?=
 =?utf-8?B?SU5OZUVZMTJmWjg0ZUpsUUlhc0VJNVcra3hxVDIzeXRiYVRycUlkb2EzNVVp?=
 =?utf-8?B?RWVxekJzaTN1SmdkMzhjTnRtdXE3MVVLT01pbUQwemRMeWVjMnlGVzcrOWUz?=
 =?utf-8?B?LzVXaXJJaisvTy96eWFLNXZNSEVTOTl6SjMvWVN6RGozbDg2UTh2V0M4NEx5?=
 =?utf-8?B?NGFBYjBvMGFWNlV1YTlibnZvenphTVFvTkhlN3dVUjN4aVE2aVhTZ0lLcjg5?=
 =?utf-8?B?bnM0bDE0eE1aYVNGMzNDb1N4SEhkbnl1ZzNwbzVyZ3ZzTnJ0VXBFNUZVMk9B?=
 =?utf-8?B?dmJmcGVpUmVJY0RDbEQyc1FlMkMza002TkxFNWlWK2E1NHczMlJ3RWsxVWdm?=
 =?utf-8?B?cnJaUFJEMmZ2cVI5Z2RIdlNDRXFZb1BEaXkzWFhtaUNtNVhlWkFDMmt2WGNt?=
 =?utf-8?B?NGVLRHk4WXA3ZGdEcG0wVmZmTlFJRTF1OC9ncVJwTlVaOGplSjQxUGoxV1pY?=
 =?utf-8?B?MnZxSG9mSUl0d1RLdnBobTU2d2tnK2ZON045ZDV4VEI2ZHF2OWgvZjViakpU?=
 =?utf-8?B?RXZ5S2VWd2VaNitON2dKQk1HdVJldDBTdXV5K0pIK3JhQTFGOGkzZVZJYWZD?=
 =?utf-8?B?bnh3bStvQXVtV1RwOHlpeWFLTE5wdTZid0dSRTF1anB5OFlLcS9XdXlnRk9j?=
 =?utf-8?B?NXZ3endGNGVKcWFLQVNKMUl3WXo1YWUzdnZuZ0xrU0JKMU1JRy9zWmJRbEsw?=
 =?utf-8?B?akZPS2MwL0lFY1RGYXdNY01lNCszRENYQzZmaWFGdlNUTXZBRnVvR2VTMVl0?=
 =?utf-8?B?L1AyRGZtZ3lIRlQ5M2xsYWN2RlM1UDRQL0oySmsvekg2ZFRBL0w1WU1kQWRY?=
 =?utf-8?B?bjhuR213R3hhRUQ3d2tFT0RkRENhNWN5d1NVK1NMV3VWNEg4MFZDcERCWG1a?=
 =?utf-8?B?bjhMYTFFdnBXQUdNMGhiOXdyVUJNdTZxemx2NkQxUk9Kams0NzlSbjlyYWRE?=
 =?utf-8?B?Q09HNGRmUnJFZzg2YWRIZ2dpV1NlZEVpYmZmVVNhM1JUTEtMN0NVb1B1Wjht?=
 =?utf-8?B?MzJaRVRVZndiOFFuUWs1WWlkbEtOQUt1aitEcjNWV1lJcno1M1F6Ynp6eW81?=
 =?utf-8?B?cEptSG5hZFd3V1dqY0p6ZExhbFQxeHQwNEFnTXorUWR3Nkk5Q2l3WVFNRkM2?=
 =?utf-8?B?cDhKazRKMnF2SCtkc1VKYkVWOTJ3cEk4RHVENXNiK1VYZ0hEYjhpendSMDRE?=
 =?utf-8?B?N0lZSTdwZGd6NnB3UjZ5NDRxNm45TDhUdHlMN3E5aGJ3V0d3ZkR3bndCRXRR?=
 =?utf-8?B?Yml4blgrcG00OHA3Wm5vSW9KYWdIS3c0UWhEV09vb0dMYlBHd0ZVajhPWno0?=
 =?utf-8?B?bjdtNjVIUzI1WjQrMzVBV0cxbC9IY0xYbndpNGxTdG5KZVFWeEtqSDNrQTIw?=
 =?utf-8?Q?ejmlrM0g1t8udD3nKhpyVRU9a?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a464068-b3f4-4b00-b1c8-08da8151468c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 19:38:50.5587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BcJ+TQgyKYcg8yeWOryLvfhg/9j8FWOfzl31B6yjUlwkNRdQS+k8rSz9X84CDVtw12zsRF/kZYKhOiSyymKmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7139
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/18/22 1:42 PM, Hans de Goede wrote:
> Move the WMI interface definitions to a header, so that the definitions
> can be shared with drivers/acpi/video_detect.c .
>
> Suggested-by: Daniel Dadap <ddadap@nvidia.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   MAINTAINERS                                   |  1 +
>   .../platform/x86/nvidia-wmi-ec-backlight.c    | 66 +----------------
>   .../x86/nvidia-wmi-ec-backlight.h             | 70 +++++++++++++++++++
>   3 files changed, 72 insertions(+), 65 deletions(-)
>   create mode 100644 include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8a5012ba6ff9..8d59c6e9b4db 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14526,6 +14526,7 @@ M:	Daniel Dadap <ddadap@nvidia.com>
>   L:	platform-driver-x86@vger.kernel.org
>   S:	Supported
>   F:	drivers/platform/x86/nvidia-wmi-ec-backlight.c
> +F:	include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h
>   
>   NVM EXPRESS DRIVER
>   M:	Keith Busch <kbusch@kernel.org>
> diff --git a/drivers/platform/x86/nvidia-wmi-ec-backlight.c b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> index 61e37194df70..e84e1d629b14 100644
> --- a/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> +++ b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> @@ -7,74 +7,10 @@
>   #include <linux/backlight.h>
>   #include <linux/mod_devicetable.h>
>   #include <linux/module.h>
> +#include <linux/platform_data/x86/nvidia-wmi-ec-backlight.h>
>   #include <linux/types.h>
>   #include <linux/wmi.h>
>   
> -/**
> - * enum wmi_brightness_method - WMI method IDs
> - * @WMI_BRIGHTNESS_METHOD_LEVEL:  Get/Set EC brightness level status
> - * @WMI_BRIGHTNESS_METHOD_SOURCE: Get/Set EC Brightness Source
> - */
> -enum wmi_brightness_method {
> -	WMI_BRIGHTNESS_METHOD_LEVEL = 1,
> -	WMI_BRIGHTNESS_METHOD_SOURCE = 2,
> -	WMI_BRIGHTNESS_METHOD_MAX
> -};
> -
> -/**
> - * enum wmi_brightness_mode - Operation mode for WMI-wrapped method
> - * @WMI_BRIGHTNESS_MODE_GET:            Get the current brightness level/source.
> - * @WMI_BRIGHTNESS_MODE_SET:            Set the brightness level.
> - * @WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL:  Get the maximum brightness level. This
> - *                                      is only valid when the WMI method is
> - *                                      %WMI_BRIGHTNESS_METHOD_LEVEL.
> - */
> -enum wmi_brightness_mode {
> -	WMI_BRIGHTNESS_MODE_GET = 0,
> -	WMI_BRIGHTNESS_MODE_SET = 1,
> -	WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL = 2,
> -	WMI_BRIGHTNESS_MODE_MAX
> -};
> -
> -/**
> - * enum wmi_brightness_source - Backlight brightness control source selection
> - * @WMI_BRIGHTNESS_SOURCE_GPU: Backlight brightness is controlled by the GPU.
> - * @WMI_BRIGHTNESS_SOURCE_EC:  Backlight brightness is controlled by the
> - *                             system's Embedded Controller (EC).
> - * @WMI_BRIGHTNESS_SOURCE_AUX: Backlight brightness is controlled over the
> - *                             DisplayPort AUX channel.
> - */
> -enum wmi_brightness_source {
> -	WMI_BRIGHTNESS_SOURCE_GPU = 1,
> -	WMI_BRIGHTNESS_SOURCE_EC = 2,
> -	WMI_BRIGHTNESS_SOURCE_AUX = 3,
> -	WMI_BRIGHTNESS_SOURCE_MAX
> -};
> -
> -/**
> - * struct wmi_brightness_args - arguments for the WMI-wrapped ACPI method
> - * @mode:    Pass in an &enum wmi_brightness_mode value to select between
> - *           getting or setting a value.
> - * @val:     In parameter for value to set when using %WMI_BRIGHTNESS_MODE_SET
> - *           mode. Not used in conjunction with %WMI_BRIGHTNESS_MODE_GET or
> - *           %WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL mode.
> - * @ret:     Out parameter returning retrieved value when operating in
> - *           %WMI_BRIGHTNESS_MODE_GET or %WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL
> - *           mode. Not used in %WMI_BRIGHTNESS_MODE_SET mode.
> - * @ignored: Padding; not used. The ACPI method expects a 24 byte params struct.
> - *
> - * This is the parameters structure for the WmiBrightnessNotify ACPI method as
> - * wrapped by WMI. The value passed in to @val or returned by @ret will be a
> - * brightness value when the WMI method ID is %WMI_BRIGHTNESS_METHOD_LEVEL, or
> - * an &enum wmi_brightness_source value with %WMI_BRIGHTNESS_METHOD_SOURCE.
> - */
> -struct wmi_brightness_args {
> -	u32 mode;
> -	u32 val;
> -	u32 ret;
> -	u32 ignored[3];
> -};
> -
>   /**
>    * wmi_brightness_notify() - helper function for calling WMI-wrapped ACPI method
>    * @w:    Pointer to the struct wmi_device identified by %WMI_BRIGHTNESS_GUID
> diff --git a/include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h b/include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h
> new file mode 100644
> index 000000000000..d83104c6c6cb
> --- /dev/null
> +++ b/include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h
> @@ -0,0 +1,70 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */


Should the copyright notice from nvidia-wmi-ec-backlight be copied here 
as well?


> +#ifndef __PLATFORM_DATA_X86_NVIDIA_WMI_EC_BACKLIGHT_H
> +#define __PLATFORM_DATA_X86_NVIDIA_WMI_EC_BACKLIGHT_H
> +
> +/**
> + * enum wmi_brightness_method - WMI method IDs
> + * @WMI_BRIGHTNESS_METHOD_LEVEL:  Get/Set EC brightness level status
> + * @WMI_BRIGHTNESS_METHOD_SOURCE: Get/Set EC Brightness Source
> + */
> +enum wmi_brightness_method {
> +	WMI_BRIGHTNESS_METHOD_LEVEL = 1,
> +	WMI_BRIGHTNESS_METHOD_SOURCE = 2,
> +	WMI_BRIGHTNESS_METHOD_MAX
> +};


It might be nice, but certainly not essential, to namespace these 
better, now that they're no longer internal to the EC backlight driver. 
I did that in the version of this change that I had started working up, 
but got kind of annoyed that it made a lot of lines go over 80 columns, 
and then got distracted by other work and never ended up finishing the 
change up. I guess it's probably fine to leave them as is, since there 
won't be many files that include this header.


> +
> +/**
> + * enum wmi_brightness_mode - Operation mode for WMI-wrapped method
> + * @WMI_BRIGHTNESS_MODE_GET:            Get the current brightness level/source.
> + * @WMI_BRIGHTNESS_MODE_SET:            Set the brightness level.
> + * @WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL:  Get the maximum brightness level. This
> + *                                      is only valid when the WMI method is
> + *                                      %WMI_BRIGHTNESS_METHOD_LEVEL.
> + */
> +enum wmi_brightness_mode {
> +	WMI_BRIGHTNESS_MODE_GET = 0,
> +	WMI_BRIGHTNESS_MODE_SET = 1,
> +	WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL = 2,
> +	WMI_BRIGHTNESS_MODE_MAX
> +};
> +
> +/**
> + * enum wmi_brightness_source - Backlight brightness control source selection
> + * @WMI_BRIGHTNESS_SOURCE_GPU: Backlight brightness is controlled by the GPU.
> + * @WMI_BRIGHTNESS_SOURCE_EC:  Backlight brightness is controlled by the
> + *                             system's Embedded Controller (EC).
> + * @WMI_BRIGHTNESS_SOURCE_AUX: Backlight brightness is controlled over the
> + *                             DisplayPort AUX channel.
> + */
> +enum wmi_brightness_source {
> +	WMI_BRIGHTNESS_SOURCE_GPU = 1,
> +	WMI_BRIGHTNESS_SOURCE_EC = 2,
> +	WMI_BRIGHTNESS_SOURCE_AUX = 3,
> +	WMI_BRIGHTNESS_SOURCE_MAX
> +};
> +
> +/**
> + * struct wmi_brightness_args - arguments for the WMI-wrapped ACPI method
> + * @mode:    Pass in an &enum wmi_brightness_mode value to select between
> + *           getting or setting a value.
> + * @val:     In parameter for value to set when using %WMI_BRIGHTNESS_MODE_SET
> + *           mode. Not used in conjunction with %WMI_BRIGHTNESS_MODE_GET or
> + *           %WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL mode.
> + * @ret:     Out parameter returning retrieved value when operating in
> + *           %WMI_BRIGHTNESS_MODE_GET or %WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL
> + *           mode. Not used in %WMI_BRIGHTNESS_MODE_SET mode.
> + * @ignored: Padding; not used. The ACPI method expects a 24 byte params struct.
> + *
> + * This is the parameters structure for the WmiBrightnessNotify ACPI method as
> + * wrapped by WMI. The value passed in to @val or returned by @ret will be a
> + * brightness value when the WMI method ID is %WMI_BRIGHTNESS_METHOD_LEVEL, or
> + * an &enum wmi_brightness_source value with %WMI_BRIGHTNESS_METHOD_SOURCE.
> + */
> +struct wmi_brightness_args {
> +	u32 mode;
> +	u32 val;
> +	u32 ret;
> +	u32 ignored[3];
> +};
> +
> +#endif
