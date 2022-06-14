Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB59254B7EB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 19:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE2810EEBC;
	Tue, 14 Jun 2022 17:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F76210EB5C;
 Tue, 14 Jun 2022 17:46:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OK93CtHk1whYGzFJ74h5ApP9/SkR9Vz7ab7+ggNgcwnxEzqY6Kq0A6dnflCOyfcoYdPxrA06M74YgUnzQi6IiagLD/ORX5tFQAQvBkbdU95JO75QK2VxreG5iTvSMRUKFGcOM7AZpYWx+YKe3vIk6izd7xYIZi0i1LVDy9/EHchMRLF2kkLzf2iR2ZbYm65aW2VhtFcYYtwQxJiLz7L4EJH7pcNZF8WnMJoC1B6N0kdZXVIAoWaUwhGNA0sIkxkrZmldWKRRVquQ71YCsa9+NvjGlzGKHnjyc7bWEu1njvlrfHgqDUs0l8Voyhe2rRown/eo543SSUvZnmCboqLW1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3a6znuZjt+TfBC4PDKIaAca6Tc/aWl0zAtUAAIUR38=;
 b=lBYNCBMBmRNxCiciV1O36yuYlO0GTHXKMmPERH4oSjasI2mfkHGyMaY5YmiqU/TEwodvk9VlvazU3JrHgJvInTDr3IiWPSMzhTLsUspFRA7yd2F6jqPPkMJQwhWRnHQE4V4erQLurkyPq1OobLC9sbf6Z2JObZ7TUnjX0ecWMb943a4FppWBG5V3r1HdFxycCiv9i5SCDG+t47j6PA+T0FhAPKnuWAy1N1V54TKDyavs5meH71zI+zKSYpQQGe5w+pQRFgGck5lg7szJn1XG6x0j5r3oyBorN//VEIJlwpgwEYKMzIUWdRGhw+QKFHq4FQpxhQDXnzuEgZSPxymvHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3a6znuZjt+TfBC4PDKIaAca6Tc/aWl0zAtUAAIUR38=;
 b=xrVC7fTqBxqaB/nGXeLfPItpCYuarBSyRczQNbTB2SL2zAN1f6eV8OHprUMy9N9//sscjhI98TTULYTO+t/E7+qj4+S4QWdPm39N+2CWAoZqoVWZVuxE7f4TKUwCzGkh+1J/2175/zy4O+YkpdEPkfgJv7V6rT9g4y1NJpIEgyE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CY4PR12MB1126.namprd12.prod.outlook.com (2603:10b6:903:3d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Tue, 14 Jun
 2022 17:46:13 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::540e:d76a:bdf0:ed0d]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::540e:d76a:bdf0:ed0d%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 17:46:13 +0000
