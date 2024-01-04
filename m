Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E988245D8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 17:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C9F10E508;
	Thu,  4 Jan 2024 16:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2075.outbound.protection.outlook.com [40.107.212.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4082410E508;
 Thu,  4 Jan 2024 16:09:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kuAPoqZ/jvNKdLVMBDD4MOlgjpdpeQqkcqRyVcDL5O72ZfDyKqegeOCAUjHWiOqy87Xn+8Vnu+nNfYckuTz5DdMH0Nkclbu4lHQZcjONdial1ypOFczgiZ0IXJln6i4+9uiitO6EXRZrhyLjWt3HXNgFCSJ/+4/qO6hYEmI+ocrOi3MlCSd95ZsqdwPWUB+0WaIxuyzvOEuJmxVXdGlj8sRr3rwOCkfZZq4WRlTe2CrwTOhZTlnD8S18OVmg3TphI65Q5S78kamtpO0vXin973V7ZLa9g3NVejbM6MsLyz3m+fvWlPLCi0bWclA9s/QqBBvM/M0jLLVpJHsN3OptNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IslfyJ2LxrWFtjZZDygifYdbFKli9rCoR0ajGyLmbD8=;
 b=ilg0G8kRn/9e6Q8CTmhBIErp2nDyjgJEguP1UxGP/LEF8Xax6DMAB5r+x5i57rgD8SszC0XUBgVe6HZ2XOWOi9XAre//yMzJRLDEMJYEPILrL+ORJFV57LqsI750Z3UnDf3Dr4D/zBbx0KTOUX8dyKQmM722vNtrjRYoKA+UE45TyivgE5axk0ZkpCYL7xjvbRII7Z21aEvS2fX7t7HK72PplKbLnxpOvFutkIkVTUWWJZBPDJepMV5OjvGcT5fIEKQicRfu/0s3vlV4O1d2ekCTgmraNWsrhhIcl2uJRamdrBMGyMzjql3MpXfBEvNSTzFAEWurw1V53KG/Nfqu0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IslfyJ2LxrWFtjZZDygifYdbFKli9rCoR0ajGyLmbD8=;
 b=FKSF088Cs8cchYsBB5lVzl+sOpqgdpqqbbfcWh2jfxRtAVAuELlgympQHpoPdBLbYy3MZ7QH7F6xy+kC41kN48sC+wTVoMrllN78Qf3LpWq6TXjUx177q4fN3xxmkQ79EEszNeIW+CKOa44PIzPhbj2ZyFBzYfF1avq/qSdI06Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH8PR12MB7349.namprd12.prod.outlook.com (2603:10b6:510:217::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Thu, 4 Jan
 2024 16:09:27 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3a35:139f:8361:ab66]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3a35:139f:8361:ab66%7]) with mapi id 15.20.7159.015; Thu, 4 Jan 2024
 16:09:25 +0000
