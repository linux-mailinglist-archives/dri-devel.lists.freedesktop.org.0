Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 932C89433BA
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 17:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6A610E66D;
	Wed, 31 Jul 2024 15:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Y/wdN8fF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD40E10E66C;
 Wed, 31 Jul 2024 15:55:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F6Zvwk4H9Z5bRKxh1V/5qAwCZojGvaGK2NwfFTHm0CNOXPunhW6xArqnI+FKmU6thU38uvvLY/wRbsWIpiD7irpFoF+SwDa1h11VQAEnpcNjOsY3HgPMcBHwkzw4YZH9oLYGHFkQKwu3PPX9z4IE7Z2W6uIDOl7Hg1k1Sw+YdseqQnbLz6EYwU6QHGF1A6BROl7Tw4GECuQX5M1qqYlL0OPuft9b8LyBzHnW9Z41uB7gZi/uGzvskNxG7ZqTdQzUmaOj5k3h+nu0IUKRM8jRSWu9ssDAh/25pMrSwn5Si16O1k4yefacSBR8UQ83C8ufW7xUcR5JpLnrX37PiF1U6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ucidmPPAvL5QK7QJ0lECeXqztqcqGFrEPyo2Q3k134=;
 b=iA+2fnrWfD4SV8pCY5QRsRCZTBTDg8w9pyKNozBSqvQBz6bpECb/RWopQg+z5iUW1qqHUSxRpaOrRsS7Q5rtLCvXMcjshS6eCe78QB9KQuuZ4oMCaZw3fGOtXgYOApWTsBD0X6sNBLG8JYyquDnSjD1HqMbJxLrlFgsev3Tp/RVs8CNWCKc7Uysd5lh0UBYQeREa90azaj/v2xEtJACm967S+cGl/ZNN3RH6+kqVbFIAaxrrkFJnQk2a/OFFwixcLHV567NYcw7z3gyZ9ikuRCDo61+wc/+yfPO44Yb9MvogftrbLkN9+2Uyk/IozG4HMgB9U+bPbDFySLCQSS/qTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ucidmPPAvL5QK7QJ0lECeXqztqcqGFrEPyo2Q3k134=;
 b=Y/wdN8fFqiU7cqWusse1PuB8AW0Ffhw1/7UQXbD0jrBfYbHJ2VtgewZyMs3/obKKycoBnQeZVkPLKV7h9dcZQVEgeFOf0aHVhXfT8QXa1fpNh1cF/W/O2BmU1T9dabPQ6zFmNa/kfiQxFZYovEpsRk5VrWVBqOm5JW7/Im5tKyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by PH7PR12MB8777.namprd12.prod.outlook.com (2603:10b6:510:26b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 15:55:43 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4%6]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 15:55:43 +0000
