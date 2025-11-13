Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED86C59D46
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 20:46:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816FF10E931;
	Thu, 13 Nov 2025 19:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p/ortZMh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012023.outbound.protection.outlook.com [52.101.48.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8FF10E930;
 Thu, 13 Nov 2025 19:46:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=siz54fK/Xtr/RpCTQmrlM/vjn58wNQBLj+k2VuTNvc/l7D8NqZHvQHkWdKCMz208eXo+H+Ez9rdzQ33LfE7gWlgbvxlRy7oMHvzbGxlD1gTlwhUr1DmTZcUfzbwxfQHbdfhyDPOJbytnyhw8VT2u7GRqYXP03RmBe9M9vLncyGDOFEhSfQ+lhOE3RIqVBVEfbSRYskr02kAgah7b8affQuQgrDbHBZ4gdIJ+Z4fkkJMKY5K8z4d2qGvNDkrDnpRx1yoW7IilfDNvQg/TvWhyUBkhAcj5zPehzGFYkdbj4Yg2mZ+kdHbtgtJ9aqCZXGwcQXVjXGxCn0duIEnfIq+biA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqYkyxKzpbTGZNRrc7TvfRWEMa+/gmAJ5vSmMEj4dr0=;
 b=o0jQoOdw/r0xSz6FV4/Eufi/xRgjYLxz85ubrXpp3fxZRMjwwjAsp7WFvrOFggrxnZAf4aNAYPXx6xG5XwPi6zQIxOD4CxHL/L2hr8A0kEbERo5WCVRs1Ubljq72HsMHRFX4vLcx52u4RKCE+EMgCDy/EZ6soesCMQNWrtYeeDhIAOCinyA4PF/9mYtfgl9i3evjytbsqtHwmo7gyqHaEdBLaxPKzmcncTEDfNKqpEae6b4K1ET0sPzI8UBifhvyzWXUOHawRjrE4F5OZbduVBX5xAnNucPdrPn38aKVsK5nPq1i2eYewm8cqaOqybPIhOblu5bkzT2KMzrkXccnYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqYkyxKzpbTGZNRrc7TvfRWEMa+/gmAJ5vSmMEj4dr0=;
 b=p/ortZMhpiTo/b+tHY61HeNnKVXIlievgz8yAob8U4VQDo93H7vY0dKMHetcCc8oJBS7i5yyJUJoxtPI2U+NqR+tWk5rooMyrPljOISHPZ9KuQ4kF5WVayhu5t04HT7hBXfUYe8H8hys8DqpIywKTlixJbODbRTvlMcykSkEhwQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS7PR12MB8322.namprd12.prod.outlook.com (2603:10b6:8:ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 19:46:35 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9298.015; Thu, 13 Nov 2025
 19:46:32 +0000
Message-ID: <53a71480-fb85-4c64-826f-8e740c7afd5a@amd.com>
Date: Thu, 13 Nov 2025 14:46:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V12 47/49] drm/amd/display: Disable CRTC degamma when
 color pipeline is enabled
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, mcanal@igalia.com, nfraprado@collabora.com,
 arthurgrillo@riseup.net
References: <20251030034349.2309829-1-alex.hung@amd.com>
 <20251030034349.2309829-48-alex.hung@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20251030034349.2309829-48-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR03CA0036.namprd03.prod.outlook.com
 (2603:10b6:408:e7::11) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS7PR12MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a0db01a-3ee0-42a0-7c2f-08de22ed584c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NU1sb2RXNlhBMjRxeFREcW9TNTNGNmxiK2N1VTd1U3lqZmdpbTlHZXlrMWJ0?=
 =?utf-8?B?RVUrQXFLeXUvdThnMlNhQllxb2lDZXpwWUFCVm5oNFJhQXlCQU11T0U1YjdL?=
 =?utf-8?B?ZEt5K2FGTkhlV0I0MFVXM0tmaFNjMDBmNU1VNEk3R3pYeHpnR0xnalMxMkYx?=
 =?utf-8?B?M1pZNTZsZUJwYS9oU1ZzUXNYQ3l2RmNzd1QyNGo3SWJmbHdmeUwrWis0LzBu?=
 =?utf-8?B?UEhQTjIvcmRMY2svZ0dXMm1aMklJakRUTXZLUkFxdmJESzdkVkFOTmxGd1VI?=
 =?utf-8?B?NS9NbVNvekRGVTNNWHU5QWtGUldQOEhPaVQ0NkxjSlRLb3JVakZxVGZ4N3pt?=
 =?utf-8?B?UUJQbnpBN2puVjl0UFFKVTRDVEhQdzk1Vnd1aGZRemlxMjJlRlZyNklWYU54?=
 =?utf-8?B?dlZ1RENmR1FEc2NmMFR3K3dydlJvSDVuUmVxNjNQUm1GQ2NBOEpNSERQYzFa?=
 =?utf-8?B?bVhLd01sK3VVb2x5WVduQmVVR2t2cUZPZCtFSGYrRzZCVXJpZkRicnIydjRH?=
 =?utf-8?B?NDNoeFFrOEpZbFBlTVc3WXhjOE5BeG9INWNVdzhmS0gxVWVkUjREbk94ZTZx?=
 =?utf-8?B?NjhYTk9MbExhUnBjYzJtOW9NU3JZZTJEeVVHQjZIdFlLRXJsbmlnN1VtL3Fj?=
 =?utf-8?B?YTNTeENhb2pOZW8zYUNFdGxwb2NTYm5JbGM4blNGaFgwU0ZabkhBcGIyWHhR?=
 =?utf-8?B?VEJWckVHM2NrNXdoaGNrbmtlWUc4ajQ0SWt5bW5CbGNueWMyUXdGY3VTbktw?=
 =?utf-8?B?dzJpa3ZxeWV0Wm10SVRSYWdvVGx3U1NnRkEzMjEvNld6YmEyZTVLakJsMXJa?=
 =?utf-8?B?VHpWUGJmY2g4YUNaY1ZtU0MxY1RjdTVrdnh1QnpTUFJRRDNHU3pUNnhLSFZZ?=
 =?utf-8?B?WXV1bUJUR0cvdVFRdmJsYW02VHNmSVNoQlBBQ2R0U2RnOXd6WEJRTVo0MEJi?=
 =?utf-8?B?alBMTHBJZzZ2eUROelNpSmx0am81N3ZETERvSTVmNWI2OTV5M2YwNmhSRE12?=
 =?utf-8?B?MzIxdGtCcFl5WStCL3J5Wnh0ZUlWRFVOWU1wTVpaeXdhdElpaENlMzlVc0Ry?=
 =?utf-8?B?bkZqS2JUQzM2OW9MWmRpdmFyTjBYeFM1em1SKzJ5QWpHQkp3di80aFJlMGJ1?=
 =?utf-8?B?V0ZGVVRtS2lMKzkwME9BejJ1b3RZVVcxWEN2Wm8xdTNQOXNJOGVkS1IvR2hY?=
 =?utf-8?B?ZSs2cjl3R1p4U2gvOFZ4R2tuMXVCbTVuZmd0VlNQL1dIK3Fzb1NkUEVmWU01?=
 =?utf-8?B?bTkxQWlzVmNPTnVzWHY0YUpPWGxWNG50cWhWODNHVE1GNEtCQVdyUEZHT0tP?=
 =?utf-8?B?am95N1BLY0kyR3VuU1hVbXZLUy8rOWlHNzAzY200SlVVdUh2aFovdkJYbWto?=
 =?utf-8?B?aTBqVnJGWlFZMnlBbzhhSEd4cy81WUFiMmVoVEQxeEw2K1pSNVZmUko2L0JK?=
 =?utf-8?B?QmJ5OWR5YkZNSjFYeGRjb2pNcVBjcEZjU2E4TkdaNWRlNlNUV25DYW5NQXJG?=
 =?utf-8?B?dzl1Um5jQUJmcnBJbDJzUThxQnRIWUFnenRLcHM0MzBLSHB4MURpSERYS0tE?=
 =?utf-8?B?amFVc1U3K1NLOFZoUjNudmdSWXl4TUVnTUtZOWlWc1A3SWVUblZVL0tYeVQ5?=
 =?utf-8?B?bzF0Y3hwditGUUpsMnQ5L1JiRS9vbm4vMUV2ZEFlY1V1MitmM1pXaGY2c3NF?=
 =?utf-8?B?cEZIYXNoNVBUWU5KNU10OGtXYjZVaWY3bkVjaG0wN0gvcjFCa1VrZnp0Zkx0?=
 =?utf-8?B?dEZ1S1JldnV1bEJGR0hhalVqNFlKK3ZWZC82QS9nMFNwNWU5NVdqZ3ZPaVZk?=
 =?utf-8?B?aXdLNmlKcHg2RTdYcXdkK09odDNMa0JpWVIwOURaZ1BVV2JKS3krUXlaUHU4?=
 =?utf-8?B?dWZGV3ZJZU1TLzkwU3hMaVF2RXV0YWpmTVdrMzM1dFZKUUVWZGFIaWJXZXJM?=
 =?utf-8?Q?ERabRnB0ZiqsF253AM1Fih2xKfal2s84?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3p0Vkh6S2swNlIyR1RPQ2d0SEtDb2ZicnM4TE4rYzVuclFCaFBSYmNkNDRL?=
 =?utf-8?B?QTBrNHZobTQxZlZ6bllPSUR1Qno1dEJzN1hKV3ZYT1JoM0VuelJmN2FRd0RH?=
 =?utf-8?B?KysxKy80N3ZzdExIY0R6U1RRTzVEZjdDamMxcFNCR25NOXdSam1PSUZnVUl4?=
 =?utf-8?B?NWd3NTZBY2xSWkl5WGZBa2xkbTBOS1R4ZUZOeThHaUpXdXg3Y3lUbC9OaHdj?=
 =?utf-8?B?UHQyd2FQNGt5YWM5eldnc3kzM3Z2M1ZUbk9uSkYwZm93Y2s1UTQ5SDdOOHVZ?=
 =?utf-8?B?TW02dWRRM2ZvL21xdDZ1N05nQ2MxeC9nbEdmVmlqUExYcHFSaGlFRnkrSU1x?=
 =?utf-8?B?K0JJS0YzLzNVeVZxdk9rT25LNXN1S2oyM1ByaVhyVkY5Q2c5MXZOa1lPNkk5?=
 =?utf-8?B?SUlZVzJJVEhxZytUWHZzVlVQeU1SVHVhVktjaDllNjZ0TUtiQjNndVdvM1g1?=
 =?utf-8?B?SDRVV1FPVXhocWY3ajdwRlAwWXVSTEdVOUpUOXZzaGJZdjZBRlVTT3hGSnZN?=
 =?utf-8?B?VXhxSUljcktBUDF1Y1Z2cGVRd0RHK0RqdkY3TDZUa21zak9oQW96bE54d3FZ?=
 =?utf-8?B?WWpiUjFNdEZKNEJuejFxb0hJU3EwcHJQOU1JUGNnQ2tBZ012WUxYNUhCVWt2?=
 =?utf-8?B?QTg3V3BaOFhMNEJYMGNxcCtJdk5JT3I3bjlRWkd0WGhXYUcvN1FwbHl1cUQ5?=
 =?utf-8?B?VUVsbTJKVmVnajMxZmozT284UXN6VXFKS0ZRb0VEQ3JEc2RqRFdtYW5NTUNQ?=
 =?utf-8?B?K3FhL25NOVBhM3UxUzYwdDZBQnE1RlJYWDQzdWNXaEh1UWZ1bjdRVFIxUXJI?=
 =?utf-8?B?YjVMNWRnei9rcm9jWmNrMit6QnVjYVk1V2FoNE9vUEdaZ2xZSGF0UWo5Z1Jl?=
 =?utf-8?B?eDRIZXRmbURUNWxud09VaDNPVkN2RjFqWDVQRjZWSHhxMVBQRlVPelRCQXlz?=
 =?utf-8?B?UG1jYmlxOXMvY09aMHZNMHltTWt4SWZuNFBDU3E4VWxia0Zjd2dMVEJJT01R?=
 =?utf-8?B?cUlPSDl6MndxZGw3L1VwQ1YzMGMvNUdOeWo2MUhia2FOS2pKZ2tpZXVkQnZO?=
 =?utf-8?B?Nm9nV2tYcUJ6a1BZZiszbC9JNHhLdjUxRjFCR3RnN21DK3dtL2lIeW16Z0wy?=
 =?utf-8?B?UjUwZVRGQkd5dHFhMGFjS3VNenZBU0Q5UGdRbWdITGZHTWZxRXA2dytNczNK?=
 =?utf-8?B?VkRUMEN6OFd6Q2k4WHhoS0dXNDNmVW52MUhsbHBIRVZlNTJhaDVlcDhxSEpa?=
 =?utf-8?B?ekhvb3M5WlBIYTNKYzgwOFpOSjZpTnNNdy9zU1BDMGdYNEw2ZHVkSkc4R00r?=
 =?utf-8?B?SS9PRXpVblZXNFptbjZqZlJiZDRZRCs0VTFPcGxvK0o5cWNjKzBPQUdIRXJp?=
 =?utf-8?B?UlNUeFYvaVN2VEI4U1N3TlV4M2gvV3BOdm1pMUtJdDUySWJxejNLSnoyRVor?=
 =?utf-8?B?cm1BZVFKenN5Vm9QYTJYa1dBczdPSGxWSGVvdktreW1zUzJNQ25SYWthU3dF?=
 =?utf-8?B?akZSaEZsaHNCdGtpSHI5OFNLRm8wOFhDbVI4bnFRcVJXWC9tRDh0UmNPOXRC?=
 =?utf-8?B?YjdmSGdIVWVJY1p1aVFVaGJXb0NHYVA4Qy93eE1pQjBYdFFvM2lGanh6a2FH?=
 =?utf-8?B?b1Y1Tyt0OEFnZksxaktjc3Z2aTdoazBGb2ZmWkxPelF2NnZ2T1BlcVNidDd0?=
 =?utf-8?B?Q0cvMC92QXdoa0VRTVhna1RBMytwRTFlZ2hFRFFpa21DS2ZROVo3a3lDRk5H?=
 =?utf-8?B?aWtSeVdlWTd3cFNDSmZ0NlMxQXNscEZ2bnJGZGNveFBlVytwbFU2Vzc3RXUr?=
 =?utf-8?B?dS92aVF4UVdQdDFpOTNvcm4zb040azA2ZXRCZ1ltakltZXcvVEducFNYRVJs?=
 =?utf-8?B?WGQ1Y3NjWFRtWUxlbXpWcUtpRmhsU0s4bWhlVlpqNFRYOFJrTzNoWE9mVWgv?=
 =?utf-8?B?Z3d6WEVEdUZoM1dSNEJ3S0doZ0RJc1ZNUGEyeTZRb3dtVnorUDZoSS8wdEZQ?=
 =?utf-8?B?UmxsU1FWWklYWUh0dUMvcTBYSzdNSmJla3FTeVZLTEpoVGEwQmoycVovb2ZB?=
 =?utf-8?B?d2k2blFCenRFdTcrMUJ6K2VQeGtMQisyK2NXeFp3VHZRV3VRZncvSUVSQWJK?=
 =?utf-8?Q?K+z5VXOLTDkIk4kPsZDdRWc0W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0db01a-3ee0-42a0-7c2f-08de22ed584c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 19:46:32.0616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lCr4+gZtx0C57rVK7rIOTdCZOt7PRWyJEGgtGbqsarzywp2F+YlT0rfaMA0gal2dC1yxACRZCSA9FQ+mIu42kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8322
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



On 2025-10-29 23:42, Alex Hung wrote:
> The degamma is to be handled by Color pipeline API.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
> v11:
>  - Merged enable condition for drm_crtc_enable_color_mgmt (Melissa Wen)  
> 
> v10:
>  - Disable CRTC degamma when color pipeline is enabled (Melissa Wen)
> 
>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 26 +++++++++----------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index 1ec9d03ad747..8d7fa1f80b9f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -721,7 +721,7 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
>  {
>  	struct amdgpu_crtc *acrtc = NULL;
>  	struct drm_plane *cursor_plane;
> -	bool is_dcn;
> +	bool has_degamma;
>  	int res = -ENOMEM;
>  
>  	cursor_plane = kzalloc(sizeof(*cursor_plane), GFP_KERNEL);
> @@ -760,20 +760,18 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
>  
>  	dm->adev->mode_info.crtcs[crtc_index] = acrtc;
>  
> -	/* Don't enable DRM CRTC degamma property for DCE since it doesn't
> -	 * support programmable degamma anywhere.
> +	/* Don't enable DRM CRTC degamma property for
> +	 * 1. Degamma is replaced by color pipeline.
> +	 * 2. DCE since it doesn't support programmable degamma anywhere.
> +	 * 3. DCN401 since pre-blending degamma LUT doesn't apply to cursor.
>  	 */
> -	is_dcn = dm->adev->dm.dc->caps.color.dpp.dcn_arch;
> -	/* Dont't enable DRM CRTC degamma property for DCN401 since the
> -	 * pre-blending degamma LUT doesn't apply to cursor, and therefore
> -	 * can't work similar to a post-blending degamma LUT as in other hw
> -	 * versions.
> -	 * TODO: revisit it once KMS plane color API is merged.
> -	 */
> -	drm_crtc_enable_color_mgmt(&acrtc->base,
> -				   (is_dcn &&
> -				    dm->adev->dm.dc->ctx->dce_version != DCN_VERSION_4_01) ?
> -				     MAX_COLOR_LUT_ENTRIES : 0,
> +	if (plane->color_pipeline_property)
> +		has_degamma = false;
> +	else
> +		has_degamma = dm->adev->dm.dc->caps.color.dpp.dcn_arch &&
> +			      dm->adev->dm.dc->ctx->dce_version != DCN_VERSION_4_01;
> +
> +	drm_crtc_enable_color_mgmt(&acrtc->base, has_degamma ? MAX_COLOR_LUT_ENTRIES : 0,
>  				   true, MAX_COLOR_LUT_ENTRIES);
>  
>  	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES);

