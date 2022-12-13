Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D85264B9CD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 17:32:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4FB10E32B;
	Tue, 13 Dec 2022 16:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2087.outbound.protection.outlook.com [40.107.100.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC4C10E319;
 Tue, 13 Dec 2022 16:32:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmikq+mH3dFDwO4Hf+N0XIZc+4eQ1VmIgUgVKG2UkWUbSY3de2rocFZPdGovfk0KZz5u6ZYYbd288Yud6ZmvzTi5ghlU33p6Fqj4D/sTmNSPaBMAWTJL8S2PtiNXcBwcSDqsqKcyDzl6XJptfO1Qa/+bLLPJEK9sJYGStlF+zBwTWsTcZ/cvf8JvwXwIQqwoo5YC1ghoRoSFzwmV7viT1kFroJuvSKoPt04AEfTH2dBEVHkI3ztEyuG15kh5zw8qUKwC86Wn0wRNaOCX0gMLCbFrKmKBtZyB9rQA0Hp439RkG7SAUDZDmmNJs83LPdQ6OQinu3EaZ/RE6dEzw2URSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VAr5PeuEyKeuq4Obn4Sf8SbIrIjZ0MCIQkGIMbZLXc=;
 b=LFp5s/3jvRAR2uiqgjHvj+hk2iiCurxf9ADzQwF2N36K3SInYgzk7FxzonxN9+2Phffh8Pc3e1dvnSv7fiGXy0JfW6NV1NacCvbyz5n9xFbTggMtNoK0JRKRo/2vF92cec6HMGGXjkJKIgshzotlMaeN+EyXkT91bjikSEUI0dJe2iGr4oQqMJ61LmnHU8mpdicX71B/CEjQinQ7dk5QtgYTUBVtRswjXStDOgM8VepyyrdVrcHoLfaVxW2J9oiYb2ysS+A1rRSzqMZbcQKLLuJ0j4ioJqlxahNaESb/4U0OVEtbbXD5Hd+/Dh3siSyZwsT8BNi4MF954ixdbqNjpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VAr5PeuEyKeuq4Obn4Sf8SbIrIjZ0MCIQkGIMbZLXc=;
 b=RNiSaKMGyLmTD8uuGZ+Dgnqz1BWt7HjzwlFPhWgiLWbVcMs51UTpiT2FHplmFZTa8c/e52sFVr8M9Ss+JlzC3L/0QyNAkI/Ya5pVv+PWy2tPLfYIqnzPZ9CE6dNtsZc8+hQuPRfoqIi0P3Qx2jCcPumMm1w55ImuP6YAcw/wu0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 16:32:06 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::2d6a:70d0:eb90:9dca]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::2d6a:70d0:eb90:9dca%9]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 16:32:06 +0000
Message-ID: <25da5107-9bdf-abc9-adf8-98778d87dafc@amd.com>
Date: Tue, 13 Dec 2022 11:32:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 06/16] drm/connector: Allow drivers to pass list of
 supported colorspaces
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
 <20221212182137.374625-7-harry.wentland@amd.com>
 <20221213122342.548631bf@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20221213122342.548631bf@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0076.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::15) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM4PR12MB5040:EE_
