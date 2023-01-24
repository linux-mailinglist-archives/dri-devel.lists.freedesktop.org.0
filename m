Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DACE67A1FB
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 19:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E635C10E1BC;
	Tue, 24 Jan 2023 18:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D822B10E1BC;
 Tue, 24 Jan 2023 18:57:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Btca5wu3b9aUTq00mUUA5JaM3k+RQ+mQUxkN0gLz6z5NcXQFWK/hMeZ1q2f8pIuyi0h+V0G95CJUBf/O8c85cadjF8NbX7mryi80ea0OWqOVU+4YYOEgg9PSc7mVZ/bq4aFw78NqdZORDd1pUqAGBuG0kK8d+tHwvwZfkmax8dOsvuwgXpwRbr770NI2fdqerYAqmKdiWk8/pVVXHOfe3Jnm9jxFUzxjftplZ8K4Wj7aXqhCsD3KTbcVy90mPpu66j/kSoZhNdf4eBHXxpIL+hb3fVzUrZCq6uQIr53UulPOqAxVMGuIWii+Iqc9nBP8jWNafUg50/j6LlPVWTrjOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2FATGIxAZCAJx5kUMxDkzEKILXg8FC9xU6+7mcpnbY=;
 b=OjUo7X8NWMtUqksQ8w5ieYp28x/X7ib6sezyRxxWiEhAO0GsEI66yM5pxKxaWCoPVHJkHaBrg8jj7dCN2Vtn1nOXPaLstxj+MKz1HjIOVAs/XCFRfNCxfw13n/ELXg5yhHIl/ZG+S+zfnurd9ho04DUAJWATFqEUZB1zoo9W71i2lRiwDo9lrRd1dJ+x+S4erSZ3k/AhCN4bfd9Z3CyoYXevEZzkC6i40ERWjX1hzbL5yJkQqKdx7REmexTx3A6MDo7iO8JhmQWJsFvQMUHjHX4OMijsTt1pippGB62isAuGl+8vCDqU/LaGPoT+w2uIW5375tDUnZSiI8WQjNBqDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2FATGIxAZCAJx5kUMxDkzEKILXg8FC9xU6+7mcpnbY=;
 b=XmmJzsB58eRek2Hl0S+848q6PO59B35ukWVVmkD+AiMcXji5RHAqddqsAUE4rXOmCijjHZZKYOzrYQ9/TDrw9cEqkxMys5/JxLmXR6c3U6qax2a5/QYGx66xuvNJI2N9Yq0zXtpnnGJmZmQI3pKngCPTjwhixJ3tdZATzpx6R1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH3PR12MB7738.namprd12.prod.outlook.com (2603:10b6:610:14e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 18:57:33 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 18:57:33 +0000
Message-ID: <351e0c24-8359-f42a-03b2-baf09cdb55ab@amd.com>
Date: Tue, 24 Jan 2023 13:57:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 18/21] drm/amd/display: Fallback to 2020_YCBCR if the
 pixel encoding is not RGB
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
 <20230113162428.33874-19-harry.wentland@amd.com>
 <CA+hFU4xHKNSWO21Swq_b2VPPxtYGdeo4e3rPEVo44OPmB+opZw@mail.gmail.com>
 <0a57bc76-91f7-dc00-6877-cd0a1dfa7347@amd.com>
