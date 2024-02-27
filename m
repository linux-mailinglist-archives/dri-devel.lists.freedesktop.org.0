Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A65869635
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 15:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6180C10E62C;
	Tue, 27 Feb 2024 14:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XK4vBaj/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE26610E5CF;
 Tue, 27 Feb 2024 14:09:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPXo+GYKez6a5ZtmbfgjcnsZupAndd+vZoQ+HyHFu2Jm7IEiGmLr+gtANyWBe1G27KJcm6OybPo1HPHhf3Sbc+GFvCvpDjn3aCCfmJokn95bn9niJFix2FKJgyKHXRiO6jhjt5w7MLRmtN4Wbnu6Hed6EJPG3EmLY4A3fMnIBBj7tz+Y6bFiTz9+5BJQ32BTDPoG7ErT4cf9NZ4wwR+bL6ugyHaCHaLro4hZS7YCmP2/u0LFOQqmeEKsfH/Q4QLeVCz6Km5ytebEkm+dwjsaZV0UW/pgdJNF3MNw6qfa6OkGJp6tPC2IxFcoGjCAqAdacY9EC9dwhUbDLpZcfQgf5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUEzxEoiww4GJ6ihXxUFPXPZhtuBdLHMyEBZrmAY1+M=;
 b=lAuW814nX+FyzPUFQEnLIDP1sb8nI226nZ2Ybp/o80x/obJbXIuGsqOmTLk67u/hu8F696a3AZz6bOnPx5pGPyBWS2Vluc0L5mKrjiK3HWcNF4fkWTsPIuknWPeGveJZre4Mp3lPZ+VU8cZwJHi3IZc+imh1BRZFrww/Iil9v3Yx6Gmp7Qhvg58NDR4gqJOCwS6lW7J9JQyuDjko7SjfkfomU7etYPyHZnNo4pz7Z8/24AfxQjedYPMjEJEl3413+w0uK/q1aiKQGvkoj33fKQeE/kgR9eKhryH/BioAS6bg5tVlLWhUcJ7B2jAiPAlUpGM2AaBQOedfM3gjCg1jiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUEzxEoiww4GJ6ihXxUFPXPZhtuBdLHMyEBZrmAY1+M=;
 b=XK4vBaj/j0F0w0JErmgqUV4Goj4AoZSjdAt45CAeoyBVtrDC3xwnodd3WPg4RfC/NMch6HLEixXOz/9AED04+E2OH6YNehArZfrKOnStzROUH1Crk6qOJKT7XSz7oafERWfHRTpLrjM4J65Jb/YLaA3LBBYBDrCd2/+bF610f+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by LV3PR12MB9117.namprd12.prod.outlook.com (2603:10b6:408:195::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Tue, 27 Feb
 2024 14:09:05 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6c3b:75a3:6af2:8bf4]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6c3b:75a3:6af2:8bf4%5]) with mapi id 15.20.7316.035; Tue, 27 Feb 2024
 14:09:05 +0000
Message-ID: <90b761f1-74c3-44e3-b78f-983975c69f70@amd.com>
Date: Tue, 27 Feb 2024 09:09:00 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 06/42] drm/vkms: Add kunit tests for VKMS LUT
 handling
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org
References: <20240226211100.100108-1-harry.wentland@amd.com>
 <20240226211100.100108-7-harry.wentland@amd.com>
 <848f64f9-abc9-4ce3-a66b-65b513239ec7@riseup.net>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <848f64f9-abc9-4ce3-a66b-65b513239ec7@riseup.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::12)
 To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|LV3PR12MB9117:EE_
