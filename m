Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9EE5689FE
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 15:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C80210EA6E;
	Wed,  6 Jul 2022 13:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E9A10ED39;
 Wed,  6 Jul 2022 13:49:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQi/jf1xNgFgHeWZ2E4wKKVRAm53ZEaiu9ztZSy7jj+qfAXMKBz2nYn0ZgOJW1n1FmTepc+hRosn0LOnY2KCoE6l/J22hqeSWGd/4DFajdzYLFYHs0GHSX2ZffIINMBHpNZ1ZMwBRJnrc86zdqfZwNLclNI7PlGWNHEV8/MsPq1AFGOAtGNP5X3b/GRKLdqNRSXj5bjDF3Y/eC/zAI/GvbQQm0qzr4LizUb2LqhuZB0KQB40hoepaXOZ1oG5RV2+LCSCG147lVGELnGwwKCrE0oReXtIkxn+rn5Dif7MPtvAKDjl+//h9sC9ZwaKJ1VG7UayfsQNKdiFIjbcX+9FKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Frug2jq4X16sUhS4yt7tW8OOE0Ia8xeNDv3JuVJDN5c=;
 b=RyZyNurklGVmCuzWUHxUBnQKYmbkyHSSSzKDthbKLELNhGKbRwakdvnfd6tcvouR1UuRmy2O+N9AYfVZhezZbLpvzDWdofYIkAbfJD8iHGFRvG03wD3bZHi/TqP21nWjSN4N5Xok5IOGQi0TMnMZbwjAZ1uZCRWb2YNUiuNhn0M2RCq5mV/jHX55o1r9WHUIYMbD88ZSxooT4gvKh2SQwHVHWDvAAl6QIG41OiPCRA6wlFxXDNehWHwySjxFm2XM3JFXZNwoE/Fk0INnlwEZ0KEv0eghGbay1OiMe9y3Y+fBgNafbTiNRvACY+O5nuECRVnzliYGTscLxKnAo4vSXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Frug2jq4X16sUhS4yt7tW8OOE0Ia8xeNDv3JuVJDN5c=;
 b=Js3iFYR27m+B5hzyOY9c5Y4yWlURisBV747NKQYf/9AzL9zLdBH3q77OWBb7IYwqaLcrgaTnsKi/shTKsHpCxwNbP8OhJ/vJcfd43H6dPlg6Tk+DS6mkdOB9iY0jZ3jNeI5v43TK5S8ln5FjYbolhxXFFCpcWY5HrzKk9MgZ2/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MN2PR12MB4128.namprd12.prod.outlook.com (2603:10b6:208:1dd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 6 Jul
 2022 13:49:31 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f55b:be13:11c6:d9dc]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f55b:be13:11c6:d9dc%3]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 13:49:31 +0000
Message-ID: <5dc99a6e-569c-a736-9f64-ac632433da81@amd.com>
Date: Wed, 6 Jul 2022 09:49:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amd/display: remove repeated includes
Content-Language: en-US
To: Guo Zhengkui <guozhengkui@vivo.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jimmy Kizito <Jimmy.Kizito@amd.com>,
 "open list:AMD DISPLAY CORE" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20220706091329.62192-1-guozhengkui@vivo.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220706091329.62192-1-guozhengkui@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0111.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::12) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38a7ddff-ebe0-49b8-4f99-08da5f565a31
