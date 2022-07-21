Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BB657D600
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 23:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AC814B9B3;
	Thu, 21 Jul 2022 21:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A3118BE8F;
 Thu, 21 Jul 2022 21:30:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ka8WdyI+eJ0q7ORHFdR128nRj5D298tZK+Jhl12pAJF7QzGDU5YDYNLaZ8jZpE+ghRnXgm1Cz695RYSSt1KzJfXof+YS7JGNW3URqg6E3bjSuAlE7pFvDoHnVOEkJRVfGJXD0tHn2Mrwe5lSmxvU8okK7HZ24ROev266DCspqnHtqRVKVXYAFT6c1qOpODKodY8JgWwKYakLrIgY4IFRvHYIPaWrBb90TJQDmX45gJSFJqzrCxl4VWosbOfF/l57g9A/S1Bvmlr1QNU3Vf0xVywivtZTMC9nNV+wkqvW4OMB1W9hRNbmZYffxXIorr5D3oad0/3ZOrRO5xancAyAdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+FA4NbIgKPhRa9ACnIqMnuvv17qvKqyb1ljimlsKf4=;
 b=XAm/g+lSr0sCKXAlEmSvIGCCgsiAs5AgDtr6laQiiNSenQhlEvowOBAuSjKN4xQIRyP3F0MrF9xSm+mjQTOKjJayDtL8UNxfWieSldv/m39gRdlccZk5yGTAnhKowWeQcZi3fUs9nLTp4guXbTpvC6ZdpmASOep2HrC04+Nz8MI24DCSb9BdYq7YbpJiiAZ6/fKFXQVwn0Ak3f8i74u7QBruq4vI6Rgrp6DM13ruWi+WOG1IA5fvMEQqDLRZ6xOuTujx1Dvps0G9RECmpVfWUhUKVncbrjf71RaBGdOsKtURzpbW8ZjL6iov/m0UywdP9SiYCvBx0yUGYHQMrI0gjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+FA4NbIgKPhRa9ACnIqMnuvv17qvKqyb1ljimlsKf4=;
 b=Th5Z1UF24AxjacA6HGQgRG1+touWpY0yKzSG9yt4WMLlClE8h6JpEACUFXIb+Cl1QqKKA9XDsc26qIOffjlArqqvSQGf7c6LyvsE2kxtkYpxP5QqSi5ptKPC/dIvFcRcxl+rTb7IqyFGHXlR5v1Hnkl88wSSIWh+8ef4cs7Z+bXFVIInpfW8imQxO6n3HakzN31beM2Y0bwhk4wNVcEnG6w+AMd6b9z4UcI91jdJhlxnhMlxPHpOkLmzi8LfsxrD5/+zpF36D4MN/LGVWlOAS1uXRaxXUoGNaKzD9LAtfk0W+V/g6hFg02RXgrFCcYpcP3HpyWElKsAEImb7ZOWeTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 DM5PR1201MB0044.namprd12.prod.outlook.com (2603:10b6:4:54::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.20; Thu, 21 Jul 2022 21:30:35 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::d043:c95a:cf42:cff4]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::d043:c95a:cf42:cff4%7]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 21:30:35 +0000
Message-ID: <20e4ffcf-2a3a-e671-5f98-1602b78df3cb@nvidia.com>
Date: Thu, 21 Jul 2022 16:30:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 01/29] ACPI: video: Add
 acpi_video_backlight_use_native() helper
