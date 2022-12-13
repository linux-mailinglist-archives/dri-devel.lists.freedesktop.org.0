Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E11864B9E4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 17:36:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBB210E1E7;
	Tue, 13 Dec 2022 16:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F1010E1E7;
 Tue, 13 Dec 2022 16:36:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnbhOf8Ov7/im+OisjPJdEGSWpIqL45eR6Mnza7morHXDc2LCWBw4SOINMkw/IbiIDH5JsGkCdiM9MRYM+27qAzJXg5sWWqwBhTqdwcb/50NWtsUWGBwqiogSbG9RCEJukx+dAKVFEQsnvyfZNZ75+QCMzpZaF/SbG91SMq6W4JQAZxt1IXjB86+IM4iSscvUijsz0pjXPhVP7rwhNQwdbd4sj4Fu2m3j6RxTuSF1Ei88p6XXF+JqXeqdFVuevX1vmV7JFHsaK0/qfBHnQmcDQ3lo2ZQUJrtiUzLCqDRnjHhYjZT6eIEcMgaRjLKRLNUBXQJRUegVD02GtS3OW4a2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLFN+rXytdMQRdKTPiI1WtLzvZJT9AEnldBCtTZBi8w=;
 b=KtNvfVTuecKoR0Cq7rqrSsK9+TOehzgYUqrdTilzocxHHTBlv8Fx35CQ8I3KkjMl90yHNPJHThGco5XsfGvTVcHe+K/HbAfhxRPhGGqHXqCqz09ariv5hbbvHpMeoVQAFIYIkhVDSJLJzwjfuxeOGhMOvQVM/58zWNZykDHgIUsT7DpmDVzg77NACcitQzMTS5nGt7U2FzoeopXEvr8IJjRopuVUbSPn2TD9DmR7HqnWUoL+ww8Z7g4M8pE/l6LZc23lW+p5Tk+4tEOWHUdKMDJwNGS+HF3MeACaW3ElTVjyIS+707Vn9+h381ahoygBnYlHqHkjqLk3aNZBA0zOXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLFN+rXytdMQRdKTPiI1WtLzvZJT9AEnldBCtTZBi8w=;
 b=v62FjuAdxrPDEHvtD2dqPtQskgg03iOnoOZP/kjrrmJAk0BDZ0qmPdRVaOOwVGLP0y8VGwdOvPxb0VonMosRAT5iSuNht5soAtZx/QMSHGZylZMUKNypLLVmyQB1bcTEIWX7w1RES+rXhB05kXO8//jO31ZLsbXcn4xQk2Ymb/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH3PR12MB8330.namprd12.prod.outlook.com (2603:10b6:610:12c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 16:36:15 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::2d6a:70d0:eb90:9dca]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::2d6a:70d0:eb90:9dca%9]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 16:36:15 +0000