X-MS-TrafficTypeDiagnostic: MN2PR12MB4128:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UgioCGX2RR993IA/DBn6jSl2blxp2h8sjsiOIpWt6549viDVfMzCiw/TXBDuzKMHxkmILhSZCqFrgqsyuj2VNoOk+Q34v92wA96ZthqmpNq0OXR+3sI0NhX1DpM8ZIEocSbJF9g6vb44njVlKLHhX/XpHBUfMjA04xQozowdQMzooW153EUrOYZXmwK+zXFBFgXMxEaiYbi6GmYrk/IoRa81qfc/JNy/SNMQyd+fhfM/GqwRZZk+8wJinOBvBE90ejIZFiD5me6G/zTe4zEVEy1nQ3u6mGkqS3fbPSfC5po8BI7MRjgokgyhCpAYJyes7XAtoSkXYxcReMAIq9Wqaw1LCPHeT/TFbqik83JyC4jark3LH7sfG0bY27SdIt8aFRp/JfJY/BdTN1m82fMUii4Ku1JdYZ4Vb1AbWdXAGMrYvduWzsoAnODCJupZ3VbvzuTGITAm0YcGeTw1cAjovnFuZn7YSVWl+4ByqpeGz00wX7jikL7EHnRWFbh7pUi5fvuUsm9mcPT0cfw+x187HIUOreOPIWW8H5TOQMvFirSO4FgZesqDa2+Bb03CIlp5vfPw4yjMsASnlVlONraUv2lGO008ZbYDfOQihKlkPOY7rXU9DEIJKmzFZNEYfGbPtjj3x3EVr/3xjJNEixzzjU4CnnjHMK2Scwaur/zazaJHJ8mLmkOoRyBTVtw1UZHtAdrGC/U1wL43oz1vsv7HNWegVTDBqFsvCuI3NXxUj/MplYA2f97PnWoReiY9NnPd/dPGHpurWw8ibU7pE/bNkM55ZbB0hePEpQD6HXPaBX0mwQxwsKq5t+glLbX+XPmcoEJUrHJho3UfctRMdGuANelqYb2Hswt52/vBStoQxZE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(5660300002)(6666004)(921005)(41300700001)(4326008)(53546011)(8676002)(66556008)(66946007)(66476007)(186003)(6506007)(478600001)(4744005)(316002)(6486002)(2906002)(8936002)(44832011)(2616005)(38100700002)(86362001)(6512007)(26005)(83380400001)(31696002)(31686004)(36756003)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzIrbHh6K2dHWmhtQ1pOTW5uRm9JRWVZOUJZL3grbHBKZDdRSkx5WE0wdkU1?=
 =?utf-8?B?Wm9HeGJuR1g1T013NVFDcmdDL0svSGM0WjBhUis1Q0M2dVBYOFBkTndhN1V5?=
 =?utf-8?B?aGRuSUNzYkFiS21BdzNXaWxPejBJT1kwUU5ZRE5uTlI3dlZBU1MweXNteUdi?=
 =?utf-8?B?TTl3b2NvSlMwTjlkcXVNZ1crNlRMWUlVMGVoMUE4ajczZkplTUxFZVk2VGRD?=
 =?utf-8?B?bmxRTTVqSlJYbitodE8zZGtuUzBFdzBqdnYvVStnWXh2djhocFVwejQzeTVC?=
 =?utf-8?B?L2VQV2YxTW5naTNmZHlZZnluNC9uWUpxTzg2UXJ4Ykh6TDNXYlVYVFdvaEVM?=
 =?utf-8?B?bzBXWTczb3dlZTNkVTZWb0pVTG1vV0ZBbm1EUnk5K0VKMStPVkdETERvTVoy?=
 =?utf-8?B?QUcwVU16Yk1hdWZwaGFLWE1uZjR0STdpSlF3OUFEU3Y2NnBSalErMFUvMnQv?=
 =?utf-8?B?YXYxdXpyQXJQWHJ6dVN6VE1QcEMwYVVZUnhrNGhNdDRPdGFOZVZjTXVLQVM3?=
 =?utf-8?B?eDRQcEIyOEpOam4vQlQxRzFqN255cGZBcE1oR2VrVHBLa0k0MmJ5RlZqT05v?=
 =?utf-8?B?WldtSjk1QXV3TGVlYUc3dVpiRDl5a3VkOWJsMnV1QXdTZFIvMUtvMnZtaTg4?=
 =?utf-8?B?QkFJSUVwdE9QNmNuWUloaWpySm5vL09DK0xyb053VnNaM0lwcG5HdFlBWTJD?=
 =?utf-8?B?K29EMitFZFdhNlZuUlNtOCtXRkV5b0Jyb0lEQjJjTjBmRWd6by9NMnN3UDFy?=
 =?utf-8?B?UXNQZmhVZlVPRUdHRTJXYlBUZ3NpUnhDNHZ1NEhrelFITlBraFp5Mi8wcDJB?=
 =?utf-8?B?Ym9aVEdjbWo2cGlaaEFQTWw2Y2ZCYmg5aHlnVnpHdE9wY3dzU2JrNTdzYjlk?=
 =?utf-8?B?ZDhxOGRlZStNRHdlSVRZWE1aNFpTM3ZaTFltVjNiRStDem1teFZTL0h3a2ph?=
 =?utf-8?B?Z3RaWEhpSkZlcHJLcW9jZm96WVBYS2VERXJGZWYxb05rdUlUWmNlU1M2OVJZ?=
 =?utf-8?B?MmJkdi9RL2lXaGhvTTJmK1Z2azZId2hYQkpIWjEzZHc3NEFQdU9OMGxyaURR?=
 =?utf-8?B?cFhRRzNwMTZLZkFYeXB4ZkxQbnhyS1QyR1NBQjRQQ3U5TjA0dEYyQXZxS3ZB?=
 =?utf-8?B?OGFZZElQYjRkRDlVMUhXeDZJU2IyQ2Q4VW9kcWZkNU0wNmlva3BkMmJVeTNj?=
 =?utf-8?B?M0pTbzFVZHpCdEhXM3M5WHBZMWh0cDI1ZHF2UzNtQUdpemdpRWZDWkFwSGVE?=
 =?utf-8?B?cFBIQ253QlRqYXAydVNNOHNnZXp3enp0TDhJS25qSFB1M2F5bzBUbU1CelBU?=
 =?utf-8?B?TW90YmpiOFl1cDV5QzZpMXUwMW5ha2dETEw1aFRYZmdOY2lSbmZIVlQrZW1l?=
 =?utf-8?B?cTB3L0lxclhCMXJocCsxL0t3MEd4cHJOc21LUmQwNHUybzliWTFPQ0R3SkYy?=
 =?utf-8?B?ajZhbTd0RlVWZk95eDQwZnRVaCtUU3pGWWdRMUxSZGlBSWw4MDNBKzREUWRC?=
 =?utf-8?B?UHpuNm4raDhuYkZON3l0Y1BaVjRpRGVmemE2MTJmd29BcHU5S0c1UXF2ZU14?=
 =?utf-8?B?SEIyY1doQjZJSW80SjFybVNjeU9yY2JEano5K3h4bEh2ZmRDdDQyTVNHZlBJ?=
 =?utf-8?B?QzQrbzV5M0M4di95Y1o3SWs1SkM1L3lmTHVuRVVBUkJuOFpuUHUvR3JWZjRt?=
 =?utf-8?B?ejFOV0MrOWNTMVFlMXNLV0NNK1V0UEVZMk9raHVpRHF3TGFBSUlsSXlaS2Vy?=
 =?utf-8?B?YU9udnZUK3FjbldQRE1uVkxsdlFIUGRHK0paK2FiOTlhVTBuNkVyOVJHdWg1?=
 =?utf-8?B?bk9uRW53bm1ZYjBJUmNTOGJRdnFEVW11dmFuSlhuWjJQVWI2Z01PTStGVU5G?=
 =?utf-8?B?NXdwWlpWVXBPQTdCZ3A5VlZUQmhLN0o0YitESUtnakVtQk8xT3JYUDVSc0pH?=
 =?utf-8?B?eHZHRFQ1WHpoNXFXQ21iZmQwbHBLTFY1UE5ad2VXUjFadkg3dUM3ZFJqMTl1?=
 =?utf-8?B?dmVETHlabnJWY0Y1Zkd2b1g0bXJEM0xLRGJBTEw5SEFNcDR6Q2Z5OUN1NDIx?=
 =?utf-8?B?K2g5NkVpL3NkTWFXZ0FBaU9BbC9MQ3BxU2xVSGdyY2NRcFFZL2QxNDlXRTZr?=
 =?utf-8?Q?wolWsRVMoNSl+dxH17ue7LAL2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a7ddff-ebe0-49b8-4f99-08da5f565a31
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 13:49:31.3384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oslyBzeD9qKE1JPv69xMh8bUjmkahfNuj9OVHOwAE6R3KDH97KUHf5CeSJfVLXOHJxUkrhif7bzU2ULrNwbUBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4128
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
Cc: zhengkui_guo@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-07-06 05:13, Guo Zhengkui wrote:
> Remove a repeated "#include <drm/drm_print.h>"
> 
> Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/os_types.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
> index 795dd486b6d6..6b88ae14f1f9 100644
> --- a/drivers/gpu/drm/amd/display/dc/os_types.h
> +++ b/drivers/gpu/drm/amd/display/dc/os_types.h
> @@ -39,8 +39,6 @@
>  #include <drm/display/drm_dp_helper.h>
>  #include <drm/drm_print.h>
>  
> -#include <drm/drm_print.h>
> -
>  #include "cgs_common.h"
>  
>  #if defined(__BIG_ENDIAN) && !defined(BIGENDIAN_CPU)

