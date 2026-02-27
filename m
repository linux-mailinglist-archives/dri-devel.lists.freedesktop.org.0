Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNd2OqEComnPyAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 21:46:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8AC1BDE97
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 21:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9630210EC3B;
	Fri, 27 Feb 2026 20:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CTeZimG0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012053.outbound.protection.outlook.com
 [40.107.200.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A361210EC3B;
 Fri, 27 Feb 2026 20:46:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCynPlYmiBjS2I5bFwwh5rhi3jYNYGOIFQG0ZLoqK3qNkKuBwPYjx/0fSnbCb87Opt0d6hGuw1KPb3w3u8ZSNdlYc1OrVst0Quafp1iTgtCbbRqC6wDe5hiJh0wtx0MgJeavMx+OaNku2f1tZLQc67CsKVogSCQ+apiCJfnkuJYt1xKIbxq91Px1vmNA2+J1Mg/Xw2PSnJEvrQPHE/hrqT37D13Iweq3kR6cEkKWQZ0vdNaiUvtRWwLOOHIeHO1CjP19kw1q8dLIq1lvtFpCw7oRMh5D7DepfAm80kK0mJSh4R/P/D5YeeNxCQczt3hLocnXlOpQzL+EHgYf24h+Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NG5b54pEKP1mwKqh1kifa7K9TpkD3SRnb7EkAytFcRg=;
 b=ae6VZMAD9cPPGD6ix9czi+CvL6+aU+i++bvqu/ff6jAJTtx2ZXhXy2nLY4p5bKY+DMgcns057DTo4XrUdBICvKki7SnW0AlGJ02UpSoy06SuUo9g1bW2yhhIirCYrmlKKTRrtqEumdkTvn6S/lQJHaspcXivaL8NmBT+l5HqcyPCm0abRYzfHQDHFRMWT44DYc6CNLIhWSTqovFBJm2iyWOIioduxDNnNCY3oJKqA6g05ixNt5Yqy72pcOLPA5G7LvPqqDWNpJlksr/ou3R2QqV65qw+VYypkmOwMbvZsOuTpIRxN1GWqKs//IhNjD4WZIx5NfJnaNtFf7j0bJuF3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NG5b54pEKP1mwKqh1kifa7K9TpkD3SRnb7EkAytFcRg=;
 b=CTeZimG0GDoe3D5idse5t5pcSvspSPjnTZGmLn6wy8cNUsPMHl9j6z+No1mE8RvjqoxAitUNXZvajkq4Id4qCJ8le9hAwOQoDPnOufmcYTYdpAqBY4dqXQ+72RI9b5ykCvJwPH11s5UFgv1bEOOJP/gtT0laslHC+oyn5E0UKik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5130.namprd12.prod.outlook.com (2603:10b6:408:137::9)
 by DS7PR12MB6214.namprd12.prod.outlook.com (2603:10b6:8:96::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 20:46:15 +0000
Received: from BN9PR12MB5130.namprd12.prod.outlook.com
 ([fe80::e7a:4396:5bcb:2b5a]) by BN9PR12MB5130.namprd12.prod.outlook.com
 ([fe80::e7a:4396:5bcb:2b5a%6]) with mapi id 15.20.9654.007; Fri, 27 Feb 2026
 20:46:15 +0000
Message-ID: <025b1ef3-2758-44a6-977c-2bb678cb89c2@amd.com>
Date: Fri, 27 Feb 2026 15:46:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Enable DEGAMMA and reject
 COLOR_PIPELINE+DEGAMMA_LUT
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 contact@emersion.fr, ivan.lipski@amd.com, kenneth.feng@amd.com,
 chiahsuan.chung@amd.com, mdaenzer@redhat.com, Jerry.Zuo@amd.com,
 timur.kristof@gmail.com, david.rosca@amd.com, daniels@collabora.com,
 mwen@igalia.com, Alvin.Lee2@amd.com, bold.zone2373@fastmail.com,
 dmitry.baryshkov@oss.qualcomm.com, ville.syrjala@linux.intel.com,
 Matthew.Stewart2@amd.com, chaitanya.kumar.borah@intel.com
References: <20260227193038.1377643-1-alex.hung@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20260227193038.1377643-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0278.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::12) To BN9PR12MB5130.namprd12.prod.outlook.com
 (2603:10b6:408:137::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5130:EE_|DS7PR12MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ebfbce-cb96-4aad-84aa-08de76413ff0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: ybPSrCF4IM+iUw9qSU3ovPxcp13w4UB2TSv2AWmBDL3pKWgaglbnaCiSycvYj7e3Z/HeU2elGS3ECb/jyLfjeGdDS4Ra10xWlwFs/qvY3XvSo9JwwTWtQTl82Fi6wnv6J7Hl2WVqABbglI5rIkfqWyUa2ZfppcIobHu6gVn9udkcN+/pBD99qUxlcOV8ijaZgzppOkZ4TDB2ytDbNRjOESx03TGgT0W+Mh0hG5xLq0bDVWbe4wDlo3iiZj9MXqn4StPKQmrGvBe2pRIzsbLp9abp9xpWsdXMIehvtaKJBD6ks9wQfzsac9z2YWAxf3lxUc+TMdYANa3fcEoh2Lw2KQKtm7NT7o36j+FISbLpxMWjkbnvvTczyyEb5rs+w2u6K2wk/HSnT+FjsmIplTxP158zODxjfI/9yXNrv2kFSskRA5kfbS+m+OSjFtcky7B67xKrC0hjB6y4Xvb47cu235yQol60r5su+G0DAsmC7DbjMm2Ezv7PJ04tLK8VeOTQhUXwwkXYdpuqtxWjnHxG+/q9g2/7F+Zz2vcrp8q237WI+C2C4NTYdrU/Qe67ExjIQWwJyUdkv6Ea+Xs+GLl62OgeK8hY1Y70MEPInyOW/K9cEF48y5xByUEUSaPjg4FPgVv+LyJsjIiJEXHCb7dMa031i9qLKKtpuJMTqOsOytSCnu/8mAIO3fsvPHCHgEAfOvU4v0xmdok+yQgvnJm7Nix9V3GU9bbzuSV9+1dy6xo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5130.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEVQOWJ2ZFVrR2xWblp3WVNUQk00SjNEYXpTdW5iNk9WRHYxQW9uSmVNa2lq?=
 =?utf-8?B?ZlozVUVEUFVaQXYxZDJkZDNybktqWmUzVTdDcXUrcmprR3dBSDZMZkhkcXFJ?=
 =?utf-8?B?MFZPS21MbkMwY0JudGlTbGRSU1ZBQkJRenM3cXhuWEsyVWI2NHdWZzJTTm1j?=
 =?utf-8?B?TER1REgrdER3cjBiVlMyUzMvZytadUQ1M1M0djIzcU94TXEyY3hIN3dEMlc2?=
 =?utf-8?B?UkxxWkpHcWw4c3lCNUJBTGpObTJzNEpKVndRWnVyQk9ZVURTNEl0L0ZoSzh3?=
 =?utf-8?B?WCtrVUJqaW83VHVxblpGWnF2WmM3ZzhTRzBhUklnL2dYRWE5V0dYK3NQbTRF?=
 =?utf-8?B?Q1JhZG56T2pKUVJ4NWFKOFhDMytueDhZVWRaSDNONXRYKzgvMGRvSjFjOWxW?=
 =?utf-8?B?czVXVVNheCt1YUM4NGF0dzAwVmtPaGN3Ui9lcUM2U2JaVmVROEFuWDJxNldz?=
 =?utf-8?B?L2E3QXg3QlVZeG83STFSYVhOZmk2TkdmSFBoUkVyRU9UYXhMeGVrQzEzTzln?=
 =?utf-8?B?bStENEtyaUJUcmVzUVhVazhXaFdqRk5OU29UdTA4ZGQrbzNET2xhNWltQk1E?=
 =?utf-8?B?UUJORUsvSEpxdElyMjJEOEI1VTF6b0lKMlNCak1ndlI0aTF2Q3ZRRTFpdWpF?=
 =?utf-8?B?alJsYUdycENZbGhyMjQ4bm9uSTJzaUIvMitrSlY4dGc0R1dwMU9ITThndjVK?=
 =?utf-8?B?WC9DTFZZMExnQjhFRjRUSkZzSDl3amZ2ZGwrU3NLaDJWejBHTm8xdnZFK3dF?=
 =?utf-8?B?M3hjdGs4YXFtcU9GMHAya3R4SEFEWnQvWTFGelBDWkRXWWVOTXJpOEN2eldB?=
 =?utf-8?B?Rm9HamliUFhpcFVHaGlvdzJKWjU3UmJJUkNZQ2p5NkV6YVd1ZW1YSWttRitJ?=
 =?utf-8?B?VVJBWlJCWFVXaUFCKy9KMGJsZmFhU1V1V21sOElnb3daT1lDKy9HK0svMk94?=
 =?utf-8?B?M3lKL3A4V20zZnpiM0tJNFJ1OE0vaUswWTRFK1YwamdnOW5RMll5aFZkNHBU?=
 =?utf-8?B?M0xvMFNSL1BMWkxna1MwcHNmOUhXbm1ueVZPdzBycTlzT2lMbEFheGRhYzhj?=
 =?utf-8?B?KzBBMVlLN1lUVHYyVCtJS21wT3IyaHA4RlQyNWNjL21xU2xWbFdsRWZOa1Ay?=
 =?utf-8?B?bERmNkQ0b3MvZWlhbzlrMWtxTlVxamZwVCtOUStiSEZFRmV6Ylcxb1duZmR6?=
 =?utf-8?B?MWVIVG1sak1OeTVMMTF6QW0vNnErNW1aL05OQnRHZlI2RXdSZG9UaW05Y2pv?=
 =?utf-8?B?enZ4Wjl4QzFVRllzRDEzZGRNckYrWUxyY3lEMENxcXJNdXl5M2tLc2dIeDdI?=
 =?utf-8?B?bW9kRk1mSHNwMFZBc2JpaUxVNkxZVzdLUlBMd2ExMS9HeUovNmdUdEczTFpK?=
 =?utf-8?B?ZVhUZEN6blI1SkFzR252dlFWL2YyTGc4S3UvenFIR3ZPSXVTTnQzbXYvWFVr?=
 =?utf-8?B?TmpQYVFQYUY4NzQ3OUk3Um5CZEJYUm9oRTg1NkpZVTBwemRFWnU4RnptK29D?=
 =?utf-8?B?TGlYcklxbGt1NVp1bXoxWm53TU9adk96VDZHeUl0MWo1Nmp3L1I3a2RiNXdM?=
 =?utf-8?B?bnBkcWlvQmM0WkoxRmdaZ3FFaXQrWVFKdk56UTJuaFJJUXFDZGIvbVVlTzlG?=
 =?utf-8?B?eFlhbWw0UEx5R3g1UGQxWTNET2hwejYxczBza2UvYXhKNWpBSFhUSTVLZzFL?=
 =?utf-8?B?WlFnVEZlclM1WjhkenBjS244blRhb3MxdDNTQXBMdEdKQWRFTlI2ZlBTZlBO?=
 =?utf-8?B?TWVRSW94K3FwcTFUdDFCTGRENHVPdzZEQnlWc2dkbVdKczd6S2J5aHA0d0FC?=
 =?utf-8?B?NkIzaFhENnFLUjlVMTVReUpCVDdTUGl0bktPUWtRemMzaDVqd3J0eFdpcDVl?=
 =?utf-8?B?eWRIMzk4TkpKdzNna0JiWXVUNmxPZXJNd28vMHhTdjg5bFdOYkZWZm54Z0ZH?=
 =?utf-8?B?VUxRbGQyejh2V1Zpd2xESEdCWHdXTnVlOFNWQno3Z2xPeUN5RFh1RjBVS0hD?=
 =?utf-8?B?SzBMc0RmNkFudk5rcHFmaGx2dHVQcG9mUlBCbnBaUk9FM2lkSWh0Mjd6UERJ?=
 =?utf-8?B?VGo5WnpYVStPdDNrQmpudi93RVIwTmI2R2dUaW9tNzFmS2c1TnRBT21NaHNK?=
 =?utf-8?B?SGM5VXczQ1oycUFvdnBsWFhWME9PVlpzaFRmK0NPMXhYZ2pUbmVMRWNYakc2?=
 =?utf-8?B?TkRUNkNablJWVS83OXowalNPQjFjUDZtSVF6M3BqR1BjbWk5cWtLY2l2NDdS?=
 =?utf-8?B?VkRMUVc0NEkwVVhHbXlpOXAraHBjOFBsc1A1Z3BhcmFpcE1lMFBKamFFc1Zs?=
 =?utf-8?B?RmlaVTIzeVZZSVFJeXZYSzdvMSthWTBNYjhrZ3Y1MUZCa1Z5VlBaZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ebfbce-cb96-4aad-84aa-08de76413ff0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 20:46:15.3178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d5V5sKGoryIZd7xIJhNPPbAkdG80ohjOqZM79Z4JCGQFlYgJCbQxTCtgDXx6o7lRfXoEUEC7wAHvmelFfE0dSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6214
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[harry.wentland@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,emersion.fr,redhat.com,collabora.com,fastmail.com,oss.qualcomm.com,linux.intel.com,intel.com];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: 5B8AC1BDE97
X-Rspamd-Action: no action



On 2026-02-27 14:30, Alex Hung wrote:
> [WHAT]
> Create DEGAMMA properties even if color pipeline is enabled, and enforce
> the mutual exclusion in atomic check by rejecting any commit that
> attempts to enable both COLOR_PIPELINE on the plane and DEGAMMA_LUT on
> the CRTC simultaneously.
> 
> Fixes: 18a4127e9315 ("drm/amd/display: Disable CRTC degamma when color pipeline is enabled")
> Signed-off-by: Alex Hung <alex.hung@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c   | 16 ++++++++--------
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c  |  8 ++++++++
>  2 files changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index 130190e8a1b2..304437c2284d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -765,15 +765,15 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
>  	dm->adev->mode_info.crtcs[crtc_index] = acrtc;
>  
>  	/* Don't enable DRM CRTC degamma property for
> -	 * 1. Degamma is replaced by color pipeline.
> -	 * 2. DCE since it doesn't support programmable degamma anywhere.
> -	 * 3. DCN401 since pre-blending degamma LUT doesn't apply to cursor.
> +	 * 1. DCE since it doesn't support programmable degamma anywhere.
> +	 * 2. DCN401 since pre-blending degamma LUT doesn't apply to cursor.
> +	 * Note: DEGAMMA properties are created even if the primary plane has the
> +	 * COLOR_PIPELINE property. User space can use either the DEGAMMA properties
> +	 * or the COLOR_PIPELINE property. An atomic commit which attempts to enable
> +	 * both is rejected.
>  	 */
> -	if (plane->color_pipeline_property)
> -		has_degamma = false;
> -	else
> -		has_degamma = dm->adev->dm.dc->caps.color.dpp.dcn_arch &&
> -			      dm->adev->dm.dc->ctx->dce_version != DCN_VERSION_4_01;
> +	has_degamma = dm->adev->dm.dc->caps.color.dpp.dcn_arch &&
> +		      dm->adev->dm.dc->ctx->dce_version != DCN_VERSION_4_01;
>  
>  	drm_crtc_enable_color_mgmt(&acrtc->base, has_degamma ? MAX_COLOR_LUT_ENTRIES : 0,
>  				   true, MAX_COLOR_LUT_ENTRIES);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 70587e5a8d46..127207e18dcb 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1256,6 +1256,14 @@ static int amdgpu_dm_plane_atomic_check(struct drm_plane *plane,
>  	if (ret)
>  		return ret;
>  
> +	/* Reject commits that attempt to use both COLOR_PIPELINE and CRTC DEGAMMA_LUT */
> +	if (new_plane_state->color_pipeline && new_crtc_state->degamma_lut) {
> +		drm_dbg_atomic(plane->dev,
> +			       "[PLANE:%d:%s] COLOR_PIPELINE and CRTC DEGAMMA_LUT cannot be enabled simultaneously\n",
> +			       plane->base.id, plane->name);
> +		return -EINVAL;
> +	}
> +
>  	ret = amdgpu_dm_plane_fill_dc_scaling_info(adev, new_plane_state, &scaling_info);
>  	if (ret)
>  		return ret;