Message-ID: <e48e3f10-e9bc-4680-b2d6-020f1542df14@amd.com>
Date: Thu, 4 Jan 2024 11:09:22 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 23/23] drm/vkms: Add tests for CTM handling
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
 <20231108163647.106853-24-harry.wentland@amd.com>
 <20231208153203.0b6bdc8f@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231208153203.0b6bdc8f@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0298.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::17) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH8PR12MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: a0ce476b-57d4-492a-951f-08dc0d3f857e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BrIYxE6pqvQCW6oAsGWUefqcXXkAtvnV+T3wqwaGhMc7iVJt/4aFWEKiq8ZYeUY3FRhmJfhz2wStjwKwi0NCEgssunga1Rk9EcKjOAThotuujkkEZ2yGY3H/IZaVPWkAJ3isK9NojWvVnRAOnfyYT+ZC6bo6/Glh3B+/IxMJj+/FQH+r46+aDLYhjMsxFIlmd+yMrZLfrc05lcQasqZGUJe1pTJWWqiNfbxQMVHF1QUfSnoKgzFe1BPLAFlP4sUYe2rqJxiiUHIS2joyxBIu7EhihwgTw2pG48pHOF1mGQjurCx1bP4VBom6bmZY8qXa4KdBI91XlXa7rB7XcxnaJW7nVdiIeWEme/sBATMu4ccZsjRTlHZNKzypE4u2Ldm/i2DvVOQJJIZfTkB0bITQfKPmWV+TpPTTdE3B8vyS9fSE5dswEYJHkMSAgvN+/h18XfbbdXOXV6ewhS827VKvENQFexOGijI/SzizGdqEC5Lh9rEv8ltlkSCWusP6wxV6ypGJYMAivvYcyE9fNxySbN/UOqI0sYYSzZPULX+PsBS5cR7zPDTB+uxBw27Rnkab+A/87w5hE3I11QpJndaPeLBfgWodLgF8IErC4eIbItsHGVffK56ISUeMKhhZWKAcY9mJcd3PJ7UtBgfJNy46Qw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(366004)(376002)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(31686004)(66899024)(26005)(2616005)(6512007)(6506007)(6666004)(53546011)(6486002)(478600001)(38100700002)(86362001)(31696002)(36756003)(2906002)(41300700001)(83380400001)(5660300002)(66946007)(66556008)(66476007)(316002)(6916009)(8936002)(8676002)(4326008)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjhuOHpBZ29tSm52Uy9vNWJZS0lxTmdkR0RpeDNLRFM5eFFDeTArRWI1NDlp?=
 =?utf-8?B?ZVQ1Z0d2d3B6TTR4UXRQVkxkRlg4OTlsYUd1Q29JeHpDbEN0QXdIbzhkWUlI?=
 =?utf-8?B?TFc1b2JyNnVYRWxrMklNVms1aHd2c1JZRnUva0dSSHBnL1JJNklTN3cyenRa?=
 =?utf-8?B?U0J5WGtxbnB3OElOcm91ZE9PUE5BU1ZqamNic21kV2xudElOa3pYZy9jSlRh?=
 =?utf-8?B?SFUzeDJBUTNWMG1FYlRFcldPdGRDZFV6bGZoT0pJcEZNelVEbUdiR3Zjd0R1?=
 =?utf-8?B?ODJWazNqWm9STWdpeHMrMkFCZHFlQkIyTmd1dDlmQlkxQzBHeG5SY2w1NkNE?=
 =?utf-8?B?VnNycVdjbmxIVDR2Znc5SnJNVzF0K1kySCtvTnFZNllXNW5PVkMyMmJCcTNQ?=
 =?utf-8?B?T29uNkVUWm5DSFlvcENaTnZGVmhKWi8xYnJmU2FsMXljSkFQUWxtSXhqRkJM?=
 =?utf-8?B?eElUNjFJV0JPRHJQT0oycmQxTUNlU2NXNHpHbCsrUHZCYnlkTGpZdkdrc3h0?=
 =?utf-8?B?cUdpaHBZcDlNa1IvYlFndS92d2ZGM09LNGtiY1RDQ0tnM24wS2hrQktGcDBW?=
 =?utf-8?B?Z2FtMXpRd1JuU09taTJpOWJMTnZoRmNlZXlsT0JEZDF1VW4rTFlENUJ2MnRm?=
 =?utf-8?B?QmdjSElSS3BrZ3JNNDAvanVQbDREb1pra3hmaXVkazBrTVZ0K21ZSWhVODFm?=
 =?utf-8?B?YjFLUk8rV2FGN25SV1ZUK3kzUEhDTjArV1hXMGhENEY4dHJSN1BNOW1nUytq?=
 =?utf-8?B?TVk0aDBjYWJQdnBmY1JEdmgxaFczNDVxdmgvWEdld3FCeFprL05INkR0TW9Z?=
 =?utf-8?B?dXE2L2FpZElDLzJMT2tsekVLNlVIRUlXV3ZhUmlWMGJoTmFTaS9oTnpxSVNC?=
 =?utf-8?B?emJiaDZ2eUMwaFE1WlZNRm15YUZnRlFRVkp3cUdHbzlENzh5ZEVHWjIvRGgv?=
 =?utf-8?B?dzVvV0huTUZtQ2d2SE5Dck8reU8xbHhTUXVXb0NnTlpFWXVZMzdjSjVBOWp4?=
 =?utf-8?B?a0ZTcHowZ2pyZWxsM2VpbUpYMElNbnJSR2hyTHorM29rWUh3Q09zTTA5cDZJ?=
 =?utf-8?B?ZUltcW5sQmRDQ1NrWDV2N2xlRmxvK3dNQnpHUlNWbDlmYlZpWXc4TTRHVXk0?=
 =?utf-8?B?NWRYb29kc2M3c0NZY0w1SndTSjRsTEJjdHFpMGIvTEtmRTNXRXo1L21QbkVa?=
 =?utf-8?B?OHR1aFRhVUgxSUx4RnpVWmUrRnJqUkNZaE43MEthOFJYS21wK05qY0djOVFV?=
 =?utf-8?B?bHBNS2tmd2lQWXRMNS85dnJvRHJKckoxNi9CTFR0MkdnNGpNbTIvZzJXRXFZ?=
 =?utf-8?B?NW1MVmJTby81Vll0b1IzMnRhd25rQ2VHUnhtT3lSVzQ5RTVPUGE2aysrWTR0?=
 =?utf-8?B?U3FyWlN5RGNjdm9qSSs1TDQvVXJ2STR5QlQ4N0NkaUk3cFVOdFV6VGhiY1Ir?=
 =?utf-8?B?NjFWV05RSit5N2l4NDBKS2sxakxqZk9nanl0SUtkTGFpWGFxdEM4WFlwV1Fy?=
 =?utf-8?B?V2RxM2owa1lEaW94U2ZVL1JlWjY3dnYvSDhYREFoMXNtc3JvMWk4UjBtdkxD?=
 =?utf-8?B?WXRVWFNpSjI2NmNxcTl6N2g2YmtxcXduKzhscGJkTnlSYVZuUGcyVVlzRHVi?=
 =?utf-8?B?eVlsNkFEcElGSlBmTlVzbW40YjR1YXR6WnQ3YkRsdTQwUjNhNnlHbnlqekZx?=
 =?utf-8?B?QUdKV3VzVmU1VzNaL3BvdUk4WUhOb1VkL25OSTR6ZGRTV0w3SlZ3SWk0b3Bn?=
 =?utf-8?B?UWg0d3RSeWt0M2sxZVFuTmJEWlAyQm5nMnpUU1BZKzdXUE5RWGE2dEE5UGU5?=
 =?utf-8?B?bDR2WXgzN0xQbm5JL1ZhZ0FwTVAzU0JmdTIyTStFWHNzRkJ6eDJ6QzR4cGpK?=
 =?utf-8?B?Vzl5Wm9TOE5iSmFadnpqalRubCtQVCtaSlhUTEQ4WXRxYzdCL2h4TVBRazNV?=
 =?utf-8?B?Y3FpREdadkk4ZVlIV2RNL2ZiWlVEbkNROHBNQml6QlhKVzhNKy9QOEpGR2RD?=
 =?utf-8?B?RCtJK3pmZE1aT3N5cTRXcVJWZjhqNWhtbTdUWUZLRlFoUXhCbEhRKzQvM0FF?=
 =?utf-8?B?Zm5FTFRSamdET0FZRWpYR29JZ2JHcVRBejZwY0Fya0dXbkl6UU05a2lvUEN6?=
 =?utf-8?Q?yGx89rHd95742qOPGaUzg37M1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ce476b-57d4-492a-951f-08dc0d3f857e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 16:09:25.5250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Q5R8ZTq1UK/s4SfzFh0Mh39sVOYack79ZtZYrTLPSZ7nIoYTkDixqSdIF8tH5so5lso1CJQKVmmDVRgs0mZYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7349
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
Cc: dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-12-08 08:32, Pekka Paalanen wrote:
> On Wed, 8 Nov 2023 11:36:42 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> A whole slew of tests for CTM handling that greatly helped in
>> debugging the CTM code. The extent of tests might seem a bit
>> silly but they're fast and might someday help save someone
>> else's day when debugging this.
> 
> To be honest, this looks pretty limited testing. I guess the more
> exhaustive tests are in IGT though, would be nice to mention that in
> the commit message.
> 
> There is not a single case for out of [0.0, 1.0] input nor output.
> 
> The offset part is always zero.
> 

