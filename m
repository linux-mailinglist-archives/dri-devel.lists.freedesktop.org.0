Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E53B642F6CE
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 17:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE346EDD9;
	Fri, 15 Oct 2021 15:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573B16EDB2;
 Fri, 15 Oct 2021 15:15:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Df22jYBxOBLgM+gQHB/er4qTNvR03ua3SwwNiQ2y65PhHCOwm190PngN5Y1TQBwxS5p7z9IcExHQt6lPbGoMgUEfWJrx/G2zd1ZZz/BwIdzXPxfi2/1KhVqMXcqljQTbclEaIDcSI+f4rY2vHbhmGzIE1u99Xi1n8xS7cAu8gUw4+V2xL1dgS+8QHRN1nTCgm+DCAugliEZ7EKGJZpohXppO1aADcFSiUzq6UFrkaoyYk+4SA/ViLMDXrIwRSHjqnqCDXV9UsDZC2pWpYDNDoy4X8Koe7UHYZkvg/Cp0xNy4rEEe+kJPg9s2hunAuEEyNQUXj6yNySH2Zn9aWZ9kQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nC9mmxFNdL587ewvmiPSSP4GZq2OWjHPS0PG89XjSZU=;
 b=cVMaqBh2j5+ZcC5wf3irghWZozJWpj6xxVgKKTXJKtwLTOUsIrPX0AiOmRcvpsQ+K67GFkWFEvZ/y2sFDnjGa/ITBFnPO17WGPVMT+r/VpltLK+1PcGO7rVKFAfuDWfv68XHYU7BxVfn4jmLj20tzBz3d5ErlksbT0IrFn+i4IQcwif/OHyL/9TdzTLhoMhJMRaAJ6u3yWgd96MsqMOICs/b0pQCNiERBSRn6DagFSAf7xT79nIIwAR+FJpV+zvZdv7aGAvB2MqVVJaNdOBmGBla252ygZWtBFVxdDOZx/BciiwSIuQf/o4uAmRXR0TnJUJhiCVhIojIQUyQ5OE+pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nC9mmxFNdL587ewvmiPSSP4GZq2OWjHPS0PG89XjSZU=;
 b=pugAw6iCg8v7t7Nhe/F/AJ/X3kVr/EjixLCikwNLBzBTgKsUF8zcr1QDtKTbUnDq2QNa6pzwa1UGpU3gErs4j3lJfGc6ssE3/O0vCI4+BMsP7g4peCqCkMOT9LnqQshN/GBlGvYcHMJJ7XtSIOBhpU9k0SNapdOhB1Ly+t82xvY=
Authentication-Results: net-c.es; dkim=none (message not signed)
 header.d=none;net-c.es; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5492.namprd12.prod.outlook.com (2603:10b6:5:35d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 15:14:59 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465%8]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 15:14:59 +0000
Message-ID: <62a3ee8d-9439-9275-4e71-876b865b9a7d@amd.com>
Date: Fri, 15 Oct 2021 11:14:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 02/15] drm/amdgpu: use drm_* functions instead of
 duplicated code in amdgpu driver
Content-Language: en-US
To: Claudio Suarez <cssk@net-c.es>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
References: <20211015113713.630119-1-cssk@net-c.es>
 <20211015113713.630119-3-cssk@net-c.es>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211015113713.630119-3-cssk@net-c.es>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0078.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::11) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0078.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Fri, 15 Oct 2021 15:14:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5999a8fb-ba68-41f9-b927-08d98fee8dd0