Message-ID: <ef9c219f-6ad2-a1e6-57f4-f5c320df08fd@amd.com>
Date: Tue, 13 Dec 2022 11:36:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 06/16] drm/connector: Allow drivers to pass list of
 supported colorspaces
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
 <20221212182137.374625-7-harry.wentland@amd.com>
 <20221213123400.2c46df00@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20221213123400.2c46df00@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0080.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::23) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH3PR12MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ed4f44e-7f75-475f-b9b9-08dadd2826eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K5MuESvgux8kclaZXWzbLnCzXNAAjw+8H6XAvgKjuLB9A7hH+WBrS5z4kC7HOfwJ3SDxCBxIODM4OoE0cU5z4uGGLbJkVt4Wf0iyEd0RB8GOGeLhOAGV41KcQBXNdQ0/jmsTj7r+iynFWEHLOhN8zbE0gAqb0UCvU8VjqaP6ncXge//4AJ+dzzDXxAxVBua3LBBzQ7ra/Yhwvk/DCt6iB437T851mQGEterxOm+2RdLXwrf6EVx3uUxVP3SnD4Z9cCCUpBe5ey8ji669YYhdTWb0oFxxk07wH/zYkeQp8n6WKLWSylaqs8Xcd9tBOa8tp9jfPAZBM/rhhz/Vb4MjRKEzdh658ogUupQBFJcQMLgEb4jZxCka/SO+nDSRgddqwJuJC3ZBoUDE9HX4waqmgG7gr7tJcS69t9pxq+NvG7kQd4OFXwa3gZOT3+1KuvCYI9Q6AZWxT0guk8xTM9Hlgk4R3mHT+iDHSG1jYDqv3sMOxSyujcL60774TJBv8IMaHWI/ogUl88RJDv5oEY4ZJ+NkcvWo+t3hQ2DJoIXjHOs09ZwoxunxEEZLeXqKXQm0Ha7+4Lr1nRxmvxQK+8vEekxR/+0paXgydFkkLJ2mUKXRzmxcddRutRHrO9n7fOJVTYH9IZXBTBnyps8t5ge02V32v1lJ3LEBrVhqIiJInAaAv8cDPt1tnZPuqVAoEmkGluG+t/iVcgeSl3OOEX2lh7U84ceIZCgE+rZqUZsdlN0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199015)(36756003)(31686004)(2906002)(30864003)(38100700002)(44832011)(6666004)(8676002)(4326008)(26005)(31696002)(6506007)(6512007)(53546011)(86362001)(66946007)(8936002)(54906003)(6916009)(316002)(66476007)(5660300002)(66556008)(6486002)(478600001)(41300700001)(66574015)(186003)(83380400001)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azh6SWVWY2NjOFJRZkVwMmFTTUJNUFM4LzQxSC9ZaXFiTFRTd1IvcUhVU2VR?=
 =?utf-8?B?djViWVFXUWpOandQZ1B6RDVJSDhZN0t1NXA0TUM1QTYwQUw5eUZqNUswWW9s?=
 =?utf-8?B?MFVtNVJwTGtuMzZ2QWxHSGxGeDRmai9tOFd6SXV1MmtBRXYrT25GV1JuVlB3?=
 =?utf-8?B?ZGNxUzhZbGxCLzUxdUF0MEpDQTQxUHlFMXRHYUdlSFFCSFIvelYzMXhBTFhD?=
 =?utf-8?B?R0puaEI4bmtRb3JQbS9sZWE0cTRoZVRVTGkzZVRSL3I5T0ZhWFlJU3JpU3Ns?=
 =?utf-8?B?ZDgzUUJSOWNqd2hFOUhwZXVobzVvMEtPcU1YT25FMTYzK3FXeFNiS3RaWTlo?=
 =?utf-8?B?NmJNYzZYdHFrUUk1em04b2FqbERwMXY4aTBlZmFaSFZ3VTZZMkNRQ0VsNEls?=
 =?utf-8?B?Rzc2R2tMZURaNUE5MXhsSWV1VTNpaXVyQ3l1NjlZZWRUME5Qc1dDOHBENjdX?=
 =?utf-8?B?TjErVUtYQWt4SnJTYXpoK2NUeFdZTnFwSERQMng0R3lmOUxBeWIwVXdPVFV3?=
 =?utf-8?B?bTl4Um5FaVg0QUJPbytQdXQ5NzFkZEsxTzI5ZElCNzZuRy9zYU9zUkFqdGxk?=
 =?utf-8?B?dHhhM2NoVER2WUpyVW5IUzcvMG0yTDZ1VG95bW9oUmVsaGxpa1hhNHJnamg5?=
 =?utf-8?B?MzQzV3ZXOGRSZHB1YXpNRk5FVVZ2WnNiY2o5M2VCYmt2dUFuUG1pVFlFSTZE?=
 =?utf-8?B?OWxJY2xrRVAzQTM0R3VsUm8ySGI3TS8vaDhTcUxqNUpmcnJRa05nVlNPQTBP?=
 =?utf-8?B?QjNRcU1rS0R4eEduYlhmMnI0UWRkU3Z3Z05lYWh3ZHNaendOTDdQOXVFV014?=
 =?utf-8?B?U1d3azdCcWVjT3NsQTMzdGw0aEhtUklNR3RUL1FtcGdBWE1ZTzRXMk1vSXFp?=
 =?utf-8?B?SEJBWlg4aldxZHd3dVpraXZIeTYrRm5wV2lwKzBNQTQ5U09GamZ1aGdlL3lK?=
 =?utf-8?B?eWI1eDR5UFA2N0U0eEV0YzZ6SGlCVnhkSVdOYzVWMVFEdGRvS1VqeEYyRWdo?=
 =?utf-8?B?ZThSY083ZFFteDdlc0Z1dFVZbzAvTW1rU01ZMXVDRlBkaXYvYTlKeGU0bGZQ?=
 =?utf-8?B?Ym11UlFOZ1hpV2NKeWRKbGhFZExkNlhua2pkL1ZHWU15QWdnekRIMFhldFAw?=
 =?utf-8?B?UUtac2cybWZRZSsrZ29GMHBmNVFWRkZQTWkweFhQRWtxRGlGQXRIK3MrT01w?=
 =?utf-8?B?YlVvV0NuT1lZMDN6SG1Mc2krNFAvU1hwenFiQjdTUy9ESmh0bUUwbmRnUy9Y?=
 =?utf-8?B?QXZXUzhaY1NvcE5VRnRqMWdkenlmcVpQUnkzMk9lVElIVkFwblR3QlBydW9r?=
 =?utf-8?B?TFc4OU5hSGx3bE1MbXdEUEN3MlhBdTY5YjZjUjd0bU5QUkJsZWVESDJrQVdw?=
 =?utf-8?B?Yy9Jb05WaEJNTUc2MklnTEJodUtaRGFjMU1LUlJLUUhKT3k4VWdXQlRoMEdQ?=
 =?utf-8?B?TEFwcnlBNE1neXV1SzFydWQ1a1JaeTZ0ZXNzS0x4NWZZZUpQUGcwWkdhQm93?=
 =?utf-8?B?cWFZRDBiTGtlcEUrMmNxOWQwU0x4R0J4RmE4L08zb0JOOEJtY0NJNmI5MTRC?=
 =?utf-8?B?UTF2ak8xcjhreVZQUWVMcitqdjNQSWh6dFVBd3Ira2hQTlFsTmgvQThhUDZz?=
 =?utf-8?B?eTRhYUxFZm1PbU1KQkV4QmVzK0VzOFU0UUFsZ3J0YmU4QVVMOW13TjkxdGZi?=
 =?utf-8?B?bEdSN04vVStOTzNFVC9FWVlwMHg0QWZHY3NqakR5QysvcitJckw2R0J5eHhT?=
 =?utf-8?B?KzBibnZPckVxNHExcU4zZ0w4d2VxajJRUnhQZmN5TUxCczIzbWNjYU1OOVlB?=
 =?utf-8?B?TGZjTGUrL1ZiMVhEMXlxWjJFY21kWXRtWjFxNjRFdUxmL0VhbmJyNlVzS1R0?=
 =?utf-8?B?T3JGZlB4SUJoYysrd3dQM2d3RjE1dVJBWlI4SkVxWi9lUm9jZklraFJqSG9P?=
 =?utf-8?B?SzJaTERvQ3VnRFl5UVRhc1ZlV3hFWkh3Y2pQMzhKY3lJU3BQMnBKWkNHME5N?=
 =?utf-8?B?Z2VDRjg2dzBKRDkzalZVQzRoeGdtcGR2U3RpWnpycmVBQWtGTWd4dzlSdjFE?=
 =?utf-8?B?YnRubzhsQTk2N3pVOUJmSlArQU1tVFJ5WEJmNjVGL3p1MjlUazZEWEdxUzN5?=
 =?utf-8?Q?Xv2f+/zIwie51EUv+dDN8AAug?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed4f44e-7f75-475f-b9b9-08dadd2826eb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 16:36:14.9477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LrzSrGUY6NLl+0NNC6cDOwx0fZs1DV3OvjVzZxSFLubTnG8o8/gGUpdQZC6/5BNLRUUqxbtYBImuJmh93G7Tww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8330
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



