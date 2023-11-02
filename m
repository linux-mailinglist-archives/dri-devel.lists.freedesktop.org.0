Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF137DFA81
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 20:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DAF10E984;
	Thu,  2 Nov 2023 19:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD28510E983;
 Thu,  2 Nov 2023 19:00:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DPwLF0tGRg+qpRP6tlQaPTMfFsbWgOmM5HI30t7UJia8k7J2KWLuLXIDhNr4EVgcVnaycJM6CQoLpyR6ro+HnWpkySAppf7hXrDdl52zwMS25ngQR81yYttuJNkSlpnVB9Etkb9/at3AxnAbgENDnV5kp2O8/QceeFbP8jt6ZwiHTak1lwjWxeCW4WN84Jtd4xZN0EKUDd3zeNqcsoDRVQ+Mshw1GcHNCWU5ufLtPPlgIZMoUcgw1vDJ4btUOGHc9C6XEnZgLdo5nbO4Y6imjGzXbu/0nOFu2n6Wdd49dq4706d8wkYjGJIyMI8bxHWFoihQOtiP6uwGmwLEQZlXMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5Y28Wm2wIfxhJiYkMWDWW/VzW7YYYLCesct4WDAwPA=;
 b=LsGK8yrr63gmwpLZDyRoIkcHUqn02Gm7juNsRHXsRzROwy5rCoTHeoB18g6Wy/mZlgTWxNnwgJexXl5Y69RFfBunr0hPXm4WX/cKuub/Rwi+8hDkoQLug8QU/AYtB6sfERQqbH2MYUCuWJm4fl8qhmxmPxPzPewNcBlNnmpklinNobEUqKhSO5FZNDihywi4RJsWoPU0F73Q5FZRgNTk/Ql/gY0iViOUN+Wia8Gx4OZUeKK1kjZLNzHwHBTMvWOIS7FxQPRU5FUQ7/C67eN7AGioXSDrVwIJ8KN2hFOq9vJiInWKgFYkAVBpHVkDo1dZQogpYkLO5b+hJ6ac84ZKwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5Y28Wm2wIfxhJiYkMWDWW/VzW7YYYLCesct4WDAwPA=;
 b=5clJhTyxIKPEDY7JPI9WPfAkdUBeSnRtP9s0VghzvtYBthDDLKp3uPPVgRP/eW4n6gI96T7Ei4h7g5Af+BiVCqHYFbaTAYCkuO/F/g+GJbTkBwrvWYSmeCMqxkLCdghfo2utE5lXai/dGC59HiKQQjF1IbEtTXj9kUR0wUivlCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 CH0PR12MB5090.namprd12.prod.outlook.com (2603:10b6:610:bd::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.21; Thu, 2 Nov 2023 19:00:41 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466%7]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 19:00:41 +0000
