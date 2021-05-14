Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EC2380C0E
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 16:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D73E6EE9E;
	Fri, 14 May 2021 14:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB3C6EE9B;
 Fri, 14 May 2021 14:42:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBFF69IUQoKQB9vs0wxCLArnJ2bNKSCuJ0tgYqA/injg6uwLb/9rTCmAtvI57Nj3uNJLjXNuf08lPKcMKmWLaIvmc3Db99CvOqchg/7+e2/BYKDXJvViuLs+tNZyPg5x/hFbXgbVkRSb1ssAQR+Bz+gs6t8dM5uQazIGE1TQ0aRLkuvYdAnJvqd5d6xHkI+RLVhuIo/GgLasTREWBvxKKASGSGnj54tMxgdXIGsA7kt0kioipoqx0qmONqKPbuiQZyiuCFqPBYLtFWq9XvsgrCvlNult3F9r0lUYZ843fWNuNDHp57z889jCWVH6q0jfUwUVbFqRkyjcOzwpgHhKAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEmqVvptQHIRnduYbte/cypvMzU+QrqFetlGguEaV/8=;
 b=hJa1ulQMDVOCcfHegn38a08MuiJ+mfxVchgBRxTJQ7RZ64eY7A3cElDddcYpBM7wAY0Wz/SKU1Ep9+2CpWBFmpKakOfcU6jYwHtyYscyu4aqdZLW65yMlg/+5uskuFGGrl1bMzerz8JlFLwcRg1u6o44ZIH+kpalgs+Ll+fHn8MOgqUNpJb9IvJ2G5PNc7Xtc42SndBPocH2ht77jnQDKNYh6oFU98G+mxIJ/nAKjNtLmmyA+KI2ctZaUNYBpHeTx6RSKzGR1l2E8woCKJyXXpsOJOjO1CWkXtH9pJE+kwU7frncNRDPrcwwt0zelBrgDKZm8Xkw5xnkBcCSAXnXVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEmqVvptQHIRnduYbte/cypvMzU+QrqFetlGguEaV/8=;
 b=RbkByJVpHG/VPmmDe+7d5HTjh+ekqS727n1vTJjMpblW0MyqFw38w6LXlGvaGg27USmkQgQPVEFu3Vp06n7vKjD3HqSmXOABxtwXMMt7yIC+l2zYpItmWxmCctHgr+MVpHE4W9aH1EUA0+z6BFqWQQPizaOGhh4aFPNRjaVZDlw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2654.namprd12.prod.outlook.com (2603:10b6:805:73::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 14 May
 2021 14:42:07 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.026; Fri, 14 May 2021
 14:42:07 +0000
Subject: Re: [PATCH v7 12/16] drm/amdgpu: Fix hang on device removal.
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-13-andrey.grodzovsky@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <0e13e0fb-5cf8-30fa-6ed8-a0648f8fe50b@amd.com>
Date: Fri, 14 May 2021 10:42:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210512142648.666476-13-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [207.107.137.243]
X-ClientProxiedBy: YQBPR0101CA0144.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::17) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.30.117.98] (207.107.137.243) by
 YQBPR0101CA0144.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Fri, 14 May 2021 14:42:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e16f396-777e-4d0b-73fb-08d916e6727e
