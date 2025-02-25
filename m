Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F9CA44345
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 15:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0240F10E6F2;
	Tue, 25 Feb 2025 14:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZC2fizmc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2045.outbound.protection.outlook.com [40.107.100.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5808E896EC;
 Tue, 25 Feb 2025 14:44:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DAUuLzG71V3/CaJCNkAUg027+KkvreeuXyYP9c+FmSFILTG9TftqVVRIjWpk3Gl7G08lnLN5yjPrLagnapM9Ch8gVa2ruWY+L9bUoTqS44bL45GoNm8quiuZufZ4THOpMHucI7WsaYn0yGlGI0JJRk/A6IMhhu3JEDaPDxu8qXOa4sS3vUcuLMEkpDr0JKVckYG6mgxkBwZ3d6ngYyIbHFKfKpU+tJufq7gpB6VWhWtOrOdiXeiB7bZE2/d3AMY/tGWXf0SrUcek2wfY+K8VzcwdMS1kGg6R0g7tOas0pIbRe5GqngkuMXd6tOJX72KWeGixEtsEjdpHxJEH+cqBDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwIUS4lMWry6z52lnMG2fI1kbLqF+BDy960BGGBcZGo=;
 b=MUL0Tv1BkoAuQo1EXS2UIRqdIUrp/MBZOwwQgIRiBq5d1UnKKcV2DRRKkS3v3uq5hpSaFyWAlK579DXlTsYkt//XwEh8grRM9TePHQB+bvnPmONdZxN9QX2wV9+FyQbOSRxBIqnYGbyrBInc4+Q30LTzyZ5rqxO9Q/yTxzOF3gN7ugOCt6Im6G6jizaEk61DY401D/6MCVUN8VFaxy71HHKKsjsdZx+n3BCjPZfRUhqI3OkegmXQKUzCOV4G0wg7XZDqoqgNYLokn2aBa0qjtzIoPD+npFJkrs7hamULuLeKmRQgP1gLJyEoGsYG2dra5QuXCnH15X6WqIJUvb9xjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwIUS4lMWry6z52lnMG2fI1kbLqF+BDy960BGGBcZGo=;
 b=ZC2fizmcMBJKOP18TR39RHaC1apaPsY2X1rWl4gYVCNb3VY/JrJ6CmAIGdQuluawWODhNiR1fMyQ9XzxdYnXCFrVJZggOflrIRRaodcB+3YA+M0yVuFSinvwTQwNaMLwXEthPcnx7xNxzeRFnzgDtJyWPij3ox19kZMNQIUXZtE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA1PR12MB9499.namprd12.prod.outlook.com (2603:10b6:208:595::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 14:43:58 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8466.020; Tue, 25 Feb 2025
 14:43:58 +0000
Message-ID: <1a523721-0228-4ed4-932e-ad4bcf317ff5@amd.com>
Date: Tue, 25 Feb 2025 09:43:55 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 02/45] drm/vkms: Round fixp2int conversion in lerp_u16
To: Louis Chauvet <louis.chauvet@bootlin.com>, Simon Ser <contact@emersion.fr>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-3-alex.hung@amd.com>
 <99a8779c-bb1c-44fc-b8a3-56ea80425c15@bootlin.com>
 <sumH-jMWxEB0ReC-xhqT2YbATq4l_TMfU2_ogO2tyM7iYG5Fp0XM7guLPCcUOuxW6uLW1YOoTNegOUOJVGiWYDxGaaGcXNjA5eZ8axRgl8E=@emersion.fr>
 <f307f2d3-44e4-45bf-ba94-57459043b7a6@bootlin.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <f307f2d3-44e4-45bf-ba94-57459043b7a6@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::44) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA1PR12MB9499:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6de1da-af04-489a-a7dd-08dd55aad642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2V5NjZvcFFKSVJMTis3WHpwb0o3cVkwVHVpU0NhM3lrb3lDeERmNmtNRGhB?=
 =?utf-8?B?cExFcWZNaDUzVFIzS0RNTXBock9OOXFmbFVwTmtXNGZRc05zd3ZvQitaRjZW?=
 =?utf-8?B?YkJLeUFxQ2hzTDNodVkyZVhhQ2FhVXpkZU52djhOYmwwMUZ6Tm5LMjcxVk5Y?=
 =?utf-8?B?ci9pRWhaLzdBYVdGQUpTenRnZ3BLUjc4bUIrZHlNSkExNGhFWm05YmgxWS8w?=
 =?utf-8?B?RGZweGgwT1c5SFkwTlhuYTluN04yU25GOWwxaElvemZ1T0F3SjFHQjkvaDM5?=
 =?utf-8?B?TllJRXE4RDlwa01hQTVRRnBjMXUydFgyUnJJNUpzaW9tYnJzS1pnRzEyck90?=
 =?utf-8?B?Q2cwVitobXZWRUVPUm5IWS84YlJ3c2Q1ZnhiQlJlb2UrTUdObGFuczB3TXVC?=
 =?utf-8?B?NkFBZ1F0eDdDZFMyWGxjN0xna0F2ZStPUkJXU3ZsYWQ4b0xvM1ZHcFdDSXRM?=
 =?utf-8?B?MjUyckZtYmo1WnI5cGF5VUNHRUFOaWhpT3hlTHdWT00xdGZ4V01OOEEzdGJo?=
 =?utf-8?B?Q01NVThXMERpY2daNTRKTGo2TThVbEkvZS8vSGI0cVpQbThNRW5TZjVGS3hV?=
 =?utf-8?B?L0hmMUhtSGpGSW15b3ZveEM5em9LYkpOSUZDS1hEMEhzWnJRSlpiTVgyTEVi?=
 =?utf-8?B?Q0xaQnhsZENTTjJMQUdNTlBHM3BGdUFzVm1Wdld0R1Y1UWVWQnZ4S0QwZFJo?=
 =?utf-8?B?ZmlFQVVXMHFEclpBaWJZdWFyKzlzSm92TWdTOXZEeWN3TnVNMkRuOUtjbFFI?=
 =?utf-8?B?bkRxY1p0WWFhMHMvTmhOUCtuWWJpVVo0ODJ1dHN4S2VOazdvT3lSTW9OVFFF?=
 =?utf-8?B?OEZZL1RpSXFiZDlBdnFuSXVLNnVJUks4WllIRjdPYk5aYjFOT2VVY0ZZUThj?=
 =?utf-8?B?UTFKQ0dYVDFLekxPQlY3SWtET296MWpEZ0ZQS29JOFdoMGJzS1pnVGNjSWUz?=
 =?utf-8?B?b1l4RUMvM3Y5Vk5NUEVvVlAvZ0pOMVJwUFlGNjluT0NTK0FudEQ3MVovVTc2?=
 =?utf-8?B?OFFxRFBVRktkMGQ5L25VZ1pZZDB4ZlJ6L2NrZjl4VjM0YmxCV2trbjkrRHg5?=
 =?utf-8?B?cE50SjBING1rdnc4azh0aHhRUU9GSkY4eUVXWWxLRFlLYjBrNzlCRElaMXFz?=
 =?utf-8?B?QktpSzVaMnVKdmpsQVBXOTdmMGRRdW5kbFZ3RXV2MUQwZERma0VCaFQvOVc4?=
 =?utf-8?B?TWoxak9SUFFFVFVHcUszTG4zTFNkNjF6ZmMyN24wUkQxRTk4TlN1WHRXY2ll?=
 =?utf-8?B?enhudC9vaDAzQmxwbVhTa1RCNjlkVTQ1WG55dnpkQnNMTVFFZW0rQmoyamFW?=
 =?utf-8?B?czlXaVVOc2pJbXc4aCt4TWZCamJydFZLZnFSZzM3c1EvYmZmM3V4ZzlvZWV4?=
 =?utf-8?B?V3JqVStQaHRNcVVQMnRzeVZxY2h0Nm5wcWVHN0dNckRXVlMvMCtIRHV0MHd2?=
 =?utf-8?B?WmhqdGZNdmVtTUNLZFVpRlA1RDZsYnRaN1Z5S3M2a1pPL3BOTDRMMmRqVFJX?=
 =?utf-8?B?bkc1akYxMVpESXBhRUNGcVp1MlNnSERyRjI5TE9qTHFxY094NFhYbUt1NGcv?=
 =?utf-8?B?SU5YTnZ1RkdQeElla0R6V3hyUUpaRFpUcGIyNnRHcUF5UGtGYzZCM0kxTlh6?=
 =?utf-8?B?SU9uQUJvcTE2Z21ZTDdpSDJUVk9MRXUxZzZZeTVzYm93aXRBd2VZVnpCTjBO?=
 =?utf-8?B?VUYva2pzaGpoci9JWnRhSlpOSHE4a1ptMldFemd5aVVuVTBrdkd3ZDhaQzZL?=
 =?utf-8?B?SjQyVStJQXpTdE5jNXhNR21sOURJYkZZbjN6OUZidk82WmlUQXl4ZVNRQVVm?=
 =?utf-8?B?RFA4TU05TzZ3YmkvR0RKZjFMWUp6VWJhMGJnM3pnL1JKdFZSZnAvblZVemxm?=
 =?utf-8?Q?LNpBcmGN447jR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDVrMFRZSWtES0pRN2x4UmRudmREcUZlbWJ2Sjdqc3I0Qk1ZSms0SlBjaEx3?=
 =?utf-8?B?RlViWEd4OXlKTnpSM0VPc0hPRmRiL1AvazJvUHBvbm1ZSmlydG9IbzZuTzQ1?=
 =?utf-8?B?WW9VenAyN1RyRWFld2RFK0Q4UHpQSzBEVEpzNEwwbVFDNGNnbEVFWExCTDRM?=
 =?utf-8?B?Z3NaTU9HdmpFUUF3SXNxbGxma0liaXVydlFQWlJHY2FWc0NGQWhQSVhVRzRy?=
 =?utf-8?B?Y2l1WDh4KzcvcWsyVWFVYUFvWmZXQjB2NjBYUjlHQnFrSk5ZZDVMd250NUQx?=
 =?utf-8?B?Z2dMenp5VmY4Q005eXc4NE5VQjA5ZUxxNEhnbHlsdElmd0U3NTdKbkJib1Jm?=
 =?utf-8?B?dnJ6OXhwMTR5QVlYZVZ5Wk53TEY0YVlFT2tITWRiWHRldm9EMDlzRlUwNXVW?=
 =?utf-8?B?OVhCa3JHTm11SEc5cTVYREJCa1d5ZDVFZEVmWjlRc2ROVXpqTDBZMTEzRlN2?=
 =?utf-8?B?eGZKNGlVbXpsa29qM1FKLzhFSm91MGdXeGZxQk85bDNGSnZjQXBOOEtzSGlG?=
 =?utf-8?B?SmlhQThJUitkNmUxK3o1RHhaYU1zSGRZdmd6MWd6V1krNG8wK05Ta0puTHlV?=
 =?utf-8?B?UGMrUVU5dStsb0wvL1V6R1Y1SHlsaWp2Z1lWM3d1ZkplSzJWMUYzaDFkY1J6?=
 =?utf-8?B?M0ZOUUlPK1RlbksvRG4rNDQ3c3JyMWJpRHJTT1RzeWhzaTBRcGEvQWhHSlN5?=
 =?utf-8?B?cjRiTmVvRVJYOWJOdjVyMUkvdi8rT3JqdjhONG95ZjdEL1NncWx2cjVNVnpk?=
 =?utf-8?B?WU9ZYzRBa1Y5MGlBVnJyVlRzcUIvWTNBVDZrbFUzOW85MFlWWDRTQzA1OWxz?=
 =?utf-8?B?eWZEdjdOSTZVUktEenlHZTBZaGR4NUdBSHY4ciswQ1N2L283NHlESDZIUDQz?=
 =?utf-8?B?aHA4WitBM21VOUMyUUpyelEzaWVqSkRaYmdPVW9NeEgzSWdNWHBjV0QxNGJu?=
 =?utf-8?B?ZXZnNkh6ZCtpWlBWVDdlNlFIZEx6SFc1Wjg0b2o2ajRtYXdTd2x2K2ZYekd4?=
 =?utf-8?B?ckw4R3QzRW43YlZKOFJ2cXRnSUdKMFNnWDlLKzE2bDljMDR3RWt4aXNjZXcz?=
 =?utf-8?B?c2p6cm0xTWhURFdicUIrSTFJU3NCcUpYc0dhQmVkVFFWR2lMTzYreTZIeFJL?=
 =?utf-8?B?Z29pbmJvREdMaVpCTitodHY3Smp5NWVQZ3k2MEMxenBITWNzRnpDRGxaL0ZG?=
 =?utf-8?B?Mkp0L2tXandMYVJscHE5M2wrakoycmpkbEE0TWNJT25GYlRyZlJiN2VOMHMx?=
 =?utf-8?B?ZThCYjdpS1Zwd3RubldyRUlHS1EvK0ZZRmRhY1J6K1lZa0xnbjJZcWZNSnFm?=
 =?utf-8?B?b1FIc3lqYi9HckhGNWNvUDk3VXk3MVNPeDFvQWUva2lWTXZySTlnU2FrY1VR?=
 =?utf-8?B?WDJ6YnluQU5tc2FoK1R2ODZSUTA5cEkzVUgxMkVVTU1kcUlJSUtYSzNwVUhy?=
 =?utf-8?B?Vm91UitqOFhlWUhRR1o4RWpQNVhFalRQYjJESDBqekVtLzYzMmFSRG9QODhS?=
 =?utf-8?B?aHMyMkljTzhrMTRPbERDYUtRSWFHMGtrSHI2cDdyb2xIWDNlZC9OaGdSK1RJ?=
 =?utf-8?B?N01obXZyZlNkSXh2eXgwWE1vRFg4RktsdnlNTlgxYWZNYWY5WUJVL3RKTi83?=
 =?utf-8?B?cmRPSmp4R0p3aVJQYWpYSU5JTU85dmlQTm1zSmhDaE4yWHg5dklwTW1lbUQy?=
 =?utf-8?B?aUdqQ0FuRGhDL3ptanRMQlFaaERLZmZMVVdsTi9XRERMakhMSVJZaVZiZDFJ?=
 =?utf-8?B?SHRFSGVtWFhyOThGNnViTVprdVM5cytya3JmRFVFU21NSkcyQjlpdXBwQVQ0?=
 =?utf-8?B?TkplK2NWNWgzVG55V0d1V0lwR2l5cFl3Qm15VlZNRVVhOCt3czkxNkhhaWU3?=
 =?utf-8?B?RmdZRmlIM29BT3B0UXJWR3Z2TlVRMWljRVlkVGlGNk4wV0YrTkkybkVHNk92?=
 =?utf-8?B?T2FyaVYzbGlzUGlvOTZNU0VhUnA1aU9STmxVR3FONWd2cTc2Q0xsWFo0UkYw?=
 =?utf-8?B?b3NHTTVyK04xVXo1L1BCZzhEOFBMN2FBcEVET0F3TDV0aFd4K1Y2dzQzR3Zq?=
 =?utf-8?B?N1RCa1pYT1ZNSGhnZFQ5ejNZdVdQU2VyTitqckxZR0pqOVE2MElSbll0NVFT?=
 =?utf-8?Q?ybuT+kLee5lFoo031AilyvsVy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6de1da-af04-489a-a7dd-08dd55aad642
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 14:43:58.5608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: isKAgcDyXbEqM5l/mLwMiVdXulm0LR4fBQSclVOZfCm0GVSTFwkPo7PE4CYpzVkF4ZCh22Cyfa3i2cZF9iwstQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9499
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

