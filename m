Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EF64849C6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 22:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE25D10E2E4;
	Tue,  4 Jan 2022 21:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2044.outbound.protection.outlook.com [40.107.236.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930C710E2E4;
 Tue,  4 Jan 2022 21:19:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGPJFonoO+dFgKrOQBi3S38Am7JPJwxtlOmnwl6oETiH62W2QjynuDhNchY80rnAbeOjBRXdZvSF7fppZeN7ilpPm1m3PllJJYdEVqqib0SGxJOn0WVy9m5OEz3eDiy0H+PHSKObQuCtRSsr0QMyeTraiYQFR2UdxlVEoMlhXusX1RBfriSUh7Fzn3FK4RGnfp1hlOP6PEfS9f6HNOhhAAz9cPLfNCeikknwXbWzKpet+Pj9WLPf9Bqq6NwdNGHsATriRQA0/T6XPH7H1bnOriHTYrOCImTQHMdKauwybBuh4qoCSoxYwDnUovrlsOKoZhrxZc8AhKWgcK6C07M48Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1kusWmcl6+71hyJP6C9SLNC/L0C/OKTbwJZUVVKiy0=;
 b=Dt30dciK9X6LC0n5oJcYheIxlE5nScEKUsHB4JocU5chgFtwm0sKGuMz3BuzPFCcVQmNkNRQ0Cr9tstLxBp1bLjinqDfKZuebMITFUNKqI7JONJ4OMFTwey0ABjHvEaJsp/HkJz6pAIJIAfgr5Bzl5CYEMpLKuIPiOnKS/yDpHpbT65tRD0w1yOmDfI91QD5MJv4AiG+R5Zmx1kwF6OnEO4Yhb27+Q5DjQCOGS37cDY+/wU4ZwcDRU80NwL3eLFQEl4QQhNqpdwNRB1ZwI7ITPDhqgFIxxkSHkSPuLLkGEwP3i/HERQsk0S0eLjvrBHXwGriOJi1GKK+ILUsFz9BVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1kusWmcl6+71hyJP6C9SLNC/L0C/OKTbwJZUVVKiy0=;
 b=SklV8nhsLpIqnIX/jgkzGOByumGCbNXWOhHGWc+rzF4PhJD1v2g9k0SQQUANm9WXAQihHfX00ez6k4iWpV42fzhqlOQ3Nm05wKYKFB4822WCGlvw2XHDRANQY8XwHwCWdib4w9sPj6tI/keqfBxY/Re3kWHa5PWRQ6/jajjSeCA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5476.namprd12.prod.outlook.com (2603:10b6:303:138::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 21:19:05 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 21:19:05 +0000
Message-ID: <d8d00fe5-da3c-cf8a-f7ef-6f525b1d551a@amd.com>
Date: Tue, 4 Jan 2022 16:19:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [i-g-t 04/14] tests/kms_color: New subtests for Plane gamma
Content-Language: en-US
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211115094759.520955-5-bhanuprakash.modem@intel.com>
 <bfd0e880-491f-015b-256d-9adb0193e78d@amd.com>
 <DM8PR11MB57196030D9E75C34F6A4CA4D8D499@DM8PR11MB5719.namprd11.prod.outlook.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <DM8PR11MB57196030D9E75C34F6A4CA4D8D499@DM8PR11MB5719.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::10) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b5895a7-c4a5-409c-b656-08d9cfc7d608
X-MS-TrafficTypeDiagnostic: CO6PR12MB5476:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB547673BBE3F23DE20F69D4F08C4A9@CO6PR12MB5476.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vaJk49caTwzgZWbq4PjfiLmdXSTzmvBdQu1mT3I87n8djSKiojVSutjxDpjDL3Dndc0O7TaWs8XjyNR8/WmMLkeitSALtSl/gQa+HGviijSx6o8DeMPxgyoKEMf1pjOPtC0VuwyFL5/6BdAgPTw21/lPUl6oKXi/7/qxKlcWbjukX1RaZPfsDXz0TxBUEFU8gNMdqm/lVDZ0fYeSm+eVwubgph+P1MOlw3ShbPgfjDXg8NgYfVFNBStUC52vdDlDgk2FRRLoXolXdge79mZz/jqaXucyW92TCFurgOiaBWK+G1syRVTAY0hIei7tv+eqOlw2bkUlvlbIMJtoShvvfpVVFTfSAxLbgVNhFJrwo1pGq1ee5xh2j/1SUaJYP2Kr3IsQnCGP0TN5pChEci1qYkbMZD6oxTT0w+iSYjAKwADuLBD49LgcsvZb39UptAz3ceyRzzvEIhTRBLDMmjrlJ7f23h4B3R0/nI6VYzeWY4UkovVZuMlqVDxrVxQEc6w9aGHCru4aQGM0YNR2Dm3T4f66Ak9Mkh9HbO66O49nxYH5UwI7X9O9QcgAr3JNGB3CVfr3f1EbStA332+hRT0k6r29CdDOi9OFv5QGLvtIKWt3VZrt9hrYxOyd343MTJApGqcrXE2vaDb2P10/Yg0nshKpihI0CfmD7Bza36MbcZU7iv2eEh0UH7wrh4OfNiLwUV6wakrWfy2jssOYt+ZsDmpRNeHD9nq/K8Db1pvCRIfv0ncpqDdfnBCApH/QnPb4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(8676002)(86362001)(66476007)(26005)(4001150100001)(8936002)(2616005)(36756003)(6666004)(508600001)(4326008)(38100700002)(66556008)(186003)(66574015)(66946007)(316002)(53546011)(83380400001)(44832011)(5660300002)(31686004)(110136005)(6486002)(2906002)(54906003)(6506007)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aSt5Rm1kTkJ2OHZoMUl2cXlPWVF1K0ZmUTZDcEVnbTJDQ2ZXUmlpclNHMU9Z?=
 =?utf-8?B?U0V0TGtsL3ZkbW5KdW5nYURjNWFvY3JEbnFJd0hxRGhURjJtckYxUUNRSk1K?=
 =?utf-8?B?RGJ3bkZySGlMMEwreTZPdEJZQ2lnRzhsZXFoTTBKZHY0aktiQ0dqZGRwa3ph?=
 =?utf-8?B?MGVXR3JxVVFvQUdENmVZcXVVbElENlZQVGhFdGdNbnZEWWlGcnRyWTAyMEFq?=
 =?utf-8?B?QTVrYjBqNWtBYzFjUVphVWRNOHViU3JwOU5hZGE0VWVGMldVNWZnSXVzeGhO?=
 =?utf-8?B?VER4Zzl2WXhBUDIzOFNCV1AyNFM3UW8xRnRxRDJHQmhvckxIQkxRUHZCTzQw?=
 =?utf-8?B?RzdrcUNDZlVRVEV6RHZyaVdrbG4raHFPSEM4ckVRSkJoNWhJRFR0c3BoZUd4?=
 =?utf-8?B?ZmlWclI4R1Z6RlRhbWZYTWh3L2dtdXpkL01XcmM2ZjhPTzFtMHVXdWQwclhI?=
 =?utf-8?B?SlZnemhKVEFZaFkyOWp5WW5TcEE1K0gxRkMvdzZEcGJTV08wNFh6SFlGTW9I?=
 =?utf-8?B?bHZKMkVFMXp6NjlGaEEyUjV2VUovbHlITzhZSm5tMHZTYnhTaGYrTHVTeUVS?=
 =?utf-8?B?Y2JEQzV4STI2a3VUZ242aG5DQTJsK0FoTFdUMmZGcXpWSFo1U1JDcG9BSUh3?=
 =?utf-8?B?d3h1eG9NNE9aRUduaEJJa2RVa0hzYUNBdVRtMU9YaUxQUDZNZWpqcjhTeTJZ?=
 =?utf-8?B?QU9maFRiRW43WElyOVBiSE9JTHdrU21sNkZ0RUloeGY4R1BvTTlraS9VeDJk?=
 =?utf-8?B?WURuZXRZOFc0b1kxbkZYWStkS2pYS08yS3NJUnI3eE1kaGMxWlFmbmxzS0dW?=
 =?utf-8?B?MkIvS0FMUFNZb2hQTnRoU29aTlk1Y1BDUnlkd3dYaTdtTE4xZWxsTjBUV0ZM?=
 =?utf-8?B?V1ZFTGhkQ1lyanpvOGUyMk9mTWVlcnF5VjNiY25UU2pxRGtHZWRyejNMb3dn?=
 =?utf-8?B?bC9vei9OcnRGdkp3Vk0wNHlKQjJuRmc2NHZNNDZsUkIrblpoU1puMkd3MTdx?=
 =?utf-8?B?NWwxYm5HRDRPaWI5VHpvalVpa2VoZGxvVnBwdVdHdVRqSDdLVGlDbUhUZXJi?=
 =?utf-8?B?RVgzRXFwMmdVSkVITlEvMVZHTWtseS9rYUVzVlF5cVdFY3BoNFA4TEFLR2RE?=
 =?utf-8?B?NGZOSE1rY0Z2ZEk0MkQzQ29TOGxrYmdmRTcxSkp0NzFOcVB5RllCVzlqTjRm?=
 =?utf-8?B?QWJ4b0NKZFcwb0k0QjEvWVBHUzdySGtCNnBOU0RDQk54VTZ1djJXZVNqdHRS?=
 =?utf-8?B?cmJGMWE0RGlJSDhlWDhlKzFnZU5CY3JoNkFyY2VFMGpTWmVTOHQ5dDZFcUVz?=
 =?utf-8?B?eGFrNElpMEFMbEVZZGNpK3JNT0IyNXM5cS8xdnNsNjdBRTRENjA5R3JtbENC?=
 =?utf-8?B?YU5rck9kUThiN0NDL2xCd2ZFbnZ5RjUwZ3ovNXFtWjBKT0JNY0dJbHhWQlla?=
 =?utf-8?B?Mjl1UEQwTWVDZUtQeE5CU05yWVMrZlgrcnY3dW1vY1lvalpHK2lTdVd4STJN?=
 =?utf-8?B?bnJsQXd4anFvcHN5TEVlc1pXa2t3ek1icFB5SFZxN0NXZ1N0RHQyYVlndDV3?=
 =?utf-8?B?a01xQUhvTTBxYUxYWnBFN08wUlkvK2R5NzI4Wm9tU1REUHZOK1I4WGNCOEVN?=
 =?utf-8?B?UU93dnQ3VUhsSEhONk5oRW10SlFKQnRDU21OM3BsSVBzZDBlWUI1cEJSdXIx?=
 =?utf-8?B?N3N0SmNENlYrRDRER3FjRUV1K3JyWFQrRWdaMjlldGNRWG1JbVZLT1dkT1N5?=
 =?utf-8?B?L2VkNXZhbUozcnRBVVhBYzdqVy9mRmFiQTZNaDVWalFGOFVZRzM1Ujl6UHNN?=
 =?utf-8?B?SktKelFzWDMwYkY3YWxEQjlsOGIyRXJlNGEvMGJTNlRRMjhaeEwwaTAxSjFt?=
 =?utf-8?B?c0ZKNTdSQTdvK3JBT1dpc1p6YU5UcmE1VmVHVGhVd1dLbGZzaEw0N2ZNV1hM?=
 =?utf-8?B?VTIrZWg2d1R5UHRrQUlWbzBKK2dYSlRBSDlHMWhqMmdMRHFDUGpZclBiZVBG?=
 =?utf-8?B?WWcxVEY0VkJYUHo0WUMvWFgyaEdSYlVkcHU4Ukwvd1psV3ViR0JIVTBoODZh?=
 =?utf-8?B?ZVg4TFRYQ2t4Vys2ZXRlTGMvMG9CamVCYVJiRlhnZnhCTWFXbnI2eVlHb2d0?=
 =?utf-8?B?bzVqcTZ3WGpnQTdTR3FiS0dtaFRuTU05bE1oSkZ4ekJuQ3p4Y25aWjYxRXdy?=
 =?utf-8?Q?nz4vd8WYRgFj00xxgC6/M40=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5895a7-c4a5-409c-b656-08d9cfc7d608
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 21:19:04.8484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NzUrjnVEuJqU02yhsLwTQgx10/cZDTqNd3GvNcbAUMniwnsUUZUL1nfN48U/eCQgq0OCsay0GbaEUWIpGGlSjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5476
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
Cc: "Shankar, Uma" <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-01-02 23:05, Modem, Bhanuprakash wrote:
>> From: Harry Wentland <harry.wentland@amd.com>
>> Sent: Friday, November 26, 2021 10:25 PM
>> To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; igt-
>> dev@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>; Juha-Pekka Heikkila
>> <juhapekka.heikkila@gmail.com>; Shankar, Uma <uma.shankar@intel.com>
>> Subject: Re: [i-g-t 04/14] tests/kms_color: New subtests for Plane gamma
>>
>> On 2021-11-15 04:47, Bhanuprakash Modem wrote:
>>> To verify Plane gamma, draw 3 gradient rectangles in red, green and blue,
>>> with a maxed out gamma LUT and verify we have the same CRC as drawing solid
>>> color rectangles.
>>>
>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>> Cc: Uma Shankar <uma.shankar@intel.com>
>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>> ---
>>>  tests/kms_color.c | 179 +++++++++++++++++++++++++++++++++++++++++++++-
>>>  1 file changed, 178 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/kms_color.c b/tests/kms_color.c
>>> index 775f35964f..b45d66762f 100644
>>> --- a/tests/kms_color.c
>>> +++ b/tests/kms_color.c
>>> @@ -24,7 +24,34 @@
>>>
>>>  #include "kms_color_helper.h"
>>>
>>> -IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
>>> +IGT_TEST_DESCRIPTION("Test Color Features at Pipe & Plane level");
>>> +
>>> +#define MAX_SUPPORTED_PLANES 7
>>> +#define SDR_PLANE_BASE 3
>>> +
>>> +typedef bool (*test_t)(data_t*, igt_plane_t*);
>>> +
>>> +static bool is_hdr_plane(const igt_plane_t *plane)
>>> +{
>>> +	return plane->index >= 0 && plane->index < SDR_PLANE_BASE;
>>> +}
>>> +
>>> +static bool is_valid_plane(igt_plane_t *plane)
>>> +{
>>> +	int index = plane->index;
>>> +
>>> +	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
>>> +		return false;
>>> +
>>> +	/*
>>> +	 * Test 1 HDR plane, 1 SDR plane.
>>> +	 *
>>> +	 * 0,1,2 HDR planes
>>> +	 * 3,4,5,6 SDR planes
>>> +	 *
>>> +	 */
>>
>> This seems to be about Intel HW. AMD HW for example does
>> not have HDR or SDR planes, only one generic plane.
>>
>>> +	return index >= 0 && index < MAX_SUPPORTED_PLANES;
>>> +}
>>>
>>>  static void test_pipe_degamma(data_t *data,
>>>  			      igt_plane_t *primary)
>>> @@ -638,6 +665,122 @@ static void test_pipe_limited_range_ctm(data_t *data,
>>>  }
>>>  #endif
>>>
>>> +static bool plane_gamma_test(data_t *data, igt_plane_t *plane)
>>> +{
>>> +	igt_output_t *output;
>>> +	igt_display_t *display = &data->display;
>>> +	drmModeModeInfo *mode;
>>> +	struct igt_fb fb;
>>> +	drmModePropertyPtr gamma_mode = NULL;
>>> +	uint32_t i;
>>> +	bool ret = true;
>>> +	igt_pipe_crc_t *pipe_crc = NULL;
>>> +	color_t red_green_blue[] = {
>>> +		{ 1.0, 0.0, 0.0 },
>>> +		{ 0.0, 1.0, 0.0 },
>>> +		{ 0.0, 0.0, 1.0 }
>>> +	};
>>> +
>>> +	igt_info("Plane gamma test is running on pipe-%s plane-%s(%s)\n",
>>> +			kmstest_pipe_name(plane->pipe->pipe),
>>> +			kmstest_plane_type_name(plane->type),
>>> +			is_hdr_plane(plane) ? "hdr":"sdr");
>>> +
>>
>> is_hdr_plane is Intel-specific.
>>
>>> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_MODE));
>>> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_LUT));
>>> +
>>> +	pipe_crc = igt_pipe_crc_new(data->drm_fd,
>>> +				  plane->pipe->pipe,
>>> +				  INTEL_PIPE_CRC_SOURCE_AUTO);
>>> +
>>> +	output = igt_get_single_output_for_pipe(display, plane->pipe->pipe);
>>> +	igt_assert(output);
>>> +
>>> +	igt_output_set_pipe(output, plane->pipe->pipe);
>>> +	mode = igt_output_get_mode(output);
>>> +
>>> +	/* Create a framebuffer at the size of the output. */
>>> +	igt_assert(igt_create_fb(data->drm_fd,
>>> +			      mode->hdisplay,
>>> +			      mode->vdisplay,
>>> +			      DRM_FORMAT_XRGB8888,
>>> +			      DRM_FORMAT_MOD_LINEAR,
>>> +			      &fb));
>>> +	igt_plane_set_fb(plane, &fb);
>>> +
>>> +	/* Disable Pipe color props. */
>>> +	disable_ctm(plane->pipe);
>>> +	disable_degamma(plane->pipe);
>>> +	disable_gamma(plane->pipe);
>>> +
>>> +	disable_plane_ctm(plane);
>>> +	disable_plane_degamma(plane);
>>> +	igt_display_commit2(display, display->is_atomic ?
>>> +					COMMIT_ATOMIC : COMMIT_LEGACY);
>>> +
>>> +	gamma_mode = get_plane_gamma_degamma_mode(plane, IGT_PLANE_GAMMA_MODE);
>>> +
>>> +	/* Iterate all supported gamma modes. */
>>> +	for (i = 0; i < gamma_mode->count_enums; i++) {
>>> +		igt_crc_t crc_gamma, crc_fullcolors;
>>> +		segment_data_t *segment_info = NULL;
>>> +		struct drm_color_lut_ext *lut = NULL;
>>> +		uint32_t lut_size = 0;
>>> +
>>> +		/* Ignore 'no gamma' from enum list. */
>>> +		if (!strcmp(gamma_mode->enums[i].name, "no gamma"))
>>> +			continue;
>>> +
>>
>> It might still make sense to test that this is doing bypass.
> 
> As we know gamma_mode->enum[i].name represents the name of the
> gamma mode and gamma_mode->enum[i].value would be the LUT blob
> address of that particular gamma_mode.
> 
> For "no gamma" case the blob address is NULL, so we can't commit
> this mode. Hence skipping this mode.
> 

I was thinking it'd be good to test the "no gamma" case as well
here, i.e. the case were we set a NULL blob. I'm not sure what
you mean when you say "we can't commit this mode."

Harry

>>
>>> +		igt_info("Trying to use gamma mode: \'%s\'\n", gamma_mode-
>>> enums[i].name);
>>> +
>>> +		/* Draw solid colors with no gamma transformation. */
>>> +		disable_plane_gamma(plane);
>>> +		paint_rectangles(data, mode, red_green_blue, &fb);
>>> +		igt_plane_set_fb(plane, &fb);
>>> +		igt_display_commit2(display, display->is_atomic ?
>>> +					COMMIT_ATOMIC : COMMIT_LEGACY);
>>> +		igt_wait_for_vblank(data->drm_fd,
>>> +			display->pipes[plane->pipe->pipe].crtc_offset);
>>> +		igt_pipe_crc_collect_crc(pipe_crc, &crc_fullcolors);
>>> +
>>> +		/* Draw gradient colors with gamma LUT to remap all
>>> +		 * values to max red/green/blue.
>>> +		 */
>>> +		segment_info = get_segment_data(data, gamma_mode->enums[i].value,
>>> +				gamma_mode->enums[i].name);
>>> +		lut_size = sizeof(struct drm_color_lut_ext) * segment_info-
>>> entries_count;
>>> +		lut = create_max_lut(segment_info);
>>> +		set_plane_gamma(plane, gamma_mode->enums[i].name, lut, lut_size);
>>> +
>>> +		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
>>> +		igt_plane_set_fb(plane, &fb);
>>> +		igt_display_commit2(display, display->is_atomic ?
>>> +					COMMIT_ATOMIC : COMMIT_LEGACY);
>>> +		igt_wait_for_vblank(data->drm_fd,
>>> +			display->pipes[plane->pipe->pipe].crtc_offset);
>>> +		igt_pipe_crc_collect_crc(pipe_crc, &crc_gamma);
>>> +
>>> +		/* Verify that the CRC of the software computed output is
>>> +		 * equal to the CRC of the gamma LUT transformation output.
>>> +		 */
>>> +		ret &= igt_check_crc_equal(&crc_gamma, &crc_fullcolors);
>>> +
>>> +		free(lut);
>>> +		clear_segment_data(segment_info);
>>> +	}
>>> +
>>> +	disable_plane_gamma(plane);
>>> +	igt_plane_set_fb(plane, NULL);
>>> +	igt_output_set_pipe(output, PIPE_NONE);
>>> +	igt_display_commit2(display, display->is_atomic ?
>>> +					COMMIT_ATOMIC : COMMIT_LEGACY);
>>> +
>>> +	igt_pipe_crc_free(pipe_crc);
>>> +	drmModeFreeProperty(gamma_mode);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>>  static void
>>>  prep_pipe(data_t *data, enum pipe p)
>>>  {
>>> @@ -890,6 +1033,37 @@ run_invalid_tests_for_pipe(data_t *data, enum pipe p)
>>>  		invalid_ctm_matrix_sizes(data, p);
>>>  }
>>>
>>> +static void run_plane_color_test(data_t *data, enum pipe pipe, test_t test)
>>> +{
>>> +	igt_plane_t *plane;
>>> +	int count = 0;
>>> +
>>> +	for_each_plane_on_pipe(&data->display, pipe, plane) {
>>> +		if (!is_valid_plane(plane))
>>> +			continue;
>>> +
>>> +		igt_assert(test(data, plane));
>>> +
>>> +		count++;
>>> +	}
>>> +
>>> +	igt_require_f(count, "No valid planes found.\n");
>>> +}
>>> +
>>> +static void run_tests_for_plane(data_t *data, enum pipe pipe)
>>> +{
>>> +	igt_fixture {
>>> +		igt_require_pipe(&data->display, pipe);
>>> +		igt_require_pipe_crc(data->drm_fd);
>>> +		igt_require(data->display.pipes[pipe].n_planes > 0);
>>> +		igt_display_require_output_on_pipe(&data->display, pipe);
>>> +	}
>>> +
>>> +	igt_describe("Compare maxed out plane gamma LUT and solid color linear
>> LUT");
>>
>> I can't seem to see the linear LUT test. This only seems to test
>> the max LUT.
>>
>> Harry
>>
>>> +	igt_subtest_f("pipe-%s-plane-gamma", kmstest_pipe_name(pipe))
>>> +		run_plane_color_test(data, pipe, plane_gamma_test);
>>> +}
>>> +
>>>  igt_main
>>>  {
>>>  	data_t data = {};
>>> @@ -910,6 +1084,9 @@ igt_main
>>>
>>>  		igt_subtest_group
>>>  			run_invalid_tests_for_pipe(&data, pipe);
>>> +
>>> +		igt_subtest_group
>>> +			run_tests_for_plane(&data, pipe);
>>>  	}
>>>
>>>  	igt_fixture {
>>>
> 