X-MS-TrafficTypeDiagnostic: CO6PR12MB5492:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB5492DCF6375C9C6D6C761D0E8CB99@CO6PR12MB5492.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 85ABUbtmY8gZ9xY+rNZt8P9GUmrj2KzIQwts44ObN+jN/unOS9ct1teXHXfP+5JDFvAj1KTjRUEiLIHy5HtZyoy3EaRv+mS7ok98NekMv7YQJoXYRt7QSH63gJrTFSxck050FOZqfyzv4re33ySAMuZlnLf9LTuMQIgPIrLGURqmzVFEOptKPGpv8a10rieUKzO3HYUyDvQ6240jzftN9uTS0hpq92bn7c0bCze26OP2D4p283UtDhWJOUdjA587o8YUJJq8R/Cuhf97XJQN7jcE/B7pjNPYdrrd4QKzH8xM51rjJrNlBT/8cIut1TMSW4LhBcxPsXcWDfAY9CK8Xod7vE5XogJPuYwJYolcihh16qbPzZ+Ekb8EZ7DM7yNqg3FV3fUalaWwffkEHHiXHzADlVHkLEy6I+i2FZnrX2pZZZjntC2CyF1SaHAlhKbCrayqD7nY3j7fFc9rcfoWx3uvB5NwghImx1wx0lIhcBRR8u2gbrnCDeXeiUChwtWw5on5plwFaK0pMj4ndghR91ZE+snS4jhCP33W2exyqGOmorlu5vQsgi+1RZ1rUeJJJ+2KqCoznacF4KQc6ef9GWNFo26gf1NQij9yEGEjPQ7Zdgd3Tzq0iG6KNAoSKVMP9H/li3rVifAd/U4WfwOQaTTKtu/4T49rovJDYmDxK5wAFVs9uv0RQSEyTPkr+QvgPbPQutRSWNh3lbNJh54vdMEX4pqQOGtuOtJhFDO+tpjjRnpQaMYN1JFE8H07LtgpevvG7ivkU6cbk41Y7rNZvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(186003)(921005)(53546011)(5660300002)(316002)(86362001)(26005)(44832011)(16576012)(110136005)(6486002)(956004)(83380400001)(2616005)(36756003)(38100700002)(8676002)(31696002)(66946007)(66476007)(66556008)(4001150100001)(508600001)(30864003)(2906002)(7416002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTVmMHhRN2xDNU9nVDV6UmFyVHR0eHQyc1lUYUxuOHBOMmFxYXpkblpPT0xH?=
 =?utf-8?B?S2NDRzNmaUFGRjlPdE85bFdwaURoT3Byc3JzeXY4NlcvTmlWSjl6L04yMUQ5?=
 =?utf-8?B?R2xuZ0VWaHYvQkRFVkhiQ1FBYVZVbjRRcS9ia3JuZC9vM1dMc2dCZU5uS0xG?=
 =?utf-8?B?V21mdkFuVFU4U1VTRzVjMW9NU3NvVG5Ccjc0SUVZV005cEhYN1BkQnljdWta?=
 =?utf-8?B?cXV4SURZUmRlUllySlcvWXdtNTJWTW9lNEk4NHZFaytqS2RzNDk3WU1PQmRx?=
 =?utf-8?B?dmtFeVVPRksxOTZMRDFKQ2pKcHZVOXg1cmxnT0lpSm1jdHR3L1N3REg1aFRW?=
 =?utf-8?B?ZDVnTlJPZ2dvVVJjYW0vdmlDVjl5RTdHS2lhWTc2MVVuZGdnd0ZsZysxK281?=
 =?utf-8?B?c2FlYWY0T1p5dnZQL3VGcGROWEpsZTkzc0J2b1ZFT1JzQWdJV0RXSUpLakdC?=
 =?utf-8?B?alp5M3JpbVljT2VscWk0a3JUeVhkOUx4ZzBqYnFoZXhlV1orNkowMWI4M2No?=
 =?utf-8?B?LzNEYUs2aXRDbW92Y2Z0ZVkzbTk4MUxIRDVBeHNBYnNsQ05PUURzZ0kwUXJj?=
 =?utf-8?B?SXkySkVzdWlaTTBKNjdWT0R2ZHZuaXZ6RU1jOXJ2VFF4b2VwekhuUWFYUytS?=
 =?utf-8?B?YVdXTkJ2SVNzcW1GRVZjSmhvYUNrRWhUMTR0aTRzbnFJKzBva0ZSa09ncWZF?=
 =?utf-8?B?WnlpSndvUVREc1hRSkxVbWlQZmJiNXlML3B2czZwYmtwb2dLRG1mYVRvY2ds?=
 =?utf-8?B?WG1hY3Y4RWd6VGhDdjNPNXkvYmpnY3hSYWsxQmxhcVFUSFZCL3NOcnBUTFZs?=
 =?utf-8?B?NVNydDhwSWl0WVF0ODFjODFIOTIvMTZhbVlIZkZJblNSc0lwaWt4QjRCZEh6?=
 =?utf-8?B?UDl3Nm9MdUs3eE5GMWF0aE1KMFVBaWZvWG83bnlhQmZ3d1ZxZnI1cm1wYS9R?=
 =?utf-8?B?OEdPUDZKdStPaXVwYWEvcjhPNzNudHcxRmVINlR5SDlaVWFUOW9tVmZFc2pE?=
 =?utf-8?B?WER1SHpBR1NCYXZEVE5mZUZCS0N0bHl2cmdJYVlMZHlCdE5YT0ZSTUtTRGVy?=
 =?utf-8?B?Y0hOQ1NPVzArY0NMejMzWnZHdFZtYzBJRFFkRFFGUFNPNVhoRjVqYklWOGRB?=
 =?utf-8?B?TGJVWlUvci91RjhVbFlCMmpSb2RVaXQwc04rRTJQSEE0dDVFcDJJSU5FYndp?=
 =?utf-8?B?SVdhanZIbWRGM2x2YlhUY0pVOEdyWDBncGM2VDJKMXVVTDg3T1lzamxFVCtn?=
 =?utf-8?B?bnFFN2NVc3piNld0TjdTaUhFa1NNM0Y0RXZLVFdscDFMbTl2YVJOa0lxM3c4?=
 =?utf-8?B?ZXhFOENvS1UrRzN3TXkvenBHUFlrcGJhSUgyQXFIc0UvLzlUUnhDWTFTZCtR?=
 =?utf-8?B?WENLbHRwVnZVNFBHWnBENVRwRjgyMlFISEF6OW9tcjNrMXlkUUFkemlnbVJw?=
 =?utf-8?B?NTUwYklmeTZDVTg4WFhpLzBmS0xJOEJEdGtXVUdmSzJVckdEeEJYRVRPZ0R1?=
 =?utf-8?B?ME1na2treEVTZ0pkU25GYlRsSnI2azJNUXVnSVo5bCtGcDJpOXJueDNaQmIw?=
 =?utf-8?B?c0thSWltZmhqZldqRVZwYnZMR3diSURabm1BQ3dWWkw3N1gxR1VXTmxrVWpr?=
 =?utf-8?B?NzZ1ekJXNnlpNVcyKzl3MHZYS3Q4cXZ4d0RXK0ppTlJuVWpsZjQ2ak5TNlEy?=
 =?utf-8?B?Q0diYUR4aUJtVkF5cGxhQWJZeXFTOXdhbG11MGkxYnJWdTIrOTNSNHl2aUVp?=
 =?utf-8?Q?GVYJwWdhReHfeR9JbuVWxKhUvgYIPbqNOhRmox6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5999a8fb-ba68-41f9-b927-08d98fee8dd0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 15:14:59.6837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KAR4PNzZ6l3Adel1DiYqzASG+mZZ9ufqSxLpoUo4pjSK+RappPqcNxnng3sekXosmPkBkQzfjDtj8C7ikoIpYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5492
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



On 2021-10-15 07:37, Claudio Suarez wrote:
> a) Once EDID is parsed, the monitor HDMI support information is available
> through drm_display_info.is_hdmi. The amdgpu driver still calls
> drm_detect_hdmi_monitor() to retrieve the same information, which
> is less efficient. Change to drm_display_info.is_hdmi
> 
> This is a TODO task in Documentation/gpu/todo.rst
> 
> b) drm_display_info is updated by drm_get_edid() or
> drm_connector_update_edid_property(). In the amdgpu driver it is almost
> always updated when the edid is read in amdgpu_connector_get_edid(),
> but not always.  Change amdgpu_connector_get_edid() and
> amdgpu_connector_free_edid() to keep drm_display_info updated. This allows a)
> to work properly.
> 
> c) Use drm_edid_get_monitor_name() instead of duplicating the code that
> parses the EDID in dm_helpers_parse_edid_caps()
> 
> Also, remove the unused "struct dc_context *ctx" parameter in
> dm_helpers_parse_edid_caps()
> 

