Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2437205C1
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 17:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049AD10E09F;
	Fri,  2 Jun 2023 15:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99B210E09F;
 Fri,  2 Jun 2023 15:19:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmcxnwaD98hV9rTIu0lMc94I4r/9/gJEX/LItG2Q9pJ/oKKQybMgzWGTYdOh/KB0CXGzTe3jaqnUHbtngSqPqfq6ekDMlyl005koMIi5c7ozOb2/o0mgRfEHPV7C8JLsWxDARETexgsCjGobzDLXQ20agGibGCZK5YNdkAYZoKsA1zNBUmoqaXCoB2V0s5vt5OO9DQopV4RuvH+Mfsjf6sOKveM6MNVrESBrCXDeCd9Xcgayfsfzo38CRlMUMchP5IW18lWQNXy80612ljWU2gAYtz8VZddwthSOW2LoP0b7Unzc57gBh4SvKL3lBQFbFYEqqrzHJbgYznolFouqjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0HU+5ynTh8hIh+/OXdlJe9sOy1W5TclhjEYV6Y8VHM=;
 b=miGJCDgDlUjdsfEN9K/Purtjax++7SQZO6lGueS6gi8HGU/YPQtZSVuCY2SUYnTLeK5LvZ2H3zRA6KEbAJHTNIVK3ybt21Jbacwmi+4ZzdJFh8HldfkkVzPopFBxXmPCjX824NyuR9AhDL1gUyDFDDcZa+shkkmquna8NvML3JsurlBie45fFl0d/R37CN11kAsa+KiYExmi9iaL+U+6Po4YjsJy9OIwRpuGp0yeGMqv1Vh8qs4M4g2Mbcoj9Xx5Qk1SzKURCfmCRbhfgaC8MDXcO+G3WkmPHmyacX5t1mFK7RTAn/7Gn2TOjgfI4dzlwpw3eXhJ9rMIjGrFwjSd8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0HU+5ynTh8hIh+/OXdlJe9sOy1W5TclhjEYV6Y8VHM=;
 b=gIOcSJoO7djT122gFLDVlBHOyQcrMX5BL+dN4VNYfDY4UZgPLPG/e+l1OwCh08nPOMLqzMv6KP/p3JbfStqmW+03AfGicH1XSsbYvfopBsSp0r3DcYTHt2//I7/dVPwfxfCgnL8CZEvX8K0kJTBx7rtpaa8n0rRgtQ/tg76w29c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH3PR12MB8533.namprd12.prod.outlook.com (2603:10b6:610:159::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.26; Fri, 2 Jun
 2023 15:18:57 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c%7]) with mapi id 15.20.6455.024; Fri, 2 Jun 2023
 15:18:57 +0000
Message-ID: <17ff8d91-5f6f-816c-f5da-08b04155dce8@amd.com>
Date: Fri, 2 Jun 2023 11:18:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 00/36] drm/amd/display: add AMD driver-specific properties
 for color mgmt
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, brian.starkey@arm.com, christian.koenig@amd.com,
 daniel@ffwll.ch, liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, Xinhui.Pan@amd.com
