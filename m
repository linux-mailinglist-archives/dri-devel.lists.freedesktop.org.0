Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E63C597493
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 18:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885B39B347;
	Wed, 17 Aug 2022 16:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071C02B6CF;
 Wed, 17 Aug 2022 16:58:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQMqc3a/7dy/cjEFieh7+F5+DPrpXlHx/nmCrkxJWtzVMPUq/PFQkyflq6w2NtwaGYvuAYAsNQ9ngA/brHo5vLtOR5Wa1145BRyiSn46Txv9RxGBsfvLgouWquF7dDh/oCT3tpxX5Q/iORtJomNU6unkpb32Sd7cUWbmu56Z+v/RsrsQ8KHLtMKXjbeWp5ku2DV+S9Ze74gsr37wTf+BaRxGjSYVwbeYItBDGDAnB2bJjofQDutqQ0g9qfac5u9Muy9iwdnbxvguYCIxh4Bk+avB5DomS/4YmDvs/tjjrupgjKFuShfLwo0aWhEmOM+2nVRTdMHIYMGIaMsBXN76Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsGsFHn82K89+1VMxTgsY+xBh5gVked9OId58DfstSU=;
 b=cXNGWNs3gRWqdpyO6V2uVYCEiDQi4PEBkdsjJsZ+WvA+0UvPzVuc9mdu0t6Qe9eFAwxYazFzj5bDn7nvyO7AfZ9JNyMJTnConEBhY7N+UxUDoL5gaznR4jmkBNJrFhLQqUyC4ASbvPK07qazCVdN4qTRBE8XWk5NxZjO79roB4FF9cBTZAoewFgpXyqQLu9DGcSZcRs/a2MS6c/a/ttMIMKsxLGIwkBjiEm43hGze64ezSeWFmM0ar4C5vATuzjwC0JRNyFZmP55IeOD5pXzezHf4ZISFWxPSllcCmfHhexoQqF3V5BpXeT/xkGgbRz4njduOqq3iwjvWsRSZiCSkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsGsFHn82K89+1VMxTgsY+xBh5gVked9OId58DfstSU=;
 b=i2YLduC5RgONV12gLshHittn/Ul5EY8yNZ8xoA5j1M5hGNJAjrVJ1zMLqkImHYAUGn/Bclr+g293yeu31MZIZ8oFBcoh4kmYFXiA3TrZRlFhrgqFaNI0Tonm+d9aO24kdCkBMgnR+aYktsOgjB1CdnOjzubEtRb2+W7qj0RcpJOHPZq4hPiiScTcQaS20vLKfXmPZVIxahfEo8PCeOGCUHIEG1UeV4axkWwiQ7lcL2T8fQX+iJh+ekpiyN3BZsi/wwNYlnaHLCFxILrW4jhD8O5GRgSuzzvlR411jUu9FGPjW9fUzJaqREiK48rBh3DOTWiNk2JLtwQ2ag0Qehcl3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB2760.namprd12.prod.outlook.com (2603:10b6:a03:72::16)
 by BYAPR12MB3542.namprd12.prod.outlook.com (2603:10b6:a03:135::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Wed, 17 Aug
 2022 16:57:59 +0000
Received: from BYAPR12MB2760.namprd12.prod.outlook.com
 ([fe80::21f8:7f65:69f8:c83d]) by BYAPR12MB2760.namprd12.prod.outlook.com
 ([fe80::21f8:7f65:69f8:c83d%4]) with mapi id 15.20.5504.028; Wed, 17 Aug 2022
 16:57:58 +0000
Subject: Re: [PATCH v2 16/29] ACPI: video: Add Nvidia WMI EC brightness
 control detection
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
 <20220712193910.439171-17-hdegoede@redhat.com>
 <8cde70e6-1115-9b7f-d550-52b9e3623c85@nvidia.com>
 <f68353f9-fb4c-b5fe-f7f8-69b97865c720@redhat.com>
 <d3475f26-4862-f47e-5d72-216af82551b6@redhat.com>
From: Daniel Dadap <ddadap@nvidia.com>
Message-ID: <d20aff2b-c34f-ef1c-ebc0-0ee974b36346@nvidia.com>
Date: Wed, 17 Aug 2022 11:57:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <d3475f26-4862-f47e-5d72-216af82551b6@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: DS7PR06CA0034.namprd06.prod.outlook.com
 (2603:10b6:8:54::18) To BYAPR12MB2760.namprd12.prod.outlook.com
 (2603:10b6:a03:72::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c0c0638-274a-482d-e393-08da8071a357
X-MS-TrafficTypeDiagnostic: BYAPR12MB3542:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /E7m6WAOHW9dZc1xQAl/qkgwAshJ87ITT1HyxWk8MzY7HMKzAvXOhClo9gWD3I1E9cJwWEtHW+Vh3jXlk/zxerrsIkIPkALxwzkil0iAcFdG7fGVMzNgdewV0A61Ok1N7YEP8MNHjDkYSmv2h+bKqccqBcBgjlYuSCxyQqNSKzZqEI918gDwHtNBcAEBJDHX1j3udERZBAafSTQfj7LkBNsIdBJZXzv966+/ZeVw8/cmxkQ0EKb0sExYmpuD0Lv+mTqqIZNYrcxBru5a+9/j5LSNeCTijo/+Q0QtvC6j+ISwRRjHVCB+Lls8Xx/sJSeErd2b3BTWJfQPAduZ+Tx009VZ7FyfJmHntRhEz4LWBkT7e3z1OD2ekim5CO7kgpKm58PVOXTleMT/UwulMD9qmg0un8bAVBKsUx5RmZLHGX6dKnSxD76AfG8oTQsEXXpEsmw2d5KubaM04nJXxxrR4WJLSHBczELbqFNLjAFgV9hblhqnjkinr+dZ/n1yL4vJH/3mqfRi0GEUnUzCuuDrPicvl3lU556FVgcew9ZduPygMAyHqpP75lSzYWFxMUu5nHb6xIjjHzTrYE4/CNwzTH3lReyviWWs95fJFmuXRVCIT4aXK2l70fc2qokCaqKXiuB4gDnJzR2NMvvYIF0WrTuM3XTH2A48wx9yKe3Ak/b+cO4SfZP9Rn1wRG3L66nwcwSAJlzvhpuQt/pBJZSI+bBNXaCdH2WACu1AAr314HbutTq+Z3lZDXw6wGemBvVBjsGl5C/+3e/22Bmj/vL4+/VqukM7SJ80i3wHmw1YCjYzEh9GeLlhQymtvu3kspvq+wVMRZoJfZA7h9V+rVM8tXS5FSKRFJaxTbVJ6ly/VV0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2760.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(186003)(921005)(38100700002)(2616005)(83380400001)(7416002)(30864003)(5660300002)(8936002)(66946007)(8676002)(66476007)(478600001)(2906002)(4326008)(66556008)(6506007)(53546011)(6486002)(6666004)(41300700001)(6512007)(26005)(110136005)(966005)(54906003)(316002)(86362001)(31696002)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NThmWHF3TkJna2RjWnhLUXo3aE1xYzJsUXdMbmdRZU5XUHJtMWNZOVR3NTJI?=
 =?utf-8?B?bk43K092MnZldzY4VzZPK1grdVRWeXpCRDZPbk0wK1R2Qjc4ZDdEMUk1Y2ox?=
 =?utf-8?B?UHJYMGl1Ti9zUlpFUkxQdFRLV0pnNDBwL0dlQnhnbjdXcUJSK0hjVElWN3ZV?=
 =?utf-8?B?dmRBVmZCRTNSNW51SVZwS0ZsWFhOR2lLbmErY0ZDWVg0azhxWmdpcGhpR3o4?=
 =?utf-8?B?MjBUZ1lkNk8zN1RBY3MwYWpENElTcGxvTXNuYXorOTY3OG9FVEpjMXhTNS9X?=
 =?utf-8?B?cFl5MXArd281dUFObkxYQ3l5WGFqbGxvSFZnaGYvak12UklLc0lLYXVQUUk3?=
 =?utf-8?B?WFVid3drSy9qbkdBYjA2MmlhdTltR2tuSEx1N3k1dzlHc1BXalQzUXpoRVZC?=
 =?utf-8?B?TTF6dnFPeSszN0RNQ1IyY1BJTW5sU09ZUXdXZzF2ck4zSHI0WTZnNVRhSFl1?=
 =?utf-8?B?aFZzM2RFODlIajNJck9jV2FlbklRL21XRDh0NkRjNytQeldEZWh0aDJ4a2xt?=
 =?utf-8?B?bDhuNXRTNzB2U2poRE9YK28wNUN6eHlwM2tHS2k2MXc5SzJ6YUNxalJ4N01l?=
 =?utf-8?B?bDZaSzd2b0k5b3RTc2hYc1d1YTd2dFpTN3BxYlQ0Nmt6YVFaN2R2TXJwUzJm?=
 =?utf-8?B?YitMZWlSVzIydzhFcDdIdzViOWZKdDd6QjA1NDl3Ylc2MWtLSnQ5NVNDbVBS?=
 =?utf-8?B?T21xRGZBZXhCMFNReHJKTlpVeGN2S20rN3NWSllTSUhBQlpvL1BhUUFyM29X?=
 =?utf-8?B?Rkh4N1Jka1BNYlF4RXdhYUsyWkFDM3d2eGNudzFvUFRDbXdYa2RuYVlIZm9V?=
 =?utf-8?B?bXFlOHFKU2FnbmtpT3QzL0EvRTZ2RHYySzVjSDFialVUMDlRMUJTYm1veSsy?=
 =?utf-8?B?L2d2OERpUjFiM1lvdTFHTXE5NG9xWkxPUjRoUDI1K2hQV3dsaHdObm04U3Vy?=
 =?utf-8?B?eEovY212SzdQc0VhdFVWQ0JXV0ZYbGFPZGk0WnFLbzNta1FqNnNQUjV6Skcw?=
 =?utf-8?B?YlVma1RVUDNvSktZMVdycmVpdUM5dnRDQStXQ2NvdGRVSE00c1I1SllOUHls?=
 =?utf-8?B?YjNYWnhUd0hPL0pkeW9YSUc1QWsrQ3NSUndCOVVyQ0YvTVdSVnJuUGR4Rjky?=
 =?utf-8?B?alhOZHAxb2gxS2pDRGJHaXVQZGJ5UkV0bkZGNHIwRDZaWnJyM2w3bVlVWmRQ?=
 =?utf-8?B?Q1Ezc1g5V2VrOUpWNHNVTUJMcGJRMnhVRG5haTJENWZ2OFZiMXNNR3JPdjB1?=
 =?utf-8?B?Q1JucFZSZExHekd1YmZxTzZVemtNb2tGQUFBZFVhSVlKUURjSncra2Z2clZB?=
 =?utf-8?B?TDZqVFF3am5OR1NodU1qSWhya2IvVCtSQlBzazR1TFJRbzZxSHpwRXJSNHlk?=
 =?utf-8?B?bURvL1lTNmFuK2sxODk3akI2cExYd3hkblZIY1dabEMvUStrK1hIdnd1czVq?=
 =?utf-8?B?NVBURm9qNU83UVlqc0lKVUh2T2lsLzdkODVuc3g1YjVJNS85UXVMbStQU1Rt?=
 =?utf-8?B?ZlY4R01Ib3BPd2NKMXZjNHJwTGlrY1VjK0FvUGtaVXpxYzA5TG9YeGwvVlJX?=
 =?utf-8?B?N29vdHZ0NE1nRDY3UGFqcHN2S1hhKzNSb010YTAwYkhqM1hoeEJ2RlV2K2Nq?=
 =?utf-8?B?bkhxNDNQMlNOLy9JWUpzZ2JHQmJ0cW1vS1FYQkNvdG9EQXVQdTZVWXlFblB1?=
 =?utf-8?B?VHBOZ2UwSlV5VXYwNFdZNjJLdzFya0U2d29aRWl3VkVySWV2RnVkanZvWFow?=
 =?utf-8?B?U0F5N0F0NGNqMlBQZFhGbENRUE5pNzBlT2tEUXdsVTVqUysyL2ZNenVXcHk2?=
 =?utf-8?B?OUQ0UFk5QjdkYUgwMmpoRS9CNytQdGwyVnZrTG8vWTJZa3FWRUJtekFOb0tJ?=
 =?utf-8?B?MVJvUkY5cy93N3hrcnNoWVNVTHdBVWc3cWpVbFBZakFUNWk1OXVYNk82RnJR?=
 =?utf-8?B?anJiZnlzd1pMVnd6dGFYUnYxZ3QrNlNYYUZNRVJxdFFyMG5yVGxyVW45dWsy?=
 =?utf-8?B?NCtEdlVhNXVGS2pha1J4blZzOUZrQlhFSEMvMCtST3BYbjdQZlJ4cTU0T3J3?=
 =?utf-8?B?UE0xdjFOQWk5ckEwRU94akh3dXVTK21KWlZKN3hhL0FXaUg5amRqZ1BncGFa?=
 =?utf-8?Q?b7+HB5nKAu43HDP3cDVMX4mZ0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c0c0638-274a-482d-e393-08da8071a357
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2760.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 16:57:58.8952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SP4VB2KJjNZLpdEzwUE7SAB1sqB0zm5Pl1WwEiwPJnTubbvJ88BF9VPAgTnfzIj5CfcNm9DNl1x41K/f9vC94w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3542
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

On 8/17/22 7:22 AM, Hans de Goede wrote:
> Hi Daniel,
>
> On 7/15/22 13:59, Hans de Goede wrote:
>> Hi Daniel,
>>
>> On 7/12/22 22:13, Daniel Dadap wrote:
>>> Thanks, Hans:
>>>
>>> On 7/12/22 14:38, Hans de Goede wrote:
>>>> On some new laptop designs a new Nvidia specific WMI interface is present
>>>> which gives info about panel brightness control and may allow controlling
>>>> the brightness through this interface when the embedded controller is used
>>>> for brightness control.
>>>>
>>>> When this WMI interface is present and indicates that the EC is used,
>>>> then this interface should be used for brightness control.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>    drivers/acpi/Kconfig           |  1 +
>>>>    drivers/acpi/video_detect.c    | 35 ++++++++++++++++++++++++++++++++++
>>>>    drivers/gpu/drm/gma500/Kconfig |  2 ++
>>>>    drivers/gpu/drm/i915/Kconfig   |  2 ++
>>>>    include/acpi/video.h           |  1 +
>>>>    5 files changed, 41 insertions(+)
>>>>
>>>> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
>>>> index 1e34f846508f..c372385cfc3f 100644
>>>> --- a/drivers/acpi/Kconfig
>>>> +++ b/drivers/acpi/Kconfig
>>>> @@ -212,6 +212,7 @@ config ACPI_VIDEO
>>>>        tristate "Video"
>>>>        depends on X86 && BACKLIGHT_CLASS_DEVICE
>>>>        depends on INPUT
>>>> +    depends on ACPI_WMI
>>>>        select THERMAL
>>>>        help
>>>>          This driver implements the ACPI Extensions For Display Adapters
>>>> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
>>>> index 8c2863403040..7b89dc9a04a2 100644
>>>> --- a/drivers/acpi/video_detect.c
>>>> +++ b/drivers/acpi/video_detect.c
>>>> @@ -75,6 +75,35 @@ find_video(acpi_handle handle, u32 lvl, void *context, void **rv)
>>>>        return AE_OK;
>>>>    }
>>>>    +#define WMI_BRIGHTNESS_METHOD_SOURCE            2
>>>> +#define WMI_BRIGHTNESS_MODE_GET                0
>>>> +#define WMI_BRIGHTNESS_SOURCE_EC            2
>>>> +
>>>> +struct wmi_brightness_args {
>>>> +    u32 mode;
>>>> +    u32 val;
>>>> +    u32 ret;
>>>> +    u32 ignored[3];
>>>> +};
>>>> +
>>>> +static bool nvidia_wmi_ec_supported(void)
>>>> +{
>>>> +    struct wmi_brightness_args args = {
>>>> +        .mode = WMI_BRIGHTNESS_MODE_GET,
>>>> +        .val = 0,
>>>> +        .ret = 0,
>>>> +    };
>>>> +    struct acpi_buffer buf = { (acpi_size)sizeof(args), &args };
>>>> +    acpi_status status;
>>>> +
>>>> +    status = wmi_evaluate_method("603E9613-EF25-4338-A3D0-C46177516DB7", 0,
>>>> +                     WMI_BRIGHTNESS_METHOD_SOURCE, &buf, &buf);
>>>> +    if (ACPI_FAILURE(status))
>>>> +        return false;
>>>> +
>>>> +    return args.ret == WMI_BRIGHTNESS_SOURCE_EC;
>>>> +}
>>>> +
>>>
>>> The code duplication here with nvidia-wmi-ec-backlight.c is a little unfortunate. Can we move the constants, struct definition, and WMI GUID from that file to a header file that's used both by the EC backlight driver and the ACPI video driver?
>> Yes that is a good idea. I suggest using include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h
>> to move the shared definitions there.
>>
>> If you can submit 2 patches on top of this series:
>>
>> 1. Moving the definitions from drivers/platform/x86/nvidia-wmi-ec-backlight.c to
>>     include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h
>>
>> 2. Switching the code from this patch over to using the new nvidia-wmi-ec-backlight.h
>>
>> Then for the next version I'll add patch 1. to the series and squash patch 2.
>> into this one.
> Note: I'm preparing a v3 of the series and I've made these changes myself now.


Okay, thanks. Sorry, I had started on this but then got distracted by 
other work.


>>> I was thinking it might be nice to add a wrapper around wmi_brightness_notify() in nvidia-wmi-ec-backlight.c that does this source == WMI_BRIGHTNESS_SOURCE_EC test, and then export it so that it can be called both here and in the EC backlight driver's probe routine, but then I guess that would make video.ko depend on nvidia-wmi-ec-backlight.ko, which seems wrong. It also seems wrong to implement the WMI plumbing in the ACPI video driver, and export it so that the EC backlight driver can use it, so I guess I can live with the duplication of the relatively simple WMI stuff here, it would just be nice to not have to define all of the API constants, structure, and GUID twice.
>> Agreed.
>>
>>>
>>>>    /* Force to use vendor driver when the ACPI device is known to be
>>>>     * buggy */
>>>>    static int video_detect_force_vendor(const struct dmi_system_id *d)
>>>> @@ -518,6 +547,7 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
>>>>    static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>>>>    {
>>>>        static DEFINE_MUTEX(init_mutex);
>>>> +    static bool nvidia_wmi_ec_present;
>>>>        static bool native_available;
>>>>        static bool init_done;
>>>>        static long video_caps;
>>>> @@ -530,6 +560,7 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>>>>            acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
>>>>                        ACPI_UINT32_MAX, find_video, NULL,
>>>>                        &video_caps, NULL);
>>>> +        nvidia_wmi_ec_present = nvidia_wmi_ec_supported();
>>>>            init_done = true;
>>>>        }
>>>>        if (native)
>>>> @@ -547,6 +578,10 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>>>>        if (acpi_backlight_dmi != acpi_backlight_undef)
>>>>            return acpi_backlight_dmi;
>>>>    +    /* Special cases such as nvidia_wmi_ec and apple gmux. */
>>>> +    if (nvidia_wmi_ec_present)
>>>> +        return acpi_backlight_nvidia_wmi_ec;
>>>
>>> Should there also be a change to the EC backlight driver to call acpi_video_get_backlight_type() and make sure we get acpi_backlight_nvidia_wmi_ec? I don't see such a change in this patch series; I could implement it (and test it) against your patch if there's some reason you didn't do so with the current patchset.
>> I was thinking about this myself too and I decided it was not necessary since
>> acpi_video_get_backlight_type() will always return acpi_backlight_nvidia_wmi_ec.
>>
>> But thinking more about this, that is not true, a user might try to force
>> using a different backlight firmware interface by e.g. adding:
>> acpi_backlight=video on the kernel commandline.
>>
>> So yes a patch adding something like this:
>>
>> 	if (acpi_video_get_backlight_type() != acpi_backlight_nvidia_wmi_ec)
>> 		return -ENODEV;
>>
>> to the EC backlight driver would be very welcome.
> I will also add a patch for this to v3 of the series myself.