Thanks for this work.

The fact that you listed three separate changes in this commit
is a clear indication that this patch should be three separate
patches instead. Separating the functional bits from the straight
refactor will help with bisection if this leads to a regression.

All changes look reasonable to me, though. With this patch split
into three patches in the sequence (b), (c), then (a) this is
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> Signed-off-by: Claudio Suarez <cssk@net-c.es>
> ---
>  .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 23 +++++++----
>  .../gpu/drm/amd/amdgpu/amdgpu_connectors.h    |  2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c  |  4 +-
>  .../gpu/drm/amd/amdgpu/atombios_encoders.c    |  6 +--
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 39 ++++++-------------
>  drivers/gpu/drm/amd/display/dc/core/dc.c      |  2 +-
>  drivers/gpu/drm/amd/display/dc/dm_helpers.h   |  2 +-
>  9 files changed, 39 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> index b9c11c2b2885..7b41a1120b70 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -25,6 +25,7 @@
>   */
>  
>  #include <drm/drm_edid.h>
> +#include <drm/drm_connector.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_dp_helper.h>
>  #include <drm/drm_probe_helper.h>
> @@ -108,7 +109,7 @@ int amdgpu_connector_get_monitor_bpc(struct drm_connector *connector)
>  	case DRM_MODE_CONNECTOR_DVII:
>  	case DRM_MODE_CONNECTOR_HDMIB:
>  		if (amdgpu_connector->use_digital) {
> -			if (drm_detect_hdmi_monitor(amdgpu_connector_edid(connector))) {
> +			if (amdgpu_connector_is_hdmi_monitor(connector)) {
>  				if (connector->display_info.bpc)
>  					bpc = connector->display_info.bpc;
>  			}
> @@ -116,7 +117,7 @@ int amdgpu_connector_get_monitor_bpc(struct drm_connector *connector)
>  		break;
>  	case DRM_MODE_CONNECTOR_DVID:
>  	case DRM_MODE_CONNECTOR_HDMIA:
> -		if (drm_detect_hdmi_monitor(amdgpu_connector_edid(connector))) {
> +		if (amdgpu_connector_is_hdmi_monitor(connector)) {
>  			if (connector->display_info.bpc)
>  				bpc = connector->display_info.bpc;
>  		}
> @@ -125,7 +126,7 @@ int amdgpu_connector_get_monitor_bpc(struct drm_connector *connector)
>  		dig_connector = amdgpu_connector->con_priv;
>  		if ((dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_DISPLAYPORT) ||
>  		    (dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_eDP) ||
> -		    drm_detect_hdmi_monitor(amdgpu_connector_edid(connector))) {
> +		    (amdgpu_connector_is_hdmi_monitor(connector))) {
>  			if (connector->display_info.bpc)
>  				bpc = connector->display_info.bpc;
>  		}
> @@ -149,7 +150,7 @@ int amdgpu_connector_get_monitor_bpc(struct drm_connector *connector)
>  		break;
>  	}
>  
> -	if (drm_detect_hdmi_monitor(amdgpu_connector_edid(connector))) {
> +	if (amdgpu_connector_is_hdmi_monitor(connector)) {
>  		/*
>  		 * Pre DCE-8 hw can't handle > 12 bpc, and more than 12 bpc doesn't make
>  		 * much sense without support for > 12 bpc framebuffers. RGB 4:4:4 at
> @@ -315,8 +316,10 @@ static void amdgpu_connector_get_edid(struct drm_connector *connector)
>  	if (!amdgpu_connector->edid) {
>  		/* some laptops provide a hardcoded edid in rom for LCDs */
>  		if (((connector->connector_type == DRM_MODE_CONNECTOR_LVDS) ||
> -		     (connector->connector_type == DRM_MODE_CONNECTOR_eDP)))
> +		     (connector->connector_type == DRM_MODE_CONNECTOR_eDP))) {
>  			amdgpu_connector->edid = amdgpu_connector_get_hardcoded_edid(adev);
> +			drm_connector_update_edid_property(connector, amdgpu_connector->edid);
> +		}
>  	}
>  }
>  
> @@ -326,6 +329,7 @@ static void amdgpu_connector_free_edid(struct drm_connector *connector)
>  
>  	kfree(amdgpu_connector->edid);
>  	amdgpu_connector->edid = NULL;
> +	drm_connector_update_edid_property(connector, NULL);
>  }
>  
>  static int amdgpu_connector_ddc_get_modes(struct drm_connector *connector)
> @@ -1170,7 +1174,7 @@ static enum drm_mode_status amdgpu_connector_dvi_mode_valid(struct drm_connector
>  		    (amdgpu_connector->connector_object_id == CONNECTOR_OBJECT_ID_DUAL_LINK_DVI_D) ||
>  		    (amdgpu_connector->connector_object_id == CONNECTOR_OBJECT_ID_HDMI_TYPE_B)) {
>  			return MODE_OK;
> -		} else if (drm_detect_hdmi_monitor(amdgpu_connector_edid(connector))) {
> +		} else if (amdgpu_connector_is_hdmi_monitor(connector)) {
>  			/* HDMI 1.3+ supports max clock of 340 Mhz */
>  			if (mode->clock > 340000)
>  				return MODE_CLOCK_HIGH;
> @@ -1322,6 +1326,11 @@ bool amdgpu_connector_is_dp12_capable(struct drm_connector *connector)
>  	return false;
>  }
>  
> +bool amdgpu_connector_is_hdmi_monitor(struct drm_connector *connector)
> +{
> +	return connector->display_info.is_hdmi;
> +}
> +
>  static enum drm_connector_status
>  amdgpu_connector_dp_detect(struct drm_connector *connector, bool force)
>  {
> @@ -1462,7 +1471,7 @@ static enum drm_mode_status amdgpu_connector_dp_mode_valid(struct drm_connector
>  		    (amdgpu_dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_eDP)) {
>  			return amdgpu_atombios_dp_mode_valid_helper(connector, mode);
>  		} else {
> -			if (drm_detect_hdmi_monitor(amdgpu_connector_edid(connector))) {
> +			if (amdgpu_connector_is_hdmi_monitor(connector)) {
>  				/* HDMI 1.3+ supports max clock of 340 Mhz */
>  				if (mode->clock > 340000)
>  					return MODE_CLOCK_HIGH;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.h
> index 61fcef15ad72..0843540e01f2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.h
> @@ -29,6 +29,8 @@ void amdgpu_connector_hotplug(struct drm_connector *connector);
>  int amdgpu_connector_get_monitor_bpc(struct drm_connector *connector);
>  u16 amdgpu_connector_encoder_get_dp_bridge_encoder_id(struct drm_connector *connector);
>  bool amdgpu_connector_is_dp12_capable(struct drm_connector *connector);
> +bool amdgpu_connector_is_hdmi_monitor(struct drm_connector *connector);
> +
>  void
>  amdgpu_connector_add(struct amdgpu_device *adev,
>  		      uint32_t connector_id,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index dc50c05f23fc..41b43207e9fa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -1364,7 +1364,7 @@ bool amdgpu_display_crtc_scaling_mode_fixup(struct drm_crtc *crtc,
>  		if ((!(mode->flags & DRM_MODE_FLAG_INTERLACE)) &&
>  		    ((amdgpu_encoder->underscan_type == UNDERSCAN_ON) ||
>  		     ((amdgpu_encoder->underscan_type == UNDERSCAN_AUTO) &&
> -		      drm_detect_hdmi_monitor(amdgpu_connector_edid(connector)) &&
> +		      amdgpu_connector_is_hdmi_monitor(connector) &&
>  		      amdgpu_display_is_hdtv_mode(mode)))) {
>  			if (amdgpu_encoder->underscan_hborder != 0)
>  				amdgpu_crtc->h_border = amdgpu_encoder->underscan_hborder;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c
> index af4ef84e27a7..34799786bb40 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c
> @@ -222,7 +222,7 @@ bool amdgpu_dig_monitor_is_duallink(struct drm_encoder *encoder,
>  	case DRM_MODE_CONNECTOR_HDMIB:
>  		if (amdgpu_connector->use_digital) {
>  			/* HDMI 1.3 supports up to 340 Mhz over single link */
> -			if (drm_detect_hdmi_monitor(amdgpu_connector_edid(connector))) {
> +			if (amdgpu_connector_is_hdmi_monitor(connector)) {
>  				if (pixel_clock > 340000)
>  					return true;
>  				else
> @@ -244,7 +244,7 @@ bool amdgpu_dig_monitor_is_duallink(struct drm_encoder *encoder,
>  			return false;
>  		else {
>  			/* HDMI 1.3 supports up to 340 Mhz over single link */
> -			if (drm_detect_hdmi_monitor(amdgpu_connector_edid(connector))) {
> +			if (amdgpu_connector_is_hdmi_monitor(connector)) {
>  				if (pixel_clock > 340000)
>  					return true;
>  				else
> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> index 6134ed964027..07c4ff14f2a7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> @@ -469,7 +469,7 @@ int amdgpu_atombios_encoder_get_encoder_mode(struct drm_encoder *encoder)
>  			if (amdgpu_connector->use_digital &&
>  			    (amdgpu_connector->audio == AMDGPU_AUDIO_ENABLE))
>  				return ATOM_ENCODER_MODE_HDMI;
> -			else if (drm_detect_hdmi_monitor(amdgpu_connector_edid(connector)) &&
> +			else if (amdgpu_connector_is_hdmi_monitor(connector) &&
>  				 (amdgpu_connector->audio == AMDGPU_AUDIO_AUTO))
>  				return ATOM_ENCODER_MODE_HDMI;
>  			else if (amdgpu_connector->use_digital)
> @@ -488,7 +488,7 @@ int amdgpu_atombios_encoder_get_encoder_mode(struct drm_encoder *encoder)
>  		if (amdgpu_audio != 0) {
>  			if (amdgpu_connector->audio == AMDGPU_AUDIO_ENABLE)
>  				return ATOM_ENCODER_MODE_HDMI;
> -			else if (drm_detect_hdmi_monitor(amdgpu_connector_edid(connector)) &&
> +			else if (amdgpu_connector_is_hdmi_monitor(connector) &&
>  				 (amdgpu_connector->audio == AMDGPU_AUDIO_AUTO))
>  				return ATOM_ENCODER_MODE_HDMI;
>  			else
> @@ -506,7 +506,7 @@ int amdgpu_atombios_encoder_get_encoder_mode(struct drm_encoder *encoder)
>  		} else if (amdgpu_audio != 0) {
>  			if (amdgpu_connector->audio == AMDGPU_AUDIO_ENABLE)
>  				return ATOM_ENCODER_MODE_HDMI;
> -			else if (drm_detect_hdmi_monitor(amdgpu_connector_edid(connector)) &&
> +			else if (amdgpu_connector_is_hdmi_monitor(connector) &&
>  				 (amdgpu_connector->audio == AMDGPU_AUDIO_AUTO))
>  				return ATOM_ENCODER_MODE_HDMI;
>  			else
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 1ea31dcc7a8b..02ecd216a556 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -2583,13 +2583,12 @@ void amdgpu_dm_update_connector_after_detect(
>  			aconnector->edid =
>  				(struct edid *)sink->dc_edid.raw_edid;
>  
> -			drm_connector_update_edid_property(connector,
> -							   aconnector->edid);
>  			if (aconnector->dc_link->aux_mode)
>  				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux,
>  						    aconnector->edid);
>  		}
>  
> +		drm_connector_update_edid_property(connector, aconnector->edid);
>  		amdgpu_dm_update_freesync_caps(connector, aconnector->edid);
>  		update_connector_ext_caps(aconnector);
>  	} else {
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 6fee12c91ef5..2051dd27ef3b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -29,6 +29,7 @@
>  
>  #include <drm/drm_probe_helper.h>
>  #include <drm/amdgpu_drm.h>
> +#include <drm/drm_connector.h>
>  #include <drm/drm_edid.h>
>  
>  #include "dm_services.h"
> @@ -37,6 +38,7 @@
>  #include "amdgpu_dm.h"
>  #include "amdgpu_dm_irq.h"
>  #include "amdgpu_dm_mst_types.h"
> +#include "amdgpu_connectors.h"
>  
>  #include "dm_helpers.h"
>  
> @@ -50,16 +52,17 @@
>   *	void
>   * */
>  enum dc_edid_status dm_helpers_parse_edid_caps(
> -		struct dc_context *ctx,
> +		struct dc_link *link,
>  		const struct dc_edid *edid,
>  		struct dc_edid_caps *edid_caps)
>  {
> +	struct amdgpu_dm_connector *aconnector = link->priv;
> +	struct drm_connector *connector = &aconnector->base;
>  	struct edid *edid_buf = (struct edid *) edid->raw_edid;
>  	struct cea_sad *sads;
>  	int sad_count = -1;
>  	int sadb_count = -1;
>  	int i = 0;
> -	int j = 0;
>  	uint8_t *sadb = NULL;
>  
>  	enum dc_edid_status result = EDID_OK;
> @@ -78,23 +81,11 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>  	edid_caps->manufacture_week = edid_buf->mfg_week;
>  	edid_caps->manufacture_year = edid_buf->mfg_year;
>  
> -	/* One of the four detailed_timings stores the monitor name. It's
> -	 * stored in an array of length 13. */
> -	for (i = 0; i < 4; i++) {
> -		if (edid_buf->detailed_timings[i].data.other_data.type == 0xfc) {
> -			while (j < 13 && edid_buf->detailed_timings[i].data.other_data.data.str.str[j]) {
> -				if (edid_buf->detailed_timings[i].data.other_data.data.str.str[j] == '\n')
> -					break;
> -
> -				edid_caps->display_name[j] =
> -					edid_buf->detailed_timings[i].data.other_data.data.str.str[j];
> -				j++;
> -			}
> -		}
> -	}
> +	drm_edid_get_monitor_name(edid_buf,
> +				  edid_caps->display_name,
> +				  AUDIO_INFO_DISPLAY_NAME_SIZE_IN_CHARS);
>  
> -	edid_caps->edid_hdmi = drm_detect_hdmi_monitor(
> -			(struct edid *) edid->raw_edid);
> +	edid_caps->edid_hdmi = amdgpu_connector_is_hdmi_monitor(connector);
>  
>  	sad_count = drm_edid_to_sad((struct edid *) edid->raw_edid, &sads);
>  	if (sad_count <= 0)
> @@ -610,14 +601,8 @@ enum dc_edid_status dm_helpers_read_local_edid(
>  		/* We don't need the original edid anymore */
>  		kfree(edid);
>  
> -		/* connector->display_info will be parsed from EDID and saved
> -		 * into drm_connector->display_info from edid by call stack
> -		 * below:
> -		 * drm_parse_ycbcr420_deep_color_info
> -		 * drm_parse_hdmi_forum_vsdb
> -		 * drm_parse_cea_ext
> -		 * drm_add_display_info
> -		 * drm_connector_update_edid_property
> +		/* connector->display_info is parsed from EDID and saved
> +		 * into drm_connector->display_info
>  		 *
>  		 * drm_connector->display_info will be used by amdgpu_dm funcs,
>  		 * like fill_stream_properties_from_drm_display_mode
> @@ -625,7 +610,7 @@ enum dc_edid_status dm_helpers_read_local_edid(
>  		amdgpu_dm_update_connector_after_detect(aconnector);
>  
>  		edid_status = dm_helpers_parse_edid_caps(
> -						ctx,
> +						link,
>  						&sink->dc_edid,
>  						&sink->edid_caps);
>  
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index c798c65d4276..5efe89fe6c2c 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -3254,7 +3254,7 @@ struct dc_sink *dc_link_add_remote_sink(
>  		goto fail_add_sink;
>  
>  	edid_status = dm_helpers_parse_edid_caps(
> -			link->ctx,
> +			link,
>  			&dc_sink->dc_edid,
>  			&dc_sink->edid_caps);
>  
> diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> index 9ab854293ace..94dc80060610 100644
> --- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> +++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> @@ -59,7 +59,7 @@ void dm_helpers_free_gpu_mem(
>  		void *pvMem);
>  
>  enum dc_edid_status dm_helpers_parse_edid_caps(
> -	struct dc_context *ctx,
> +	struct dc_link *link,
>  	const struct dc_edid *edid,
>  	struct dc_edid_caps *edid_caps);
>  
> 

