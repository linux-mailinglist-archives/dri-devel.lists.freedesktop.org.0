Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCFC8569AB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 17:38:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C0E10E9D0;
	Thu, 15 Feb 2024 16:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1OEDoDVg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222B210E9D0;
 Thu, 15 Feb 2024 16:38:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=beSd9xx6N0/5y8M3q3O3RHrAKuqZMfhOKWtpcwcbb7vR5c0J/x8v+ujdnMPmNtc4MUw3+5Nb9u/ndMY/dQ3rLhzN0O2TZza3YvM1Jy2CdAkjzMFFO1bzMehaKdDHlZK320qwpz0qU9UOriCcCz/SAKAveHlIde6QKF2yYVlyjXq+HVfVOyhIFoUgPLjwTOGH1C7Um4npJEQwlw67F/WPqGQHI1tCV1thjr61RbYyVyys4bHcmdn8fGH7iVfGVNfHcX3W24Ja48S+AiqDytu3TC8KBvqubfJX5Ek/aggUwLi1B62Plnl857Hutf2pCPRIR7W30TLRww9xkDkG1CNYNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3HuI5m0TcWxqwcvEn3JZTlzfYZzzQFX5Jo6aHJpKow=;
 b=Vp477Fl75szPjOCAIi1nXM1JvD8/R+p0BhN3BabSqPhwnTqKp/6I6r8EX0IzOqd1x3BEP2LeHf186Hb5RpRQAr03lFbaU+QH+1T5VCQ4YUBpF75uEuaxLyisjAvF08kAuq3AZv3fMBGQ1d8eKLUV6N4ECMNdfXy4hEVPDy4AhyxJrnAkeGWd4lR23rGxoS5vnks6elnb5wtADYV4NmaidzqBK1Iok/fZAAeeIqfKj45lBbE1tHny+ZY9YzW0WsmpsGh6libCjiyHfpGwHEukif2VQLZCVxIwtRaEowh4uhZsDS6x9ruFSIlnj5v+6lxoMEo8/iRtbOqoNd9huQyVXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3HuI5m0TcWxqwcvEn3JZTlzfYZzzQFX5Jo6aHJpKow=;
 b=1OEDoDVgHl0CKdNu2tVoXMtfHjig6RpjeB8+cSATw87qkzmMgoxrhmhcKmXYSMD24Dg3OxhJke69i1NGjLm6B82pc4Hfwzn8vvFhnmqUdNK4okrELdaVOU3OErrSfHY1AYjQ5FGJsE5Qq6bTtiwFtoqvyx5Lti7YExWOidYwDU8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH0PR12MB5300.namprd12.prod.outlook.com (2603:10b6:610:d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.28; Thu, 15 Feb
 2024 16:37:57 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3f6b:792d:4233:f994]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3f6b:792d:4233:f994%6]) with mapi id 15.20.7316.012; Thu, 15 Feb 2024
 16:37:57 +0000
