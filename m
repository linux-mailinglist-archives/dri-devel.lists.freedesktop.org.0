Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0BF74F482
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 18:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B8310E3DB;
	Tue, 11 Jul 2023 16:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA7210E3D2;
 Tue, 11 Jul 2023 16:10:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VN3B17G5YxPkmSPpXzfgBZlgM4P7bxMH0co6/ztyrfE28YOOWbviqfbnA4UF7fJVl3gpLycpwpBK4TBES7KG6eIh+9o8hbm1t0nPneZS8rnjSNEBrt9vMbv4jjerO44yRSILX148awcKV1XnQcZuY0H7trNrZdk2AesG9T7ao5U0m7/eVAsswAfznpgE7K1mvLjNrtXdXN0WHELydVJwQv/FL2aVP3rruobX1CdneZ6beI1C0S8F8wzyCbX/0wNKpWH8d6zkXH0cstu5/D4xAmNAd8SugrRYxMt6kMjK2VoCUw8Xcma3EU/J03HxcDQfBkMl6mFGfFXJhpqA3eVSkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7kitYC+N/ZEKnVeRXUrpwC5sUAB1jQpQ/0i8cEbgdE=;
 b=BvI6BLrdyJ5E0Vz+CMVddGCtZYjsORLcqL3ZqrfC6dIvM2LmBBYZHnjZUUBodFNs83kVJC68QrxJDl8ajucBtedOuvt8S3rRQ/I/VzQgXH7Rzp6UuMjxmiF9KfjK3Emgich977Za2ZmBVuKJpdKi5LQvD8csXr+EK23XQs1a6pOnDOHYeceqXIzLqIctwRsWTZYyFO/YzONHAvN5g9S5fgY6eIz6UezXdyXHwHJwfeY9K+G39zqwCkrTl96OrFBecX2LrsyITUXsQ58NXdvAKaQ3kDQpJC+XyZwECcXyVtTCNS3s0cInwXQEj7nXRYv/L4sn62MECQni3HNUAwV47Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7kitYC+N/ZEKnVeRXUrpwC5sUAB1jQpQ/0i8cEbgdE=;
 b=SS+iVxHRSx7HK+MNLFtceH0EY+4V98hI58tUgoyr7XT2pordSKNjhgOevSnphYSTr3RssX9L4VIxlfiqAUwDiyOReH/hD28OSE8rHYiBc90fBYKxq2k5ViaggY9kzommahQC0iKa7kpuDxxzXZkKVNVB96O+R8e4X1CSovnLPCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH8PR12MB7375.namprd12.prod.outlook.com (2603:10b6:510:215::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26; Tue, 11 Jul
 2023 16:10:09 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c%7]) with mapi id 15.20.6565.026; Tue, 11 Jul 2023
 16:10:09 +0000
