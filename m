Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F67E5977BE
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 22:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26D5A2E72;
	Wed, 17 Aug 2022 20:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8994B18A827;
 Wed, 17 Aug 2022 20:18:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMVnBVUqsItaR+du2W/u7xrQhIv+nolZ0zgznrjJ0JmPCTX9gGmlERXqQe5cn0a03KeYHd12JJwBGY2aJt4ZmKkcAXJPhEX9sF/T0G1CDd7n4Cj8MboWyDixQCRlmntObz14wrL3MNOl1/WmXO8Ava3EfAUV94I56cUQyXlhb7Tsf9yMYs1gU/EGCGGEo7HI+agzk6JzixKv00rdq3pEOTfkIUfJCuTcD/e254iKy0ur0v3IHWG/UTy5rrClGFueAUEA30qcoI4I0cEsIjy1xMdU5QmFrKJPLMBt/vN0msjoTaijsHdNQjf45wPsTvFSrFlrQ1ZYcYTQ5KS+dN2oXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ew3yU6bBYmVbn6dCpQw9XqirmIV8bvOMM3SK/pRqYk4=;
 b=bTe7CNLKOirVYAe0KgkVJilrdHOQlGpcjp9xsVcXuui4ILO+OlkDMXA3wxXyCMnHV90dW/cAJXyyYD29pcB4EeYJoK+uwm8ipnA6riN/hEQRGUa6efVHlw3ovtSXhY/8TiVPACTKTCpONcj9dipMAz++Yy/rFCPYXa9Ku671SSyXn9741kA0nTu/x66MRJEWOhHtWd1v4qdTIu7IhVAWhgiqRkIUiBo3xZJiS+d61IVmSLXrjoG9tzivgtbkEuhwbBJ2ZtB9yUFGYf7kydWh7HAyedfMvFbIVTVrHXk32YXueENtE1e/z+RsNkQQiDyDd6AStdrD7L/lonfBqafX/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ew3yU6bBYmVbn6dCpQw9XqirmIV8bvOMM3SK/pRqYk4=;
 b=YRZn53whxJcmmvA67MYKHgonStKhx1JqjTBjuslVjp9d+hQ20YpopmJsqYevIfdjMkNMXs6xhzonavwTXmSYypa7YgnbTWYIfT9sudp0fDRIqg07pmaV4rx+Rj2uSlyajwQkHWdSnrdpieShPnB0/I2F7Ly75F9gfixTy0keiEaeuDEjQ9lTSqLKP7T4TvovI81YoUH6t1N6pfzW9Ucd5HJLMJWMks0Ie1cQGbuIVh23YGHsuD2asRGxQmCs6JcdzgVyO0RLJaG1mk/MkiIhwP90KWV1QQwYcHxdmL5EBqRmG1QtZGZIAjKTu5kqeMTSY3mGT55FyaxAACHS96BB+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB2760.namprd12.prod.outlook.com (2603:10b6:a03:72::16)
 by CY4PR1201MB0246.namprd12.prod.outlook.com (2603:10b6:910:23::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Wed, 17 Aug
 2022 20:18:12 +0000
Received: from BYAPR12MB2760.namprd12.prod.outlook.com
 ([fe80::21f8:7f65:69f8:c83d]) by BYAPR12MB2760.namprd12.prod.outlook.com
 ([fe80::21f8:7f65:69f8:c83d%4]) with mapi id 15.20.5504.028; Wed, 17 Aug 2022
 20:18:12 +0000
Subject: Re: [PATCH v2 01/29] ACPI: video: Add
 acpi_video_backlight_use_native() helper
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
References: <20220712193910.439171-1-hdegoede@redhat.com>
 <20220712193910.439171-2-hdegoede@redhat.com>
 <641cb059-48f5-5f05-5ec2-610f1215391c@nvidia.com>
 <20e4ffcf-2a3a-e671-5f98-1602b78df3cb@nvidia.com>
 <331ebd23-d2a4-bb33-5462-b9bd3284ab69@redhat.com>
 <5cfb26a2-ec7b-578e-dc01-79776dc7e0c9@nvidia.com>
 <94c69af4-5a30-0b80-fce1-64d01858d79b@redhat.com>
From: Daniel Dadap <ddadap@nvidia.com>
Message-ID: <98cb14c9-6b9a-9410-98e3-24c31950597d@nvidia.com>
Date: Wed, 17 Aug 2022 15:18:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <94c69af4-5a30-0b80-fce1-64d01858d79b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: DM6PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:5:60::35) To BYAPR12MB2760.namprd12.prod.outlook.com
 (2603:10b6:a03:72::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77957f54-ab72-489c-18e9-08da808d9b90
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0246:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YCPP6mpJR81xpa6Xelu7+zGA9NUUN37hONkLiiXtinhuDlOCuWzH/aMVGhcTYxhI7/zetDtNnFcmCmCCyaTTxUhESreMMOsXol18lwgrfLFpuEffco6W8l9HgJ3PRdlYHU64LTNHi+/00t0OsH6jJPP6xBy51qQt0gSfSqHB/Hu5HyTSszmCduQJ4DGwrS0oXGFGw0QDkzXnCBL6t9GCJ01Jl4NIfXgKcvHzGet87WXvLsQR/bKGCMYt2tMkZMxfQ4lf6ujLXkBfRznlDB15zugTpaK6BH0486R7DrOiND6eChSNi2LeFRcJs1uDfPDucw2fxS1AjD7Ki74zRVD175WfiLZ8FSgpbVR4jKG7XUlyROE637IzJ1z0kcA6d0pmJArhtm4xv+XzOwbZDxUGNUdzUTxib/npSUZtjzpNmc7XyNrZMO/w5O2wDXCBpgm8B5oqBZ1YK4Z/XW5NjVMXbWpUJp9rpJqD3GICx5BSe0dapSxNkgRhP0wWXDB6ByrT3ku7FNV24b3zoYe2+HpOxAlHIG74nhN4ua9uW6nY6iWm3ko7LbLgltOjvYLmU810Ui38vf/GmKtpJuEzgdj1ZCNebMh2hTNFyDilF4Tt/qCmnYuL9qnmS1VC1AsTudGFKRhP9+mIh3meb60lxkRHlxOcq+tLgDzFDaxA8ZRIsjt0Hm0XKQfxD//Pvt8/KLsNYM5MmI/aUY0KaY75W8XqC9q/kN5DVFjLZGFANfbf5u76uYlrM5kaEs6YyfdhuB8xGG9LUlHf1betBR0nZi9LcuP2TZp7Dnc6RqOtl2pDCzefbRhffVm2E+QGTDa0WKn4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2760.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(2616005)(36756003)(186003)(6512007)(53546011)(26005)(6506007)(6666004)(6486002)(41300700001)(31686004)(478600001)(8676002)(31696002)(86362001)(83380400001)(110136005)(921005)(8936002)(316002)(5660300002)(38100700002)(2906002)(7416002)(30864003)(66556008)(54906003)(66476007)(4326008)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlEySFNwR0V4dnBIVC9yNFlzMTI4c2szVmFiQVpkTnNYaVRVK3RTS3lKWWZY?=
 =?utf-8?B?ems1Y2kzUGQyR1lPQnVrZml5RitIMXdMVUdNdFl2aVZZcFdkeXUxUGhrRi9a?=
 =?utf-8?B?dHRVa2JmY0dmWGNKa2M5U0RMNnFkWG5neHpHR2h0cFRIRWVqZ3dRVi9Ic1Jy?=
 =?utf-8?B?ZkRDTnIrQTdNNzB0RFBMUUFOeGV6V0FacFhEMjQvVE8vcDl5Ky82dVFvVkxF?=
 =?utf-8?B?STNWejdQb2VPanUwYk5rQXpmRkhxMXZpMjJRTFBNL2FXYmVlL1FhcTI1b0xX?=
 =?utf-8?B?UnJ1RzRVSnEyVnUwcVN5TlJwYmpmQkk1QkFHcmRicVRMMDJXbmxpMnkzQSsr?=
 =?utf-8?B?SXBzMnNvMUgzOFZ3Um1RRmFsWUtvZVNINlZFVnBlLzRKcWNZdjhDLzRsdVlq?=
 =?utf-8?B?UDRFdFA2RmN4cmh1THlGNEdmeHJ0K2pxL1V1WnpVWER4OTdGaDhqUlZQRkps?=
 =?utf-8?B?QTVuUUVFWUFJdDhJTmRiT1NOMnJ1bEJIUEVVTklyQUdOQ2V1TkFUNDZmNysv?=
 =?utf-8?B?akRVQWYvOTJLNFM3b2V2R3BQQTFvR0Uzb0YvbjQ0d0t2SERwelAwNFNSUVM2?=
 =?utf-8?B?YmxhZkV1bFlCWi9yMVVLR2xFclNLcld1d2lNdlAyYW9wWlhETGJOMFo4dGVw?=
 =?utf-8?B?RTNpcHIrdHBYOUF3YVZ1eXEzU1djNlRFVFNkRFR1Rm1JYmtIeWtrYWg0R3NB?=
 =?utf-8?B?VS9hT3BRRGxFYkoraFNreWIvVW0wdFlwSUdrWGkwVGo2OHRVbjdyV3V1a3JP?=
 =?utf-8?B?Z1FnNjRIK24xMFBmN3VpVFd5RGNDTmpZMS9UWGdPdmxrR042YlQwaTRGMzFH?=
 =?utf-8?B?SmJ6YndZNk91Ri9vQzFEc2NYUXRUdzhFRG16VDFWOEw0UzlId29EeEl3Nnor?=
 =?utf-8?B?azFlSExqQy9mTU92WXJmZTFzdjIvTGl3RmZsMmlYWk1ZOUFYOTdzb1grNHhr?=
 =?utf-8?B?QmhwQ2RuWDArQ3djNmxyOGVVWjJaeGNQNDAzcnVzNXNXeHMxdEtadmxJWVpv?=
 =?utf-8?B?R1lFbDAvS3ptRUpiNE5wdUNlK1JQRkJvNkZPQ0ltbmVEdGdGNEd4UUpWc1RD?=
 =?utf-8?B?M0twZDdiQTR5TUdLaXNHQzRQOGJsb0RnOHVwRGFLTy9zMzA1NEQ5cTdPVG1q?=
 =?utf-8?B?eG5pWERSczl0TWpGbFNibFNBRFJQaXBRbzBiQWZXaWxWTjloY2ZkM2taenZH?=
 =?utf-8?B?L3ErYkxWV3VYdWtUcFEyM0YyUWovZ21hT1gwamVUYy84YjVWWFN2bk1Yc1pY?=
 =?utf-8?B?YmE0WVBxN2hJaGVEKzNvTWx4c2ljaGdESzg2Qm1jSndOdlNnOXB1anBVR1hM?=
 =?utf-8?B?aE92dGdjNkNQQ1NaUWkrcEhHaUJGV00wcVRJbTdGY1F3Z0lBMWppWlFIMkhG?=
 =?utf-8?B?U3lMTnlXeGgybFhYelNyY2d5Tk9GMjhlZWNrbkFIaENJcldoNzRrN2NsK0FG?=
 =?utf-8?B?UG0rSEZ2NUtKWVkyY2VLelNuOFpMcVdneFFwN3ZlWkMzV0lIOHd3dFpmS05Z?=
 =?utf-8?B?aURiL0VSTmo5c2p2RzNnYU1UREVEVE9LNEF6ZU9ERTN5Zjd2cnVQSnY5MWFk?=
 =?utf-8?B?RFFuVXlHY0gyOXBlTzlCWFI3eTZ3WFZVbWcwaUZnc1AydjZJL3hYa3VTQTFN?=
 =?utf-8?B?eitRSXNxNm9VNm1EMXJVUURXOEU5RFFldi9scks4NGpHcTF1U2Y5dXg1dTJH?=
 =?utf-8?B?OWZiMkNXV1BVUGZCNmIrKysrQ1Z2ZEhYb3VBREVmaFk4b1pnaFk5S0FHK1li?=
 =?utf-8?B?Wlc4L1Y3VFBMKzhPWmNVTVVKcGJEbFY0TWdGcmhVdlJFbFlscjgvaUJ1K0dH?=
 =?utf-8?B?MWtMVGNTSFdPWFdQOE5sSHJ4VVh6ZmRqWEdsdzhCdjVRYXRrSkc5MWhEcTBK?=
 =?utf-8?B?UEpNZUo0ZDUyb2NxRzdrbzlhcDNQUDNGL0pYb0JBMjcrUlJZbmZtR2pSbjRh?=
 =?utf-8?B?Z2NhSzZyYVVuQUVTY3NmbVJDNmJwWHpDb0Y3dU52SEREK3JPN2o4Wm9uK1VS?=
 =?utf-8?B?QUY0aEdRbjhCYzY5UDNJNVE5ckpOTjJ3OWxmdDBwMHFoT0hxVGM0ZWVqMWs4?=
 =?utf-8?B?TlNURUNCK1cyUUpVUjFRTTdWRTQzRldzL3QvL1dMMnRlUjMzQWpxeHRMbU02?=
 =?utf-8?Q?yySjhcFQ4hlktScYfIkabuyOR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77957f54-ab72-489c-18e9-08da808d9b90
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2760.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 20:18:11.9221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2/+ov6yS7SZwthV23t+bNrgMnuGT5iIrpyvlFhDAN61qMEIxi28e929u+5imezij/lYmLkRu7zGK7eWXlMZkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0246
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

On 8/17/22 10:05 AM, Hans de Goede wrote:
> Hi Daniel,
>
> On 8/2/22 18:49, Daniel Dadap wrote:
>> On 8/2/22 06:31, Hans de Goede wrote:
>>> Hi Daniel,
>>>
>>> On 7/21/22 23:30, Daniel Dadap wrote:
>>>> On 7/21/22 16:24, Daniel Dadap wrote:
>>>>> On 7/12/22 14:38, Hans de Goede wrote:
>>>>>> ATM on x86 laptops where we want userspace to use the acpi_video backlight
>>>>>> device we often register both the GPU's native backlight device and
>>>>>> acpi_video's firmware acpi_video# backlight device. This relies on
>>>>>> userspace preferring firmware type backlight devices over native ones, but
>>>>>> registering 2 backlight devices for a single display really is undesirable.
>>>>>>
>>>>>> On x86 laptops where the native GPU backlight device should be used,
>>>>>> the registering of other backlight devices is avoided by their drivers
>>>>>> using acpi_video_get_backlight_type() and only registering their backlight
>>>>>> if the return value matches their type.
>>>>>>
>>>>>> acpi_video_get_backlight_type() uses
>>>>>> backlight_device_get_by_type(BACKLIGHT_RAW) to determine if a native
>>>>>> driver is available and will never return native if this returns
>>>>>> false. This means that the GPU's native backlight registering code
>>>>>> cannot just call acpi_video_get_backlight_type() to determine if it
>>>>>> should register its backlight, since acpi_video_get_backlight_type() will
>>>>>> never return native until the native backlight has already registered.
>>>>>>
>>>>>> To fix this add a new internal native function parameter to
>>>>>> acpi_video_get_backlight_type(), which when set to true will make
>>>>>> acpi_video_get_backlight_type() behave as if a native backlight has
>>>>>> already been registered.
>>>>>>
>>>>>> And add a new acpi_video_backlight_use_native() helper, which sets this
>>>>>> to true, for use in native GPU backlight code.
>>>>>>
>>>>>> Changes in v2:
>>>>>> - Replace adding a native parameter to acpi_video_get_backlight_type() with
>>>>>>      adding a new acpi_video_backlight_use_native() helper.
>>>>>>
>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>>> ---
>>>>>>     drivers/acpi/video_detect.c | 24 ++++++++++++++++++++----
>>>>>>     include/acpi/video.h        |  5 +++++
>>>>>>     2 files changed, 25 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
>>>>>> index becc198e4c22..4346c990022d 100644
>>>>>> --- a/drivers/acpi/video_detect.c
>>>>>> +++ b/drivers/acpi/video_detect.c
>>>>>> @@ -17,8 +17,9 @@
>>>>>>      * Otherwise vendor specific drivers like thinkpad_acpi, asus-laptop,
>>>>>>      * sony_acpi,... can take care about backlight brightness.
>>>>>>      *
>>>>>> - * Backlight drivers can use acpi_video_get_backlight_type() to determine
>>>>>> - * which driver should handle the backlight.
>>>>>> + * Backlight drivers can use acpi_video_get_backlight_type() to determine which
>>>>>> + * driver should handle the backlight. RAW/GPU-driver backlight drivers must
>>>>>> + * use the acpi_video_backlight_use_native() helper for this.
>>>>>>      *
>>>>>>      * If CONFIG_ACPI_VIDEO is neither set as "compiled in" (y) nor as a module (m)
>>>>>>      * this file will not be compiled and acpi_video_get_backlight_type() will
>>>>>> @@ -548,9 +549,10 @@ static int acpi_video_backlight_notify(struct notifier_block *nb,
>>>>>>      * Arguably the native on win8 check should be done first, but that would
>>>>>>      * be a behavior change, which may causes issues.
>>>>>>      */
>>>>>> -enum acpi_backlight_type acpi_video_get_backlight_type(void)
>>>>>> +static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>>>>>>     {
>>>>>>         static DEFINE_MUTEX(init_mutex);
>>>>>> +    static bool native_available;
>>>>>>         static bool init_done;
>>>>>>         static long video_caps;
>>>>>>     @@ -570,6 +572,8 @@ enum acpi_backlight_type acpi_video_get_backlight_type(void)
>>>>>>                 backlight_notifier_registered = true;
>>>>>>             init_done = true;
>>>>>>         }
>>>>>> +    if (native)
>>>>>> +        native_available = true;
>>>>>>         mutex_unlock(&init_mutex);
>>>>>>           if (acpi_backlight_cmdline != acpi_backlight_undef)
>>>>>> @@ -581,13 +585,25 @@ enum acpi_backlight_type acpi_video_get_backlight_type(void)
>>>>>>         if (!(video_caps & ACPI_VIDEO_BACKLIGHT))
>>>>>>             return acpi_backlight_vendor;
>>>>>>     -    if (acpi_osi_is_win8() && backlight_device_get_by_type(BACKLIGHT_RAW))
>>>>>> +    if (acpi_osi_is_win8() &&
>>>>>> +        (native_available || backlight_device_get_by_type(BACKLIGHT_RAW)))
>>>>>>             return acpi_backlight_native;
>>>>>>           return acpi_backlight_video;
>>>>> So I ran into a minor problem when testing the NVIDIA proprietary driver against this change set, after checking acpi_video_backlight_use_native() before registering the NVIDIA proprietary driver's backlight handler. Namely, for the case where a user installs the NVIDIA proprietary driver after the video.ko has already registered its backlight handler, we end up with both the firmware and native handlers registered simultaneously, since the ACPI video driver no longer unregisters its backlight handler. In this state, desktop environments end up preferring the registered but non-functional firmware handler from video.ko. (Manually twiddling the sysfs interface for the native NVIDIA handler works fine.) When rebooting the system after installing the NVIDIA proprietary driver, it is able to register its native handler before the delayed work to register the ACPI video backlight handler fires, so we end up with only one (native) handler, and userspace is happy.
>>>>>
>>>>> Maybe this will be moot later on, when the existing sysfs interface is deprecated, and it probably isn't a huge deal, since a reboot fixes things (I imagine installing an in-tree DRM/KMS driver on an already running kernel isn't really a thing, which is why this isn't a problem with the in-tree drivers), but would it make sense to unregister the ACPI video backlight handler here before returning acpi_backlight_native? That way, we'll briefly end up with zero backlight handlers rather than briefly ending up with two of them. Not sure if that's really any better, though.
>>>>>
>>>> Thinking about this a little more, maybe it's better not to overly complicate things, and just assert that users of the NVIDIA proprietary driver will need to reboot after installation in order to get the backlight working, at least until we get further along in this effort and the backlight interface transitions to the DRM connector property you have proposed.
>>> Right, this series stops unregistering the acpi_video# /sys/class/backlight
>>> devices because the idea is to never register them in the first place.
>>>
>>> Registering them in the first place causes 2 problems:
>>>
>>> 1. It causes userspace to see udev events for the register + unregister
>>> and by the time the systemd backlight level save/restore helper runs
>>> from udev the unregister has already happened and it logs ugly errors.
>>> More in general this kinda racy behavior just is ugly.
>>>
>>> 2. On some hw merely registering the backlight device, which I think
>>> at least tries to retrieve the current level through ACPI, is causing
>>> issues. So now we have DMI quirks to force the native backlight on
>>> some devices, even though the heuristics also say native eventually,
>>> just to avoid the race. Avoiding the add + remove dance allows
>>> us to drop a bunch of quirks and likely also fixes issues on other
>>> devices which we don't yet know need the quirk.
>>
>> Yes, those sound like good reasons to avoid registering the ACPI video backlight driver wherever possible.
>>
>>
>>> So this patch-set changes the acpi_video.c code to no longer register
>>> the acpi_video# backlight devices at init time *at all*. Instead native
>>> drivers are supposed to now call acpi_video_register_backlight()
>>> when they have found an internal panel. But to avoid this causing
>>> the acpi_video# backlight devices to not show up at all in some
>>> cases (e.g. native kms drivers blacklisted) the acpi_video code
>>> also calls acpi_video_register_backlight() itself after 8 seconds.
>>>
>>> I believe this is what you are hitting, the 8 seconds have passed
>>> before the nvidia driver calls acpi_video_backlight_use_native(),
>>> so the acpi_video# backlight devices have registered (and no longer
>>> go away).
>>>
>>> This is not only a problem when installing the nvidia binary driver
>>> for the first time. It can also be a problem if the binary driver
>>> is not in the initrd and leaving the initrd takes longer then
>>> 8 seconds, say because of a diskcrypt password. So I believe that
>>> this really can be a problem with the nvidia binary driver.
>>
>> Hmm. I hadn't considered the case of the binary driver being absent from the initrd, and the possibility of the transition out of the initrd happening after the timeout. Yes, this is a bigger problem than the "only after first installing the driver" scenario I ran into.
>>
>>
>>> But I think this is easy to fix. We could make the 8 second
>>> delay configurable by replacing the ACPI_VIDEO_REGISTER_BACKLIGHT_DELAY
>>> define with a module-parameter; and we could make "0" as value mean
>>> that acpi_video.c will never call acpi_video_register_backlight()
>>> itself.
>>>
>>> Since the various (also counting distor packaging) nvidia binary
>>> driver installers already all modify the kernel commandline to
>>> blacklist nouveau, then the installers can just also pass this
>>> parameter and then acpi_video.c will never register the acpi_video#.
>>
>> This sounds like a reasonable compromise, but I worry that it may be difficult to determine whether a system definitely doesn't need the ACPI video backlight driver. On the other hand, the last system that I recall personally seeing that did use the ACPI video backlight driver was a little over 10 years ago, so it's possible that there are no systems which use that driver which are supported by current versions of the NVIDIA proprietary driver. I'll have to do some research to determine what types of systems actually used video.ko's backlight driver, unless you happen to know already.
> Generally the backlight control method / fw interface to use depends
> on the Era of the laptop:
>
> 1. pre Windows XP Era laptops use vendor specific ACPI or SMBIOS interfaces
>     such as those dealt with by dell-laptop, thinkpad-acpi, etc.
> 2. Windows XP Era (which ends with Win 8/Vista) laptops used the ACPI video
>     bus backlight interface
> 3. Win 8/Vista and later Era laptops use the GPU driver's native backlight
>     support instead of some firmware interface
>
> This is generalizing things a bit. E.g. esp during the transition between
> the Eras often both Era methods (e.g vendor + acpi-video) would work
> equally well.
>
> So wrt your questions, generally speaking any laptops which were
> designed for Win8/Vista or newer no longer use the ACPI video
> interface.
>
> So yes it is possible that there are no systems supported by
> the latest NVIDIA proprietary driver which need ACPI video at
> all. OTOH on dual-GPU setups with muxes it is not unreasonable
> for ACPI video to actually be the driver which needs to be
> used in case e.g. the backlight control is hooked up to the
> EC so that it does not need to go through the mux. Basically
> ACPI video Should work well (if the ACPI tables are written
> properly) in setups where the EC drivers the backlight and
> where this the GPU driver cannot control it directly. So
> their might very well be pre nvidia-wmi-ec-backlight laptops
> which use ACPI video to control the brightness through the EC.


Thanks. My understanding is that EC-driven backlight on muxed systems is 
always controlled by the interface that the nvidia-wmi-ec-backlight 
driver uses, but that could be true only for newer designs with NVIDIA 
discrete GPUs. On older designs the mux was not intended to be switched 
while a GPU was actively driving the display, so it seems unlikely, but 
not impossible, that such designs would have seen a need to control the 
backlight brightness via something other than one of the GPUs.


>>> This does mean that the nvidia binary driver then must call
>>> acpi_video_register_backlight() when an internal panel is found.
>>>
>>> Note the current patches to amdgpu/nouveau skip the calling of
>>> acpi_video_register_backlight() when
>>> the acpi_video_backlight_use_native() call returns true and they
>>> have registered their own backlight. But calling it always is ok
>>> *as long as the driver is driving the laptops internal panel* !
>>>
>>> acpi_video_register_backlight() contains:
>>>
>>>          if (acpi_video_get_backlight_type() != acpi_backlight_video)
>>>                   return 0;
>>>
>>> So calling it when a native backlight has already been registered
>>> is a no-op.
>>
>> The NVIDIA proprietary driver will already know when it has registered its own backlight handler, so there probably isn't any need to always call it when driving an internal panel.
> Ok.
>
>> I'll have to double-check to see if we have already determined whether a panel is connected before registering the backlight handler: I am pretty certain that is the case.
> Yeah registering a backlight handler when there is no internal panel would be weird.
>
>> One further potential difficulty that I anticipate is that not all dynamic mux systems use the EC backlight driver (or a similar, GPU-agnostic driver), and rather have whichever GPU happens to be connected at the time be responsible for the backlight. I had initially thought that supporting the EC backlight interface was a requirement for OEMs to implement dynamic mux support, but I recently learned this is not true in all cases. On Windows, this requires coordinating the backlight controls of the two GPU drivers across a mux switch, to load the state of the switched-away-from GPU and set it on the switched-to GPU. I imagine for these systems we may need to do some similar save/restore, probably managed by vga-switcheroo, but it would require having both GPU drivers register their own native backlight handlers (and possibly while one of them is not connected to the panel).
> Right, systems where the backlight control basically gets muxed from one GPU to the other GPU together with the panel's video-data lines exist. Currently Linux already register both native GPU backlight handlers in this case. e.g. /sys/class/backlight/intel_backlight and /sys/class/backlight/nouveau_bl.
>
> Userspace (atleast GNOME) has code which checks which GPU is actually connected to the panel using the panel's drm connector's status on each GPU (only one of which should report connected) and then uses the backlight interface associated with the connected connector.
>
>> Dynamic mux switching isn't actually supported on Linux, yet, so we should be able to kick this particular can a little further down the road, but in the meantime we should probably start planning for how best to handle this sort of system under the "only one backlight handler per panel" model. Maybe the vga-switcheroo handler can register its own backlight handler, that then negotiates the actual backlight settings between the relevant GPU drivers, possibly through a new vga-switcheroo client callback. I'll have to think about this a bit more.
> The "only one backlight handler per panel" model is actualy "only one backlight handler per panel"-connector since the new API uses drm properties on the drm connector object. With 2 GPUs both using their native backlight control there will be 2 connectors and userspace will/must use the one which is actually reporting that it is connected to the panel so this will work fine.


That is a useful distinction. Would it fall under userspace's 
reponsibility, then, to keep the brightness level synchronized across 
drm_connectors that share a panel via a mux when performing a switch? I 
suppose it's a cleaner design to leave it up to userspace to select 
which backlight interface to manipulate. That is a harder decision for 
userspace to make with the existing design, which doesn't cleanly map 
sysfs backlight interfaces to individual connectors, but if the UAPI is 
going to change to a drm_connector property, backlight interfaces are 
obviously strongly correlated with the connectors. I'm not sure how easy 
it is for userspace to solve the problem of maintaining consistent 
brightness levels across a mux switch for an OLED panel, where there 
really isn't a concept of a "backlight" to speak of, but I suppose it 
wouldn't be any easier to do that in the kernel (e.g. with vga-switcheroo).


> If anything the nvidia-wmi-ec-backlight case is a but more tricky, the "only one backlight handler per panel" thing is actually more of a "only one backlight handler per laptop" rule which is intended for (to be written) drm helpers for the new properties to be able to get the handler from the backlight class in the non native case by just taking the first registered backlight handler.
>
> This means that in a dual GPU setup with nvidia-wmi-ec-backlight both GPU's panel connector objects will have their brightness properties pointing to / proxying the same backlight class device. Userspace should really be only writing to the one which is actually connected though. I guess we could even enforce this
> in the kernel and reject brightness property writes on unconnected connectors.
>
>>> Please let me know if the proposed solution works for you and
>>> if you want me to make ACPI_VIDEO_REGISTER_BACKLIGHT_DELAY a
>>> module-option for the next version.
>>
>> I do think it should be workable, apart from the concern I mentioned above about knowing when to set the module option to disable the ACPI video backlight driver.
> Note the option does not disable the ACPI video backlight driver. It disables the acpi_video code timing out and deciding to go ahead and register its backlight itself (providing that at the moment of timeout acpi_video_get_backlight_type() returns acpi_backlight_video). Any code (e.g. the nvidia binary driver) can still call acpi_video_register_backlight() itself to try and register even if the timeout handling has been disabled.
>
> The idea is that without the timeout the probe order looks like this:
>
> 1. acpi_video initializes, does not register backlight
> 2. GPU driver initalizes, it either registers a native backlight handler;
>     or it calls acpi_video_register_backlight()
> 3. acpi_video_register_backlight() runs (if called) and calls:
>     acpi_video_get_backlight_type()
> 4.1 if acpi_video_get_backlight_type() returns acpi_backlight_video
>     /sys/class/backlight/acpi_video# is/are registered
> 4.2 if acpi_video_get_backlight_type() returns somerthing else, e.g.
>     acpi_backlight_nvidia_wmi_ec, acpi_video_register_backlight()
>     does nothing
>
>
> The timeout is to ensure that 3. still happens, even if
> there is no native GPU driver, because of e.g.
> nomodeset on the kernel cmdline.
>
> With the nvidia binary driver, that driver can call
> acpi_video_register_backlight() if necessary so the timeout
> is not necessary.
>
> I'm currently preparing v3 of this patchset. I'll modify the
> patch introducing the timeout to make it configurable
> (with 0 disabling it completely).


Okay. That clarification makes sense. Would it be reasonable to disable 
the timeout by default on systems with Win8 or later _OSI?


>>> p.s.
>>>
>>> I think that eventually I might even try to make the new
>>> module-param default to 0 / default to not having acpi_video.c
>>> do the registering itself ever and see how that goes...
>> Would the GPU drivers then be responsible for calling acpi_video_register_backlight() again? My understanding was that part of the intention here was to make that no longer necessary.
> It is actually the other way around, before this patch-set
> acpi_video_register_backlight() does not exist as a separate
> step. Before this patch-set the registering is done at
> acpi_video probe time. At acpi_video probe time it may be
> unknown if a native GPU driver (which is preferred) might
> become available later.
>
> This patch-set actually makes the registration a separate
> step, which must be called by the GPU driver driving the panel
> when its own native backlight control probing is done
> (and has not resulted in registering its own backlight handler).
>
> IOW this patch-set is actually what makes it necessary for
> the GPU drivers to call acpi_video_register_backlight()
> (rather then making this no longer necessary).
>
> Also see the probe order example I wrote above.
>
> The timeout is really just a bandaid to not regress on systems
> where for some reason there is no native GPU driver to do
> the registration.
>
> I hope this makes things a bit more clear.


Yes, thank you. It is much less confusing when I don't have my mental 
model inside-out and backwards.


> Regards,
>
> Hans
>
>
>
>
>
>>>>>>     }
>>>>>> +
>>>>>> +enum acpi_backlight_type acpi_video_get_backlight_type(void)
>>>>>> +{
>>>>>> +    return __acpi_video_get_backlight_type(false);
>>>>>> +}
>>>>>>     EXPORT_SYMBOL(acpi_video_get_backlight_type);
>>>>>>     +bool acpi_video_backlight_use_native(void)
>>>>>> +{
>>>>>> +    return __acpi_video_get_backlight_type(true) == acpi_backlight_native;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL(acpi_video_backlight_use_native);
>>>>>> +
>>>>>>     /*
>>>>>>      * Set the preferred backlight interface type based on DMI info.
>>>>>>      * This function allows DMI blacklists to be implemented by external
>>>>>> diff --git a/include/acpi/video.h b/include/acpi/video.h
>>>>>> index db8548ff03ce..4705e339c252 100644
>>>>>> --- a/include/acpi/video.h
>>>>>> +++ b/include/acpi/video.h
>>>>>> @@ -56,6 +56,7 @@ extern void acpi_video_unregister(void);
>>>>>>     extern int acpi_video_get_edid(struct acpi_device *device, int type,
>>>>>>                        int device_id, void **edid);
>>>>>>     extern enum acpi_backlight_type acpi_video_get_backlight_type(void);
>>>>>> +extern bool acpi_video_backlight_use_native(void);
>>>>>>     extern void acpi_video_set_dmi_backlight_type(enum acpi_backlight_type type);
>>>>>>     /*
>>>>>>      * Note: The value returned by acpi_video_handles_brightness_key_presses()
>>>>>> @@ -77,6 +78,10 @@ static inline enum acpi_backlight_type acpi_video_get_backlight_type(void)
>>>>>>     {
>>>>>>         return acpi_backlight_vendor;
>>>>>>     }
>>>>>> +static inline bool acpi_video_backlight_use_native(void)
>>>>>> +{
>>>>>> +    return true;
>>>>>> +}
>>>>>>     static inline void acpi_video_set_dmi_backlight_type(enum acpi_backlight_type type)
>>>>>>     {
>>>>>>     }