Message-ID: <14198501-4205-444c-8038-3004084ba288@amd.com>
Date: Wed, 31 Jul 2024 11:55:39 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/edid: add CTA Video Format Data Block support
To: Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Mark Broadworth <mark.broadworth@amd.com>, Karol Herbst <kherbst@redhat.com>
References: <20240730204520.282133-1-hamza.mahfooz@amd.com>
 <8734nqx8iw.fsf@intel.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <8734nqx8iw.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0150.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::7) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|PH7PR12MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a860f01-a230-47f6-3d4a-08dcb1793bfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDZEeElFL3dmeFU3NmluUGJRZ0lXRWZHNzk1NVYyZzR4Q1cwMWVZQ05KTUhD?=
 =?utf-8?B?OVEyamEwdHRTV2dPeXZqNUptUm5WQVJJZmpHakU3c2c2bmxZQUNTNzhSWFhi?=
 =?utf-8?B?M3NWSSs0L3hKbzUrZE1OdnhvajQzdXBROFJaZlRDNnBpbzVRSjJ6NW1iMW5F?=
 =?utf-8?B?TEt3NVRVYTNSTEEwRC90UmczTENIanRCb1craXlRZm5rUzNFUm11SGNjZzZX?=
 =?utf-8?B?TXJkWHVFekgybnBhakgxY1dIWTVkNm44dU9aeDBBZGdJVU9Dbk01MmRxVE1r?=
 =?utf-8?B?OExpMlpSU3N1SElFQmNnTDdjc3RtbUYydXdlZU4wNisvanhzeTlqRWFVRFNm?=
 =?utf-8?B?R29kUUtoNitNb0JSYjB3ZGFPZ0R1L29kQldxUEVGUmR3andYN2phVjQyZWI0?=
 =?utf-8?B?RHpjRlNURW0xaTlHZS8xN2JQaVNIa2NyNXBWQVBEQmhyMERHRGxJb2Iwekh2?=
 =?utf-8?B?WEl1ZWdYVndHeTBtMXFXOWZGRTF6dnBidU8rZFV2aVNaZG83N2o5OFVHcHp1?=
 =?utf-8?B?a2NYNlpGRW1SZklTNWFPMEtTYXlsemNVYWJaa3JYd1UydHVIK0I4aUxKUlNW?=
 =?utf-8?B?WTRWZUhOQlN6MVlxVUE2RHNVYzJHNXl0Rk9sUXMvbFJsTmZ4WEZYR0IrQXNS?=
 =?utf-8?B?eUxtTEFQN2Z4cTltL3FnRnhOUlBJdWQwUnBSSGJNQWorcmMrenhjdWJveUpD?=
 =?utf-8?B?SndwUll6L0xPNmNQYWxyZ2JVT1JicERjcnFMT1BGaWJOR2hkSmhod01zL3B3?=
 =?utf-8?B?b0tVSC9BN3FuY3ZWL1dkSjY1UHExTUh3bmRPNU9VOW0yZDk5bzhmRktlcVpK?=
 =?utf-8?B?ZUU4Z3RRSXNMOGtCM0dvMDd1WG9rNW9PY2cxTTNoVW8yeE1jUkJWTjBaT25X?=
 =?utf-8?B?czlXcmNYNFlJSzhBWEQ1K290RUpjNHpoRldEU055ODZkL3lsNEtYa0Rrd2Y3?=
 =?utf-8?B?Skc3VGdnOXJPZTBURUNvemptQU5qcXBOdDhSd0lMU1REbkNUZ0wrbVIrSGo1?=
 =?utf-8?B?ZWlxbXNZSE12azU3UHdkbmpOanU4Yyt5M2kxVEw5c3lVbm9ZV2hDQUpvUFJn?=
 =?utf-8?B?VUY1Z2t6QnZjVkN6VzJWRU91RC9LMUp1cGlPL2V5TXEvaWVTUVUreWpEMG14?=
 =?utf-8?B?bXBTWm1UZ0Z3Nm9NankvVkFMV3pTd1JlQ3FPeFBwNU1oMXNqUWpIUEZjLzFN?=
 =?utf-8?B?VTk2aFhBenN0WTRacUdWM2tJcW5mVFE4aXUwbkJxeTFhRE1QckY3T1VYM3Vn?=
 =?utf-8?B?dWNuaFB4MVowRHgrcTZvZTBpYjQraFQxTWZSTHNkemdpTGxVNzliSjJrZENp?=
 =?utf-8?B?SjBrYnRqdXhoaVRtUjVIaHJhUU5halh1RkthWWdQMGlKVndlYzF4OW9vQm5M?=
 =?utf-8?B?UWRwTFlnN2FQdzZVam1YYm42QUM2dEhXZElYSXRxczk1ZGJkc3FFZ2xDbU1R?=
 =?utf-8?B?Z3RUUTQzR3h5amg1ZTZrYkhyci91a0c0MHBxT1Y2UWloN21mRGNJdnFFKytK?=
 =?utf-8?B?S0JHZVFsdndkMnVmWmNoM0gxZDVtMWJwMlQ3RDI5eU1xQlVtaExuZDBGV0kr?=
 =?utf-8?B?dGV5QndMSXVKZkRpcVhRenhMeklGdFNsdmdxaklzTnJnZVRpdVdabk1UKzRG?=
 =?utf-8?B?TmI4NUc5Q016UUEyOWVNYitwZXNZSlZIRTAyMzNFeHNrM2MxdlFqUGxYcTlW?=
 =?utf-8?B?alJIbHdaU05iTEZ4cCsvZ0o3dFlKTUtRVzVtVmxNU3d1RlBXNFAvaU9uWTJH?=
 =?utf-8?Q?QJnejfJJ7zBvOFp4nw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6839.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmE2N2xRTm9GSlZ4RXBBR1h5MklMczRBSkRlQjFYYVRnM1N3cGJvNStTY3Br?=
 =?utf-8?B?RjV2amJNUHNSMmluQ25zN0lqam9HTFU0NkNreTRuM2lGWDdWL0xVZ0k1aEdE?=
 =?utf-8?B?dmdJWE04NmpOaElDZ1BZdHZmMk80WWFPVGRGM2poT05reUxkbEwrVXVQNDBM?=
 =?utf-8?B?alIraEdkUDlYUEJoZ29IcjR6ZzFmUWF5NC80R0ljdWNTRm5HMVJkSmpuZCtk?=
 =?utf-8?B?bGdUemk3MEVkMmtLWkpYTlp2SVd6R0tEZmVvTk4yVDRwdWxDWkZmdnpzZStB?=
 =?utf-8?B?TTh2STgvRUhNWUJKbmhFTkFQSU5abXZmeWM5MU9USmZaeHhtNG1vUUV3Ky9M?=
 =?utf-8?B?ZzJIdlpFblNpQjExNWNCSXpTYjUvK0tZRTZXZnBSLzVzRjZaczBHakxNbmdJ?=
 =?utf-8?B?SWEyekdkTVd4b1UrZVlhNkxLejBoV0FqbStlMTlrQkt4a0diWXFjQWJ6MTBw?=
 =?utf-8?B?SzdzbGFKN3p6d3k3ekhIdTZCbmZTMzhmUmtGYS84bnV0OXBHQzZwd2ZrQ1Q0?=
 =?utf-8?B?TWJDcy9Cak42bkRic3k2ODlvajhHWWdVQW5SU0RCRUgrQ1kyZE95MFFyeXFO?=
 =?utf-8?B?OG52ZDh1M2JRUXRHWjd0S0oxWTVQZE96OE43UFlHUFRrUjBXc1FaVVRwbDhy?=
 =?utf-8?B?Y29VTlU3RnJkQzR3YTlXblAxNWpyY2x5cjNEWmptSTloMXo5b1p5Y2JkNk5U?=
 =?utf-8?B?VHVMVFprSVAxWmd6bkZsVmlFM1hHYnFkUU9iR0V6SDZoUjNZU1l6YkVKSXpo?=
 =?utf-8?B?Qlk3WHFCaExtOXRvS0s4N0ZyRXlrUjhFTE8yNURlQ0EwK2VKYU9tUVZsdFZm?=
 =?utf-8?B?N0o1eG9kT1p2NDFrMTAwOFJQb0NEaVVUUHlEOFRocWl2Q0kwQ2UyYXBJVnVY?=
 =?utf-8?B?UnlYSVRDZXdaRmRzWFUwVjlFTEdpTlB1amZwRnlHSWlLUHVnckRXaEFkb2Z3?=
 =?utf-8?B?NzhScGRkYlhYUzlJVDU4RGJMdjhuQ0ptbTArQmJQNWRmVUdQeGJsektNeERZ?=
 =?utf-8?B?bEM3UmJ2ZUk1RFJMVklJUmlnTUZpWVpnNkpCVDd4bWx2MHZxcE02SCtHRjlH?=
 =?utf-8?B?VTByaUlrZ1M4VmF1aXNxNlF2WndLR1ErejJDd2o5OGpOSk1DV3d5a0tJZU1G?=
 =?utf-8?B?V3RoK1VuZ3BpbjF1bzZxOWlqWTJWQVZIOWJGNzNCekQxc1Q3WWdJbGJoUTdI?=
 =?utf-8?B?WVlyWlJEWEI3K3JUTjFYbnhhMy9ENkovdHFvenBJUlY4dmVKNXBBcUFiSEk0?=
 =?utf-8?B?QlVGdVUvZDd3ZHdmSTJwS3ZZOC9tQVBoSkdUb2JWb3RveGI2S0wrNXRtbDYz?=
 =?utf-8?B?d0pkTldoSXNoQWNzNnlTbXJHbFB2MEp3MSt0T1BWZEdTdGZzNno4WWU2MVEr?=
 =?utf-8?B?VXE2THQrYzVzbHZRbThiZDVEbG5NNDZsUURKcGdONU9JcDhReEhFNVA4NHhu?=
 =?utf-8?B?TEdRVWRvRnFjZHJad3lxRzNPU0I2b0szZ3NWTCszMlBJSk1keHFBdkpyUFd0?=
 =?utf-8?B?NkJwK2hZNzRRQmRZRHZnbzZnUkhIemk5OUNGOTkrc08wWGpxQU5tc3BsMERR?=
 =?utf-8?B?cFAzY1N3RlRXRFFuUE90d2VGSFVFT1dzclR5eWNlMkk2MjZyVGlaZ2tiWDVu?=
 =?utf-8?B?dTV1dktidVVrMkNQL3Y4eHJoTXJYaUxqN3I4TEgvbFR5dkpWcGIvdUlIYzJ3?=
 =?utf-8?B?eXdYRVJTRFR1QUNHbEpocElnWVFkVXVSRHRxaXEzTURhRHVraERsUjZXWEhJ?=
 =?utf-8?B?THZkdEoyMEVxQ0pGSW41a0Z2cDRkS2ZRb2l2ZWdOL0FkN3orVGdlekdVT3Bh?=
 =?utf-8?B?R0NUQXhMdmIvZmNEem1WR29FbXdYKzl0TWRLZjdqVGVFZG5NdHdJdW1TZUIx?=
 =?utf-8?B?dStYY0NIbTQyNkdFank3c1BSbmVRSTlVMFlLSThudkJHVWgwTFgxVnJiczJ2?=
 =?utf-8?B?aXZhRlZZeWE1STBlS0hZTGptM1AyR0FkNXZoaTVyakx6YS8yc3VXSmk4NXlw?=
 =?utf-8?B?QXdEdVk4NzNvdllVR1kwOU5kaGZmZnJtK0d3NHlpZGE1a09tUjdia2U4MjE3?=
 =?utf-8?B?dXJTV200cThiRW1sMGlvc2V6RWdsRGJzQWd1NkN4UWpXYVorY2VXdisvakRV?=
 =?utf-8?Q?fBBdgKFOQRjjKLz29VmoXQhtX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a860f01-a230-47f6-3d4a-08dcb1793bfc
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 15:55:43.6503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJ+MvjU+eWEtBya2S+S51YxooDMuWrUU1B7GP1j0HRJY581BqRQMN54SaCQXlW3zRieOTf/Di/rb/Mchm4IVfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8777
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