X-MS-Office365-Filtering-Correlation-Id: 80e2741a-eacb-47f5-6856-08dc379da750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FYEDRfMAbjjsK/yrnx8IsSd545JRAfHlai9QkQPJ9EzTpH94wTDh0zYdGySWJLVCfnV88/nu7XbLf6hial1jN9f+N5see1nlUAe25TLeyDQOve5Qj6bhlUvv+mpdhoFCbsSlWnqOaXlXjMJZX7/J1OnH23FCBRNhBODKrBlj9ZDYk/Lsu3rqze3wNvF3viV4OAu9UpKosbtSB0dB+4FAuFKZNChgWOqFGWkAwogdsC05qDTdXGuxs1Tho1p+hfIPRn2dIrGV2eCXqhllOP3BYB+TCE/WiB1+lpvhQwT3bTbumke0X4AjaR00CyMvFI6B3yAZsGyH8kMbOTl2ZAzblOvGLJZKsl/K/VoT65FHm1wHO7ersPPde9lJ9JIfZ5AF9daJ7snOjRSSC9jvzxvH9V8LrUzihYzShnDVAHjoLUxhDQMS1sRe5nupH99WOgf/m3GKgToh6GXuStIdA0nEDysd1D3T4cfjfj/6VgtaHlNuf8awwFTD5xyLr65pvcIFmlvKjslW7s8EK/mAEn19aXE2wVMpvpNVGBzB6SSiwNwThQ71KYN4j/OB3SOxv/esmSGcPkJPUwJOAwtKcT60BiO1gTjxKbgDaeXrP4L94Cv8xnVeVRGbyS1+iUmpLi88
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDFrcW9NdGJab2Z3c3l6QnBBU0pjKzRGZXBVbmdJK0RUS1c4Q1l2d0xZN2lZ?=
 =?utf-8?B?M29UYUNEV2ZvTU1lcTcrME5XTUltYnd3bnpQK0N3L3drOHRaUWgwTjBtWXhX?=
 =?utf-8?B?cFI5c05MdnV1UXF6UnNZMHlZVFZUL0dCZ3p1QjNRYVV6dHRrdlNrZW1vbnFC?=
 =?utf-8?B?Y1NDdlRtTUl1Mm4rNHZQNlJFdW1vNFkwbTdTcUdzS2NxS2NienhBOFZjK3ZP?=
 =?utf-8?B?YkNqSDFkcml5RWY5a3RBWEtndGd2R0dWMGVkNEpQcm12eEVnTkNsWEZaQXFl?=
 =?utf-8?B?U0R0L25CUlo1aTF6QVRPTlREcjY4akt4WFVrWFBFdHM5MlpRQnU2NjFtNHJO?=
 =?utf-8?B?dHJHeTcrcGxVeGxWYW9oRkF6SXV0Qm01Z0k1NE50c250MW5hYnVLQllOT1lN?=
 =?utf-8?B?S282TnNYdnJYdDBweXR3Q0JubnhOVlY0TXhvRE1yTDRqL0xOd3VyRUoreG8v?=
 =?utf-8?B?VEd0OW5LdElpMHN4QnNtWnJDenhWRkQvQVZNaXdNdXhzMEdaT2E5eWJCMG42?=
 =?utf-8?B?SDgwZUJ4Y0xuYUo5aXRSdWxNTGtHeGtBSGNyOW9SZGZlSDhReHg0K1NyWk5K?=
 =?utf-8?B?MlJQYWU3TUJKdi9mQ0M1eEVDaVhsaWhDdFBCSklLQnUySjNFZWV3amY0YmJ4?=
 =?utf-8?B?VHpzbW1BZVUzMW1PUGFDUm5QYjBzNHBBcHA1V3VMdnh1ZjU5aWMwdk5ZTm1N?=
 =?utf-8?B?UXFvMmpGdnBNU00zdmJHRXY3NVVzUE5TMlBJWm4wY0I3SXZTZ2JXMmYxOFNY?=
 =?utf-8?B?MFRlS25XT0ErekxRalBJbktSc2xSWm9mTW9YUXJTWk1qZWFSenFVUWs1Vits?=
 =?utf-8?B?TFRSZE5lODREQklkb2hZNG9iZ3R1SnpxN3VLeW5WTko5OWFxUzdRdWs4bzZQ?=
 =?utf-8?B?QkdOUCtja3YxRTU3dnRJY3RIbEhuM0JIVGo3dldLdkRRczFwZE5KQTVIMnA5?=
 =?utf-8?B?dDlQemZuR1ErR0FwaEIvVGlIWmVwMldYQ1YzOUdOVFpLVlgvTTVjVitPeXFl?=
 =?utf-8?B?MlB1R1BnQktRS244dzBmRnA5eGUvWForUEJYREdwZU5PWGoyRVpMVGlRc3g4?=
 =?utf-8?B?aXcyRkhsVFdZbm9FSUJ1L24yUTZOV1hGNGg1TGNzeDN4aXY2Yk1JWnBIRWJ6?=
 =?utf-8?B?Y3cvc1hVZFl3L0JPVnROcUpReWU3VmdBWlExN2xHbE1kOUNsdWFVNTFQR2l5?=
 =?utf-8?B?TGFHdjV1NGpPRDYrQ3VvOStoMEpEUjdrM1A0MkNYSEtSMUgzOE1hT0FCYlJB?=
 =?utf-8?B?T1ZNdHQvNHFmaDFwR0VXOEljNlNERllUSTJrSlk2cS9PMW1LblhmbXF5UWRo?=
 =?utf-8?B?VVJjby9lWEw0dkgzb0N2ei9VRURXL2twYWNoWnlJeEtFYzgrd3hKd0lLeW9s?=
 =?utf-8?B?T2MwcEdVTzhhRUV2djZsVkF0Q2NPMlY3cWNhRjBTVG1GdEM4blY3SGRhSE45?=
 =?utf-8?B?S21pRURTTlF5VUhDa3V3Yzg4UGxoZTRqOHVqNC9CN1dGTi9zeEx5UU14dHlH?=
 =?utf-8?B?MDlJVHpaQnJhclJwR2pDemllVkVuTVoxQUhPSXlvVHFNdjNWRnN5VUdHUk1s?=
 =?utf-8?B?b3Z0NXJ3MnlTQk5wOGNiQUV3RU1wSnlrNXVaYjJ6S0RVSGViUXVSaGlxRGZB?=
 =?utf-8?B?M1hYdUpJekIrMktDOHJhdk5GSS9CMnJvRjkzeHRwY0V2Y1dlSzc2a01pdmQ1?=
 =?utf-8?B?TmVFSk4zbUIyUGNrMnFqZ3BUMzNNZ1haenpqWHYrVExLSmpKQXpFMllOOEY2?=
 =?utf-8?B?NCtOclZieE5SQWlUWlUzQk0vT2JsNWlhZEdaT3o1bFhzcUpUcmI5amxiNHVR?=
 =?utf-8?B?MGZFMmRvZGR4cXhOb3RZaElXQitmRzY0dUpRNFRCYUMvMHFxUXo1YTBwVE44?=
 =?utf-8?B?Um5xN1JaRXN6bkEwVHpQSkhHS0JmM2dYalpncHFJcXl3a3p5anUvQXh5WjhT?=
 =?utf-8?B?WUVCWjR2M1JjV3dkS2V5WHN0VG1yZWxZMEVoUnlnWDE4MDFBMVREUEltK05E?=
 =?utf-8?B?NFNyQlFNVE9vdTRxQXd2Y0tvQWFzaElVbmhPOFhIV2tsVGM3bGpxVmlFV211?=
 =?utf-8?B?anZrV0xFNTVRaFV1NVd6VjZFZCtkMm90dEw1bjBtQS9MZ0ljMW1tNWo0UzIz?=
 =?utf-8?Q?hYE3ET97jWAxul5PZFgSDJRxN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e2741a-eacb-47f5-6856-08dc379da750
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 14:09:05.4442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cytSe5bKTtDNGZXXCxkt2KMC6RfYp704+lbqzAatWsG2WuTuIvFHtNVSj/gAmLGD4uLhVmFQ4PcitQgUUjrcHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9117
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2024-02-27 07:14, Arthur Grillo wrote:
> 
> 
> On 26/02/24 18:10, Harry Wentland wrote:
>> Debugging LUT math is much easier when we can unit test
>> it. Add kunit functionality to VKMS and add tests for
>>  - get_lut_index
>>  - lerp_u16
>>
>> v4:
>>  - Test the critical points of the lerp function (Pekka)
>>
>> v3:
>>  - Use include way of testing static functions (Arthur)
>>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Cc: Arthur Grillo <arthurgrillo@riseup.net>
>> ---
>>  drivers/gpu/drm/vkms/Kconfig                  |   5 +
>>  drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
>>  drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 163 ++++++++++++++++++
>>  drivers/gpu/drm/vkms/vkms_composer.c          |   8 +-
>>  4 files changed, 178 insertions(+), 2 deletions(-)
>>  create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
>>  create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_tests.c
>>
>> diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
>> index b9ecdebecb0b..c1f8b343ff0e 100644
>> --- a/drivers/gpu/drm/vkms/Kconfig
>> +++ b/drivers/gpu/drm/vkms/Kconfig
>> @@ -13,3 +13,8 @@ config DRM_VKMS
>>  	  a VKMS.
>>  
>>  	  If M is selected the module will be called vkms.
>> +
>> +config DRM_VKMS_KUNIT_TESTS
>> +	tristate "Tests for VKMS" if !KUNIT_ALL_TESTS
>> +	depends on DRM_VKMS && KUNIT
>> +	default KUNIT_ALL_TESTS
>> diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/vkms/tests/.kunitconfig
>> new file mode 100644
>> index 000000000000..70e378228cbd
>> --- /dev/null
>> +++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
>> @@ -0,0 +1,4 @@
>> +CONFIG_KUNIT=y
>> +CONFIG_DRM=y
>> +CONFIG_DRM_VKMS=y
>> +CONFIG_DRM_VKMS_KUNIT_TESTS=y
>> diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
>> new file mode 100644
>> index 000000000000..fc73e48aa57c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
>> @@ -0,0 +1,163 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +
>> +#include <kunit/test.h>
>> +
>> +#include <drm/drm_fixed.h>
>> +
>> +#define TEST_LUT_SIZE 16
>> +
>> +static struct drm_color_lut test_linear_array[TEST_LUT_SIZE] = {
>> +	{ 0x0, 0x0, 0x0, 0 },
>> +	{ 0x1111, 0x1111, 0x1111, 0 },
>> +	{ 0x2222, 0x2222, 0x2222, 0 },
>> +	{ 0x3333, 0x3333, 0x3333, 0 },
>> +	{ 0x4444, 0x4444, 0x4444, 0 },
>> +	{ 0x5555, 0x5555, 0x5555, 0 },
>> +	{ 0x6666, 0x6666, 0x6666, 0 },
>> +	{ 0x7777, 0x7777, 0x7777, 0 },
>> +	{ 0x8888, 0x8888, 0x8888, 0 },
>> +	{ 0x9999, 0x9999, 0x9999, 0 },
>> +	{ 0xaaaa, 0xaaaa, 0xaaaa, 0 },
>> +	{ 0xbbbb, 0xbbbb, 0xbbbb, 0 },
>> +	{ 0xcccc, 0xcccc, 0xcccc, 0 },
>> +	{ 0xdddd, 0xdddd, 0xdddd, 0 },
>> +	{ 0xeeee, 0xeeee, 0xeeee, 0 },
>> +	{ 0xffff, 0xffff, 0xffff, 0 },
>> +};
>> +
>> +const struct vkms_color_lut test_linear_lut = {
>> +	.base = test_linear_array,
>> +	.lut_length = TEST_LUT_SIZE,
>> +	.channel_value2index_ratio = 0xf000fll
>> +};
>> +
>> +
>> +static void vkms_color_test_get_lut_index(struct kunit *test)
>> +{
>> +	int i;
>> +
>> +	KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&test_linear_lut, test_linear_array[0].red)), 0);
>> +
>> +	for (i = 0; i < TEST_LUT_SIZE; i++)
>> +		KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&test_linear_lut, test_linear_array[i].red)), i);
>> +}
>> +
>> +static void vkms_color_test_lerp(struct kunit *test)
>> +{
>> +	/*** half-way round down ***/
>> +	s64 t = 0x80000000 - 1;
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x8);
>> +
>> +	/* odd a */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x8);
>> +
>> +	/* odd b */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x8);
>> +
>> +	/* b = a */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
>> +
>> +	/* b = a + 1 */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
>> +
>> +
>> +	/*** half-way round up ***/
>> +	t = 0x80000000;
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x8);
>> +
>> +	/* odd a */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x9);
>> +
>> +	/* odd b */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x8);
>> +
>> +	/* b = a */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
>> +
>> +	/* b = a + 1 */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
>> +
>> +	/*** t = 0.0 ***/
>> +	t = 0x0;
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x0);
>> +
>> +	/* odd a */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x1);
>> +
>> +	/* odd b */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x1);
>> +
>> +	/* b = a */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
>> +
>> +	/* b = a + 1 */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
>> +
>> +	/*** t = 1.0 ***/
>> +	t = 0x100000000;
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x10);
>> +
>> +	/* odd a */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x10);
>> +
>> +	/* odd b */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0xf);
>> +
>> +	/* b = a */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
>> +
>> +	/* b = a + 1 */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
>> +
>> +
>> +	/*** t = 0.0 + 1 ***/
>> +	t = 0x0 + 1;
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x0);
>> +
>> +	/* odd a */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x1);
>> +
>> +	/* odd b */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x1);
>> +
>> +	/* b = a */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
>> +
>> +	/* b = a + 1 */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
>> +
>> +	/*** t = 1.0 - 1 ***/
>> +	t = 0x100000000 - 1;
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x10);
>> +
>> +	/* odd a */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x10);
>> +
>> +	/* odd b */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0xf);
>> +
>> +	/* b = a */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
>> +
>> +	/* b = a + 1 */
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
>> +
>> +
>> +	/*** t chosen to verify the flipping point of result a (or b) to a+1 (or b-1) ***/
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x1, 0x80000000 - 1), 0x0);
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x1, 0x80000000), 0x1);
>> +}
>> +
>> +static struct kunit_case vkms_color_test_cases[] = {
>> +	KUNIT_CASE(vkms_color_test_get_lut_index),
>> +	KUNIT_CASE(vkms_color_test_lerp),
>> +	{}
>> +};
>> +
>> +static struct kunit_suite vkms_color_test_suite = {
>> +	.name = "vkms-color",
>> +	.test_cases = vkms_color_test_cases,
>> +};
>> +kunit_test_suite(vkms_color_test_suite);
>> +
>> +MODULE_LICENSE("GPL");
>> \ No newline at end of file
>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>> index e70cd473e3be..d178f2a400f6 100644
>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>> @@ -91,7 +91,7 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
>>  }
>>  
>>  // lerp(a, b, t) = a + (b - a) * t
>> -static u16 lerp_u16(u16 a, u16 b, s64 t)
>> +u16 lerp_u16(u16 a, u16 b, s64 t)
> 
> You don't need to do that, as already said on [1].
> 
>>  {
>>  	s64 a_fp = drm_int2fixp(a);
>>  	s64 b_fp = drm_int2fixp(b);
>> @@ -101,7 +101,7 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
>>  	return drm_fixp2int_round(a_fp + delta);
>>  }
>>  
>> -static s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
>> +s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
> 
> Same here.
> 
> [1]: https://lore.kernel.org/dri-devel/4df0cb7c-e738-4927-89ed-51a0e8bcac77@riseup.net/
> 

Oops, apologies. Somehow missed this when spinning the set.
static will be back in the next version.

Harry

> Best Regards,
> ~Arthur Grillo
> 
>>  {
>>  	s64 color_channel_fp = drm_int2fixp(channel_value);
>>  
>> @@ -429,3 +429,7 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>>  
>>  	return ret;
>>  }
>> +
>> +#ifdef CONFIG_DRM_VKMS_KUNIT_TESTS
>> +#include "tests/vkms_color_tests.c"
>> +#endif

