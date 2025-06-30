Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12703AED9BD
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 12:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335AC10E0FD;
	Mon, 30 Jun 2025 10:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="on0RO8Iy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2081.outbound.protection.outlook.com [40.107.102.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C2510E0FD
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 10:24:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygNBHqYDvWiAKTvCysTB2/WYhZK5V/j+vsjGjVCeHfvxCq5uYStFmPsfCLW1SAH4DCc4UrFTGw9MnNOJoZ2Wgn6/4ZZJ3YJ8VHTiHRX3xhyvINhEUvAS9X3fPChzok9Btv8c9TBxPhnqBzHTkE2MLHLHFX6OqG10RgCmMDrMYy5P+u5vk7oDnGmp01+CO/ySgaDEJJRDCFpu20d4yB0C9sxv4uTPvxho8oVhlW9IsadNHOHy8qrBWUXhfRn+vvkMtj5C6HcIzgqrUY0PR/qsLwcz3PtWnewv38l4kaV9UbbJp0VAu6kP/E96Vo+G36sLfIMvEERkbdVUpWXZJsBCWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvnu35kPfPNYKsM81JBxT9eTh0E/ii0v4Bcz6ETNcqI=;
 b=lZFO+hhC/TaFUihwMolPwzhrv7cjTZ+uYeOEeMmzwU3mdQMqiEH3AjY1eBUa+N+KLDIVeFNsevxbpXORWaxKwaw8U/84HVImMreYVs2TZ61LPz0JIwqRqQ68FmsWcNwQld6dbjiBgNKMBu9FPfJ7Q0F+QJ2qdmVPQa6G+tq4D8ITS2wAhMtSNJIB9D6SqQkk1qlqTgvm5QlaG7A6aN+8Sj60ujvUdZXmYtdRCnKRjn7orycjj0sPaSpxysU1N+UFr2D00u6hjwQkEI6FuETX52ZYd0NG7iV2E+ejc75jOvZIMXw37qWIs1IF4Ot6DYsSEllXIcUGHLpOJizPh8vKNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvnu35kPfPNYKsM81JBxT9eTh0E/ii0v4Bcz6ETNcqI=;
 b=on0RO8IyRZN63+nAJVEtS9kiYQ8lIRAOEM8VA1LTuriQsl8K7onofcSChJgqED50l6278333j5stGuYQNG3RP3t2/j741HleykAGGNawMzasPF04Nz8s6e2faapD5qMxpWof0QJMonfIVu7BBYowiaLZJl7BxyzE7HQOyUwPLUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB8321.namprd12.prod.outlook.com (2603:10b6:8:ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Mon, 30 Jun
 2025 10:24:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 10:24:05 +0000
Message-ID: <20a90668-3ddf-4153-9953-a2df9179a1b1@amd.com>
Date: Mon, 30 Jun 2025 12:24:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] ttm: add objcg pointer to bo and tt
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>
Cc: Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>,
 Dave Airlie <airlied@redhat.com>
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-13-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250630045005.1337339-13-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR19CA0026.namprd19.prod.outlook.com
 (2603:10b6:208:178::39) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: 177cb025-debf-412c-0d82-08ddb7c03da4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlFVbmRWZ2lkMWJ4OURtOG5mZldWVllpeWhpaExieGFoQkwvRUluQ0hsR0pO?=
 =?utf-8?B?Qm9oRDUva1h0OUNjVTlyU043ODRwS3Ayamlvd0ovaU9MVm5DZ0MwMEpPUDNE?=
 =?utf-8?B?SVpLc2JHTi9NdHA2eUN6djBybkQrRlNxUVQ0b3M2a0drOTBISVpIMEdrK1d0?=
 =?utf-8?B?TkIwQ1ozSlFWaEhZNlBxRjRtM2pwSE9MS0tvUGN0MEFmR09iNHFhWXkwcVhK?=
 =?utf-8?B?dkhBazB1QmYvdXUrWXdDUzg3ZnRTTjZEdTJDQVN3WXN2ZE5xNnhxZXZHN2Q2?=
 =?utf-8?B?RlhPRlpqZ2dZOVZXZFdiRWNpazROOGJGcDQwd2dKdi8raERUUVVzLzV6OFht?=
 =?utf-8?B?VTQ3bzhCY1lDc1pCNXZ2L2MxSGpZeSt1NU1tWmExVjVoM1Ria3c4Z0M4RmNV?=
 =?utf-8?B?SUxncXJvb2pocDZWNWhNYUxMb3lPMTZySXIxeTZSODk0aHlMcnYvMEk5L01W?=
 =?utf-8?B?Wk1PY0hsTU9MbkphWDBQajU1YTA4WVJLVWJ4bytIWUFxaUd3Qktrc21oZmhh?=
 =?utf-8?B?ZHJCRFhFY3VjeWFoMW10V1Z1by9ybVc5RDRwTEppMlVXRnN4MGFaYXFHeFhF?=
 =?utf-8?B?alJ2eXBQTHNjSFFmOEdtK1gwU3l2cUhZK2JpR2ErLzJESE9qN0dqZWQrcmYr?=
 =?utf-8?B?VlhaVGlUQlJoWFB2aWFKZERMdk8wR3lJcms3RTlzNXpPdi9OQWhLM0Zmdmdx?=
 =?utf-8?B?Tkl3SmNoR0VQUGY1RGZBUUZLcnp3ekdMUlJTWHFGQ1pmNGg1dXI4b1BmRDZZ?=
 =?utf-8?B?SSttUGhicjROUSs5ckQyQU1QZlZWVW93MWo3OHhnd21zM29iMUVHM0ZJZlZQ?=
 =?utf-8?B?VTUrNmdNK0x4WTZ0VG9Pd1lnZ2t6Y1lUWDhqSlhtME44TzJ4WEdjUWlQWXhD?=
 =?utf-8?B?SHVQbnRtU1lNcnFZNFVNUjhMajZMdG1lZEJEN04ySCtsaUhlNnR1RSt3akpQ?=
 =?utf-8?B?ejdEN0Y5SVZtMTZ6N2p5OGZ2Qk1NamRCQlp3UUtkNTBwR2dzRi95dGZ6NGtp?=
 =?utf-8?B?c0FCUE15bVY5eDAyZ0N2UW1NZjl2OVJWRGx1STVVV29MeHZBTjdiL25hd001?=
 =?utf-8?B?WUpWb2VNVUVLTVVFcW1kR3owVEc4aWFpdmNNK0prZnloOXdBTmZCRHNjNmxx?=
 =?utf-8?B?OTdqWTFSR01VeDFVdmQ3S1pHNUNtQU55WnBSU0J6NEw4NDFmeHdBN1JHTXJT?=
 =?utf-8?B?R1U3bVVMWHVIRElSVkk3MW80WW5jSUtOcHVQc1ZkTm9ucW44cjM5Wm15Mith?=
 =?utf-8?B?S01SUXo2Vm9qVjYzQkI5Nkdrc1hoRUZWT0RpK3Z4RFRiM2t3YitkWkVkNG5m?=
 =?utf-8?B?WjF3alVlTTVaUERycmU4ZmM2YktXSWJaamVjV1A2TXdtMG9wVk54RngyQTht?=
 =?utf-8?B?TEFsY0hoVUFJc2xUT1F3SmtTaDJJVWpDbHBLamNFL1VFeTQ4MzFnbGNNNHFi?=
 =?utf-8?B?V2IrWHRWVDZUSkdxbVBLSjlwd1lTRmxZZ2x5eE1ab3h4b3JWbEdsSjRjRVNm?=
 =?utf-8?B?UnlkQ3FXc2pRVjBnQXNpcVlDZ3BoaGJhcSs3MXZ2cEMvT2JhNy9KTHJUbFFX?=
 =?utf-8?B?NnlUQmxtNnA5WjFjcE5BTFl5NmJ6UU1ndUx4c3ZaWFEwTngrNDZXWmQ4bGlK?=
 =?utf-8?B?VmI1Z0FqOWdZRUhHbm1VZjdXYjhEb2FOcnRLeG9OR1VxTERVcStQaFJjcVdB?=
 =?utf-8?B?MThEMVBIT2s2VUdmSzNtamh6UmZBbjc3LzhYNjI0VGpIMlVHMm9zTmtKRlV5?=
 =?utf-8?B?c3lNdXl2UUtNWUhQZHlic2lPcklvNStOZW8wUVVXSGlwRmVSUnptUlJyQzBB?=
 =?utf-8?B?WmJQRnhoWURMNlUvL01xbU5PbHpIVVYwZ29uR3VrSDFjUC8wc1k5YTRQb0JD?=
 =?utf-8?B?RjhzTlM0b2RISVN3N3dhU1FDTUNXWDUvZERRZ2F4cWpBaWpQNTh5cDk3NmhY?=
 =?utf-8?Q?3N4yQ+QqPEw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFIvVHlzYnZpYXFTNDJLN0N6Qk9KZFF1SE9PWUtzZlNlY2hGcktjZzJkNXpz?=
 =?utf-8?B?YVQ1YThFTTNaYUk0NGUzcEhSajVmNGQxbVdjUGdlTmZKZTlHUlVtK3BScUFB?=
 =?utf-8?B?N0xJM1ZaR25GcmJrYlhJRlBjek40UDFyVkt2WHBOS0ZFQThCZ1ZLeGExN1lS?=
 =?utf-8?B?dEJBNTc2V3Z3Ymo1a0FNQ2taWTNVQVJOTThrb2tJYWNETXhEWXNFNjU4dFhV?=
 =?utf-8?B?UVNOVDNnN0Yxc3FBV1FBTnR4UE1IOWRtb0Y3Qy9xcU9wYTE2OHU0MUZCR0N6?=
 =?utf-8?B?WlhmakJNL1NHcUpKdEhQZkszYzJsOU5YQXNUTXBpQUZqUUVkb2J2cEpIWXF2?=
 =?utf-8?B?UkNqU0J3Y0RjTWFmbS9zS0Nremp1elFBUWI0RU9OaE9jYkxHNXZGWXc3dHQ0?=
 =?utf-8?B?eVR3NEhDWkVJT1lsRXplTlNIdXZTcy8xMkNxNVRsNlNobEtMNHE1cXNxdWJs?=
 =?utf-8?B?eU5GR2dmMC9JUVhIendnL0tLbm1CTGRRWUxTbHNPaHVtMFVCMWNhOExWTjd1?=
 =?utf-8?B?OUxOTStoYTg5eEt2YjFyTGlTRXFVTVgvMkVWYk80c2RUVUxwbjRzQnJrWUhl?=
 =?utf-8?B?VFJ1OTlhTFJ5aGV5SEVEL2RJeHpMZkhPL2NLNFVrcGg3NHVkRHRwenovU0ty?=
 =?utf-8?B?em9ta0VPU1pxTG4zeEk5dWJIQythVkxHYmRQK1Q1STdhWHFCSlJlRzRBZHZG?=
 =?utf-8?B?YmR1b0t1eWRwWktZc1d2TnZrMEhMbVN1L091L3ZIRm1UMzU2eWtHckZrS1pO?=
 =?utf-8?B?RFp4SFdlVXhwSTNmNnVSUy9tbzFZcU9ZUmNpSWowbWdQWk0zODJaRFd5NXRG?=
 =?utf-8?B?TlBhS3FHWWVyOUlKbUJueng1amwwZWpOa2dZVkVvcStFNk5FbFJvcU5BU0hN?=
 =?utf-8?B?UExQMndZYk9ERGJCNGcraWphK01NcGR5eHpMM1NFdzlUaUZxSnlhL3FaRU5E?=
 =?utf-8?B?Si9xL05EUmNVa0poTlJKRFpsc3p5VW5WQnQ5bUljaXd3N08vd0NpYWZIUkp4?=
 =?utf-8?B?OXNnTUNkbGRBMWZKZGFxOVdNMmJKN2dheEx5WHBrTGxxNWZuRitGU1p3YkIx?=
 =?utf-8?B?dUV3UHNTQzdyaEN1WFRIblJFYmUxaW1JaXZjSHN3OTBxd3NOMlkzZVo1d0Nm?=
 =?utf-8?B?SHFCVE1OMXE1OCtCTGVyYlR4am5yR0ZDb2JDeHgvendhTlFYeEFaa21zNERC?=
 =?utf-8?B?WU5tUGxkSG0wZFBOS0xLOC9yQ2g4ak0xKzNZckZQcnZTc0x5QmVycCsrV0tj?=
 =?utf-8?B?WU9LbmtjV1lxNlp6S2ZmWjNmZWlLZUs3SW5YbEw5SHFubElSOG5pbjk2bVpD?=
 =?utf-8?B?UkF3dTQ3cy9qMjNBbzljK3Z1RUZlZWhjcjduY0VjUmkwbFRheGZ6OVpreHRD?=
 =?utf-8?B?SE11c0pNdVNnWFNocHFPR2orc3RBc1cwdWtNaEtrOWd5d1psMUV2VHJzV09C?=
 =?utf-8?B?QXVvelh2SXdOeDhaVHpwWEZsT2NXVDVYWGJoYjZ3ekw0WTk1M2lZMm04VEVm?=
 =?utf-8?B?bGxHbEMwd2t6Q3lpSHVSc2J1TTU2NVRsdzErRTREeUJna1Q0SzRiVEtVbTFo?=
 =?utf-8?B?eEZwakhRR1I2aEt1OFJMMlduR3VTNHpmY3pielNpQVUySmcvakZ5RzdKRWFy?=
 =?utf-8?B?REdiTGRNbnZaUmVnRC9xTmlXTU5oRVh5R09pMC9BVTYzd3p0Q2ZlWjhXamVE?=
 =?utf-8?B?NGc2bnpVMldpeC9sdEtXMTkrejZjM00vMVRlZXA2cFBFTVVhNi9DRTVaTlZu?=
 =?utf-8?B?ZlNMa2VXeUE0QmYxYUFrL3pWbnBWQy9WcGlGR1RuaHlwd3dTQ0NkczFXR2xO?=
 =?utf-8?B?UUVFeXNxczJWUm02eituZFlMM3l5a2lidDhOSGJjQlJPdzVTNFVUNnQ2eGR2?=
 =?utf-8?B?d0w3YUQxZmRGNUk2YXBBRU9wYTM3UTBvV211aDM1aWRoajcwU3hHQUZjdmJo?=
 =?utf-8?B?clRJa2kvakZNOW1XS0c1Sm5jVW4xWnJaTGxBeHA1TGJvamVSSHZteWtrY0Y4?=
 =?utf-8?B?bk9FWkVhMklyeUlMbjVYVktOMXI0WmE1UERXOVhtdS8ydzNlZDhuK1VYSHd4?=
 =?utf-8?B?Um1XR3FtbFhSMUV6RTFoRzRuOC94eUI3SG1oUFRrQllCek9hYVlXSCtnTG4r?=
 =?utf-8?Q?1jJmwuIhK33ihGAIKwHcpy/tz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 177cb025-debf-412c-0d82-08ddb7c03da4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 10:24:05.4301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G40b5qHLAQCuoGAvbANisIMTzd+b/eglwq9wbI+PACeGrulJzj4g2EGMq3FYRMPf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8321
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