It is very limited testing, mostly intended for sanity checking.
If I find time I might expand on these but it's pretty low
priority at the moment. The core of the testing is intended to
be done via IGT.

Harry

>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>>  drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 258 ++++++++++++++++++
>>  drivers/gpu/drm/vkms/vkms_composer.c          |   2 +-
>>  2 files changed, 259 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
>> index ad4c2f72fd1e..3eaa2233afbb 100644
>> --- a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
>> +++ b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
>> @@ -3,6 +3,7 @@
>>  #include <kunit/test.h>
>>  
>>  #include <drm/drm_fixed.h>
>> +#include <drm/drm_mode.h>
>>  
>>  #define TEST_LUT_SIZE 16
>>  
>> @@ -80,11 +81,268 @@ static void vkms_color_srgb_inv_srgb(struct kunit *test)
>>  	}
>>  }
>>  
>> +#define FIXPT_HALF        (DRM_FIXED_ONE >> 1)
>> +#define FIXPT_QUARTER     (DRM_FIXED_ONE >> 2)
>> +
>> +const struct drm_color_ctm_3x4 test_matrix_3x4_50_desat = { {
>> +	FIXPT_HALF, FIXPT_QUARTER, FIXPT_QUARTER, 0,
>> +	FIXPT_QUARTER, FIXPT_HALF, FIXPT_QUARTER, 0,
>> +	FIXPT_QUARTER, FIXPT_QUARTER, FIXPT_HALF, 0
>> +} };
>> +
>> +static void vkms_color_ctm_3x4_50_desat(struct kunit *test)
>> +{
>> +	struct pixel_argb_s32 ref, out;
>> +
>> +	/* full white */
>> +	ref.a = 0x0;
>> +	ref.r = 0xffff;
>> +	ref.g = 0xffff;
>> +	ref.b = 0xffff;
>> +
>> +	memcpy(&out, &ref, sizeof(out));
>> +	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
>> +
>> +	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
>> +
>> +	/* full black */
>> +	ref.a = 0x0;
> 
> This is transparent, btw.
> 
>> +	ref.r = 0x0;
>> +	ref.g = 0x0;
>> +	ref.b = 0x0;
>> +
>> +	memcpy(&out, &ref, sizeof(out));
>> +	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
>> +
>> +	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
>> +
>> +	/* 50% grey */
>> +	ref.a = 0x0;
>> +	ref.r = 0x8000;
>> +	ref.g = 0x8000;
>> +	ref.b = 0x8000;
>> +
>> +	memcpy(&out, &ref, sizeof(out));
>> +	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
>> +
>> +	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
>> +
>> +	/* full red to 50% desat */
>> +	ref.a = 0x0;
>> +	ref.r = 0x7fff;
>> +	ref.g = 0x3fff;
>> +	ref.b = 0x3fff;
>> +
>> +	out.a = 0x0;
>> +	out.r = 0xffff;
>> +	out.g = 0x0;
>> +	out.b = 0x0;
>> +
>> +	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
>> +
>> +	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
>> +}
>> +
>> +const struct drm_color_ctm_3x4 test_matrix_3x4_bt709_enc = { {
>> +	0x00000000366cf400ull, 0x00000000b7175900ull, 0x0000000127bb300ull, 0,
>> +	0x800000001993b3a0ull, 0x800000005609fe80ull, 0x000000006f9db200ull, 0,
>> +	0x000000009d70a400ull, 0x800000008f011100ull, 0x800000000e6f9330ull, 0
>> +} };
> 
> Would be nice to have a comment explaining where these values came
> from, like a snippet of Python printing these. The conversion from real
> numbers to this representation is the interesting part.
> 
>> +
>> +static void vkms_color_ctm_3x4_bt709(struct kunit *test)
>> +{
>> +	struct pixel_argb_s32 ref, out;
>> +
>> +	/* full white to bt709 */
>> +	ref.a = 0x0;
>> +	ref.r = 0xfffe; /* off by one in 16bpc not a big deal */
>> +	ref.g = 0x0;
>> +	ref.b = 0x0;
>> +
>> +	out.a = 0x0;
>> +	out.r = 0xffff;
>> +	out.g = 0xffff;
>> +	out.b = 0xffff;
>> +
>> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
>> +
>> +	/* red 255 */
>> +	KUNIT_EXPECT_GT(test, out.r, 0xfe00);
> 
> This allows result grossly greater than 1.0.
> 
>> +
>> +	/* green 0 */
>> +	KUNIT_EXPECT_LT(test, out.g, 0x0100);
> 
> This allows grossly negative results.
> 
>> +
>> +	/* blue 0 */
>> +	KUNIT_EXPECT_LT(test, out.b, 0x0100);
>> +
>> +	/* full black to bt709 */
>> +	ref.a = 0x0;
>> +	ref.r = 0x0; /* off by one in 16bpc not a big deal */
>> +	ref.g = 0x0;
>> +	ref.b = 0x0;
>> +
>> +	out.a = 0x0;
>> +	out.r = 0x0;
>> +	out.g = 0x0;
>> +	out.b = 0x0;
>> +
>> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
>> +
>> +	/* red 0 */
>> +	KUNIT_EXPECT_LT(test, out.r, 0x100);
>> +
>> +	/* green 0 */
>> +	KUNIT_EXPECT_LT(test, out.g, 0x0100);
>> +
>> +	/* blue 0 */
>> +	KUNIT_EXPECT_LT(test, out.b, 0x0100);
>> +
>> +	/* gray to bt709 */
>> +	ref.a = 0x0;
>> +	ref.r = 0x7fff; /* off by one in 16bpc not a big deal */
>> +	ref.g = 0x0;
>> +	ref.b = 0x0;
> 
> This ref does not seem to be used?
> 
>> +
>> +	out.a = 0x0;
>> +	out.r = 0x7fff;
>> +	out.g = 0x7fff;
>> +	out.b = 0x7fff;
>> +
>> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
>> +
>> +	/* red 127 */
>> +	KUNIT_EXPECT_GT(test, out.r, 0x7e00);
>> +	KUNIT_EXPECT_LT(test, out.r, 0x8000);
> 
> Maybe a new macro for "expect in between", or "expect with +/-
> tolerance"?
> 
> 
> Thanks,
> pq
> 
>> +
>> +	/* green 0 */
>> +	KUNIT_EXPECT_LT(test, out.g, 0x0100);
>> +
>> +	/* blue 0 */
>> +	KUNIT_EXPECT_LT(test, out.b, 0x0100);
>> +
>> +	/* == red 255 - bt709 enc == */
>> +	out.a = 0x0;
>> +	out.r = 0xffff;
>> +	out.g = 0x0;
>> +	out.b = 0x0;
>> +
>> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
>> +
>> +	/* red 54 */
>> +	KUNIT_EXPECT_GT(test, out.r, 0x3500);
>> +	KUNIT_EXPECT_LT(test, out.r, 0x3700);
>> +
>> +	/* green 0 */
>> +	KUNIT_EXPECT_LT(test, out.g, 0x0100);
>> +
>> +	/* blue 157 */
>> +	KUNIT_EXPECT_GT(test, out.b, 0x9C00);
>> +	KUNIT_EXPECT_LT(test, out.b, 0x9E00);
>> +
>> +
>> +	/* == green 255 - bt709 enc == */
>> +	out.a = 0x0;
>> +	out.r = 0x0;
>> +	out.g = 0xffff;
>> +	out.b = 0x0;
>> +
>> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
>> +
>> +	/* red 182 */
>> +	KUNIT_EXPECT_GT(test, out.r, 0xB500);
>> +	KUNIT_EXPECT_LT(test, out.r, 0xB780); /* laxed by half*/
>> +
>> +	/* green 0 */
>> +	KUNIT_EXPECT_LT(test, out.g, 0x0100);
>> +
>> +	/* blue 0 */
>> +	KUNIT_EXPECT_LT(test, out.b, 0x0100);
>> +
>> +	/* == blue 255 - bt709 enc == */
>> +	out.a = 0x0;
>> +	out.r = 0x0;
>> +	out.g = 0x0;
>> +	out.b = 0xffff;
>> +
>> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
>> +
>> +	/* red 18 */
>> +	KUNIT_EXPECT_GT(test, out.r, 0x1100);
>> +	KUNIT_EXPECT_LT(test, out.r, 0x1300);
>> +
>> +	/* green 111 */
>> +	KUNIT_EXPECT_GT(test, out.g, 0x6E00);
>> +	KUNIT_EXPECT_LT(test, out.g, 0x7000);
>> +
>> +	/* blue 0 */
>> +	KUNIT_EXPECT_LT(test, out.b, 0x0100);
>> +
>> +	/* == red 140 - bt709 enc == */
>> +	out.a = 0x0;
>> +	out.r = 0x8c8c;
>> +	out.g = 0x0;
>> +	out.b = 0x0;
>> +
>> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
>> +
>> +	/* red 30 */
>> +	KUNIT_EXPECT_GT(test, out.r, 0x1D00);
>> +	KUNIT_EXPECT_LT(test, out.r, 0x1F00);
>> +
>> +	/* green 0 */
>> +	KUNIT_EXPECT_LT(test, out.g, 0x100);
>> +
>> +	/* blue 87 */
>> +	KUNIT_EXPECT_GT(test, out.b, 0x5600);
>> +	KUNIT_EXPECT_LT(test, out.b, 0x5800);
>> +
>> +	/* == green 140 - bt709 enc == */
>> +	out.a = 0x0;
>> +	out.r = 0x0;
>> +	out.g = 0x8c8c;
>> +	out.b = 0x0;
>> +
>> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
>> +
>> +	/* red 30 */
>> +	KUNIT_EXPECT_GT(test, out.r, 0x6400);
>> +	KUNIT_EXPECT_LT(test, out.r, 0x6600);
>> +
>> +	/* green 0 */
>> +	KUNIT_EXPECT_LT(test, out.g, 0x100);
>> +
>> +	/* blue 0 */
>> +	KUNIT_EXPECT_LT(test, out.b, 0x100);
>> +
>> +
>> +	/* == blue 140 - bt709 enc == */
>> +	out.a = 0x0;
>> +	out.r = 0x0;
>> +	out.g = 0x0;
>> +	out.b = 0x8c8c;
>> +
>> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
>> +
>> +	/* red 30 */
>> +	KUNIT_EXPECT_GT(test, out.r, 0x900);
>> +	KUNIT_EXPECT_LT(test, out.r, 0xB00);
>> +
>> +	/* green 61 */
>> +	KUNIT_EXPECT_GT(test, out.g, 0x3C00);
>> +	KUNIT_EXPECT_LT(test, out.g, 0x3E00);
>> +
>> +	/* blue 0 */
>> +	KUNIT_EXPECT_LT(test, out.b, 0x100);
>> +
>> +}
>> +
>>  static struct kunit_case vkms_color_test_cases[] = {
>>  	KUNIT_CASE(vkms_color_test_get_lut_index),
>>  	KUNIT_CASE(vkms_color_test_lerp),
>>  	KUNIT_CASE(vkms_color_test_linear),
>>  	KUNIT_CASE(vkms_color_srgb_inv_srgb),
>> +	KUNIT_CASE(vkms_color_ctm_3x4_50_desat),
>> +	KUNIT_CASE(vkms_color_ctm_3x4_bt709),
>>  	{}
>>  };
>>  
>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>> index c278fb223188..4ead5346007a 100644
>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>> @@ -164,7 +164,7 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
>>  	}
>>  }
>>  
>> -static void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix)
>> +void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix)
>>  {
>>  	s64 rf, gf, bf;
>>  
> 