On 7/31/24 04:36, Jani Nikula wrote:
> On Tue, 30 Jul 2024, Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>> Video Format Data Blocks (VFDBs) contain the necessary information that
>> needs to be fed to the Optimized Video Timings (OVT) Algorithm.
>> Also, we require OVT support to cover modes that aren't supported by
>> earlier standards (e.g. CVT). So, parse all of the relevant VFDB data
>> and feed it to the OVT Algorithm, to extract all of the missing OVT
>> modes.
> 
> Is VFDB new to CTA-861-I? AFAICT the H version doesn't have it.

I believe it first appeared in CTA-861.6.

> 
> Is there any particular reason for the two step approach here? I mean
> first allocating and storing the modes in drm_parse_cea_ext() and then
> adding them in _drm_edid_connector_add_modes()? I think you could just
> as well do everything in the latter, without the complications of
> allocation. See e.g. add_cea_modes() which also iterates the CTA data
> blocks. I think this would simplify everything considerably.

It just seemed like the logical place to put it I guess. But looking at
it again, it would make more sense to just do everything in
_drm_edid_connector_add_modes().

> 
> Please find some additional comments inline. I'll do more when I've got
> hold of CTA-861-I.
> 
> BR,
> Jani.
> 
>>
>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1442
>> Suggested-by: Karol Herbst <kherbst@redhat.com>
>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>> ---
>>   drivers/gpu/drm/drm_edid.c  | 426 ++++++++++++++++++++++++++++++++++++
>>   include/drm/drm_connector.h |  12 +
>>   2 files changed, 438 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index f68a41eeb1fa..112a0070c4d5 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -31,6 +31,7 @@
>>   #include <linux/bitfield.h>
>>   #include <linux/byteorder/generic.h>
>>   #include <linux/cec.h>
>> +#include <linux/gcd.h>
>>   #include <linux/hdmi.h>
>>   #include <linux/i2c.h>
>>   #include <linux/kernel.h>
>> @@ -741,6 +742,93 @@ static const struct minimode extra_modes[] = {
>>   	{ 2048, 1536, 60, 0 },
>>   };
>>   
>> +struct cta_rid {
>> +	u16 hactive;
>> +	u16 vactive;
>> +	u8 hratio;
>> +	u8 vratio;
>> +};
>> +
>> +/* CTA-861-I Table 11 - Resolution Identification (RID) */
>> +static const struct cta_rid rids[] = {
>> +	/* RID 0-9 */
>> +	{ 0, 0, 0, 0 },
>> +	{ 1280, 720, 16, 9 },
>> +	{ 1280, 720, 64, 27 },
>> +	{ 1680, 720, 64, 27 },
>> +	{ 1920, 1080, 16, 9 },
>> +	{ 1920, 1080, 64, 27 },
>> +	{ 2560, 1080, 64, 27 },
>> +	{ 3840, 1080, 32, 9 },
>> +	{ 2560, 1440, 16, 9 },
>> +	{ 3440, 1440, 64, 27 },
>> +	/* RID 10-19 */
>> +	{ 5120, 1440, 32, 9 },
>> +	{ 3840, 2160, 16, 9 },
>> +	{ 3840, 2160, 64, 27 },
>> +	{ 5120, 2160, 64, 27 },
>> +	{ 7680, 2160, 32, 9 },
>> +	{ 5120, 2880, 16, 9 },
>> +	{ 5120, 2880, 64, 27 },
>> +	{ 6880, 2880, 64, 27 },
>> +	{ 10240, 2880, 32, 9 },
>> +	{ 7680, 4320, 16, 9 },
>> +	/* RID 20-28 */
>> +	{ 7680, 4320, 64, 27 },
>> +	{ 10240, 4320, 64, 27 },
>> +	{ 15360, 4320, 32, 9 },
>> +	{ 11520, 6480, 16, 9 },
>> +	{ 11520, 6480, 64, 27 },
>> +	{ 15360, 6480, 64, 27 },
>> +	{ 15360, 8640, 16, 9 },
>> +	{ 15360, 8640, 64, 27 },
>> +	{ 20480, 8640, 64, 27 },
>> +};
>> +
>> +/* CTA-861-I Table 12 - AVI InfoFrame Video Format Frame Rate */
>> +static const u16 cta_vf_fr[] = {
>> +	/* Frame Rate 0-7 */
>> +	0, 24, 25, 30, 48, 50, 60, 100,
>> +	/* Frame Rate 8-15 */
>> +	120, 144, 200, 240, 300, 360, 400, 480,
>> +};
>> +
>> +/* CTA-861-I Table 13 - RID To VIC Mapping */
>> +static const u8 rid_to_vic[][8] = {
>> +	/* RID 0-9 */
>> +	{},
>> +	{ 60, 61, 62, 108, 19, 4, 41, 47 },
>> +	{ 65, 66, 67, 109, 68, 69, 70, 71 },
>> +	{ 79, 80, 81, 110, 82, 83, 84, 85 },
>> +	{ 32, 33, 34, 111, 31, 16, 64, 63 },
>> +	{ 72, 73, 74, 112, 75, 76, 77, 78 },
>> +	{ 86, 87, 88, 113, 89, 90, 91, 92 },
>> +	{},
>> +	{},
>> +	{},
>> +	/* RID 10-19 */
>> +	{},
>> +	{ 93, 94, 95, 114, 96, 97, 117, 118 },
>> +	{ 103, 104, 105, 116, 106, 107, 119, 120 },
>> +	{ 121, 122, 123, 124, 125, 126, 127, 193 },
>> +	{},
>> +	{},
>> +	{},
>> +	{},
>> +	{},
>> +	{ 194, 195, 196, 197, 198, 199, 200, 201 },
>> +	/* RID 20-28 */
>> +	{ 202, 203, 204, 205, 206, 207, 208, 209 },
>> +	{ 210, 211, 212, 213, 214, 215, 216, 217 },
>> +	{},
>> +	{},
>> +	{},
>> +	{},
>> +	{},
>> +	{},
>> +	{},
>> +};
>> +
>>   /*
>>    * From CEA/CTA-861 spec.
>>    *
>> @@ -4140,6 +4228,7 @@ static int add_detailed_modes(struct drm_connector *connector,
>>   #define CTA_DB_VIDEO			2
>>   #define CTA_DB_VENDOR			3
>>   #define CTA_DB_SPEAKER			4
>> +#define CTA_DB_VIDEO_FORMAT		6
>>   #define CTA_DB_EXTENDED_TAG		7
>>   
>>   /* CTA-861-H Table 62 - CTA Extended Tag Codes */
>> @@ -4981,6 +5070,16 @@ struct cea_db {
>>   	u8 data[];
>>   } __packed;
>>   
>> +struct cta_vfd {
>> +	u8 rid;
>> +	u8 fr_fact;
>> +	bool bfr50;
>> +	bool fr24;
>> +	bool bfr60;
>> +	bool fr144;
>> +	bool fr48;
>> +};
>> +
>>   static int cea_db_tag(const struct cea_db *db)
>>   {
>>   	return db->tag_length >> 5;
>> @@ -6018,6 +6117,307 @@ static void parse_cta_vdb(struct drm_connector *connector, const struct cea_db *
>>   	}
>>   }
>>   
>> +/* CTA-861 Video Format Descriptor (CTA VFD) */
>> +static void parse_cta_vfd(const u8 *data, int vfd_len, struct cta_vfd *vfd)
> 
> It's customary for the destination parameter to be first.
> 
>> +{
>> +	vfd->rid = data[0] & 0x3f;
>> +	vfd->bfr50 = data[0] >> 7;
> 
> Looks like data[0] & 0x80. But then I don't have the spec yet.
> 
>> +	vfd->fr24 = !!(data[0] & 0x40);
>> +	vfd->bfr60 = vfd_len > 1 ? (data[1] >> 7) : 0x1;
> 
> Ditto. Why shift if you're only interested in the highest bit?
> 
>> +	vfd->fr144 = vfd_len > 1 ? !!(data[1] & 0x40) : 0x0;
>> +	vfd->fr_fact = vfd_len > 1 ? (data[1] & 0x3f) : 0x3;
>> +	vfd->fr48 = vfd_len > 2 ? !!(data[2] & 0x1) : 0x0;
> 
> All the !!'s are unnecessary for bool assignment.
> 
>> +}
>> +
>> +static bool vfd_has_fr(const struct cta_vfd *vfd, int rate_idx)
>> +{
>> +	static const u8 factors[6] = {
> 
> Unnecessary explicit arrays size.
> 
>> +		1, 2, 4, 8, 12, 16
>> +	};
>> +	u16 rate = cta_vf_fr[rate_idx];
>> +	u16 factor = 0;
>> +	unsigned int i;
>> +
>> +	switch (rate) {
>> +	case 24:
>> +		return vfd->fr24;
>> +	case 48:
>> +		return vfd->fr48;
>> +	case 144:
>> +		return vfd->fr144;
>> +	}
>> +
>> +	if (!(rate % 25)) {
>> +		if (!vfd->bfr50)
>> +			return false;
>> +
>> +		factor = rate / 25;
>> +	} else if (!(rate % 30)) {
>> +		if (!vfd->bfr60)
>> +			return false;
>> +
>> +		factor = rate / 30;
>> +	}
>> +
>> +	for (i = 0; i < ARRAY_SIZE(factors); i++)
>> +		if (factor == factors[i] && (vfd->fr_fact & (1 << i)))
>> +			return true;
>> +
>> +	return false;
>> +}
>> +
>> +#define OVT_PIXEL_CLOCK_GRANULARITY	1000		/* Hz */
>> +#define OVT_MIN_HTOTAL_GRANULARITY	8		/* pixels */
>> +#define OVT_MIN_VBLANK_DURATION	460000000	/* ps */
>> +#define OVT_MIN_VBLANK_LINES		20
>> +#define OVT_MIN_VSYNC_LEADING_EDGE	400		/* us */
>> +#define OVT_MIN_VSYNC_LE_LINES		14
>> +#define OVT_MIN_CLOCK_RATE_420		590000000	/* Hz */
>> +#define OVT_PIXEL_FACTOR_420		2
>> +#define OVT_MIN_HBLANK_444		80		/* pixels */
>> +#define OVT_MIN_HBLANK_420		128		/* pixels */
>> +#define OVT_MAX_CHUNK_RATE		650000000	/* Hz */
>> +#define OVT_AUDIO_PACKET_RATE		195000		/* Hz */
>> +#define OVT_AUDIO_PACKET_SIZE		32
>> +#define OVT_LINE_OVERHEAD		32
>> +#define OVT_HSYNC_WIDTH		32
>> +#define OVT_VSYNC_WIDTH		8
>> +
>> +/* OVT Algorthim as specified in CTA-861-I */
>> +static struct drm_display_mode *calculate_ovt_mode(const struct cta_rid *rid,
>> +						   u16 vrate,
>> +						   struct drm_device *dev)
> 
> Please pass around struct drm_connector if you have it, and as the
> context parameter it should be first.
> 
>> +{
>> +	u32 max_audio_packets_per_line;
>> +	struct drm_display_mode *mode;
>> +	u32 htotal_granularity_chunk;
>> +	u32 resolution_granularity;
>> +	u32 vtotal_granularity = 1;
>> +	u64 min_pixel_clock_rate;
>> +	u32 htotal_granularity;
>> +	u32 max_vrate = vrate;
>> +	u64 pixel_clock_rate;
>> +	u64 max_active_time;
>> +	u64 min_resolution;
>> +	u32 vsync_position;
>> +	u32 min_line_time;
>> +	u32 min_line_rate;
>> +	u32 min_hblank;
>> +	u32 min_htotal;
>> +	u32 min_vblank;
>> +	u32 min_vtotal;
>> +	u32 htotal;
>> +	u32 vtotal;
>> +	u32 h;
>> +	u64 r;
>> +	u32 v;
> 
> There's something wrong with *any* function that has this many local
> variables.

Ya, I find it unsetteling as well, but if you read Annex U, all of these
variables are found there. So, I'm not sure how we would keep this
function readable without all of these variables.

> 
>> +
>> +	/* step 1 */
>> +	switch (vrate) {
>> +	case 24:
>> +	case 25:
>> +		max_vrate = 30;
>> +		fallthrough;
>> +	case 30:
>> +		vtotal_granularity = 20;
>> +		break;
>> +	case 48:
>> +	case 50:
>> +		max_vrate = 60;
>> +		fallthrough;
>> +	case 60:
>> +		vtotal_granularity = 20;
>> +		break;
>> +	case 100:
>> +		max_vrate = 120;
>> +		fallthrough;
>> +	case 120:
>> +		vtotal_granularity = 5;
>> +		break;
>> +	case 200:
>> +		max_vrate = 240;
>> +		fallthrough;
>> +	case 240:
>> +		vtotal_granularity = 5;
>> +		break;
>> +	case 300:
>> +		max_vrate = 360;
>> +		fallthrough;
>> +	case 360:
>> +		vtotal_granularity = 5;
>> +		break;
>> +	case 400:
>> +		max_vrate = 480;
>> +		fallthrough;
>> +	case 480:
>> +		vtotal_granularity = 5;
>> +		break;
>> +	}
>> +
>> +	/* step 2 */
>> +	max_active_time = ((u64)1000000000000 / (u64)max_vrate) -
>> +		(u64)OVT_MIN_VBLANK_DURATION;
>> +
>> +	min_line_time = max_active_time / (u64)rid->vactive;
>> +
>> +	min_vblank = max_t(u64, (u64)OVT_MIN_VBLANK_LINES,
>> +			   DIV64_U64_ROUND_UP(OVT_MIN_VBLANK_DURATION,
>> +					      min_line_time));
>> +
>> +	min_vtotal = rid->vactive + min_vblank;
>> +
>> +	if (min_vtotal % vtotal_granularity)
>> +		min_vtotal += vtotal_granularity - (min_vtotal %
>> +						    vtotal_granularity);
>> +
>> +	/* step 3 */
>> +	min_line_rate = max_vrate * min_vtotal;
>> +
>> +	max_audio_packets_per_line = DIV_ROUND_UP(OVT_AUDIO_PACKET_RATE,
>> +						  min_line_rate);
>> +
>> +	/* step 4 */
>> +	min_hblank = OVT_LINE_OVERHEAD + OVT_AUDIO_PACKET_SIZE *
>> +		max_audio_packets_per_line;
>> +
>> +	min_htotal = rid->hactive + max(OVT_MIN_HBLANK_444, min_hblank);
>> +
>> +	min_pixel_clock_rate = max_vrate * min_htotal * min_vtotal;
>> +
>> +	htotal_granularity_chunk =
>> +		roundup_pow_of_two(DIV_ROUND_UP(min_pixel_clock_rate,
>> +						OVT_MAX_CHUNK_RATE));
>> +
>> +	htotal_granularity = max(OVT_MIN_HTOTAL_GRANULARITY,
>> +				 htotal_granularity_chunk);
>> +
>> +	if (min_htotal % htotal_granularity)
>> +		min_htotal += htotal_granularity - (min_htotal %
>> +						    htotal_granularity);
>> +
>> +	resolution_granularity = OVT_PIXEL_CLOCK_GRANULARITY /
>> +		gcd(OVT_PIXEL_CLOCK_GRANULARITY, max_vrate);
>> +
>> +	for (;;) {
>> +		/* step 5 */
>> +		min_resolution = 0;
>> +		v = min_vtotal;
>> +
>> +		for (;;) {
> 
> Not a fan of loops without clear loop conditions, let alone two of them
> nested! It's really hard to figure out this is guaranteed to stop.
> 
>> +			h = min_htotal;
>> +			r = (u64)h * (u64)v;
>> +
>> +			if (min_resolution && r > min_resolution)
>> +				break;
>> +
>> +			while (r % resolution_granularity ||
>> +			       max_vrate * r / (h & ~(h - 1)) >
>> +			       OVT_MAX_CHUNK_RATE) {
>> +				h += htotal_granularity;
>> +				r = (u64)h * (u64)v;
>> +			}
>> +
>> +			if (!min_resolution || r < min_resolution) {
>> +				htotal = h;
>> +				vtotal = v;
>> +				min_resolution = r;
>> +			}
>> +
>> +			v += vtotal_granularity;
>> +		}
>> +
>> +		pixel_clock_rate = max_vrate * min_resolution;
>> +
>> +		/* step 6 */
>> +		min_htotal = rid->hactive + max(OVT_MIN_HBLANK_420,
>> +						OVT_PIXEL_FACTOR_420 *
>> +						min_hblank);
>> +		if (pixel_clock_rate >= OVT_MIN_CLOCK_RATE_420 &&
>> +		    htotal < min_htotal)
>> +			continue;
>> +
>> +		break;
>> +	}
>> +
>> +	/* step 7 */
>> +	vtotal = vtotal * max_vrate / vrate;
>> +
>> +	/* step 8 */
>> +	vsync_position = max(OVT_MIN_VSYNC_LE_LINES,
>> +			     DIV64_U64_ROUND_UP((u64)OVT_MIN_VSYNC_LE_LINES *
>> +						(u64)pixel_clock_rate,
>> +						(u64)htotal * (u64)1000000));
>> +
>> +	mode = drm_mode_create(dev);
>> +
>> +	if (!mode)
>> +		return NULL;
>> +
>> +	mode->clock = pixel_clock_rate / 1000;
>> +	mode->hdisplay = rid->hactive;
>> +	mode->hsync_start = htotal - OVT_HSYNC_WIDTH * 2;
>> +	mode->hsync_end = mode->hsync_start + OVT_HSYNC_WIDTH;
>> +	mode->htotal = htotal;
>> +
>> +	mode->vdisplay = rid->vactive;
>> +	mode->vsync_start = vtotal - vsync_position;
>> +	mode->vsync_end = mode->vsync_start + OVT_VSYNC_WIDTH;
>> +	mode->vtotal = vtotal;
>> +
>> +	return mode;
>> +}
>> +
>> +/* CTA-861 Video Format Data Block (CTA VFDB) */
>> +static void parse_cta_vfdb(struct drm_connector *connector,
>> +			   const struct cea_db *db)
>> +{
>> +	struct drm_display_info *info = &connector->display_info;
>> +	int vfdb_len = cea_db_payload_len(db);
>> +	int vfd_len = (db->data[0] & 0x3) + 1;
> 
> What if payload len is 0?
> 
>> +	struct drm_display_mode **modes;
>> +	struct drm_display_mode *mode;
>> +	struct cta_vfd vfd;
>> +	int mode_index = 0;
>> +	int i;
>> +	int j;
>> +
>> +	if (!(vfdb_len - 1) || (vfdb_len - 1) % vfd_len)
>> +		return;
> 
> Better to check for vfd_len < some minimum.
> 
> I'd usually not require the modulo is zero, just take as many whole
> vfd's as there are, and ignore the rest.
> 
>> +
>> +	modes = krealloc_array(info->ovt_modes, ((vfdb_len - 1) / vfd_len) *
>> +			       (ARRAY_SIZE(cta_vf_fr) - 1),
>> +			       sizeof(*info->ovt_modes), GFP_KERNEL);
>> +
> 
> I really hope we can get rid of this.
> 
>> +	if (!modes)
>> +		return;
>> +
>> +	for (i = 1; i < vfdb_len; i += vfd_len) {
>> +		parse_cta_vfd(&db->data[i], vfd_len, &vfd);
>> +
>> +		if (!vfd.rid || vfd.rid >= ARRAY_SIZE(rids))
>> +			continue;
>> +
>> +		for (j = 1; j < ARRAY_SIZE(cta_vf_fr); j++) {
>> +			if (!vfd_has_fr(&vfd, j) ||
>> +			    (cta_vf_fr[j] < 144 && rid_to_vic[vfd.rid][j - 1]))
>> +				continue;
>> +
>> +			mode = calculate_ovt_mode(&rids[vfd.rid], cta_vf_fr[j],
>> +						  connector->dev);
>> +
>> +			if (!mode)
>> +				continue;
>> +
>> +			mode->height_mm = info->height_mm;
>> +			mode->width_mm = info->width_mm;
>> +
>> +			info->ovt_modes[mode_index++] = mode;
>> +		}
>> +	}
>> +
>> +	info->num_ovt_modes = mode_index;
>> +}
>> +
>>   /*
>>    * Update y420_cmdb_modes based on previously parsed CTA VDB and Y420CMDB.
>>    *
>> @@ -6439,6 +6839,8 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>>   			parse_cta_vdb(connector, db);
>>   		else if (cea_db_tag(db) == CTA_DB_AUDIO)
>>   			info->has_audio = true;
>> +		else if (cea_db_tag(db) == CTA_DB_VIDEO_FORMAT)
>> +			parse_cta_vfdb(connector, db);
>>   	}
>>   	cea_db_iter_end(&iter);
>>   
>> @@ -6585,6 +6987,7 @@ static void drm_update_mso(struct drm_connector *connector,
>>   static void drm_reset_display_info(struct drm_connector *connector)
>>   {
>>   	struct drm_display_info *info = &connector->display_info;
>> +	int i;
>>   
>>   	info->width_mm = 0;
>>   	info->height_mm = 0;
>> @@ -6611,6 +7014,13 @@ static void drm_reset_display_info(struct drm_connector *connector)
>>   	info->mso_pixel_overlap = 0;
>>   	info->max_dsc_bpp = 0;
>>   
>> +	for (i = 0; i < info->num_ovt_modes; i++)
>> +		drm_mode_destroy(connector->dev, info->ovt_modes[i]);
>> +
>> +	kfree(info->ovt_modes);
>> +	info->ovt_modes = NULL;
>> +	info->num_ovt_modes = 0;
>> +
> 
> I really hope we can get rid of this.
> 
>>   	kfree(info->vics);
>>   	info->vics = NULL;
>>   	info->vics_len = 0;
>> @@ -6849,6 +7259,21 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
>>   	return num_modes;
>>   }
>>   
>> +static int add_ovt_modes(struct drm_connector *connector)
>> +{
>> +	struct drm_display_info *info = &connector->display_info;
>> +	int i;
>> +
>> +	for (i = 0; i < info->num_ovt_modes; i++) {
>> +		drm_mode_probed_add(connector, info->ovt_modes[i]);
>> +		info->ovt_modes[i] = NULL;
>> +	}
>> +
>> +	info->num_ovt_modes = 0;
>> +
>> +	return i;
>> +}
>> +
>>   static int _drm_edid_connector_add_modes(struct drm_connector *connector,
>>   					 const struct drm_edid *drm_edid)
>>   {
>> @@ -6872,6 +7297,7 @@ static int _drm_edid_connector_add_modes(struct drm_connector *connector,
>>   	 *
>>   	 * XXX order for additional mode types in extension blocks?
>>   	 */
>> +	num_modes += add_ovt_modes(connector);
> 
> Why first?
> 
>>   	num_modes += add_detailed_modes(connector, drm_edid);
>>   	num_modes += add_cvt_modes(connector, drm_edid);
>>   	num_modes += add_standard_modes(connector, drm_edid);
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index 5ad735253413..35b5eb344ea8 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -829,6 +829,18 @@ struct drm_display_info {
>>   	 */
>>   	u32 max_dsc_bpp;
>>   
>> +	/**
>> +	 * @ovt_modes: Array of @num_ovt_modes OVT modes. Internal to EDID
>> +	 * parsing.
>> +	 */
>> +	struct drm_display_mode **ovt_modes;
>> +
>> +	/**
>> +	 * @num_ovt_modes: Number of elements in @ovt_modes. Internal to EDID
>> +	 * parsing.
>> +	 */
>> +	int num_ovt_modes;
>> +
> 
> I really hope we can get rid of this.
> 
>>   	/**
>>   	 * @vics: Array of vics_len VICs. Internal to EDID parsing.
>>   	 */
> 
-- 
Hamza