Message-ID: <3289da9b-7b5c-e824-e55e-1648c527d7d9@amd.com>
Date: Tue, 14 Jun 2022 13:45:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/amd/display: add stub for crtc_debugfs_init()
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
References: <20220614155726.26211-1-rdunlap@infradead.org>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220614155726.26211-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0120.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::29) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 210b7be5-7c91-4a54-6d47-08da4e2dc601
X-MS-TrafficTypeDiagnostic: CY4PR12MB1126:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1126C1CCE15E60CDAD7FFAEB8CAA9@CY4PR12MB1126.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Wr2LpOqR1q5/3BCY2bVmpjeiRCvZtbrMgK3HxejICqXNrw7cgBgCeGOrN2DEpSoudNRqfeMSwIMUXf4+sZ3brAuJMei+wnLpbe65o6SV0FV9FHh69Mn91DutXDPSkZKcYXEu3+MpZ59tvTgY/PLjYTDK8SP+0s3r5SPupviP092S2JemloU/mP6jS99QQdnHB/nVbO6UBFNOZhoZgdRZzL7Dl5ouYbdLVkQG0NXdBE6ILu9Bnh9ZMXgaeSPF2xpDizVBHwjNlWWjc6iznftAJSvBbRyJ56aNU3kNYJqgILg8kKHw4Vdjz+nbqHhLUmgn5uGFNN2khkn+t8346mSG3fRzxnDsK3/PIJotOt0wocMUusyN6VHa2Vy/50yK5LM0MXGQwPBDnqQB/CdepdME2J0gX2XFQ9oDWs0SJgYOOu8Gp3oK66ZQg+MeHR+/4NFQ+OAOgRKjn540xbX3N94NUg6e8CXa1w3Lit/zm+Frp2JjafNHRByey9W27RnyscqXrVsp5XpWrA5pryXvqpyykPr3m8VO/9j4WDfJjHnEb2PDE5l4Wl9fyU+PZMq0W0u70ltNE2qm5qIbe8sOIHGIR43bgAxUEhMPTUhPkSL8iuYYnCotpSqCLhgK5uKZelnfQuWQeln/PwMf8Ygb/sFns4AHm9VTacDdOZU3FLMgVPQbtV/bp0QgulOBAYGd8bOXRROvdV96zAqDUY3X99n0NZ6sa74wbwWtWhTczWFgc55Xmr56wqIQ+xd0LI1zVtT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(6512007)(2616005)(26005)(53546011)(6666004)(6506007)(508600001)(6486002)(54906003)(38100700002)(66556008)(31696002)(83380400001)(86362001)(186003)(5660300002)(2906002)(36756003)(31686004)(44832011)(8676002)(66946007)(316002)(66476007)(8936002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amlSNzltSkU3aE5admdxa0g2YzZseGRBMG55TEdLTE5sY0VNRWRYang1TDF3?=
 =?utf-8?B?NndtTmJ2RzFpQms0eFdRQTNaM1ErWE1oY3REMzU2aWNtNnRLRm5BZVJISzEx?=
 =?utf-8?B?WTV5ZCt4bVhwaWwrcGJqTEh0NUdGSFVZdC9Sdm55VVA3MDdqaDBTei80RmxW?=
 =?utf-8?B?bEdwK3RXYlVNcUd5UmdtbGVQUEVHZTNLN3FqMmhaTHJhM2hUdVFJeldtUEZT?=
 =?utf-8?B?MTl0R3lTWWxvbW1uL0p1R1VNb3kyRk5ncklFVE80aVQ1OHorS0pMSWE5QzVt?=
 =?utf-8?B?RWVaRzFlQ1F0VE1ubEFuUDVVcDlxUXd3UnhHUXJXV3BrVlp4bHlMRXoyeUFL?=
 =?utf-8?B?S01zdFNRVThpdTVObnprM0lhYm85a3NqZUlMa2JQbWRYbWd4bGt5QSswNTZ4?=
 =?utf-8?B?YTdNRVlZeDN2dXFXS2ZMeVdtSDlyQVBuV0o3em0rOEVzU3pKUk1FdklqMjU0?=
 =?utf-8?B?UWsvamY1N2xrYjZHeFJoSDBJV1VLRHBRcys3eExsRTFwY3IvZGFKTFZVekts?=
 =?utf-8?B?L25jZkxVNmdqSEFrQ3ZhaEtHdGxXREZ0bXJzQmphMFJEV3pJNmJXeUFPeXly?=
 =?utf-8?B?UVlLclkvMUJuTThlbUNlWlB6S2c2TWs2c296SkhkRXQvaC8rUjU2b25mWmwy?=
 =?utf-8?B?bmhqVjNmWHBWYllqYWRSUEpodHprSlUvcVk0ajQwQjBadXUwazN5U0oxQ2dm?=
 =?utf-8?B?M05YYjU0SHdtb3IvSnFicGFOOHJMTkFVeFpMZlVjV3U2eDVnU3hyZ2VEY2kw?=
 =?utf-8?B?cTFwakxqM3ZMVXROMGVOMFVZV2grcXdxRWtvL2MwTFlLcWhqeURoei9oS3FH?=
 =?utf-8?B?N1g1UkEycVZjbHZObmNPQzZhV3Fha1BuMy9udWNkdDJwR0Z1bGRkUEVjajdH?=
 =?utf-8?B?bDBITUwzSVlXalFuVm1FcktrVGk5N2tIc2tQdGMwdml5eDdFTkVhOTR3T2NC?=
 =?utf-8?B?c21kT3RDT3RzUm9Dbnc0bnhrVXlJaHpWRktna2tRU25kenhqMGltSHFQRzRq?=
 =?utf-8?B?Z3Nvc0VCK1ZFc3U5cE9QbXpqYUcyU2JLeGdjV3FRbzBrZ0toSWtLT1puNnNV?=
 =?utf-8?B?SDRyeDE0TFpDaWFITGIyTzhYaGltUUsxd2Mvb3dtN1NnakNaQlA1UmovbGNj?=
 =?utf-8?B?c2NrNUd5d1RNUmZRMWROb1NZOHlNWTlKcC9oZCtoZGVuN3ROZklycWo5dnI4?=
 =?utf-8?B?RFFDcmNrbE1tVWFCRTRwTC9TZEFBNW1tUzNGcTEzVUF5Y0Myay9tVlI3Ynhm?=
 =?utf-8?B?YnllV1U3WG1HcmtRazI4aDlxTEovL2pHQi9jUlBzSmowNFVIMzExbnJIZVJT?=
 =?utf-8?B?RnNuaHZ0S3JRanh5a2U3K2FMb0xmTWZlRnR1cm91a2o2RWkxWEkxcDNacWFx?=
 =?utf-8?B?US9mVEJzekR3VVZhTDFCSUQ4Q29pZlpUQjRtKzZ2cmtlN1drMmZvYkdBYlEw?=
 =?utf-8?B?V1p6UlJxSXJhYjRPdE9SWkJzdXRNOUhmTUNOZUQwdnoyaG04SWZ3cW1KOFA1?=
 =?utf-8?B?dGZPbkFXalhiZkZMb0t5am5TM085MUhLTDNZem51YnZIQWtydjdYc096bmdt?=
 =?utf-8?B?VHNmbEZQNmFVVnNNNmlBdjdlQThtMStMQXJCVXhZUlpUZjEzbkNCenVlSmJU?=
 =?utf-8?B?SHRCb3hTcjhHTlduSy9nck1TeGt1NEhvOWptenFjMXJoQU84VzFncG40bC9a?=
 =?utf-8?B?bzRubzFQRkswT0hPWHB6QXEzWnlaZWNHeExsZERvbS9VMGU3cW9PNnpaUUhM?=
 =?utf-8?B?cWVubGxVdGNSc2hQQ1NqTEUwTGFKSndLQ2lsVW0rSVdvb1BMU2FqVmxqZUJ4?=
 =?utf-8?B?VWRqd01KdEQ4SnZCMnNEelpRUXZkVlZGOUNHUlMwVERqdGdXeEJYbFBYVlFZ?=
 =?utf-8?B?Sy9lSmtIOStrVEJ2b3ExMWxJbVFyZnM1dWNCUXkwRE1IYjQrNEp3clRpcTRT?=
 =?utf-8?B?Z1pMb0NCTWpSMTgzS0ZnZGJMVCszV3VRSFJCb1JwU3RpWXJiemRvcEhaVndM?=
 =?utf-8?B?Y3ZqVTB5amEyeGZNcU0rcXNwQnBJMlB6SUdZdFkzN1kxMFhhRHRYc1ErdllJ?=
 =?utf-8?B?QTdDVFdzSmNxLzR0SmJHeE91Z0VwZG5jSWdYZ1pmUnB2VlBBZjlsUWZUQUJG?=
 =?utf-8?B?cnBjMDRKZWpYQ2thUkpZUUhGT1d2ZGJzOWZCYnpZbVlnRkZNVTFPbndRdEF5?=
 =?utf-8?B?MGpOKzJ0d1o3d1dSM1NjS2xPbjZXeWtTSDRYWTZOSkl4b0ZsWi9mb3hpVUxo?=
 =?utf-8?B?bk1HMGt2SnIra1hxd2drNXltcTBGSHA5dUpxaEw3amJDNHYxUUJFeS9jckpC?=
 =?utf-8?B?SWZKWS95Q1grMjUweWJiWHdldDNPSzF5M2ZscFZycnFKamJKQTdCUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 210b7be5-7c91-4a54-6d47-08da4e2dc601
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 17:46:13.0698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4rcY6PhdfUdArAAYfQwXQillCovaAw+hw8a28f9kJoP3C7QbZj5g6vRCTN4NzOc+HrOM+JCFdluakGny+kgGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1126
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, patches@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-06-14 11:57, Randy Dunlap wrote:
> Fix build error when CONFIG_DEBUG_FS is not enabled by adding a
> stub function for crtc_debugfs_init().
> 
> Eliminates this build error:
> 
> ../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function ‘amdgpu_dm_crtc_late_register’:
> ../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6599:2: error: implicit declaration of function ‘crtc_debugfs_init’; did you mean ‘amdgpu_debugfs_init’? [-Werror=implicit-function-declaration]
>   crtc_debugfs_init(crtc);
>   ^~~~~~~~~~~~~~~~~
>   amdgpu_debugfs_init
> 
> Fixes: 86bc22191892 ("drm/amd/display: Support crc on specific region")

That whole patch and the whole secure display feature depend on debugfs.
It should never try building without CONFIG_DEBUG_FS.

See drivers/gpu/drm/amd/display/Kconfig:

> config DRM_AMD_SECURE_DISPLAY
>         bool "Enable secure display support"
>         default n
>         depends on DEBUG_FS
>         depends on DRM_AMD_DC_DCN
>         help
>             Choose this option if you want to
>             support secure display
> 
>             This option enables the calculation
>             of crc of specific region via debugfs.
>             Cooperate with specific DMCU FW.

amdgpu_dm_crtc_late_register is guarded by CONIG_DRM_AMD_SECURE_DISPLAY.

Harry

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c         |    2 --
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h |    6 ++++++
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -57,9 +57,7 @@
>  #include "amdgpu_dm_irq.h"
>  #include "dm_helpers.h"
>  #include "amdgpu_dm_mst_types.h"
> -#if defined(CONFIG_DEBUG_FS)
>  #include "amdgpu_dm_debugfs.h"
> -#endif
>  #include "amdgpu_dm_psr.h"
>  
>  #include "ivsrcid/ivsrcid_vislands30.h"
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h
> @@ -31,6 +31,12 @@
>  
>  void connector_debugfs_init(struct amdgpu_dm_connector *connector);
>  void dtn_debugfs_init(struct amdgpu_device *adev);
> +
> +#ifdef CONFIG_DEBUG_FS
>  void crtc_debugfs_init(struct drm_crtc *crtc);
> +#else
> +static inline void crtc_debugfs_init(struct drm_crtc *crtc)
> +{}
> +#endif
>  
>  #endif