On 12/13/22 05:34, Pekka Paalanen wrote:
> Sorry, hand slipped on keyboard and sent out a draft of this email too
> early.
> 
> 
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
> The kerneldoc for "Colorspace" says it has no other effect.
> 
> Is the driver confusing colorimetry with color-representation (the
> RGB-YCbCr conversion)? Or is this property defining both?
> 
> I feel that the documentation of "Colorspace" KMS connector property
> needs clarification, and a list of potentially available values with
> explanations, more than just a reference to CTA-861-H which it does not
> even do yet.
> 
> Perhaps a table, where for each enum drm_colorspace entry has a row
> explaining the expectations of the sink:
> - primaries and white point
> - transfer characteristic
> - YCbCr-RGB or similar conversion to/from some RGB
> 
> Each cell can be a reference to a spec like BT.709 or BT.601 (525 line).
> 
> I think this belongs in the kernel doc more than in color-and-hdr.
> 
> CTA-861-H does not give all the information but refers to things like
> xvYCC601 which you then need to figure out from Wikipedia or whatever
> which is annoying and raises questions about its correctness. Would be
> better if someone who actually has access to the authoritative specs
> would review the table.
> 

Agreed. This was based on previous work for Colorspace support on a drm_connector
and I already went deeper than I hope I had to go, but it looks I didn't go far
enough. :)

Documenting this should also address your comments on Patch 14.

Harry

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