Message-ID: <640e06ab-73f6-450a-97c2-8ef2e9ebe8b7@amd.com>
Date: Thu, 15 Feb 2024 11:37:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/5] Introduce drm sharpening property
Content-Language: en-US
To: Nemesa Garg <nemesa.garg@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20240214112457.3734871-1-nemesa.garg@intel.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Xaver Hugl <xaver.hugl@gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20240214112457.3734871-1-nemesa.garg@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::9) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH0PR12MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: d4e6a62b-0e32-4866-35f5-08dc2e4476fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ASCFXIPW9JO0lZu7e/pHHpdgCxTJpN2evbCBgt9MPQpr+cNWh21/FxLOKshM/TCJ2SlEF0sQS5wZu/DBftz86wDg1e4xBvtjN/84e47BEG/9e+e45v0V1ZafF2CefrfNgOEcpZQlX3mBoRr7TpywPXXd4KvHSvdnJpWkJAZCmV4s9wTC5yGOeW005od0xFwC/oTuENu02VbXuJIatnIL44lMAog5ah7UAKGcJktCkuuOO9Li7qchqZIWTtvASayCIVXb4NBSy9EFGMDFsgkN2wQOvEP4uecojxespKLrklkhjxLK/x75/Af+cGr2UOMQFGcE/aalPKhJaot9o29nqGMexS6eYjvLWySGDri5L68qfOZFhBko3jskIPAeGJMKla8w8Rzg+PH3fm5FZbzVXmLMEhf8ZbL7LYzrr2xd2RwhqUTOznoKLlMmPcHPOWTA/Pe5eGz61orxEk8rmv99vgT0W++HUqosFnhqsvpS3euZeUE2sHd6hcZ5BvS/MK4ASN3IzFuvQXp3O1WI+OUcFNM7LG4WrP9w1zFy/jLxI6DULLtYJWv2JqAF7l++o3a9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(6486002)(6512007)(53546011)(6506007)(6666004)(31686004)(2906002)(44832011)(54906003)(5660300002)(316002)(41300700001)(8676002)(66476007)(478600001)(66556008)(4326008)(66946007)(8936002)(26005)(36756003)(83380400001)(86362001)(31696002)(38100700002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjRzQmxQWFd2bEo5OEM3ZWwzT0NscTdVazBzRExRNmdCSEJObnlMU1hpb2hp?=
 =?utf-8?B?VXNRZk5Pa25ldFZwRzhCTUV5c1dkVHlHNTVXOGx2Z3lSWW45NEV4TEE0MGE3?=
 =?utf-8?B?a1JFRjZWM0Z3QUpINjM1M1phVEdVczNXSkppZUZLdytvZkdFNnFtR1VEbG0w?=
 =?utf-8?B?N2ltSkJKOGRwWU1Zc3M4U2ExVGlVM3JWZmZQUXU0S2g2eTI3RzN6K0VIYWZR?=
 =?utf-8?B?bW5tTjVoSkx0NHpmK3hQMzV3YnFiQVg5TjdQR1pvbmd5aVVQVGJSUjJRWHRP?=
 =?utf-8?B?Nk90SjM1OG55ZmgvYmlIZUJMRnFFa09yZSszMTlmNmxseVVBVEhkMmZJbXZ2?=
 =?utf-8?B?STYrcnpCOXpmQzlmalliYXdNajhjaGxJVnFQUk9LNCtsWXVQQmNnTnZNUS9z?=
 =?utf-8?B?d1hva0F0Sk53bktJTTYrVThxU21pVEd3NXlWV2E1NjdOcXQ2UW9oQmlabnB5?=
 =?utf-8?B?VUx0WVE4YStNK0tjeExtSHJZdWppWFBkemViblkzVXZHak5jNVhGT1ZWdG5F?=
 =?utf-8?B?MHR3M1o5UG9oeTZBSmNjZjA0UUY0b2RyaXh0Si85ZmxDaDJ3UFRzL3RjM1E2?=
 =?utf-8?B?OGxmSDNmbEhsUkYxU3QwamtOd3Z0akFMMW4zbEpNOVBTYncvMzc4eG5rbWRz?=
 =?utf-8?B?ZmRDS2hSUmszTFZFbVdhcW41eHhxTXhjZ1JVRmJ1SGdLbnozdG5peWsrc0xY?=
 =?utf-8?B?eTBUOHZ4RDlGYjNRd2Y4S0JhOGF3S1N1K3FudVRzTHVSam13YTZIdFdPSXR6?=
 =?utf-8?B?eFNTMXpZQjg2b3QzRzh2NTN2bVdBNzdKcVpENjFSMWFORkNJbDVqNDNLVkNN?=
 =?utf-8?B?UnE3OXZNOEQ5VUw3djdwUUNiWndsL2NNeC8zemQvVzFJUWRlS0x5ek9lV3Zu?=
 =?utf-8?B?bUcyNUVONXNEVUEydHo2NzJMSFk3RTA3aldMQzRvaWhUaEszbjVHbWFiaUha?=
 =?utf-8?B?WnF0azhWVC9jcjdYNEZTNmphdFdwbmVITEpHYVhDVW15c1UrTWdCNStmYmVJ?=
 =?utf-8?B?L0R1RGxTMHdKY0YxbDdGWE1ZcUM0cTFLOGN5UEVqS3d2WXBOUmhqbG9EL2E4?=
 =?utf-8?B?dWtKaEp3Y3F3MVo3a3dtM2diWXZUZlo1OXRFL0xaUHhjSVd3L2swcjNKRmZ5?=
 =?utf-8?B?M055M25aMDY1Y01ETWQ3azc4RzAxcml2QlNzYWVuSjJJYVI3MDEyQmJWTVRy?=
 =?utf-8?B?cWtnVVdUWElwZkkrcVAwVDdSWmZwYmZVQWZPSGRFeHFYb2p0Vlg1ZkE1RnV2?=
 =?utf-8?B?ODZ6T2taZFF2L00vb1NHaC9DenJEazhmTlR1UXViSmRqMk1XNUNOOGRnVmg4?=
 =?utf-8?B?WHArRUpGTHRJcGpJaTB5ZTFiUlJ4cjZtSFkzd1FTcmEzUnB6WjdkcWhzWDFF?=
 =?utf-8?B?SmRDUGNad1E3aUdMVGZROVhOTGRtUGRJVFZDVW1WSXRMY1QxeFloTDZ4d3V2?=
 =?utf-8?B?c0xDQmRGY0I5dXlLYS9iN3RRbXplWC9pT1ZQZDFmVkVydXVYNDZDL2J2eE82?=
 =?utf-8?B?dGxvL2lITG1XM1lPVlRqUW1weUh6K0NkMnZzZTNKOWdyVms4Q05mQndtR2Uy?=
 =?utf-8?B?NEpjeFBwWGluRS81Tks2amtPN0hMaGxpcXk4c1Z6T3ovTUhXYklXcDNqWDdC?=
 =?utf-8?B?d0xZaWdZZnZocklXWXpid2RzcHc2YVVaODRmUzZDUlhUVWZuMlpjNlNBVVpR?=
 =?utf-8?B?aGpGRVlEWTR1SDh2UUdOMzduNGxNTlI5bFZTT3BsVnkwNmFnVGwrdU4vQ2pw?=
 =?utf-8?B?ajlZUmRnczZDK0hGSEJkb21oUTVHaE5Bam1UVzFTK0w0UnduVnBSN1BQUVk1?=
 =?utf-8?B?VmpWQlROSk92Q0w0cTR3Zi90NHpmR01pUkNrZXZoeW9ja0JrY09XK3F2cVpY?=
 =?utf-8?B?Ull2QlVwT1BiVDNYVlQ0dUJyMVQ3cTYzZ1lkbnRmMlF6MzFxVlA2VFo3M1Mz?=
 =?utf-8?B?TTMxbjVxV3RFVGluNGhYdHZGMU4wWjQ0bTdES0tzNUY1NTI2dWxqdEtpN2Fz?=
 =?utf-8?B?U05oMGViQ2Q1RjFXNUlOcFF6dmFmTUQydytQMi9HWCtrOUpUanZzblEyUk5T?=
 =?utf-8?B?UUtScXJRbVRHNGlIbDh4TWlZVVV4NTFBZDhaS1I3a2lOYUpEYXJjbGsxdWVV?=
 =?utf-8?Q?qHGc5VCVFKBJqT/9iSXJ8lP4m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e6a62b-0e32-4866-35f5-08dc2e4476fb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 16:37:56.9977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EsX4cIjccpLSIjNwU3uYJyayoxfYl5DB84jS2mtU51AGYQFP2N75EIJKfatl3NQq6uKjwWp9U+aQAEo+x5CYbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5300
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

Adding a couple of compositor devs as they might be interested in this.

On 2024-02-14 06:24, Nemesa Garg wrote:
> 	Many a times images are blurred or upscaled content is also not as
> crisp as original rendered image. Traditional sharpening techniques often
> apply a uniform level of enhancement across entire image, which sometimes
> result in over-sharpening of some areas and potential loss of natural details. 
> 
> Intel has come up with Display Engine based adaptive sharpening filter 
> with minimal power and performance impact. From LNL onwards, the Display
> hardware can use one of the pipe scaler for adaptive sharpness filter.
> This can be used for both gaming and non-gaming use cases like photos,
> image viewing. It works on a region of pixels depending on the tap size.
> 
> This RFC is an attempt to introduce an adaptive sharpness solution which
> helps in improving the image quality. For this new CRTC property is added.

I don't think CRTC is the right place for this. Scaling tends to be more
of a plane thing. Planes can be scaled independently, or is that not the
case for Intel? Or does Intel HW do this sharpening operation independent
of any scaling, on the entire output?

> The user can set this property with desired sharpness strength value with
> 0-255. A value of 1 representing minimum sharpening strength and 255
> representing maximum sharpness strength. A strength value of 0 means no
> sharpening or sharpening feature disabled.
> It works on a region of pixels depending on the tap size. The coefficients
> are used to generate an alpha value which is used to blend the sharpened
> image to original image.
>  
> Userspace implementation for sharpening feature and IGT implementation
> is in progress.

It would be very helpful to have an idea how this looks in userspace, and
which compositors will implement this.

Harry

> 
> Nemesa Garg (5):
>   drm: Introduce sharpeness mode property
>   drm/i915/display/: Compute the scaler filter coefficients
>   drm/i915/dispaly/: Enable the second scaler
>   drm/i915/display/: Add registers and compute the strength
>   drm/i915/display: Load the lut values and enable sharpness
> 
>  drivers/gpu/drm/drm_atomic_uapi.c             |   4 +
>  drivers/gpu/drm/drm_crtc.c                    |  17 ++
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  drivers/gpu/drm/i915/display/intel_crtc.c     |   3 +
>  drivers/gpu/drm/i915/display/intel_display.c  |  20 +-
>  .../drm/i915/display/intel_display_types.h    |  11 +
>  .../drm/i915/display/intel_modeset_verify.c   |   1 +
>  .../drm/i915/display/intel_sharpen_filter.c   | 214 ++++++++++++++++++
>  .../drm/i915/display/intel_sharpen_filter.h   |  31 +++
>  drivers/gpu/drm/i915/display/skl_scaler.c     |  86 ++++++-
>  drivers/gpu/drm/i915/display/skl_scaler.h     |   1 +
>  drivers/gpu/drm/i915/i915_reg.h               |  19 ++
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  include/drm/drm_crtc.h                        |  17 ++
>  14 files changed, 416 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_sharpen_filter.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> 

