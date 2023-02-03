Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B671D689C09
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 15:39:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9F510E7B7;
	Fri,  3 Feb 2023 14:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10D810E7B5;
 Fri,  3 Feb 2023 14:39:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVvk/Pk/LXRcFjAKhLsGRjTOvlh00WlMkXr1y9rnva+5Et4o5o1VMcLAXCQP+SfTi6sNdg4DW0+Ti8C94OmLwMTLQlQcJCN4puJ7D8trIYjZZL66eyyWIaPdeiLt8iAFBTUGs2mkV+4IeMM2ltNEbVtCwbrqNLSwyPaBXTHvG18BKSSjJ8d7NgbNbyvOMBl23nBK+CbLEQJtWvPCT7utqx0bG9JIXTFlX9wnmxKEpTP4977fQnwyWs2g08YvjEIKOPNAKEprT+BScijBJneMnq6RC7kcdDnOig+0RQ6ewcEmAUU0boxJF73ghfxac5xS196af6viO8QA0yx9rrQnZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IbKD+LzqiNyqSi4CBiVaOlDLe8C6lPnXS/EuAo5jARs=;
 b=XLFWPBbEBkdoE7c+RPBbAGnU0Di/kOl9IFzHhcpi8rYSGipeDktAahKP8DsKwzDC3GCt2Ud/7hxByxOwCH71s8XoqIlaA0HABiwMosvsFUEDjFvkIUBd6N5sLJLzcyrb+MkhSdpHTuxuXaVHNmZ3DL0wHfBYR6bzvmAR1UjDniq+MQ7BuJ9cGyyQINN6z3TqrAIud2UmcK0Pbi5u3jnTv2pSHJUAxEUmau/uECK5wJN2NGagF8A0R2yZRYM185w9/lUYDAimiE61alU3LXNKEC3oEGdHKQx8Dr5rMBNiTxuNz+rHTT7xFiiYNDhNo/iO+OgL8C67uOL6Hz1CxUhnWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbKD+LzqiNyqSi4CBiVaOlDLe8C6lPnXS/EuAo5jARs=;
 b=1tiTzmggULSgZXMAkwjiv6dZ/MTkD4Jd03Qr2LZcSCZN4KMm5kawzkY7dxENbwC+MR5wOSild2V+X4la4X8SMbDaduIr+LVUTfeoe822Ei5FHAwo46Ch5IcXr/1EvK/4Wpgzuxy84Z1H35ayzG3Po9LXu5ez8DgwPYoJbnKiBB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) by
 PH7PR12MB7891.namprd12.prod.outlook.com (2603:10b6:510:27a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Fri, 3 Feb
 2023 14:39:45 +0000
Received: from DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::b63d:60d7:923a:4ee9]) by DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::b63d:60d7:923a:4ee9%5]) with mapi id 15.20.6064.031; Fri, 3 Feb 2023
 14:39:44 +0000