References: <20230523221520.3115570-1-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230523221520.3115570-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0338.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::6) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH3PR12MB8533:EE_
X-MS-Office365-Filtering-Correlation-Id: bb45e2b2-42c8-4401-a117-08db637caf74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dtp8sOQhGS+vqUB5Z9ejdl3ggRM2oc8My0oNr5LdifN2x/pEz8NjInshuIOMb04xQQk8yk+aTzHJiO90s2jxYBNqYgTmRuO3wpq0flB5hyUQQZZTZ7gA0kWr8frY+3a8QgKvAGZKWy9hxmxBNjIfZkE2obWPKNjQlQrOrENc3ShomoVFwJAjBPwuaREVbZDuiHvr+exTarQE5IO6tDie6kypkXg2EwepBEZxP0DazeqRpD6pmPY3yauR3kc7h0huwiE0Oc1p8q+b970RgASMzMC519X0W19CEw5mu93XZx2z2t219/hl1YfGe4fM9XSVIKJ3naC+vFZDi6s/LsNudDTocP9Y5EHhluRQlZeDEhwkuaGzTxdEyxviwUhW1+AEB8xjRnk/doCgxWoQVIk1SBXpoxyY6vzpgOkYaX2rLECku8DIryIi5II+1hF4K7PrWY+IvcNngZV1ITr2UkMPmC6+lPatWW7vRhT0Lnx9eHOeqOt2fUMuIbfVQtXHCyvjuqO177lvvLeHM2VzaAu0y2Obs9dZBn2WxnzPivx/WWj11bxPKnjDfdfNk7osxFEejDMEtux+BHIsIJJR2fzT9O4cRTIz+g45WOnHbxpA6smnhsc99iRy8t+vaIPU5HeR09hHvpyXxNH6XMr3qDS61xNKDcE7G2IZurg0Yg+aCW3HtrvEi5HM8zr7ZQdEmF2I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199021)(38100700002)(6486002)(41300700001)(6666004)(26005)(36756003)(316002)(921005)(966005)(110136005)(44832011)(54906003)(7416002)(6636002)(4326008)(2616005)(5660300002)(6506007)(6512007)(53546011)(66476007)(86362001)(66946007)(66556008)(31686004)(186003)(31696002)(2906002)(83380400001)(8676002)(8936002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0NGc2cwMXFnWm5hV1c5M1doa0hZZUt5R1Zvc0VSRVJkOVExY3YvT252TEZO?=
 =?utf-8?B?RzF5Tmt6blRxeDkxVnpIaWdjZVVTWCs2c0cwVGJTWVh1cXFRR0s3b3gwRk0y?=
 =?utf-8?B?KzdsV1hQQXQ1R243WUloUElBOXR1Nld0S1BXUWtaRDAwWlR0bXcrVWh0Ly84?=
 =?utf-8?B?QTJXMXJrbFJJZ0xEZVpmREdETmRRNy9OMnYrNVZKUUVWMDJyVkJvR1hmNy9y?=
 =?utf-8?B?VGtxMkE4QVFFM3VBSkQ0R1dYTThhemtDdjdURlVTbW5qM0RSZ3VYTVlJQ1pN?=
 =?utf-8?B?c3NDQWVxaVRyVXFvY3RrN0Nub3BjbG05N045Ulg4S3JWbUdpWDg3MU96aVJG?=
 =?utf-8?B?UVdFa2E1NSsyS210RHZuZHlPWGdocXNYbVhiOFpLUXBMdnhRQ1V6ejBYQXJu?=
 =?utf-8?B?RzdIQ1NFTDN6RCtwSXBRd1R6L0prOHc1VFp0czgvSHh1WjlSd2FMekRSMFk4?=
 =?utf-8?B?V1E3RHZvcFlrc3oyUGViblo1UURWbDFwRTFGdjlDMXh0WlIvU2VZNUc5MmRJ?=
 =?utf-8?B?NkhvRktlN3VTMU4vZzI0akVzbjdUVndob0c4TUNBSC9uUHRSdm0vNDIyMUQw?=
 =?utf-8?B?THpUUExJRlRSemRNckpvRE1zbjJacVhwTThMODBISW91YjhoMGJ0N3F0V3hz?=
 =?utf-8?B?blJIMC9HTERJVGhURTBLQTNqZWJOQlB0aHlKaHd6eWw1bjlHb0NvVldkeXRO?=
 =?utf-8?B?YlZXaFJBbnMzMXRNTVMzb25qcDhpYTY2cHE5bzJUWmM5Rlcrclg2SVA0V0Jp?=
 =?utf-8?B?dno5M3J1UUhnRy9SNlpKZlhNcGlwU3lTd0RkQi8rSnJWQ2pCaTVOTnBwd1Rv?=
 =?utf-8?B?aHowOHlqb2pTNS9jNTg5YnJBNVlLZmNiMlBVUTR3YkJIenJPWVRhZjM0ZTVn?=
 =?utf-8?B?R0RCYk9CMDIzN1BUbStmVGxyWnlLamRYYmtvR1hWSk9IWjV3dVhXWFNIWndV?=
 =?utf-8?B?aW9vQmg0MDlBdlROTC9IWndqb0N5RlRkbHZrTjM0S2duM0tZUkVUUDVLeE5C?=
 =?utf-8?B?RHVpMEpvL0dWa2dZUUJDbkhKSzF5UllRclMzTGZjV2NzSWFqcCtVOG9oRUVL?=
 =?utf-8?B?RlBrbVc0L2xCaG9QYkYzTFlwVlkwdzJ5Y3VpT0hOcUErVkp3cDI0NUxFMXp0?=
 =?utf-8?B?ZzVROTZ2RWE5dXI5cUdYL3pFSTcyNGx6ZFllVE9oV1A1cTRrczVyeGZqMW9L?=
 =?utf-8?B?WjhaYW1laVdaYUJPSERwMDA1WkNUTnkyOTFCc3FVY3ZZSldZVCtYdkZUbVBt?=
 =?utf-8?B?MHlnVUFSZHQ0WERUeUYxcHNYb1c5M29MZmxZTU5jYkRVNzhwQWkrdmhlMzNv?=
 =?utf-8?B?bU0wVHdzdnJXMTRnY3FydVcwak5ia2E5Qld6ZEZ2UEJJbUtWODZ4R0JZUjdF?=
 =?utf-8?B?SWpXRmJWWHNkaTcxRXVCUm16YTNXZmJXM2R1a0ZVbC9oK01OQURRbnRsWWhN?=
 =?utf-8?B?WkhsTzFGOE4zS2pHTktDai8yZ1pKUU1IVEJMYUZPWjNPYitCTVNqL0UyaGhS?=
 =?utf-8?B?RUxDMTBmcTJWTlVWQW5KbG5MSWVwQWo1MzRQa1ZBUjdTZDcwSHFCdTJXNmtW?=
 =?utf-8?B?WHZQRTM0Z1ozbWY5VkdCMjE5ZXVXZmp3VVBoL3BBcHdncjJia3BUZmlPVVlI?=
 =?utf-8?B?ZEp4ekk3QmExWVYrWGZ6ZDJwRWJmaGxJekQ2NWp5SmJQZjJ6UEpmbStBQi9B?=
 =?utf-8?B?QnRlV25scXhYbmIxT3dmVng3dlM2Y2tGY0NyaEY2OGprUHN3K1dwM1pVNXlj?=
 =?utf-8?B?NzF1YkloYVIzeFYxQzY0V3RsYmRGVDBWQlRvajRDeldTZGJhOUVCVGUyc2Rq?=
 =?utf-8?B?TUxpZ2ZPbUJOd0FIOFloSGdjeHNZK2diOGNCYTBJZnV5ajJGS2hsNi9qVmFh?=
 =?utf-8?B?MWV4dWVyK0J6cDJKSWt6R011VTlWeGlsdEtUdjB0elhZUW51VEIrTFUvc0d1?=
 =?utf-8?B?RTJuVGdaZDY1TjUrU0QvK1owMTQrZ2RhZVFGT3hEZjRqK3lMU1liT0RDMFor?=
 =?utf-8?B?QnFmcVNXc2N3T3R6VVh0cVpER2lWekltZ0Z0NUlQS3BtdUlHdnYwclhTVFRW?=
 =?utf-8?B?R24yZ0NYbE1SeUNNd2d5VVlkRXBzSWpYMzBKb3V1T01wUGRxR0ZFSDJSR1Jo?=
 =?utf-8?Q?Mournkm49Nrr3EmlMmgi8laKF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb45e2b2-42c8-4401-a117-08db637caf74
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 15:18:57.6939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y9oOoPNMsKuILVGmNGqsk6ZKWkxYzV7jfUNG3ObsHDg43GsalrXpX+LuAyGSsnZD0DxC/xUqqOBDvBzdTtYBGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8533
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/23/23 18:14, Melissa Wen wrote:
> This series is a refined version of our RFC [1] for AMD driver-specific
> color management properties. It is a collection of contributions from
> Joshua, Harry and I to enhance AMD KMS color pipeline for Steam
> Deck/SteamOS by exposing the large set of color caps available in AMD
> display HW.
> 
> Considering RFC feedback, this patchset differs from the previous one by
> removing the KConfig option and just guarding driver-specific properties
> with `AMD_PRIVATE_COLOR` - but we also removed the guards from internal
> elements and operations. We stopped to advertise CRTC shaper and 3D LUTs
> properties since they aren't in use in the Steam Deck color pipeline[2].
> On the other hand, we keep mapping CRTC shaper and 3D LUTs (DM) to DC
> MPC setup. We also improved curve calculations to take into account HW
> color caps.
> 
> In short, for pre-blending, we added the following properties:
> - plane degamma LUT and predefined transfer function;
> - plane HDR multiplier
> - plane shaper LUT/transfer function;
> - plane 3D LUT; and finally,
> - plane blend LUT/transfer function, just before blending.
> 
> After blending, we already have DRM CRTC degamma/gamma LUTs and CTM,
> therefore, we extend post-blending color pipeline with CRTC gamma
> transfer function.
> 
> The first three patches are on DRM KMS side. We expose DRM property
> helper for blob lookup and replacement so that we can use it for
> managing driver-specific properties. We add a tracked for plane color
> mgmt changes and increase the maximum number of properties to
> accommodate this expansion.
> 
> The userspace case here is Gamescope which is the compositor for
> SteamOS. It's already using all of this functionality to implement its
> color management pipeline right now [3].
> 
> Current IGT tests kms_color and amdgpu/amd_color on DCN301 and DCN21 HW
> preserve the same results with and without the guard. 
> 
> Finally, I may have missed something, please let me know if that's the
> case.
> 

Looks like we're on the right track with this.

Patches 1-3, 15, 17, 24-31, 33-35 are
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

I left comments on a bunch of the other patches. Let's replace drm_
prefices with amdgpu_ or amdgpu_dm and move the property registration/
definition from amdgpu_display.c to amdgpu_dm_color.c.

I'll chase internal feedback for some of the DC patches. They look fine
to me but I don't want them to cause problems on other OSes. I might
pull them through our internal repo. Will update you on that.

Patches 16-22 will be untested without properties to actually set them.
That makes me a bit uncomfortable but on the other hand they provide
functionality that we'll want eventually. Let me think about them a bit
more and also make sure the DC portions won't cause issues.

Harry

> Best Regards,
> 
> Melissa Wen
> 
> [1] https://lore.kernel.org/dri-devel/20230423141051.702990-1-mwen@igalia.com
> [2] https://github.com/ValveSoftware/gamescope/blob/master/src/docs/Steam%20Deck%20Display%20Pipeline.png
> [3] https://github.com/ValveSoftware/gamescope
> 
> 
> Harry Wentland (2):
>   drm/amd/display: fix segment distribution for linear LUTs
>   drm/amd/display: fix the delta clamping for shaper LUT
> 
> Joshua Ashton (13):
>   drm/amd/display: add plane degamma TF driver-specific property
>   drm/amd/display: add plane HDR multiplier driver-specific property
>   drm/amd/display: add plane blend LUT and TF driver-specific properties
>   drm/amd/display: copy 3D LUT settings from crtc state to stream_update
>   drm/amd/display: dynamically acquire 3DLUT resources for color changes
>   drm/amd/display: add CRTC regamma TF support
>   drm/amd/display: set sdr_ref_white_level to 80 for out_transfer_func
>   drm/amd/display: add support for plane degamma TF and LUT properties
>   drm/amd/display: add dc_fixpt_from_s3132 helper
>   drm/adm/display: add HDR multiplier support
>   drm/amd/display: handle empty LUTs in __set_input_tf
>   drm/amd/display: add DRM plane blend LUT and TF support
>   drm/amd/display: allow newer DC hardware to use degamma ROM for PQ/HLG
> 
> Melissa Wen (21):
>   drm/drm_mode_object: increase max objects to accommodate new color
>     props
>   drm/drm_property: make replace_property_blob_from_id a DRM helper
>   drm/drm_plane: track color mgmt changes per plane
>   drm/amd/display: add CRTC driver-specific property for gamma TF
>   drm/amd/display: add plane driver-specific properties for degamma LUT
>   drm/amd/display: add plane 3D LUT driver-specific properties
>   drm/amd/display: add plane shaper LUT driver-specific properties
>   drm/amd/display: add plane shaper TF driver-private property
>   drm/amd/display: add comments to describe DM crtc color mgmt behavior
>   drm/amd/display: encapsulate atomic regamma operation
>   drm/amd/display: update lut3d and shaper lut to stream
>   drm/amd/display: allow BYPASS 3D LUT but keep shaper LUT settings
>   drm/amd/display: handle MPC 3D LUT resources for a given context
>   drm/amd/display: add CRTC 3D LUT support
>   drm/amd/display: add CRTC shaper LUT support
>   drm/amd/display: add CRTC shaper TF support
>   drm/amd/display: mark plane as needing reset if plane color mgmt
>     changes
>   drm/amd/display: decouple steps for mapping CRTC degamma to DC plane
>   drm/amd/display: reject atomic commit if setting both plane and CRTC
>     degamma
>   drm/amd/display: program DPP shaper and 3D LUT if updated
>   drm/amd/display: add plane shaper/3D LUT and shaper TF support
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 125 ++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  69 ++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  28 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 110 +++-
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 612 ++++++++++++++++--
>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  72 ++-
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 213 +++++-
>  drivers/gpu/drm/amd/display/dc/core/dc.c      |  49 +-
>  drivers/gpu/drm/amd/display/dc/dc.h           |   8 +
>  .../amd/display/dc/dcn10/dcn10_cm_common.c    | 107 ++-
>  .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    |   5 +-
>  .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    |   9 +-
>  .../amd/display/dc/dcn301/dcn301_resource.c   |  26 +-
>  .../gpu/drm/amd/display/include/fixed31_32.h  |  12 +
>  drivers/gpu/drm/arm/malidp_crtc.c             |   2 +-
>  drivers/gpu/drm/drm_atomic.c                  |   1 +
>  drivers/gpu/drm/drm_atomic_state_helper.c     |   1 +
>  drivers/gpu/drm/drm_atomic_uapi.c             |  43 +-
>  drivers/gpu/drm/drm_property.c                |  49 ++
>  include/drm/drm_mode_object.h                 |   2 +-
>  include/drm/drm_plane.h                       |   7 +
>  include/drm/drm_property.h                    |   6 +
>  22 files changed, 1416 insertions(+), 140 deletions(-)
> 