In-Reply-To: <0a57bc76-91f7-dc00-6877-cd0a1dfa7347@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0366.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::11) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH3PR12MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: 1270549a-7b96-4418-610d-08dafe3cd9ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mGbBK0V3Fw9XvCNyT0hLzLE9SaJ0p2YRsVlx2RIr4yBgsvJN1OUbXCD7fiv1g5+fWTv33uxpIh4glQDLlmUYj795PA0VYQa1UAVaDI4LSt3A7DmUcT/rO+KH6rYHgiP1ffJZM/nfHTtlZG4GvAdnSer+89ZBDmsdmlt2mvloqFigSXt99AW3kg/W9CWM9+tF0VGnzshKeSkjDBcFuJeurUayBWiYERur5keOYMdnXYgHHnk9+4ecOCtX5plQOXZp8ZWnrfxOAj2860IQ5I1KneP4Yb9fCqFExWMNVQ2MX3aCrNx6i1zNvMXuEiB5UCB598ycb7AGPEstq1o/9C5Kx/HqA1MFHLYOKKnGV7KmBmwqMJp7pFQhaVwcdSLhFjBpmBPd96Qsc1c43cj+4vJYdHrowNkcUnRTNHz2QT9fYuuWWvtuMqO9hy1jI0b02mtYaKezKGQ4OcgsP+Dq5eOXc7o6zuFKIhNnzVr3fhjxo1zTZCAlp+yqSnfB+tY217RecgopA61UniYT8JZOwiQ3y6IRjRe6kfjZeXBno7F6c5O4ImX8zuYSSSC/RHj2fPbYYu9pEaigPsAd7a1mqXuMpZ9Z4jQeEWaA+DBixIibf1TtVVb7Kw7zR5z4LpdGsl4QMzLA6xgAP7/SCmo3BEjaqbBHAk3PHLeGN8Zj7JKhTyncj429mafksbVBlwjrT9vfS3SjxPSoev5YYRBwwJQ2FJ0VQqF2ybwxMZ6O8E96XKs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230024)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199017)(44832011)(66476007)(4326008)(5660300002)(66556008)(316002)(66946007)(86362001)(6916009)(41300700001)(83380400001)(31686004)(8936002)(478600001)(8676002)(6506007)(53546011)(6486002)(31696002)(38100700002)(2906002)(186003)(2616005)(6512007)(54906003)(26005)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVExSDVlZThieUk1SUV6QWEwamZhY05DZjhWYm9QL01EVVlOQmdUNWVxNHZo?=
 =?utf-8?B?SzVpcEM2Zko0NTl4Ti9XZU53a0k3cjZLQjgxZlpDTDdTaG1KYys4aGkvWkk3?=
 =?utf-8?B?UlVJS2Q5eFFKdGJmb0ZEVGVGbVNVNWRiSU1KNGRoT1gxblNtUVE0allXOHBJ?=
 =?utf-8?B?QzViMzRQNXRhZ3Z6RkxtMjRnTDJXZGlHN3hHUFQxYVlNUXVreDdZVkVvRW9P?=
 =?utf-8?B?Q3VzY3ZvZHUrRFZzSjRqV0V5Ni9RSU9nOVc4ZDloRk5rUG5vcTUvVkdvdXNL?=
 =?utf-8?B?NkhMa0F2K1dvdFE3Z0xtS3BXcmpjZ0s0NU40azl6L2J2b3pTeHk1NWdUZkIy?=
 =?utf-8?B?K0IvVWljWHZJMi92UHhwZXpCdDVYbCtIZUg2WFM2eXZ1d1VMcEl6RXpXaHNm?=
 =?utf-8?B?cTBIRVBzQjZaSlc3cVZvejcyUzA3RnNlMU91VFJRbFBteEN1R004Q00wSUwr?=
 =?utf-8?B?UVBCbXJLdUtYVjN1eEx3UTg3M0dqYkwyV2dDRzZzS1RQc2FiWmdEbThuYll2?=
 =?utf-8?B?WHBudWR0VlRXdnYyV0g5TGhLRm1QbngxeW9Ea28wQ2FlUU1QNU9mblgwYytq?=
 =?utf-8?B?TkV3cUM0RTUrUkJYaFpUZFZtYlVFMlVQRElLRlF6NHRUUG9XckVsc3RtVVNP?=
 =?utf-8?B?SFkzdlVQMjk3NnliQUh2ZHBDUENOTUxLSEhnR2I0T2tzMWd5RUUwYy9QQnBV?=
 =?utf-8?B?L0ovbVhud3dCc1FxUmhTbWVaMWNCSXViczg4NnllUERlWUMxTGF4UjBIeEtI?=
 =?utf-8?B?dkxhSW5rRnFqa1cvRmtHR0Q2c1EycU5XOHEzSmM4YkpoL0k1dnZPbEhCM2Zn?=
 =?utf-8?B?NUtFREJhbTh2eEtPdzJXeDJMZm43a3h5YW9oQW9CcndIVVJrbHdDL3Z6U1Jt?=
 =?utf-8?B?R0dlekdzU1UxZDdkWXNXc2lrY3RoSlVIaWlzdTJRSHp5VFEwWjFCUVg3TEpk?=
 =?utf-8?B?S1BJT3hjdjNIM0hJbzdlYnRmVnJaaWVIa0RHS1A3T29kSjVzS216Qnd2T0Jo?=
 =?utf-8?B?cUw1N2loTzlnQTcwczMvU2IySUhsTXd4a0w4QUF0TW52UWMweU12dEZCUFd0?=
 =?utf-8?B?SlI1ZkFERFNGTDYweWJ2bEhLcVl4RDgwei9udlp0TjdkY3ZXek5qaWNqTHdM?=
 =?utf-8?B?cTNGeHY0ODhhWVJwTUhOaGxoUU9zRjNrcExVbzQwdXVqTWtzMzF5Yi9ZNUo3?=
 =?utf-8?B?Q01sdE1OVzVybVM5em5MTnVOYUtPQVBFS1BmdlF4cjlJRXJQNEhqWGcvZzAz?=
 =?utf-8?B?eE54dHJjbEJOcHlmbkZ5MmR3Z3JkRVdZdFJoZThHdHIrYk9HeUx2U05vdklN?=
 =?utf-8?B?SjJjZmtVeTNZM3BaNnBvb0JwQUNPQVBrc3RMSUpMWlBSamx4U2JBdWxaVkcz?=
 =?utf-8?B?bHVsR09FbDFzZk9SMlZXUlhFdndRM0N0bnhRTGs1elBia0d4L3BwZnhUS1Ba?=
 =?utf-8?B?QlEvb3VjVEhKWXpGWjZ6a1BZNnJUYWFNcVBoaE9KYkVxWUszNTNKRnhGbGZZ?=
 =?utf-8?B?RDV5TzE5SklHWGJhMGJDY2tlQ3JxVHpHTnFvOERhb2hzdGVkaGRmTlViMHdH?=
 =?utf-8?B?eXlNVEpxa0UzN01Dak5tWWlDakNuMnkxVU0rZDJia1cxZHNxZ3g3Vi8vWFJG?=
 =?utf-8?B?MzN0UUV0UzUveG9mQ0tRSktqbkxsaFhxMEorZjdwdjdDY0Y5YlFWZkJJUkNr?=
 =?utf-8?B?MWlIWlNmcWtpYnE2amFteXVOSmNueE0zeldPQ3pBcmVvSXFwNUtIWnJZekYw?=
 =?utf-8?B?YUpOdFJ0OHNvZ0NUc1hDM3lNL21BRzRyQSt1ckFTckJndTd0QVhHWjlxR01o?=
 =?utf-8?B?WDdUbjNQVVg2V2l5NEpnaEE3cFlhZ1kvRFN1M1VmazNwWUpYWmRvSGJBaHBJ?=
 =?utf-8?B?U3VmUzJ2UTVJL3BLU1greFVoYVJ3dCtWMmFTL3ZsK1JiS3JyWWE1VTBqNXBh?=
 =?utf-8?B?dDM1V3Z1b2JEZTYwWU1nZXVxS1JPSGxaVlhmVkFhd0JtUGlCREsyNkRxeWc3?=
 =?utf-8?B?d1RCQnNIak9wZ3BMdnpvRHpmVjhraDBWbTZKSmFaa1NJWGlPcXdiTGNBSUVx?=
 =?utf-8?B?ZUN3M1oyTG53RUJqaDU0L1BCcSs4anFOV2dNdkxZWXBSNUNSYzUxdlEvdWs2?=
 =?utf-8?Q?0i2QCk61ToSFeMnzd1lkEVWJR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1270549a-7b96-4418-610d-08dafe3cd9ef
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 18:57:33.6539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YvvnfXfVU1Ka5auToxKM1ohCLo7Mmlz63joULJK5qrge66UKAR3XFJEu2AXdbRgvmQEH93yTsfXWm7pHlPKSgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7738
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/24/23 10:37, Harry Wentland wrote:
> 
> 
> On 1/23/23 15:30, Sebastian Wick wrote:
>> A new property to control YCC and subsampling would be the more
>> complete path here. If we actually want to fix this in the short-term
>> though, we should handle the YCC and RGB Colorspace values as
>> equivalent, everywhere. Technically we're breaking the user space API
>> here so it should be documented on the KMS property and other drivers
>> must be adjusted accordingly as well.
>>
> 
> Could someone point me to a userspace that uses this currently?
> 