Message-ID: <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com>
Date: Fri, 3 Feb 2023 09:39:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
To: Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es> <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0230.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::10) To DM8PR12MB5431.namprd12.prod.outlook.com
 (2603:10b6:8:34::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5431:EE_|PH7PR12MB7891:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d7c889d-ac3d-4689-ab97-08db05f47df2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qfY4Sil9Du9UWjxdSbpN6nBuk2w3Vq5SgZH4lFTZtpzOMaZpKLUCdexN4pVJrgUkIVKTdgMl1OomXnFT1YeBgPvZS8EKdd6zrq/YfNYMCDKl7fBD5Uih2NiVRkQYAqzXLdvYXWcIrJPCfWH7p6JfsX/xYb/c/KowW2g7XKP1ysbFAbuPSWs+ebk6GP7bzbqVlVIMiB7/CvbocASxeyabR1nWVoQBnhKiUUT9p97h1SXWbaVTh6/bBhfDZYW8WoLhaRwUy2YQHugmLQ5kvegQVTaIpRC0WBXnKCewQ4mpF5tI+s+WYn0CWpVUi6r8IqKm9PPjSCte/Pu6UaH0hc8FaPSKyOVoJEoinTC+fmDf1nBaJeQuFVYzgTKPGPnYFcxjR9vOvGZDl+6j9IyM9GRDHst7wISizyFK1NJQ4zgf4ovVdEtCMpE0AToDnMAd+J8qdfp8YzIw5xbrAj9YeRjRfGs8uW6bbofWdunLEuahiCh9fvVhCaonAngBkZR9DZHjosdKQS/xWn2u+I35p1KoDkoA3h+G44/1zRxV9J1C+f9DScz8Hqr8ApKV3THuaLSZApsghv4fqg4jL8zmoAYuDUuQoqGahLug5sos5fkdtmgvQes2r01xiLcS54/UJTaypdHDYfy+afLv/FKZKiF5dafCeQIuBAp2+ejb9DXrt7P/+4V/vi5fROqkROJr8ViCJsjgI+7FzNBdYY5tdZFnXvHSM7aHcs/yZmPrItX3WqY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5431.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(451199018)(8676002)(66476007)(41300700001)(316002)(36756003)(66946007)(53546011)(66556008)(6486002)(186003)(478600001)(6506007)(26005)(4326008)(6512007)(54906003)(110136005)(31686004)(38100700002)(44832011)(2906002)(86362001)(8936002)(66899018)(31696002)(83380400001)(5660300002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFF2SjhpWWROMlZXQ2l1KzNVRk1lVHRjc0JCNTZ0NTZOVlBqT2NaeUhYSWtU?=
 =?utf-8?B?VlhzbWZmTGR6elAyOHhGSFkxOWxYSEVwaGZIMXd1SGxzbWwraDVQbXl3ZTA0?=
 =?utf-8?B?d29FTmpLcXBFQWp1bDRlTWdDRHJJUmU0QkpkNmRIOTcwcmtUVkQvV3F5S1o0?=
 =?utf-8?B?YnhTa1ZHNlVScU9pZm9QT2E0RVNudGFDOUU5amZLbWY2VlhGbllKbWltNEMx?=
 =?utf-8?B?bnFPVFBkRjJiMlNPZkp5M3B1ejF1VmdMS2FUN1lpQ2ZFVU0yVldzUnpYb2dQ?=
 =?utf-8?B?NVZGb1ZUckxWVVlMUGszem5VeEZNUW1hWHJZeE05QUpRU2lOU1lLS1pjTm0v?=
 =?utf-8?B?ajJRZ1NpY2NKSDJnamJhdVJyTkh1U2wrUmhVaUZuNm13ZnF4Qm9mZVFoU0NF?=
 =?utf-8?B?aFpHMDlxdWZoOFI3b1RoMGV4V0c3bEpDZmIvcEVlSDFOdDFRVmp3Q3BoOWNk?=
 =?utf-8?B?T0JwK0lkeUlWMDJ3N2FCSURtbWVtTFBXRk1KeDdSLzhVTUJJR2ZIL3ZyNHUy?=
 =?utf-8?B?OWd0S0MxbTdEWEI5eHR0cjdESVh2ZzIxME85TlF2djJDeXlVLzlHMWYrb0ZV?=
 =?utf-8?B?eDZUZkQwcXFXSm5qWTU3L3V4VVhBNSsxYU1rZ1VoQTk0QlRqY0R6MXZwUlp5?=
 =?utf-8?B?UGdpeG1GOTJRa2xBZmlCS3BDdXRFY0R3VURYT1lqNE03TGNSakFoalZTK0Vy?=
 =?utf-8?B?RXFDOEhvSk9xcVBES2ZabHhvKytKRERuWDdzZ2QxdnZxa0pJcEEydXZJRTJQ?=
 =?utf-8?B?ejVCTlp6U0ZHSVJ5V0hCd0pQVWIvd2tDNGdYRHBGTFhDTUlZY2VxcTBrZkg2?=
 =?utf-8?B?TVk0WFFPS1pwYkM5MGNyUVQyL1VoRy9HWEJ6aVJHOTFZTjNyZUtlVys2dFZ2?=
 =?utf-8?B?QStEbE5TMmRGZHpGTVVrODVsb1hmaDJneW5lZFV6QytXL2Y0WWZ1YjF1VGxH?=
 =?utf-8?B?bG90bGFnZEdxWHB6VndkV0xVb252UVVvYy9RUmVsc0o0UEs2bDJxaG4vYkh5?=
 =?utf-8?B?bFlyOVlldENSem81TXRKMmtPR3ByM3F3M05DR1FWSjhsS0tzSG1TMlBzRVZt?=
 =?utf-8?B?emVVME9oQWJlV2ZkM1ZCMnRqOW14U09CK281cFNqR3N6aEVuNWdkZmdSaTBH?=
 =?utf-8?B?aTZQWFFzTEFueVJCL0xiU0xNNUdMdC9aN1AyamZFMWJLTnY3QmFIVjhLVEY4?=
 =?utf-8?B?My9tek92aXhzWVFPeGdIOEtkNGRFR3RPZE1zeW9KWWI1Nk1LMFpTVm9lcWZv?=
 =?utf-8?B?K0ZHMzB2Nllvbk5IdTdxTjVJYVVld2FZaVp0UFFSeEVxOFZQQVNWQUVNcjZX?=
 =?utf-8?B?THFTOWFweXVEdjcxZUN3QjJyZWRldHliSmJjZVFueVR0ZTNrNDQvWnFvVytz?=
 =?utf-8?B?M3pyL3FtekN3ZE8vNmpjNEtFWDNrQ2JqTThNaTl3eGx0aEV5eEI2eTlaZ3FU?=
 =?utf-8?B?TkpXRGlsbnlrRzNvUnAxaVpQdUJQaGxRL056QWd3Q3FxQ2t1amNPZVZ5VmNO?=
 =?utf-8?B?cWJJWXROM0k0T1BSSkxNN2k2dGNZcUltWG13UlFmUFIwYXBzWlhBSTU1a1p4?=
 =?utf-8?B?UFNpV1l0L3dlbVVrdGRQODVxRU1Oc2Z5S3g2UW9ockFIbTA4NVJQRUtPZDAv?=
 =?utf-8?B?TXM5eW9QdXE1NHU3a0RoRjBLS3dLNmkraXFvUmJUR0VWYXJmSU5wNlVQWDVv?=
 =?utf-8?B?SGF3TVR4S21kVmVFYW5Zc011YitvUno3SjEyOFlxb0tGK0Z5SG5PV2NrckRk?=
 =?utf-8?B?R3FzVWJ2Z0NuSm1yVmx3QWZzZjNjU0ZVOGlTb2ZDb0ZYVWY2WFhUREx5QXZQ?=
 =?utf-8?B?MEpzRmFyNEVZdTJvc2VmcTZlOXZESDFkSlhWWU5rL2I5NnNBV1JaYkU0TUV5?=
 =?utf-8?B?cldSMC9QRGZLc20zUTJlZlJFcGVZV2VIUTgwVkxSd1Jtb3d5V1I0WEgvT3Ru?=
 =?utf-8?B?eE5xdWp3L3poSXMvODdZeDkySjlvQ3lPeXUvbzEybDdlMndaZjEzL0xUZ3ZD?=
 =?utf-8?B?cUI5dm8rc2JwVjFkcTJISm9ZV2hUaXBsaUw0cTBqc1RMeE1UMEtkTzlqWWM2?=
 =?utf-8?B?bmlySGd3bnNVMmE0WDgrajNuakR0dDNLOWR2dUt0OGJkQzRlTGN0R2hrcmVE?=
 =?utf-8?Q?oUplCS1Yq7shi5e4fCttVoR0v?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7c889d-ac3d-4689-ab97-08db05f47df2
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5431.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 14:39:44.7834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZiF9da9ZKnTCeH357hPjuyAkQVd6Ww86OOcOqWlKh1HcIVa+oRsJkkWk0dfvILfpg8R9Z59RxJd1MmAT93V10Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7891
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
Cc: dri-devel@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/3/23 07:59, Sebastian Wick wrote:
> On Fri, Feb 3, 2023 at 11:40 AM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
>>
>> On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote:
>>> Userspace has no way of controlling or knowing the pixel encoding
>>> currently, so there is no way for it to ever get the right values here.
>>
>> That applies to a lot of the other values as well (they are
>> explicitly RGB or YCC). The idea was that this property sets the
>> infoframe/MSA/SDP value exactly, and other properties should be
>> added to for use userspace to control the pixel encoding/colorspace
>> conversion(if desired, or userspace just makes sure to
>> directly feed in correct kind of data).
> 
> I'm all for getting userspace control over pixel encoding but even
> then the kernel always knows which pixel encoding is selected and
> which InfoFrame has to be sent. Is there a reason why userspace would
> want to control the variant explicitly to the wrong value?
> 

I've asked this before but haven't seen an answer: Is there an existing
upstream userspace project that makes use of this property (other than
what Joshua is working on in gamescope right now)? That would help us
understand the intent better.

I don't think giving userspace explicit control over the exact infoframe
values is the right thing to do.

Harry

>>
>>>
>>> When we do add pixel_encoding control from userspace,we can pick the
>>> right value for the colorimetry packet based on the
>>> pixel_encoding + the colorspace.
>>>
>>> Let's deprecate these values, and have one BT.2020 colorspace entry
>>> that userspace can use.
>>>
>>> Note: _CYCC was effectively 'removed' by this change, but that was not
>>> possible to be taken advantage of anyway, as there is currently no
>>> pixel_encoding control so it would not be possible to output
>>> linear YCbCr.
>>>
>>> Signed-off-by: Joshua Ashton <joshua@froggi.es>
>>>
>>> Cc: Pekka Paalanen <ppaalanen@gmail.com>
>>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>>> Cc: Vitaly.Prosyak@amd.com
>>> Cc: Uma Shankar <uma.shankar@intel.com>
>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>> Cc: Joshua Ashton <joshua@froggi.es>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: amd-gfx@lists.freedesktop.org
>>> ---
>>>  drivers/gpu/drm/display/drm_hdmi_helper.c |  9 ++++-----
>>>  drivers/gpu/drm/drm_connector.c           | 12 ++++++------
>>>  drivers/gpu/drm/i915/display/intel_dp.c   | 20 +++++++++-----------
>>>  include/drm/drm_connector.h               | 19 ++++++++++---------
>>>  4 files changed, 29 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
>>> index 0264abe55278..c85860600395 100644
>>> --- a/drivers/gpu/drm/display/drm_hdmi_helper.c
>>> +++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
>>> @@ -99,8 +99,7 @@ EXPORT_SYMBOL(drm_hdmi_infoframe_set_hdr_metadata);
>>>  #define HDMI_COLORIMETRY_OPYCC_601           (C(3) | EC(3) | ACE(0))
>>>  #define HDMI_COLORIMETRY_OPRGB                       (C(3) | EC(4) | ACE(0))
>>>  #define HDMI_COLORIMETRY_BT2020_CYCC         (C(3) | EC(5) | ACE(0))
>>> -#define HDMI_COLORIMETRY_BT2020_RGB          (C(3) | EC(6) | ACE(0))
>>> -#define HDMI_COLORIMETRY_BT2020_YCC          (C(3) | EC(6) | ACE(0))
>>> +#define HDMI_COLORIMETRY_BT2020                      (C(3) | EC(6) | ACE(0))
>>>  #define HDMI_COLORIMETRY_DCI_P3_RGB_D65              (C(3) | EC(7) | ACE(0))
>>>  #define HDMI_COLORIMETRY_DCI_P3_RGB_THEATER  (C(3) | EC(7) | ACE(1))
>>>
>>> @@ -113,9 +112,9 @@ static const u32 hdmi_colorimetry_val[] = {
>>>       [DRM_MODE_COLORIMETRY_SYCC_601] = HDMI_COLORIMETRY_SYCC_601,
>>>       [DRM_MODE_COLORIMETRY_OPYCC_601] = HDMI_COLORIMETRY_OPYCC_601,
>>>       [DRM_MODE_COLORIMETRY_OPRGB] = HDMI_COLORIMETRY_OPRGB,
>>> -     [DRM_MODE_COLORIMETRY_BT2020_CYCC] = HDMI_COLORIMETRY_BT2020_CYCC,
>>> -     [DRM_MODE_COLORIMETRY_BT2020_RGB] = HDMI_COLORIMETRY_BT2020_RGB,
>>> -     [DRM_MODE_COLORIMETRY_BT2020_YCC] = HDMI_COLORIMETRY_BT2020_YCC,
>>> +     [DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1] = HDMI_COLORIMETRY_BT2020,
>>> +     [DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2] = HDMI_COLORIMETRY_BT2020,
>>> +     [DRM_MODE_COLORIMETRY_BT2020] = HDMI_COLORIMETRY_BT2020,
>>>  };
>>>
>>>  #undef C
>>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>>> index 61c29ce74b03..58699ab15a6a 100644
>>> --- a/drivers/gpu/drm/drm_connector.c
>>> +++ b/drivers/gpu/drm/drm_connector.c
>>> @@ -1029,11 +1029,11 @@ static const struct drm_prop_enum_list hdmi_colorspaces[] = {
>>>       /* Colorimetry based on IEC 61966-2-5 */
>>>       { DRM_MODE_COLORIMETRY_OPRGB, "opRGB" },
>>>       /* Colorimetry based on ITU-R BT.2020 */
>>> -     { DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
>>> +     { DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1, "BT2020_DEPRECATED_1" },
>>>       /* Colorimetry based on ITU-R BT.2020 */
>>> -     { DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
>>> +     { DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2, "BT2020_DEPRECATED_2" },
>>>       /* Colorimetry based on ITU-R BT.2020 */
>>> -     { DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
>>> +     { DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
>>>       /* Added as part of Additional Colorimetry Extension in 861.G */
>>>       { DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
>>>       { DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER, "DCI-P3_RGB_Theater" },
>>> @@ -1054,7 +1054,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>>>       /* Colorimetry based on SMPTE RP 431-2 */
>>>       { DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
>>>       /* Colorimetry based on ITU-R BT.2020 */
>>> -     { DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
>>> +     { DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
>>>       { DRM_MODE_COLORIMETRY_BT601_YCC, "BT601_YCC" },
>>>       { DRM_MODE_COLORIMETRY_BT709_YCC, "BT709_YCC" },
>>>       /* Standard Definition Colorimetry based on IEC 61966-2-4 */
>>> @@ -1066,9 +1066,9 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>>>       /* Colorimetry based on IEC 61966-2-5 [33] */
>>>       { DRM_MODE_COLORIMETRY_OPYCC_601, "opYCC_601" },
>>>       /* Colorimetry based on ITU-R BT.2020 */
>>> -     { DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
>>> +     { DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1, "BT2020_DEPRECATED_1" },
>>>       /* Colorimetry based on ITU-R BT.2020 */
>>> -     { DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
>>> +     { DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2, "BT2020_DEPRECATED_2" },
>>>  };
>>>
>>>  /**
>>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>>> index c9be61d2348e..1aa5dedeec7b 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>>> @@ -1763,14 +1763,12 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
>>>       case DRM_MODE_COLORIMETRY_OPYCC_601:
>>>               vsc->colorimetry = DP_COLORIMETRY_OPYCC_601;
>>>               break;
>>> -     case DRM_MODE_COLORIMETRY_BT2020_CYCC:
>>> -             vsc->colorimetry = DP_COLORIMETRY_BT2020_CYCC;
>>> -             break;
>>> -     case DRM_MODE_COLORIMETRY_BT2020_RGB:
>>> -             vsc->colorimetry = DP_COLORIMETRY_BT2020_RGB;
>>> -             break;
>>> -     case DRM_MODE_COLORIMETRY_BT2020_YCC:
>>> -             vsc->colorimetry = DP_COLORIMETRY_BT2020_YCC;
>>> +     case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1:
>>> +     case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2:
>>> +     case DRM_MODE_COLORIMETRY_BT2020:
>>> +             vsc->colorimetry = vsc->pixelformat == DP_PIXELFORMAT_RGB
>>> +                     ? DP_COLORIMETRY_BT2020_RGB
>>> +                     : DP_COLORIMETRY_BT2020_YCC;
>>>               break;
>>>       case DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
>>>       case DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
>>> @@ -3043,9 +3041,9 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
>>>       switch (conn_state->colorspace) {
>>>       case DRM_MODE_COLORIMETRY_SYCC_601:
>>>       case DRM_MODE_COLORIMETRY_OPYCC_601:
>>> -     case DRM_MODE_COLORIMETRY_BT2020_YCC:
>>> -     case DRM_MODE_COLORIMETRY_BT2020_RGB:
>>> -     case DRM_MODE_COLORIMETRY_BT2020_CYCC:
>>> +     case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1:
>>> +     case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2:
>>> +     case DRM_MODE_COLORIMETRY_BT2020:
>>>               return true;
>>>       default:
>>>               break;
>>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>>> index eb4cc9076e16..42a3cf43168c 100644
>>> --- a/include/drm/drm_connector.h
>>> +++ b/include/drm/drm_connector.h
>>> @@ -390,12 +390,13 @@ enum drm_privacy_screen_status {
>>>   *   opYCC601 colorimetry format
>>>   * @DRM_MODE_COLORIMETRY_OPRGB:
>>>   *   opRGB colorimetry format
>>> - * @DRM_MODE_COLORIMETRY_BT2020_CYCC:
>>> - *   ITU-R BT.2020 Y'c C'bc C'rc (linear) colorimetry format
>>> - * @DRM_MODE_COLORIMETRY_BT2020_RGB:
>>> - *   ITU-R BT.2020 R' G' B' colorimetry format
>>> - * @DRM_MODE_COLORIMETRY_BT2020_YCC:
>>> - *   ITU-R BT.2020 Y' C'b C'r colorimetry format
>>> + * @DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1:
>>> + * @DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2:
>>> + * @DRM_MODE_COLORIMETRY_BT2020:
>>> + *   ITU-R BT.2020 [R' G' B'] or
>>> + *    ITU-R BT.2020 [Y' C'b C'r] or
>>> + *   ITU-R BT.2020 [Y'c C'bc C'rc] (linear)
>>> + *   colorimetry format
>>>   * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
>>>   *   DCI-P3 (SMPTE RP 431-2) colorimetry format
>>>   * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
>>> @@ -420,9 +421,9 @@ enum drm_colorspace {
>>>       DRM_MODE_COLORIMETRY_SYCC_601,
>>>       DRM_MODE_COLORIMETRY_OPYCC_601,
>>>       DRM_MODE_COLORIMETRY_OPRGB,
>>> -     DRM_MODE_COLORIMETRY_BT2020_CYCC,
>>> -     DRM_MODE_COLORIMETRY_BT2020_RGB,
>>> -     DRM_MODE_COLORIMETRY_BT2020_YCC,
>>> +     DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1,
>>> +     DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2,
>>> +     DRM_MODE_COLORIMETRY_BT2020,
>>>       /* Additional Colorimetry extension added as part of CTA 861.G */
>>>       DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65,
>>>       DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER,
>>> --
>>> 2.39.1
>>
>> --
>> Ville Syrjälä
>> Intel
>>
> 