X-MS-TrafficTypeDiagnostic: SN6PR12MB2654:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2654DC465775E9438B8EC2ADEA509@SN6PR12MB2654.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iZ26MEl14Qvr0OeXnlfXVpBdgOWWsCLJgm3jRiyHrlAYutKi97NsKwgUyw8Uot2eTf4j3rtL4xIzEvau9QrsnMH+6YVkZLDBYtkIMncOfcDnkjsadXFGuGLH66c1D/FaT/pzVXT7V2MZL7heh+qm9k+4rd/ciUTbeUqstG2R6ju8M0rSEkuhGWLKefn5maOfwpp7zLoIsVKnSwnHAvUXW1ebCZuwHwnIlRDx/QMO7YJrDwCS2QV7fS1PVuLtHM/0tm9RQmq9pWFM3Vv4Q5JdU57oGQ7DqFdqgLbkrCLOLEaJFdoBgfA2gNrE7H4LI8A3TnQ3/0nJ1ro+icy04wcqk1N1IQSLuC4zOh4ZY6B6aob8uoQER64NEDRVLwzhxjD9sjI0gaF6Ec/t26g7spjaiL2hDRkY67FnuDG8a/7jdJi/RJMZpygu6s0Y4rJRRCABoptrJB6CqTQgf94pHrm/VhWL9kjmDSVwoJvo/AJeRy4RPHNdqAZoS621qATTYisoseXYlJnT48Y7gLC8YcgjRDmjlBMboUSBduBehe/DEhFuLSMrAxIIOYQmydX+R+fwpCub0RbTvooeFtc26zuYeGkXK30qeAbjQHmtrEy6gCDAs6LhYHIRV2PbnWF1fpqFc5fHKZUmG7kMVBsq0A2y56Gb+bTMoEg/GE7kSKOvGeU3yqHlI3MSAkjCK3uQVi3/35YdSxEZ1w7siKED3It+ccbjTnyXwWTQhzvADaUAeaI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(31696002)(6486002)(5660300002)(86362001)(8936002)(316002)(8676002)(2906002)(38350700002)(26005)(38100700002)(83380400001)(52116002)(36756003)(66556008)(4326008)(16576012)(44832011)(956004)(66946007)(53546011)(478600001)(66476007)(2616005)(186003)(6666004)(6636002)(16526019)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bTZ1cXhReFdnZmhBWDU2bUVLT21Bb0Z1cGlQWXpMT3NEVnhpa21ZSU93eFY4?=
 =?utf-8?B?VGloNFNkejlyQUJXVnJQeklZNlJuYWU4bkF0UTk5dHV2cFlBalRRSlE3NXRJ?=
 =?utf-8?B?QU05U1hCMFU0bGdnSXdUOEhyQ3hCcFl1RnZhMDB5LzhFK2hXUDZBRUt1VWpR?=
 =?utf-8?B?UXpsd3lPQ0dtZENoVEZyWXAyNFhZTHRvbEh2VXRmMm5uWFZYNkZUaEM5VjJq?=
 =?utf-8?B?UVFrN2ltWCtONzVZbUhiVFlMVkNiVWNBNkNxSGluY1g0Y0tYc2pwSzV0R1No?=
 =?utf-8?B?UGpSVXlqRU5kS2J1WjBqbWVrUVRMelZWNm1PT1hkaHlOT3dTaG4xWW5zQ2xZ?=
 =?utf-8?B?STF0M2Q5VXRhLy8xZVZsTktMenV4alQ5NGdybEVFbkdLems2VTlwSkFENlZ5?=
 =?utf-8?B?cU1XRTc2cWplT3U2UDBsR1dMdUZaVFEzb1Z4SlNWNE5tam05bXUxU2sxbGFu?=
 =?utf-8?B?aEpNaldJckxzcWhLVEhEUlFOQWlYTHFDMEpqSFMwYWJMQ2ZjWEdxNDltU1kx?=
 =?utf-8?B?bEtEOCtnQTZuYXdTYSthT3VKYkY5aUtUV0RDekovV1lNRnNvK2VOejhsRFpC?=
 =?utf-8?B?dmZLN3dzaUJsSHduQTdoYkxYWXpPMHFLbDluV21lWEpodENiOXlSQUVNRy81?=
 =?utf-8?B?YVBQR1ZrbTM0QzN6MFN5U2g1dlh3WFhvVndnRi91M1dhdXJZejRUTjMwSnlw?=
 =?utf-8?B?N3hRMEZJV0hicmZYK3ZNbTdGVUdDZFpkZm9GdHJ0TjJEQmJtc25RbC9DLzlN?=
 =?utf-8?B?cmFIcXY2dTNJemszaHVROERvMFlaTytIckVRV2I2S0FZZU5wN3liTUVhakMz?=
 =?utf-8?B?azlyY2ZvYXVTbEE1RzJsQVBWUE14dFpKSm5VNi9MQTgza0w3MHZVS3d1ZjhN?=
 =?utf-8?B?ZWZ4cm10NUVNSEpObldEVVFyWWY0TDdrUFIyV2ZNd0wzS3ZYNlZRL1lrZjRt?=
 =?utf-8?B?TWJ5UEE2bDEzYm5QUzFjNHV0VjdjTENZVlI3anVObVFSbzMwV0RJL2I1djRO?=
 =?utf-8?B?ZnVQUjZLWGxqODJscGczdmVES2FhMStOVnQ1V2xQYmphTjBMdi9FWEcvL2I1?=
 =?utf-8?B?MXBYN24wNHM3UUtzTGpZaEVpMHVpaDZNd0M5TFIyS1VYdXlrRzU3cU4wV3dP?=
 =?utf-8?B?bStjcUFvcUx3WXdIamRGVjl1QnJSZzhiVEJpUS9Od1g0NzVwZVlsNWRHbU9l?=
 =?utf-8?B?Z3BjLytOZXorbmp4RlZ0VnAwb3R0SEh5eFJqU0VhRktPWmpSVFc3TXhYTU5h?=
 =?utf-8?B?RFZYOXFNVDMwbnJqTVB3Tm1DbzB1Mzh3bk5PYjYrQnlvWE5FLzlPaTI0ZklL?=
 =?utf-8?B?TzV5YVJuSFduYjlEN3AxaVhkUWxZY0Z4NlJGUHMyd1hoUnNMbVl4ZG1kQ2Ro?=
 =?utf-8?B?d1g3aENRS2RqcG9GaDJTUi85Mkh6MkFXcmQ0Rm81U3JhNXlMUWwrdVo3RUNT?=
 =?utf-8?B?M2JLM25Ta0JEcXNTbkIreDRuOTNJNDFKZGJTaXIzUjI2RVlVNHN0WEtUQVIr?=
 =?utf-8?B?OU01S21KQlNaYkoxaERQS0x4M1RMcFY2UGRmT2pWenhmT1JmaGMwam9RRitn?=
 =?utf-8?B?ZXptVllRdVVzQzN6RzJzU2dFYzRVaC9UcDduZWxSL1Z0MWkxN3J3TzhuOFJx?=
 =?utf-8?B?UC91WmVjMVVwODY0QkVRTllrRFIvRGtUaDYyc0t4c1VRMENUbFcyLzhoS0V2?=
 =?utf-8?B?T2I3dTl0bVhqcnIxaWI4TjEzY2hDMVgzTm56Rkl3Rll0L0xHeHlSNzFVVzc3?=
 =?utf-8?Q?lAf6pjU3hdVyU7vcfbfBklUjPTs92YOIxiYTuue?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e16f396-777e-4d0b-73fb-08d916e6727e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 14:42:07.0913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0uVhXObZo9C/y+UvktuJyK4+TtNIBMNPTAcpbVg+MxV8oyOpSqPGzizLdZTltD0HvNO/Sjd2YAkLJcWesRg1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2654
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping

Andrey

On 2021-05-12 10:26 a.m., Andrey Grodzovsky wrote:
> If removing while commands in flight you cannot wait to flush the
> HW fences on a ring since the device is gone.
> 
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 1ffb36bd0b19..fa03702ecbfb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -36,6 +36,7 @@
>   #include <linux/firmware.h>
>   #include <linux/pm_runtime.h>
>   
> +#include <drm/drm_drv.h>
>   #include "amdgpu.h"
>   #include "amdgpu_trace.h"
>   
> @@ -525,8 +526,7 @@ int amdgpu_fence_driver_init(struct amdgpu_device *adev)
>    */
>   void amdgpu_fence_driver_fini_hw(struct amdgpu_device *adev)
>   {
> -	unsigned i, j;
> -	int r;
> +	int i, r;
>   
>   	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
>   		struct amdgpu_ring *ring = adev->rings[i];
> @@ -535,11 +535,15 @@ void amdgpu_fence_driver_fini_hw(struct amdgpu_device *adev)
>   			continue;
>   		if (!ring->no_scheduler)
>   			drm_sched_fini(&ring->sched);
> -		r = amdgpu_fence_wait_empty(ring);
> -		if (r) {
> -			/* no need to trigger GPU reset as we are unloading */
> +		/* You can't wait for HW to signal if it's gone */
> +		if (!drm_dev_is_unplugged(&adev->ddev))
> +			r = amdgpu_fence_wait_empty(ring);
> +		else
> +			r = -ENODEV;
> +		/* no need to trigger GPU reset as we are unloading */
> +		if (r)
>   			amdgpu_fence_driver_force_completion(ring);
> -		}
> +
>   		if (ring->fence_drv.irq_src)
>   			amdgpu_irq_put(adev, ring->fence_drv.irq_src,
>   				       ring->fence_drv.irq_type);
> 