To elaborate a bit more...

A driver has always had the ability to pick the wire format, whether
it'd be RGB or YCbCr (444, or 420). In some cases that selection
is required in order to satisfy bandwidth requirements. In others
we follow a certain policy to ensure similar behaviors between our
Windows and Linux drivers. I don't think it makes sense for userspace
to control this.

Based on what I see I am not convinced the entirety of the
colorspace definition has a corresponding implementation in an
upstream, canonical userspace, hence my question. Not even an IGT
test existed when I started looking at this. In the absence of a
missing userspace implementation I am not convinced we're breaking
anything. Even then, this was never implemented in amdgpu so
there is no way this regresses any existing behavior.

Harry

> Harry
> 
>> On Fri, Jan 13, 2023 at 5:26 PM Harry Wentland <harry.wentland@amd.com> wrote:
>>>
>>> From: Joshua Ashton <joshua@froggi.es>
>>>
>>> Userspace might not aware whether we're sending RGB or YCbCr
>>> data to the display. If COLOR_SPACE_2020_RGB_FULLRANGE is
>>> requested but the output encoding is YCbCr we should
>>> send COLOR_SPACE_2020_YCBCR.
>>>
>>> Signed-off-by: Joshua Ashton <joshua@froggi.es>
>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>>> Cc: Pekka Paalanen <ppaalanen@gmail.com>
>>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>>> Cc: Vitaly.Prosyak@amd.com
>>> Cc: Joshua Ashton <joshua@froggi.es>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: amd-gfx@lists.freedesktop.org
>>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>>> ---
>>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index f74b125af31f..16940ea61b59 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -5184,7 +5184,10 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
>>>                 color_space = COLOR_SPACE_ADOBERGB;
>>>                 break;
>>>         case DRM_MODE_COLORIMETRY_BT2020_RGB:
>>> -               color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
>>> +               if (dc_crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB)
>>> +                       color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
>>> +               else
>>> +                       color_space = COLOR_SPACE_2020_YCBCR;
>>>                 break;
>>>         case DRM_MODE_COLORIMETRY_BT2020_YCC:
>>>                 color_space = COLOR_SPACE_2020_YCBCR;
>>> --
>>> 2.39.0
>>>
>>
> 