X-MS-Office365-Filtering-Correlation-Id: 0316424e-76df-48c3-7e8a-08dadd2791bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bhlcJBb5nU2hZb+NDA49W+4BdXANpYrMALY3RhqA5ljR3aFkhlom90KJXPYTbK3CwnXIycIrrm1K8yUQwRyR3yjpBjbfyfRbe50A0scYsAeIxdGM239DCQbfceEs79u8UDJmV0vh0uoOB31Y5GI8xRyDq117VnZnFpIjMW202kool5hyhTG4upn4xf+bV1z2gc0MbQLRPmD+BmvaHdyNg8GpUjqUhmiiqdlGfs4IHCRamgSgYeAG/yQ68Qpun1mFe+WKUY6gzGIQTOqGTZdmHg728pOy3+GWTfGoA+Q7H3ibPOLQTRRbcvMQMRjypWzggs+y0K6JNolmeOXTG2V23csBDZObiOVd1ruCce4g087pPcBcZEe0xkbgnGPytNq6U/W2phVjJ6UyFk4Qh0vpduuANMx4/g2o63gc0L5OuQ42vKuxIyuWcWUIYAQfx5g3A/Gd8oO9o2pIc5rAnlXGWghGgX31xR6n+g7INFJ60wETw9EfeNC+xgxwm+QA6g7efwXu7hGphMyqj5s0pLh/Ak1fa2t1gg6hs+P6FYRYmNWdq7dIXCnwPLKbmxNVcOndix5NPS4mjZUKaXESFhnZnEcv6ewe3i+qEiJpStfPvXe1TDA9sjQNZx05/6zVAxopQb6mSiyBOa7Cm/A/vAffawENDZ4kvYepnWeezk2aZmpk0Ehim20X/4ED6U2DjmSL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199015)(31686004)(36756003)(31696002)(86362001)(44832011)(478600001)(186003)(66574015)(53546011)(6512007)(966005)(6506007)(6486002)(26005)(38100700002)(6666004)(83380400001)(2616005)(54906003)(2906002)(41300700001)(66946007)(316002)(66556008)(4326008)(5660300002)(30864003)(6916009)(8936002)(8676002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWtseGR0bUtudmRPN1lhQXJGS2VTcTlKNGZQa2lWMnJMTmRVeHdJL3JUUHBV?=
 =?utf-8?B?UENVbzlUTE1GYXdOWWhMYTh6T2xhOW1TRWpSQi8xYVNZQkU3aHhXdWltSnJl?=
 =?utf-8?B?Q2YxL0lkWjJhNlF0aFJPbko3andpdUoxUFhydTNqb21hL3IyV0MxcGdJcXNI?=
 =?utf-8?B?VGFoNGgyQmJ3UldOeE41d2J2V0lVTXVzS1Z4TVRrMmhWY1oxUDVNSjFyTS90?=
 =?utf-8?B?L000S1htRk50Y1RhTEdSdGZCdGtiV2E5YXhlWGFCVzRGSmxoZnlWWnc1R2Zl?=
 =?utf-8?B?eTlYVmpjWlYzWEk2WEpSSlFWNFJpakNmU1NoV0V0T01hSjROenowRHJUbWZk?=
 =?utf-8?B?TE1obWd3eTZaY3hFaWhvUjFzMFp2Y2FnZlpIb3p6WEgvZksxVGZ2NjZjYzhj?=
 =?utf-8?B?UmFiR1gzVVZwRXBlR0JIaXFnUDV2Y1IvQTRoajNlUXlaS2FjUkZjbFZTUC9s?=
 =?utf-8?B?RVVRZmVqcWhxRFE5QnQrK1E2eS9aKzJrcENmN21Tay9xVjB5UE1Jb1BmODE0?=
 =?utf-8?B?TDhXVGU0QlVhQjhDcjJreUoreGh6ZFNTRGN3LzhJODd4YlduZXpCaHJzSGdn?=
 =?utf-8?B?RlFnLy8rZ1dOQ21aMXlDM3hVSlhjV0FwNHoxSCtUMGJjVTAyOXUrL0FpaklJ?=
 =?utf-8?B?Zzg3TkVOcVNERUppRE9obHhnVHdMRG9LeEhMODFXS0FiTW94eUN4L1JIQVUz?=
 =?utf-8?B?Z3JRbTZ0TDVMS1ptdFlKWnlHdHcxdTFaWGcwZlZJUEQ5VWxLamNmWmwyNXNY?=
 =?utf-8?B?cjhPUEViVUxQT28zUU1yb09ZRlpwR3V4OGJmQzlsbklmUURjUm5sM3k3ZExY?=
 =?utf-8?B?dGpBZlh4aUsvZmgvNkFnUjhLN0RDK2dIeHY1bitMUnlvd2R0Wk1CTkI4c1RV?=
 =?utf-8?B?TlZoK0dMZWpZSlA2dWFsejdyWjc0Z2tOVTNTTTdpN2FxQlIzcWVlMzE1STdv?=
 =?utf-8?B?eWd0V2hUNXpndUNWR1EyTW11bTI0QVRUUGFPNHY1bXZ4ZVd3MHplZ2V6WHFs?=
 =?utf-8?B?QzhOU21NWXZ4RjhwM0FNR1dIRXNMSTY1WmhUdnV0cTdhMnNwUXRieHhqVDg4?=
 =?utf-8?B?c2F0RlYrOUxnUXd2NG16R2xsSUFlNmFPY2Q3YmtGNE00Q1VzNFdDVGMzVHlW?=
 =?utf-8?B?Zk1KREplazBwRzlYWlpSbkxNS0s0RW1sTkQvUXE1a0l3MnZiUExlVHVRV0RF?=
 =?utf-8?B?QVdyMCtzR3JocVBIY01nbytjR1lqdzhmQkRmTjhNQ2hQMlhrSkk4RGdXYm1U?=
 =?utf-8?B?eVg4ZWhJa2hHYjQwVE5MRm9kckh6MEswS01RNncvaHBnOTJHSVFmZE1FWEww?=
 =?utf-8?B?NUhZQTZMemhjcEU4bEJVSFliMldyeCtiSVpQekthWitOYW1KWTg1S0YvT3p5?=
 =?utf-8?B?N1h1SVgxMHA4MkJBeXZQVHJlMjJ3MDc5RmVUZXEzcnBRRUFPckFtcFQvOGlV?=
 =?utf-8?B?bU1LSkk0elNwZkJpT3dJRnJBMHI1NmQ3QnRjcXQrK000UEZRNzBpYSt2aUx1?=
 =?utf-8?B?Sk1nRTBJTTYzdzAzYVZhS1oweThDMkJ2czFsTkw2QmNockNsbUczekNrSzZz?=
 =?utf-8?B?bFl5U3kxbDZnU25ndUoyK0p1V3B1ek44cUUrR2s0cm9QS2Fpc2UzNW1HTGtu?=
 =?utf-8?B?aWgra2p6aHRISnNEUXlVUE9rTkpVODNNdjJpdWFZUGhSVGVwYUxRWnk1clY3?=
 =?utf-8?B?YUhmelBlR3oxTFBaUEVCWjIzdEZPSHlHWG9pc2d5R0ZDTmJtTzkrZGVHM1RB?=
 =?utf-8?B?QUdzSVJIUVoyUzFNMTZ2aTBRTllKdThqd0hGaG1kaSt5L2c4cTh4ME5lck80?=
 =?utf-8?B?S2V3R2x2cFFBU1ROUkpXNnJUNGx5U2l6TlZtTzR6Wm9DNUw3S0NEU01KSzBW?=
 =?utf-8?B?OUFZSHE4WkFsU2lEV1gvLzNhTFBxcUFpa3U2MUYzU2JGNDllNW56TVFXVTRZ?=
 =?utf-8?B?VGsvdEJiSnlQWlExaFRyRjBLeDh3N1gzR1BQclhSY29NUHZGWFRPMjFSNVBz?=
 =?utf-8?B?L1Q5RE8wUDRuNjZ2Tml6MSt3Sm5VT0Mra2pTSFJYYTR1Nk1MQW9aUStNWWg5?=
 =?utf-8?B?dlp0eHRLbmtTWVVvT0FIVFBKaEFMUWRjQVJ5TUNTRFV6NHVuNHFCbVZrZ2E5?=
 =?utf-8?Q?Ogx96jK5M+2BT6a7330vFlyD4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0316424e-76df-48c3-7e8a-08dadd2791bc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 16:32:05.9556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7moNiR+ReVXO+yFs4B3ATs3Z1e3uwvVAoxba3M/Q4wzOr/s/yxWDtOpb8AF+sLgNK7JVQxhqLzDXufL1FIaDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5040
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/13/22 05:23, Pekka Paalanen wrote:
> On Mon, 12 Dec 2022 13:21:27 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> Drivers might not support all colorspaces defined in
>> dp_colorspaces and hdmi_colorspaces. This results in
>> undefined behavior when userspace is setting an
>> unsupported colorspace.
>>
>> Allow drivers to pass the list of supported colorspaces
>> when creating the colorspace property.
> 
> Hi Harry,
> 
> what is there for drivers to support? Isn't this just infoframe data
> that shall be sent down to the sink as-is with no other effect?
> 

You have a good point.

Right now the supported colorspaces de-facto depend on driver implementations
as you can see in [1] for i915 and [2] for amdgpu. The amdgpu driver will
also program the MSA [3] for DP connections, and a bunch of other things which
are deeper in the driver.

[1] https://gitlab.freedesktop.org/hwentland/linux/-/blob/hdr-colorimetry/drivers/gpu/drm/i915/display/intel_dp.c#L1741
[2] https://gitlab.freedesktop.org/hwentland/linux/-/blob/hdr-colorimetry/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c#L5155
[3] https://gitlab.freedesktop.org/hwentland/linux/-/blob/hdr-colorimetry/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c#L368

I don't know why the DP VSC stuff needs to be in drivers. It should be
common. The MSA packing would likely have to be driver specific since the
mechanism of packing it is HW specific.

I'll have a closer look and see if we can eliminate the "driver supported"
bit. If we can't we'll probably need to describe the reasoning better.

Will it be a problem if the list of supported colorspaces differs between
drivers?

Harry

> Is the driver confusing colorimetry with color-representation (the
> RGB-YCbCr conversion)? Or is this property defining both?
> 
> I feel that the documentation of "Colorspace" KMS connector property
> needs clarification, and a list of potentially available values with
> explanations, more than just a reference to CTA-816-H which it does not
> even do yet.
> 
> Perhaps a table, where for each enum drm_colorspace entry has a row explaining:
> 
> 
> Thanks,
> pq
> 
> 
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Cc: Pekka Paalanen <ppaalanen@gmail.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Vitaly.Prosyak@amd.com
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: amd-gfx@lists.freedesktop.org
>> ---
>>  drivers/gpu/drm/drm_connector.c               | 140 +++++++++---------
>>  .../gpu/drm/i915/display/intel_connector.c    |   4 +-
>>  drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
>>  include/drm/drm_connector.h                   |   8 +-
>>  4 files changed, 83 insertions(+), 71 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index ddba0b9fcc17..0df5db3e4fec 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -1012,64 +1012,57 @@ static const struct drm_prop_enum_list drm_dp_subconnector_enum_list[] = {
>>  DRM_ENUM_NAME_FN(drm_get_dp_subconnector_name,
>>  		 drm_dp_subconnector_enum_list)
>>  
>> -static const struct drm_prop_enum_list hdmi_colorspaces[] = {
>> -	/* For Default case, driver will set the colorspace */
>> -	{ DRM_MODE_COLORIMETRY_DEFAULT, "Default" },
>> -	/* Standard Definition Colorimetry based on CEA 861 */
>> -	{ DRM_MODE_COLORIMETRY_SMPTE_170M_YCC, "SMPTE_170M_YCC" },
>> -	{ DRM_MODE_COLORIMETRY_BT709_YCC, "BT709_YCC" },
>> -	/* Standard Definition Colorimetry based on IEC 61966-2-4 */
>> -	{ DRM_MODE_COLORIMETRY_XVYCC_601, "XVYCC_601" },
>> -	/* High Definition Colorimetry based on IEC 61966-2-4 */
>> -	{ DRM_MODE_COLORIMETRY_XVYCC_709, "XVYCC_709" },
>> -	/* Colorimetry based on IEC 61966-2-1/Amendment 1 */
>> -	{ DRM_MODE_COLORIMETRY_SYCC_601, "SYCC_601" },
>> -	/* Colorimetry based on IEC 61966-2-5 [33] */
>> -	{ DRM_MODE_COLORIMETRY_OPYCC_601, "opYCC_601" },
>> -	/* Colorimetry based on IEC 61966-2-5 */
>> -	{ DRM_MODE_COLORIMETRY_OPRGB, "opRGB" },
>> -	/* Colorimetry based on ITU-R BT.2020 */
>> -	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
>> -	/* Colorimetry based on ITU-R BT.2020 */
>> -	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
>> -	/* Colorimetry based on ITU-R BT.2020 */
>> -	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
>> -	/* Added as part of Additional Colorimetry Extension in 861.G */
>> -	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
>> -	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER, "DCI-P3_RGB_Theater" },
>> +static const char * const colorspace_names[] = {
>> +	[DRM_MODE_COLORIMETRY_DEFAULT] = "Default",
>> +	[DRM_MODE_COLORIMETRY_SMPTE_170M_YCC] = "SMPTE_170M_YCC",
>> +	[DRM_MODE_COLORIMETRY_BT709_YCC] = "BT709_YCC",
>> +	[DRM_MODE_COLORIMETRY_XVYCC_601] = "XVYCC_601",
>> +	[DRM_MODE_COLORIMETRY_XVYCC_709] = "XVYCC_709",
>> +	[DRM_MODE_COLORIMETRY_SYCC_601] = "SYCC_601",
>> +	[DRM_MODE_COLORIMETRY_OPYCC_601] = "opYCC_601",
>> +	[DRM_MODE_COLORIMETRY_OPRGB] = "opRGB",
>> +	[DRM_MODE_COLORIMETRY_BT2020_CYCC] = "BT2020_CYCC",
>> +	[DRM_MODE_COLORIMETRY_BT2020_RGB] = "BT2020_RGB",
>> +	[DRM_MODE_COLORIMETRY_BT2020_YCC] = "BT2020_YCC",
>> +	[DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65] = "P3_RGB_D65",
>> +	[DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER] = "P3_RGB_Theater",
>> +	[DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED] = "RGB_WIDE_FIXED",
>> +	[DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT] = "RGB_WIDE_FLOAT",
>> +	[DRM_MODE_COLORIMETRY_BT601_YCC] = "BT601_YCC",
>>  };
>>  
>> +static const u32 hdmi_colorspaces =
>> +	BIT(DRM_MODE_COLORIMETRY_SMPTE_170M_YCC) |
>> +	BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
>> +	BIT(DRM_MODE_COLORIMETRY_XVYCC_601) |
>> +	BIT(DRM_MODE_COLORIMETRY_XVYCC_709) |
>> +	BIT(DRM_MODE_COLORIMETRY_SYCC_601) |
>> +	BIT(DRM_MODE_COLORIMETRY_OPYCC_601) |
>> +	BIT(DRM_MODE_COLORIMETRY_OPRGB) |
>> +	BIT(DRM_MODE_COLORIMETRY_BT2020_CYCC) |
>> +	BIT(DRM_MODE_COLORIMETRY_BT2020_RGB) |
>> +	BIT(DRM_MODE_COLORIMETRY_BT2020_YCC) |
>> +	BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65) |
>> +	BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER);
>> +
>>  /*
>>   * As per DP 1.4a spec, 2.2.5.7.5 VSC SDP Payload for Pixel Encoding/Colorimetry
>>   * Format Table 2-120
>>   */
>> -static const struct drm_prop_enum_list dp_colorspaces[] = {
>> -	/* For Default case, driver will set the colorspace */
>> -	{ DRM_MODE_COLORIMETRY_DEFAULT, "Default" },
>> -	{ DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED, "RGB_Wide_Gamut_Fixed_Point" },
>> -	/* Colorimetry based on scRGB (IEC 61966-2-2) */
>> -	{ DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT, "RGB_Wide_Gamut_Floating_Point" },
>> -	/* Colorimetry based on IEC 61966-2-5 */
>> -	{ DRM_MODE_COLORIMETRY_OPRGB, "opRGB" },
>> -	/* Colorimetry based on SMPTE RP 431-2 */
>> -	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
>> -	/* Colorimetry based on ITU-R BT.2020 */
>> -	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
>> -	{ DRM_MODE_COLORIMETRY_BT601_YCC, "BT601_YCC" },
>> -	{ DRM_MODE_COLORIMETRY_BT709_YCC, "BT709_YCC" },
>> -	/* Standard Definition Colorimetry based on IEC 61966-2-4 */
>> -	{ DRM_MODE_COLORIMETRY_XVYCC_601, "XVYCC_601" },
>> -	/* High Definition Colorimetry based on IEC 61966-2-4 */
>> -	{ DRM_MODE_COLORIMETRY_XVYCC_709, "XVYCC_709" },
>> -	/* Colorimetry based on IEC 61966-2-1/Amendment 1 */
>> -	{ DRM_MODE_COLORIMETRY_SYCC_601, "SYCC_601" },
>> -	/* Colorimetry based on IEC 61966-2-5 [33] */
>> -	{ DRM_MODE_COLORIMETRY_OPYCC_601, "opYCC_601" },
>> -	/* Colorimetry based on ITU-R BT.2020 */
>> -	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
>> -	/* Colorimetry based on ITU-R BT.2020 */
>> -	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
>> -};
>> +static const u32 dp_colorspaces =
>> +	BIT(DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED) |
>> +	BIT(DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT) |
>> +	BIT(DRM_MODE_COLORIMETRY_OPRGB) |
>> +	BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65) |
>> +	BIT(DRM_MODE_COLORIMETRY_BT2020_RGB) |
>> +	BIT(DRM_MODE_COLORIMETRY_BT601_YCC) |
>> +	BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
>> +	BIT(DRM_MODE_COLORIMETRY_XVYCC_601) |
>> +	BIT(DRM_MODE_COLORIMETRY_XVYCC_709) |
>> +	BIT(DRM_MODE_COLORIMETRY_SYCC_601) |
>> +	BIT(DRM_MODE_COLORIMETRY_OPYCC_601) |
>> +	BIT(DRM_MODE_COLORIMETRY_BT2020_CYCC) |
>> +	BIT(DRM_MODE_COLORIMETRY_BT2020_YCC);
>>  
>>  /**
>>   * DOC: standard connector properties
>> @@ -1972,21 +1965,34 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
>>   */
>>  
>>  static int drm_mode_create_colorspace_property(struct drm_connector *connector,
>> -					const struct drm_prop_enum_list *colorspaces,
>> -					int size)
>> +					u32 supported_colorspaces)
>>  {
>>  	struct drm_device *dev = connector->dev;
>> +	u32 colorspaces = supported_colorspaces | BIT(DRM_MODE_COLORIMETRY_DEFAULT);
>> +	struct drm_prop_enum_list enum_list[DRM_MODE_COLORIMETRY_MAX];
>> +	int i, len;
>>  
>>  	if (connector->colorspace_property)
>>  		return 0;
>>  
>> -	if (!colorspaces)
>> -		return 0;
>> +	if (WARN_ON(supported_colorspaces == 0 ||
>> +		    (supported_colorspaces & -BIT(DRM_MODE_COLORIMETRY_MAX)) != 0))
>> +		return -EINVAL;
>> +
>> +	len = 0;
>> +	for (i = 0; i < DRM_MODE_COLORIMETRY_MAX; i++) {
>> +		if ((colorspaces & BIT(i)) == 0)
>> +			continue;
>> +
>> +		enum_list[len].type = i;
>> +		enum_list[len].name = colorspace_names[i];
>> +		len++;
>> +	}
>>  
>>  	connector->colorspace_property =
>>  		drm_property_create_enum(dev, DRM_MODE_PROP_ENUM, "Colorspace",
>> -					colorspaces,
>> -					size);
>> +					enum_list,
>> +					len);
>>  
>>  	if (!connector->colorspace_property)
>>  		return -ENOMEM;
>> @@ -2003,11 +2009,12 @@ static int drm_mode_create_colorspace_property(struct drm_connector *connector,
>>   * Returns:
>>   * Zero on success, negative errno on failure.
>>   */
>> -int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector)
>> +int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector,
>> +					     u32 supported_colorspaces)
>>  {
>> -	return drm_mode_create_colorspace_property(connector,
>> -						   hdmi_colorspaces,
>> -						   ARRAY_SIZE(hdmi_colorspaces));
>> +	u32 colorspaces = supported_colorspaces & hdmi_colorspaces;
>> +
>> +	return drm_mode_create_colorspace_property(connector, colorspaces);
>>  }
>>  EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
>>  
>> @@ -2021,11 +2028,12 @@ EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
>>   * Returns:
>>   * Zero on success, negative errno on failure.
>>   */
>> -int drm_mode_create_dp_colorspace_property(struct drm_connector *connector)
>> +int drm_mode_create_dp_colorspace_property(struct drm_connector *connector,
>> +					   u32 supported_colorspaces)
>>  {
>> -	return drm_mode_create_colorspace_property(connector,
>> -						   dp_colorspaces,
>> -						   ARRAY_SIZE(dp_colorspaces));
>> +	u32 colorspaces = supported_colorspaces & dp_colorspaces;
>> +
>> +	return drm_mode_create_colorspace_property(connector, colorspaces);
>>  }
>>  EXPORT_SYMBOL(drm_mode_create_dp_colorspace_property);
>>  
>> diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
>> index 1dcc268927a2..6e7cef58a626 100644
>> --- a/drivers/gpu/drm/i915/display/intel_connector.c
>> +++ b/drivers/gpu/drm/i915/display/intel_connector.c
>> @@ -283,13 +283,13 @@ intel_attach_aspect_ratio_property(struct drm_connector *connector)
>>  void
>>  intel_attach_hdmi_colorspace_property(struct drm_connector *connector)
>>  {
>> -	if (!drm_mode_create_hdmi_colorspace_property(connector))
>> +	if (!drm_mode_create_hdmi_colorspace_property(connector, 0xffffffff))
>>  		drm_connector_attach_colorspace_property(connector);
>>  }
>>  
>>  void
>>  intel_attach_dp_colorspace_property(struct drm_connector *connector)
>>  {
>> -	if (!drm_mode_create_dp_colorspace_property(connector))
>> +	if (!drm_mode_create_dp_colorspace_property(connector, 0xffffffff))
>>  		drm_connector_attach_colorspace_property(connector);
>>  }
>> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
>> index 6ab83296b0e4..8d08d6a36f37 100644
>> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
>> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
>> @@ -416,7 +416,7 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
>>  	if (ret)
>>  		return ret;
>>  
>> -	ret = drm_mode_create_hdmi_colorspace_property(connector);
>> +	ret = drm_mode_create_hdmi_colorspace_property(connector, 0xffffffff);
>>  	if (ret)
>>  		return ret;
>>  
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index edef65388c29..5825c6ab969b 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -30,6 +30,7 @@
>>  #include <linux/notifier.h>
>>  #include <drm/drm_mode_object.h>
>>  #include <drm/drm_util.h>
>> +#include <drm/drm_property.h>
>>  
>>  #include <uapi/drm/drm_mode.h>
>>  
>> @@ -393,6 +394,7 @@ enum drm_colorspace {
>>  	DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED,
>>  	DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT,
>>  	DRM_MODE_COLORIMETRY_BT601_YCC,
>> +	DRM_MODE_COLORIMETRY_MAX
>>  };
>>  
>>  /**
>> @@ -1818,8 +1820,10 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
>>  bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state *old_state,
>>  					     struct drm_connector_state *new_state);
>>  int drm_mode_create_aspect_ratio_property(struct drm_device *dev);
>> -int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector);
>> -int drm_mode_create_dp_colorspace_property(struct drm_connector *connector);
>> +int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector,
>> +					     u32 supported_colorspaces);
>> +int drm_mode_create_dp_colorspace_property(struct drm_connector *connector,
>> +					   u32 supported_colorspaces);
>>  int drm_mode_create_content_type_property(struct drm_device *dev);
>>  int drm_mode_create_suggested_offset_properties(struct drm_device *dev);
>>  
> 

