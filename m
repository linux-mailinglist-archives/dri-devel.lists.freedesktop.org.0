Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aItWAT8XqmnFKgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 00:52:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C9221985E
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 00:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA00B10EC82;
	Thu,  5 Mar 2026 23:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cBaRtvLx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012004.outbound.protection.outlook.com [52.101.43.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C35C10E2E7;
 Thu,  5 Mar 2026 23:52:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPUwrC6GgcCj0lNKO31Rt1jXrx31xuU8e7MVa4q6rRH0RMs97PvfStdvg12HVyyZkpO3ZNVFft+TIt7pm0vvMN69r8WY0rvpkt49QKmGFftMTaWUJU5F5AgoSQEV6RTgtCWp3s8oCSEW4roAqIXTs3AW6kDmklzaYRH40ZDwecCFtSCMTXuVFhY74+dPczn+Px7FhW/ow0jWbJXuWkIajg94omYbzyMY83m4nlOibKRRDi4PD8+IGC+zAX1gGsHP6ybjKGsotYnKvbItljK8LLN1f0nNE7noYsE6DqRNL6AqBjITN+Qj12gNi9OoKd2Q+0w0qPKmvgA6idTI19/XMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=suuBH03UWr2oq3kN6HXjMu0dcI2L0V8Jf563QzI9caU=;
 b=ZKbUPSnoRqfsgli0bG5DH3lmymLFp/4RshOblVRqlbh6Tr51IGP5yTMWkFbCu/E0j2ymCfod9So75V2a3Y46KqMymr1vhC3S0ANw8I3/BKam0HimMMFD6QsmYeSRZhbSIa/zX2UOFse1AhW+rH1AapebVR0Z2etxJQoWQmLFRuvdQ+l+Oinn3m8vPGpb54uykd+abdGVpFivfdoTffaqFHtRAhchZUEjgXFoD3dwd4dgesgDwVzfjecRIHOWz7JE5K7BsoK7YnM7DZzdthbX6OK+zHkJ0P5L8py9+s+lX7xFZa8DNy4UV5CODbhb1C77/mYSVyNJMuDfooS7h+zryw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=suuBH03UWr2oq3kN6HXjMu0dcI2L0V8Jf563QzI9caU=;
 b=cBaRtvLxFPT+VFtaHVTz2pkaWy9VPAXMI0zXLfrkILmU1cBubvR/SxM47TUWiFqf+ebZdg2c+yyarim4gt2U0R763FiUrvM3Tv+RNfePnKeKdmfd7q58WSBc7zR1EuNZR1e5F6p/J5jFUCHuqzjiLuXTg0Qd6Uoh+1p0Hx14i1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by BL3PR12MB6547.namprd12.prod.outlook.com (2603:10b6:208:38e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 23:52:21 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 23:52:20 +0000
Message-ID: <e9c1bf54-86a2-4dd0-9790-2ec195b949ad@amd.com>
Date: Thu, 5 Mar 2026 16:52:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2] drm/amdgpu: Fix kernel-doc comments for some
 LUT properties
To: Melissa Wen <mwen@igalia.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260305-amdgpu-fix-kdoc-lut-v2-1-37947aca68e8@collabora.com>
 <ae12b964-de1a-475c-9ea6-811ee541d146@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <ae12b964-de1a-475c-9ea6-811ee541d146@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0224.namprd04.prod.outlook.com
 (2603:10b6:303:87::19) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|BL3PR12MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: a03387b4-2be3-4013-b0b1-08de7b123d3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: oUwCTyEHmoBjgFxFFnTt9NSrkkcOnqvdbfzzNi+2cXH0YEaWld45R6E3kBrZ5vl2cKwwMXe5WyDRTvzSjMGA55OFGldgopB50an/IcCAnmeKxxNTIHAEdzRqqZBlpEXtIfaUhU55CkfXrjZXWIMAmM+oXxHEuht1684giRTqYxJeaSC0D+pOuPPvpsI6hSWhqzRQQl0M6553OxqODQK+mMkhCsSlACT4rbUNEF8zghXBfTYibQONBSGerJtQH+/JOH/OfRzexy6zpZYgiZBRz9JjlmwHcRiG9DtQQ8lr7/3FjnKBDpDjLsU/F12e0zrXizbwwqevmbqUAtJrXJB29Gmk61zAnE2d7stMJXukBHIlbLaXX9WlVV+ydxkjjmD8CR/cK4yc4mFloFnxn2Fbp9EfC8FziqXsQhtfzOzO4lqdM1s08AlrOtJkLse/vvdfAaj2+rDrYgqsWSNCKF9GXx3yNCeA7irrZU7bGns6v38yPZNxbS0paDmLuPKiukFU1zlKk9KPkw3pOY3Rbg+poqpex/6aa8K7fkHRRIu69SARVx0r8x/rpfNo19ldS/O+f08hKYC0bqAmGXxCu9QVWddY/6mHx5lNLAJC++O6bmDcq4XD39U4uj6cKowhqav4phVkRxeph2P+0/3d6jqlVzqV6Vd79WE3mgES1s/fbUcsDOMYhCetyV5/ewoGWuUn7DdX74nghk1556R9WsuJknEj2JmJOpakGqjWKFPjruvYXB1hWT/8zDr+X3r8m77q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFk3WUdDKzZIbmU4aWJ5NS9VbVNocTRnbEF4eEhkV2NHUEJrMHBmMTA2clhU?=
 =?utf-8?B?S24wN3pVOFU4QWFzSkVublo5Tm9uQzZNT2lwMXdkckcrTUdGTVBmUGkvRmFk?=
 =?utf-8?B?WmVXYi91YnJCZU1wOXVwWHEydXFvRE1pL0lLTUhtbE1haEU2dWNtVnl5RUZ6?=
 =?utf-8?B?VU1XNUNocDhxYXh2RnFIaFFLZm9PRFNRLzRrQ1NzUlhOTGdDU1owZVg5RG5p?=
 =?utf-8?B?dnRjQ0ZxdFRJWkxUbzhEdkJmVjYvcVV2SmkzT1lJUE9IZU9YN0pMd0k0S3Z6?=
 =?utf-8?B?M3ZVQktTa3Y0bzVNWXBzUG5vRFV3bU9TYmVsQkhzNHUvSW5Lay9nVmRuWkk0?=
 =?utf-8?B?cEZLMld2N2t2N010aDZnQ2pTQ1NDaWMzb3VxNUZ3Mzg0OWZPTzRSUHZFTkhn?=
 =?utf-8?B?Q2RLSG5MMmhOR1dOdG93WTkxYmVvR0FmVXlSM3dFVURSWU5EbFJmNzBIenhP?=
 =?utf-8?B?dy91eFVPWjQwRDNiMWQydXJFUkJHUGZRWUxQUEx4ek1SSEdYYXFRa2h3em1E?=
 =?utf-8?B?UlNsM3U4QVRiRFg4S0JFZ1gySVVIbHY3OSsvUnVvSEFUbURKYnlyOTczaGcx?=
 =?utf-8?B?eFJoRjRqSmRtVDl3RlppRSt5cVR0MFpGTmdOajVBS1JoUUdaR3dNRWNPTEpC?=
 =?utf-8?B?STRQRGRab0xHOTYzQXRUQ29FOGsvbiswdDlDamxGVTRmc3lUNmM2dzFiU3FU?=
 =?utf-8?B?a09CNERlWExwVytnTmZDT24wUzFadkJZZjFOb3dhUUpVdytrTEJVekk5ZC9u?=
 =?utf-8?B?czlIcmxic1RJN09GSXNTVldyRlI2TEpDVnVGaTloNTllNnZ1dkQwWnJzU1M5?=
 =?utf-8?B?WU9VWUdRSU4vMGV4bXlGWWRSekw2SmMzZWlVeGJMNmJ1c1BQdi9qWHVtVmNa?=
 =?utf-8?B?TzVHdktOZTdyOS8reHdack1vRFN6bU5nbjQ2aEtsY0dlZ1lWVTM3MGlmblEv?=
 =?utf-8?B?MTNOVHBWWVcyWjNiRzViNzV6Ky9WaklxbnR1TXNhelIyY1NHdDIvamthWTFF?=
 =?utf-8?B?UXloVjJSYXFONTNncHlQaGR3UnVYbjQ5N09Xa0RuNVc5dE53dHVhOW9vY2Ex?=
 =?utf-8?B?d1A4dmJOalgzMVExZFA3ZVlENHdZZ21VNHZubFp4dzE1V3RnME9FWitqR0xZ?=
 =?utf-8?B?YXoyUHZiMlVYWDluTTU5dnNpSTBXUjVTTnhDSmlJT0EyRzdoSmRqOVFxUHo4?=
 =?utf-8?B?UGN0Z0UzbDF1WWdrekFSTTROWTREYk9vYnBBU1JrMmNUM0JDSjBibDNKS0Y4?=
 =?utf-8?B?QXhXNU4xSFdTUHl5NlZ5a0MxMlJBaHNZVk0xcUFnLytaZGh6NVVjV3BML3BB?=
 =?utf-8?B?NDdzdkxQRXhpSnZrSFVxTDRnRHNsd2V1RVNNMlFRRTNPT2xaRElPSjJNSmE0?=
 =?utf-8?B?S2NyREFKNTF0VXJpcjJvL0pFQjZYOEpnZHg5TWJWdW9ZRjI3MEF3NE1sd2Fv?=
 =?utf-8?B?UUFxZ2tmRDlWd2k4QnUvcXFWVkRmK2xETXBDQTdDWnIwMGVmc3BvVlEvRlRi?=
 =?utf-8?B?U0pPZmpkcDZpRWpyK0d3eTFQUVBKWVBNRlROUzJHdk5PV3dwOHJ1MWM4ME91?=
 =?utf-8?B?TU9XVnFCYnQzb0pBZ3VaTlNuZHJqYkN4dEU4YlNNenM1MHJJWW1xbnBCYUZs?=
 =?utf-8?B?cFVTSUk3d0UzSXc1OFpDcGQ5eUZESU5sekpTRzFjb3RvajNoVU92bHZ5K2k1?=
 =?utf-8?B?dG9YYjVNUTN2djdnNURlaUhoOVRnSVJ3TlZyeU1QdzQ1SGN4UTQxUW8rbFZT?=
 =?utf-8?B?RHhhZ1BHZEN4cmEyWkRtMFpyeXcyaWtmZm1sTm14b3NhSjhmV0EvVVhXbS9Q?=
 =?utf-8?B?cXVCWEZVQ1d0YTZ4OXhwRWYrWmF1aGt5ZmlJN3RQOHNNb3hGT3BDZkY1dkNO?=
 =?utf-8?B?M2Y3T3JobGtnMytqWFBKdXpoZmJaZUhraTJMQndPSnY2eSsyQmdDS2VPb1ZL?=
 =?utf-8?B?YllTUFU3YUkzbGt4M1l0cFJxWSt3b0o3aHNOcTFOTytDckVvZkdnYXZtdHBM?=
 =?utf-8?B?ajhsUW1vbEk0eEJFd2s0eUNKaVNWem9LZm84cHF0MnA1OVFnQmFGODk5M2lq?=
 =?utf-8?B?cmdrdFZEeTFWcTZraGlHcCtVZ3lvWU1uSExXendiMFNFNTdHWXFJQjlCQTFJ?=
 =?utf-8?B?TGRtM3U4aVozT0k2UlVxS0s4bTV2NVJoSjJWY0NWeDZ2RXMrbS9ISWpGTzlz?=
 =?utf-8?B?dW9zUnpCU1ZDcVo0N2lFbkRPb2JCVExPZ2FmZDluOVJTeFozMHJVdUEyMnMr?=
 =?utf-8?B?MFkrdTZKYk9BVFRwUGt2QjRsVmVFSHRjbEhad3h2NjNCbXpkMlhKMmRYQmZU?=
 =?utf-8?Q?upE0XL81eR0y8POyEl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a03387b4-2be3-4013-b0b1-08de7b123d3e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 23:52:20.1742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EW+spGpeerMHvXoCrWQP6T4permZV8FtXEDtJ3S+CA+D5uYAY4jkR+t0fb/qOluJg47dsmNjPvorZNCc6AO0dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6547
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
X-Rspamd-Queue-Id: A8C9221985E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[igalia.com,collabora.com,amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[alex.hung@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:mid]
X-Rspamd-Action: no action

Applied. Thanks for the fixes.


On 3/5/26 11:00, Melissa Wen wrote:
> + cc: Alex Hung
> 
> Hi Alex H.,
> 
> Can you apply this patch?
> 
> Thanks,
> 
> Melissa
> 
> On 05/03/2026 08:16, Cristian Ciocaltea wrote:
>> The following members of struct amdgpu_mode_info do not have valid
>> references in the related kernel-doc sections:
>>
>>   - plane_shaper_lut_property
>>   - plane_shaper_lut_size_property,
>>   - plane_lut3d_size_property
>>
>> Correct all affected comment blocks.
>>
>> Fixes: f545d82479b4 ("drm/amd/display: add plane shaper LUT and TF 
>> driver-specific properties")
>> Fixes: 671994e3bf33 ("drm/amd/display: add plane 3D LUT driver- 
>> specific properties")
>> Reviewed-by: Melissa Wen <mwen@igalia.com>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>> Changes in v2:
>> - Collected R-b tag from Melissa
>> - Rebased onto latest drm-misc-next
>> - Link to v1: https://lore.kernel.org/r/20250823-amdgpu-fix-kdoc-lut- 
>> v1-1-306bcad41267@collabora.com
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/ 
>> drm/amd/amdgpu/amdgpu_mode.h
>> index dc8d2f52c7d6..e244c12ceb23 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>> @@ -368,15 +368,15 @@ struct amdgpu_mode_info {
>>       struct drm_property *plane_ctm_property;
>>       /**
>> -     * @shaper_lut_property: Plane property to set pre-blending 
>> shaper LUT
>> -     * that converts color content before 3D LUT. If
>> -     * plane_shaper_tf_property != Identity TF, AMD color module will
>> +     * @plane_shaper_lut_property: Plane property to set pre-blending
>> +     * shaper LUT that converts color content before 3D LUT.
>> +     * If plane_shaper_tf_property != Identity TF, AMD color module will
>>        * combine the user LUT values with pre-defined TF into the LUT
>>        * parameters to be programmed.
>>        */
>>       struct drm_property *plane_shaper_lut_property;
>>       /**
>> -     * @shaper_lut_size_property: Plane property for the size of
>> +     * @plane_shaper_lut_size_property: Plane property for the size of
>>        * pre-blending shaper LUT as supported by the driver (read-only).
>>        */
>>       struct drm_property *plane_shaper_lut_size_property;
>> @@ -400,10 +400,10 @@ struct amdgpu_mode_info {
>>        */
>>       struct drm_property *plane_lut3d_property;
>>       /**
>> -     * @plane_degamma_lut_size_property: Plane property to define the 
>> max
>> -     * size of 3D LUT as supported by the driver (read-only). The max 
>> size
>> -     * is the max size of one dimension and, therefore, the max 
>> number of
>> -     * entries for 3D LUT array is the 3D LUT size cubed;
>> +     * @plane_lut3d_size_property: Plane property to define the max size
>> +     * of 3D LUT as supported by the driver (read-only). The max size is
>> +     * the max size of one dimension and, therefore, the max number of
>> +     * entries for 3D LUT array is the 3D LUT size cubed.
>>        */
>>       struct drm_property *plane_lut3d_size_property;
>>       /**
>>
>> ---
>> base-commit: be4cd2a13a31496c7fb9e46a244c4391b8b7cf31
>> change-id: 20250823-amdgpu-fix-kdoc-lut-357db8b57fee
> 