Message-ID: <b94c0ce9-ef64-3bfa-1f04-73104f942372@amd.com>
Date: Tue, 11 Jul 2023 12:10:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] amd/display: only accept async flips for fast updates
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230621202459.979661-1-andrealmeid@igalia.com>
 <20230621202459.979661-2-andrealmeid@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230621202459.979661-2-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::18) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH8PR12MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 28899a74-a856-418d-e18f-08db82294c51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hedUpD1ptl2ywP37hlfjeUBJPfvCxlZqPyt5MIws1bQrgDVuBX4QzZMJr3XFZ1CX66Kke3VsdLKp9PuxqgtE2FJndVyag8Kix/3YuZnrxJdos86Wiz7cuWBTw0vRhNM3pFBfNE4851c4wYa86/TGYI/GuKbsBEZ7Os+fuyQVoIk1NM6TWHn21K6WnvuShjO0jn5wFUHgN5YcWKrH/SRsVBaFb0TcZW6308h/GHsubCZTX2AAITcUvpsRlgzWg4oYhNppOhSd/zbkUjF8fvehSeQ145iTyuIljKDvNFJezINfYdG3gHG1f+Xlum2aoIZd11+OH6qGChkqU8ZZv32rIwDgQhANhz/zOY1iJM9JVVtIpIkhJhvJo8aXy7TYG/YvTY38oi8zM3To7I+gmgsfEYEKZKx22xy0e0mNYRwmZ966MzWO7uXhOgAnxcnORBWRyQqpUV0Bq39SFMF1R/fxP1rzrxzvedUsd+zY3q0n4sAHFdXWsM7EIWhY0DYvC/i8HUEoHxsYICcNlYmJfiZy9snpdIOqC/ciWdgblc9hkIx5WN5xEJffkd7B1sQ8yM3EKnyAXJ4rmAOF803SDoTbDLlrd0HaINschg6VkdCCljgUJFra3BBMi8b5s9yN3VoLsgBFTuQBC16gdETA+eQ35g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199021)(31686004)(6486002)(6666004)(478600001)(2616005)(83380400001)(31696002)(36756003)(86362001)(186003)(2906002)(66946007)(6506007)(15650500001)(6512007)(66556008)(38100700002)(66476007)(26005)(316002)(8936002)(4326008)(41300700001)(5660300002)(53546011)(8676002)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEtzRFVGM3BJVDJ6aVA0c09lY0F6aHNZY20rZ0xOaC84VFB0TmVMMENibXJs?=
 =?utf-8?B?Y3BVS0Q2cnFvenN6SU5RdDRnT2JBZ1FLV2Y1ZkJ6WVdGQXphanpFc25zaHBh?=
 =?utf-8?B?dGdTMzFFR0lxU2ZBSFJBSnpxTFo4SmtVZ0ZISVg5Y2trNjJkdE5IZzU3TnRs?=
 =?utf-8?B?UlRpR3Body8zcSs3bjE3eTBFdlV6elREZ1pMMFFhcjBybFJKYTNWU2szeUZT?=
 =?utf-8?B?eWxxRWFBOFhJMGVpWUVMdTlaL050YVJRTXRGNFBTY0RRTUsrWVQyYTZFS0Fo?=
 =?utf-8?B?eGo5T1I3WmtiNGJTc3pUL2ZoOWplVGFPdE56bXE3amh5azVBdXMzQ1JuOU0z?=
 =?utf-8?B?UzBZM1lteG9oUkxwZTIwTWVxbVJmYXM4OHpMUlpCc0RiREcwOTJKd29hYVRF?=
 =?utf-8?B?VzlXNGRKeFlIQ1NsR1VsMllheUNoZnRjQkkxR2hYNWlCbDNWWEJiR0RmL29p?=
 =?utf-8?B?TVVZVEt2bG01TlBzUU5lc2RaK3U5OFpNaDNvS3hNcFIxV0tNbnRIRTFmTzMv?=
 =?utf-8?B?Smt3NVZRWGxoMlJoUlhnUnNwK2kzaEMvTjhRc0o3bXk3ZmY5c0NzNk1qZXNs?=
 =?utf-8?B?NFBGODJmNWRONU5TNTFLTEZZSlBzYkNaSXBKVWRTZHQxSFY4eGgybUx6K0ky?=
 =?utf-8?B?Tm9zdjB2SDFPVGRqWG1aWmQ1STBScFh5L2o2UFIyNDNBdjRYbUVwUkZFRUUx?=
 =?utf-8?B?elhJSG1iK0thR1diZXR1WWcwREJlM0YyV2ovdnZvZnc2ZnY1Nm04VkdRN1Yz?=
 =?utf-8?B?RmZSNnpsYzAwaUd1MG01WTF5L0xaWkwyem94dlNJNFhQc2FlQWt3V25NNjBH?=
 =?utf-8?B?Ymw5QUxIREYweUNRNkM3K3ZCLzVQdjE5TzVTcEowb3pnaXh0aDBPb052NHpK?=
 =?utf-8?B?eGpXSTFDcU9FdVhVV1Y3Y3ZKVHJnc3ljODN0bTN5eGJjQzdwdlIrNXB3Q1Fi?=
 =?utf-8?B?TmpSTnlUUGNZeGlwbElGWVI1OWdna1Iza2hnbG5LakUxZGhibkFSMXlZTG96?=
 =?utf-8?B?VE13dzhTOGpFdkh1aVVvOU91WmVJZnFhZlhCMGFLREo5WlFMaE5jNFBEYWpU?=
 =?utf-8?B?bis1UU52RUpERWRsUWN1eVBad09ldlpqczNRc0l1VEgvNjg0UUdKZ2hJRmQ1?=
 =?utf-8?B?QzdtTFVHTlRSOUQ3OFBxN1c2NGJJTjZQWElmai9kenpObnJOS3laWEd1RUZF?=
 =?utf-8?B?dk85bUtmTXh3TUpsQUY2Smo5bUh5YlM0dkQ5T1JmSFVOaldTOXIxd0hlWjUx?=
 =?utf-8?B?THVDRysya3JvdEk1TE9VcU5XMGl6a1J2SDhWL1VtSGVJdk9PdzhWYW1IVGN2?=
 =?utf-8?B?cmVtVTc0VnNrZHNobzhiV2o3YWZoUmQwU0dnZkVOSW11R29GMHcrSUVWSzA2?=
 =?utf-8?B?OC9uSmh2ZWtBeEcwSzRBc2tJcmFQbWF1ZWNhTm5yM1F0K2I1SU4zQm43amly?=
 =?utf-8?B?N2NKUHRKaDhCSmRKNzlxMlVidm5obkUzeENRbk8xRVFjaWNHb2VjTEZsSjhK?=
 =?utf-8?B?WjZpMXVYUGV4S3hxcDRYUEdKc1J2SVF1eEtEYUx2KzVzZGR0KzZxWGI4VTdH?=
 =?utf-8?B?OFRHOFFRcWRxMEtrYzUrSHFlcEUzVG0rWTR1MjZKWGtyV2lMU3FxLzFmL085?=
 =?utf-8?B?NnUyYVF4ZmJNMlFCRHJRekhJLzJSaG43ck43NXRObnFOczN1Q3RBRWxXRDF0?=
 =?utf-8?B?TlFJUUJXMlJjdVY0TlN6ZWVvZnlpWEZBL3dpMm1tOXgwcm9UL01zcjlnSHJW?=
 =?utf-8?B?NXpNK0dsQTVTZ3hHSHp1TGc2N3pXa0oxT1g3ZmRBdTRDeURYb1daWDU4cU1z?=
 =?utf-8?B?TitLSExKMkxwWmIvTnJvS0h3Zmt3dzZOQW9GdWZSK21aVmJLS3lBSHZvaE9G?=
 =?utf-8?B?UzlCWjRzM0RPM1FDWml0TitZdWlJSXR4MkYvQWRLV1RGTHBlSzVwb2ZPN0d4?=
 =?utf-8?B?NWFVM0hhVmpqcGVGN1RJRzB1bTRBTU9VSnJvRnlzK3B4MUxkL1RDWHJmL1hn?=
 =?utf-8?B?RG83SU5tdjdNdUZ6MXhNVStsNlplbmw2ZkVxWHdETjlHMmFVSmZSaVRIeFY1?=
 =?utf-8?B?YmlnVFMxamo0WkQ4YUZRV0tEQ3VabE96TUhPSEN0d2JVYW1GM2RYd29CaWlJ?=
 =?utf-8?Q?AkQ/F4nuLv2kRMJp7FRTvQDkc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28899a74-a856-418d-e18f-08db82294c51
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 16:10:09.2233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5tHZ+jtsQ2I+XrzTBQMTe59oqnvaoRl5h2Td8t8S7oszHlrVRghE0Jm1idGaoj5H9TNopg5qxC16ewBxdgT8HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7375
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 michel.daenzer@mailbox.org, kernel-dev@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-21 16:24, André Almeida wrote:
> From: Simon Ser <contact@emersion.fr>
> 
> Up until now, amdgpu was silently degrading to vsync when
> user-space requested an async flip but the hardware didn't support
> it.
> 
> The hardware doesn't support immediate flips when the update changes
> the FB pitch, the DCC state, the rotation, enables or disables CRTCs
> or planes, etc. This is reflected in the dm_crtc_state.update_type
> field: UPDATE_TYPE_FAST means that immediate flip is supported.
> 
> Silently degrading async flips to vsync is not the expected behavior
> from a uAPI point-of-view. Xorg expects async flips to fail if
> unsupported, to be able to fall back to a blit. i915 already behaves
> this way.
> 
> This patch aligns amdgpu with uAPI expectations and returns a failure
> when an async flip is not possible.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: André Almeida <andrealmeid@igalia.com>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  8 ++++++++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c   | 12 ++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 514f6785a020..1d9b84e5835f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -8136,7 +8136,15 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>  		 * Only allow immediate flips for fast updates that don't
>  		 * change memory domain, FB pitch, DCC state, rotation or
>  		 * mirroring.
> +		 *
> +		 * dm_crtc_helper_atomic_check() only accepts async flips with
> +		 * fast updates.
>  		 */
> +		if (crtc->state->async_flip &&
> +		    acrtc_state->update_type != UPDATE_TYPE_FAST)
> +			drm_warn_once(state->dev,
> +				      "[PLANE:%d:%s] async flip with non-fast update\n",
> +				      plane->base.id, plane->name);
>  		bundle->flip_addrs[planes_count].flip_immediate =
>  			crtc->state->async_flip &&
>  			acrtc_state->update_type == UPDATE_TYPE_FAST &&
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index 440fc0869a34..30d4c6fd95f5 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -398,6 +398,18 @@ static int dm_crtc_helper_atomic_check(struct drm_crtc *crtc,
>  		return -EINVAL;
>  	}
>  
> +	/*
> +	 * Only allow async flips for fast updates that don't change the FB
> +	 * pitch, the DCC state, rotation, etc.
> +	 */
> +	if (crtc_state->async_flip &&
> +	    dm_crtc_state->update_type != UPDATE_TYPE_FAST) {
> +		drm_dbg_atomic(crtc->dev,
> +			       "[CRTC:%d:%s] async flips are only supported for fast updates\n",
> +			       crtc->base.id, crtc->name);
> +		return -EINVAL;
> +	}
> +
>  	/* In some use cases, like reset, no stream is attached */
>  	if (!dm_crtc_state->stream)
>  		return 0;