On 2025-02-25 09:05, Louis Chauvet wrote:
> 
> 
> Le 25/02/2025 à 12:28, Simon Ser a écrit :
>> On Tuesday, February 25th, 2025 at 10:37, Louis Chauvet <louis.chauvet@bootlin.com> wrote:
>>
>>> Can I extract this patch from the series and apply it on drm-misc-next?
>>
>> That sounds completely fine by me, and TBH it sounds like it could even
>> be drm-misc-fixes material?
> 
> Probably yes, I can take it now.
> 

I think that's a good idea.

>> We need to be a bit careful when merging patches from the same series
>> via multiple trees. Maybe we'll merge the colorop stuff via the amd
>> tree? I don't remember the rules around trees, and I don't know if it
>> would be fine to merge the vkms changes in that tree as well. (I only
>> remember Simona recommending against merging via multiple trees, because
>> it's painful.)
>>
>> If we can't merge the vkms changes via the amd tree, they will likely
>> need to wait for the amd tree to be merged back in drm-next?
>>
>> If we merge some changes via drm-misc-next, then we won't be able to
>> merge the rest via amd, if the rest depends on these changes.
> 
> If the drm-*-next branches are synchronized often, I propose to split into 4 series:
> - 2/45, in drm-misc-fixes (it is a bug)
> - 3/45, in drm-misc-next (only the vkms part needs it, can be merged just after [1] with minor conflict resolution, which I can do)
> - 1, 4..13, 21..45, in drm-amd-next
> - 14..20, in drm-misc-next, once drm-amd-next is merged in drm-misc-next (I don't expect huge conflicts if this is merged "soon", afaik nobody is currently working on the composition algorithm)
> 

I would think it's easier if it all goes in via drm-misc next,
except for patch 2 which can be part of drm-misc-fixes. Alex
and I based our branches on drm-misc-next. There shouldn't be
major conflicts with drm/amd code but we can check that before
merging.

Though your suggested scheme should work as well and I don't have
very strong opinions either way.

I have no problem with merging patches 1-3 early.

Harry

> [1]:https://lore.kernel.org/all/20250218101214.5790-1-jose.exposito89@gmail.com/
> 
> Thanks,
> Louis Chauvet
> 
>> Simon
> 