Thanks. I have already done testing against v2; I will retest when you 
send out v3. As we discussed in another thread, the NVIDIA proprietary 
driver does need some minor changes for backlight control to work after 
these changes - I am tracking this work internally, and plan to get the 
required changes added to the NVIDIA proprietary driver once your 
changes have made it to the relevant subsystem tree(s), with the hopes 
of having at least one public driver release include updated backlight 
support by the time upstream kernels start shipping with the backlight 
changes.


> Regards,
>
> Hans
>
>
>
>>>
>>>> +
>>>>        /* On systems with ACPI video use either native or ACPI video. */
>>>>        if (video_caps & ACPI_VIDEO_BACKLIGHT) {
>>>>            /*
>>>> diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
>>>> index 0cff20265f97..807b989e3c77 100644
>>>> --- a/drivers/gpu/drm/gma500/Kconfig
>>>> +++ b/drivers/gpu/drm/gma500/Kconfig
>>>> @@ -7,6 +7,8 @@ config DRM_GMA500
>>>>        select ACPI_VIDEO if ACPI
>>>>        select BACKLIGHT_CLASS_DEVICE if ACPI
>>>>        select INPUT if ACPI
>>>> +    select X86_PLATFORM_DEVICES if ACPI
>>>> +    select ACPI_WMI if ACPI
>>>
>>> I'm not sure I understand why the Intel DRM drivers pick up the additional platform/x86 and WMI dependencies here. ACPI_VIDEO already depends on these, doesn't it?
>> It does.
>>
>>> If Kconfig doesn't otherwise automatically pull in an option's dependencies when selecting that option
>> Right that is the reason why this is done, for select the Kconfig block must also select all deps
>>
>>> then shouldn't Nouveau's Kconfig get updated as well?
>>> It selects ACPI_VIDEO in some configuration cases.
>> nouveau's Kconfig block already selects ACPI_WMI:
>>
>> config DRM_NOUVEAU
>> 	tristate "Nouveau (NVIDIA) cards"
>> 	...
>> 	select X86_PLATFORM_DEVICES if ACPI && X86
>> 	select ACPI_WMI if ACPI && X86
>> 	...
>> 	select ACPI_VIDEO if ACPI && X86
>>
>> That is why this patch does not add this.
>>
>>> (It looks like amdgpu doesn't currently select ACPI_VIDEO, maybe because it doesn't depend on it the way the Intel drivers do: there are several AMD+NVIDIA iGPU/dGPU designs out there which use this backlight interface.)
>> Correct, but with this series amdgpu/radeon also start using ACPI_VIDEO
>> functions so these patches:
>>
>> https://patchwork.freedesktop.org/patch/493650/
>> https://patchwork.freedesktop.org/patch/493653/
>>
>> Add the necessary selects and I cheated a bit and also made
>> them select ACPI_WMI already even though that is only
>> necessary after this patch (which comes later in the series).
>>
>> I hope this answers al your questions...
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>>
>>>>        help
>>>>          Say yes for an experimental 2D KMS framebuffer driver for the
>>>>          Intel GMA500 (Poulsbo), Intel GMA600 (Moorestown/Oak Trail) and
>>>> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
>>>> index 7ae3b7d67fcf..3efce05d7b57 100644
>>>> --- a/drivers/gpu/drm/i915/Kconfig
>>>> +++ b/drivers/gpu/drm/i915/Kconfig
>>>> @@ -23,6 +23,8 @@ config DRM_I915
>>>>        # but for select to work, need to select ACPI_VIDEO's dependencies, ick
>>>>        select BACKLIGHT_CLASS_DEVICE if ACPI
>>>>        select INPUT if ACPI
>>>> +    select X86_PLATFORM_DEVICES if ACPI
>>>> +    select ACPI_WMI if ACPI
>>>>        select ACPI_VIDEO if ACPI
>>>>        select ACPI_BUTTON if ACPI
>>>>        select SYNC_FILE
>>>> diff --git a/include/acpi/video.h b/include/acpi/video.h
>>>> index 0625806d3bbd..91578e77ac4e 100644
>>>> --- a/include/acpi/video.h
>>>> +++ b/include/acpi/video.h
>>>> @@ -48,6 +48,7 @@ enum acpi_backlight_type {
>>>>        acpi_backlight_video,
>>>>        acpi_backlight_vendor,
>>>>        acpi_backlight_native,
>>>> +    acpi_backlight_nvidia_wmi_ec,
>>>>    };
>>>>      #if IS_ENABLED(CONFIG_ACPI_VIDEO)