Message-ID: <1eed6bfa-3e98-45d1-9908-2c5a0f3173c3@amd.com>
Date: Thu, 2 Nov 2023 15:00:37 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/edid: add a quirk for two 240Hz Samsung monitors
To: Alex Deucher <alexdeucher@gmail.com>
References: <20231101210037.130494-1-hamza.mahfooz@amd.com>
 <CADnq5_Nv0MnG+pPvRQO37OP8iYwz8oGvFLs2g-+U=URHWcqJGw@mail.gmail.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <CADnq5_Nv0MnG+pPvRQO37OP8iYwz8oGvFLs2g-+U=URHWcqJGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0339.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::29) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|CH0PR12MB5090:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c100731-7b0d-4241-f5c5-08dbdbd6023b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l36x+ebe/kKiGBQQNdYL5TUNMo7lHreDqJs51GtlnntZa75dSs9+YhJcTAsVXs1cPF+cIDH5enlvrHE0KfEmmj1WLKnnBXcRFdSZJKlRMYA0L1zjobIydMo1H+zcFWOoopPfpPSL5wMbizjH+DVDiVViN+fn2vTazfMzh8ntvgiAXwxj61SnVrCSQCry2jxc0ixLF/dIkXaECOODO/JRq5OduvAuZtHu3lv6J62ShZWDVV9QeL4sCbBjE+eQZdPipOdG1dzGPDYFGJI3bN1RGIehDA+DcMPP79o6ySevNXFHtK7gYLDHdexUTcvmet/USy8Uf/AvS3CuZA42JDtkp6AIeFk+pNt4tQmQZYrQA0KSg63/npJ41zARqYYh+m6uKzbvM7yN2dydg1vV8LCx6aanbpbqyaYqRQSjikMAvjg+i9Y5Iw9DPEvJnH0kiGwEHpAgCDyIH2f8zIWP4cy7FpHmpvqfrCjbnnNusLoDIylGxZden3cM44k5dxYFCVdKAAkPmqwxgbgOUynZB19kQbx8ljVXrUen66D7fuDyqAVxFfY8D7mTEEttynBCN5CNASp8Y4z+AnIMIqZKK/1kcMdZVrLzPAWTpcog/IOAJyjsppjDAHptMiutupU2KNkj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(2906002)(45080400002)(6486002)(966005)(478600001)(2616005)(36756003)(26005)(41300700001)(38100700002)(86362001)(31696002)(53546011)(83380400001)(6506007)(6666004)(6512007)(316002)(6916009)(66946007)(54906003)(66476007)(66556008)(44832011)(5660300002)(4326008)(8676002)(8936002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVl1NytNZFNmV1hSTWRKZUxSSXpUdEZoZGFlWTJUdzAzVXpGSW5MaE5YNDBn?=
 =?utf-8?B?WDdqMGJmYjJzNlRWeHc2c3dzWGxjdlU0VFBzc2k5K1F2S01sSmZva3FveXRE?=
 =?utf-8?B?Zy9rQVFKekNjcG10YklWUVBQdUFpS0hXRFZSN3dDVzFQQVRESEtjdG9URG4y?=
 =?utf-8?B?Skd3bTZTd0lieC82NTdTd1RPeE1pTHVpMWhZMGxSekR5MHkwdFFkQ1NUU2dK?=
 =?utf-8?B?VjFFNEg5ZWRwcXhiV2wycHh2NEU3eStJQVlCQVMvTDVCR3pyRjVJL3JGK0NH?=
 =?utf-8?B?YWhQQndUZEZnSkN4blE5b3RWWWNuNCtHY0tlRTJjdHJ6dm05dUFkUWdOcStY?=
 =?utf-8?B?a0p0RjcrWEpzQ1VWR0RQVmJaNHJ6RXFDTlVCeVQ2WHlFQmYvV1VuNGhSYW1S?=
 =?utf-8?B?OXRkRmhQbFFLZk54dDZnaDVGOVJHTk1kOWc4ZGdRL1Ivd2p2L2JRUklYMCtP?=
 =?utf-8?B?SkhYeHJlS005eE1xTVh0YzEwVEE2NnFYVzNIOW9VRXlUdVhHSTFBT3JlVi9p?=
 =?utf-8?B?ZTdzNkt3M2tzckIyYWJRbjl1c05qb0NLQ3U5L2xySEhCM0t3cDh0b0U0Q0NJ?=
 =?utf-8?B?Y0JESmdMU1g3WVVXM09mYzcrS3hid0JKSDJjUFZOa0ovWVFxL3pTaHcwWXoz?=
 =?utf-8?B?M3ZGc0JMaEhiN2liK1hFOUVYalZoNkxhNENOdThTaFRMRHh4b243dHRvSUhX?=
 =?utf-8?B?eVRZcEdTelJGYVZwc3FMakhsa3hVRHp2KzJCTXVlZkZJWFMyU1QyQUFlTHRh?=
 =?utf-8?B?NVk1bmcwS1dhaE8wcUl3c1NEZlVOcTZwY1g1WXZjOVlVZ3NqZit4KzZUZkZW?=
 =?utf-8?B?eGFrU2Y1Sm1Ec1docm9kckxkYUFERXBnb0NWV3dIVG81blNKeldnYnZQNnhI?=
 =?utf-8?B?c0tnZ2taSzJXNmZnSnltbUNJRGU3bmhCTnU4czNWMTNUaVhobkFURVJHdHdH?=
 =?utf-8?B?aFFENnM1V2Y0NS9lUHI3ZE82ZXZBN0Y0UndzRnlockZwS2JNeEJlcE1QYURv?=
 =?utf-8?B?QklmZzhlM3dRcXVKeXNlWmRGcG9BV2NmTS9VQkdPYUY1akUzR0NUSyt4dmFF?=
 =?utf-8?B?RzdJUjR6Szk1UmRiSVNZVC8zdUxTOGkzbDdYODMrR24vanZwekdGVzd0SU9q?=
 =?utf-8?B?ZXRubWVMVDhaajQ5NWpSMktEcnRIMk00em1KVktpTlh3M1E5RFdMNG9aeFVJ?=
 =?utf-8?B?U2FjSDgraEo5TVlTa0taaWwvL1JmdCs0b2xsYzFVeXpMMTVOUlJ2ZC9Damh4?=
 =?utf-8?B?cjUvcEM2bmJDYThKcUlYVHk3TjJWUWE3RENRdnRON0hiZGVIMnhnczNHazFn?=
 =?utf-8?B?K0o5b1VHRVJkbzNGNHo1d1czdDZoNjgranl0aTJLa2Q4cHZsY3YwMEFvanA2?=
 =?utf-8?B?RENLZU12VERpN29vSDRmQTFDQ1hxeXIxWTRUclFudGNROGthSklPZnd4ZzhZ?=
 =?utf-8?B?dG0vVnhVRXBBOURiT2UxVVZvL01BZjdxeEN0M0FHYkFLSUlFaUx5Ujd2SGJH?=
 =?utf-8?B?QzhCOU5wSU1jbHhDeDF4VnUzRWkrT2IzU2RaS0JVOW9QWGh0RkVobkhBTEpp?=
 =?utf-8?B?Ukx4ZEk0K3ZWUGo3enpXRjVYSmNkSTNlSG1wejRaR3BkYVphZTE3T2ZLbEdi?=
 =?utf-8?B?VEhFSGpVQlZjODdhVVpwQ3ZhOWFCemFmU0pUQU9odTBRbFR4bldqWEpDcHlH?=
 =?utf-8?B?YUxmbnlMdzRrVHpsVFk3WEF5bEZhNTFBdEh2T0lNOER2UC95L2t1NXMraVFR?=
 =?utf-8?B?RHNpc0ZDRHlxQXdhVzNQSE1SNi9GYUhlWGRHZ3ZsYkpjVnBtVVR6Z2UxMjZu?=
 =?utf-8?B?MDc3MVUxNGtMck1GdExYNTlXSVltK29DM0swOTJXVDVKd2I5ZmlBYXcyNjhv?=
 =?utf-8?B?TkpmR0cxQUpCM2Urdy96ZlVZQXdEM2xJUlNwbSthVjlycFl6NXUrK1JjWmRi?=
 =?utf-8?B?aVVWYjBDaWRjZXU3Y1FWWDUyVk9nbGhLcVhLdlgrQm9aNkF6WktVdllZWUNY?=
 =?utf-8?B?MGZTMXJVcGdpTTVJTUNnUk5ySERLWUYzT1AwWngyTUFYRkk5OHI2cDh0bGo2?=
 =?utf-8?B?SFNvZmtzY1RNeURNeGx3OUw0bEp4U2NiOEtJc3lTRU5Za1ViN2djRWRjTHp6?=
 =?utf-8?Q?2JhSDXu6oDNIj/2MczBnk9Hdh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c100731-7b0d-4241-f5c5-08dbdbd6023b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 19:00:41.2081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XWfVa5GYj3TfcSO344IaDn7TJ3FbhqJCp5tRyD0PmVTpK9M+M8c16zfjvsVEkOLqkEXoPt9TGqUtkyTVwxehJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5090
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
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Jerry Zuo <jerry.zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/1/23 17:36, Alex Deucher wrote:
> On Wed, Nov 1, 2023 at 5:01 PM Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>>
>> Without this fix the 5120x1440@240 timing of these monitors
>> leads to screen flickering.
>>
>> Cc: stable@vger.kernel.org # 6.1+
>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1442
>> Co-developed-by: Harry Wentland <harry.wentland@amd.com>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>> ---
>>   drivers/gpu/drm/drm_edid.c | 47 +++++++++++++++++++++++++++++++++++---
>>   1 file changed, 44 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index bca2af4fe1fc..3fdb8907f66b 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -89,6 +89,8 @@ static int oui(u8 first, u8 second, u8 third)
>>   #define EDID_QUIRK_NON_DESKTOP                 (1 << 12)
>>   /* Cap the DSC target bitrate to 15bpp */
>>   #define EDID_QUIRK_CAP_DSC_15BPP               (1 << 13)
>> +/* Fix up a particular 5120x1440@240Hz timing */
>> +#define EDID_QUIRK_FIXUP_5120_1440_240         (1 << 14)
> 
> What is wrong with the original timing that needs to be fixed?

Apparently, all of timing values for the 5120x1440@240 mode of these
monitors aren't set correctly (they are all lower than they should be)
in their EDIDs. For what it's worth, the windows driver has had a quirk
similar the one proposed in this patch for ~2 years.

> 
> Alex
> 
> 
>>
>>   #define MICROSOFT_IEEE_OUI     0xca125c
>>
>> @@ -170,6 +172,12 @@ static const struct edid_quirk {
>>          EDID_QUIRK('S', 'A', 'M', 596, EDID_QUIRK_PREFER_LARGE_60),
>>          EDID_QUIRK('S', 'A', 'M', 638, EDID_QUIRK_PREFER_LARGE_60),
>>
>> +       /* Samsung C49G95T */
>> +       EDID_QUIRK('S', 'A', 'M', 0x7053, EDID_QUIRK_FIXUP_5120_1440_240),
>> +
>> +       /* Samsung S49AG95 */
>> +       EDID_QUIRK('S', 'A', 'M', 0x71ac, EDID_QUIRK_FIXUP_5120_1440_240),
>> +
>>          /* Sony PVM-2541A does up to 12 bpc, but only reports max 8 bpc */
>>          EDID_QUIRK('S', 'N', 'Y', 0x2541, EDID_QUIRK_FORCE_12BPC),
>>
>> @@ -6586,7 +6594,37 @@ static void update_display_info(struct drm_connector *connector,
>>          drm_edid_to_eld(connector, drm_edid);
>>   }
>>
>> -static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
>> +static void drm_mode_displayid_detailed_edid_quirks(struct drm_connector *connector,
>> +                                                   struct drm_display_mode *mode)
>> +{
>> +       unsigned int hsync_width;
>> +       unsigned int vsync_width;
>> +
>> +       if (connector->display_info.quirks & EDID_QUIRK_FIXUP_5120_1440_240) {
>> +               if (mode->hdisplay == 5120 && mode->vdisplay == 1440 &&
>> +                   mode->clock == 1939490) {
>> +                       hsync_width = mode->hsync_end - mode->hsync_start;
>> +                       vsync_width = mode->vsync_end - mode->vsync_start;
>> +
>> +                       mode->clock = 2018490;
>> +                       mode->hdisplay = 5120;
>> +                       mode->hsync_start = 5120 + 8;
>> +                       mode->hsync_end = 5120 + 8 + hsync_width;
>> +                       mode->htotal = 5200;
>> +
>> +                       mode->vdisplay = 1440;
>> +                       mode->vsync_start = 1440 + 165;
>> +                       mode->vsync_end = 1440 + 165 + vsync_width;
>> +                       mode->vtotal = 1619;
>> +
>> +                       drm_dbg_kms(connector->dev,
>> +                                   "[CONNECTOR:%d:%s] Samsung 240Hz mode quirk applied\n",
>> +                                   connector->base.id, connector->name);
>> +               }
>> +       }
>> +}
>> +
>> +static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_connector *connector,
>>                                                              struct displayid_detailed_timings_1 *timings,
>>                                                              bool type_7)
>>   {
>> @@ -6605,7 +6643,7 @@ static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *d
>>          bool hsync_positive = (timings->hsync[1] >> 7) & 0x1;
>>          bool vsync_positive = (timings->vsync[1] >> 7) & 0x1;
>>
>> -       mode = drm_mode_create(dev);
>> +       mode = drm_mode_create(connector->dev);
>>          if (!mode)
>>                  return NULL;
>>
>> @@ -6628,6 +6666,9 @@ static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *d
>>
>>          if (timings->flags & 0x80)
>>                  mode->type |= DRM_MODE_TYPE_PREFERRED;
>> +
>> +       drm_mode_displayid_detailed_edid_quirks(connector, mode);
>> +
>>          drm_mode_set_name(mode);
>>
>>          return mode;
>> @@ -6650,7 +6691,7 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
>>          for (i = 0; i < num_timings; i++) {
>>                  struct displayid_detailed_timings_1 *timings = &det->timings[i];
>>
>> -               newmode = drm_mode_displayid_detailed(connector->dev, timings, type_7);
>> +               newmode = drm_mode_displayid_detailed(connector, timings, type_7);
>>                  if (!newmode)
>>                          continue;
>>
>> --
>> 2.42.0
>>
-- 
Hamza