On 30.06.25 06:49, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This just adds the obj cgroup pointer to the bo and tt structs,
> and sets it between them.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/ttm/ttm_tt.c | 1 +
>  include/drm/ttm/ttm_bo.h     | 6 ++++++
>  include/drm/ttm/ttm_tt.h     | 2 ++
>  3 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 8f38de3b2f1c..0c54d5e2bfdd 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -162,6 +162,7 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>  	ttm->caching = caching;
>  	ttm->restore = NULL;
>  	ttm->backup = NULL;
> +	ttm->objcg = bo->objcg;
>  }
>  
>  int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 099dc2604baa..f26ec0a0273f 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -135,6 +135,12 @@ struct ttm_buffer_object {
>  	 * reservation lock.
>  	 */
>  	struct sg_table *sg;
> +
> +	/**
> +	 * @objcg: object cgroup to charge this to if it ends up using system memory.
> +	 * NULL means don't charge.
> +	 */
> +	struct obj_cgroup *objcg;
>  };
>  
>  #define TTM_BO_MAP_IOMEM_MASK 0x80
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 15d4019685f6..c13fea4c2915 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -126,6 +126,8 @@ struct ttm_tt {
>  	enum ttm_caching caching;
>  	/** @restore: Partial restoration from backup state. TTM private */
>  	struct ttm_pool_tt_restore *restore;
> +	/** @objcg: Object cgroup for this TT allocation */
> +	struct obj_cgroup *objcg;
>  };

We should probably keep that out of the pool and account the memory to the BO instead.

Regards,
Christian.

>  
>  /**