Content-Language: en-US
From: Daniel Dadap <ddadap@nvidia.com>
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
In-Reply-To: <641cb059-48f5-5f05-5ec2-610f1215391c@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0045.namprd13.prod.outlook.com
 (2603:10b6:806:22::20) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed02d4d0-c4a3-436c-0431-08da6b603f59
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0044:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PTQWCJpB01f8jXqdP39gQwyDNpZHyqU3+V28vShBuwRVX9r7kDaEq3yRMZUIy/ze0o1zzYgZ/tvg78K2mNRLvqzJv4S7iSEJcECr9KPsq0PCtx5tuQtlCU8i4ulcpvX5DNL+6xXh4a10VeSPyADvPeFV6pbA+ih+cOfgcqjvlYsgTJwa7c2snGMDo3TDB8oppugJ3x6k5wouysC9Yom21Uz5OWxHJxVLyL5cYfD9v+V9tZigfP2lu7uRcnjV87O0+KZ0KSr4ELB0RHrDgRvP1GPD/sG+1G15ZJRlXngYMoNyl9vBBmfHC+5WGrjql+eqE271D44YG3gC9sfstRH9USell0tMR7MSUTrfPdQ6KbDgKgkluqIIpbGCfl5jDHdjX7t8mGH+INFzLmD+dQyfVc6U6e7p7QVeWBae33C86577cp07yoofrcfzAsJeQOoi9iJqQNs3DVIIAJuVpe47D4ioVfa27a9YBQ+FJTmOwNeeUKqvMdsbYR/UuyXFy0iMC35rl6cOBezIXvwGgPxFvxNee4aSE1h8GHMlwdUe1XXLmHLViBVM+LDvWVCqik//LdlV4XYwbAhWw9bojPzQiB2JPaZ9AQnIlc97iJZ3Gc3cuCg+iozXN1lw+3mGBb9XbiIz6UYGsOXEpfpnFL1KaHmYlXfjAdASX52Ofy2EO29++FqowV8w9Ge9vt7sIRWugswlwlkHQM5wiYtjE3nJXUAJW0ZAG1uE1aqJybZUj7EPUtT6q/EveZvXGQry10AjTpQbhsic0gcGN8WVCyOfKC/YlUjkKgTNYctRNvteCv9KN1nIeKDHOlmqSZBPyO54KKWrlgB99Wejtvm4jZcCScnMyLMS4KrxPMoy2O5po3o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2763.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(53546011)(8676002)(6666004)(6486002)(83380400001)(66946007)(41300700001)(26005)(66476007)(31696002)(86362001)(2906002)(186003)(8936002)(66556008)(478600001)(6506007)(6512007)(2616005)(54906003)(7416002)(36756003)(5660300002)(31686004)(316002)(4326008)(110136005)(38100700002)(921005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aElvbGNjTmYzVlVZb0sveC9Vd0N4OHFSWFpwOHAwS01zRHlTMG1VV1ZtRU8w?=
 =?utf-8?B?KzRxbGxmcFVsZk9XUWhqRnpmTDFUWEZnZVpIM2xNSHdpalZnREdWeERicEJt?=
 =?utf-8?B?QlA4UEtya0lSc0RvcVdSSXYxVExTOE4yWENNajVjT1pNTUZHYjROdmpvcUtM?=
 =?utf-8?B?c21FSDJlL1c0bzh6L1ozYkJGQVBMekdvNno4UmpLeFUrcTFkTzJzSzR2V3hE?=
 =?utf-8?B?SXl3NzRzN09lai9DWWlwWk9LVHIxYlRJNWlSQUFhL1NBYmovakh6RysrZThu?=
 =?utf-8?B?U2JvWmpraDNQa3YyRCt2NnZsekYxaDlsVUhxTldIZ3pNdVYvVlJMekpqdGJw?=
 =?utf-8?B?QWFLSlpzTzByZjVWZUJubms2SFpVTnBGYkExU1g4d1pWcVNhVFppbzU5Rkht?=
 =?utf-8?B?SzhldWZaUmtVUlQzUTNubk9GNTdMcEtEOFpXZlZEbDd3blFpZ1JRSUZETVRh?=
 =?utf-8?B?L0FQNUtqRlAwN3V3M1ZVTUtlYk5QbjZTVGFCRUFGeWtLRm1lYkhqbGhySE43?=
 =?utf-8?B?ZVdwSUQ0aklsQWVNbnV1Wlp0NGVxSXNjbkdBYS9BdXFDVTNQMTJyZFV1VU4z?=
 =?utf-8?B?cllGS1ZqNlRicE1NZTVpbmM1QWZqZm15TEdqK1JYT3RFajdMK2duc2VsYTNt?=
 =?utf-8?B?TTlBT1Y3UHZpRE4zR3AyU2RHR1EybkJiTzR3UWUycjVuM0tkbGlDYWNwSmdQ?=
 =?utf-8?B?VVhPNW9OSmppbm1aTitLUngySmcycHh4T3lEVGx6MHpXaUtBVm5mRG5wRnN0?=
 =?utf-8?B?cmNlUjZtS0svdVZPc2dQZDA1bVdUa29naWg2eGkzc0p6clFCcXJiU2x4K2tG?=
 =?utf-8?B?dDIvYzZSdWZJa3YvZEI5dE9JcEp3eGxrSG0vYjJVSWJqUE96bWd5d3lQRVpP?=
 =?utf-8?B?a3dSb2hGYTlUWXdXOHpZeWxOeFN1QUVQcUE2bHdvVlFFdkhkRG9IK1lvYjhh?=
 =?utf-8?B?NGRmVGpheTlPTGhheFZBMXlMU3YwamZoZ0RuQTFlcUd1TExhL0RONFpiKzBn?=
 =?utf-8?B?N0pKNHhrWVFhcjFwZlI2cnoxbjBtbkNWOXYwSUx3amdxTjlEMHRkVlJQNDJv?=
 =?utf-8?B?aWVQMkZwRFJDSmxOMTBFL041RVh4WlNCOEFPU2pSK2txb2doZnNsem00KzB1?=
 =?utf-8?B?QzJjWkR3cGZsRk92cnE0VUZWS00xeHE3ckt1L1lIQmI5UnNLeXp6QjJoOEZN?=
 =?utf-8?B?MmIwMFNYYThSMGgyU3BzeCtqL2l1b0pDS2xKMzBtTlIybjVOaTd3Tm5oZlRT?=
 =?utf-8?B?QzljdG5EL3pkV1RQajNNaVdlRVVDTVhKc3l0N0FjZnZqTlJleVFmek5iVjk3?=
 =?utf-8?B?QmFmclllNzNIK1VodXhKT200TDBoZ05Vb2x4dTd4OE5Qa1J4ZjlNdWVxbGlZ?=
 =?utf-8?B?OGNoMGpZanQvOHJPNm4xcWlhSFYzZWh6WGJDVWZLMjFjZTI3b0dPYXEzU01l?=
 =?utf-8?B?dTR3TTZiVWdCL0haNmwrTXRlTFpHek45V1RXRlAzOWlrNms5NzJ0aHVWelhH?=
 =?utf-8?B?MFpqcWZyOUJwZ0xWRFdjUURJQTl5RmR1bW1YbWhoZ0JKRjdyaCtTQnBldXpw?=
 =?utf-8?B?ZVJmUmlyS2NMTDBvUHdhc3AxNE5sNjg1cVNMNDlkVGtPQ3BmRWRrQzlyZzBE?=
 =?utf-8?B?a09lLzkxeS8zR25CR0Z1NHRlWHdnQlJLOXovQ0pteXV4cm1ON3A0c2Z5YWpl?=
 =?utf-8?B?cGpDZjZHYUNxcnZ4MnNHeWE0SjRMYkJjMTFOQmdLT1dqNHNqVUdHMUxCNThq?=
 =?utf-8?B?YVlpRERnbEJNMmdDb2pnQXhxTE1UTnJpamxHOXQ0MCtSdVBubjBQaTNjRmxQ?=
 =?utf-8?B?RTIwUnp6YzZZT21OMjJhY0Y0OTg1bDNQR1lrelVTZDc4VFphcHhKOW1GdlJw?=
 =?utf-8?B?eWVtRXdsSlZDRnRhaVJob3FLRVVLYmcrS3F0ZG4xYnBYUGtUcnkwMzZyV2xN?=
 =?utf-8?B?akVNSkI4TldGMmVvVHAxTWZ4SHNHNDVyd2hDVmpDY1BiOU9DNGxYWkg1ZHBw?=
 =?utf-8?B?Nk1ZTmk1MHJWajh6bkhHOEJEbk9YNktPdDlTeVF1M1B3dVVPeHhwVUFvb1Rj?=
 =?utf-8?B?TFhsTFNzUHE1dWg5MVBYZENKYlAxT210elV1OUxYQ2xYZG55VHBuNFY5dlNt?=
 =?utf-8?Q?5OCn+Uum5zQ8bYoUJ8P5bMZT5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed02d4d0-c4a3-436c-0431-08da6b603f59
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 21:30:35.2364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAHuWVl8VvsyWDzeBo/u06ShMNXTTBe9Skq/+gN2WCIzke1HLtQkPJai3/2a4djBDhzAM2Zf1IeCxUNeWJECHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0044
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


On 7/21/22 16:24, Daniel Dadap wrote:
>
> On 7/12/22 14:38, Hans de Goede wrote:
>> ATM on x86 laptops where we want userspace to use the acpi_video 
>> backlight
>> device we often register both the GPU's native backlight device and
>> acpi_video's firmware acpi_video# backlight device. This relies on
>> userspace preferring firmware type backlight devices over native 
>> ones, but
>> registering 2 backlight devices for a single display really is 
>> undesirable.
>>
>> On x86 laptops where the native GPU backlight device should be used,
>> the registering of other backlight devices is avoided by their drivers
>> using acpi_video_get_backlight_type() and only registering their 
>> backlight
>> if the return value matches their type.
>>
>> acpi_video_get_backlight_type() uses
>> backlight_device_get_by_type(BACKLIGHT_RAW) to determine if a native
>> driver is available and will never return native if this returns
>> false. This means that the GPU's native backlight registering code
>> cannot just call acpi_video_get_backlight_type() to determine if it
>> should register its backlight, since acpi_video_get_backlight_type() 
>> will
>> never return native until the native backlight has already registered.
>>
>> To fix this add a new internal native function parameter to
>> acpi_video_get_backlight_type(), which when set to true will make
>> acpi_video_get_backlight_type() behave as if a native backlight has
>> already been registered.
>>
>> And add a new acpi_video_backlight_use_native() helper, which sets this
>> to true, for use in native GPU backlight code.
>>
>> Changes in v2:
>> - Replace adding a native parameter to 
>> acpi_video_get_backlight_type() with
>>    adding a new acpi_video_backlight_use_native() helper.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/acpi/video_detect.c | 24 ++++++++++++++++++++----
>>   include/acpi/video.h        |  5 +++++
>>   2 files changed, 25 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
>> index becc198e4c22..4346c990022d 100644
>> --- a/drivers/acpi/video_detect.c
>> +++ b/drivers/acpi/video_detect.c
>> @@ -17,8 +17,9 @@
>>    * Otherwise vendor specific drivers like thinkpad_acpi, asus-laptop,
>>    * sony_acpi,... can take care about backlight brightness.
>>    *
>> - * Backlight drivers can use acpi_video_get_backlight_type() to 
>> determine
>> - * which driver should handle the backlight.
>> + * Backlight drivers can use acpi_video_get_backlight_type() to 
>> determine which
>> + * driver should handle the backlight. RAW/GPU-driver backlight 
>> drivers must
>> + * use the acpi_video_backlight_use_native() helper for this.
>>    *
>>    * If CONFIG_ACPI_VIDEO is neither set as "compiled in" (y) nor as 
>> a module (m)
>>    * this file will not be compiled and 
>> acpi_video_get_backlight_type() will
>> @@ -548,9 +549,10 @@ static int acpi_video_backlight_notify(struct 
>> notifier_block *nb,
>>    * Arguably the native on win8 check should be done first, but that 
>> would
>>    * be a behavior change, which may causes issues.
>>    */
>> -enum acpi_backlight_type acpi_video_get_backlight_type(void)
>> +static enum acpi_backlight_type __acpi_video_get_backlight_type(bool 
>> native)
>>   {
>>       static DEFINE_MUTEX(init_mutex);
>> +    static bool native_available;
>>       static bool init_done;
>>       static long video_caps;
>>   @@ -570,6 +572,8 @@ enum acpi_backlight_type 
>> acpi_video_get_backlight_type(void)
>>               backlight_notifier_registered = true;
>>           init_done = true;
>>       }
>> +    if (native)
>> +        native_available = true;
>>       mutex_unlock(&init_mutex);
>>         if (acpi_backlight_cmdline != acpi_backlight_undef)
>> @@ -581,13 +585,25 @@ enum acpi_backlight_type 
>> acpi_video_get_backlight_type(void)
>>       if (!(video_caps & ACPI_VIDEO_BACKLIGHT))
>>           return acpi_backlight_vendor;
>>   -    if (acpi_osi_is_win8() && 
>> backlight_device_get_by_type(BACKLIGHT_RAW))
>> +    if (acpi_osi_is_win8() &&
>> +        (native_available || 
>> backlight_device_get_by_type(BACKLIGHT_RAW)))
>>           return acpi_backlight_native;
>>         return acpi_backlight_video;
>
>
> So I ran into a minor problem when testing the NVIDIA proprietary 
> driver against this change set, after checking 
> acpi_video_backlight_use_native() before registering the NVIDIA 
> proprietary driver's backlight handler. Namely, for the case where a 
> user installs the NVIDIA proprietary driver after the video.ko has 
> already registered its backlight handler, we end up with both the 
> firmware and native handlers registered simultaneously, since the ACPI 
> video driver no longer unregisters its backlight handler. In this 
> state, desktop environments end up preferring the registered but 
> non-functional firmware handler from video.ko. (Manually twiddling the 
> sysfs interface for the native NVIDIA handler works fine.) When 
> rebooting the system after installing the NVIDIA proprietary driver, 
> it is able to register its native handler before the delayed work to 
> register the ACPI video backlight handler fires, so we end up with 
> only one (native) handler, and userspace is happy.
>
> Maybe this will be moot later on, when the existing sysfs interface is 
> deprecated, and it probably isn't a huge deal, since a reboot fixes 
> things (I imagine installing an in-tree DRM/KMS driver on an already 
> running kernel isn't really a thing, which is why this isn't a problem 
> with the in-tree drivers), but would it make sense to unregister the 
> ACPI video backlight handler here before returning 
> acpi_backlight_native? That way, we'll briefly end up with zero 
> backlight handlers rather than briefly ending up with two of them. Not 
> sure if that's really any better, though.
>

Thinking about this a little more, maybe it's better not to overly 
complicate things, and just assert that users of the NVIDIA proprietary 
driver will need to reboot after installation in order to get the 
backlight working, at least until we get further along in this effort 
and the backlight interface transitions to the DRM connector property 
you have proposed.


>
>>   }
>> +
>> +enum acpi_backlight_type acpi_video_get_backlight_type(void)
>> +{
>> +    return __acpi_video_get_backlight_type(false);
>> +}
>>   EXPORT_SYMBOL(acpi_video_get_backlight_type);
>>   +bool acpi_video_backlight_use_native(void)
>> +{
>> +    return __acpi_video_get_backlight_type(true) == 
>> acpi_backlight_native;
>> +}
>> +EXPORT_SYMBOL(acpi_video_backlight_use_native);
>> +
>>   /*
>>    * Set the preferred backlight interface type based on DMI info.
>>    * This function allows DMI blacklists to be implemented by external
>> diff --git a/include/acpi/video.h b/include/acpi/video.h
>> index db8548ff03ce..4705e339c252 100644
>> --- a/include/acpi/video.h
>> +++ b/include/acpi/video.h
>> @@ -56,6 +56,7 @@ extern void acpi_video_unregister(void);
>>   extern int acpi_video_get_edid(struct acpi_device *device, int type,
>>                      int device_id, void **edid);
>>   extern enum acpi_backlight_type acpi_video_get_backlight_type(void);
>> +extern bool acpi_video_backlight_use_native(void);
>>   extern void acpi_video_set_dmi_backlight_type(enum 
>> acpi_backlight_type type);
>>   /*
>>    * Note: The value returned by 
>> acpi_video_handles_brightness_key_presses()
>> @@ -77,6 +78,10 @@ static inline enum acpi_backlight_type 
>> acpi_video_get_backlight_type(void)
>>   {
>>       return acpi_backlight_vendor;
>>   }
>> +static inline bool acpi_video_backlight_use_native(void)
>> +{
>> +    return true;
>> +}
>>   static inline void acpi_video_set_dmi_backlight_type(enum 
>> acpi_backlight_type type)
>>   {
>>   }
